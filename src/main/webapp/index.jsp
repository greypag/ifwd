<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.sendRedirect(request.getContextPath() + "/" + UserRestURIConstants.checkLangSetPage(request) + "/" + "home");%>