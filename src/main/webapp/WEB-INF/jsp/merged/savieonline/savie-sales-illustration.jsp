<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div align="center">
<h1 style="color: black;">savie-sales-illustration.jsp</h1>
<div id="errorMsg" style="color: red;"><c:if test="${pdfName == ''}">${errorMsg }</c:if></div>
<input type="button" value="${pdfName }→OK" onclick="acceptPdf('${pdfName}','${requestNo}')"/>
<input type="button" id="nextPage" value="next page"/><br/>
<iframe src="<%=request.getContextPath()%>/resources/pdf/${pdfName }" width="800" height="1200" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
});
</script>