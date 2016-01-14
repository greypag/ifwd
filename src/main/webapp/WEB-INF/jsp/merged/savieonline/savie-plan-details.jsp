<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div style="margin-left: 500px;">
<div id="errorMsg" style="color: red;"></div>
insuredAmount:<input type="text" id="insuredAmount"/><br/>
dob:<input type="text" id="dob"/><br/>
promoCodes:<input type="text" id="promoCodes"/><br/>
<input type="button" id="calculate" value="Calculate"/>
<input type="button" id="nextPage" value="nextPage"/><br/>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$.ajax({
		  type : "POST",
		  url : "<%=request.getContextPath()%>/ajax/savie-online/plandetails/validateForm",
		  data : {
			  insuredAmount : $("#insuredAmount").val(),
			  dob : $("#dob").val(),
			  promoCode: $("#promoCodes").val()
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