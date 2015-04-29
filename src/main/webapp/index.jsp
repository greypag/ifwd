<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
	session.setAttribute("language", UserRestURIConstants.LANG_TC);
	session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
	response.sendRedirect(request.getContextPath() + UserRestURIConstants.LANG_TC_SLASH + "home");
	// response.sendRedirect(request.getContextPath() + "/home");
%>