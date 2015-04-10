<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%-- <%
	session.setAttribute("language", "EN");
	session.setAttribute("page", request.getServletPath());
%> --%>
<!DOCTYPE HTML>
<html>

<head>
<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<!-- Title -->
<title>${pageTitle}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<% boolean langFlag = false;
 if(session.getAttribute("language") != null){
	 langFlag = true;
 } else {
	 langFlag = false;
 }
%> 
<%@ include file="include/setup.jsp"%>
<dec:head />

</head>


	<%
		if (langFlag && "EN".equals(session.getAttribute("language").toString())) {
	%>
	<body>
	<%@ include file="include/header.jsp"%>
	<%
		} else {
	%>
	<body class="chin">
	<%@ include file="include/cn-header.jsp"%>
	<%
		}
	%>
	<dec:body />

	<%
		if (langFlag && "EN".equals(session.getAttribute("language").toString())) {
	%>
	<%@ include file="include/footer.jsp"%>
	<%
		} else {
	%>
	<%@ include file="include/cn-footer.jsp"%>
	<%
		}
	%>

	<script type="text/javascript">
		window.status = "Done";
	</script>



</body>
</html>
