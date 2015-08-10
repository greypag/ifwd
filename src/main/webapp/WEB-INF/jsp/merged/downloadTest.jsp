<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">
	function download(){
		
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/${language}/fileDownload",
//			data : $(paymentFormId).serialize(),
			async : false,
			success : function(data) {
				
			}
		});
	}
	
</script>


<div>
	<!-- <button type="button" onclick="download()">download</button> -->
	<a href="<%=request.getContextPath()%>/${language}/fileDownload">download</a>
</div>