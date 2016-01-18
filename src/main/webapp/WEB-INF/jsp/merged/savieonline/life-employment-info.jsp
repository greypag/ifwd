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
<form id="lifeEmploymentInfoForm" action="">
employmentStatus:<input type="text" id="employmentStatus" name="employmentStatus"/><br/>
natureOfBusiness:<input type="text" id="natureOfBusiness" name="natureOfBusiness"/><br/>
occupation:<input type="text" id="occupation" name="occupation"/><br/>
employerName:<input type="text" id="employerName" name="employerName"/><br/>
monthlyPersonalIncome:<input type="text" id="monthlyPersonalIncome" name="monthlyPersonalIncome"/><br/>
education:<input type="text" id="education" name="education"/><br/>
amountOfOtherSourceOfIncome:<input type="text" id="amountOfOtherSourceOfIncome" name="amountOfOtherSourceOfIncome"/><br/>
amountOfLiquidAssets:<input type="text" id="amountOfLiquidAssets" name="amountOfLiquidAssets"/><br/>
<input type="button" id="nextPage" value="nextPage"/><br/>
</form>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savie-online/lifeEmploymentInfo",
		  data: $("#lifeEmploymentInfoForm").serialize(),
		  success : function(data) {
			  if(data != null && data.errorMsg != null && data.errorMsg != ""){
				  $("#errorMsg").html(data.errorMsg);
			  }
			  else{
				  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
			  }
		  }
     });
});
</script>