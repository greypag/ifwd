<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
function testPaymentStatus(){
	var result = false;
	//var paymentFormId = '#' + paymentFormId;
	var method = "<%=request.getContextPath()%>/testPaymentStatus";
	$.ajax({
		type : "POST",
		url : method,
		//data : $(paymentFormId).serialize(),
		async : false,
		success : function(data) {
			console.log(data)
		}
	});
	return result;
}
</script>

<section id="main-slider" class="no-margin"> 
<div class="carousel slide hidden-xs hidden-sm">
	<div class="carousel-inner">
		<div class="item active" style="TEXT-ALIGN: center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;">
			<button style="height:70px;" type="button" onclick="testPaymentStatus();" class="border-radius btn btn-primary get-btn ">TEST</button>
		</div>
	</div>
</div>
</section>

