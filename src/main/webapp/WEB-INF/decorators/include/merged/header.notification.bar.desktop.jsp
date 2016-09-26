<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header.notification.bar.desktop.jsp -->
<!-- <a href="<%=request.getContextPath()%>/${language}/important-notice" class="header-notification-box header-notification-msg-desktop"> -->
<div id="notification-bar-desktop" class="header-notification-box header-notification-box--desktop hide" >
    <button type="button" class="close" aria-label="Close">
        <span aria-hidden="true" onclick="closeNotificationBox()">&#215;</span>
    </button>
    <div class="container">
        <span id="notification-bar-content-desktop"></span>
    </div>
</div>
<!-- ./header.notification.bar.desktop.jsp -->
