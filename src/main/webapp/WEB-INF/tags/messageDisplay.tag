<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ attribute name="key" required="true" %>
<%@ attribute name="bundle" required="true" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="provie" var="msg" />
<fmt:message key="${key}" bundle="${msg}" />(${key})<span data-type="content-key" styles="display:none;">${key}</span>
