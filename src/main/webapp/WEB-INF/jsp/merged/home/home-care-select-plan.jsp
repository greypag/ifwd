<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>
    <!-- Main Content Start-->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/icon-font.css"></head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css"></head>
    <!-- <link href="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.css" rel="stylesheet" type="text/css" /> -->
    <link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
    <!-- <script src="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.js" type="text/javascript"></script> -->
    <script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.easyhome,breadcrumb.item.quote
        </c:set>
        <c:set var="breadcrumbActive">4</c:set>

        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->

     <div class="savie-online-container app-pg-ctnr" id="ehome-app-selectplan">
     <!-- <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn"><span class="status">2</span>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div> -->
    <div class="container-fluid summary-bar">
        <div class="row">
            <div class="summary-bar-container">
                
                <ul class="summary-group clearfix">
                    <!--  -->
                    <li class="back">
                        <a href="<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/screening" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">${language == 'en' ? 'Easy HomeCare':'易安心家居保'}</p>
                            <p class="fld-val"></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                            <p class="fld-val display--ellipsis">
                            <span class="txt-promote-code gentle-fade">${planQuote.referralCode == "" ? '-' : planQuote.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <span id="original-price"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.grossPremium }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <span class="discount"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.discountAmount }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                    	<div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                            <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /></span><span class="txt-price"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.totalDue }" maxFractionDigits="2"/></span><span class="txt-hkd-suffix"><fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></span></p>
                            </div>
                        </div>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                                        <p class="fld-val txt-promote-code"><span class="txt-promote-code">${planQuote.referralCode == "" ? '-' : planQuote.referralCode}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.original.price" bundle="${msg}" /></p>
                                        <p class="fld-val original-price"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${planQuote.grossPremium }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                                        <p class="fld-val discount"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <fmt:formatNumber pattern="0.00" type="number" value="${planQuote.discountAmount }" maxFractionDigits="2"/> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.amount.due" bundle="${msg}" /></p>
                                        <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /></span><span class="txt-price"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.totalDue }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
<form id="ef-form-selectplan" method="post">
     <div class="app-pg-cont">
        <div class="container-fluid">
            <div class="row app-selectplan-tab">
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-head">
                        <div class="col-xs-12 col-md-12">
                            <img src="<%=request.getContextPath()%>/resources/images/easy-home/Plan_select_A_img.jpg" class="img-hero" alt="">
                            <div class="app-hero-panel-cont">
                                <h2><span><fmt:message key="planoption.home.text.plan.name2" bundle="${msg}" /></span><br><fmt:message key="planoption.home.text.amount.prefix" bundle="${msg}" /><span id="totalDue2" style="padding: 0 5px;"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.totalDue }" maxFractionDigits="2"/></span><fmt:message key="planoption.home.text.amount.suffix" bundle="${msg}" /></h2>
                                <div class="btn-app btn-select-plan reverse"><fmt:message key="planoption.home.button.selected" bundle="${msg}" /></div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-body">
                        <div class="col-xs-3"> <!-- required for floating -->
                        <!-- Nav tabs -->
                        <ul class="tabs-left">
                            <li class="active"><a href="#highlights" data-toggle="tab"><i class="icon-icon_01"></i><span><fmt:message key="planoption.home.tab1.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#coverage" data-toggle="tab"><i class="icon-icon_03"></i><span><fmt:message key="planoption.home.tab2.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#premium" data-toggle="tab"><i class="icon-icon_02"></i><span><fmt:message key="planoption.home.tab3.table2.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#exclusion" data-toggle="tab"><i class="icon-icon_04"></i><span><fmt:message key="planoption.home.tab4.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#excess" data-toggle="tab"><i class="icon-icon_05"></i><span><fmt:message key="planoption.home.tab5.title" bundle="${msg}" /></span></a></li>
                        </ul>
                        </div>

                        <div class="col-xs-9">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="highlights">
                                <h4><fmt:message key="planoption.home.tab1.title" bundle="${msg}" /></h4>
                                <p><fmt:message key="planoption.home.tab1.text" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab1.text.bullet6" bundle="${msg}" /></li>
                                </ul>
                            </div>
                            <div class="tab-pane" id="premium">
                                <h4><fmt:message key="planoption.home.tab3.table2.title" bundle="${msg}" /></h4>
                                <p><fmt:message key="planoption.home.tab3.table2.title.text" bundle="${msg}" /></p>
                                <br>
                                <table class="table-in-tab">
                                    <tr class="thbg">
                                        <th><fmt:message key="planoption.home.tab3.table2.item" bundle="${msg}" /></th>
                                        <th><fmt:message key="planoption.home.tab3.table2.coverage" bundle="${msg}" /></th>
                                        <th><fmt:message key="planoption.home.tab3.table2.maxlimit" bundle="${msg}" /></th>
                                        <th><fmt:message key="planoption.home.tab3.table2.annualpremium" bundle="${msg}" /></th>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="planoption.home.tab3..table2.item.text1" bundle="${msg}" /></td>
                                        <td><fmt:message key="planoption.home.tab3.table2.coverage.text1" bundle="${msg}" /></td>
                                        <td>500,000</td>
                                        <td>420</td>
                                    </tr>
                                    <tr>
                                        <td><fmt:message key="planoption.home.tab3.table2.item.text2" bundle="${msg}" /></td>
                                        <td><fmt:message key="planoption.home.tab3.table2.coverage.text2" bundle="${msg}" /></td>
                                        <td>5,000,000</td>
                                        <td><fmt:message key="planoption.home.tab3.table2.annualpremium.amount2" bundle="${msg}" /></td>
                                    </tr>
                                </table>
                                <br>
                                <p><strong><fmt:message key="planoption.home.tab3.table3.renewal.copy1" bundle="${msg}" /></strong></p>
                                <p><fmt:message key="planoption.home.tab3.table3.renewal.copy2" bundle="${msg}" /></p>
                            </div>
                            <div class="tab-pane" id="coverage">
                                <h4><fmt:message key="planoption.home.tab2.title" bundle="${msg}" /></h4>
                                <strong><fmt:message key="planoption.home.tab2.section1.title" bundle="${msg}" /></strong><br>
                                <p><fmt:message key="planoption.home.tab2.section1.text" bundle="${msg}" /></p>
                                <br>
                                <p><fmt:message key="planoption.home.tab2.section1.text2" bundle="${msg}" /></p>
                                <br>
                                <table id="homecarePremium" class="table table-bordred">
                                    <tbody>
                                        <tr style="background-color: #f68a1d;">
                                            <td><strong style="color: #fff;"><fmt:message key="planoption.home.tab2.table.item" bundle="${msg}" /></strong></td>
                                            <td><strong style="color: #fff;"><fmt:message key="planoption.home.tab2.table.benefit" bundle="${msg}" /></strong></td>
                                            <td><strong style="color: #fff;"><fmt:message key="planoption.home.tab2.table.max.limit" bundle="${msg}" /></strong></td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item1.descrption" bundle="${msg}" /><br>
                                            	<fmt:message key="planoption.home.tab2.table.item1.descrption2" bundle="${msg}" /></strong>
                                            </td>
                                            <td><fmt:message key="planoption.home.tab2.table.item1.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item2.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item2.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item2.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item3.description1" bundle="${msg}" />
												<br><fmt:message key="planoption.home.tab2.table.item3.description2" bundle="${msg}" />
												<br><fmt:message key="planoption.home.tab2.table.item3.description3" bundle="${msg}" />
												<br><fmt:message key="planoption.home.tab2.table.item3.description4" bundle="${msg}" />
												<br><fmt:message key="planoption.home.tab2.table.item3.description5" bundle="${msg}" /></strong>
											</td>
                                            <td><fmt:message key="planoption.home.tab2.table.item3.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item4.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item4.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item4.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item5.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item5.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item5.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item6.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item6.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item6.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">7</td>
                                            <td rowspan="2"><strong><fmt:message key="planoption.home.tab2.table.item7.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item7.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item7.amount1" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td><fmt:message key="planoption.home.tab2.table.item7.amount2" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>8</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item8.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item8.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item8.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td>9</td>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item9.description" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item9.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item9.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">10</td>
                                            <td rowspan="2"><strong><fmt:message key="planoption.home.tab2.table.item10.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item10.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item10.amount1" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td><fmt:message key="planoption.home.tab2.table.item10.amount2" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2">11</td>
                                            <td rowspan="2"><strong><fmt:message key="planoption.home.tab2.table.item11.description1" bundle="${msg}" /><br><fmt:message key="planoption.home.tab2.table.item11.description2" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item11.amount1" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td><fmt:message key="planoption.home.tab2.table.item11.amount2" bundle="${msg}" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <strong><fmt:message key="planoption.home.tab2.section2.title" bundle="${msg}" /></strong><br>
                                
                                <p><fmt:message key="planoption.home.tab2.section2.text1" bundle="${msg}" /></p>
                                <p><fmt:message key="planoption.home.tab2.section2.text2" bundle="${msg}" /></p>
                                <p><fmt:message key="planoption.home.tab2.section2.text3" bundle="${msg}" /></p>
                                <p><fmt:message key="planoption.home.tab2.section2.text4" bundle="${msg}" /></p>
                                <p><fmt:message key="planoption.home.tab2.section2.text5" bundle="${msg}" /></p>
                            </div>
                            <div class="tab-pane" id="exclusion">
                                <h4><fmt:message key="planoption.home.tab4.title" bundle="${msg}" /></h4>
                                <p><fmt:message key="planoption.home.tab4.text" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="planoption.home.tab4.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab4.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab4.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab4.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab4.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="planoption.home.tab4.bullet6" bundle="${msg}" /></li>
                                </ul>
                            </div>
                            <div class="tab-pane" id="excess">
                                <h4><fmt:message key="planoption.home.tab5.title" bundle="${msg}" /></h4>
                                <table>
                                    <tr>
                                        <th><fmt:message key="planoption.home.tab5.section1.title" bundle="${msg}" /></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li><fmt:message key="planoption.home.tab5.section1.text1" bundle="${msg}" /></li>
                                                <li><fmt:message key="planoption.home.tab5.section1.text2" bundle="${msg}" /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table><br>
                                <table>
                                    <tr>
                                        <th><fmt:message key="planoption.home.tab5.section2.title" bundle="${msg}" /></th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li><fmt:message key="planoption.home.tab5.section2.text" bundle="${msg}" /></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        </div>  
                    </div>
                </div>
            </div>
            <p class="disclaimer"><fmt:message key="disclaimer.tnc.home.copy2.part1" bundle="${msg}" />
 <a href="<fmt:message key="link.brochure.home" bundle="${msg}" />" target="_blank"><fmt:message key="disclaimer.tnc.home.copy2.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.tnc.home.copy2.part3" bundle="${msg}" /> <a href="<fmt:message key="link.provisions.home" bundle="${msg}" />" target="_blank"><fmt:message key="disclaimer.tnc.home.copy2.part4" bundle="${msg}" /></a> <fmt:message key="disclaimer.tnc.home.copy2.part5" bundle="${msg}" />
<fmt:message key="disclaimer.tnc.home.copy2.part6" bundle="${msg}" /><nobr> <a href="tel:31233123">3123 3123</a></nobr><fmt:message key="disclaimer.tnc.home.copy2.part7" bundle="${msg}" /></p>

        </div>
        <input type="hidden" name="planCode" id="planCode" value="${planQuote.planCode}"/> 
			<input type="hidden" name="grossPremium" id="grossPremium" value="${planQuote.grossPremium}"/> 
			<input type="hidden" name="discountAmount" id="discountAmount" value="${planQuote.discountAmount}"/> 
			<input type="hidden" name="totalDue" id="totalDue" value="${planQuote.totalDue}"/> 
			<%-- <input type="hidden" name="referralCode" id="referralCode" value="${planQuote.referralCode}"/> --%> 
			<input type="hidden" name="referralName" id="referralName" value="${planQuote.referralName}"/> 
			<input type="hidden" name="answer1" value="N"/> 
			<input type="hidden" name="answer2" value="N"/>
    </div>
    <div class="container-fluid summary-bottom-bar">
        <div class="summary-bottom-bar-container">
            <div class="row">
                <div class="col-xs-12 col-md-4 col-md-offset-2 promotion-wrapper">
                    <form action="">
                        <div class="lbl">
                            <label><fmt:message key="label.promo.code" bundle="${msg}" /></label> <a href="javascript:void(0);" class="link-how2-get" data-toggle="modal" data-target=".bs-promo-modal-lg"><fmt:message key="getpromo.copy1" bundle="${msg}" /></a>
                        </div>
                        <div>
                            <input type="text" id="promoCode" name="referralCode" value="${referralCode }" class=""><a href="javascript:void(0);" class="btn-promo-apply"><fmt:message key="button.apply" bundle="${msg}" /></a>
                            <span class="error-msg" id="promoCodeErrMsg"></span>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-4 theclub-wrapper">
                    <div class="checkbox">
                        <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="<%=request.getContextPath()%>/resources/images/easy-home/ico-the-club.png" alt=""><span><fmt:message key="club.membership.confirm" bundle="${msg}" /></span></a></label>
                    </div>
                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" disabled="disabled" maxlength="10">
                    <span class="error-msg" id="theClubErrMsg"></span>
                    
                </div>
                
                
            </div>
        </div>
    </div>
</form>

    
    <div class="app-pg-cont">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="btn-row text-center">
                        <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out" onclick="perventRedirect=false;BackMe();"><fmt:message key="button.back" bundle="${msg}" /></a>
                        <a href="javascript:void(0);" class="btn-app eh-btn-next" id="eh-select-plan-next"><fmt:message key="button.next" bundle="${msg}" /></a>
                    </div>
                    <div class="submit__error">
		                <div class="text-center">
		                    <span class="submit__errormsg" id="submit__errormsg"></span>
		                </div>
		            </div>
                </div>
            </div>
        </div>
    </div>

    <!--Get promotion code popup-->
    <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="login-form" id="sendmailofpromocode">
                    <div style="overflow: hidden;">
                        <a class="close" aria-label="Close" data-dismiss="modal"> <span
                            aria-hidden="true" style="font-size: 30px;">×</span>
                        </a>
                    </div>
                    <form>
                        <div class="form-container">
                            <h2>
                                <fmt:message key="getpromo.copy2" bundle="${msg}" />
                            </h2>
                            <div class="alert alert-success hide proSuccess"></div>
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="email" id="emailToSendPromoCode" name="emailToSendPromoCode" maxlength="50">
                                        <label class="mdl-textfield__label" for="emailAddress"><fmt:message key="label.email" bundle="${msg}" /></label>
                                    </div>
                                    
                                </div>
                                <span class="error-msg" id="emailToSendPromoCodeErrMsg"></span>
                                <input type="hidden" name="planCode" id="planCode"
                                    value="HOMECARE">
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    
                                    <button type="button" onclick="return sendEmail()"
                                        class="bdr-curve btn btn-primary btn-lg wd5">
                                        <fmt:message key="button.submit" bundle="${msg}" />
                                    </button>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
                                </div>
                                <br> <br>
                                <div class="col-lg-12 col-md-12">
                                    <p>
                                        <fmt:message key="getpromo.copy3" bundle="${msg}" />
                                    </p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- The Club Membership popup -->
	<div class="modal fade bs-theclub-modal-lg " tabindex="-1"
		role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form">
					<div style="overflow: hidden;">
						<a id="getPromotionClose" class="close" aria-label="Close"
							data-dismiss="modal"> <span aria-hidden="true"
							style="font-size: 30px;">×</span>
						</a>
					</div>
					<div class="form-container">
						<div class="row">
							<div class="col-xs-12">
								<p>
                                    <fmt:message key="homecare.club.membership.pop.up" bundle="${msg}" />
                                    <%-- <fmt:message key="partner.the.club.3x.period" bundle="${msg}" /> --%>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<p>
									<a
										href="<fmt:message key="theclub.register.link" bundle="${msg}" />"
										target="_blank"><fmt:message key="club.membership.join" bundle="${msg}" /></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ The Club Membership popup -->
    <!-- Main Content End-->

		
    </div>
    
    <script>
$(".btn-promo-apply").on("click",function(){
	
	if(validatePromoCode()){
		$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
		showSubmitError('', false);
		$.ajax({
	        type : "get",
	        cache:false, 
	        async:false, 
	        url : '${pageContext.request.contextPath}/ajax/${planIndex}/getHomeCareQuote',
	        data : {
		        	referralCode : $("#promoCode").val(),
		        	answer1 : "N",
		        	answer2 : "N"
		           },
	        success : function(data) {
		      	if(data !=null && data.errMsgs ==null){
		      		$(".txt-promote-code").html(data.referralCode);
		      		$(".original-price").html(parseFloat(data.priceInfo.grossPremium).toFixed(2));
		      		$(".discount").html(parseFloat(data.priceInfo.discountAmount).toFixed(2));
		      		$(".txt-price").html(parseFloat(data.priceInfo.totalDue).toFixed(2));
		      		
		      		$("#planCode").val(data.planCode);
		      		$("#grossPremium").val(parseFloat(data.priceInfo.grossPremium).toFixed(2));
		      		$("#discountAmount").val(parseFloat(data.priceInfo.discountAmount).toFixed(2));
		      		$("#totalDue").val(parseFloat(data.priceInfo.totalDue).toFixed(2));
                    $("#totalDue2").html(parseFloat(data.priceInfo.totalDue).toFixed(2));
		      		$("#referralName").val(data.referralName);
		      		$('#loading-overlay').modal('hide');
		      		$('#promoCodeErrMsg').html('');
		      		
		      		//Scroll to top if promote code ok
		      		try{
		      			$.scrollTo($(".summary-bar-container"), 800,{offset:{top:-50}});
		      		}catch(err){
		      			
		      		}
				}else if(data !=null && data.errMsgs == "Promotion code is not valid."){
		      		$(".txt-promote-code").html("-");
		      		$(".original-price").html(parseFloat(data.priceInfo.grossPremium).toFixed(2));
		      		$(".discount").html(parseFloat(data.priceInfo.discountAmount).toFixed(2));
		      		$(".txt-price").html(parseFloat(data.priceInfo.totalDue).toFixed(2));
		      		
		      		$("#planCode").val(data.planCode);
		      		$("#grossPremium").val(parseFloat(data.priceInfo.grossPremium).toFixed(2));
		      		$("#discountAmount").val(parseFloat(data.priceInfo.discountAmount).toFixed(2));
		      		$("#totalDue").val(parseFloat(data.priceInfo.totalDue).toFixed(2));
		      		$("#referralName").val(data.referralName);
		      		$('#loading-overlay').modal('hide');
		      		$('#promoCodeErrMsg').html(getBundle(getBundleLanguage, "promocode.notValid.message"));  
				}else{
		      		$('#loading-overlay').modal('hide');
		      		showSubmitError(getBundle(getBundleLanguage, "promocode.notValid.message"), true);
		      	}
	        },
	        error:function(){
	        	$('#loading-overlay').modal('hide');
	        	showSubmitError("error", true);
	            console.log('error');
	        }
	  });
	}
});

$("#eh-select-plan-next").on("click",function(){
	
	if(validateTheClub()){
 		$("#ef-form-selectplan").attr('action', '<%=request.getContextPath()%>/${language}/household-insurance/${planIndex}/${nextPageFlow}');
    	document.getElementById('ef-form-selectplan').submit();
	}
});


function sendEmail() {
    $('.proSuccess').addClass('hide');
    if (getPromoCodeByEmailPopup()) {
    	console.log($("#sendmailofpromocode form").serialize());
        $.ajax({
            type : "POST",
            url : "<%=request.getContextPath()%>/sendEmail",
            data : $("#sendmailofpromocode form").serialize(),
            async : false,
            success : function(data) {
                if (data == 'success') {
                    $('.proSuccess').removeClass('hide').html(getBundle(getBundleLanguage, "system.promotion.success.message"));
                } else {
                	console.log(data);
                    $('.proSuccess').addClass('hide').html(getBundle(getBundleLanguage, "system.promotion.error.message"))
                }
            },
            error : function() {
            }
        });
    }
    return false;
}

function getPromoCodeByEmailPopup(){
	var val = $.trim($("#emailToSendPromoCode").val());
	var elmErrMsg = $("#emailToSendPromoCodeErrMsg");
	var isValid = false;
	if(val != ""){
		if(emailreg.test(val)){
			isValid = true;
		}else{
			elmErrMsg.text(getBundle(getBundleLanguage, "promotion.email.notValid.message"));
			
		}
	}else{
		elmErrMsg.text(getBundle(getBundleLanguage, "promotion.email.notNull.message"));
	}

	return isValid;
}

function validateTheClub(){
	var isValid = true;
	var elmErrMsg = $("#theClubErrMsg");
	if($("#the-club-member-toggle").is(":checked")){
		var val = $.trim($("#theClubMembershipNo").val());
		isValid = false;
		if(val == ""){
            elmErrMsg.text(getBundle(getBundleLanguage, "error.club.member.empty"));
        }else if(val.substring(0, 1) != "8"){
            elmErrMsg.text(getBundle(getBundleLanguage, "error.club.member.invalid.firstdigit"));
        }else if(isNaN(val)){
            elmErrMsg.text(getBundle(getBundleLanguage, "error.club.member.invalid.firstdigit"));
        }else{
            if(val.length != 10){
                elmErrMsg.text(getBundle(getBundleLanguage, "error.club.member.invalid.length"));
            }else{
                isValid = true;             
            }
        }
	}else{
		$("#theClubMembershipNo").val("");
	}
	
	return isValid;
}
function validatePromoCode(){
	var isValid = false;
	var elmErrMsg = $("#promoCodeErrMsg");
	var val = $.trim($("#promoCode").val());
	
	if(val == ""){
		elmErrMsg.text(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
	}else{
		isValid = true;
	}
	
	return isValid;
}function BackMe() {
    window.history.back();
}</script>
