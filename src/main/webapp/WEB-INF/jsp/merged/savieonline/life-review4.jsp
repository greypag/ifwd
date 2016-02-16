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
<div id="fnaPdfDiv">
<iframe src="<%=request.getContextPath()%>/resources/pdf/${fnaPdfName }" width="800" height="300" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
<input type="button" id="fnaPdfBtn" value="fnaPdfBtn">
</div>
<div id="pdfDiv">
<iframe src="<%=request.getContextPath()%>/resources/pdf/${pdfName }" width="800" height="300" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
<input type="button" id="pdfBtn" value="pdfBtn">
</div>
<div id="policyPdfDiv">
<iframe src="<%=request.getContextPath()%>/resources/pdf/${policyPdfName }" width="800" height="300" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
<input type="button" id="policyPdfBtn" value="policyPdfBtn">
</div>
<div id="applicationFormPdfDiv">
<iframe src="<%=request.getContextPath()%>/resources/pdf/${applicationFormPdf }" width="800" height="300" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
<input type="button" id="applicationFormPdfBtn" value="applicationFormPdfBtn">
</div>
<table style="width: 50%">
<tr align="center">
<td><a id="nextPage" class="buy-now et-quote btn-color-ylw" href="#" >nextPage</a></td>
</tr>
</table>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#pdfDiv").hide();
	$("#policyPdfDiv").hide();
	$("#applicationFormPdfDiv").hide();
});
$("#fnaPdfBtn").click(function(){
	$("#fnaPdfDiv").hide();
	$("#pdfDiv").show();
	$("#policyPdfDiv").hide();
	$("#applicationFormPdfDiv").hide();
});
$("#pdfBtn").click(function(){
	$("#fnaPdfDiv").hide();
	$("#pdfDiv").hide();
	$("#policyPdfDiv").show();
	$("#applicationFormPdfDiv").hide();
});
$("#policyPdfBtn").click(function(){
	$("#fnaPdfDiv").hide();
	$("#pdfDiv").hide();
	$("#policyPdfDiv").hide();
	$("#applicationFormPdfDiv").show();
});
$("#applicationFormPdfBtn").click(function(){
	$("#fnaPdfDiv").show();
	$("#pdfDiv").hide();
	$("#policyPdfDiv").hide();
	$("#applicationFormPdfDiv").hide();
});

$("#nextPage").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
});
</script>