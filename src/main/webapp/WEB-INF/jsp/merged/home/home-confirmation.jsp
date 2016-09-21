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
                        <h4></h4>
                        <p><fmt:message key="confirmation.home.text1" bundle="${msg}" /> ${plan == 'home-liability' ? language == 'en' ? 'Home Liability':'家居責任保險':language == 'en' ? 'Easy HomeCare':'易安心家居保' } <fmt:message key="confirmation.home.text1.suffix" bundle="${msg}" /> <strong class="toemail">${emailID}</strong> <fmt:message key="confirmation.home.text2" bundle="${msg}" /></p>
                        <div class="text-center">
                            <p class="span"><fmt:message key="label.reference.no" bundle="${msg}" /></p>
                            <p class="policy-num">${referenceNo}</p>
                        </div>
                    </div>
                </div>                    
            </div>

            <div class="row cont-block">
                <div class="col-xs-12 col-md-12">
                    <h4>
                        <c:if test="${planIndex == 'easy-home-care'}">
                            <fmt:message key="confirmation.home.text4" bundle="${msg}" />
                        </c:if>
                        <c:if test="${planIndex == 'home-liability'}">
                            <fmt:message key="confirmation.home.liability.text4" bundle="${msg}" />
                        </c:if>

                    </h4>
                    <div class="text-center share-panel">
                        <div class="text-center" id="toBeCopied" contenteditable="true">
                            <c:if test="${planIndex == 'easy-home-care'}">
                                <%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/household-insurance/easy-home-care?promo=<%=session.getAttribute("myHomeReferralCode")%>
                            </c:if>
                            <c:if test="${planIndex == 'home-liability'}">
                                <%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/household-insurance/home-liability
                            </c:if>
                        </div>
                        <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs">Press "Ctrl+c" to copy</span><span class="boxMessage hidden-md hidden-lg">Long press to copy</span> <span class="boxDownArrow"></span> </div>
                        <a href="javascript:void(0);" class="btn-app btn-copy" onclick="autoSelect('toBeCopied');"><fmt:message key="button.copy.link" bundle="${msg}" /></a>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <script>
                            var queryStr = '<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/${plan=="home-liability" ? "household-insurance/home-liability" : "household-insurance/easy-home-care"}';
                            <c:if test="${planIndex == 'easy-home-care'}">
                                queryStr+='?promo=<%=session.getAttribute("myHomeReferralCode")%>';
                            </c:if>
                        </script>
                        <a role="button" tabindex="1" class="btn-share" onclick="fbShare('share',queryStr,'','','')">
                        	<span class="icon-wrapper">
                        		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="icon" style="width: 60px; height: 60px;">
                        		<g><path d="M22 5.16c-.406-.054-1.806-.16-3.43-.16-3.4 0-5.733 1.825-5.733 5.17v2.882H9v3.913h3.837V27h4.604V16.965h3.823l.587-3.913h-4.41v-2.5c0-1.123.347-1.903 2.198-1.903H22V5.16z" fill-rule="evenodd"></path></g></svg>
                        	</span>
                  		</a>
                    </div>
                </div>

            </div>

            <div class="row cont-block">
                <div class="col-xs-12">
                    <h4><fmt:message key="confirmation.upsell1.label1" bundle="${msg}" /></h4>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like-travel.jpg" alt="" class="img-responsive">
                        <h5><fmt:message key="confirmation.upsell1.title" bundle="${msg}" /></h5>
                        <p><fmt:message key="confirmation.upsell1.description" bundle="${msg}" /></p>
                        <a href="<%=request.getContextPath()%>/${language}/travel-insurance" class="btn-app"><fmt:message key="button.get.quote" bundle="${msg}" /></a>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like-elite-term.jpg" alt="" class="img-responsive">
                        <c:if test="${planIndex == 'easy-home-care'}">
                        <h5><fmt:message key="confirmation.homecare.upsell2.title" bundle="${msg}" /></h5>
                        <p><fmt:message key="confirmation.homecare.upsell2.description" bundle="${msg}" /></p>
                        <a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="btn-app"><fmt:message key="button.get.quote" bundle="${msg}" /></a>
                        </c:if>
                        <c:if test="${planIndex == 'home-liability'}">
                        <h5><fmt:message key="confirmation.homeliability.upsell2.title" bundle="${msg}" /></h5>
                        <p><fmt:message key="confirmation.homeliability.upsell2.description" bundle="${msg}" /></p>
                        <a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="btn-app"><fmt:message key="button.get.quote" bundle="${msg}" /></a>
                        </c:if>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <c:if test="${planIndex == 'easy-home-care'}">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like-easy-health.jpg" alt="" class="img-responsive">
                        <h5><fmt:message key="confirmation.homecare.upsell3.title" bundle="${msg}" /></h5>
                        <p><fmt:message key="confirmation.homecare.upsell3.description" bundle="${msg}" /></p>
                        <a href="<%=request.getContextPath()%>/${language}/medical-insurance" class="btn-app"><fmt:message key="button.get.quote" bundle="${msg}" /></a>
                        </c:if>
                        <c:if test="${planIndex == 'home-liability'}">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like-easy-home.jpg" alt="" class="img-responsive">
                        <h5><fmt:message key="confirmation.homeliability.upsell3.title" bundle="${msg}" /></h5>
                        <p><fmt:message key="confirmation.homeliability.upsell3.description" bundle="${msg}" /></p>
                        <a href="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care" class="btn-app"><fmt:message key="button.get.quote" bundle="${msg}" /></a>
                        </c:if>
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
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/partner_logo_cfucome.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p><fmt:message key="confirmation.partner1.description.prefix" bundle="${msg}" /> <a href="<fmt:message key="confirmation.partner1.description.link" bundle="${msg}" />"><fmt:message key="confirmation.partner1.description.link.text" bundle="${msg}" /></a> <fmt:message key="confirmation.partner1.description.suffix" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/partner_logo_theclub.jpg" alt="" style="margin-bottom: 40px;">
                                </div>
                                <div class="cont-wrapper">
                                    <p><fmt:message key="confirmation.partner4.description.prefix" bundle="${msg}" /> <a href="<fmt:message key="confirmation.partner4.description.link" bundle="${msg}" />"><fmt:message key="confirmation.partner4.description.link.text" bundle="${msg}" /></a> <fmt:message key="confirmation.partner4.description.suffix" bundle="${msg}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <a href="<fmt:message key="confirmation.findoutmore.link" bundle="${msg}" />" class="btn-app"><fmt:message key="button.find.out.more" bundle="${msg}" /></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>
</div>
<script >
$.getScript("http://www.googletagmanager.com/gtm.js?id=GTM-MWPF25",function(){
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
	      'name': 'Home Liability', // Product name. Required
	      'category': 'Household', // Category or variation
	      'price': '${dueAmount}', // Unit price
	      'quantity': '2',
	      'currency': 'HKD'
	    });
	ga('ecommerce:send');
});
/* $(document).ready(function() {
	
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
	      'name': 'Home Liability', // Product name. Required
	      'category': 'Household', // Category or variation
	      'price': '${dueAmount}', // Unit price
	      'quantity': '2',
	      'currency': 'HKD'
	    });
	ga('ecommerce:send');
}); */

</script>
