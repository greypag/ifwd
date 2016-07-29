<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!--Footer-->
<div class="footer-container">
    <div class="footer-container__top-wrapper container">
	    <div class="footer-container__top-wrapper__contact">
	        <div class="footer-container__top-wrapper__contact__wrapper">
	           <a href="<fmt:message key="footer.menu.contactus.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.contactus" bundle="${msg}" />
              <i class="fa fa-caret-right" aria-hidden="true"></i>
              </a>
              <br/><br/>
	           <fmt:message key="footer.hotline.part1" bundle="${msg}" />
	        </div>
	        <a class="footer-container__top-wrapper__contact__number-wrapper" href="tel:31233123"><fmt:message key="footer.hotline.part2" bundle="${msg}" /></a>
	    </div>
	    <div class="footer-container__top-wrapper__link">
	       <div class="footer-container__top-wrapper__link__wrapper">
	           <a href="<fmt:message key="footer.product.type1.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type1" bundle="${msg}" /></a>
	           <a href="<fmt:message key="footer.product.type2.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type2" bundle="${msg}" /></a>
	           <a href="<fmt:message key="footer.product.type3.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3" bundle="${msg}" /></a>
	       </div>
	       <div class="footer-container__top-wrapper__link__wrapper">
	           <a href="<fmt:message key="footer.menu.support.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.support" bundle="${msg}" /></a>
	           <a id="faqProductLink" href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a>
	           <a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a>
	       </div>
	       <div class="footer-container__top-wrapper__link__wrapper">
	           <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.partner.link" bundle="${msg}" />"><fmt:message key="footer.menu.partner" bundle="${msg}" /></a>
	       </div>
	       <div class="clearfix"></div>
	    </div>
        <div class="footer-container__top-wrapper__social-link">
           <div class="footer-container__top-wrapper__social-link__wrapper">
	           <a id="fb-dialog-share" href="javascript:void(0);" onclick="return false;" target="_blank"><i class="fa fa-share-alt"></i></a>
	           <a href="<fmt:message key="footer.facebook.link" bundle="${msg}" />" target="_blank"><i class="fa fa-facebook-official"></i></a>
	           <a href="<fmt:message key="footer.youtube.link" bundle="${msg}" />" target="_blank"><i class="fa fa-youtube-play"></i></a>
           </div>
           <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="footer-container__btm-wrapper">
        <div class="footer-container__btm-wrapper__link container">
		    <a href="<fmt:message key="footer.menu.security.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a> |
		    <a href="<fmt:message key="footer.menu.disclaimer.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a> |
		    <a href="<fmt:message key="footer.menu.privacy.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a>
		    <div class="footer-container__btm-wrapper__link__copy-right"><fmt:message key="footer.copyright" bundle="${msg}" /></div>
		    <div class="clearfix"></div>
	    </div>
    </div>
  <div>
</div>
<!--End Footer-->
