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
    <!-- <link href="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.css" rel="stylesheet" type="text/css" /> -->
    <link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
    <!-- <script src="http://cdn-dev.aldu.net/jquery.mobiscroll/latest/jquery.mobiscroll.min.js" type="text/javascript"></script> -->
    <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-home/easyhome-app-uifn.js"></script>
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
     <div class="container-fluid fwd-full-container browse-holder">
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
     </div>
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
                            <p class="fld-val"><span class="txt-promote-code">-</span></p>
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
                            <p class="fld-val">HK$420.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$0.00</p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                        <p><span class="txt-hkd-prefix">HK$</span><span class="txt-price">420.00</span><span class="txt-hkd-suffix"></span></p>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">-</span></p>
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
                                        <p class="fld-val">HK$420.00</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$0.00</p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
     <div class="app-pg-cont">
        <form id="ef-form-selectplan">
        <div class="container-fluid">
            <div class="row app-selectplan-tab">
                <div class="col-xs-12 col-md-12">
                    <div class="row app-selectplan-tab-head planb">
                        <div class="col-xs-12">
                            <div class="planb1">
                                
                                <div class="app-hero-panel-cont">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/plan_select_B_img.jpg" class="img-hero" alt="">
                                    <h2><span>Personal Liability</span><br>HK$249/year</h2>
                                    <a href="javascript:void(0);" class="btn-app btn-select-plan" data-plan="home-liability">Selected</a>
                                </div>
                                <div class="app-hero-panel-cont2">
                                    <div class="text-center">
                                        <h3>Upgrade for total care</h3>
                                        <h2>Easy HomeCare</h2>
                                        <a href="javascript:void(0);" class="btn-app btn-select-plan" data-plan="home-liability">Upgrade now</a>
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
                            <li class="active"><a href="#highlights" data-toggle="tab"><i class="icon-icon_01"></i><span>Product Highlights</span></a></li>
                            <li><a href="#coverage" data-toggle="tab"><i class="icon-icon_03"></i><span>Summary of Coverage</span></a></li>
                            <li><a href="#premium" data-toggle="tab"><i class="icon-icon_02"></i><span>Premium Table (HK$)</span></a></li>
                            <li><a href="#exclusion" data-toggle="tab"><i class="icon-icon_04"></i><span>Major Exclusions</span></a></li>
                            <li><a href="#excess" data-toggle="tab"><i class="icon-icon_05"></i><span>Excess</span></a></li>
                        </ul>
                        </div>

                        <div class="col-xs-9">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="highlights">
                                <h4>Product Highlights</h4>
                                <div class="easy-home-toggle">
                                    <p>You'll receive extensive 'All Risks' cover: up to HK$500,000 on Household Contents as well as up to HK$100,000 for personal items (with a maximum of $10,000 per item). From your furniture to your frozen food, stay protected with this comprehensive home insurance.</p>
                                    <ul>
                                        <li>Household Contents cover up to a limit as high as HK$500,000</li>
                                        <li>Personal Liability Insurance covers up to HK$5,000,000 as owner and/or occupier of your home or as a private individual anywhere in the world</li>
                                        <li>Protects household contents inside the home, such as furniture, electrical appliances etc., against loss or damage arising from fire, flood, bursting pipes, typhoon, theft and other accidents</li>
                                        <li>In an event that your home becomes uninhabitable as a result of accidental loss or damage, our home insurance will help you with the costs of alternative accommodation of up to HK$1,000 per day / HK$50,000 per year</li>
                                        <li>If someone sustains accidental bodily injury or accidental property damage and you, or your family members, are responsible, we'll pay up to HK$5,000,000 for any loss or damage</li>
                                        <li>Applicable to Home for Net Floor Area up to 1,000 square feet</li>
                                    </ul>
                                </div>
                                <div class="home-liability-toggle">
                                    <p>Personal Liability Insurance covers up to HK$5,000,000 as owner and/or occupier of your home or as a private individual anywhere in the world.</p>
                                    <ul>
                                        <li>If someone sustains accidental bodily injury or accidental property damage and you, or your family members, are responsible, we'll pay up to HK$5,000,000 for any loss or damage</li>
                                        <li>Applicable to Home for Net Floor Area up to 1,000 square feet</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane" id="premium">
                                <h4>Premium Table (HK$)</h4>
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
                                            <td>Personal Liability</td>
                                            <td>5,000,000</td>
                                            <td>239</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="coverage">
                                <h4>Summary of Coverage</h4>
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
                                    <p>Home Liability provides worldwide cover of your legal liability up to HK$5,000,000 against any claim for bodily injury or property damage resulting from the negligence of you or your family members normally living with you, provided that the legal proceeding is submitted to the Hong Kong court.</p>
                                    <p>a) as occupier of the home</p>
                                    <p>b) as owner of the home (including common areas of the building)</p>
                                    <p>c) as a private individual (anywhere in the world)</p>
                                    <p>Cover for your legal liability as a Tenant of the home against damage caused to the structure of the home and landlord's fixtures and fittings.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="exclusion">
                                <h4>Major Exclusions</h4>
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
                                    <p>The following is only a summary of the major exclusions. Please refer to the Policy for details.</p>
                                    <ul>
                                        <li>Loss or damage arising from uninsurable risks such as scratching, wear and tear, mechanical or electrical fault or breakdown, misuse or domestic animals</li>
                                        <li>Loss or damage if the home is unoccupied for more than 60 consecutive days</li>
                                        <li>Personal Liability for travel out of Hong Kong exceeding 90 consecutive days</li>
                                        <li>Loss or damage due to war risks, radioactive risks, sonic bangs or any act of terrorism</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane" id="excess">
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
                        </div>
                        </div>  
                    </div>
                </div>
            </div>
            <p class="disclaimer">The features above are indicative only. Please refer to the <a href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/protect/household/easy-home-care.pdf" target="_blank">Product Brochure</a> for details. 
For a complete explanation of the terms and conditions, please call our Customer Hotline at<nobr> <a href="tel:31233123">3123 3123</a></nobr>.</p>

        </div>
        </form>
    </div>
    <div class="container-fluid summary-bottom-bar">
        <div class="summary-bottom-bar-container">
            <div class="row">
                <div class="col-xs-12 col-md-4 col-md-offset-2 promotion-wrapper">
                    <form action="">
                        <div class="lbl">
                            <label>Promotion Code</label> <a href="javascript:void(0);" class="link-how2-get" data-toggle="modal" data-target=".bs-promo-modal-lg" >How do I get promotion code?</a>
                        </div>
                        <div>
                            <input type="text" id="promoCode" name="referralCode" class=""><a href="javascript:void(0);" class="btn-promo-apply">Apply</a>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-4 theclub-wrapper">
                    <div class="checkbox">
                        <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="<%=request.getContextPath()%>/resources/images/easy-home/ico-the-club.png" alt=""><span>Member</span></a></label>
                    </div>
                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" disabled="disabled">
                    
                    
                </div>
                
                
            </div>
        </div>
    </div>
    <div class="app-pg-cont">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="btn-row text-center">
                        <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
                        <a href="javascript:void(0);" class="btn-app eh-btn-next grey-out" id="eh-select-plan-next">Next</a>
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
                            <h4>
                                Email address
                            </h4>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder=""
                                    name="emailToSendPromoCode" id="emailToSendPromoCode">
                                <input type="hidden" name="planCode" id="planCode"
                                    value="HOMECARE">
                            </div>
                            <span id="errPromoEmail" class="text-red"></span> <br>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    
                                    <button type="submit" onclick="return sendEmail()"
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


    <!-- Main Content End-->

    </div>

</div>
<script>
$("#eh-select-plan-next").on("click",function(){
	window.location = '<%=request.getContextPath()%>/${language}/home-liability-insurance/${nextPageFlow}';
});
</script>
