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
    <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
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
                        <a href="javascript:void(0);" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Easy HomeCare</p>
                            <p class="fld-val">Standard cover, Annual</p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Promote Code</p>
                            <p class="fld-val">
                            <span class="txt-promote-code gentle-fade" id="txt-promote-code">${planQuote.referralCode == "" ? '-' : planQuote.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">The Club Member</p>
                            <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Original price</p>
                            <p class="fld-val">HK$<span id="original-price">${planQuote.grossPremium }</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$<span id="discount">${planQuote.discountAmount }</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                    	<div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Amount due</p>
                            <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price" id="txt-price">${planQuote.totalDue }</span><span class="txt-hkd-suffix"></span></p>
                            </div>
                        </div>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">${planQuote.referralCode == "" ? '-' : planQuote.referralCode}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">The Club Member</p>
                                        <p class="fld-val"><span class="txt-theclub-member">-</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Original price</p>
                                        <p class="fld-val">HK$${planQuote.grossPremium }</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$${planQuote.discountAmount }</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Amount due</p>
                                        <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price">${planQuote.totalDue }</span></p>
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
                            <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-planA-hero.jpg" class="img-hero" alt="">
                            <div class="app-hero-panel-cont">
                                <h2><span><fmt:message key="planoption.home.text.plan.name2" bundle="${msg}" /></span><br><fmt:message key="planoption.home.text.amount.prefix" bundle="${msg}" />${planQuote.totalDue }<fmt:message key="planoption.home.text.amount.suffix" bundle="${msg}" /></h2>
                                <a href="javascript:void(0);" class="btn-app btn-select-plan reverse"><fmt:message key="planoption.home.button.selected" bundle="${msg}" /></a>
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
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item7.description" bundle="${msg}" /></strong></td>
                                            <td><fmt:message key="planoption.home.tab2.table.item7.amount" bundle="${msg}" /></td>
                                        </tr>
                                        <tr>
                                            <td><strong><fmt:message key="planoption.home.tab2.table.item7.description2" bundle="${msg}" /></strong></td>
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
            <p class="disclaimer"><fmt:message key="planoption.home.tab5.remarkstext1" bundle="${msg}" />
 <a href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/protect/household/easy-home-care.pdf" target="_blank"><fmt:message key="planoption.home.tab5.remarkstext2" bundle="${msg}" /></a> <fmt:message key="planoption.home.tab5.remarkstext3" bundle="${msg}" /> 
<fmt:message key="planoption.home.tab5.remarkstext4" bundle="${msg}" /><nobr> <a href="tel:31233123">3123 3123</a></nobr>.</p>

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
                            <label>Promotion Code</label> <a href="javascript:void(0);" class="link-how2-get" data-toggle="modal" data-target=".bs-promo-modal-lg">How do I get promotion code?</a>
                        </div>
                        <div>
                            <input type="text" id="promoCode" name="referralCode" value="${referralCode }" class=""><a href="javascript:void(0);" class="btn-promo-apply">Apply</a>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-4 theclub-wrapper">
                    <div class="checkbox">
                        <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="<%=request.getContextPath()%>/resources/images/easy-home/ico-the-club.png" alt=""><span>member</span></a></label>
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
                        <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
                        <a href="javascript:void(0);" class="btn-app eh-btn-next" id="eh-select-plan-next">Next</a>
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
                                Don't have a promotion code? Enter your email address and we'll send you one.
                            </h2>
                            <div class="alert alert-success hide proSuccess"></div>
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <input class="mdl-textfield__input" type="email" id="emailToSendPromoCode" name="emailToSendPromoCode" maxlength="50">
                                        <label class="mdl-textfield__label" for="emailAddress">Email address</label>
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
                                        Submit
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
                                        By submitting my email address I agree to receive FWD's promotion code and other offers in the future.
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
									Enter The Club membership number to receive 900 Clubpoints from HKT. The Clubpoints will be credited to your HKT membership account within 4-6 weeks upon successful purchase of the FWD Easy Home Care Insurance.
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<p>
									<a
										href="https://www.theclub.com.hk/register?lang=EN"
										target="_blank">Not The Club member yet? Click here to join now</a>
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
	$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
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
	      	if(data !=null && data.errorMsg ==null){
	      		$("#txt-promote-code").html(data.referralCode);
	      		$("#original-price").html(data.priceInfo.grossPremium);
	      		$("#discount").html(data.priceInfo.discountAmount);
	      		$("#txt-price").html(data.priceInfo.totalDue);
	      		
	      		$("#planCode").val(data.planCode);
	      		$("#grossPremium").val(data.priceInfo.grossPremium);
	      		$("#discountAmount").val(data.priceInfo.discountAmount);
	      		$("#totalDue").val(data.priceInfo.totalDue);
	      		$("#referralName").val(data.referralName);
	      		$('#loading-overlay').modal('hide');
			}
	      	else{
	      		$('#loading-overlay').modal('hide');
	      		console.log(data.errorMsg); 
	      	}
        },
        error:function(){
        	$('#loading-overlay').modal('hide');
            console.log('error');   
        }
  });
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
			elmErrMsg.text("Please input The Club membership number.");
		}else if(val.substring(0, 1) != "8"){
			elmErrMsg.text("The Club membership number must start with 8.");
		}else if(isNaN(val)){
			elmErrMsg.text("The Club membership number must be 10 digits in length.");
		}else{
			if(val.length != 10){
				elmErrMsg.text("The Club membership number must be 10 digits in length.");
			}else{
				isValid = true;				
			}
		}
	}
	
	return isValid;
}
</script>
