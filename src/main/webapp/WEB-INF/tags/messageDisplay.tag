<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ attribute name="key" required="true" %>
<%@ attribute name="bundle" required="true" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="motor" var="msg" />
<%
	if (com.ifwd.fwdhk.controller.UserRestURIConstants.isContentEditable()) {
%><tag key=${key}><%
	}
%><fmt:message key="${key}" bundle="${msg}" /><%
	if (com.ifwd.fwdhk.controller.UserRestURIConstants.isContentEditable()) {
%></tag><%
	}
%>
