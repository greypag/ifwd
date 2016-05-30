<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-et.css">
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper" id= "etConfirm">


			<!--<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.home" bundle="${msg}" /></a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.category" bundle="${msg}" /> </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#"><fmt:message key="eliteTerms.breadcrumb.product" bundle="${msg}" /> </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu"><fmt:message key="eliteTerms.breadcrumb.confirmation" bundle="${msg}" /></li>
               </ol>
            </div>-->

			<!--Elite Terms Header Info Widget-->

			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="clearfix reset-margin hidden-xs hidden-sm">
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="select-plan" data-et-section-target="et-select-plan-section"><fmt:message key="eliteTerms.confirmation.Select.plan" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="application" data-et-section-target="et-application-section" ><fmt:message key="eliteTerms.confirmation.Application" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="payment" data-et-section-target="et-dec-sign-section"><fmt:message key="eliteTerms.confirmation.Payment" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn no-hover" id="summary" data-toggle="modal" data-target="#summary-modal"><fmt:message key="eliteTerms.confirmation.Upload.document" bundle="${msg}" /></button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header active no-hover" id="confirmation" data-et-section-target="et-confirmation-section"><fmt:message key="eliteTerms.confirmation.Confirmation" bundle="${msg}" /></button>
						</div>
					</div>
					<div class="et-mobile-header-info hidden-md hidden-lg">
						<div class="clearfix">
							<!--<div class="et-back-arrow">
								<a href="#" class="et-back-arrow-link">
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>-->
							<div class="et-header-tex">
								<h3 id="et-active-section-label"><fmt:message key="eliteTerms.confirmation.Confirmation" bundle="${msg}" /></h3>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="application-flux">
		         <div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
		            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
		               <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> </li>
		               <li class="divider"><i class="fa fa-play"></i></li>
		               <li><fmt:message key="home.breadcrumb1.term" bundle="${msg}" /> </li>
		               <li class="divider last"><i class="fa fa-play"></i></li>
		               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="home.breadcrumb2.term.item4" bundle="${msg}" /></li>
		            </ol>
		         </div>
				<div class="container-fluid fwd-container thank-you-container">

               <p class="et-confimation-du-note"><fmt:message key="eliteTerms.confirmation.Thank.you" bundle="${msg}" /></p>

					<h2><fmt:message key="eliteTerms.confirmation.Thank.you" bundle="${msg}" /> <span class="et-title-break" /></span></h2>

					<div class="details-container">
                  <div class="detail">
                     <h3 class="acknowledge"><fmt:message key="eliteTerms.confirmation.Acknowledgement" bundle="${msg}" /></h3>
                     <p><fmt:message key="eliteTerms.confirmation.Your.application.is.part1" bundle="${msg}" /> ${confirmationEmail } <fmt:message key="eliteTerms.confirmation.Your.application.is.part2" bundle="${msg}" />
                     </p>
                  </div>

                  <div class="detail">
                     <h3 class="policy"><fmt:message key="eliteTerms.confirmation.Policy.Number" bundle="${msg}" /><span class="policy-number" id="policy-number">${eliteTermPolicy.policyNo }</span></h3>
                  </div>
									<hr>
									<div class="detail">
                     <p><fmt:message key="eliteTerms.confirmation.Your.application.is.part3" bundle="${msg}" />
                  </div>
									<div class="agent-container">
										<form action="" method="POST" class="form-horizontal" id="et-confimation-vulnerable-customer-form">
	                     <div class="form-group row">
													<div class="col-xs-5 col-md-5 col-sm-12 selectDiv et-confimation-vulnerable-customer-day" id="et-confimation-vulnerable-customer-day">
														<input type="text" class="date et-ays-datepicker" name="et-vulnerable-customer-preferred-day" id="et-vulnerable-customer-preferred-day" placeholder="DD-MM-YYYY" readonly="" data-bv-field="et-vulnerable-customer-preferred-day">
														<span class="err-msg" id="et-ays-datepicker-message"></span>
													</div>
													<%--<div id="et-select-plan-date" class="selectDiv et-select-plan-date col-xs-5 col-md-5 col-sm-12">
														<input type="text" class="date et-ays-datepicker" name="et-select-plan-date" id="et-select-plan-date-input" placeholder="DD-MM-YYYY" readonly="">
													</div>--%>
													<span class="err-msg" id="et-ays-datepicker-message"></span>
													<div class="col-xs-5 col-md-5 col-sm-12 et-vulnerable-customer-preferred-time et-confimation-vulnerable-customer-form">
	                           <input type="time" name="preferred-time" id="preferred-time" autocomplete="off" />
														 <span id="errPromoEmail" class="text-red"></span>
	                        </div>
	                        <div class="col-xs-2 col-md-2 et-submit">
	                           <button type="button" value="Submit" class="btn" id="et-confirmation-submit-vulnerable-customer"><fmt:message key="eliteTerms.confirmation.Submit" bundle="${msg}" /></button>
	                        </div>
	                     </div>
	                  </form>
									</div>

					</div>


					<div class="agent-container <c:if test="${eliteTermPolicy.referralCode == 'ET-AGENT'}">hidden</c:if>">
						<h2 class= "agent"><fmt:message key="eliteTerms.confirmation.Please.enter.your" bundle="${msg}" /></h2>
						<p class="agent-desc et-agent-desc"><fmt:message key="eliteTerms.confirmation.If.you.already.have" bundle="${msg}" /></p>

                  <form action="" method="POST" class="form-horizontal" id="et-confimation-email-form">
                     <div class="form-group">
                        <div class="col-xs-7 col-md-4 col-md-offset-3 et-input-email">
                           <input type="email" name="agent-email" id="agent-email" autocomplete="off" placeholder="your.agent@fwd.com" />
                        </div>
                        <div class="col-xs-5 col-md-2 et-submit">
                           <button type="button" value="Submit" class="btn" id="et-confirmation-submit"><fmt:message key="eliteTerms.confirmation.Submit" bundle="${msg}" /></button>
                        </div>
                     </div>
                     <span id="errPromoEmail" class="text-red"></span>
                  </form>

                  <p class="submitted-info hide-element"><fmt:message key="eliteTerms.confirmation.You.have.submitted" bundle="${msg}" /></p>

					</div>

			  <div class="text-center social-media-share">
			  		<p><fmt:message key="eliteTerms.confirmation.Share" bundle="${msg}" /></p>
			  		<a class="share-social" href="https://www.facebook.com/sharer/sharer.php?u=http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/${language}/term-life-insurance"><i class="fa fa-facebook"></i></a>
			  		<a class="share-social" href="https://twitter.com/intent/tweet?url=http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/${language}/term-life-insurance"><i class="fa fa-twitter"></i></a>
			  		<a class="share-social" href="https://plus.google.com/share?url=http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/${language}/term-life-insurance"><i class="fa fa-google-plus"></i></a>
			  </div>

               <div class="row">
                  <div class="col-xs-12 text-center">
                     <a id="back-to-home" href="<%=request.getContextPath()%>/${language}/term-life-insurance" title="Back to home" class="btn next et-back-home-btn"><fmt:message key="eliteTerms.confirmation.Back.to.home" bundle="${msg}" /></a>
                  </div>
               </div>
				</div>
			</div>

			<!-- FOOTER -->
		</div>

		<!-- JS INCLUDES -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/elite-term.js"></script>
		<script>

		$('.share-social').click(function(e) {
	        e.preventDefault();
	        window.open($(this).attr('href'), 'fbShareWindow', 'height=450, width=550, top=' + ($(window).height() / 2 - 275) + ', left=' + ($(window).width() / 2 - 225) + ', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
	        return false;
	    });

		$("#back-to-home").click(function(){
	    	  ga('create', 'UA-60032236-1', 'auto');
	    	  ga('send', 'pageview', '/${language}/term-life-insurance/confirmation');
	      });

         $('#et-confimation-email-form').on('submit', function(e){
            e.preventDefault();

            var $self = $(this);

            $self.next('.submitted-info')
                  .removeClass('hide-element');
            $self.hide();
         });

         /*$(document).on('click', '.et-header-info-btn', function(e) {
            e.preventDefault();

            var url = 'elite-terms-select-plan.jsp';
            var $self = $(this);

            if ($self.attr('id') === 'select-plan') {
               url += '#select-plan';
               window.location.href = url;
            } else if ($self.attr('id') === 'application') {
               url += '#application';
               window.location.href = url;
            }
         });*/
		</script>
