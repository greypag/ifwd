<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />



<section id="main-slider" class="no-margin"> 
<div class="carousel slide hidden-xs hidden-sm">
	<div class="carousel-inner">
		<div class="item active" style="TEXT-ALIGN: center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;">
			<div class="border-radius btn btn-primary get-btn ">${result }</div>
		</div>
	</div>
</div>
</section>

