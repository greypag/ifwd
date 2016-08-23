<!-- header.notification.bar.desktop.jsp -->
<!-- <a href="<%=request.getContextPath()%>/${language}/important-notice" class="header-notification-box header-notification-msg-desktop"> -->
<div class="header-notification-box header-notification-box--desktop">
    <button type="button" class="close" aria-label="Close">
        <span aria-hidden="true" onclick="closeNotificationBox()">&#215;</span>
    </button>
    <div class="container">
        <span><fmt:message key="header.notification.msg" bundle="${msg}" /></span>
    </div>
</div>
<!-- ./header.notification.bar.desktop.jsp -->
