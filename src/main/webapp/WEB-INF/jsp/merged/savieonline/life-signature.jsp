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
<td><a id="showSign" class="buy-now et-quote btn-color-ylw" href="#" >sign online</a></td>
<td><a id="nextPage2" class="buy-now et-quote btn-color-ylw" href="#" >Offline signature</a></td>
</tr>
</table>
</div>
			<!-- sign div modal -->
			<div class="modal fade" id="showSignModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div align="center" class="modal-content thank-you-content">
					    <div style="width: 500px;height: 200px;">sign here</div>
					    <a id="nextPage" class="buy-now et-quote btn-color-ylw" href="#" >Confirm</a>
					</div>
				</div>
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
	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
});
$("#nextPage2").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}';
});
$("#showSign").click(function(){
	$('#showSignModal').modal({backdrop: 'static', keyboard: false});
	$('#showSignModal').modal('show');
});
</script>