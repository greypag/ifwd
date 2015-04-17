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
          <li class="divider margin-left-none"><a href="http://www.fwd.com.hk" target="_blank"><fmt:message key="footer.menu.home" bundle="${msg}" /></a></li>
          <li  class="divider"><a href="http://www.fwd.com.hk/zh-HK/about/index.html" target="_blank"><fmt:message key="footer.menu.about" bundle="${msg}" /></a></li>
          <li><a href="http://blog.fwd.com.hk" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a></li>
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
<!--/#footer--> 
<!--/#bottom-->
<div class="bottom hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
      <div class="col-lg-7 col-md-7 pull-left pad-none">
        <ul class="nav nav-pills">
          <li><a href="http://www.fwd.com.hk/zh-HK/home/security.html" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/zh-HK/home/disclaimer.html" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a></li>
          <li> | </li>
          <li><a href="http://www.fwd.com.hk/zh-HK/home/pdo.html" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a></li>
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
<div class="hidden-lg hidden-md text-center">
  <div class="btn-box">
<!--      <h3 class="text-center marg-t"><a href="http://blog.fwd.com.hk" target="_blank">Blog</a></h3> -->
  </div>
   <p class="text-center mob-bottom"><fmt:message key="footer.copyright" bundle="${msg}" /></p>
</div>
<!--/mob bottom--> 


<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jquery.isotope.min.js"></script>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script> --%>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<%-- <script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/validation.js"></script> --%>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>

<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript"
  src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>



