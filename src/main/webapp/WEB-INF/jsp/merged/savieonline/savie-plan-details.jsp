<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:include page="/WEB-INF/jsp/merged/login.jsp" />
<div style="margin-left: 500px;">
<div id="errorMsg" style="color: red;"></div>
<div id="apiData" style="color: black;"></div>
<form id="saviePlanDetailsForm" action="">
insuredAmount:<input type="text" id="insuredAmount" name="insuredAmount"/><br/>
dob:<input type="text" id="dob" name="dob"/><br/>
promoCode:<input type="text" id="promoCode" name="promoCode"/><br/>
<input type="button" id="calculate" value="Calculate"/>

<span id="username" data-userid="<%=session.getAttribute("username")%>"></span>
<button id="proceed" type="button" class="btn btn-orange proceed-btn hidden" onclick="goServiceCenter();"><fmt:message key="saviee.planoption.proceed" bundle="${msg}" /></button>
<button id="made-decision-next-btn" type="button" class="login-button">login</button>

            <!-- Thank you -->
			<div class="modal fade thank-you-modal" id="thankYouModal" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content thank-you-content">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.desktop" bundle="${msg}" />" class="img-responsive hidden-xs">
						<img src="<%=request.getContextPath()%><fmt:message key="savie.planDetails.thank.you.image.mobile" bundle="${msg}" />" class="img-responsive visible-xs">
						<button id="thank-you-continue" class="btn next" onclick="goServiceCenter();"><fmt:message key="savie.planDetails.thank.you.btn.text" bundle="${msg}" /></button>
					</div>
				</div>
			</div>
</form>

</div>
<script type="text/javascript">
$(function() {
	if($('#username').data('userid')!=null && $('#username').data('userid')!='*DIRECTGI' ) {
		$('#proceed').removeClass('hidden');
		$('#made-decision-next-btn').hide();
	}
});
$("#calculate").click(function(){
	$("#errorMsg").html("");
	$("#apiData").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savie-online/getSavieOnlinePlandetails",
		  data: $("#saviePlanDetailsForm").serialize(),
		  success : function(data) {
			  if(data != null && data.errorMsg != null && data.errorMsg != ""){
				  $("#errorMsg").html(data.errorMsg);
			  }
			  else{
				  $("#apiData").html(data.apiData);
			  }
		  }
     });
});

$("#made-decision-next-btn").on('click', function(){
	if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
		$('#thankYouModal').modal({backdrop: 'static', keyboard: false});
		$('#thankYouModal').modal('show');
	}
	else{
		$('#loginpopup').modal('show');
	}
});	
function goServiceCenter(){
	window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
};
</script>