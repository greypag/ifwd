<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
</script>


<div class="text-center banner-widget container-fluid">
	<div class="fwd-container container-fluid breadcrumbs">
		<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
			<li><a href="#"><fmt:message key="savie.landing.home" bundle="${msg}" /></a></li>
			<li class="divider"><i class="fa fa-play"></i></li>
			<li><a href="#"><fmt:message key="savie.landing.save" bundle="${msg}" /></a></li>
			<li class="divider last"><i class="fa fa-play"></i></li>
			<li class="active-bc"><fmt:message key="savie.landing.savie" bundle="${msg}" />Savie</li>
		</ol>
	</div>

	<div class="text-content">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.mobile" bundle="${msg}" />"
			title="Savie is always sweeter" alt="Savie is always sweeter"
			class="img-responsive hidden-md hidden-lg teaser-banner-mobile">
		<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.banner" bundle="${msg}" />"
			title="Savie is always sweeter" alt="Savie is always sweeter"
			class="img-responsive hidden-xs hidden-sm teaser-banner-desktop">
	</div>
</div>

<div class="fwd-full-container container-fluid teaser">
	<div class="fwd-container-limit">
		<div class="teaser-banner-text">
			<div class="money-div">
				<img src="<%=request.getContextPath()%><fmt:message key="img.money.logo" bundle="${msg}" />" class="money">
			</div>
			<p class="save-my-way"><fmt:message key="savie.interestGather.my.way" bundle="${msg}" /></p>
			<p class="guaranteed top"><fmt:message key="savie.interestGather.annual.return" bundle="${msg}" /></p>
			<p class="additional top"><fmt:message key="savie.interestGather.act.now.context1" bundle="${msg}" />
				<span class="add"><fmt:message key="savie.interestGather.act.now.context2" bundle="${msg}" /></span>annual
				<fmt:message key="savie.interestGather.act.now.context3" bundle="${msg}" />
			</p>
			<p class="sign-up"><fmt:message key="savie.interestGather.sign.now" bundle="${msg}" />
		</div>
	</div>
</div>

<div class="sign-up-teaser">
	<p class="sign-up-header"><fmt:message key="savie.interestGather.coming.soon" bundle="${msg}" /></p>

	<p class="email-notification"><fmt:message key="savie.interestGather.email.notification.context1" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.email.notification.context2" bundle="${msg}" /></p>
	<p class="email-notification"><fmt:message key="savie.interestGather.email.notification.context3" bundle="${msg}" /></p>

	<form class="sign-up-teaser-form" method="post" id="teaserSignUpForm" action="teaser.jsp">
		<div class="form-group">
			<input type="email" placeholder="<fmt:message key="savie.interestGather.enter.email" bundle="${msg}" />" class="form-control email" id="teaserEmail" name="teaserEmail" val=""> 
			<span class="error-msg hideSpan" id="emailAddrsMessage">&nbsp;</span>
			<input type="tel" placeholder="<fmt:message key="savie.interestGather.enter.phone" bundle="${msg}" />" class="form-control email phone-no" id="teaserPhoneNo" name="teaserPhoneNo" maxlength="11" min="1" oninput="maxLengthReview(this)"> 
			<span class="error-msg hideSpan" id="phoneErrMsg">&nbsp;</span>
		</div>
		<div class="clearfix">
			<div class="pull-left checkbox">
				<input type="checkbox" value="pics" id="pics-check" name="isPics" />
				<label for="pics-check"></label>
			</div>
			<div class="pull-left text"><fmt:message key="savie.interestGather.read.accept" bundle="${msg}" /><a href=""><fmt:message key="savie.interestGather.personal.collection" bundle="${msg}" /></a>. </div>
		</div>

		<div class="clearfix top">
			<div class="pull-left checkbox">
				<input type="checkbox" value="tc" id="tc-check" name="isTc" /> <label
					for="tc-check"></label>
			</div>
			<div class="pull-left text"><fmt:message key="savie.interestGather.read.accept" bundle="${msg}" />
			<a href=""><fmt:message key="savie.interestGather.terms.conditions" bundle="${msg}" /></a>.
			</div>
		</div>
		<span class="error-msg chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>
		<button type="submit" class="btn btn-white btn-sign-up" id="teaser-sign-up-btn" ><fmt:message key="savie.interestGather.sign.up" bundle="${msg}" /></button>
	</form>
</div>

<div id="flux">
	<div id="landing-three-column"
		class="fwd-container container-fluid three-column-widget">
		<div class="row row-top text-center">
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.save.earn" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.big.ease" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.big.savings" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.guarantees.earnings.context1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.guarantees.earnings.context2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.guarantees.earnings.context3" bundle="${msg}" /></p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.flexible.free" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.from.charges" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.no.commitment" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.enjoy.flexibility.context1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.enjoy.flexibility.context2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.enjoy.flexibility.context3" bundle="${msg}" /></p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2><fmt:message key="savie.interestGather.make.most" bundle="${msg}" /></h2>
					<h2 class="out-life"><fmt:message key="savie.interestGather.out.life" bundle="${msg}" /></h2>
					<h3><fmt:message key="savie.interestGather.extra.protection" bundle="${msg}" /></h3>
					<img src="<%=request.getContextPath()%><fmt:message key="img.free.additional" bundle="${msg}" />">
					<p><fmt:message key="savie.interestGather.death.benefit.context1" bundle="${msg}" /><span><fmt:message key="savie.interestGather.death.benefit.context2" bundle="${msg}" /></span><fmt:message key="savie.interestGather.death.benefit.context3" bundle="${msg}" /></p>
				</div>
			</div>
		</div>
	</div>

	<div class="fwd-container container-fluid">
		<div id="other-benefits" class="row">
			<div class="col-xs-12 col-md-8 pull-right">
				<h2 class="text-center"><fmt:message key="savie.interestGather.other.features" bundle="${msg}" /></h2>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
				<img src="<%=request.getContextPath()%><fmt:message key="img.other.benefits" bundle="${msg}" />">
			</div>
			<div class="col-xs-12 col-md-8 fwd-col">
				<ul>
					<li><p><fmt:message key="savie.interestGather.other.features.context1" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.other.features.context2" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.other.features.context3" bundle="${msg}" /></p></li>
					<li><p><fmt:message key="savie.interestGather.other.features.context4" bundle="${msg}" /></p></li>
				</ul>
			</div>
		</div>
		<!-- Disclaimer and Policy Provisions -->
		<div class="disclaimer-policy">
			<p><fmt:message key="savie.interestGather.features.above" bundle="${msg}" /></p>
		</div>
	</div>


</div>

<!--<button type="button" class="btn btn-full hidden-md hidden-lg">Read more</button>-->
<a class="btn btn-full hidden-md hidden-lg"
	href="http://blog.fwd.com.hk/en_US/" target="_blank"><fmt:message key="savie.interestGather.read.more" bundle="${msg}" /></a>

<div class="modal fade" role="dialog" aria-labelledby="teaserSurvery"
	id="teaserSurvery">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2><fmt:message key="savie.interestGather.thank.you" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="savie.interestGather.successfully.registered" bundle="${msg}" /></p>
				<p class="registered"><fmt:message key="savie.interestGather.tell.more" bundle="${msg}" /></p>

				<div class="modal-divider"></div>

				<p class="question"><fmt:message key="savie.interestGather.plan.save" bundle="${msg}" /></p>

				<form class="amount-to-save">
					<div class="teaser-select">
						<span class="icon-chevron-thin-down orange-caret"
							id="dropdown-caret"></span> 
							<select class="form-control saveDropdown" name="amountToSave"
							id="amountToSave">
							<option selected disabled value=""><fmt:message key="savie.interestGather.please.select" bundle="${msg}" /></option>
							<c:forEach var="savieAns" items="${savieAns}" varStatus="theCount">
								<option value="${savieAns.itemCode }">${savieAns.itemDesc }</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-white btn-thank-you"
						id="teaser-mmodal-submit" onclick="sendStep2Email()"><fmt:message key="savie.interestGather.submit" bundle="${msg}" /></button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>