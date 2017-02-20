<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/prettyPhoto.css" /> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-decorators.js"></script>

<%
if(request.getRequestURI().indexOf("/household-insurance")>0) {
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/easyhome-application.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-home/icon-font.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/titatoggle-dist-min.css">

<!--Mobiscroll css -->
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.animation.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.icons.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.android.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.android-holo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.ios-classic.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.ios.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.jqm.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.sense-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.frame.wp.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.android.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.android-holo.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.ios-classic.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.ios.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.jqm.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.sense-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.scroller.wp.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.image.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.android-holo-light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.wp-light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/resources/css/mobiscroll/mobiscroll.mobiscroll-dark.css" rel="stylesheet" type="text/css" />
<%
}
%>
<% if(request.getRequestURI().indexOf("/faq")>0) { %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css_dir/faq.css">
<% } %>
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
	
</script>
		