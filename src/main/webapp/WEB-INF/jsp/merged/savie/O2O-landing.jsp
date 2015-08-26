<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>
<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper">			
			
			<!-- Access Code Cover Div -->
			<!--<div class="hunger-selling-container container-fluid" id="myAccessCode">
				<div class="hunger-selling-content">
					<div class="hunger-selling-header text-center">
						<button id="close-cover" type="button" class="close"><span aria-hidden="true">&times;</span></button>
						<h4 class="hunger-selling-title">Please enter the access code as shown in your email.</h4>
					</div>
					<div class="hunger-selling-body">
						<form>
							<input placeholder="Access code" type="text" name="accessCodeConfirm" id="accessCodeConfirm" />
							<span class="validation-msg hidden-error-msg">The code is invalid or has been used.</span>							
							<button type="submit" id="hunger-btn" class="btn hunger-btn">Submit</button>
						</form>
					</div>
				</div>
			</div>-->
			
			<div class="text-center o2o-landing banner-widget hunger-selling container-fluid">
				<img class="mobile-banner" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/hero-banner-mobile.jpg" />
				<img class="desktop-banner" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/hero-banner.jpg" />
				<div class="fwd-container container-fluid breadcrumbs">
					<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
						<li><a href="#"><fmt:message key="savie.o2o.landing.Home" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#"><fmt:message key="savie.o2o.landing.Save" bundle="${msg}" /></a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a><fmt:message key="savie.o2o.landing.Savie" bundle="${msg}" /></a></li>
					</ol>
				</div>

				<div class="text-content hunger-img hidden-sm hidden-xs">
					<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/just-walk-the-talk.png" title="Just walk the talk" alt="Just walk the talk" class="img-responsive">
				</div>
				
				<!--<div class="hunger-text-section">
					<p class="hunger-selling-text text-1">SAVIE is currently in its pre<span>-</span>launch application stage.</p> 
					<p class="hunger-selling-text text-2">You are required to enter a valid access code to apply.</p>
					<a href="#" id="hunger-selling-buy-now-O2O" class="buy-now hunger-buy-now">Get started</a>
				</div>-->
			</div>
			
			<div class="fwd-full-container container-fluid o2o-landing teaser">
				<div class="fwd-container-limit">
					<div class="teaser-banner-text">
						<div class="money-div">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/money-logo-large.png" class="money">
						</div>
						<p class="additional top"><fmt:message key="savie.o2o.landing.Act.now.to" bundle="${msg}" /></p>
						<ul class="crediting-rate-list clearfix">
							<li><span class="percent">3% </span><span class="year"><fmt:message key="savie.o2o.landing.First.year" bundle="${msg}" /></span></li>
							<li class="middle"><div class="white"></div><span class="percent">3% </span><span class="year"><fmt:message key="savie.o2o.landing.Second.year" bundle="${msg}" /></span><div class="white right"></div></li>
							<li><span class="percent gold">4% </span><span class="year gold"><fmt:message key="savie.o2o.landing.Third.year" bundle="${msg}" /></span></li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="sign-up-teaser">
				<p class="sign-up-header"><fmt:message key="savie.o2o.landing.SAVIE.is.currently" bundle="${msg}" /></p>
				<div class="get-started-holder text-center">
					<button id="hunger-selling-buy-now-O2O" class="get-started"><fmt:message key="savie.o2o.landing.Get.started" bundle="${msg}" /></button>
				</div>
				<p class="sign-up-header hidden-xs hidden-sm"><fmt:message key="savie.o2o.landing.Haven't.applied" bundle="${msg}" /><a href="#"><fmt:message key="savie.o2o.landing.here" bundle="${msg}" /></a>.</p>
			</div>

	        <div id="flux" class="o2o-landing">
	            <div id="landing-three-column" class="fwd-container container-fluid three-column-widget">
	                <div class="row row-top text-center">
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                        	
	                            <h2><fmt:message key="savie.o2o.landing.Simple.yet" bundle="${msg}" /></h2>
	                            <h3><fmt:message key="savie.o2o.landing.big.on.savings" bundle="${msg}" /></h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/big-on-savings.png">
	                            <p><fmt:message key="savie.o2o.landing.SAVIE.guarantees" bundle="${msg}" /></p>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                            <h2><fmt:message key="savie.o2o.landing.No.charges" bundle="${msg}" /></h2>
	                            <h3><fmt:message key="savie.o2o.landing.no.commitment" bundle="${msg}" /></h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/no-commitment.png">
	                            <p><fmt:message key="savie.o2o.landing.Enjoy.flexibility" bundle="${msg}" /></p>
	                        </div>
	                    </div>
	                    <div class="col-xs-12 col-md-4 fwd-col">
	                        <div class="col-content">
	                            <h2><fmt:message key="savie.o2o.landing.Free" bundle="${msg}" /></h2>
	                            <h3><fmt:message key="savie.o2o.landing.additional.protection" bundle="${msg}" /></h3>
	                            <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/free-additional-2.png">
	                            <p><fmt:message key="savie.o2o.landing.Receive.Accidental" bundle="${msg}" /></p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="fwd-container container-fluid">     
	                <div id="other-benefits" class="row">
	                	<div class="col-xs-12 col-md-8 pull-right">
	                    	<h2 class="text-center"><fmt:message key="savie.o2o.landing.Other.benefits" bundle="${msg}" /></h2>
	                    </div>	                    
	                    <div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
	                        <img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/other-benefits-2-img.png">
	                    </div>
	                    <div class="col-xs-12 col-md-8 fwd-col">
							<ul>
	                            <li><p><fmt:message key="savie.o2o.landing.Unlimited.number" bundle="${msg}" /></p></li>
	                            <li><p><fmt:message key="savie.o2o.landing.No.withdrawal" bundle="${msg}" /></p></li>
	                            <li><p><fmt:message key="savie.o2o.landing.Premium.cover" bundle="${msg}" /></p></li>
	                            <li><p><fmt:message key="savie.o2o.landing.Death.Benefit" bundle="${msg}" /></p></li>
	                            <li><p><fmt:message key="savie.o2o.landing.Accidental.Death" bundle="${msg}" /></p></li>
	                        </ul>
	                    </div>
	                </div>
	                <!-- Disclaimer and Policy Provisions -->
	                <div class="disclaimer-policy">
	                    <p class="policy-provisions"><fmt:message key="savie.o2o.landing.The.features" bundle="${msg}" /><a href="#"><fmt:message key="savie.o2o.landing.Policy.Provisions" bundle="${msg}" /></a><fmt:message key="savie.o2o.landing.for.details" bundle="${msg}" /></p>
	                    <p><fmt:message key="savie.o2o.landing.For.a.complete" bundle="${msg}" /></p>
	                </div>
	            </div>
	            
	            <div class="fwd-full-container container-fluid o2o-landing saving-plans">
					<div id="savings-carousel" class="carousel slide" data-ride="carousel">
						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div class="savings-banner-text">
									<p><fmt:message key="savie.o2o.landing.Guaranteed.crediting" bundle="${msg}" /></p>
								</div>
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/crediting-reates-mobile.jpg" />
									<img class="desktop" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/crediting-reates.jpg" />
								</div>
							</div>
							<div class="item">
								<div class="savings-banner-text">
									<p><fmt:message key="savie.o2o.landing.Guaranteed.crediting" bundle="${msg}" /></p>
								</div>
								<div class="savings-banner">
									<img class="mobile" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/crediting-reates-mobile.jpg" />
									<img class="desktop" src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/crediting-reates.jpg" />
								</div>
							</div>
						</div>
					</div>
					
					<div class="savings-nav">
						<div class="prev">
							<a class="pull-right disabled" href="#savings-carousel" role="button" data-slide="prev">
							<span class="icon icon-chevron-thin-left">
								<span class="sr-only"><fmt:message key="savie.o2o.landing.Previous" bundle="${msg}" /></span>
							</span>
							</a>
						</div>
						
						<div class="next">
							<a class="pull-left active" href="#savings-carousel" role="button" data-slide="next">
							<span class="icon icon-chevron-thin-right">
								<span class="sr-only"><fmt:message key="savie.o2o.landing.Next" bundle="${msg}" /></span>
							</span>
							</a>
						</div>
					</div>
					
					<!--<div class="savings-menu row">
						<div class="col-xs-6 download">
							<a href="#">
								<div class="action-icon">
									<img src="assets/images/download-brochure-icon.png">
								</div>
								
								<div class="action-text">
									<h2>Download brochure</h2>
									<p>View product brochure for more details.</p>
								</div>
							</a>
						</div>
						
						<div class="col-xs-6 sign-up">
							<a href="#">
								<div class="action-icon">
									<img src="assets/images/signup-now-icon.png">
								</div>
								
								<div class="action-text">
									<h2>Sign up now</h2>
									<p>To get our limited offer</p>
								</div>
							</a>
						</div>
					</div>-->
					
					<!--<div class="fwd-action o2o-landing">
						<div class="fwd-action-container fwd-action-two">
							<button class="action-one talk-to-experts">
								<img src="assets/images/download-brochure-icon.png" class="img-responsive" />
								<div class="action-text">
									<h2>Download brochure</h2>
									<p>View product brochure for more details.</p>
								</div>
							</button>
							<button class="action-two download-brochure">
								<img src="assets/images/signup-now-icon.png" class="img-responsive" />
								<div class="action-text">
									<h2>Sign up now</h2>
									<p>To get our limited offer</p>
								</div>
							</button>
						</div>
					</div>-->
					
				</div>
	           
	        </div>
			
			<!-- OUR BLOG -->
			<div id="landing-page-blog" class="fwd-container blog-widget container-fluid text-center">
				<div class="read-blog-desktop three-column-widget">
					<h2 class="hidden-xs hidden-sm"><fmt:message key="savie.o2o.landing.Read.more" bundle="${msg}" /></h2>
					<h2 class="hidden-md hidden-lg"><fmt:message key="savie.o2o.landing.Our.blog" bundle="${msg}" /></h2>
					<div class="row text-left">
						<div class="col-xs-12 col-md-4 fwd-col">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/stay-connect.png"/>
							<h3><a href="#"><fmt:message key="savie.o2o.landing.Staying.connected" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/7-musts.png"/>
							<h3><a href="#"><fmt:message key="savie.o2o.landing.7.musts" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/top-tips.png"/>
							<h3><a href="#"><fmt:message key="savie.o2o.landing.Top.tips" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
					</div>
					<p class="text-left hidden-xs hidden-sm"><fmt:message key="savie.o2o.landing.The.information" bundle="${msg}" /></p>
				</div>			
			</div>
			<a class="btn btn-full hidden-md hidden-lg" href="http://blog.fwd.com.hk/en_US/" target="_blank"><fmt:message key="savie.o2o.landing.Read" bundle="${msg}" /></a>	
			
			<!-- Customer Center Modal -->
			<div class="modal fade" role="dialog" aria-labelledby="customerCenter" id="customerCenter">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h2><fmt:message key="savie.o2o.landing.Getting.started" bundle="${msg}" /><br><fmt:message key="savie.o2o.landing.Just.follow" bundle="${msg}" /><br><fmt:message key="savie.o2o.landing.complete.your" bundle="${msg}" /></h2>
						</div>
						<div class="modal-body">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/infographic-steps.jpg" />
						</div>
						<div class="modal-footer">
							<div class="top-section">
								<h2><fmt:message key="savie.o2o.landing.Congratulations" bundle="${msg}" /></h2>
								<h4><fmt:message key="savie.o2o.landing.Your.application" bundle="${msg}" /></h4>
								<p><fmt:message key="savie.o2o.landing.Can't.make" bundle="${msg}" /></p>
							</div>
							
							<div class="bottom-section">
								<button type="button" class="btn" data-dismiss="modal"><fmt:message key="savie.o2o.landing.Continue" bundle="${msg}" /></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--Access Code Modal-->
			<div class="modal fade" role="dialog" aria-labelledby="accessCode" id="accessCodeO2O">
				<div class=" hunger-selling-container container-fluid" role="document">
					<div class="modal-content hunger-selling-content">
						<div class="hunger-selling-header text-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="hunger-selling-title"><fmt:message key="savie.o2o.landing.Please.enter" bundle="${msg}" /></h4>
						</div>
						<div class="modal-body hunger-selling-body">
							<form id="o2o-landing-form" method="post">
								<input placeholder="Access code" type="text" name="accessCodeConfirm" id="accessCodeConfirm" />
								<span class="validation-msg hidden-error-msg"><fmt:message key="savie.o2o.landing.The.code" bundle="${msg}" /></span>							
								<button type="submit" id="hunger-btn" class="btn hunger-btn"><fmt:message key="savie.o2o.landing.Submit" bundle="${msg}" /></button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			<!-- FOOTER -->
		</div>
		
		<!-- JS INCLUDES -->
		
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jasny-bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/fwd-validation.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/placeholders.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/jquery.timepicker.min.js"></script>
		
		<script type="text/javascript">
			var language = "en";

			// Access Code Cover
			$('#hunger-selling-buy-now-O2O').click(function(e){
				//$('.hunger-selling-container').removeClass('hidden');
				$('#accessCodeO2O').modal('show');
			});
            //
			// Access Code Cover Close
			//$('#close-cover').click(function(e){
			//	$('.hunger-selling-container').addClass('hidden');
			//});

			// Access Code Confirmation
			$('#hunger-btn').click(function(e){
				e.preventDefault();				
				
				var errorMsg = false;
				var accessCodeVal = $('#accessCodeConfirm').val();
				if (accessCodeVal == "") {
					$('.validation-msg').removeClass('hidden-error-msg');
					$('.validation-msg').html(getBundle(getBundleLanguage, "savie.landing.validation.msg"));
					errorMsg = true;
				} 
				else {
					$.get(
					    '${pageContext.request.contextPath}/ajax/savie/savings-insurance/verifyAccessCode',
						{ accessCode : accessCodeVal },
						function(data) {
							if(data.errMsgs){
								$('.validation-msg').removeClass('hidden-error-msg');
								$('.validation-msg').html(data.errMsgs);
								errorMsg = true;
							}
							else{
								$('.validation-msg').addClass('hidden-error-msg');
								var url = '${pageContext.request.contextPath}/${language}/savings-insurance/${nextPageFlow}';
								$("#o2o-landing-form").attr("action", url);
								$('#o2o-landing-form').submit();
							}
						})
						.fail(function(data) {
						});
				}	
			});
			
		//	$('#customerCenter').modal('show');
		//	$('#accessCodeO2O').modal('show');
			
		</script>
		