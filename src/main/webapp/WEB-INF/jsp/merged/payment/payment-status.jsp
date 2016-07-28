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
					<input type="hidden" id="appId" name="appId" value="" />
		merTradeNo: <input type="text" id="merTradeNo" name="merTradeNo" value="" size="100" />
					<input type="hidden" id="timestamp" name="timestamp" value="" />
					<input type="hidden" id="sign" name="sign" value="" />
	</form>
	
	<!-- <div id="statusDiv" style="display: none">
		resultCode:<input type="text" name="resultCode" id="resultCode" value="" size="100" /><br>
		message:<input type="text" name="message" id="message" value="" size="100" /><br>
		tradeNo:<input type="text" name="tradeNo" id="tradeNo" value="" size="100" /><br>
		tradeStatus:<input type="text" name="tradeStatus" id="tradeStatus" value="" size="100" /><br>
		sign:<input type="text" name="sign" id="resultSign" value="" size="100" />
	</div>
	<span id="responseMsg" class="empHide"></span> -->
	<br><br><p><input type="button" onclick="getPaymentStatus();" value="Search"/></p><br><br><br><br>
</div>
<script>
	function getPaymentStatus(){
		//$('#statusDiv').hide();
		//$('#responseMsg').hide();
		var merTradeNo = $('#merTradeNo').val();
		var method = "<%=request.getContextPath()%>/getPaymentStatus";
		$.ajax({
			type : "POST",
			url : method,
			data : {"merTradeNo":merTradeNo},
			success : function(data) {
				var str = JSON.stringify(data)
				//$('#responseMsg').html(str);
				$('#appId').val(data.appId);
				$('#timestamp').val(data.timestamp);
				$('#sign').val(data.sign);

				$('#paymentStatusForm').submit();
				
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

    
   