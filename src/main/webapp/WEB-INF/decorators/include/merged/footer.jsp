<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!--mob bottom-->
<div class="footer-container">
    <div class="upper-footer-wrapper container">
	    <div class="bottom-contact-wrapper">
	        <div class="contact-label">
	           <a href="<fmt:message key="footer.menu.contactus.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.contactus" bundle="${msg}" /><i class="fa fa-caret-right" aria-hidden="true"></i></a><br/><br/>
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
	           <a href="<fmt:message key="footer.menu.support.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.support" bundle="${msg}" /></a>
	           <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a>
	           <a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a>	       
	       </div>
	       <div class="bottom-link">
	           <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.partner.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.partner" bundle="${msg}" /></a>      
	       </div>	       
	       <div class="clearfix"></div>	         
	    </div>
        <div class="social-link-wrapper">
           <div class="social-link">
	           <a id="fb-dialog-share" href="javascript:void(0);" onclick="return false;" target="_blank"><i class="fa fa-share-alt"></i></a>
	           <a href="<fmt:message key="footer.facebook.link" bundle="${msg}" />" target="_blank"><i class="fa fa-facebook-official"></i></a>
	           <a href="<fmt:message key="footer.youtube.link" bundle="${msg}" />" target="_blank"><i class="fa fa-youtube-play"></i></a>        
           </div>
           <div class="clearfix"></div>          
        </div>
        <div class="clearfix"></div>  	    	            
    </div>
    <div class="bottom-footer-wrapper">
        <div class="bottom-footer-link container">
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

<!-- Timeout Modal -->
<div id="timeout-modal" class="modal fade fwd-generic-modal timeout" role="dialog" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog">
      <div class="modal-content" align="center">
        <div class="modal-body form-container" style="color:#fc6d08">
           <div class="row">
              <h2><fmt:message key="error.timeout.message" bundle="${msg}" /></h2>  
           </div>
           <div class="row">
              <div class="col-lg-6 col-md-6 fwd-orange-btn-center-wrapper">
                 <button type="button" class="btn next bdr-curve btn btn-primary btn-lg wd5" id="timeout-btn" data-dismiss="modal"><fmt:message key="error.timeout.button" bundle="${msg}" /></button>
              </div>
           </div>
        </div>
     </div>
  </div>
</div>

<script>
$(function() {
    $('input, textarea').placeholder();
    var winWidth = 575;
    var winHeight = 575;
    var winTop = (screen.height / 2) - (winHeight / 2);
    var winLeft = (screen.width / 2) - (winWidth / 2);

    // Set fb Share meta
    var defaultOg = {
      'en': {
        'title': 'FWD | Hong Kong',
        'desc': 'Get a full range of travel, free flight and home insurance with FWD \✓24\/7 support \✓ \'A\' rated secure & stable financial strength \✓ Rewards & benefits',
        'url': 'https://i.fwd.com.hk/en',
        'img': 'https://i.fwd.com.hk/resources/images/slider/main_en.jpg' 
      }, 
      'tc': {
        'title': '獲取適合您的保障 | 富衛香港',
        'desc': '富衛保險是一間以香港為中心的保險公司，提供各種旅遊、家居及工作假期保險計劃。我們全天候24小時支援你的需要，並獲得國際評級機構授予多項卓越的財務實力評級，為您提供眾多優惠。',
        'url': 'https://i.fwd.com.hk/tc',
        'img': 'https://i.fwd.com.hk/resources/images/slider/main_cn.jpg'
      }
    }

    var ogTitle= $('meta[property="og:title"]').attr("content") || '';
    var ogDesc=$('meta[property="og:description"]').attr("content") || '';
    var ogUrl=$('meta[property="og:url"]').attr("content") || '';
    var ogImg=$('meta[property="og:image"]').attr("content") || '';

    ogTitle = (ogTitle=='')?defaultOg[UILANGUAGE]['title']:ogTitle;
    ogDesc = (ogDesc=='')?defaultOg[UILANGUAGE]['desc']:ogDesc;
    ogUrl = (ogUrl=='')?defaultOg[UILANGUAGE]['url']:ogUrl;
    ogImg = (ogImg=='')?defaultOg[UILANGUAGE]['img']:ogImg;

    $('#fb-dialog-share').click(function(e) {
    	window.open('http://www.facebook.com/sharer.php?s=100&p[title]=' + ogTitle + '&p[summary]=' + ogDesc + '&p[url]=' + ogUrl + '&p[images][0]=' + ogImg, 'sharer', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width=' + winWidth + ',height=' + winHeight);
    });
     
    /*
    function navbarLogoSticky(){
        if(window.pageYOffset<35){
            $('.navbar-fixed-top').css("top", -window.pageYOffset);
        }
        if(window.pageYOffset>=35){
            $('.navbar-fixed-top').css("top", -35);
        }
    }
    $(window).scroll(navbarLogoSticky);
    */
});

$('#timeout-btn').on('click', function(e) {
  window.location.href= contextPath+'/'+language;
});

</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/numeral.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>

<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<% 
if(request.getRequestURI().indexOf("/savings-insurance")>0) {
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/savie-online.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
<%
}
%> 
<%
if(request.getRequestURI().indexOf("/become-our-partner")>0) {
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
<%
}
%>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/material.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/pnotify.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/custom.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.countdown.min.js"></script>