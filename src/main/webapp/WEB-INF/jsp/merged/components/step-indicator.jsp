<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div class="application-page-header et-header-browse">
   <div class="browse-container">
      <div class="row reset-margin hidden-xs hidden-sm">
        <ul class="common-steps-list six-steps nav nav-pills">
            <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">1</span><fmt:message key="stepindicator.selectplan" bundle="${msg}" /></button></li>
            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
            <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span><fmt:message key="stepindicator.application.summary.declaration" bundle="${msg}" /></button></li>
            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
            <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.sign" bundle="${msg}" /></button></li>
            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
            <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span><fmt:message key="stepindicator.payment" bundle="${msg}" /></button></li>
            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
            <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.upload.document" bundle="${msg}" /></button></li>
            <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
            <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.confirmation" bundle="${msg}" /></button></li>
         </ul>
     </div>
   </div>  
   <div class="et-mobile-header-info hidden-md hidden-lg">
      <div class="clearfix">
         <div class="et-back-arrow">
            <a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#" class="back-arrow-link">
               <span class="icon-arrow-left2 arrow-left"></span>
            </a>
         </div>
         <div class="et-header-tex">
            <h3 id="">簽署</h3>
         </div>
      </div>
      <span id="step-of">4 out of 5</span>
   </div>
</div>