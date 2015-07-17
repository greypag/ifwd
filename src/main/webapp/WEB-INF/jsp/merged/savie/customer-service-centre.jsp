<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">
	function gotoCenter(){
		window.location.href = "<%=request.getContextPath()%>/${language}/saving-insurance/${nextPageFlow2}";
	}
	
	function gotoAppForm(){
		window.location.href = "<%=request.getContextPath()%>/${language}/saving-insurance/${nextPageFlow}";
	}
</script>

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
			<h2 class="hidden-xs hidden-sm">Please choose service centre</h2>
		</div>
		<div class="declaration-content" >
			<div class="save-left declaration-content">
				<h4>Tsim Sha Tsui (Flagship Service Centre)</h4>
		    	<h5>Address</h5>
		    	<p>G/F,Fontaine Building, 18 Mody Road,</p>
		    	<p>Tsim Sha Tsui</p>
		    	<p>&nbsp;</p><a href="#" class="save-btn save-primary">Select</a>
		    	<h5>Operation hours</h5>
		    	<p>Mon - Sat 10:00an to 8:00pm</p>
		    	<p>Closed on Sun & Public Holidays</p>
		    	<p>&nbsp;</p>
		    	<h5>Telephone no.</h5>
		    	<p>063-2323-123</p>
			</div>  
		    <div class="save-right declaration-content">
		    	<h4>Quarry Bay</h4>
		    	<h5>Address</h5>
		    	<p>13/F,Devon House, Taikoa Place, 979 King's Road,</p>
		    	<p>Quarry Bay</p>
		    	<p>&nbsp;</p><a href="#" class="save-btn save-primary">Select</a>
		    	<h5>Operation hours</h5>
		    	<p>Mon - Sat 8:00am to 8:00pm</p>
		    	<p>Closed on Sun & Public Holidays</p>
		    	<p>&nbsp;</p>
		    	<h5>Telephone no.</h5>
		    	<p>063-2323-123</p>
		    </div>  
		    <!-- 如果不用clear屬性可能會出現瀏覽器不兼容問題,clear設這元素周圍沒有浮動元素 -->  
		    <div   style="clear:both"></div>
		    <div class="save-left declaration-content">
				<h4>Sheung Wan</h4>
		    	<h5>Address</h5>
		    	<p>1/F,FWD Financial Centre, 308 Des Voeux Road</p>
		    	<p>Central, Sheung Wan</p>
		    	<p>&nbsp;</p><a href="#" class="save-btn save-primary">Select</a>
		    	<h5>Operation hours</h5>
		    	<p>Mon - Sat 10:00an to 8:00pm</p>
		    	<p>Closed on Sun & Public Holidays</p>
		    	<p>&nbsp;</p>
		    	<h5>Telephone no.</h5>
		    	<p>063-2323-123</p>
			</div>  
		    <div class="save-right declaration-content">
		    	<h4>Kwun Tong</h4>
		    	<h5>Address</h5>
		    	<p>Office E,12/F,Legend Tower,No.7 Shing Yip Street,</p>
		    	<p>Kwun Tong</p>
		    	<p>&nbsp;</p><a href="#" class="save-btn save-primary">Select</a>
		    	<h5>Operation hours</h5>
		    	<p>Mon - Fri 10:00am - 2:00pm and 3:00pm - 6:00pm</p>
		    	<p>Closed on Sun & Public Holidays</p>
		    	<p>&nbsp;</p>
		    	<h5>Telephone no.</h5>
		    	<p>063-2323-123</p>
		    </div>  
		    <!-- 如果不用clear屬性可能會出現瀏覽器不兼容問題,clear設這元素周圍沒有浮動元素 -->  
		    <div   style="clear:both">
		    </div><div class="save-left declaration-content">
				<h4>Shatin</h4>
		    	<h5>Address</h5>
		    	<p>Unit 1720 - 21, Level 17, Tower ll, Grand Central</p>
		    	<p>Tsim Sha Tsui</p>
		    	<p>&nbsp;</p><a href="#" class="save-btn save-primary">Select</a>
		    	<h5>Operation hours</h5>
		    	<p>Mon - Sat 10:00an to 8:00pm</p>
		    	<p>Closed on Sun & Public Holidays</p>
		    	<p>&nbsp;</p>
		    	<h5>Telephone no.</h5>
		    	<p>063-2323-123</p>
			</div>  
		    <!-- 如果不用clear屬性可能會出現瀏覽器不兼容問題,clear設這元素周圍沒有浮動元素 -->  
		    <div style="clear:both"></div>
		</div>
		<div class="center" style="margin:30px"><a class="save-btn-next save-primary" onclick="gotoAppForm();">Next</a></div>
	</div>
	<style>
		.save-left {width:46%;float:left;border:#ccc 1px solid;margin:10px;padding:10px;}  
		.save-right {width:46%;float:left;border:#ccc 1px solid;margin:10px;padding:10px;}
		.save-btn-next {
		  margin-top: 0;
		  padding: 12px 180px !important;
		  min-width: 300px;
		  line-height: 30px;
		  font-size: 28px;
		}
		.save-btn {
		  margin-top: 0;
		  padding: 12px 80px !important;
		  min-width: 150px;
		  line-height: 20px;
		  float:right;
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
