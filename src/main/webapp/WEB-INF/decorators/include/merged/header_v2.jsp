<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@page import="com.ifwd.fwdhk.model.UserDetails"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />

<%
	/**********
		Define Java variaibles
	**********/

	//Language Switch URL

	String switchUrl = "";
    String langClass = "";
    boolean isPostRedirect = false;

    if (request.getParameter("data") == null) {
    	if ("en".equals(session.getAttribute("language").toString())) {
    	    langClass = "eng";
    		if (request.getServletPath().equals("/en")) {
    			switchUrl = request.getContextPath() + "/changeLang?selectLang=en&action=/en/";
    		} else {
    			switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=" + request.getServletPath();
    			if (request.getQueryString() != null && request.getQueryString().length() > 0) {
    				switchUrl += "?" + request.getQueryString();
    			}
    		}
    	} else {
    	    langClass = "chi";
    		if (request.getServletPath().equals("/tc")) {
    			switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=/tc/";
    		} else {
    			switchUrl = request.getContextPath() + "/changeLang?selectLang=tc&action=" + request.getServletPath();
    			if (request.getQueryString() != null && request.getQueryString().length() > 0) {
    				switchUrl += "?" + request.getQueryString();
    			}
    		}
    	}
    } else {
    	isPostRedirect = true;
    	switchUrl = "#";
    }


	// Conditional Variables

	Boolean isProtectTabActive = actionName.equals("WorkingHoliday") || actionName.equals("Flight")  || actionName.equals("Travel")							 || actionName.equals("Homecare") ||actionName.equals("Oversea") || actionName.equals("Eliteterm");
	Boolean isSaveTabActive = actionName.equals("Savie");
	Boolean isEnjoyTabActive = actionName.equals("offers");
%>

<%
	/* Temporarily set the msg before controller return the message */

	java.text.SimpleDateFormat cformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	long currentDate = System.currentTimeMillis();
    long msgEndDate = cformat.parse("2016-09-16 09:00:00").getTime();

	String notificationMsg = "";
    if (currentDate <= msgEndDate) {
    	if (session.getAttribute("uiLocale").equals("zh-HK")) {
        	notificationMsg = java.util.ResourceBundle.getBundle("messages", new java.util.Locale("zh","HK")).getString("header.notification.msg.repair");
    	} else {
        	notificationMsg = java.util.ResourceBundle.getBundle("messages", new java.util.Locale("en","US")).getString("header.notification.msg.repair");
    	}
    }
	boolean showNotification = (notificationMsg.equals(""))?false:true;

	/* Temporarily set the msg for motor maintenance */
	long maintenanceStartDate = cformat.parse("2016-12-09 07:00:00").getTime();
	long maintenanceEndDate = cformat.parse("2016-12-09 15:00:00").getTime();
	boolean showMotorMaintenance = (currentDate >= maintenanceStartDate && currentDate <= maintenanceEndDate);
%>

<script type="text/javascript">
	var obj = {
	    'topBar': {
	        'mobileDefaultHeight': 0,
	        'desktopDefaultHeight': 42,
	        'classname': {
	            'mobile': 'div.commonBody',
	            'desktop': 'nav.navbar.navbar-inverse'
	        }
	    },
	    'nBarOnly': {
	        'mobile': 0,
	        'desktop': 56,
	        'classname': {
	            'mobile': '.header-notification-box.header-notification-box--mobile',
	            'desktop': '.header-notification-box.header-notification-box--desktop'
	        },
	        'content': {
			    'ifwd_repair': {
			        'mobile': '<fmt:message key="header.notification.msg.repair" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.repair" bundle="${msg}" />'
			    },
				'fraud' : {
			        'mobile': '<fmt:message key="header.notification.msg.fraud" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.fraud" bundle="${msg}" />'
			    },
			    'flightcare_moncare': {
			        'mobile': '<fmt:message key="header.notification.msg.repair" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.repair" bundle="${msg}" />'
			    },
				'ios_chrome': {
			        'mobile': '<fmt:message key="header.notification.msg.ios" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.ios" bundle="${msg}" />'
			    },
				'motor_insurance': {
			        'mobile': '<fmt:message key="header.notification.msg.motor" bundle="${msg}" />',
			        'desktop': '<fmt:message key="header.notification.msg.motor" bundle="${msg}" />'
			    },
			    'maintenance': {
			        'mobile': '<s:message code="label.header.maintenance.message"/>',
			        'desktop': '<s:message code="label.header.maintenance.message"/>'
			    }
			}
	    }
	};
// Default value
var isChromeIOS = navigator.userAgent.match('CriOS') ? true : false;
var isMotorMaintenance = (<%=showMotorMaintenance%> == false ) ? false : true;
var contentIndexArr = [];
var nBarConfig = {};
var showNotification = ( <%=showNotification%> == false ) ? false : true;

var isMaintenance = obj.nBarOnly.content.maintenance.desktop != 'deployed';

nBarConfig = {
	'contentIndex': [],
	'isVisible': false
}

<% if(request.getRequestURI().indexOf("/travel-insurance")>0) { %>

	nBarConfig.isVisible = ( <%=showNotification%> == false ) ? false : true

<% }else if(request.getRequestURI().indexOf("/motor-insurance")>0 ) { %>

	if( isMotorMaintenance ){
		contentIndexArr.push('motor_insurance');
		nBarConfig.isVisible = true;
	}

<% } else { %>

if ( isChromeIOS ) {
	contentIndexArr.push('ios_chrome');
}

	nBarConfig.isVisible = ( <%=showNotification%> == false && isChromeIOS == false ) ? false : true

<% } %>

if (isMaintenance) {
	contentIndexArr.push('maintenance');
	nBarConfig.isVisible = true;
}

nBarConfig.contentIndex = contentIndexArr;

</script>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />

<script src="<%=request.getContextPath()%>/resources/js/header/header_v2.head.part0.js" charset="utf-8"></script>

<%-- if(request.getRequestURI().indexOf("/flight-insurance")>0) { %>
<!-- customized behaviour for flight insurance landing page only -->
<script src="<%=request.getContextPath()%>/resources/js/header.notification.bar.custom.flight.js" charset="utf-8"></script>
<% } --%>

<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.notification.bar.css" media="screen" title="no title" charset="utf-8"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/header.notification.bar.css" media="screen" title="no title" charset="utf-8">
<script src="<%=request.getContextPath()%>/resources/js/header.notification.bar.js" charset="utf-8"></script>
<!-- ./header.notification.bar -->


<!-- Session is alive or not -->
<%-- refer to "header_v2.temp.0.jsp" --%>

<!--desktop header-->
<header id="header" class="header hidden-xs hidden-sm">
	<!-- top-bar -->
	<div class="top-bar">
		<%@include file="header.notification.bar.desktop.jsp" %>
		<div class="ifwd-container">
			<div class="row">
				<div class="col-lg-5 col-md-5 pad-0">
					<ul class="nav navbar-nav lang-btn-grp">
						<li class="lang-btn-grp__item">
							<a class="lang lang-btn-grp__item__selector lang-btn-grp__item__selector--<%=langClass%> pull-left anchor-lang" id="anchor-lang" href="<%=switchUrl%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
						</li>
						<li class="lang-btn-grp__item">
							<span class="lang-btn-grp__item__top-livechat">
								<a class="lang-btn-grp__item__top-livechat__livechat_button"><i class="fa fa-comments-o"></i></a>
							</span>
						</li>
						<li class="lang-btn-grp__item">
							<div class="lang-btn-grp__item__top-number">
								<span class="lang-btn-grp__item__top-number__callus"> <fmt:message key="header.hotline" bundle="${msg}" /></span>
							</div>
						</li>
 					</ul>
				</div>
				<div class="col-lg-7 col-md-7">
					<%@include file="/WEB-INF/decorators/include/merged/login_v2.jsp" %>
				</div>
			</div>
		</div>
		<!-- ./container -->
	</div>
	<!-- ./top-bar -->
	<!-- nav-bar -->
	<nav class="navbar navbar-inverse">
		<div class="ifwd-container pad-0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=request.getContextPath()%>/${language}">
					<img src="<%=request.getContextPath()%>/resources/images/iFWD_logo_200px.jpg" alt="<fmt:message key="logo.alt" bundle="${msg}" />">
				</a>
			</div>

            <div class="col-lg-8 col-md-7 pull-right">
                <ul class="col-lg-11 col-md-12 maintabs menutab-V2 pull-right">
                    <li class="col-lg-4 col-md-4 pad-0 main-tab dropdown <%if (isProtectTabActive) {%> active <%}%>">
						<a class="protect-save-enjoy-tab">
							<fmt:message key="header.product.type1" bundle="${msg}" />
						</a>
						<ul class="dropdown-menu protect-tab">
							<li class="nav-group pad-0 partition-on-the-right protect-tab__1st_col">
								<ul class="col-lg-12 col-md-12 pad-0">
									<li class="menu-subtitle"><fmt:message key="header.product.type1.group1.title1" bundle="${msg}"/></li>
									<li class="menu-link">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<a href="<%=request.getContextPath()%>/${language}/term-life-insurance">
											<fmt:message key="header.product.type1.group1.linkname1" bundle="${msg}"/>
										</a>
									</li>
									<li class="menu-subtitle"><fmt:message key="header.product.type1.group1.title2" bundle="${msg}"/></li>
									<li class="menu-link">
										<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
										<a href="<%=request.getContextPath()%>/${language}/medical-insurance">
											<fmt:message key="header.product.type1.group1.linkname2" bundle="${msg}"/>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-group pad-0 partition-on-the-right protect-tab__2nd_col">
								<ul class="col-lg-12 col-md-12 pad-0">
									<li class="menu-subtitle"><fmt:message key="header.product.type1.group2.title" bundle="${msg}" /></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/flight-insurance"><fmt:message key="header.product.type1.group2.linkname1" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message key="header.product.type1.group2.linkname3" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/overseas-study-insurance"><fmt:message key="header.product.type1.group2.linkname2" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"><fmt:message key="header.product.type1.group2.linkname4" bundle="${msg}" /></a></li>
							  	</ul>
							</li>
							<li class="nav-group pad-0 partition-on-the-right protect-tab__3rd_col">
							  	<ul class="col-lg-12 col-md-12 pad-0">
									<li class="menu-subtitle"><fmt:message key="header.product.type1.group3.title" bundle="${msg}" /></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care"><fmt:message key="header.product.type1.group3.linkname1" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/home-liability"><fmt:message key="header.product.type1.group3.linkname2" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/screen-insurance/${language}"><fmt:message key="header.product.type1.group3.linkname3" bundle="${msg}" /></a></li>
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/phone-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname4" bundle="${msg}" /></a></li>
								</ul>
							</li>
							<li class="nav-group pad-0 protect-tab__4th_col">
							  	<ul class="col-lg-12 col-md-12 pad-0">
									<li class="menu-subtitle"><fmt:message key="header.product.type1.group4.title" bundle="${msg}" /></li>
  	                              <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/motor-insurance"><fmt:message key="header.product.type1.group4.linkname1" bundle="${msg}" /></a></li>
								</ul>
							</li>
						</ul>
                    </li>
                    <li class="col-lg-4 col-md-4 pad-0 main-tab dropdown<%if (isSaveTabActive) {%> active <%}%>">
                        <a class="protect-save-enjoy-tab"><fmt:message key="header.product.type2" bundle="${msg}" /></a>
                        <ul class="dropdown-menu one-column save-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 pad-0">
                              <li class="menu-subtitle"><fmt:message key="header.product.type2.group1.title" bundle="${msg}" /></li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance">
										  <fmt:message key="header.product.type2.group1.linkname1" bundle="${msg}" />
									  </a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="header.product.type2.group1.linkname2" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree"><fmt:message key="header.product.type2.group1.linkname3" bundle="${msg}" /></a>
                                  </li>
                             </ul>
                          </li>
                         </ul>
                    </li>
                    <li class="col-lg-4 col-md-4 pad-0 main-tab dropdown enjoy<%if (isEnjoyTabActive) {%> active <%}%>">
                        <a class="protect-save-enjoy-tab">
							<fmt:message key="header.product.type3" bundle="${msg}" />
						</a>
                        <ul class="dropdown-menu one-column enjoy-tab">
                          <li>
                              <ul class="col-lg-12 col-md-12 pad-0">
                                  <li class="menu-link">
                                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									  <%-- <a class="menu-link" href="<%=request.getContextPath()%>/${language}/fwdiscover"><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a> --%>
									  <a class="menu-link" href='<fmt:message key="footer.product.type3.link" bundle="${msg}" />'><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="header.product.type3.group1.linkname1" bundle="${msg}" /></a>
                                  </li>
                                  <li class="menu-link">
	                                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                                  <a class="menu-link" href="<fmt:message key="link.blog" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3.group1.linkname3" bundle="${msg}" /></a>
                                  </li>
                             </ul>
                          </li>
                         </ul>
                    </li>
                </ul>
            </div>
		</div>
		<!--/.ifwd-container-->
	</nav>
	<!-- ./nav-bar-->

</header>
<!--End-Desktop-header-->

<div style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 998; display: none" id="test"></div>

<!--Mobile-header-->
<div class="navbar navbar-default navbar-fixed-top hidden-lg hidden-md pad-0" role="navigation">
	<%@include file="header.notification.bar.mobile.jsp" %>
	<!--Mobile-logobox-->
	<div class="logobox">
		<div class="navbar-header" style="overflow: hidden;">
			<button type="button"
				class="navbar-toggle mob-menu-btn col-xs-1 col-sm-1" data-toggle="collapse" data-target=".navbar-collapse">
				<!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">-->
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand pull-left col-xs-12 col-sm-12"
				href="<%=request.getContextPath()%>/${language}"><img
				src="<%=request.getContextPath()%>/resources/images/iFWD_logo_mobile.png"
				alt="<fmt:message key="logo.alt" bundle="${msg}" />"
				class="img-responsive"></a>
			<div class="clearfix"></div>
		</div>

	    <div class="navbar-collapse collapse mobile-menu-V2">
			<ul class="col-sm-12 nav navbar-nav">
				<li class="pad-0 col-sm-12 dropdown border-bottom">

			<%
				if (!isAuthenticated) {
			%>
				    <div class="dropdown login-btn btn btn-lg wd2 js-not-logged-in" id="myDropdown" data-toggle="modal" data-target="#loginpopup">
				        <a class="dropdown-toggle log-to-acc" id="fwd-login-mob">
							<i class="fa fa-lock"></i>
							<fmt:message key="header.login.heading" bundle="${msg}" />
						</a>
					</div>
					<div class="dropdown login-btn btn btn-lg wd2 hidden js-logged-in" id="myDropdownMob">
						<a class="js-myDropdown__userName dropdown-toggle" id="fwd-login" data-toggle="dropdown">
							<fmt:message key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;
						    <i class="fa fa-caret-right"></i>
						</a>
						<div class="dropdown-menu drop-width">
						    <ul>
							    <li>
									<a href="<%=request.getContextPath()%>/${language}/account" class="color1">
										<fmt:message key="header.menu.member" bundle="${msg}" />
									</a>
								</li>
				    			<li>
									<a href="<%=request.getContextPath()%>/userLogout" class="color1">
										<fmt:message key="header.menu.logout" bundle="${msg}" />
									</a>
								</li>
							</ul>
		    			</div>
		    		</div>					
			<%
				} else {
			%>

					<div class="dropdown login-btn btn btn-lg wd2" id="myDropdownMob">
						<a class="dropdown-toggle" id="fwd-login" data-toggle="dropdown">
							<fmt:message key="header.login.welcome" bundle="${msg}" />&nbsp;&nbsp;&nbsp;<%=username%>
						    <i class="fa fa-caret-right"></i>
						</a>
						<div class="dropdown-menu drop-width">
						    <ul>
							    <%
							        if (!isDirect) {
							    %>
							    <li>
									<a href="<%=request.getContextPath()%>/${language}/account" class="color1">
										<fmt:message key="header.menu.member" bundle="${msg}" />
									</a>
								</li>
							    <%
							        }
							    %>
				    			<li>
									<a href="<%=request.getContextPath()%>/userLogout" class="color1">
										<fmt:message key="header.menu.logout" bundle="${msg}" />
									</a>
								</li>
							</ul>
		    			</div>
		    		</div>
	        <%
	            }
	        %>
				</li>
				<li class="pad-0 col-sm-12 dropdown link-btn link-grp border-bottom fwd-header-navgation-menu">
	             	<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
	              	<ul class="col-sm-12 dropdown-menu">
						<li class="menu-link-grp-title">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group1.title1" bundle="${msg}" /></a>
								<ul class="col-sm-12 dropdown-menu">
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/term-life-insurance"><fmt:message key="header.product.type1.group1.linkname1" bundle="${msg}" /></a></li>
							</ul>
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group1.title2" bundle="${msg}" /></a>
								<ul class="col-sm-12 dropdown-menu">
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/medical-insurance"><fmt:message key="header.product.type1.group1.linkname2" bundle="${msg}" /></a></li>
							</ul>
						</li>
		                <li class="menu-link-grp-title">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group2.title" bundle="${msg}" /></a>
		                    <ul class="col-sm-12 dropdown-menu">
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/flight-insurance"><fmt:message key="header.product.type1.group2.linkname1" bundle="${msg}" /></a></li>
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message key="header.product.type1.group2.linkname3" bundle="${msg}" /></a></li>
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/overseas-study-insurance"><fmt:message key="header.product.type1.group2.linkname2" bundle="${msg}" /></a></li>
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"><fmt:message key="header.product.type1.group2.linkname4" bundle="${msg}" /></a></li>
		                    </ul>
		                </li>
						<li class="menu-link-grp-title">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group3.title" bundle="${msg}" /></a>
							<ul class="col-sm-12 dropdown-menu">
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/easy-home-care"><fmt:message key="header.product.type1.group3.linkname1" bundle="${msg}" /></a></li>
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/household-insurance/home-liability"><fmt:message key="header.product.type1.group3.linkname2" bundle="${msg}" /></a></li>
								 <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/screen-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname3" bundle="${msg}" /></a></li>
		                    	 <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/phone-insurance/${language}" target="_blank"><fmt:message key="header.product.type1.group3.linkname4" bundle="${msg}" /></a></li>
		                    </ul>
						</li>
						<li class="menu-link-grp-title">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type1.group4.title" bundle="${msg}" /></a>
							<ul class="col-sm-12 dropdown-menu">
		                         <li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/motor-insurance"><fmt:message key="header.product.type1.group4.linkname1" bundle="${msg}" /></a></li>
		                    </ul>
						</li>
					</ul>
	            </li>
				<li class="pad-0 col-sm-12 dropdown link-btn border-bottom fwd-header-navgation-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type2" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
					<ul class="col-sm-12 dropdown-menu">
						<li class="menu-link-grp-title">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type2.group1.title" bundle="${msg}" /></a>
								<ul class="col-sm-12 dropdown-menu">
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="header.product.type2.group1.linkname1" bundle="${msg}" /></a></li>
								</ul>
								<ul class="col-sm-12 dropdown-menu">
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance/provie"><fmt:message key="header.product.type2.group1.linkname2" bundle="${msg}" /></a></li>
								</ul>
								<ul class="col-sm-12 dropdown-menu">
									<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/savings-insurance/wealthree"><fmt:message key="header.product.type2.group1.linkname3" bundle="${msg}" /></a></li>
								</ul>
						</li>
					</ul>
				</li>
				<li class="pad-0 col-sm-12 dropdown link-btn border-bottom link-grp fwd-header-navgation-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="header.product.type3" bundle="${msg}" /><img class="link-arrow" src="<%=request.getContextPath()%>/resources/images/arrow.png"><img class="link-arrow hidden-label" src="<%=request.getContextPath()%>/resources/images/arrow-down.png"></a>
					<ul class="col-sm-12 dropdown-menu">
						<%--<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/fwdiscover"><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a></li>--%>
						<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href='<fmt:message key="footer.product.type3.link" bundle="${msg}" />'><fmt:message key="header.product.type3.group1.linkname2" bundle="${msg}" /></a></li>
						<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="header.product.type3.group1.linkname1" bundle="${msg}" /></a></li>
						<li class="menu-link"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><a href="<fmt:message key="link.blog" bundle="${msg}" />" target="_blank"><fmt:message key="header.product.type3.group1.linkname3" bundle="${msg}" /></a></li>
					</ul>
	            </li>
				<li class="pad-0 col-sm-12 dropdown lang-grp">
					<ul>
						<li>
							<a class="lang menu-lang anchor-lang" id="anchor-lang" href="<%=switchUrl%>"><fmt:message key="header.menu.language" bundle="${msg}" /></a>
						</li>
					</ul>
				</li>
			</ul>
		</div><!--/.nav-collapse -->
	</div><!--/.logobox-->
</div><!--/.navbar-->

<div id="myModal" class="mob-login-form-wrapper modal fade" role="dialog">
	<div style="display: none; position: fixed; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 2001" class="login-ajax-loading">
	    <img style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-top: -50px; margin-left: -50px;" src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
	</div>

	<div id="myDropdownMob" class="modal-dialog">
	    <form name="loginform" id="loginform2" method="post">
	        <div class="login-form" style="position: absolute;">
	            <div id="login-err-msg" class="alert alert-danger col-xs-10 col-xs-offset-1 " role="alert" style="display: none;">
	            </div>
	            <div class="form-container">
	                <h2>
	                    <fmt:message key="header.login.heading" bundle="${msg}" />
	                </h2>
	                <h4 class="margin-shift">
	                    <fmt:message key="header.login.username" bundle="${msg}" />
	                    <a href="${pageContext.request.contextPath}/${language}/forgotUserName" class="pull-right sub-link">
							<fmt:message key="header.login.username.forget" bundle="${msg}" />
						</a>
	                </h4>
	                <div class="form-group">
	                    <input type="text" name="userName" class="form-control" placeholder="" id="headerUserName">
	                </div>
	                <span id="errUserName" style="color: red"></span>
	                <h4 class="margin-shift">
	                    <fmt:message key="header.login.password" bundle="${msg}" />
	                    <a href="${pageContext.request.contextPath}/${language}/forgotPassword" class="pull-right sub-link">
							<fmt:message key="header.login.password.forget" bundle="${msg}" />
						</a>
	                </h4>
	                <div class="form-group">
	                    <input type="password" name="password" class="form-control" autocomplete="off" id="headerPassword">
	                </div>
	                <span id="errPass" style="color: red"></span> <br>
	                <div class="row">
	                    <div class="col-lg-6 col-md-6 col-xs-6">
	                        <button type="button" onclick="submitLoginForm('loginform2');" class="bdr-curve btn btn-primary btn-lg wd5">
	                            <fmt:message key="header.login.action" bundle="${msg}" />
	                        </button>
	                    </div>
	                    <h3 class="text-left col-lg-6 col-md-6  col-xs-6 pad-0 margin-0">
	                        <span>
								<fmt:message key="header.login.registration.heading" bundle="${msg}" />
							</span>
							<br>
	                        <a href="${pageContext.request.contextPath}/${language}/joinus">
	                            <fmt:message key="header.login.registration.action" bundle="${msg}" />
	                        </a>
	                    </h3>
	                    <div class="clearfix"></div>
	                </div>
	                <p>
						<fmt:message key="header.login.disclaimer" bundle="${msg}" />
					</p>
	            </div>
	        </div>
	    </form>
	</div>
</div>
<!--End Mobile header-->
<!--/header-->
<script src="<%=request.getContextPath()%>/resources/js/header/header_v2.bottom.part0.js" charset="utf-8"></script>
<%
	if (isPostRedirect) {
%>
<script>
$('.anchor-lang').on('click', function(){
	var quoteData = JSON.stringify(<%=StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data")))%>);
	var url = "${language}"=="en"?window.location.href.replace("/en/", "/tc/"):window.location.href.replace("/tc/", "/en/")
    var $form = $("<form />");
    $form.attr("action", url);
    $form.attr("method", "post");
    var $quote = $("<input type='hidden' name='data' />");
    $quote.attr("value", quoteData);
    $form.append($quote);
    $("body").append($form);
    $form.submit();
});
</script>
<%
	}
%>
<%@include file="/WEB-INF/jsp/merged/login2.jsp" %>
