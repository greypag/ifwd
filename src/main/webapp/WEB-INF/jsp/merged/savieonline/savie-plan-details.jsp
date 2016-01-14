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
<h1 style="color: black;">savie-plan-details.jsp</h1>
<div id="errorMsg" style="color: red;"></div>
<a id="nextPage" class="buy-now et-quote btn-color-ylw" href="#" >next page</a>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$.ajax({
		  type : "POST",
		  url : "<%=request.getContextPath()%>/ajax/savie-online/plandetails/validateForm",
		  data : {
			  insuredAmount : "123456",
			  dob : "1996/08-08",
			  promoCode: "123456a"
			     },
		  success : function(data) {
			  if(data != null && data != ""){
				  $("#errorMsg").html(data);
			  }
			  else{
				  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
			  }
		  }
     });
});
</script>