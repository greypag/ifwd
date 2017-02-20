<!-- Bootstrap -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/sass/main_purify.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/header.css"> --%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> --%>
<%
	/**********
	Vendor CSS
	**********/
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css_dir/fwd_bootstrap.css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/animate.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/material.min.css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/savie/datepicker3.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.timepicker.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icomoon.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/pnotify.custom.min.css">

<%
	/**********
	Page Specific Vendor CSS
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery.jscrollpane.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<% } %>

<% if(request.getRequestURI().indexOf("/medical-insurance")>0) { %>
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance")>0) { %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap-slider.css">
<% } %>

<% if(request.getRequestURI().indexOf("/savings-insurance/provie")>0) { %>
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
<% if(request.getRequestURI().indexOf("/faq")>0) { %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css_dir/faq.css">
<% } %>
<% if(request.getRequestURI().indexOf("/faq-detail")>0) { %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css_dir/faq-detail.css">
<% } %>
<%
	/**********
	Custom CSS
	**********/
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/sass/main_purify.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css_dir/main.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/responsive.css" />
