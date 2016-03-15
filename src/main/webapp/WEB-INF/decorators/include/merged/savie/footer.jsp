<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>	
	<!--mob bottom-->
	<div class="footer-container">
	    <div class="upper-footer-wrapper">
	        <div class="bottom-contact-wrapper">
	            <div class="contact-label">
	               <a href="<fmt:message key="footer.menu.contactus.link" bundle="${msg}" />" target="_blank">Contact us<i class="fa fa-caret-right" aria-hidden="true"></i></a><br/><br/>
	               <fmt:message key="footer.hotline.part1" bundle="${msg}" />
	            </div>
	            <a class="contact-number" href="tel:31233123"><fmt:message key="footer.hotline.part2" bundle="${msg}" /></a>
	        </div>
	        <div class="bottom-link-wrapper">
	           <div class="bottom-link">
	               <a href="<fmt:message key="footer.product.type1.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type1" bundle="${msg}" /></a>
	               <a href="<fmt:message key="footer.product.type2.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type2" bundle="${msg}" /></a>
	               <a href="<fmt:message key="footer.product.type3.link" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3" bundle="${msg}" /></a>           
	           </div>
	           <div class="bottom-link">
	               <a href="<fmt:message key="footer.menu.support.link" bundle="${msg}" />" target="_blank">Support & Claims</a>
	               <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a>
	               <a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a>        
	           </div>
	           <div class="clearfix"></div>          
	        </div>
	        <div class="social-link-wrapper">
	           <div class="social-link">
	               <a href="https://www.youtube.com/user/FWDHK " target="_blank"><i class="fa fa-share-alt"></i></a>
	               <a href="https://www.facebook.com/FWD.HK.MO" target="_blank"><i class="fa fa-facebook-official"></i></a>
	               <a href="https://www.youtube.com/user/FWDHK " target="_blank"><i class="fa fa-youtube-play"></i></a>        
	           </div>
	           <div class="clearfix"></div>          
	        </div>
	        <div class="clearfix"></div>                        
	    </div>
	    <div class="bottom-footer-wrapper">
	        <div class="bottom-footer-link">
	            <a href="<fmt:message key="footer.menu.security.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a> |
	            <a href="<fmt:message key="footer.menu.disclaimer.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a> |
	            <a href="<fmt:message key="footer.menu.privacy.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a>
	            <div class="copy-right"><fmt:message key="footer.copyright" bundle="${msg}" /></div>
	            <div class="clearfix"></div>
	        </div>   
	    </div>
	  <div>
	</div>
	<!--/mob bottom--> 
</footer>
<c:choose>
	<c:when test="${language=='en'}">
	   <!-- Start of LiveChat (www.livechatinc.com) code -->
		<script type="text/javascript">
		var __lc = {};
		__lc.license = 6320751;
		__lc.group = 1;
		(function() {
		var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
		lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
		})();
		</script>
		<!-- End of LiveChat code -->
	</c:when>
	<c:otherwise>
	   <!-- Start of LiveChat (www.livechatinc.com) code -->
		<script type="text/javascript">
		var __lc = {};
		__lc.license = 6320751;
		__lc.group = 2;
		(function() {
		var lc = document.createElement('script'); lc.type = 'text/javascript'; lc.async = true;
		lc.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'cdn.livechatinc.com/tracking.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(lc, s);
		})();
		</script>
		<!-- End of LiveChat code -->
	</c:otherwise>
</c:choose>
<script>
$(function() {
    function navbarLogoSticky(){
        if(window.pageYOffset<35){
            $('.navbar-fixed-top').css("top", -window.pageYOffset);
        }
        if(window.pageYOffset>=35){
            $('.navbar-fixed-top').css("top", -35);
        }
    }
    $(window).scroll(navbarLogoSticky);
});
</script>
<div class="overlay hidden hidden-xs hidden-sm" id="overlay"></div>