<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


	<div class="container">
		<div class="fwd-container container-fluid breadcrumbs">
			<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
				<li><a href="#"><fmt:message key="savie.landing.home" bundle="${msg}" /></a></li>
				<li class="divider"><i class="fa fa-play"></i></li>
				<li><a href="#"><fmt:message key="savie.landing.save" bundle="${msg}" /></a></li>
				<li class="divider last"><i class="fa fa-play"></i></li>
				<li class="active-bc"><fmt:message key="savie.landing.savie" bundle="${msg}" /></li>
			</ol>
		</div>
		<div class="text-content">
			
		</div>
	</div>

	<div id="landing-page-blog" class="fwd-container blog-widget container-fluid">
		<div class="read-blog-desktop three-column-widget">
			<h2 class="hidden-xs hidden-sm">Thank you for your purchase!</h2>
		</div>
		<div class="form-wrap">
			<div class="declaration-content" style="border: 2px solid #e5e5e5;margin:0 30px;padding: 30px">
				<table style="width: 100%;">
					<tr>
						<td><h3>Ackowledgement</h3></td>
						<td><h3>Direct Debit first payment schedule</h3></td>
					</tr>
					<tr>
						<td>Your purchase has been successful!</td>
						<td>Your payment will be process with in 3 working days.</td>
					</tr>
					<tr>
						<td>Please review the confirmation of your purchase as detailed here.</td>
						<td></td>
					</tr>
					<tr>
						<td><h3>Policy Number</h3></td>
						<td></td>
					</tr>
					<tr>
						<td>Your policy number is <strong>093KG35JH</strong>. We will send you an email with your application details.</td>
						<td></td>
					</tr>
					<tr>
						<td>Please check your inbox or spam folder.</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>			
		<div class="center" style="margin:30px"><a href="#" class="save-btn save-primary">Back to home</a></div>
		
	</div>
	<style>
		.form-wrap table tr{
			height:50px;
		}
		.form-wrap table td{
			width: 50%;padding: 10px, 20px;
		}
		.form-wrap table td h3{
			color: #ff8200;
		}
		.save-btn {
		  margin-top: 0;
		  padding: 12px 180px !important;
		  min-width: 300px;
		  line-height: 30px;
		  font-size: 28px;
		}
		.save-primary {
		  padding: 8px 20px;
		  background: #fff;
		  color: #f6871e;
		  border: none;
		  border: 1px solid #f6871e;
	    }
	    .save-primary:hover {
		    outline: none;
		    box-shadow: none;
		    background: #f6871e;
		    color: #fff;
		    border: 1px solid #f6871e;
		
		}
	</style>
	<link href="<%=request.getContextPath()%>/resources/css/main.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.animateSprite.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.loadImages.1.1.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/index.js"></script>
