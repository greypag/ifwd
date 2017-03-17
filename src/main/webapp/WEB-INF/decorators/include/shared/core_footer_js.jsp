<% 
	/**********
	Vendor JS
	**********/
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.payment.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/locales/bootstrap-datepicker.zh-TW.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/numeral.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/jquery.countdown.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/savie-2016/material.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/common/fwd-utility.js"></script>

<% 
	/**********
	Page Specific Vendor JS
	**********/
%>

<% if(request.getRequestURI().indexOf("/flight-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/travel-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/overseas-study-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/working-holiday-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/household-insurance")>0) { %>
<% } %>

<%
if(request.getRequestURI().indexOf("/home-liability")>0 || 
	request.getRequestURI().indexOf("/easy-home-care")>0) {
%>
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.0.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-home/easyhome-app-uifn.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
<%
}
%>

<% if(request.getRequestURI().indexOf("/household-insurance/easy-home-care")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/household-insurance/home-liability")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/motor-insurance")>0) { %>
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>
<% } %>

<% if(request.getRequestURI().indexOf("/term-life-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/medical-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance/provie")>0) { %>
  <% if(request.getRequestURI().indexOf("/savings-insurance/provie/")==-1) { %>
<script src="<%=request.getContextPath()%>/resources/js/provie/dropdowns-enhancement.js"></script>
  <% } %>
<% } %>

<%
if(!(request.getRequestURI().endsWith("FNA/financial-needs-analysis") || request.getRequestURI().endsWith("FNA/review")
		 || request.getRequestURI().endsWith("FNA/product-recommendation"))) {
%>
<%
}
%>

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
<% if(request.getRequestURI().indexOf("/faq-detail")>0) { %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elasticlunr.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/faq.js"></script>
<% } %>
<% 
	/**********
	Custom JS
	**********/
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/gi-common.js"></script>
<!-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/custom.js"></script> -->
<!--script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/savie-2016/custom.js"></script-->

<script type="text/javascript">
	window.status = "Done";

	$(function() {
			
	    $('input, textarea').placeholder();
	    var winWidth = 575;
	    var winHeight = 575;
	    var winTop = (screen.height / 2) - (winHeight / 2);
	    var winLeft = (screen.width / 2) - (winWidth / 2);

		////Notification Start////
		var ieversion = msieversion();
		if(ieversion !=0 && ieversion <=9){
			show_stack_bar_top('error', '<fmt:message key="system.errorbox.ie.title" bundle="${msg}" />','<fmt:message key="system.errorbox.ie.content" bundle="${msg}" />');
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

