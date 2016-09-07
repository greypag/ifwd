<% 
	/**********
	Vendor JS
	**********/
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/jSignature.min.js"></script>

<!--[if IE]>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/es5-shim.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/classList.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie-2016/selectivizr-min.js"></script>
<![endif]-->

<% 
	/**********
	Page Specific JS
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

<% if(request.getRequestURI().indexOf("/household-insurance/easy-home-care")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/household-insurance/home-liability")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/motor-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/term-life-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/medical-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance/provie")>0) { %>
<script src="<%=request.getContextPath()%>/resources/js/provie/dropdowns-enhancement.js"></script>
<% } %>

<%
if(!(requestUri.endsWith("FNA/financial-needs-analysis") || requestUri.endsWith("FNA/review")
		 || requestUri.endsWith("FNA/product-recommendation"))) {
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<%
}
%>

<% 
	/**********
	Custom JS
	**********/
%>

<script type="text/javascript">
	window.status = "Loading: Document body...";
</script>

<script>

	// handle when console is null/undefined especially in IE
	if (typeof console == "undefined") {
		this.console = {
	    	log: function() {},
	    	info: function() {},
	    	error: function() {},
	    	warn: function() {}
	  	};
	}

	// global variables
	var UILANGUAGE = '<%=session.getAttribute("language")%>';

	UILANGUAGE = UILANGUAGE.toUpperCase();

	function centerModals($element) {
		var $modals;
		if ($element.length) {
		  $modals = $element;
		} else {
		  $modals = $('.modal-vcenter:visible');
		}
		$modals.each( function(i) {
		  var $clone = $(this).clone().css('display', 'block').appendTo('body');
		  var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
		  top = top > 0 ? top : 0;
		  $clone.remove();
		  $(this).find('.modal-content').css("margin-top", top);
		});
	}

</script>
