

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/numeral.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>

<script>
$(function() {
    $('input, textarea').placeholder();
    var winWidth = 575;
    var winHeight = 575;
    var winTop = (screen.height / 2) - (winHeight / 2);
    var winLeft = (screen.width / 2) - (winWidth / 2);

	////Notification Start////
	var ieversion = msieversion();
	if(ieversion !=0 && ieversion <=9){
		show_stack_bar_top('<fmt:message key="system.errorbox.ie.title" bundle="${msg}" />','<fmt:message key="system.errorbox.ie.content" bundle="${msg}" />');
	}
	////Notificaiton End////
});

function msieversion() {
	   var ua = window.navigator.userAgent
	   var msie = ua.indexOf ( "MSIE " )

	   if ( msie > 0 )      // If Internet Explorer, return version number
	      return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )))
	   else                 // If another browser, return 0
	      return 0
}

</script>

<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<%
if(request.getRequestURI().indexOf("/savings-insurance")>0) {
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/savie-online.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
<%
}
%>
<%
if(request.getRequestURI().indexOf("/become-our-partner")>0) {
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
<%
}
%>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/material.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/custom.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.countdown.min.js"></script>


<script type="text/javascript">
	window.status = "Done";
</script>