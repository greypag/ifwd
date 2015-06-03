<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
	String sessionLang = (String)session.getAttribute("language");
	if (sessionLang == null) {
		session.setAttribute("language", UserRestURIConstants.LANG_TC);
		session.setAttribute("uiLocale", UserRestURIConstants.UILOCALE_TC);
		
	}
	
	response.sendRedirect(request.getContextPath() + "/" + session.getAttribute("language") + "/home");
	// response.sendRedirect(request.getContextPath() + "/home");
%>