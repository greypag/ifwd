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
    <div class="upper-footer-wrapper">
	    <div class="bottom-contact-wrapper">
	        <div class="contact-label">
	           Contact us<i class="fa fa-caret-right" aria-hidden="true"></i><br/><br/>
	           <fmt:message key="footer.hotline.part1" bundle="${msg}" />
	        </div>
	        <a class="contact-number" href="tel:31233123"><fmt:message key="footer.hotline.part2" bundle="${msg}" /></a>
	    </div>
	    <div class="bottom-link-wrapper">
	       <div class="bottom-link">
	           <a href="" target="_blank"><fmt:message key="header.product.type1" bundle="${msg}" /></a>
	           <a href="" target="_blank"><fmt:message key="header.product.type2" bundle="${msg}" /></a>
	           <a href="" target="_blank"><fmt:message key="header.product.type3" bundle="${msg}" /></a>	       
	       </div>
	       <div class="bottom-link">
	           <a href="" target="_blank">Support & Claims</a>
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

$('#timeout-btn').on('click', function(e) {
  window.location.href= contextPath+'/'+language;
});

</script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
<!-- <script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jquery.isotope.min.js"></script> -->

<!-- <script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script> -->
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script> --%>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>  


<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/numeral.min.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>
