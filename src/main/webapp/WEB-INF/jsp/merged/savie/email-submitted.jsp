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
		<h2><fmt:message key="savie.emailSubmit.header" bundle="${msg}" /></h2>

		<h4><fmt:message key="savie.emailSubmit.paragraph.part1" bundle="${msg}" /></br><fmt:message key="savie.emailSubmit.paragraph.part2" bundle="${msg}" /><span class="savie-bold"><fmt:message key="savie.emailSubmit.paragraph.part3" bundle="${msg}" /></span> <fmt:message key="savie.emailSubmit.paragraph.part4" bundle="${msg}" /></h4>


		<div class="clearfix">
			<div class="left-desktop">
				<img src="<%=request.getContextPath()%><fmt:message key="img.teaser.confirmation" bundle="${msg}" />">
			</div>
			<div class="left-desktop text">
				<h3><fmt:message key="savie.emailSubmit.act.now" bundle="${msg}" /></h3>
				<div class="fwd-div-btn">
					<button id="fwd-fb-share" type="button" class="btn-fwd-fb">
						<i class="fa fa-facebook fwd-fb"></i><fmt:message key="savie.emailSubmit.share.facebook" bundle="${msg}" />
					</button>
					<a id="wa-share" href="whatsapp://send" data-text="<fmt:message key="savie.emailSubmit.share.whatsapp.msg" bundle="${msg}" />" data-href="" class="wa_btn wa_btn_m" style="display:none;" target="_top"><!--<i class="fa fa-whatsapp"></i>--><img src="<%=request.getContextPath()%>/resources/images/savie/whatsapp.png" class="img-responsive whatsapp-icon" /><fmt:message key="savie.emailSubmit.share.whatsapp" bundle="${msg}" /></a>
				</div>

			</div>
		</div>

		<!--<button type="button" class="btn-white btn-confirmation" id="teaser-back-at-home"><fmt:message key="savie.emailSubmit.back.home" bundle="${msg}" /></button>-->
		<div class="back-at-home-div">
			<a href="<%=request.getContextPath()%>/${language}/savings-insurance" class="back-at-home"><fmt:message key="savie.emailSubmit.back.home" bundle="${msg}" /></a>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	$(function() {
		var b = document.getElementById('wa-share');
		var waShareUrl = 'https:' + "//"  + window.location.host + "<%=request.getContextPath()%>/${language}/savings-insurance";
		var text = "?text=" + encodeURIComponent(b.getAttribute("data-text")) + (b.getAttribute("data-text") ? "%20" : "") + encodeURIComponent(waShareUrl);
		b.setAttribute("href", b.getAttribute("href") + text);
		
		var fbShareUrl = 'https:' + "//"  + window.location.host + "<%=request.getContextPath()%>/${language}/savings-insurance";
		$('#fwd-fb-share').on('click', function() {
			window.open('http://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(fbShareUrl) + '&','', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');
		});
	});
</script>
