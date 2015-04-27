<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
	session.setAttribute("language", "tc");
	session.setAttribute("uiLocale", "zh-HK");
	response.sendRedirect(request.getContextPath() + "/tc/" + "home");
%>