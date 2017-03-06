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
var ehStep = '${ehStep }';
var ehPro = '${pro }';
</script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/nouislider.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/style.css">
        <link href="<%=request.getContextPath()%>/resources/css/easy-health/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />
        <script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/nouislider.8.4.0.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery-ui.effect.core.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.history.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/uifn.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator-v0.5.0.min.js"></script>
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
            <div id="loadingDiv" class="waitingDiv">
                <img src="<%=request.getContextPath()%>/resources/images/loading.gif">
            </div>
            <div class="step1">
                <div class="container">
                    <dir class="row">
                        <div class="col-sm-12">
                            <div class="text-center title">
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_img_02_title02_${language}.png" alt="<fmt:message key="label.take.it.easy" bundle="${msg}" />" class="img-responsive eh-img-title inline-block">
                                <p><fmt:message key="label.plan.desc" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </dir>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1">
                            <div class="row row-eq-height">
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center"><fmt:message key="label.gender" bundle="${msg}" /></h5>
                                        <div class="selection-inner" id="gender-opt">
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-6 item" id="gender0" data-gender="0">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_male_off.png" class="img-responsive">
                                                    <p class="text-center"><fmt:message key="label.male2" bundle="${msg}" /></p>
                                                </div>
                                                <div class="col-sm-6 col-xs-6 item" id="gender1" data-gender="1">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_female_off.png" class="img-responsive">
                                                    <p class="text-center"><fmt:message key="label.female2" bundle="${msg}" /></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center"><fmt:message key="label.smoking.habit" bundle="${msg}" /></h5>
                                        <div class="selection-inner" id="smoker-opt">
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-6 item" id="smoker1" data-smoker="1">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_smoker_off.png" class="img-responsive">
                                                    <p class="text-center"><fmt:message key="label.smoker" bundle="${msg}" /></p>
                                                </div>
                                                <div class="col-sm-6 col-xs-6 item" id="smoker0" data-smoker="0">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_select_nonsmoker_off.png" class="img-responsive">
                                                    <p class="text-center"><fmt:message key="label.non.smoker" bundle="${msg}" /></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                                <div class="col-sm-4 col-xs-12 selectionBox">
                                    <div class="selection-grid">
                                        <h5 class="text-center"><fmt:message key="label.dob" bundle="${msg}" /></h5>
                                        <!-- <input id="dob" name="dob" placeholder="Please Select ..." readonly> -->	
                                        <!--<div class="selectDiv centreDiv gray-text-bg" id="plan-dob">		
                                            <!-- <input  name="plan-dob" id="plan-dob-datepicker" readonly value="${ehPlanDetail.dob!=null ? ehPlanDetail.dob:'' }" placeholder="<fmt:message key="label.dob" bundle="${msg}" />" class="form-control" />
                                            <input id="dob" placeholder="Please Select..." />
                                            <img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
                                        </div> -->
                                        <input id="dob" name="plan-dob" placeholder='<fmt:message key="label.dob.select" bundle="${msg}" />' readonly value="${ehPlanDetail.dob!=null ? ehPlanDetail.dob:'' }">
                                    </div>
                                </div>
                                <div class="clearfix visible-xs"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm12">
                            <div class="text-center">
                                <a href="javascript:void(0);" class="eh-btn-plan-overview savie-common-btn disabled-gray-btn" id="eh-btn-plan-overview"><fmt:message key="button.plan.overview" bundle="${msg}" /></a>
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
                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p1_img_02_title02_${language}.png" class="img-responsive inline-block" alt='<fmt:message key="label.take.it.easy" bundle="${msg}" />'>
                            </div>
                        </div>
                    </dir>
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <div class="tbl-compare">
                                <br>
                                <a href="javascript:void(0);" class="hidden-sm hidden-md hidden-lg btn-back-step1 btn-back2-step1-mb"><span><fmt:message key="easyhealth.back.to.personal.info.m" bundle="${msg}" /></span><img src="<%=request.getContextPath()%>/resources/images/easy-health/btn_edit_mb_placeholder.png" alt=""></a>
                                <a href="javascript:void(0);" class="visible-sm visible-md visible-lg btn-back-step1 btn-back2-step1-dt"><fmt:message key="button.back.to.personal.info" bundle="${msg}" /></a>
                                <div class="inner">
                                    <table>
                                        <thead>
                                            <tr class="plan-name">
                                                <th></th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_A.png">
                                                        <br><span class="txt-type-a"><fmt:message key="easyhealth.plan.intro.label.basic" bundle="${msg}" /></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_B.png">
                                                        <br><span class="txt-type-b"><fmt:message key="easyhealth.plan.intro.label.plus" bundle="${msg}" /></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_C.png">
                                                        <br><span class="txt-type-c"><fmt:message key="easyhealth.plan.intro.label.advanced" bundle="${msg}" /></span>
                                                    </div>
                                                </th>
                                                <th>
                                                    <div class="text-center">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p2_hospital_D.png">
                                                        <br><span class="txt-type-d"><fmt:message key="easyhealth.plan.intro.label.deluxe" bundle="${msg}" /></span>
                                                    </div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="plan-mca">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_01.png" alt="<fmt:message key="easyhealth.plan.intro.label.monthly.premium" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.monthly.premium" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.monthly.premium" bundle="${msg}" /></span>    
                                                        </div>
                                                        
                                                    </div>
                                                </th>
                                                <th class="head t1" data-grp="t1"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-a"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></th>
                                                <th class="head t2" data-grp="t2"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-b"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></th>
                                                <th class="head t3" data-grp="t3"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-c"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></th>
                                                <th class="head t4" data-grp="t4"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-d"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></th>
                                            </tr>
                                            <tr class="plan-dhc">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_02.png" alt="<fmt:message key="easyhealth.plan.intro.label.hospital.cash" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.hospital.cash" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.hospital.cash" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1" data-grp="t1"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-a"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t2" data-grp="t2"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-b"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t3" data-grp="t3"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-c"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t4" data-grp="t4"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-d"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                            </tr>
                                            <tr class="plan-icu">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_03.png" alt="<fmt:message key="easyhealth.plan.intro.label.icu.benefit" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.icu.benefit" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.icu.benefit" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1" data-grp="t1"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-a"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t2" data-grp="t2"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-b"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t3" data-grp="t3"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-c"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t4" data-grp="t4"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-d"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                            </tr>
                                            <tr class="plan-id">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_04.png" alt="<fmt:message key="easyhealth.plan.intro.label.infect.disease.benefit" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.infect.disease.benefit" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.infect.disease.benefit" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1" data-grp="t1"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-a"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t2" data-grp="t2"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-b"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t3" data-grp="t3"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-c"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t4" data-grp="t4"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-d"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                            </tr>
                                            <tr class="plan-rop">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_07.png" alt="<fmt:message key="easyhealth.plan.intro.label.refund" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.refund" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.refund" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1" data-grp="t1"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-a"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t2" data-grp="t2"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-b"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t3" data-grp="t3"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-c"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                                <td class="t4" data-grp="t4"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-d"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></td>
                                            </tr>
                                            <tr class="plan-db">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_05.png" alt="<fmt:message key="easyhealth.plan.intro.label.death.benefit" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.death.benefit" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.death.benefit" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a text" data-grp="t1"><fmt:message key="easyhealth.plan.compen.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t2 txt-price-b text" data-grp="t2"><fmt:message key="easyhealth.plan.compen.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t3 txt-price-c text" data-grp="t3"><fmt:message key="easyhealth.plan.compen.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t4 txt-price-d text" data-grp="t4"><fmt:message key="easyhealth.plan.compen.death.benefit.basic" bundle="${msg}" /></td>
                                            </tr>
                                            <tr class="plan-adb">
                                                <th>
                                                    <div class="row no-margin">
                                                        <div class="vertical-align">
                                                            <div class="col-xs-3 icon-wrap">
                                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p5_icon_06.png" alt="<fmt:message key="easyhealth.plan.intro.label.acci.death.benefit" bundle="${msg}" />" class="img-responsive icon" data-toggle="tooltip" data-placement="right" title="<fmt:message key="easyhealth.plan.intro.label.acci.death.benefit" bundle="${msg}" />">
                                                            </div>
                                                            <span class="desc col-xs-9"><fmt:message key="easyhealth.plan.intro.label.acci.death.benefit" bundle="${msg}" /></span>
                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="t1 txt-price-a text" data-grp="t1"><fmt:message key="easyhealth.plan.compen.acci.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t2 txt-price-b text" data-grp="t2"><fmt:message key="easyhealth.plan.compen.acci.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t3 txt-price-c text" data-grp="t3"><fmt:message key="easyhealth.plan.compen.acci.death.benefit.basic" bundle="${msg}" /></td>
                                                <td class="t4 txt-price-d text" data-grp="t4"><fmt:message key="easyhealth.plan.compen.acci.death.benefit.basic" bundle="${msg}" /></td>
                                            </tr>
                                            <tr>
                                                <th></th>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-a" id="eh-plan-a" data-grp="t1"><fmt:message key="easyhealth.plan.button.basic" bundle="${msg}" /></a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-b" id="eh-plan-b" data-grp="t2"><fmt:message key="easyhealth.plan.button.basic" bundle="${msg}" /></a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-c" id="eh-plan-c" data-grp="t3"><fmt:message key="easyhealth.plan.button.basic" bundle="${msg}" /></a>
                                                </td>
                                                <td>
                                                    <a href="javascript:void(0);" class="eh-btn-tbl-detail savie-common-btn" data-tab="eh-plan-d" id="eh-plan-d" data-grp="t4"><fmt:message key="easyhealth.plan.button.basic" bundle="${msg}" /></a>
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
                            <p class="remarks"><small><fmt:message key="easyhealth.plan.remarks.text" bundle="${msg}" /></small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="step-option">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3><fmt:message key="easyhealth.guidance.text.1" bundle="${msg}" /></h3>
                            <p><fmt:message key="easyhealth.guidance.text.2" bundle="${msg}" /></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="box-option">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> <fmt:message key="easyhealth.guidance.q1" bundle="${msg}" /></h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_01_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q1.ans1" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_02_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q1.ans2" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_03_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q1.ans3" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_04_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q1.ans4" bundle="${msg}" />
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
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> <fmt:message key="easyhealth.guidance.q2" bundle="${msg}" /></h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_05_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q2.ans1" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_06_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q2.ans2" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-4">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_07_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q2.ans3" bundle="${msg}" />
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
                                        <h4><img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_question.png" alt="?"> <fmt:message key="easyhealth.guidance.q3" bundle="${msg}" /></h4>
                                    </div>
                                </div>
                                <div class="row toggle-inner">
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_08_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q3.ans1" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_11_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q3.ans2" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_10_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q3.ans3" bundle="${msg}" />
                                        </a>
                                    </div>
                                    <div class="col-sm-3">
                                        <a href="javascript:void(0);" class="item">
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p4_icon_09_off.png" class="img-responsive"><fmt:message key="easyhealth.guidance.q3.ans4" bundle="${msg}" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center">
                        <div class="inline-block">
                            <div class="box-btn-select">
                                <a href="javascript:void(0);" class="btn-option-select savie-common-btn disabled-gray-btn btn-need-plan">
                                    <fmt:message key="easyhealth.guidance.button.next" bundle="${msg}" />
                                </a>
                            </div>
                        </div>
                        <br class="visible-xs"><br class="visible-xs">
                        <div class="inline-block">
                            <div class="box-btn-cancel">
                                <a href="javascript:void(0);" class="btn-option-select savie-common-btn disabled-gray-btn btn-option-cancel">
                                    <fmt:message key="easyhealth.guidance.button.back" bundle="${msg}" />
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
                                    <span><fmt:message key="button.plan.overview" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-a">
                                    <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.basic" bundle="${msg}" /></span>
                                    <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-b">
                                    <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.plus" bundle="${msg}" /></span>
                                    <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-c">
                                    <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.advanced" bundle="${msg}" /></span>
                                    <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                                </a>
                            </div>
                            <div class="plan-selector-grid">
                                <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-d">
                                    <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.deluxe" bundle="${msg}" /></span>
                                    <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
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
                                <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.basic" bundle="${msg}" /></span>
                                <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-b">
                                <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.plus" bundle="${msg}" /></span>
                                <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-c">
                                <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.advanced" bundle="${msg}" /></span>
                                <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-selector" data-tab="eh-plan-d">
                                <span class="grid-head"><fmt:message key="easyhealth.plan.intro.label.deluxe" bundle="${msg}" /></span>
                                <span class="grid-desc"><fmt:message key="easyhealth.plandetails.month.prefix" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> <fmt:message key="easyhealth.plan.monthly.slash" bundle="${msg}" /> <fmt:message key="easyhealth.plandetails.month" bundle="${msg}" /></span>
                            </a>
                        </div>
                        <div>
                            <a href="javascript:void(0);" class="text-center btn-plan-back btn-plan-overview">
                                <span class="grid-head"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <fmt:message key="button.plan.overview" bundle="${msg}" /></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="sticky-help-wrapper">
                    <a href="javascript:void(0);">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/btn_guidance_${language}.png" class="img-responsive pic" alt="<fmt:message key="easyhealth.plandetails.guidance" bundle="${msg}" />">
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
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_${language}.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"><fmt:message key="easyhealth.plan.intro.label.basic" bundle="${msg}" /></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay"><fmt:message key="easyhealth.plandetails.premium" bundle="${msg}" /></span>
                                                        <br><span class="txt-youpay-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> <fmt:message key="easyhealth.plandetails-pm.premium" bundle="${msg}" /></span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center"><fmt:message key="easyhealth.plandetails-1.premium" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-yca"><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span><fmt:message key="easyhealth.plandetails-2.premium" bundle="${msg}" /></span>
                                                </div>
                                                
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                <fmt:message key="easyhealth.plandetails.receive" bundle="${msg}" />
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.infect.disease" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-id"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.icu.benefit" bundle="${msg}"/>'>
                                                <span class="txt-price txt-price-icu"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.hospital.benefit" bundle="${msg}"/>'>
                                                <span class="txt-price txt-price-hc"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.refund" bundle="${msg}"/>'>
                                                <span class="txt-price txt-price-rop"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.death.benefit" bundle="${msg}"/>'>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.acci.death.benefit" bundle="${msg}"/>'>
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
                                                    <h4><fmt:message key="easyhealth.plandetails.benefits.heading" bundle="${msg}" /></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row no-margin">
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item first-item">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.uwillget" bundle="${msg}" />'>
                                                    </div>
                                                    <h5><fmt:message key="easyhealth.plandetails.hospital.benefits.heading" bundle="${msg}" /></h5>
                                                    <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-dhc"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                    <p><fmt:message key="easyhealth.plandetails.hospital.benefits.text" bundle="${msg}" /></p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item indicate">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.additional" bundle="${msg}" />'>
                                                    </div>
                                                    <h5><fmt:message key="easyhealth.plandetails.icubenefits.heading" bundle="${msg}" /></h5>
                                                    <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-icu"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />) </span>
                                                    <p><fmt:message key="easyhealth.plandetails.icubenefits.text" bundle="${msg}" /></p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="text-center benefit-item indicate">
                                                    <div class="img-icon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.additional" bundle="${msg}" />'>
                                                    </div>
                                                    <h5><fmt:message key="easyhealth.plandetails.infect.disease.heading" bundle="${msg}" /></h5>
                                                    <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-id"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                    <p><fmt:message key="easyhealth.plandetails.infect.disease.text" bundle="${msg}" /></p>
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-xs-12">
                                                <div class="total-benefit">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                    <p><span class="txt-ttl-upto"><fmt:message key="easyhealth.plandetails.benefits.total" bundle="${msg}" /></span>
                                                        <br><span class="txt-ttl-benefit-price">
                                                            <fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" />
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner">
                        <div class="container-liquid">
                            <div class="row row-no-padding no-margin">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_${language}.jpg" class="img-responsive visible-md visible-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_m_${language}.png" class="img-responsive hidden-md hidden-lg margin-center">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_${language}.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png"><fmt:message key="easyhealth.plandetails.infographic2.text1" bundle="${msg}" /></p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight"><fmt:message key="easyhealth.plandetails.infographic2.text2" bundle="${msg}" /></p>
                                        <p class="txt-refund-desc"><fmt:message key="easyhealth.plandetails.infographic2.text3" bundle="${msg}" /></p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top"><fmt:message key="easyhealth.plandetails.infographic2.year" bundle="${msg}" /> <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear"><fmt:message key="easyhealth.plandetails.infographic2.maturity" bundle="${msg}" /></span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.reund.percentage" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.premium" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.refund.amount" bundle="${msg}" /></div>
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
                                        <p><fmt:message key="easyhealth.plandetails.infographic2.after15.text" bundle="${msg}" /></p>
                                        
                                        <div class="box-paidget-wrap">
                                            <div class="col-xs-4">
                                                <p class="txt-paidget"><fmt:message key="easyhealth.plandetails.infographic2.text4" bundle="${msg}" /> </p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
                                            </div>

                                            <div class="col-xs-4">
                                                <p class="txt-paidget highlight"><fmt:message key="easyhealth.plandetails.infographic2.text5" bundle="${msg}" /></p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15_102"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
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
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_${language}.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"><fmt:message key="easyhealth.plan.intro.label.plus" bundle="${msg}" /></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay"><fmt:message key="easyhealth.plandetails.premium" bundle="${msg}" /></span>
                                                        <br><span class="txt-youpay-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> <fmt:message key="easyhealth.plandetails-pm.premium" bundle="${msg}" /></span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center"><fmt:message key="easyhealth.plandetails-1.premium" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-yca"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /><fmt:message key="easyhealth.plandetails-2.premium" bundle="${msg}" /></span>
                                                </div>
                                                
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                <fmt:message key="easyhealth.plandetails.receive" bundle="${msg}" />
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.infect.disease" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-id"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.icu.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-icu"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.hospital.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-hc"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.refund" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-rop"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.death.benefit" bundle="${msg}" />'>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.acci.death.benefit" bundle="${msg}" />'>
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
                                                <h4><fmt:message key="easyhealth.plandetails.benefits.heading" bundle="${msg}" /></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.uwillget" bundle="${msg}" />'>
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.hospital.benefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-dhc"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.hospital.benefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.additional" bundle="${msg}" />'>
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.icubenefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-icu"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.icubenefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive" alt='<fmt:message key="easyhealth.plandetails.additional" bundle="${msg}" />'>
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.infect.disease.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-id"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.infect.disease.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto"><fmt:message key="easyhealth.plandetails.benefits.total" bundle="${msg}" /></span>
                                                    <br><span class="txt-ttl-benefit-price">
                                                        <fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" />
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner">
                        <div class="container-liquid">
                            <div class="row row-no-padding no-margin">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_${language}.jpg" class="img-responsive visible-md visible-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_m_${language}.png" class="img-responsive hidden-md hidden-lg margin-center">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_${language}.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png"><fmt:message key="easyhealth.plandetails.infographic2.text1" bundle="${msg}" /></p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight"><fmt:message key="easyhealth.plandetails.infographic2.text2" bundle="${msg}" /></p>
                                        <p class="txt-refund-desc"><fmt:message key="easyhealth.plandetails.infographic2.text3" bundle="${msg}" /></p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top"><fmt:message key="easyhealth.plandetails.infographic2.year" bundle="${msg}" /> <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear"><fmt:message key="easyhealth.plandetails.infographic2.maturity" bundle="${msg}" /></span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.reund.percentage" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.premium" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.refund.amount" bundle="${msg}" /></div>
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
                                        <p><fmt:message key="easyhealth.plandetails.infographic2.after15.text" bundle="${msg}" /></p>
                                        <div class="box-paidget-wrap">
                                            <div class="col-xs-4">
                                                <p class="txt-paidget"><fmt:message key="easyhealth.plandetails.infographic2.text4" bundle="${msg}" /> </p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
                                            </div>

                                            <div class="col-xs-4">
                                                <p class="txt-paidget highlight"><fmt:message key="easyhealth.plandetails.infographic2.text5" bundle="${msg}" /></p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15_102"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
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
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_${language}.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"><fmt:message key="easyhealth.plan.intro.label.advanced" bundle="${msg}" /></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay"><fmt:message key="easyhealth.plandetails.premium" bundle="${msg}" /></span>
                                                        <br><span class="txt-youpay-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> <fmt:message key="easyhealth.plandetails-pm.premium" bundle="${msg}" /></span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center"><fmt:message key="easyhealth.plandetails-1.premium" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-yca"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /><fmt:message key="easyhealth.plandetails-2.premium" bundle="${msg}" /></span>
                                                </div>
                                                
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                <fmt:message key="easyhealth.plandetails.receive" bundle="${msg}" />
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.infect.disease" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-id"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.icu.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-icu"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.hospital.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-hc"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.refund" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-rop"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.death.benefit" bundle="${msg}" />'>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.acci.death.benefit" bundle="${msg}" />'>
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
                                                <h4><fmt:message key="easyhealth.plandetails.benefits.heading" bundle="${msg}" /></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.hospital.benefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-dhc"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.hospital.benefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.icubenefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-icu"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.icubenefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.infect.disease.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-id"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.infect.disease.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto"><fmt:message key="easyhealth.plandetails.benefits.total" bundle="${msg}" /></span>
                                                    <br><span class="txt-ttl-benefit-price">
                                                        <fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" />
                                                    </span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner">
                        <div class="container-liquid">
                            <div class="row row-no-padding no-margin">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_${language}.jpg" class="img-responsive visible-md visible-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_m_${language}.png" class="img-responsive hidden-md hidden-lg margin-center">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_${language}.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png"><fmt:message key="easyhealth.plandetails.infographic2.text1" bundle="${msg}" /></p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight"><fmt:message key="easyhealth.plandetails.infographic2.text2" bundle="${msg}" /></p>
                                        <p class="txt-refund-desc"><fmt:message key="easyhealth.plandetails.infographic2.text3" bundle="${msg}" /></p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top"><fmt:message key="easyhealth.plandetails.infographic2.year" bundle="${msg}" /> <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear"><fmt:message key="easyhealth.plandetails.infographic2.maturity" bundle="${msg}" /></span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.reund.percentage" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.premium" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.refund.amount" bundle="${msg}" /></div>
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
                                        <p><fmt:message key="easyhealth.plandetails.infographic2.after15.text" bundle="${msg}" /></p>
                                        <div class="box-paidget-wrap">
                                            <div class="col-xs-4">
                                                <p class="txt-paidget"><fmt:message key="easyhealth.plandetails.infographic2.text4" bundle="${msg}" /> </p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
                                            </div>

                                            <div class="col-xs-4">
                                                <p class="txt-paidget highlight"><fmt:message key="easyhealth.plandetails.infographic2.text5" bundle="${msg}" /></p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15_102"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
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
                                            <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_border_${language}.png" class="img-responsive img-big-border visible-md visible-lg">
                                            <div class="img-big-circle col-xs-12 col-sm-offset-3 col-sm-6 col-md-offset-0">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_main.png" class="img-responsive pic">
                                                <p class="txt-type text-center"><fmt:message key="easyhealth.plan.intro.label.deluxe" bundle="${msg}" /></p>
                                                <div class="desc text-center">
                                                    <div class="moneyIcon">
                                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_moneyIcon.png" class="img-bag">
                                                    </div>
                                                    <div class="txt text-left">
                                                        <span class="txt-youpay"><fmt:message key="easyhealth.plandetails.premium" bundle="${msg}" /></span>
                                                        <br><span class="txt-youpay-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                                        <br><span class="txt-permonth"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_icon_month.png"> <fmt:message key="easyhealth.plandetails-pm.premium" bundle="${msg}" /></span>
                                                    </div>
                                                    <br>
                                                    <br class="hidden-xs hidden-md"><span class="txt-remarks text-center"><fmt:message key="easyhealth.plandetails-1.premium" bundle="${msg}" /><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price-yca"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /><fmt:message key="easyhealth.plandetails-2.premium" bundle="${msg}" /></span>
                                                </div>
                                                
                                            </div>
                                            <div class="col-xs-12 hidden-md hidden-lg text-center ywg">
                                                <fmt:message key="easyhealth.plandetails.receive" bundle="${msg}" />
                                            </div>
                                            <div class="img-id col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_02_id_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.infect.disease" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-id"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-icu col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_03_icu_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.icu.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-icu"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-hc col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_01_hc_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.hospital.benefit" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-hc"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-15 col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_04_15_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.refund" bundle="${msg}" />'>
                                                <span class="txt-price txt-price-rop"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></span>
                                            </div>
                                            <div class="img-db col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_06_db_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.death.benefit" bundle="${msg}" />'>
                                            </div>
                                            <div class="img-adb col-xs-6">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_benefit_05_adb_${language}.png" class="img-responsive pic" alt='<fmt:message key="easyhealth.plandetails.acci.death.benefit" bundle="${msg}" />'>
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
                                                <h4><fmt:message key="easyhealth.plandetails.benefits.heading" bundle="${msg}" /></h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row no-margin">
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item first-item">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_01.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_get_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.hospital.benefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-dhc"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.hospital.benefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_02.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.icubenefits.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-icu"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.icubenefits.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="text-center benefit-item indicate">
                                                <div class="img-icon">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_03.png" class="img-responsive pic">
                                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_additional_${language}.png" class="img-additional img-responsive">
                                                </div>
                                                <h5><fmt:message key="easyhealth.plandetails.infect.disease.heading" bundle="${msg}" /></h5>
                                                <span class="txt-price"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="txt-price txt-price-id"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /> (<fmt:message key="easyhealth.plandetails-pd.premium" bundle="${msg}" />)</span>
                                                <p><fmt:message key="easyhealth.plandetails.infect.disease.text" bundle="${msg}" /></p>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-xs-12">
                                            <div class="total-benefit">
                                                <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s2_benefit_04.png">
                                                <p><span class="txt-ttl-upto"><fmt:message key="easyhealth.plandetails.benefits.total" bundle="${msg}" /></span>
                                                    <br><span class="txt-ttl-benefit-price">
                                                        <fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" />
                                                    </span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-banner">
                        <div class="container-liquid">
                            <div class="row row-no-padding no-margin">
                                <div class="col-sm-12">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_${language}.jpg" class="img-responsive visible-md visible-lg">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s3_death_m_${language}.png" class="img-responsive hidden-md hidden-lg margin-center">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="plan-refund">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="">
                                        <img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_table_${language}.png" class="img-responsive pic">
                                    </div>
                                </div>
                                <div class="col-md-6 text-left">
                                    <div class="wrapper-15yr">
                                        <div class="txt-15yr-box">
                                            <p class="txt-15yr"><img src="<%=request.getContextPath()%>/resources/images/easy-health/p3_s4_icon.png"><fmt:message key="easyhealth.plandetails.infographic2.text1" bundle="${msg}" /></p>
                                            
                                        </div>
                                        <p class="txt-percent-refund highlight"><fmt:message key="easyhealth.plandetails.infographic2.text2" bundle="${msg}" /></p>
                                        <p class="txt-refund-desc"><fmt:message key="easyhealth.plandetails.infographic2.text3" bundle="${msg}" /></p>
                                        <div class="box-15yr-policy">
                                            <div class="lbl15yr-policy-top"><fmt:message key="easyhealth.plandetails.infographic2.year" bundle="${msg}" /> <span class="lblYear"></span></div>
                                            <div class="slider-15yr-policy"></div>
                                            
                                            <div class="lbl15yr-policy-bottom"><span class="minYear">1</span> <span class="maxYear"><fmt:message key="easyhealth.plandetails.infographic2.maturity" bundle="${msg}" /></span></div>
                                            <div class="tableView">
                                                <div class="tblv-titles">
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.reund.percentage" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.premium" bundle="${msg}" /></div>
                                                    <!--
                                                    -->
                                                    <div class="tblv-title text-center"><fmt:message key="easyhealth.plandetails.infographic2.refund.amount" bundle="${msg}" /></div>
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
                                        <p><fmt:message key="easyhealth.plandetails.infographic2.after15.text" bundle="${msg}" /></p>
                                        <div class="box-paidget-wrap">
                                            <div class="col-xs-4">
                                                <p class="txt-paidget"><fmt:message key="easyhealth.plandetails.infographic2.text4" bundle="${msg}" /> </p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
                                            </div>

                                            <div class="col-xs-4">
                                                <p class="txt-paidget highlight"><fmt:message key="easyhealth.plandetails.infographic2.text5" bundle="${msg}" /></p>
                                            </div>
                                            <div class="col-xs-8">
                                                <p class="txt-paidget-price txt-price-y15_102"><fmt:message key="easyhealth.plan.monthly.premium.basic" bundle="${msg}" /><span class="value"></span><fmt:message key="easyhealth.plan.monthly.premium.basic.subfix" bundle="${msg}" /></p>
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
                                            <a href="#pd-sf-sale-illustration-sample-pane" class="bold" aria-controls="pd-sf-sale-illustration-sample-pane" role="tab" data-toggle="tab"><fmt:message key="easyhealth.plandetails.risk.heading" bundle="${msg}" /></a>
                                        </li>
                                        <li class="pd-sf-tab pd-sf-tab-right text-center" role="presentation">
                                            <a href="#pd-sf-faq-and-glossary-pane" class="bold" aria-controls="pd-sf-faq-and-glossary-pane" role="tab" data-toggle="tab"><fmt:message key="easyhealth.plandetails.remarks.heading" bundle="${msg}" /></a>
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
                                    <fmt:message key="easyhealth.plandetails.risk.sub.heading" bundle="${msg}" />
                                    <span class="pull-right">
                                       <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png">
                                    </span>
                                 </a>
                              </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse in" role="tabpanel" aria-labelledby="pd-sf-product-related">
                                                        <div class="panel-body">
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.1.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.2.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.19.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.20.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.3.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.4.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.5.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.6.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.7.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.8.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <table class="tbl-esr">
                                                              <tr>
                                                                <th><fmt:message key="easyhealth.plandetails.risk.8_1.content" bundle="${msg}" /></th>
                                                                <th><fmt:message key="easyhealth.plandetails.risk.8_2.content" bundle="${msg}" /></th>
                                                              </tr>
                                                              <tr>
                                                                <td>1</td>
                                                                <td>0%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>2</td>
                                                                <td>0%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>3</td>
                                                                <td>0%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>4</td>
                                                                <td>0%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>5</td>
                                                                <td>0%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>6</td>
                                                                <td>10%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>7</td>
                                                                <td>20%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>8</td>
                                                                <td>30%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>9</td>
                                                                <td>40%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>10</td>
                                                                <td>50%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>11</td>
                                                                <td>60%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>12</td>
                                                                <td>70%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>13</td>
                                                                <td>80%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>14</td>
                                                                <td>90%</td>
                                                              </tr>
                                                              <tr>
                                                                <td>15</td>
                                                                <td>100%</td>
                                                              </tr>
                                                              <tr>
                                                                <td><fmt:message key="easyhealth.plandetails.infographic2.maturity" bundle="${msg}" /></td>
                                                                <td>102%</td>
                                                              </tr>
                                                            </table>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.exclusions.sub.heading" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.exclusions.1.content" bundle="${msg}" /></p>
                                                            <ol>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.2.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.3.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.4.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.5.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.6.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.7.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.8.content" bundle="${msg}" />
                                                                    <ol class="lower-roman">
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.9.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.10.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.11.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.12.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.13.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.14.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.15.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.16.content" bundle="${msg}" /></li>
                                                                        <li><fmt:message key="easyhealth.plandetails.exclusions.17.content" bundle="${msg}" /></li>
                                                                    </ol>
                                                                </li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.18.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.19.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.20.content" bundle="${msg}" /></li>
                                                            </ol>    
                                                            
                                                            <p><fmt:message key="easyhealth.plandetails.exclusions.21.content" bundle="${msg}" /></p>
                                                            <ol>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.22.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.23.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.24.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.25.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.26.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.27.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.28.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.29.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.30.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.31.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.32.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.exclusions.33.content" bundle="${msg}" /></li>
                                                            </ol>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.9.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.10.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.11.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.12.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.risk.13.content" bundle="${msg}" /></b></p>
                                                            <p><fmt:message key="easyhealth.plandetails.risk.14.content" bundle="${msg}" />
                                                                <ol>
                                                                    <li><fmt:message key="easyhealth.plandetails.risk.15.content" bundle="${msg}" /></li>
                                                                    <li><fmt:message key="easyhealth.plandetails.risk.16.content" bundle="${msg}" /></li>
                                                                    <li><fmt:message key="easyhealth.plandetails.risk.17.content" bundle="${msg}" /></li>
                                                                    <li><fmt:message key="easyhealth.plandetails.risk.18.content" bundle="${msg}" /></li>
                                                                </ol>
                                                            </p>
                                                            <br>
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
                                    <fmt:message key="easyhealth.plandetails.remarks.heading" bundle="${msg}" />
                                    <span class="pull-right">
                                       <img src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-down1.png">
                                    </span>
                                 </a>
                              </h4>
                                                    </div>
                                                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pd-sf-product-related">
                                                        <div class="panel-body">
                                                        	<c:choose>
                                                        	<c:when test="${language =='en'}">
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.8.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.9.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.10.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.11.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.1.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.2.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b id="remarks-3"><fmt:message key="easyhealth.plandetails.remarks.3.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.4.content" bundle="${msg}" />
                                                            </p>
                                                            <ul>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.5.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.6.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.7.content" bundle="${msg}" /></li>
                                                            </ul>
                                                            <br>                                                        	
                                                            </c:when>
                                                            <c:when test="${language =='tc'}">
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.8.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.9.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.10.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.11.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.1.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.2.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.3.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.4.content" bundle="${msg}" />
                                                            </p>
                                                            <ul>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.5.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.6.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.7.content" bundle="${msg}" /></li>
                                                            </ul>
                                                            <br>                                                                                                                    
                                                            </c:when>
                                                            </c:choose>
                                                            
                                                            
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.12.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.13.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.14.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.15.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.16.content" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="easyhealth.plandetails.remarks.17.content" bundle="${msg}" /></p>
                                                            <ol>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.18.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.19.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.20.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.21.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.22.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.23.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.24.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.25.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.26.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.27.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.28.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.29.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.30.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.31.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.32.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.33.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.34.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.35.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.36.content" bundle="${msg}" /></li>
                                                                <li><fmt:message key="easyhealth.plandetails.remarks.37.content" bundle="${msg}" /></li>

                                                            </ol>
                                                            <br>
                                                            <p><b><fmt:message key="easyhealth.plandetails.remarks.38.content" bundle="${msg}" /></b><fmt:message key="easyhealth.plandetails.remarks.39.content" bundle="${msg}" /></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="checkbox">
                                                <input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC"><fmt:message key="easyhealth.plandetails.tnc.1.content" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.brochure.easyhealth" bundle="${msg}" />" target="_blank" class="sub-link"><fmt:message key="easyhealth.plandetails.tnc.2.content" bundle="${msg}" /></a><fmt:message key="easyhealth.plandetails.tnc.3.content" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.provisions.easyhealth" bundle="${msg}" />" target="_blank" class="sub-link"><fmt:message key="easyhealth.plandetails.tnc.4.content" bundle="${msg}" /></a><fmt:message key="easyhealth.plandetails.tnc.5.content" bundle="${msg}" /></label>

                                            </div>
                                            <span class="error-msg" id="cbTNCErrMsg" data-txt='<fmt:message key="easyhealth.plandetails.tnc.err.content" bundle="${msg}" />'></span>
                                        </div>
                                    </div>
                                </div>
                                <!-- MODALS / LIGHTBOXES -->

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
                                            <h4 class="text-center welcome-msg"><fmt:message key="overlay.easyhealth.repeated.purchase.copy1" bundle="${msg}" /><span id="fullName1" class="hidden"></span></h4>
                                            <p class="text-center description-msg"><fmt:message key="overlay.easyhealth.repeated.purchase.copy2" bundle="${msg}" /></p>
                                            <center>
                                                <button class="btn savie-common-btn" id="back-home"><fmt:message key="button.back.to.home" bundle="${msg}" /></button>
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
                                    <c:if test="${backSummary == 'Y'}"><a href="javascript:void(0);" class="savie-common-btn" id="backSummary"><fmt:message key="button.back.summary" bundle="${msg}" /></a></c:if>
                                    <c:if test="${backSummary != 'Y'}"><a href="javascript:void(0);" class="savie-common-btn" id="btnLoginApply"><fmt:message key="easyhealth.plandetails.login" bundle="${msg}" /></a></c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<script>
    $(document).ready(function() {
        var dob_end_date = new Date();
        dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
        
        // 86 year ago date
        var dob_start_date = new Date();
        dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
        dob_start_date.setDate(dob_start_date.getDate()+1);
        
        // $('#plan-dob-datepicker').datepicker({
        //     format: "yyyy-mm-dd",
        //     startView: "decade",
        //     startDate: dob_start_date,
        //     endDate: dob_end_date,
        //     autoclose: true,
        //     startView: 2
        // }).css('cursor', 'default');

        $('#calendarTime-demo').mobiscroll().calendar({
            theme: "mobiscroll",        // Specify theme like: theme: 'ios' or omit setting to use default
            lang: "zh",      // Specify language like: lang: 'pl' or omit setting to use default
            display: $('#display').val(),    // Specify display mode like: display: 'bottom' or omit setting to use default
            mode: "inline",          // More info about mode: https://docs.mobiscroll.com/2-17-2/calendar#!opt-mode
            controls: ['calendar', 'time'],  // More info about controls: https://docs.mobiscroll.com/2-17-2/calendar#!opt-controls
            mode: 'mixed'                    // More info about mode: https://docs.mobiscroll.com/2-17-2/calendar#!opt-mode
        });
        
        $("#btnLoginApply, .plan-detail-desc .btn-apply").click(function() {
            //### start TNC check
            if(!isTNCChecked()) return;
            //### end TNC check

            if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
            	$.ajax({     
				    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',     
				    type:'get',
				    cache:false, 
				    async:false, 
				    data:{    
		    	    	"planCode" : "HEH1"
		       		}, 
				    error:function(){       
				    },     
				    success:function(data){
				    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
					    	$('#loginpopup').modal('hide');
				    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
				    		$('#prev-savie-app-modal').modal('show');
				    	}else{
				    		$.ajax({     
							    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',     
							    type:'get',
							    cache:false, 
							    async:false, 
							    data:{    
					    	    	"planCode" : "HEH2"
					       		}, 
							    error:function(){       
							    },     
							    success:function(data){
							    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
								    	$('#loginpopup').modal('hide');
							    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
							    		$('#prev-savie-app-modal').modal('show');
							    	}else{
							    		$.ajax({     
										    url:'${pageContext.request.contextPath}/ajax/savings-insurance/getPurchaseHistoryByPlanCode',     
										    type:'get',
										    cache:false, 
										    async:false, 
										    data:{    
								    	    	"planCode" : "HEH3"
								       		}, 
										    error:function(){       
										    },     
										    success:function(data){
										    	if(data != null && data.errMsgs == null && data.policies !=null && data.policies.length > 0){
											    	$('#loginpopup').modal('hide');
										    		$('#prev-savie-app-modal').modal({backdrop: 'static', keyboard: false});
										    		$('#prev-savie-app-modal').modal('show');
										    	}else{
										    		putPremium();
										    	}
										    }  
										});
							    	}
							    }  
							});
				    	}
				    }  
				});
            }else{
                $('#offline-online-modal').modal('hide');
                $('.login-info').addClass('hidden');
                $('#loginpopup .modal-dialog').removeClass('loginpopupext');
                $('#loginpopup #fna-check').val("false");
                $('#loginpopup #nav-bar-check').val("false");
                $('#loginpopup').modal('show');         
            }
        });
        
         $("#backSummary, .btn-apply").click(function() {
            //### start TNC check
            if(!isTNCChecked()) return;
            //### end TNC check

            putPremium();
        }); 

        function putPremium(){
            var pro = $(".text-center.btn-plan-selector.selected").attr("data-tab");
            $.ajax({
                  type : "post",
                  cache:false, 
                  async:false, 
                  url : '${pageContext.request.contextPath}/ajax/medical-insurance/putPremium',
                  data : {pro : pro},
                  success : function(data) {
                	 if('${backSummary}'=="Y"){
						 window.location = '<%=request.getContextPath()%>/${language}/medical-insurance/application-summary';
					 }
                	 else{
                		 window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
                	 }
                  },
                  error:function(){
                      console.log('error');   
                  }
            });
        }
        
        if('${ehStep }' == '1'){
        	if('${ehPlanDetail.gender }' == '0'){
        		$("#gender0").click();
        	}
        	else{
        		$("#gender1").click();
        	}
        	
        	if('${ehPlanDetail.smoker }' == '0'){
        		$("#smoker0").click();
        	}
        	else{
        		$("#smoker1").click();
        	}
        	
            $('#dob').mobiscroll('setVal', dateStrParse($("#dob").attr("value")));
            $('#dob').mobiscroll('select');
        	
        	$("#eh-btn-plan-overview").click();
        	
        	if('${pro }' != null && '${pro }' != ''){
                var className = $("#"+'${pro }').attr("data-grp");
                $("." + className).addClass("highlight");
        	}
        }
        else if('${ehStep }' == '2'){
        	if('${ehPlanDetail.gender }' == '0'){
        		$("#gender0").click();
        	}
        	else{
        		$("#gender1").click();	
        	}
        	
        	if('${ehPlanDetail.smoker }' == '0'){
        		$("#smoker0").click();
        	}
        	else{
        		$("#smoker1").click();
        	}
        	
        	$('#dob').mobiscroll('setVal', dateStrParse($("#dob").attr("value")));
        	$('#dob').mobiscroll('select');

        	$("#eh-btn-plan-overview").click();
        	
        	$(".step1").hide();
        	$("#"+'${pro }').click();
        }
        
        //patch for firefox
        function dateStrParse(str){
        	var ary = str.split("-");
        	//mm/dd/yyyy
        	return new Date(ary[1] + "/" + ary[2] + "/" + ary[0]);
        }
        
        $("#back-home").click(function() {
        	window.location = '<%=request.getContextPath()%>/${language}/medical-insurance';
        });
    })
</script>
<script src="<%=request.getContextPath()%>/resources/js/easy-health/tableHover.js"></script>
