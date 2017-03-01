<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id="footer" class="midnight-blue hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 pad-none">
        <ul class="pull-left foot-links">
          <li class="divider margin-left-none"><a href="<fmt:message key="footer.menu.home.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.home" bundle="${msg}" /></a></li>
          <li  class="divider"><a href="<fmt:message key="header.menu.about.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.about" bundle="${msg}" /></a></li>
          <li  class="divider"><a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a></li>
          <li  class="divider"><a id="faqProductLink" href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a></li>
          <li><a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.partners.link" bundle="${msg}" />"><fmt:message key="footer.menu.partners" bundle="${msg}" /></a></li>
        </ul>
      </div>
      <div class="col-sm-5 col-lg-4 pull-right">
        <div class="social">
          <ul class="social-share pull-left text-right">
        <li><a href="https://www.facebook.com/FWD.HK.MO" target="_blank"><i class="fa fa-facebook"></i></a></li>
            <li><a href="https://www.youtube.com/user/FWDHK " target="_blank"><i class="fa fa-youtube"></i></a></li>
          </ul>
          <div class="hotline pull-right text-left">
             <h5 class="text-white"><fmt:message key="footer.hotline.part1" bundle="${msg}" /></h5>
            <a class="hotline-num"> <fmt:message key="footer.hotline.part2" bundle="${msg}" /></a> </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </div>
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
<!--/#footer--> 
<!--/#bottom-->
<div class="bottom hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-7 pull-left pad-none">
        <ul class="nav nav-pills">
          <li><a href="<fmt:message key="footer.menu.security.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a></li>
          <li> | </li>
          <li><a href="<fmt:message key="footer.menu.disclaimer.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a></li>
          <li> | </li>
          <li><a href="<fmt:message key="footer.menu.privacy.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a></li>
        </ul>
      </div>
    <!-- issue 50 - vincent (pccw) -->
      <div class="col-lg-5 col-md-5 pull-right text-right">
        <p> <fmt:message key="footer.copyright" bundle="${msg}" /></p>
      </div>
    
    </div>
  </div>
</div>
<!--/#bottom--> 
<!--mob bottom-->
<div id="mob-footer" class="hidden-lg hidden-md mob-bottom">
    <div>
        <a href="<fmt:message key="footer.menu.home.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.home" bundle="${msg}" /></a> |
        <a href="<fmt:message key="header.menu.about.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.about" bundle="${msg}" /></a> |
        <a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a> |
        <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a> |
        <a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.partners.link" bundle="${msg}" />"><fmt:message key="footer.menu.partners" bundle="${msg}" /></a>
    </div>
    <div>
        <fmt:message key="footer.hotline.part1" bundle="${msg}" /> <fmt:message key="footer.hotline.part2" bundle="${msg}" />
    </div>
  <div>
<!--      <h3 class="text-center marg-t"><a href="http://blog.fwd.com.hk" target="_blank">Blog</a></h3> -->
    <a href="<fmt:message key="footer.menu.security.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a> |
    <a href="<fmt:message key="footer.menu.disclaimer.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a> |
    <a href="<fmt:message key="footer.menu.privacy.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a>
  </div>
  <div id="mob-footer-terms"><fmt:message key="footer.copyright" bundle="${msg}" /></div>
  
  
   <!-- <p class="text-center mob-bottom"><fmt:message key="footer.copyright" bundle="${msg}" /></p> -->
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
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/html5shiv.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/numeral.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script> --%>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.i18n.properties-min-1.0.9.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/numeral.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/savie-online.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/bootstrap-slider.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/material.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/pnotify.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/bootstrap-slider.js"></script>
