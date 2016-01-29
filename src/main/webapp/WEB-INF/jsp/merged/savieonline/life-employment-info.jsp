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
employmentStatus:<input type="text" id="employmentStatus" name="employmentStatus" value="${lifeEmploymentInfo.employmentStatus }"/><br/>
natureOfBusiness:<input type="text" id="natureOfBusiness" name="natureOfBusiness" value="${lifeEmploymentInfo.natureOfBusiness }"/><br/>
occupation:<input type="text" id="occupation" name="occupation" value="${lifeEmploymentInfo.occupation }"/><br/>
employerName:<input type="text" id="employerName" name="employerName" value="${lifeEmploymentInfo.employerName }"/><br/>
monthlyPersonalIncome:<input type="text" id="monthlyPersonalIncome" name="monthlyPersonalIncome" value="${lifeEmploymentInfo.monthlyPersonalIncome }"/><br/>
education:<input type="text" id="education" name="education" value="${lifeEmploymentInfo.education }"/><br/>
amountOfOtherSourceOfIncome:<input type="text" id="amountOfOtherSourceOfIncome" name="amountOfOtherSourceOfIncome" value="${lifeEmploymentInfo.amountOfOtherSourceOfIncome }"/><br/>
amountOfLiquidAssets:<input type="text" id="amountOfLiquidAssets" name="amountOfLiquidAssets" value="${lifeEmploymentInfo.amountOfLiquidAssets }"/><br/>
<input type="button" id="nextPage" value="nextPage"/><br/>
<a href="#" class="et-app-sum-edit et-app-edit">save and continue later</a>
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
				  if('${backSummary}'=="Y"){
					  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow2}';
				  }
				  else{
					  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
				  }
			  }
		  }
     });
});
</script>