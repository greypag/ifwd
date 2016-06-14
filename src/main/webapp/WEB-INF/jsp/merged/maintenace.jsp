<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
</script>

<!--/#main-Content-->
<div class="" style="position:relative;background-color: #f68a1d;">

    <div align="center" style="background-color:#eee">
        <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/FWD_system_Maintenance_icon1b_trans.gif">
    </div>
    
    
    <div align="center" style="margin-top:50px;" >
        <h3 style="bold !important; font-weight: 900; font-size:36px;color:#fff;">
            <!-- System maintenance -->
            <fmt:message key="system.under.maintenance.notice" bundle="${msg}" /> 
        </h3>
    </div>
    
    
    <div align="center" style="margin-top:38px;" >
        <h3 style="font-size:16px;color:#fff;">
            <!-- Our site is currently undergoing scheduled maintenance. -->
            <fmt:message key="system.under.scheduled.maintenance" bundle="${msg}" />
            <br>
            <!-- Please try again later. For any further assistance, please call our 24-hour hotline. -->
            <fmt:message key="system.assistance.hotline.call" bundle="${msg}" /> 
        </h3>
    </div>
    
    <div align="center" style="margin-top:55px; margin-bottom:80px;position: relative;" >
        <a href="/" class="btn-box-2 color4 " style="padding-left:25px; padding-right:25px;width:200px;" ><fmt:message key="system.back.to.me" bundle="${msg}" /></a>
        <a href="/" class="btn-box-2 color4 " style="padding-left:25px; padding-right:25px;width:200px;background-color: #F7662B;position: absolute;left:50%;margin-left:-95px;top:5px;" ><fmt:message key="system.back.to.me" bundle="${msg}" /></a>
        <a href="/" class="btn-box-2 color4 " style="padding-left:25px; padding-right:25px;width:200px;background-color: #FBBA45;position: absolute;left:50%;margin-left:-100px;" ><fmt:message key="system.back.to.me" bundle="${msg}" /></a>
    </div>
    <div class="clearfix"></div>
    
</div>
<!--------/end- Main Content------------>
 