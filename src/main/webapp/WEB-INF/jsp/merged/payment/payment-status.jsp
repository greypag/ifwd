<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:htmlEscape defaultHtmlEscape="true" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />

<div style="height: 100%">
	<form action="https://gateway.sandbox.tapngo.com.hk/paymentApi/payment/status" method="post" name="paymentStatusForm" id="paymentStatusForm"><br><br>
		<input type="hidden" name="appId" id="appId" value="${appId}" size="100"/><br>
		merTradeNo:<input type="text" name="merTradeNo" id="merTradeNo" value="" size="100" /><br>
		<input type="hidden" name="timestamp" id="timestamp" value="${timestamp}" size="100"/><br>
		<input type="hidden" name="sign" id="sign" value="" size="100"/>
	</form>
	
	<div id="statusDiv" style="display: none">
		resultCode:<input type="text" name="resultCode" id="resultCode" value="" size="100" /><br>
		message:<input type="text" name="message" id="message" value="" size="100" /><br>
		tradeNo:<input type="text" name="tradeNo" id="tradeNo" value="" size="100" /><br>
		tradeStatus:<input type="text" name="tradeStatus" id="tradeStatus" value="" size="100" /><br>
		sign:<input type="text" name="sign" id="resultSign" value="" size="100" />
	</div>
	
	<br><br><p><input type="button" onclick="getPaymentInfo();" value="Search"/></p><br><br><br><br>
</div>
<script>
	function getPaymentInfo(){
		$('#statusDiv').hide();
		var merTradeNo = $('#merTradeNo').val();
		var timestamp = $('#timestamp').val();
		var method = "<%=request.getContextPath()%>/getPaymentInfo";
		$.ajax({
			type : "POST",
			url : method,
			data : {"merTradeNo":merTradeNo,"timestamp":timestamp},
			success : function(data) {
					$('#sign').val(data);
					getStatus();
			}
		});
	}

	function getStatus(){
		var appId = $('#appId').val();
		var merTradeNo = $('#merTradeNo').val();
		var timestamp = $('#timestamp').val();
		var sign = $('#sign').val();

		/* $('#resultCode').val("0");
		$('#message').val("Request Success");
		$('#tradeNo').val("150423JHGgB");
		$('#tradeStatus').val("TRADE_FINISH");
		$('#resultSign').val(sign); */

		$('#statusDiv').show();
		
		var method = "https://gateway.sandbox.tapngo.com.hk/paymentApi/payment/status";
		$.ajax({
			type : "POST",
			url : method,
			data : {"appId":appId,"merTradeNo":merTradeNo,"timestamp":timestamp,"sign":sign},
			success : function(data) {
				$('#resultCode').val(data.resultCode);
				$('#message').val(data.message);
				$('#tradeNo').val(data.tradeNo);
				$('#tradeStatus').val(data.tradeStatus);
				$('#resultSign').val(data.sign);
			}
		});
	}

	
	function submitForm(){
		$('#paymentStatusForm').submit();
	}
</script>

    
   