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
    
    <!-- Breadcrumb Component Start-->

    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
    <c:set var="breadcrumbActive" value="0" />

    <c:if test="${planIndex == 'easy-home-care'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.easyhome,breadcrumb.item.confirmation
        </c:set>
        <c:set var="breadcrumbActive">4</c:set>
    </c:if>
    <c:if test="${planIndex == 'home-liability'}">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.household,breadcrumb.item.home.liability,breadcrumb.item.confirmation
        </c:set>
        <c:set var="breadcrumbActive">4</c:set>
    </c:if>

    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
        <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
        <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
    </jsp:include>

    <!-- Breadcrumb Component End-->

     <div class="savie-online-container app-pg-ctnr" id="ehome-app-confirmation">
     <div class="container-fluid fwd-full-container browse-holder">
        
     </div>
     <div class="app-pg-cont">
        <div class="container-fluid">
             <div class="row cont-block">
                <div class="col-xs-12 col-md-12">

                    <div class="thanks-panel">
                        
                        <p><fmt:message key="confirmation.home.text1" bundle="${msg}" /> Easy HomeCare insurance <fmt:message key="confirmation.home.text1.suffix" bundle="${msg}" /> <strong class="toemail">${emailID}</strong> <fmt:message key="confirmation.home.text2" bundle="${msg}" /></p>
                        <div class="text-center">
                            <p class="span"><fmt:message key="confirmation.home.text3" bundle="${msg}" /></p>
                            <p class="policy-num">${referenceNo}</p>
                        </div>
                    </div>
                </div>                    
            </div>

            <div class="row cont-block">
                <div class="col-xs-12 col-md-12">
                    <h4><fmt:message key="confirmation.home.text4" bundle="${msg}" /></h4>
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
                    <h4><fmt:message key="confirmation.home.text5" bundle="${msg}" /></h4>
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