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
<table style="width: 50%">
<tr align="center">
<td><a class="buy-now et-quote btn-color-ylw" href="#" >sign online</a></td>
<td><a id="nextPage2" class="buy-now et-quote btn-color-ylw" href="#" >Offline signature</a></td>
</tr>
<tr align="center">
<td>Fna</td>
<td>sales illustration
    <a id="reviewNow" class="buy-now et-quote btn-color-ylw" href="#" >Review now</a>
</td>
</tr>
<tr align="center">
<td></td>
<td></td>
</tr>
</table>
</div>

            <!-- show pdf modal -->
			<div class="modal fade" id="showPdfModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
					    <iframe src="<%=request.getContextPath()%>/resources/pdf/${pdfName }" width="800" height="600" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
					    <a id="showSign" class="buy-now et-quote btn-color-ylw" href="#" >Confirm and sign</a>
					</div>
				</div>
			</div>
			
<script type="text/javascript">
$("#nextPage").click(function(){
		window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
});
$("#nextPage2").click(function(){
	window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow2}';
});
$("#reviewNow").click(function(){
	$('#showPdfModal').modal({backdrop: 'static', keyboard: false});
	$('#showPdfModal').modal('show');
});
</script>