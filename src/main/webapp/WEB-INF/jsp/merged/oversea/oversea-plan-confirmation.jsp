<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item1" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item2" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item3" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="Overseas.PlanOptions.progressbar.item4" bundle="${msg}" /></div>
    </div>
</section>

<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
                    <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer1" bundle="${msg}" /></a> <i class="fa fa-chevron-right"></i></li>
                    <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer2" bundle="${msg}" /></a><i class="fa fa-chevron-right"></i></li>
                    <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer3" bundle="${msg}" /></a></li>                                  <!-- <fmt:message key="Overseas.Confirmation.breadcrumb" bundle="${msg}" /> -->
          <li class="active "><i class="fa fa-chevron-right"></i><fmt:message key="Overseas.Landing.Breadcrumb.step4" bundle="${msg}" /></li>
        </ol>

        
      <c:if test="false"><br><div id="confirm-error-msg" class="alert alert-danger hide" role="alert"></div><br></c:if>
        
        <div class="container pad-none bdr" style="margin-top:0px;">
          <div class="col-sm-12 pad-none confimration-msg-wrapper">
            <div style="width:80%;margin-left:10%">
				<h3 class="h2-3-existing-fwd-head summary-header summary-header-margin" style="margin-left:0px !important;"><fmt:message key="Overseas.Confirmation.Confirmation" bundle="${msg}" /></h3>
				<div class="summary-border">
					<h3 class="bmg-confirmation-h3">
						<fmt:message key="Overseas.Confirmation.Confirmation.Success1" bundle="${msg}" />
						<span class="email-addr-confirm"><fmt:message key="Overseas.Confirmation.Confirmation.Success2" bundle="${msg}" />${emailAddress}</span>
						<fmt:message key="Overseas.Confirmation.Confirmation.Success3" bundle="${msg}" />
						
					</h3>
					
					<h4 class="oversea-policy-no bmg-confirmation-h4"><strong><fmt:message key="Overseas.Confirmation.Confirmation.PolicyNo" bundle="${msg}" /></strong><span> ${policyNo}</span></h4>
				</div>
                <div class="clearfix"></div>
                <div class="h4-2"><fmt:message key="Overseas.Confirmation.Share" bundle="${msg}" /></div>
                <div class="col-md-7 col-sm-12 col-xs-12 pad-none">
                    <!--
                    <div class="oversea-link wht-bg1 text-center" id="toBeCopied" contenteditable="true"><fmt:message key="Overseas.Confirmation.Share.Link" bundle="${msg}" /></div>
                     -->
                    <div class="oversea-link wht-bg1 text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/overseas-study-insurance?promo=<%=session.getAttribute("myOverseaReferralCode")%></div>
                    <!-- 
                    <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs"><fmt:message key="Overseas.Confirmation.Share.Copy.CtrlC" bundle="${msg}" /></span><span class="boxMessage hidden-md hidden-lg">Long-press to copy</span> <span class="boxDownArrow"></span> </div>
                     -->
                    <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs"><fmt:message key="Overseas.Confirmation.Share.Copy.CtrlC" bundle="${msg}" /></span><span class="boxMessage hidden-md hidden-lg"><fmt:message key="Overseas.Confirmation.Share.Copy.LongPress" bundle="${msg}" /></span> <span class="boxDownArrow"></span> </div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12 pad-none"> 
                    <!-- <div class="copy-link pull-left" id="d_clip_button" title="" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">
                        Copy link
                    </div> -->
                    
                    <div class="copy-link pull-left" onclick="autoSelect('toBeCopied');">
                        <fmt:message key="Overseas.Confirmation.Share.Copy" bundle="${msg}" />
                    </div>
                    <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/overseas-study-insurance/sharing/?promo=<%=session.getAttribute("myOverseaReferralCode")%>" data-title="iFWD"></div>
                </div>
            </div>
            <div style="display:none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-40">
                <div style="width:80%;margin-left:10%">
              <h5 class="bmg-confirmation-h5">
                  <strong>Additional Offer - Use your promotion code:</strong><span>TRA123</span>
              </h5>
				
              <div class="h4-3-b margin-bottom-10" style="color: #f6871e;">
                You and your friend can use this promotion code to get discounts from online insurance purchases and from our partners!
                <!-- <span class="orange-star">*</span> -->
              </div>

              <!--Referral Code Table -->
                  
                    <div class="hidden-xs hidden-sm">
                        <table class="table table-bordred table-type-1 margin-bottom-10" style="width:100% !important;">
                            <tbody>
                                <tr>
                                    <td><strong>Promotion Type</strong></td>
                                    <td><strong>Product</strong></td>
                                    <td><strong>Offer</strong></td>
                                    <td><strong>Offer Period</strong></td>
                                </tr>
                                <tr>
                                    <td><strong>Promotion Code</strong></td>
                                    <td><strong>Travel Insurance (single trip)</strong></td>
                                    <td><strong>20% off</strong></td>
                                    <td><strong>Year-round</strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="hidden-md hidden-lg margin-bottom-10">
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong>Promotion Type</strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                Promotion Code
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong>Product</strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                Travel Insurance (single trip)
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong>Offer</strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                20% off
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong>Offer Period</strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                Year-round
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                    </div>
                         
              <!-- END Referral Code Table -->
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
		<div class="container pad-none oversea-promotion-wrapper">
			<div class="row-fluid">
				<h4 class="h2-3-existing-fwd-head summary-header summary-header-margin"><fmt:message key="Overseas.Confirmation.Upsell.sectiontitle" bundle="${msg}" /></h4> 							
				<div class="col-md-12 col-lg-12 text-left pad-none">
					<div class="summary-promotion-wrapper">
						<div class="col-md-3 col-lg-3 col-xs-12 col-sm-12 text-left summary-image-wrapper">
							<img class="oversea-desk-display" src="<%=request.getContextPath()%>/resources/images/oversea/travel_promotion.png" alt="">
							<img class="img-responsive oversea-mob-display" src="<%=request.getContextPath()%>/resources/images/oversea/travel_promotion_mob.png" alt=""> 							
						</div>						
						<div class="col-md-7 col-lg-8 col-xs-12 col-sm-12 h2-32 summary-text-wrapper">
							<strong><fmt:message key="Overseas.Confirmation.Upsell1.title" bundle="${msg}" /></strong>
							<br>
							<fmt:message key="Overseas.Confirmation.Upsell1.copy" bundle="${msg}" /><br>
							<a href="<%= request.getContextPath() %>/${language}/travel?product=annual" class="border-radius btn btn-primary  get-btn">
							<fmt:message key="Overseas.Confirmation.Upsell1.Quote" bundle="${msg}" /></a>
						</div>
						<div class="clearfix"></div>
					</div>																 
					<div class="summary-promotion-wrapper">
						<div class="col-md-3 col-lg-3 col-xs-12 col-sm-12 text-left summary-image-wrapper">
							<img class="oversea-desk-display" src="<%=request.getContextPath()%>/resources/images/oversea/home_promotion.png" alt="">
							<img class="img-responsive oversea-mob-display" src="<%=request.getContextPath()%>/resources/images/oversea/home_promotion_mob.png" alt=""> 
						</div>							
						<div class="col-md-7 col-lg-8 col-xs-12 col-sm-12 h2-32 summary-text-wrapper">
							<strong><fmt:message key="Overseas.Confirmation.Upsell2.title" bundle="${msg}" /></strong>
							<br>
							<fmt:message key="Overseas.Confirmation.Upsell2.copy" bundle="${msg}" /><br>
							<a href="<%= request.getContextPath() %>/${language}/home-insurance" class="border-radius btn btn-primary  get-btn">
							<fmt:message key="Overseas.Confirmation.Upsell2.Quote" bundle="${msg}" /></a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div> 
			</div>
		</div>         
        </form></div>
    </div>
    <!--/.row--> 
  <!--/.container-->
</section>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>

<link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/oversea.js"></script>
<script>
$(document).ready(function() {
  ga('create', 'UA-60032236-1', 'auto');
  ga('require', 'ecommerce');
  ga('ecommerce:addTransaction', {
    'id': '${transNo}', // Transaction ID. Required.
    'revenue': '${dueAmount}', // Grand Total.
    'affiliation': 'Protect', // Insurance type, e.g. Life
     'currency': 'HKD'
    });
  ga('ecommerce:addItem', {
      'id': '${transNo}', // Transaction ID. Required
      'name': 'Overseas Study', // Product name. Required
      'category': 'Travel', // Category or variation
      'price': '${dueAmount}', // Unit price
      'quantity': '1', // SUGGEST TO ADD NUMBER OF TRAVELLERS
      'currency': 'HKD'
    });
  ga('ecommerce:send');
});
</script>