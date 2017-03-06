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
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-home/easyhome-app-uifn.js"></script>
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.home.liability,breadcrumb.item.quote
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
                            <p class="fld-label">${language == 'en' ? 'Home Liability':'家居責任保險'}</p>
                            <p class="fld-val"></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.promo.code" bundle="${msg}" /></p>
                            <p class="fld-val display--ellipsis gentle-fade"><span class="txt-promote-code">${planQuote.referralCode }</span></p>
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
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /><span class="original-price"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.grossPremium }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label"><fmt:message key="lable.discount" bundle="${msg}" /></p>
                            <p class="fld-val"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /><span class="discount"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.discountAmount }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
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
                                        <p class="fld-val txt-promote-code">${planQuote.referralCode }</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label"><fmt:message key="lable.theclub.member" bundle="${msg}" /></p>
                                        <p class="fld-val txt-theclub-member"></p>
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
                                        <p class="fld-val"><span class="txt-hkd-prefix"><fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> </span><span class="txt-price"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.totalDue }" maxFractionDigits="2"/></span> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>
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
                    <div class="row app-selectplan-tab-head planb">
                        <div class="col-xs-12">
                            <div class="planb1">
                                
                                <div class="app-hero-panel-cont">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/plan_select_B_img.jpg" class="img-hero" alt="">
                                    <h2><span>${language == 'en' ? 'Home Liability':'家居責任保險'}</span><br><fmt:message key="planoption.home.text.amount.prefix" bundle="${msg}" /><span id="totalDue2" style="padding: 0 5px;"><fmt:formatNumber pattern="0.00" type="number" value="${planQuote.totalDue }" maxFractionDigits="2"/></span><fmt:message key="planoption.home.text.amount.suffix" bundle="${msg}" /></h2>
                                    <div class="btn-app btn-select-plan" data-plan="home-liability"><fmt:message key="planoption.home.button.selected" bundle="${msg}" /></div>
                                </div>
                                <div class="app-hero-panel-cont2">
                                    <div class="text-center">
                                        <h3 style="cursor:default;"><fmt:message key="label.upgrade.for.total.care" bundle="${msg}" /></h3>
                                        <h2>${language == 'en' ? 'Easy HomeCare':'易安心家居保'}</h2>
                                        <a href="javascript:void(0);" class="btn-app btn-select-plan" data-plan="home-liability" id="home-liability-update"><fmt:message key="label.upgrade.now" bundle="${msg}" /></a>
                                    </div>
                                </div>
                                <div style="clear:both;"></div>
                                
                            </div>
                            
                        </div>
                        
                    </div>
                </div>
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-body">
                        <div class="col-xs-3"> <!-- required for floating -->
                        <!-- Nav tabs -->
                        <ul class="tabs-left">
                            <li class="active"><a href="#highlights" data-toggle="tab"><i class="icon-icon_01"></i><span><fmt:message key="planoption.home.liability.tab1.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#coverage" data-toggle="tab"><i class="icon-icon_03"></i><span><fmt:message key="planoption.home.liability.tab2.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#premium" data-toggle="tab"><i class="icon-icon_02"></i><span><fmt:message key="planoption.home.liability.tab3.title" bundle="${msg}" /></span></a></li>
                            <li><a href="#exclusion" data-toggle="tab"><i class="icon-icon_04"></i><span><fmt:message key="planoption.home.liability.tab4.title" bundle="${msg}" /></span></a></li>
                            <!-- <li><a href="#excess" data-toggle="tab"><i class="icon-icon_05"></i><span>Excess</span></a></li> -->
                        </ul>
                        </div>

                        <div class="col-xs-9">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="highlights">
                                <h4><fmt:message key="planoption.home.liability.tab1.title" bundle="${msg}" /></h4>
                                <div class="easy-home-toggle">
                                    <p><fmt:message key="planoption.home.liability.tab1.text1" bundle="${msg}" /></p>
                                    <ul>
                                        <li><fmt:message key="planoption.home.liability.tab1.text2" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab1.text3" bundle="${msg}" /></li>
                                        <li>Protects household contents inside the home, such as furniture, electrical appliances etc., against loss or damage arising from fire, flood, bursting pipes, typhoon, theft and other accidents</li>
                                        <li>In an event that your home becomes uninhabitable as a result of accidental loss or damage, our home insurance will help you with the costs of alternative accommodation of up to HK$1,000 per day / HK$50,000 per year</li>
                                        <li>If someone sustains accidental bodily injury or accidental property damage and you, or your family members, are responsible, we'll pay up to HK$5,000,000 for any loss or damage</li>
                                        <li>Applicable to Home for Net Floor Area up to 1,000 square feet</li>
                                    </ul>
                                </div>
                                <div class="home-liability-toggle">
                                    <p><fmt:message key="planoption.home.liability.tab1.text1" bundle="${msg}" /></p>
                                    <ul>
                                        <li><fmt:message key="planoption.home.liability.tab1.text2" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab1.text3" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane" id="premium">
                                <h4><fmt:message key="planoption.home.liability.tab3.title" bundle="${msg}" /></h4>
                                <div class="easy-home-toggle">
                                    <p>Applicable to Home for Net Floor Area up to 1,000 square feet</p>
                                    <br>
                                    <table class="table-in-tab">
                                        <tr class="thbg">
                                            <th>Section</th>
                                            <th>Coverage</th>
                                            <th>Limit of Liability (HK$)</th>
                                            <th>Annual Premium (HK$)</th>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Household Contents</td>
                                            <td>500,000</td>
                                            <td>420</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Personal Liability</td>
                                            <td>5,000,000</td>
                                            <td>Free with Section 1</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="home-liability-toggle">
                                    <p><fmt:message key="planoption.home.liability.tab3.text" bundle="${msg}" /></p>
                                    <br>
                                    <table class="table-in-tab">
                                        <tr class="thbg">
                                            <th><fmt:message key="planoption.home.liability.tab3.table.section" bundle="${msg}" /></th>
                                            <th><fmt:message key="planoption.home.liability.tab3.table.coverage" bundle="${msg}" /></th>
                                            <th><fmt:message key="planoption.home.liability.tab3.table.limit" bundle="${msg}" /></th>
                                            <th><fmt:message key="planoption.home.liability.tab3.table.premium" bundle="${msg}" /></th>
                                        </tr>
                                        <tr>
                                            <td><fmt:message key="planoption.home.liability.tab3.table.section.text" bundle="${msg}" /></td>
                                            <td><fmt:message key="planoption.home.liability.tab3.table.coverage.text" bundle="${msg}" /></td>
                                            <td>5,000,000</td>
                                            <td>249</td>
                                        </tr>
                                    </table>
                                    <br>
                                    <p><strong><fmt:message key="planoption.home.tab3.table3.renewal.copy1" bundle="${msg}" /></strong></p>
                                    <p><fmt:message key="planoption.home.tab3.table3.renewal.copy2" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="coverage">
                                <h4><fmt:message key="planoption.home.liability.tab2.title" bundle="${msg}" /></h4>
                                <div class="easy-home-toggle">
                                    <strong>Section 1. Household Contents</strong><br>
                                    <p>Your household contents at home are insured for 'All Risks' cover. This 'All Risks' cover protects your contents against accidental loss or damage arising from, including but not limited to, fire, flood, typhoon, explosion or theft, up to a maximum of HK$500,000 per year. Maximum limit of the coverage for any one item of your household contents is HK$100,000. Valuables, such as jewellery, gold, silver, watches, photographic equipment, furs, musical instruments (except pianos), are covered up to HK$10,000 per item and with an aggregate maximum of HK$100,000 per year.</p>
                                    <br>
                                    <p>In addition to the above mentioned coverage, this insurance provides the following extra benefits:</p>
                                    <br>
                                    <table id="homecarePremium" class="table table-bordred">
                                        <tbody>
                                            <tr style="background-color: #f68a1d;">
                                                <td><strong style="color: #fff;">Item</strong></td>
                                                <td><strong style="color: #fff;">Benefit</strong></td>
                                                <td><strong style="color: #fff;">Maximum Limits(HK$)</strong></td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td><strong>Window, Door Lock &amp; Key Replacement Replacement of external door locks and keys or broken windows due to theft or attempted theft</strong></td>
                                                <td>3,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><strong>Temporary Removal<br>Accidental loss of or damage to household contents whilst being temporarily removed from home for renovation, cleaning or repair</strong></td>
                                                <td>50,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>3<br></td>
                                                <td><strong>Home Removal<br>Accidental loss of or damage to household contents:<br>(a) whilst in transit between current home and new home by professional removers within Hong Kong; or<br>(b) whilst in temporary storage, for up to 7 days in a furniture depository; or<br>(c) whilst at the new home but before occupied as permanent residence up to 2 months (you have to notify us before your move)</strong></td>
                                                <td>50,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td><strong>Frozen Food<br>Cost of replacing spoilt frozen food due to accidental power failure or breakdown of refrigerator</strong></td>
                                                <td>5,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td><strong>Removal of Debris<br>Cost of removal of debris when household contents are accidentally damaged</strong></td>
                                                <td>10,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td><strong>Personal Money<br>Accidental loss or theft of money at home</strong></td>
                                                <td>2,500 per year</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">7</td>
                                                <td><strong>Domestic Helper's Property</strong></td>
                                                <td>1,000 per item</td>
                                            </tr>
                                            <tr>
                                                <td><strong>Accidental loss of or damage to domestic helper's property at home</strong></td>
                                                <td>5,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td><strong>Tenants Improvement<br>Accidental loss of or damage to tenant's improvements at home</strong></td>
                                                <td>100,000 per item</td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td><strong>Interior Renovation<br>Accidental loss of or damage to household contents during interior renovation by contractors (provided that the period of renovation is within 2 months)</strong></td>
                                                <td>100,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">10</td>
                                                <td rowspan="2"><strong>Alternative Accommodation<br>Cost of alternative accommodation when the home becomes uninhabitable as a result of accidental loss or damage</strong></td>
                                                <td>1,000 per day</td>
                                            </tr>
                                            <tr>
                                                <td>50,000 per year</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">11</td>
                                                <td rowspan="2"><strong>Personal Accident<br>Accidental death of Insured or Insured's family members as a result of fire or theft at home</strong></td>
                                                <td>50,000 per person</td>
                                            </tr>
                                            <tr>
                                                <td>200,000 per year</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <strong>Section 2. Personal Liability</strong><br>
                                    
                                    <p>Easy HomeCare provides worldwide cover of your legal liability up to HK$5,000,000 against any claim for bodily injury or property damage resulting from the negligence of you or your family members normally living with you, provided that the legal proceeding is submitted to the Hong Kong court.</p>
                                    <p>a) as occupier of the home</p>
                                    <p>b) as owner of the home (including common areas of the building)</p>
                                    <p>c) as a private individual (anywhere in the world)</p>
                                    <p>Cover for your legal liability as a Tenant of the home against damage caused to the structure of the home and landlord's fixtures and fittings.</p>
                                </div>
                                <div class="home-liability-toggle">
                                    <p><fmt:message key="planoption.home.liability.tab2.text1" bundle="${msg}" /></p>
                                    <p><fmt:message key="planoption.home.liability.tab2.text2" bundle="${msg}" /></p>
                                    <p><fmt:message key="planoption.home.liability.tab2.text3" bundle="${msg}" /></p>
                                    <p><fmt:message key="planoption.home.liability.tab2.text4" bundle="${msg}" /></p>
                                    <p><fmt:message key="planoption.home.liability.tab2.text5" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="exclusion">
                                <h4><fmt:message key="planoption.home.liability.tab4.title" bundle="${msg}" /></h4>
                                <div class="easy-home-toggle">
                                    <p>The following is only a summary of the major exclusions. Please refer to the Policy for details.</p>
                                    <ul>
                                        <li>Loss or damage arising from uninsurable risks such as scratching, wear and tear, mechanical or electrical fault or breakdown, misuse or domestic animals</li>
                                        <li>Loss of or damage to mobile phones, household contents contained in open areas or on roofs, spectacles, contact lenses, sporting equipment whilst in use, computer system records, aerial devices or satellite dish</li>
                                        <li>Loss or damage if the home is unoccupied for more than 60 consecutive days</li>
                                        <li>Personal Liability for travel out of Hong Kong exceeding 90 consecutive days</li>
                                        <li>Loss or damage due to war risks, radioactive risks, sonic bangs or any act of terrorism</li>
                                    </ul>
                                </div>
                                <div class="home-liability-toggle">
                                    <p><fmt:message key="planoption.home.liability.tab4.text1" bundle="${msg}" /></p>
                                    <ul>
                                        <li><fmt:message key="planoption.home.liability.tab4.text2" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab4.text3" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab4.text4" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab4.text5" bundle="${msg}" /></li>
                                        <li><fmt:message key="planoption.home.liability.tab4.text6" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>
                            <!--<div class="tab-pane" id="excess">
                                <h4>Excess</h4>
                                <table>
                                    <tr>
                                        <th>Section 1 - Household Contents</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>The first HK$1,000 of each claim caused by water</li>
                                                <li>The first HK$500 of each claim resulting from any other cause</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table><br>
                                <table>
                                    <tr>
                                        <th>Section 2 - Personal Liability</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <ul>
                                                <li>The first HK$500 of each claim for third party property damage</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            -->
                        </div>
                        </div>  
                    </div>
                </div>
            </div>
            <p class="disclaimer"><fmt:message key="disclaimer.tnc.home.liability.copy2.part1" bundle="${msg}" />
 <a href="<fmt:message key="link.provisions.home.liability" bundle="${msg}" />" target="_blank"><fmt:message key="disclaimer.tnc.home.liability.copy2.part2" bundle="${msg}" /></a> <fmt:message key="disclaimer.tnc.home.liability.copy2.part3" bundle="${msg}" /> <fmt:message key="disclaimer.tnc.home.liability.copy2.part4" bundle="${msg}" /><nobr> <a href="tel:31233123">3123 3123</a></nobr><fmt:message key="disclaimer.tnc.home.liability.copy2.part5" bundle="${msg}" /></p>

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
                            <label><fmt:message key="label.promo.code" bundle="${msg}" /></label> 
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
									<fmt:message key="home.liability.club.membership.pop.up" bundle="${msg}" />
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
		      	if(data !=null && data.errMsgs == null){
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
	            showSubmitError("Error", true);
	        }
	  });
	}
	
});

$("#eh-select-plan-next").on("click",function(){
	
	if(validateTheClub()){
		$("#ef-form-selectplan").attr('action', '<%=request.getContextPath()%>/${language}/household-insurance/home-liability/${nextPageFlow}');
	    document.getElementById('ef-form-selectplan').submit();		
	}
 	
});

$("#home-liability-update").on("click",function(){
	$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
	$.ajax({
	   type : "get",
	   cache:false, 
	   async:false, 
	   url : '${pageContext.request.contextPath}/ajax/easy-home-care/getHomeCareQuote',
	   data : {
	       	referralCode : "",
	       	answer1 : "N",
	       	answer2 : "N"
	          },
	   success : function(data) {
	     	if(data !=null && data.errorMsgs ==null){
	     		$('#loading-overlay').modal('hide');
	     		window.location = '<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care/${nextPageFlow2}';			}
	     	else{
	     		$('#loading-overlay').modal('hide');
	     		$('#promoCodeErrMsg').html(getBundle(getBundleLanguage, "promocode.notValid.message"));  
	     	}
	   },
	   error:function(){
		   $('#loading-overlay').modal('hide');
	       console.log('error');   
	   }
	});
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
}
function BackMe() {
    window.history.back();
}
</script>
