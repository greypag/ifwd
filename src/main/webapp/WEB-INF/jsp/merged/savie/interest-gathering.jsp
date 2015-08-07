<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
</script>

<!-- reCAPTCHA widget -->
<script type="text/javascript">
	var onloadCallback = function() {
		grecaptcha.render('captchaBox', {
			'sitekey' : '6Lcs0AoTAAAAAMASZ3HsfT92CrOCHqQERi5ZV7wk',
			'theme' : 'light',
			'type' : 'audio image',
			'language' : 'en'
		});
	};
</script>


<div class="text-center banner-widget container-fluid">

	<div class="text-content">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.mobile" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />" 
			class="img-responsive hidden-md hidden-lg teaser-banner-mobile">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner" bundle="${msg}" />"
			title="<fmt:message key="savie.interestGather.sologan" bundle="${msg}" />"
			class="img-responsive hidden-xs hidden-sm teaser-banner-desktop">
	</div>
</div>

<div class="fwd-full-container container-fluid teaser">
	<div class="fwd-container-limit">
		<div class="teaser-banner-text">
			<div class="money-div">
				<img src="<%=request.getContextPath()%><fmt:message key="img.money.logo" bundle="${msg}" />" class="money">
			</div>
			<p class="additional top"><fmt:message key="savie.interestGather.banner.header" bundle="${msg}" /></p>
			<ul class="crediting-rate-list clearfix">
				<li><span class="percent">3% </span><span class="year"><fmt:message key="savie.interestGather.banner.list.header1" bundle="${msg}" /></span></li>
				<li class="middle"><div class="white"></div><span class="percent">3% </span><span class="year"><fmt:message key="savie.interestGather.banner.list.header2" bundle="${msg}" /></span><div class="white right"></div></li>
				<li><span class="percent gold">4% </span><span class="year gold"><fmt:message key="savie.interestGather.banner.list.header3" bundle="${msg}" /></span></li>
			</ul>
			<p class="bottom-text upper"><fmt:message key="savie.interestGather.banner.paragraph1" bundle="${msg}" /></p>
			<p class="bottom-text"><fmt:message key="savie.interestGather.banner.paragraph2" bundle="${msg}" /></p>
		</div>
	</div>
</div>

<div class="sign-up-teaser">
	<p class="sign-up-header"><fmt:message key="savie.interestGather.signupform.header.part1" bundle="${msg}" /></br><fmt:message key="savie.interestGather.signupform.header.part2" bundle="${msg}" /></p>

	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context1" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context2" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.signupform.notification.context3" bundle="${msg}" /></p>

	<form class="sign-up-teaser-form" method="post" id="teaserSignUpForm" action="teaser.jsp">
		<div class="form-group">
			<input type="email" placeholder="<fmt:message key="savie.interestGather.signupform.enter.email" bundle="${msg}" />" class="form-control email" id="teaserEmail" name="teaserEmail" val=""> 
			<span class="error-msg hideSpan" id="emailAddrsMessage">&nbsp;</span>
			<input type="tel" placeholder="<fmt:message key="savie.interestGather.signupform.enter.phone" bundle="${msg}" />" class="form-control email phone-no" id="teaserPhoneNo" name="teaserPhoneNo" maxlength="8" min="1" oninput="maxLengthReview(this)"> 
			<span class="error-msg hideSpan" id="phoneErrMsg">&nbsp;</span>
		</div>
		<div class="clearfix">
			<div class="pull-left checkbox">
				<input type="checkbox" value="pics" id="pics-check" name="isPics" />
				<label for="pics-check"></label>
			</div>
			<div class="pull-left text"><fmt:message key="savie.interestGather.signupform.PICS.read.accept1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/upload/${langLink}/LHK_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf" target="_blank"><fmt:message key="savie.interestGather.signupform.personal.collection" bundle="${msg}" /></a><fmt:message key="savie.interestGather.signupform.PICS.read.accept2" bundle="${msg}" /></div>
		</div>

		<div class="clearfix top">
			<div class="pull-left checkbox">
				<input type="checkbox" value="tc" id="tc-check" name="isTc" /> <label
					for="tc-check"></label>
			</div>
			<div class="pull-left text"><fmt:message key="savie.interestGather.signupform.tnc.read.accept1" bundle="${msg}" /> <a href="http://www.fwd.com.hk/upload/${langLink}/LHK_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf" target="_blank"><fmt:message key="savie.interestGather.signupform.terms.conditions" bundle="${msg}" /></a><fmt:message key="savie.interestGather.signupform.tnc.read.accept2" bundle="${msg}" /></div>
		</div>

		<span class="error-msg chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>
		
		<div id="captchaBox"></div>
		<button type="submit" class="btn btn-white btn-sign-up" id="teaser-sign-up-btn" ><fmt:message key="savie.interestGather.signupform.signup" bundle="${msg}" /></button>
	</form>
	<script src="https://www.google.com/recaptcha/api.js?hl=en&onload=onloadCallback&render=explicit"
		async defer>
	</script>
</div>

<div id="flux">
	<div id="landing-three-column"
		class="fwd-container container-fluid three-column-widget">
		<div class="row row-top text-center">
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.feature1.header.part1" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.feature1.header.part2" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.feature1.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature1.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature1.paragraph3" bundle="${msg}" /></p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.feature2.header.part1" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.feature2.header.part2" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.feature2.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature2.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature2.paragraph3" bundle="${msg}" /></p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.feature3.header.part1" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.feature3.header.part2" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.feature3.paragraph1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.feature3.paragraph2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.feature3.paragraph3" bundle="${msg}" /></p>
					<p class="info-asterisk"><fmt:message key="savie.interestGather.feature3.footnote" bundle="${msg}" /><p>
				</div>
			</div>
		</div>
	</div>

	<div class="fwd-container container-fluid">
		<div id="other-benefits" class="row">
			<div class="col-xs-12 col-md-8 pull-right">
				<h2 class="text-center"><fmt:message key="savie.interestGather.otherfeatures.header" bundle="${msg}" /></h2>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
				<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits" bundle="${msg}" />">
			</div>
			<div class="col-xs-12 col-md-8 fwd-col">
				<ul>
					<li><p><fmt:message key="savie.interestGather.otherfeatures.context1" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.otherfeatures.context5" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.otherfeatures.context2" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.otherfeatures.context3" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.otherfeatures.context4" bundle="${msg}" /></p></li>
				</ul>
			</div>
		</div>
		<!-- Disclaimer and Policy Provisions -->
		<div class="disclaimer-policy teaser-policy">
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
						<span class="icon-chevron-thin-down orange-caret"
							id="dropdown-caret"></span> 
							<select class="form-control saveDropdown" name="amountToSave"
							id="amountToSave">
							<option selected disabled value=""><fmt:message key="savie.interestGather.survey.please.select" bundle="${msg}" /></option>
							<c:forEach var="savieAns" items="${savieAns}" varStatus="theCount">
								<option value="${savieAns.itemCode }">${savieAns.itemDesc }</option>
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