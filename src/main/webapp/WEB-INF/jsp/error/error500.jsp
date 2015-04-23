<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>
<script>
function submitLoginForm() {
$('#ajax-loading').show();
$('#login-err-msg').html("");
$('#login-err-msg').hide();
if (validUser()) {
$.ajax({
type : "POST",
url : "<%=request.getContextPath()%>/userLogin",
data : $("#headerLoginForm form").serialize(),
async : false,
success : function(data) {
$('#ajax-loading').hide();
if (data == 'success') {
$('#ajax-loading').hide();
var Backlen = history.length;
history.go(-Backlen);
window.location.href = "<%=request.getContextPath()%>/getAccByUsernaneAndPassword";
} else if (data == 'fail') {
$('#ajax-loading').hide();
$('#login-err-msg').show();
$('#login-err-msg').html(
'Please Check Login Credential');
} else {
$('#ajax-loading').hide();
$('#login-err-msg').show();
$('#login-err-msg').html(data);
}

},
error : function() {
$('#ajax-loading').hide();
}
});
}
$('#ajax-loading').hide();
return false;
}
</script>

<!-- Session is alive or not -->
<%
session = request.getSession();
UserDetails user = new UserDetails();
if (session.getAttribute("userDetails") != null) {
user = (UserDetails) session.getAttribute("userDetails");
}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/animate.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/prettyPhoto.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jasny-bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/datepicker.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<!--desktop header-->
<header id="header" class="hidden-xs hidden-sm">
<div class="top-bar">
<div class="container ">
<div class="row">
<div class="col-lg-5 col-md-5 pad-none">
<div class="top-number">
<span> 24-HOUR HOTLINE 3123 3123</span>
</div>
</div>
<div class="col-lg-7 col-md-7">
<div
class="collapse navbar-collapse navbar-right top-menu pad-none"
id="headerLoginForm">

<ul class="nav navbar-nav">
<li class="active"><a href="<%=request.getContextPath()%>/home">HOME</a></li>
<li><a>|</a></li>
<li><a href="#"
target="_blank">ABOUT</a></li>
<li><a>|</a></li>
<li><a href="joinus">JOIN US</a></li>
<li><a>|</a></li>
<li><a href="#"></a></li>

<%
if (session.getAttribute("authenticate") == null ) {
%>
<li class="dropdown login-btn margin-left1" id="myDropdown">
<a href="#" class="dropdown-toggle" id="fwd-login"
data-toggle="dropdown">LOGIN <i class="fa fa-caret-right"></i>
</a>
<div class="dropdown-menu drop-width">
<form name="loginform" id="loginform">
<div class="login-form">
<div
style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
id="ajax-loading">
<img
style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
src="resources/images/ajax-loader.gif">
</div>
<div id="login-err-msg" class="alert alert-danger"
role="alert" style="display: none;"></div>
<div class="form-container">
<h2>Log in to FWD</h2>
<h4>
Username <a href="forgotUserName"
class="pull-right sub-link">Forgot username?</a>
</h4>

<div class="form-group">
<input type="text" name="userName" class="form-control"
placeholder="" id="headerUserName">
</div>
<span id="errUserName" style="color: red"></span>
<h4>
Password <a href="forgotPassword"
class="pull-right sub-link">Forgot password?</a>
</h4>
<div class="form-group">
<input type="password" name="password" class="form-control"
id="headerPassword">
</div>
<span id="errPass" style="color: red"></span> <br>
<div class="row">
<div class="col-lg-6 col-md-6">
<button type="button" onclick="return submitLoginForm();"
class="bdr-curve btn btn-primary btn-lg wd5">Log
In</button>
</div>
<h3
class="text-left col-lg-6 col-md-6 pad-none margin-none">
<span> New Member?</span><br> <a href="joinus">
Register here</a>
</h3>
<div class="clearfix"></div>
</div>
<p>For the purpose of purchasing a specified insurance
plan through this website (“the Plan”), I hereby consent
the transfer of my personal data from FWD eServices to the
issuer of the Plan.</p>
</div>
</div>
</form>
</div>
</li>
<%
}else if(!"true".equals(session
.getAttribute("authenticate").toString())){
%>
<li class="dropdown login-btn margin-left1" id="myDropdown">
<a href="#" class="dropdown-toggle" id="fwd-login"
data-toggle="dropdown">LOGIN <i class="fa fa-caret-right"></i>
</a>
<div class="dropdown-menu drop-width">
<form name="loginform" id="loginform">
<div class="login-form">
<div
style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
id="ajax-loading">
<img
style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
src="resources/images/ajax-loader.gif">
</div>
<div id="login-err-msg" class="alert alert-danger"
role="alert" style="display: none;"></div>
<div class="form-container">
<h2>Log in to FWD</h2>
<h4>
Username <a href="forgotUserName"
class="pull-right sub-link">Forgot username?</a>
</h4>

<div class="form-group">
<input type="text" name="userName" class="form-control"
placeholder="" id="headerUserName">
</div>
<span id="errUserName" style="color: red"></span>
<h4>
Password <a href="forgotPassword"
class="pull-right sub-link">Forgot password?</a>
</h4>
<div class="form-group">
<input type="password" name="password" class="form-control"
id="headerPassword">
</div>
<span id="errPass" style="color: red"></span> <br>
<div class="row">
<div class="col-lg-6 col-md-6">
<button type="button" onclick="return submitLoginForm();"
class="bdr-curve btn btn-primary btn-lg wd5">Log
In</button>
</div>
<h3
class="text-left col-lg-6 col-md-6 pad-none margin-none">
<span> New Member?</span><br> <a href="joinus">
Register here</a>
</h3>
<div class="clearfix"></div>
</div>
<p>For the purpose of purchasing a specified insurance
plan through this website (“the Plan”), I hereby consent
the transfer of my personal data from FWD eServices to the
issuer of the Plan.</p>
</div>
</div>
</form>
</div>
</li>
<%
}else{%>
<li class="dropdown logout-btn margin-left1" id="myDropdown">
<a href="#" class="dropdown-toggle" id="fwd-login"
data-toggle="dropdown">Welcome <%=session.getAttribute("username")%> <i
class="fa fa-caret-right"></i>
</a>
<div class="dropdown-menu drop-width">
<ul>
<% if(!"direct".equalsIgnoreCase(request.getSession()
.getAttribute("authenticate").toString())){ %>
<li><a href="<%=request.getContextPath()%>/getAccByUsernaneAndPassword" class="color1">
Manage User Account</a></li>
<%} %>
<li><a href="<%=request.getContextPath()%>/userLogout" class="color1">Log Out</a></li>
</ul>
</div>
</li>
<% }
%>

<li class="chatnow-btn"><a href="#"
onClick="zopim_chat_start()">CHAT NOW</a></li>
</ul>
</div>
</div>
</div>
</div>
<!--/.container-->
</div>
<!--/.top-bar-->
<% 
String actionName = "";
if(request.getAttribute("controller")!=null){
actionName =  request.getAttribute("controller").toString();
}
%>

<nav class="navbar navbar-inverse">
<div class="container pad-none">
<div class="navbar-header">
<a class="navbar-brand" href="index.html"><img
src="<%=request.getContextPath()%>/resources/images/logo.jpg" alt="logo"></a>
</div>
<div class="col-lg-6 col-md-6 pull-right">
<ul class="maintabs">
<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Flight")){ %> active" <%} %>"><a
href="flight" class="travel-special"><span class="offer">Special Offer</span><br>Flight
Insurance </a></li>
<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("Travel")){ %> active" <%} %>"><a
href="travel" class="travel-and-home-tab"> Travel Insurance</a></li>
<li class="col-lg-4 col-md-4 pad-none main-tab <% if(actionName.equals("homecare")){ %> active" <%} %>"><a
class="travel-and-home-tab" href="homecare"> Home Insurance</a></li>
</ul>
</div>
</div>
<!--/.container-->
</nav>
<!--/nav-->

</header>
<!--End-Desktop-header-->

<!--Mobile-header-->
<div class="mob-header hidden-lg hidden-md pad-none">
<div class="mob-topbar">
<span class="callus">24-HOUR HOTLINE 3123 3123 </span> <a href="#"
onClick="zopim_chat_start()"><span class="chat pull-right">Chat
Now</span></a> <a href="flightCN/flight-cn.html" class="lang pull-right"></a>
<div class="clearfix"></div>
</div>
<div class="logobox">
<div class="navbar-header">
<button type="button"
class="navbar-toggle pull-right col-xs-1 col-sm-1"
data-toggle="offcanvas" data-target=".navmenu" data-canvas="body">
<span class="sr-only">Toggle navigation</span> <span
class="icon-bar"></span> <span class="icon-bar"></span> <span
class="icon-bar"></span>
</button>
<a class="navbar-brand pull-left col-xs-8 col-sm-8" href="index.html"><img
src="<%=request.getContextPath()%>/resources/images/logo.jpg" alt="logo" class="img-responsive"></a>
<div class="clearfix"></div>
</div>
</div>
</div>

<!--Mobile side-menu-->
<div class="navmenu navmenu-default navmenu-fixed-right offcanvas"
style="">
<div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">
<a href="#" class="dropdown-toggle color-wht log-to-acc" id="fwd-login-mob"  data-toggle="dropdown"><i class="fa fa-lock"></i> Login to account  </a>





<div class="dropdown-menu drop-width">
<div class="moblogin">
<div class="form-container text-left">


<a href="#" class="pull-right sub-link">Forgot username?</a>
<h4>Username or email</h4>


<div class="form-group">
<input type="text" class="form-control" placeholder="">
</div>
<div class="clearfix"></div>

<a href="#" class="pull-right sub-link">Forgot password?</a>
<h4>Password</h4>


<div class="form-group">
<input type="text"  type="password" class="form-control">
</div>
<br>

<div class="col-xs-5 col-sm-5 pad-none">


<a class="bdr-curve btn btn-primary btn-lg btn-block" href="#" onclick="return validUser()"> Log In </a>
</div>
<h3 class="text-left col-xs-7 col-sm-7 margin-none"> <span> New user?</span><br>
<a href="joinus"> Register here</a> 

</h3>
<div class="clearfix"></div>
<!-- <div class="col-xs-10 col-sm-12 pad-none descli">
For the purpose of purchasing a specified insurance plan through this website ("the Plan"), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.
</div> -->
<div class="clearfix"></div>
</div>
<div class="clearfix"></div>



</div>
</div>
</div>
<ul class="nav navmenu-nav sidepanel-menu">
<li><a href="home">Home</a></li>
<li class="<% if(actionName.equals("Flight")){ %> active" <%} %>"><span class="offer"> SPECIAL OFFER</span> <a
href="<%=request.getContextPath()%>/flight-insurance">Flight Insurance</a></li>
<li class="<% if(actionName.equals("Travel")){ %> active" <%} %>"><a href="travel">Travel Insurance</a></li>
<li class="<% if(actionName.equals("homecare")){ %> active" <%} %>"><a href="homecare">Home Insurance</a></li>
</ul>
</div>
<!--End Mobile header-->
<!--/header-->
 <body>
   <!-- <div class="annexure-form " >
      <div class="annexure-form-header">
        ERROR 
      </div>
      <div class="form-horizontal company form-regisration">
        <div class="col-sm-12 error">
          <div class="division">
          </div>
          <p>
            ERROR No. 500
          </p>
          <div class="division">
          </div>
          <p>
            The following error was encountered:
            <br>
            500 Internal Server Error 
            <br>
            &bull;500 Internal Server Error is a very general HTTP status code 
            <br>
            &bull;meaning something went wrong on the web site's server 
            <br>
            &bull;but the server could not be more specific on what the exact problem was.
          </p>
          <br>
        </div>
        <div class="form-group">
            <div class="col-sm-9">
             <a href="<%=request.getContextPath()%>">Go Back to Home Page</a></div></div></div>
            </div>
            <br><BR>
            <BR>
            <BR>
     <div class="clearfix">
        </div><div class="clearfix">
        </div> -->
        
        
       <div class="container annexure-form error-page " >
    	<div class="col-xs-12">
    		<h2 class="annexure-form-header">ERROR</h2>
		    <div class="company form-regisration error">
				<h3>ERROR No. 500</h3>
				<p>The following error was encountered:</p>
				<p>
					<strong>500 - Internal Server Error</strong>
				</p>
				<p>The 500 Internal Server Error is a very general HTTP status code</p>
				<p>meaning something went wrong on the web site's server </p>
				<p>but the server could not be more specific on what the exact problem was.</p>
				
			</div>
			<div class="row">
	            <div class="col-xs-12 col-sm-12 col-md-4">
					<a href="#" onclick="goBack();" class="bdr-curve-none btn btn-primary btn-next">Go Back to Home Page</a>
	            </div>
            </div>
		</div>
	</div>
  </body>
<footer id="footer" class="midnight-blue hidden-sm hidden-xs">
<div class="container">
<div class="row">
<div class="col-sm-6">
<ul class="pull-left foot-links">
<li class="divider"><a href="http://www.fwd.com.hk/en-US/index.html" target="_blank">FWD Home</a></li>
<li class="divider"><a href="http://www.fwd.com.hk/en-US/about/index.html"  target="_blank">About us</a></li>
<li><a href="http://wordpress-2963-12768-29180.cloudwaysapps.com/en_US/"  target="_blank">Blog</a></li>
</ul>
</div>
<div class="col-sm-4 pull-right">
<div class="social">
<ul class="social-share pull-left text-right">
<li><a href="https://www.facebook.com/FWD.HK.MO" target="_blank"><i class="fa fa-facebook"></i></a></li>
<li><a href="https://www.youtube.com/user/FWDHK" target="_blank"><i class="fa fa-youtube"></i></a></li>
</ul>
<div class="hotline pull-right text-left">
<h5 class="text-white">24hours Hotline</h5>
<a class="hotline-num"> 3123 3123 </a>
</div>
<div class="clearfix"></div>
</div>
</div>
</div>
</div>
</footer>
<!--/#footer-->
<!--/#bottom-->
<div class="bottom hidden-sm hidden-xs">
<div class="container">
<div class="row">
<div class="col-sm-7 pull-left">
<ul class="nav nav-pills">
<li><a href="http://www.fwd.com.hk/en-US/home/security.html" target="_blank">Online Security</a></li>
<li><a>|</a></li>
<li><a href="http://www.fwd.com.hk/en-US/home/disclaimer.html" target="_blank">Disclaimer</a></li>
<li><a>|</a></li>
<li><a href="http://www.fwd.com.hk/en-US/home/pdo.html" target="_blank">Personal Data Protection Policy and
Practices</a></li>
</ul>
</div>
<div class="col-sm-5 pull-right text-right">
<p>
2015 <a target="_blank" href="" title="Insurance">FWD</a> Hong
Kong. All rights reserved
</p>
</div>
</div>
</div>
</div>
<!--/#bottom-->
<!--mob-#bottom-->
<!--/mob-#bottom-->
<!--/mob-#bottom-->


<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/jquery.isotope.min.js"></script>

<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/respond.min.js"></script> --%>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/wow.min.js"></script>

<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/validation.js"></script>

<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>

<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/number-spinner.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<script type="text/javascript"
src="<%=request.getContextPath()%>/resources/js/fwd.js"></script>