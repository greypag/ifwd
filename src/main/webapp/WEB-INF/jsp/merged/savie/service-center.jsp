<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
	boolean isSaleActiveClass = true;
%>
<div align="left" style="margin-left: 300px">
    <div>
		CS center
		<select name=""  id="">
			<c:if test="${language == 'en'}">
			   <c:forEach var="list" items="${serviceCentreEN.result}">
			      <option value="${list.id }">${list.serviceCentreName }</option>
			   </c:forEach>
			</c:if>
			<c:if test="${language == 'tc'}">
			   <c:forEach var="list" items="${serviceCentreCN.result}">
			      <option value="${list.id }">${list.serviceCentreName }</option>
			   </c:forEach>
			</c:if>
		</select>
	</div>
	<div>
		Perferred date
		<input id="datepicker">
	</div>
	<div>
		Perferred time
		<select name=""  id="">
			<option value="15:00">15:00</option>
		</select>
	</div>
</div>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<script type="text/javascript">
var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
var endDate= new Date((new Date()).getTime() + 22*24*60*60*1000);
$('#datepicker').datepicker({
	startDate: startDate,
	endDate: endDate,
	autoclose: true,
	todayHighlight: true,
	format: "mm-dd-yyyy",
	daysOfWeekDisabled: [0],
});
</script>