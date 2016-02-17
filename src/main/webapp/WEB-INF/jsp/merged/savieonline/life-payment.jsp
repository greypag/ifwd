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
<form id="lifePaymentForm" action="">
<input type="radio" id="payOnline" name="payOnline" value="0"/>pay online
<input type="radio" id="payOffline" name="payOnline" value="1"/>pay later<br/>
bankCode:
<select class="form-control gray-dropdown" name="bankCode" id="bankCode" onchange="getBranchCode(this.value,'${language }');"> 
	<option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
	<c:if test="${language == 'en'}">
		<c:forEach var="list" items="${bankCodeEN}">
			<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.bankCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
		</c:forEach>
	</c:if>
	<c:if test="${language == 'tc'}">
		<c:forEach var="list" items="${bankCodeCN}">
			<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.bankCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
		</c:forEach>
	</c:if>
</select><br/>
branchCode:
<select class="form-control gray-dropdown" name="branchCode" id="branchCode">
	<option value=""><fmt:message key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
	<c:if test="${language == 'en'}">
		<c:forEach var="list" items="${branchCodeEN}">
			<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
		</c:forEach>
	</c:if>
	<c:if test="${language == 'tc'}">
		<c:forEach var="list" items="${branchCodeCN}">
			<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
		</c:forEach>
	</c:if>
</select><br/>
accountNumber:<input type="text" id="accountNumber" name="accountNumber" value="${lifePayment.accountNumber }"/><br/>
accountHolderName:<input type="text" id="accountHolderName" name="accountHolderName" value="${lifePayment.accountHolderName }"/><br/>
paymentAmount:<input type="text" id="paymentAmount" name="paymentAmount" value="${lifePayment.paymentAmount }"/><br/>
<input type="button" id="nextPage" value="nextPage"/><br/>
<a href="#" class="et-app-sum-edit et-app-edit">save and continue later</a>
</form>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	if($('input[name="payOnline"]:checked ').val() == "1"){
		window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow2}';
	}
	else{
		$("#errorMsg").html("");
		$.ajax({
			  type : "POST",
			  async:false, 
			  url : "<%=request.getContextPath()%>/ajax/savie-online/lifePayment",
			  data: $("#lifePaymentForm").serialize(),
			  success : function(data) {
				  if(data != null && data.errorMsg != null && data.errorMsg != ""){
					  $("#errorMsg").html(data.errorMsg);
				  }
				  else{
					  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
				  }
			  }
	     });
	}
});

function getBranchCode(value,language) {
	$.get('<%=request.getContextPath()%>/ajax/savie-online/getBranchCode',
	{ 
		value : value,
		language : language
	},
	function(data) {
		$("#branchCode").empty();
		if(data != null){
			for(var i = 0; i < data.length; i++) {
				$("#branchCode").append("<option value='"+data[i].itemCode+"-"+data[i].itemDesc+"'>"+data[i].itemDesc+"</option>");
			}
		}
	})
	.fail(function(data) {
	});
}
</script>