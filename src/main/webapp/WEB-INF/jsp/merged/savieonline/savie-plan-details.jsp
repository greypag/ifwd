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
<div id="apiData" style="color: black;"></div>
insuredAmount:<input type="text" id="insuredAmount"/><br/>
dob:<input type="text" id="dob"/><br/>
promoCodes:<input type="text" id="promoCodes"/><br/>
<input type="button" id="calculate" value="Calculate"/>
<input type="button" id="nextPage" value="nextPage"/><br/>
</div>
<script type="text/javascript">
$("#calculate").click(function(){
	$("#errorMsg").html("");
	$("#apiData").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
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
				  $.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savie-online/plandetails/getData",
					  data : {
						  insuredAmount : $("#insuredAmount").val(),
						  dob : $("#dob").val(),
						  promoCode: $("#promoCodes").val()
						     },
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $("#errorMsg").html(data.errorMsg);
						  }
						  else{
							  $("#apiData").html(data.apiData);
						  }
					  }
			     });
			  }
		  }
     });
});
$("#nextPage").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
});

</script>