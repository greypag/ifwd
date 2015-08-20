<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
</script>
<%!
	boolean isSaleActiveClass = true;
%>
<div align="left" style="margin-left: 300px">
    <form method="post" id="serviceCenterForm">
	    <div>
			CS center
			<select name="csCenter" id="csCenter">
				<c:if test="${language == 'en'}">
				   <c:forEach var="list" items="${serviceCentreEN.serviceCentres}">
				      <option value="${list.serviceCentreCode }">${list.serviceCentreName }</option>
				   </c:forEach>
				</c:if>
				<c:if test="${language == 'tc'}">
				   <c:forEach var="list" items="${serviceCentreCN.serviceCentres}">
				      <option value="${list.serviceCentreCode }">${list.serviceCentreName }</option>
				   </c:forEach>
				</c:if>
			</select>
		</div>
		<div>
			Perferred date
			<input id="datepicker" name="perferredDate">
		</div>
		<div>
			Perferred time
			<select name="perferredTime" id="perferredTime">
				<option value="15:00">15:00</option>
			</select>
		</div>
		<div>
			<button type="submit" class="btn btn-white btn-sign-up" id="service_center_confrim">confrim</button>
		</div>
	</form>
</div>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>
<script type="text/javascript">
var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
var endDate= new Date((new Date()).getTime() + 22*24*60*60*1000);
$('#datepicker').datepicker({
	startDate: startDate,
	endDate: endDate,
	autoclose: true,
	format: "mm-dd-yyyy",
	daysOfWeekDisabled: [0],
}).on('changeDate', function (ev) {
	if($("#csCenter").val().trim() != "" && $("#datepicker").val().trim() != ""){
		getTimeSlot();
	}
});
</script>