<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
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
</script>

<!-- reCAPTCHA widget -->
<!-- 
<script type="text/javascript">
	var onloadCallback = function() {
		grecaptcha.render('captchaBox', {
			'sitekey' : '6LfP6QcTAAAAAHlgmCoww2R_FXgjmGOZawHB2lFZ',
			'theme' : 'light',
			'type' : 'audio image'
		});
	};
</script>
 -->

 <!-- teaser-container -->
<div class="teaser-container">
<div class="teaser-banner container-fluid" id="hunger-selling-banner">
	<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner-desktop-en" bundle="${msg}" />"
		id="teaser-banner-mobile-en" 
		class="max hidden-xs hidden-sm hidden">
	<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner-mobile-en" bundle="${msg}" />"
		id="teaser-banner-desktop-en" 
		class="max hidden-md hidden-lg hidden">
	<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner-desktop-ch" bundle="${msg}" />"
		id="teaser-banner-mobile-ch" 
		class="max hidden-xs hidden">
	<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner-mobile-ch" bundle="${msg}" />"
		id="teaser-banner-desktop-ch hidden-sm " 
		class="max hidden-md hidden-lg hidden">
	<div class="text-content hidden" id="banner-text-english">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.mobile" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />" 
			class="img-responsive mobile teaser-banner-mobile hidden">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />"
			class="img-responsive desktop teaser-banner-desktop">
	</div>
	<div class="text-content hidden" id="banner-text-chinese">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.mobile.ch" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />" 
			class="img-responsive mobile teaser-banner-mobile hidden">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner.ch" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />"
			class="img-responsive desktop teaser-banner-desktop">
	</div>
</div>

<div class="fwd-full-container container-fluid teaser">
	<div class="fwd-container-limit">
		<div class="teaser-banner-text">
			<div class="money-div">
				<img src="<%=request.getContextPath()%><fmt:message key="img.money.logo" bundle="${msg}" />" class="money">
			</div>
			<!--  <p class="additional top"><fmt:message key="savie.interestGather.banner.header" bundle="${msg}" /></p>-->
			<p class="additional top"><fmt:message key="savie.interestGather.banner.Uppertext.part1" bundle="${msg}" /></p>
			<p class="additional top lower"><fmt:message key="savie.interestGather.banner.Uppertext.part2" bundle="${msg}" /></p>
			<p class="top"><fmt:message key="savie.interestGather.banner.Uppertext.part3" bundle="${msg}" /></p>
			
			<ul class="crediting-rate-list clearfix">
				<li><span class="percent">3% </span><span class="year"><fmt:message key="savie.interestGather.banner.list.header1" bundle="${msg}" /></span></li>
				<li class="middle"><div class="white"></div><span class="percent">3% </span><span class="year"><fmt:message key="savie.interestGather.banner.list.header2" bundle="${msg}" /></span><div class="white right"></div></li>
				<li><span class="percent gold">4% </span><span class="year gold"><fmt:message key="savie.interestGather.banner.list.header3" bundle="${msg}" /></span></li>
			</ul>
			<!--  
			<p class="bottom-text upper"><fmt:message key="savie.interestGather.banner.paragraph1" bundle="${msg}" /></p>
			<p class="bottom-text"><fmt:message key="savie.interestGather.banner.paragraph2" bundle="${msg}" /></p>
			-->
			<p class="bottom-text upper"><fmt:message key="savie.interestGather.banner.Lowertext.part1" bundle="${msg}" /></p>
			<p class="bottom-text lower"><span class="asterisk">*</span><fmt:message key="savie.interestGather.banner.Lowertext.part2" bundle="${msg}" /></p>
			
			<div class="product-downloads">
				<a href="#" class="product"><img src="<%=request.getContextPath()%><fmt:message key="savie.interestGather.banner.download.img" bundle="${msg}" />" class="dl-img"><fmt:message key="savie.interestGather.banner.product.brochure" bundle="${msg}" /></a>
				<a href="#" class="product lower"><img src="<%=request.getContextPath()%><fmt:message key="savie.interestGather.banner.download.img" bundle="${msg}" />" class="dl-img lower"><fmt:message key="savie.interestGather.banner.product.provisions" bundle="${msg}" /></a>
			</div>
		</div>
	</div>
</div>

<div class="sign-up-teaser">
	

	<!--
	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context1" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context2" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context3" bundle="${msg}" /></p>
	-->

	<form class="sign-up-teaser-form" method="post" id="teaserSignUpForm" action="teaser.jsp">
		<p class="sign-up-header"><fmt:message key="savie.interestGather.signupform.header.part1" bundle="${msg}" /></br><fmt:message key="savie.interestGather.signupform.header.part2" bundle="${msg}" /></p>
		<div class="form-group">
			<input type="email" placeholder="<fmt:message key="savie.interestGather.signupform.enter.email" bundle="${msg}" />" class="form-control email" id="teaserEmail" name="teaserEmail" val="" maxlength="50" onkeypress="checkChineseCharEmail(event)"> 
			<span class="error-msg hideSpan" id="emailAddrsMessage">&nbsp;</span>
			<input type="tel" placeholder="<fmt:message key="savie.interestGather.signupform.enter.phone" bundle="${msg}" />" class="form-control email phone-no" id="teaserPhoneNo" name="teaserPhoneNo" maxlength="8" min="1" oninput="maxLengthReview(this)" onkeydown="return isNumberKey(event)">
			<span class="error-msg hideSpan" id="phoneErrMsg">&nbsp;</span>
			<input type="hidden" name="affiliate" value="${affiliate}">
		</div>
		<div class="clearfix">
			<div class="pull-left checkbox">
				<input type="checkbox" value="pics" id="pics-check" name="isPics" />
				<label id="pics-check-label-top" for="pics-check"></label>
			</div>
            <div id="pics-check-label" class="pull-left text"><fmt:message key="savie.interestGather.signupform.PICS.read.accept1" bundle="${msg}" /> <a href="<fmt:message key="savie.interestGather.personal.collection.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.interestGather.signupform.personal.collection" bundle="${msg}" /></a><fmt:message key="savie.interestGather.signupform.PICS.read.accept2" bundle="${msg}" /></div>
		</div>

		<div class="clearfix top">
			<div class="pull-left checkbox">
				<input type="checkbox" value="tc" id="tc-check" name="isTc" /> 
				<label for="tc-check" id="tc-check-label-top"></label>
			</div>
            <div id="tc-check-label" class="pull-left text"><fmt:message key="savie.interestGather.signupform.tnc.read.accept1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="savie.interestGather.terms.conditions.link" bundle="${msg}" />" target="_blank"><fmt:message key="savie.interestGather.signupform.terms.conditions" bundle="${msg}" /></a><fmt:message key="savie.interestGather.signupform.tnc.read.accept2" bundle="${msg}" /></div>
		</div>

		<span class="error-msg chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>
		
		<div id="captchaBox"></div>
		<button type="submit" class="btn btn-white btn-sign-up" id="teaser-sign-up-btn"><fmt:message key="savie.interestGather.signupform.signup" bundle="${msg}" /></button>
	</form>
<!-- 
	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit&hl=${captchaLang}"
		async defer>
	</script>
 -->	
</div>
</div>
<!-- End of teaser-container -->
<div class="yellow-stick-btn hidden-md hidden-lg hidden" id="sign-me-up-btn">
	<button type="button" class="yellow-btn">
		<h3><fmt:message key="savie.interestGather.signmeup.text.part1" bundle="${msg}" /></h3>
		<h4><fmt:message key="savie.interestGather.signmeup.text.part2" bundle="${msg}" /></h4>
		<img src="<%=request.getContextPath()%><fmt:message key="savie.interestGather.signmeup.img" bundle="${msg}" />" class="caret-triangle">
	</button>
				
	
</div>
<div id="usps" class="teaser-three-column">
	<div id="landing-three-column"
		class="fwd-container container-fluid three-column-widget">
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
							<p><fmt:message key="savie.interestGather.feature1.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature1.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature1.paragraph3" bundle="${msg}" /></p>
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
							<p><fmt:message key="savie.interestGather.feature2.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature2.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature2.paragraph3" bundle="${msg}" /></p>
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
							<p><fmt:message key="savie.interestGather.feature3.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature3.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature3.paragraph3" bundle="${msg}" /></p>
							<p class="info-asterisk"><fmt:message key="savie.interestGather.feature3.footnote" bundle="${msg}" /><p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="fwd-container container-fluid other-benefits-teaser">
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
							<li class="hidden-xs hidden-sm" id="other-benefits-list-0"><p><fmt:message key="savie.interestGather.otherfeatures.context5" bundle="${msg}" /></p></li>
							<li class="hidden-xs hidden-sm" id="other-benefits-list-1"><p><fmt:message key="savie.interestGather.otherfeatures.context2" bundle="${msg}" /></p></li>
							<li class="hidden-xs hidden-sm" id="other-benefits-list-2"><p><fmt:message key="savie.interestGather.otherfeatures.context3" bundle="${msg}" /></p></li>
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
								<enhance:out escapeXml="false">
								    <option value="${savieAns.itemCode }" class="options">${savieAns.itemDesc }</option>
								</enhance:out>
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

<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>
<script type="text/javascript">
$(function() {
	
	$('#sign-me-up-btn').click(function(){
		$('html, body').animate({
			scrollTop: $('.sign-up-teaser-form').offset().top -  ($('.navbar-fixed-top').height())
		}, 1000);
	});
	
	
	$('#read-more-other-benefits').click(function(){
		//console.log('kjshfd');
		$('#read-more-other-benefits').addClass('hidden');
		$('#other-benefits-list-0').removeClass('hidden-xs');
		$('#other-benefits-list-0').removeClass('hidden-sm');
		$('#other-benefits-list-1').removeClass('hidden-xs');
		$('#other-benefits-list-1').removeClass('hidden-sm');
		$('#other-benefits-list-2').removeClass('hidden-xs');
		$('#other-benefits-list-2').removeClass('hidden-sm');
	});

	$("#pics-check-label").click(function(e) {
		$("#pics-check-label-top").trigger('click');
	});

	$("#tc-check-label").click(function(e) {
		$("#tc-check-label-top").trigger('click');
	});
});
</script>