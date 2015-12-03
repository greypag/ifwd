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
</script>
<%!
			boolean isSaleActiveClass = true;
			boolean isEservicesActiveClass = false;
		%>
        <div class="fwd-savie-wrapper">
			<div class="container-fluid fwd-full-container">
                <div class="application-page-header et-header-browse">
                    <div class="et-back-arrow hidden-xs hidden-sm">
                        <a href="#" class="et-back-arrow-link">
                            <span class="icon-arrow-left2 arrow-left"></span>
                        </a>
                    </div>
                    <div class="row reset-margin hidden-xs hidden-sm">
                  <div class="col-md-12 reset-padding">
                      <button type="button" class="et-header-info-btn et-bind-btn-header active" id="confirmation" data-et-section-target="et-dec-sign-section">Confirmation</button>
                  </div>
                  </div>
                    <div class="et-mobile-header-info hidden-md hidden-lg">
                        <div class="clearfix">
                            <div class="et-back-arrow">
                                <a href="#" class="et-back-arrow-link">
                                    <span class="icon-arrow-left2 arrow-left"></span>
                                </a>
                            </div>
                            <div class="et-header-tex">
                                <h3 id="et-active-section-label">Confirmation</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="application-flux thank-you">
				<div class="container-fluid fwd-container thank-you-container">
					<h1><fmt:message key="savie.confirmation.offline.Thank.you" bundle="${msg}" /><!--<br class="visible-xs" /><fmt:message key="savie.confirmation.offline.signing.up" bundle="${msg}" />--></h1>				
					<div class="details-container details-full" id="printable-area">
						<div class="row">
							<div class="col-xs-12">
								<h2 class="bring-things"><fmt:message key="oceanpark.confirmation.please.bring" bundle="${msg}" /></h2>
								<div class="row offline-procedure-row">
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure text-center">
											<span class="step">1</span>
											<p><fmt:message key="savie.confirmation.offline.A.hkid" bundle="${msg}" /></p>
											<p class="small-text"><fmt:message key="savie.confirmation.offline.A.passport" bundle="${msg}" /></p>
											<div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-1.jpg" class="img-responsive" /></div>
										</div>
									</div>
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure text-center">
											<span class="step">2</span>
                                            <p><fmt:message key="oceanpark.confirmation.proof" bundle="${msg}" /></p>
											<div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-2.jpg" class="img-responsive" /></div>
										</div>
									</div>
									<div class="col-xs-12 col-md-4">
										<div class="offline-procedure procedure-3 text-center">
											<span class="step">3</span>
											<p><fmt:message key="savie.confirmation.offline.Cheque.in" bundle="${msg}" /></p>
                                            <p class="step3-2"><fmt:message key="oceanpark.confirmation.or.settle" bundle="${msg}" /><p>
                                            <div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-3-mob.png" class="img-responsive hidden-md hidden-lg" /><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-3.png" class="img-responsive hidden-xs hidden-sm" /></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
                                <div class="oceanpark-foot-message">
                                    <p><fmt:message key="oceanpark.confirmation.foot.part1" bundle="${msg}" /> <b><fmt:message key="oceanpark.confirmation.foot.part2" bundle="${msg}" /></b> <fmt:message key="oceanpark.confirmation.foot.part3" bundle="${msg}" /></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
            <!-- BACK TO TOP -->
            <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a>
			
			<!-- FOOTER -->
		</div>
		
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
		
		<script type="text/javascript">
			$(function() {
				$('#print-this-page').click(function(){
					w=window.open();
					w.document.write($('#printable-area').html());
					w.print();
					w.close();
				});
				
			});
		</script>
		