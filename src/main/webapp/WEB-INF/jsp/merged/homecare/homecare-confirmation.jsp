<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">



<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>-->



<!--VWO-->
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 95373, settings_tolerance = 2000, library_tolerance = 2500, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->

</head>
<body>
	<!--Desktop-header-->
	<!--/#main-Content-->
	<section>
		<div class="container">
			<div class="row">
				<form>
					<ol class="breadcrumb pad-none">
						<li><a href="#"><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item2" bundle="${msg}" /> </a> <i
							class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item3" bundle="${msg}" /></a> <i
							class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item4" bundle="${msg}" /></a> <i
							class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item5" bundle="${msg}" /> </a></li>
						<li class="active "><i class="fa fa-caret-right"></i>
						<fmt:message key="home.breadcrumb1.item6" bundle="${msg}" />
						</li>
					</ol>
					<div class="container ">
						<div class="col-md-12 shop-tracking-status">
							<div class="center" style="visibility: visible;">
								<h2><fmt:message key="home.confirmation.jumbo" bundle="${msg}" /></h2>
							</div>
							<br>
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle act fourth">
										<span class="status lst-status color3"><fmt:message key="home.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${not empty errormsg}">
						<div id="confirm-error-msg" class="alert alert-danger hide"
							role="alert">${errormsg}</div>
					</c:if>
					<div class="container pad-none bdr">
						<div class="col-sm-12 gray-bg1">
							<h3>
								<fmt:message key="home.confirmation.msg.part1" bundle="${msg}" /> <strong><fmt:message key="home.confirmation.msg.part2" bundle="${msg}" /></strong>
								<fmt:message key="home.confirmation.msg.part3" bundle="${msg}" /><strong><fmt:message key="home.confirmation.msg.part4" bundle="${msg}" /></strong><br>
								<fmt:message key="home.confirmation.msg.part5" bundle="${msg}" /> <strong>${emailID}</strong> <fmt:message key="home.confirmation.msg.part6" bundle="${msg}" />
							</h3>
							<h4>
								Policy Number: <span> ${policyNo}</span>
							</h4>
							<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
								<h5>
									<fmt:message key="home.confirmation.promocode" bundle="${msg}" /><span> <%=session.getAttribute("myReferralCode")%></span>
								</h5>
								<div class="h4-3-b margin-left">
								<fmt:message key="home.confirmation.share" bundle="${msg}" />
								</div>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
								<img src="<%=request.getContextPath()%>/resources/images/agoda.png" alt="">
							</div>
							<div class="clearfix"></div>
							<br>
							<br>
							<div class="h4-2 margin-left">
							<fmt:message key="home.confirmation.sharenow" bundle="${msg}" />
							</div>

							<div >
					         	<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 pad-none">
					         		<div class=" wht-bg1 text-center referral-url"><a class="padding6 h4-5-b " id="toBeCopied" href="" target="_blank"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/home-insurance?promo=<%=session.getAttribute("myHomeReferralCode")%></a></div>
					            </div>
					            <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12 pad-none"> 
						        	<div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute"><fmt:message key="home.confirmation.copy" bundle="${msg}" /></div>
						        	<!-- <button type="button" id="d_clip_button" class="my_clip_button" title="Click me to copy to clipboard." data-clipboard-target="fe_text" data-clipboard-text="Default clipboard text from attribute">Copy To Clipboard...</button> -->
					                <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/home-insurance/sharing/" data-title="iFWD"></div>
					           	</div>
					         </div>
					         
							<div class="clearfix"></div>
							<br>
							<div class="col-lg-12 col-md-12 travel-b">
								<div class="declaration-content1">
									<b><span class="orange-star">*</span><fmt:message key="home.confirmation.referral.heading" bundle="${msg}" /></b>
									<p class="margin-none">
										<fmt:message key="home.confirmation.referral.desc1" bundle="${msg}" />  <br>
										<fmt:message key="home.confirmation.referral.desc2" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc3" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc4" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc5" bundle="${msg}" /> <a href="<%=request.getContextPath()%><fmt:message key="referral.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.confirmation.referral.desc6" bundle="${msg}" /></a> <fmt:message key="home.confirmation.referral.desc7" bundle="${msg}" />
									</p>
									<br>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="spacer2 hidden-sm hidden-xs"></div>
					<div class="container pad-none hidden-xs hidden-sm travel-homecare">
						<div class="row-fluid">
							<div class="center " style="visibility: visible;">
								<h4 class="center-h2"><fmt:message key="home.confirmation.other.heading" bundle="${msg}" /></h4>
								<br>
								<br>
								<div class="col-md-3 col-lg-3 text-left pad-none">
									<img src="<%=request.getContextPath()%>/resources/images/t-care.png" alt="">
								</div>
								<div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
									<div>
										<div class="h2-32"><fmt:message key="home.confirmation.other.subheading" bundle="${msg}" /></div>
										<p class="h4-5"><fmt:message key="home.confirmation.other.desc" bundle="${msg}" /></p>
										<a href="<%=request.getContextPath()%>/travel-insurance" class="border-radius btn btn-primary get-btn"><fmt:message key="home.confirmation.other.quote" bundle="${msg}" /></a>
									</div>
								</div>

							</div>


						</div>
					</div>
					<div class="spacer2 hidden-sm hidden-xs"></div>
				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->

</body>

</html>