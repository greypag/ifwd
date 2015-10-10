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
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}";
	}
	
	function gotoAppForm(){
		window.location.href = "<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}";
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
			<h2 class="hidden-xs hidden-sm">Declaration & authorization</h2>
		</div>
		<div class="form-wrap">
			<div class="declaration-content personaltraveller" >
				<h4>Declaration - Personal Information Collection Statement</h4>
			    <div class="checkbox">
					<input id="checkbox1" name="checkbox1" type="checkbox"> 
					<label for="checkbox1">
						I have read and I understand and accept this <a>Personal Information Collection Statement</a>
					</label>
				</div>
				
				<p>&nbsp;</p>
				<h4>Policy replace,emt declarations</h4>
				<p>Have you, in the past 12 months, replaced any or a substantial part of your existing life insurance policy upon this application?</p>
				<div class="radio">
				    <input id="policy11" name="policy1" type="radio">
				    <label for="policy11">
				    	NO
				    </label>
				</div>
				<div class="radio">
				    <input id="policy12" name="policy1" type="radio">
				    <label for="policy12">
				    	YES [Please call customer service hotline <a>31233123</a>]
				    </label>
				</div>
				<p>Do you, in the past 12 months, intend to replace any or a substantial part of your existing life insurance policy upon this application?</p>
				<div class="radio">
				    <input id="policy21" name="policy2" type="radio">
				    <label for="policy21">
				    	NO
				    </label>
				</div>
				<div class="radio">
				    <input id="policy22" name="policy2" type="radio">
				    <label for="policy22">
				    	YES [Please call customer service hotline <a>31233123</a>]
				    </label>
				</div>
				
				<p>&nbsp;</p>
				<h4>Declaration - Cancellation Right and Refund of Premium(s)</h4>
				<div class="checkbox">
					<input id="checkbox2" name="checkbox2" type="checkbox"> 
					<label for="checkbox2">
						I understand that I have the right to cancel and obtain a refund of any premium(s) paid less any market value adjustments by giving written notice. Such notice must be signed by me and received directly by FWD Life insurance Company (Bermuda) Limited at 1/F. FWD Financial Centre,308 Des Voeux Road Central, Hong Kong within 21 days after the delivery of the policy or issue of a Notice to the policyholder ot the policyholders represetative,whichever is the earlier.
					</label>
				</div>
				
				<p>&nbsp;</p>
				<h4>Application</h4>
				<div class="checkbox">
					<input id="checkbox3" name="checkbox3" type="checkbox"> 
					<label for="checkbox3">
						<strong>I hereby DECLARE and AGREE that:</strong>
					</label>
				</div>
				
				<p>&nbsp;</p>
				<div class="checkbox">
					<input id="checkbox4" name="checkbox4" type="checkbox"> 
					<label for="checkbox4">
						I/We hereby declare and confirm that the Policy Owner is the beneficial owner of this Policy(ies) and I am not acting or holding this policy on behalf of any other person including legal person or trust.
					</label>
				</div>
			</div>
			<div class="declaration-content" >
				<p>&nbsp;</p>
				<p>If you do NOT wish FWD Life Insurance Company (Bermuda) Litmited to use Your Personal Date in Direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing.please tick the appropriate box(es) below to exercise 
				<p>&nbsp;</p>
				<div class="checkbox">
					<input id="checkbox5" name="checkbox5" type="checkbox"> 
					<label for="checkbox5">
						<strong>Please do not send direct marketing information to me.</strong>
					</label>
				</div>
				<p>&nbsp;</p>
				<div class="checkbox">
					<input id="checkbox6" name="checkbox6" type="checkbox"> 
					<label for="checkbox6">
						<strong>Please do not provide my personal data to other persons or companies for their use in direct marketing.</strong>
					</label>
				</div>
			</div>
		</div>			
		<div class="center" style="margin:30px"><a class="save-btn save-primary" onclick="gotoAppForm();">Next</a></div>
		
	</div>
	<style>
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
