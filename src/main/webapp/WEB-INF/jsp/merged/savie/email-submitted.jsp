<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div class="teaser-confirmation-block">
	<div class="fwd-container container-fluid teaser-confirmation">
		<h2><fmt:message key="savie.emailSubmit.thank.completing" bundle="${msg}" /></h2>

		<h4><fmt:message key="savie.emailSubmit.share.love" bundle="${msg}" /><span class="savie-bold"><fmt:message key="savie.emailSubmit.savie" bundle="${msg}" /></span><fmt:message key="savie.emailSubmit.saving.together" bundle="${msg}" /></h4>


		<div class="clearfix">
			<div class="left-desktop">
				<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.confirmation" bundle="${msg}" />">
			</div>
			<div class="left-desktop text">
				<h3><fmt:message key="savie.emailSubmit.annual.return" bundle="${msg}" /></h3>
				<p class="act-now"><fmt:message key="savie.emailSubmit.act.now" bundle="${msg}" /></p>
				<div class="fwd-div-btn">
					<button type="button" class="btn-fwd-fb">
						<i class="fa fa-facebook fwd-fb"></i><fmt:message key="savie.emailSubmit.share.facebook" bundle="${msg}" />
					</button>
				</div>

			</div>
		</div>

		<button type="button" class="btn-white btn-confirmation"><fmt:message key="savie.emailSubmit.back.home" bundle="${msg}" /></button>
	</div>
</div>