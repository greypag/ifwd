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
						<p class="bottom-text"><fmt:message key="savie.o2o.landing.Lump.sum.info" bundle="${msg}" /></p>
					</div>
				</div>
			</div>
			
			<div class="sign-up-teaser">
				<p class="sign-up-header"><fmt:message key="savie.o2o.landing.SAVIE.is.currently" bundle="${msg}" /></p>
				<div class="get-started-holder text-center">
					<button id="hunger-selling-buy-now-O2O" class="get-started"><fmt:message key="savie.o2o.landing.Get.started" bundle="${msg}" /></button>
				</div>
				<p class="sign-up-header below"><fmt:message key="savie.o2o.landing.Haven't.applied" bundle="${msg}" />
					<button id="signup"><fmt:message key="savie.o2o.landing.here" bundle="${msg}" /></button>
				.</p>
				<p class="footnote below"><fmt:message key="savie.o2o.landing.Access.code.info" bundle="${msg}" /></p>
			</div>
			
	        <div class="teaser-three-column O2O-landing">
					<div id="landing-three-column" class="fwd-container container-fluid three-column-widget O2O-landing">
						<div class="row row-top text-center">
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings-mobile" bundle="${msg}" />" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="savie.interestGather.feature1.header.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="savie.interestGather.feature1.header.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings" bundle="${msg}" />" class="hidden-xs hidden-sm">
											<p><fmt:message key="savie.interestGather.feature1.paragraph1" bundle="${msg}" /></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment-mobile" bundle="${msg}" />" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="savie.interestGather.feature2.header.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="savie.interestGather.feature2.header.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment" bundle="${msg}" />" class="hidden-xs hidden-sm">
											<p><fmt:message key="savie.interestGather.feature2.paragraph1" bundle="${msg}" /></p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-4 fwd-col">
								<div class="col-content col-content-teaser">
									<div class="clearfix">
										<div class="pull-left mobile-image hidden-md hidden-lg">
											<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional-mobile" bundle="${msg}" />" class="img-responsive">
										</div>
										<div class="right">
											<h2><fmt:message key="savie.interestGather.feature3.header.part1" bundle="${msg}" /></h2>
											<h3><fmt:message key="savie.interestGather.feature3.header.part2" bundle="${msg}" /></h3>
											<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional" bundle="${msg}" />" class="hidden-xs hidden-sm">
											<p><fmt:message key="savie.interestGather.feature3.paragraph1" bundle="${msg}" /></p>
											<p class="info-asterisk"><fmt:message key="savie.interestGather.feature3.footnote" bundle="${msg}" /><p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	          
					<div class="fwd-container container-fluid other-benefits-teaser O2O-landing">
						<div id="other-benefits" class="row">
							<div class="clearfix">
								<div class="pull-left mobile-image hidden-md hidden-lg">
									<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits-mobile" bundle="${msg}" />">
								</div>
								<div class="right">
									<div class="col-xs-12 col-md-8 pull-right">
										<h2 class="text-center"><fmt:message key="savie.interestGather.otherfeatures.header" bundle="${msg}" /></h2>
									</div>
									<div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
										<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits" bundle="${msg}" />" class="hidden-xs hidden-sm">
									</div>
									<div class="col-xs-12 col-md-8 fwd-col">
										<ul>
											<li><p><fmt:message key="savie.interestGather.otherfeatures.context1" bundle="${msg}" /></p></li>
											<a class="read-more hidden-md hidden-lg" id="read-more-other-benefits">Read more</a>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-0"><p><fmt:message key="savie.interestGather.otherfeatures.context5" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-1"><p><fmt:message key="savie.interestGather.otherfeatures.context2" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-2"><p><fmt:message key="savie.interestGather.otherfeatures.context6" bundle="${msg}" /></p></li>
											<li class="hidden-xs hidden-sm other-benefits-list-mobile" id="other-benefits-list-3"><p><fmt:message key="savie.interestGather.otherfeatures.context3" bundle="${msg}" /></p></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Disclaimer and Policy Provisions -->
						<div class="disclaimer-policy-teaser teaser-policy">
							<p class="h4-6"><fmt:message key="savie.interestGather.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="savie.interestGather.disclaimer.bochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="savie.interestGather.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="savie.interestGather.disclaimer.part3" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="savie.interestGather.disclaimer.provisions.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="savie.interestGather.disclaimer.part4" bundle="${msg}" /></u></a> <fmt:message key="savie.interestGather.disclaimer.part5" bundle="${msg}" /></p>
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
				<div class="read-blog-desktop three-column-widget O2O-landing">
					<h2 class="hidden-xs hidden-sm"><fmt:message key="savie.o2o.landing.Read.more" bundle="${msg}" /></h2>
					<h2 class="hidden-md hidden-lg"><fmt:message key="savie.o2o.landing.Our.blog" bundle="${msg}" /></h2>
					<div class="row text-left">
						<div class="col-xs-12 col-md-4 fwd-col">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/power-1-percent-savings-interest.jpg"/>
							<h3><a href="<fmt:message key="savie.o2o.landing.Staying.connected.link" bundle="${msg}" />"><fmt:message key="savie.o2o.landing.Staying.connected" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/saving-is-easier-than-you-think.jpg"/>
							<h3><a href="<fmt:message key="savie.o2o.landing.7.musts.link" bundle="${msg}" />"><fmt:message key="savie.o2o.landing.7.musts" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
						</div>
						<div class="col-md-4 fwd-col hidden-xs hidden-sm">
							<img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/3-saving-tips-smart-parents.jpg"/>
							<h3><a href="<fmt:message key="savie.o2o.landing.Top.tips.link" bundle="${msg}" />"><fmt:message key="savie.o2o.landing.Top.tips" bundle="${msg}" /><span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
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
				<div class=" hunger-selling-container container-fluid modal-dialog" role="document">
					<div class="modal-content hunger-selling-content">
						<div class="hunger-selling-header text-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="hunger-selling-title"><fmt:message key="savie.o2o.landing.Please.enter" bundle="${msg}" /></h4>
						</div>
						<div class="modal-body hunger-selling-body">
							<div>
								<form id="o2o-landing-form" method="post">
									<input placeholder="<fmt:message key="savie.o2o.landing.Access.code" bundle="${msg}" />" type="text" name="accessCodeConfirm" id="accessCodeConfirm" />
									<span class="validation-msg hidden-error-msg"><fmt:message key="savie.o2o.landing.The.code" bundle="${msg}" /></span>							
									<button type="submit" id="hunger-btn" class="btn hunger-btn"><fmt:message key="savie.o2o.landing.Submit" bundle="${msg}" /></button>
								</form>
							</div>
							<div class="disclaier">
								<fmt:message key="savie.o2o.landing.Access.code.disclaimer.part1" bundle="${msg}" /> <a href="<fmt:message key="savie.o2o.landing.Access.code.disclaimer.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.o2o.landing.Access.code.disclaimer.link.text" bundle="${msg}" /></a> <fmt:message key="savie.o2o.landing.Access.code.disclaimer.part2" bundle="${msg}" />
							</div>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			
			<!--Signup Now Modal-->
			<div class="modal fade" role="dialog" aria-labelledby="signupnow" id="signup-now-modal">
				<div class=" hunger-selling-container container-fluid modal-dialog" role="document">
					<div class="modal-content hunger-selling-content">
						<div class="hunger-selling-header text-center">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="hunger-selling-title">Sign up now and await for our notification!</h4>
						</div>
						<div class="modal-body hunger-selling-body">
							<form method="post" id="teaserSignUpForm" action="">
								<div class="input-holder">
									<input placeholder="Email address [compulsory]" type="text" name="signupEmail" id="teaserEmail"/>
									<span id="emailErrMsg" class="error-email">Please enter your email address.</span>
									<input placeholder="Mobile no." type="text" name="signupMobileNo" id="teaserPhoneNo"/>
									<span id="phoneErrMsg" class="error-email hideSpan">&nbsp;</span>
									<input type="hidden" name="affiliate" value="${affiliate}">
								</div>

								<div class="fwd-checkbox">
									<input type="checkbox" id="personal-information-statement-signup" name="isPics" value="pics">
									<label for="personal-information-statement-signup"></label>
									<p class="notice">I have read, understood and accept this <a href="<fmt:message key="savie.interestGather.personal.collection.link" bundle="${msg}" />" target="_blank">Personal Information Collection Statement.</a></p>
								</div>

								<div class="fwd-checkbox">
									<input type="checkbox" id="terms-condition-statement-signup" name="isTc" value="tc">
									<label for="terms-condition-statement-signup"></label>
									<p class="notice">I have read, understood and accept these <a href="<%=request.getContextPath()%>/<fmt:message key="savie.interestGather.terms.conditions.link" bundle="${msg}" />" target="_blank">Terms and Conditions.</a></p>
								</div>
								<span class="error-email chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>					
								<button type="submit" id="signup-btn" class="btn hunger-btn">Sign up now</button>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->	
			</div><!-- /.modal -->
			<!-- FOOTER -->
		</div>
		
		
		<div class="modal fade" role="dialog" aria-labelledby="teaserSurvery"
			id="teaserSurvery">
			<div class="modal-dialog teaserSurvey" role="document">
				<div class="modal-content teaserSurvey">
					<div class="modal-header teaserSurvey">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h2><fmt:message key="savie.interestGather.survey.thank.you" bundle="${msg}" /></h2>
					</div>
					<div class="modal-body teaserSurvey">
						<p class="registered"><fmt:message key="savie.interestGather.survey.successfully.registered" bundle="${msg}" /></p>
						<p class="registered"><fmt:message key="savie.interestGather.survey.tell.more" bundle="${msg}" /></p>
		
						<div class="modal-divider"></div>
		
						<p class="question"><fmt:message key="savie.interestGather.survey.plan.save" bundle="${msg}" /></p>
		
						<form class="amount-to-save">
							<div class="teaser-select">
									<select class="form-control saveDropdown" name="amountToSave"
									id="amountToSave">
									<option selected disabled value=""><fmt:message key="savie.interestGather.survey.please.select" bundle="${msg}" /></option>
									<c:forEach var="savieAns" items="${savieAns}" varStatus="theCount">
										<option value="${savieAns.itemCode }" class="options">${savieAns.itemDesc }</option>
									</c:forEach>
								</select>
							</div>
							<button type="submit" class="btn btn-white btn-thank-you"
								id="teaser-mmodal-submit" onclick="sendStep2Email()"><fmt:message key="savie.interestGather.survey.submit" bundle="${msg}" /></button>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<!-- JS INCLUDES -->
		
		<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
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
		<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>
		
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
							if(data.errMsgs == "empty access code"){
								$('.validation-msg').removeClass('hidden-error-msg');
								$('.validation-msg').html(getBundle(getBundleLanguage, "savie.landing.empty.access.code.validation.msg"));
								errorMsg = true;
							}
							else if(data.errMsgs == "Access has been used"){
								$('.validation-msg').removeClass('hidden-error-msg');
								$('.validation-msg').html(getBundle(getBundleLanguage, "savie.landing.used.access.code.validation.msg"));
								errorMsg = true;
							}
							else if(data.errMsgs){
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

			// Sign up now validation
			$('#teaserSignUpForm').submit(function(e){
				e.preventDefault();				
				
				var errorMsg = false;
				var signupEmail = $('#signupEmail').val();
				var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				var validEmail = re.test(signupEmail);
				if (signupEmail == "" || !validEmail) {
					// $('#emailErrMsg').addClass('visible');
					$('#emailErrMsg').css('visibility', 'visible');
					errorMsg = true;
				}
			});
			
			// Sign up Now Button
			$('#signup').click(function(e){
				$('#signup-now-modal').modal('show');
			});
			
			$('#read-more-other-benefits').click(function(e){
				$('.other-benefits-list-mobile').removeClass('hidden-xs');
				$('.other-benefits-list-mobile').removeClass('hidden-sm');
				$('#read-more-other-benefits').hide();
			});
			
		</script>
		