<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "<%=request.getContextPath()%>";
var plan="${plan}";
</script>

<div class="fwd-savie-wrapper">
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
     <div class="savie-online-container app-pg-ctnr" id="ehome-app-confirmation">
     <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div>
     <div class="app-pg-cont">
        <div class="container-fluid">
             <div class="row cont-block">
                <div class="col-xs-12 col-md-12">

                    <div class="thanks-panel">
                        <h4>Thank you!</h4>
                        <p><fmt:message key="confirmation.text1" bundle="${msg}" /> Easy HomeCare insurance <fmt:message key="confirmation.text1.suffix" bundle="${msg}" /> <strong class="toemail">${emailID}</strong> <fmt:message key="confirmation.text2" bundle="${msg}" /></p>
                        <div class="text-center">
                            <p class="span"><fmt:message key="confirmation.text3" bundle="${msg}" /></p>
                            <p class="policy-num">${referenceNo}</p>
                        </div>
                    </div>
                </div>                    
            </div>

            <div class="row cont-block">
                <div class="col-xs-12 col-md-12">
                    <h4><fmt:message key="confirmation.text4" bundle="${msg}" /></h4>
                    <div class="text-center share-panel">
                        
                        <div class="text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/${plan=="home-liability" ? "household-insurance/home-liability" : "household-insurance/easy-home-care"}?promo=<%=session.getAttribute("myHomeReferralCode")%></div>
                        <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs">Press "Ctrl+c" to copy</span><span class="boxMessage hidden-md hidden-lg">Long press to copy</span> <span class="boxDownArrow"></span> </div>
                        <a href="javascript:void(0);" class="btn-app btn-copy" onclick="autoSelect('toBeCopied');">Copy Link</a>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/en/home-insurance?promo=ECHOME" data-title="iFWD"></div>
                    </div>
                </div>

            </div>

            <div class="row cont-block">
                <div class="col-xs-12">
                    <h4>You maybe also like</h4>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like01.jpg" alt="" class="img-responsive">
                        <h5>TracelCare(Annual Cover)</h5>
                        <p>Embark on an adventure abroad with a comprehensive travel protection companion.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like02.jpg" alt="" class="img-responsive">
                        <h5>Easy HomeCare</h5>
                        <p>Protect your home for around HK$1 a day,against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like03.jpg" alt="" class="img-responsive">
                        <h5>Easy HomeCare</h5>
                        <p>Protect your home for around HK$1 a day,against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>
                    </div>
                </div>
            </div>

            <div class="row cont-block">
                <div class="col-xs-12">
                    <h4><fmt:message key="confirmation.text5" bundle="${msg}" /></h4>
                </div>
                <div class="col-xs-12 col-md-10 col-md-offset-1">
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-agoda.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>Enjoy 8% <a href="javascript:void(0);">Agoda</a> discount on all travel products upon successful registration of FWD online membership.</p>
                                </div>
                            </div>
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-y5.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>15% off pocket wifi rental with <a href="javascript:void(0);">Y5buddy</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-boconcept.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>Enjoy 5% discount from <a href="javascript:void(0);">BoConcept</a> when yo purchase an FWD Easy HomeCare insurance Plan.</p>
                                </div>
                            </div>
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-pricerite.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>HK$ 50 e-coupon from <a href="javascript:void(0);">Pricerite</a> for every successful referral.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <a href="javascript:void(0);" class="btn-app">Find out more</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
</div>
<!-- <script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type : "POST",
		url : contextPath + "/ajax/" + plan + "/finalizePolicy",
		async : false,
		success : function(data) {
			if (data.errMsgs == null) {
				console.log(data.errMsgs);
			} else {
				console.log(data.errMsgs);
			}
		}
	});
});
</script> -->