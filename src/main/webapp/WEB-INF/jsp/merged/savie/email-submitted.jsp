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
		<h2><fmt:message key="savie.emaiSubmit.thank.completing" bundle="${msg}" /></h2>

		<h4><fmt:message key="savie.emaiSubmit.share.love" bundle="${msg}" /><span class="savie-bold"><fmt:message key="savie.emaiSubmit.savie" bundle="${msg}" /></span><fmt:message key="savie.emaiSubmit.saving.together" bundle="${msg}" /></h4>


		<div class="clearfix">
			<div class="left-desktop">
				<img src="<%=request.getContextPath()%>/resources/images/savie/teaser-confirmation-image.png">
			</div>
			<div class="left-desktop text">
				<h3><fmt:message key="savie.emaiSubmit.annual.return" bundle="${msg}" /></h3>
				<p class="act-now"><fmt:message key="savie.emaiSubmit.act.now" bundle="${msg}" /></p>
				<div class="fwd-div-btn">
					<button type="button" class="btn-fwd-fb">
						<i class="fa fa-facebook fwd-fb"></i><fmt:message key="savie.emaiSubmit.share.facebook" bundle="${msg}" />
					</button>
				</div>

			</div>
		</div>

		<button type="button" class="btn-white btn-confirmation"><fmt:message key="savie.emaiSubmit.back.home" bundle="${msg}" /></button>
	</div>
</div>