<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
<div class="fwd-savie-wrapper">
	<!-- HEADER -->
	<div class="fwd-container container-fluid breadcrumbs purchase-history-bc">
           <div class="breadcrumb-container">
              <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
				<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
				<li class="divider last"><i class="fa fa-play"></i></li>
				<li class="active-bc"><fmt:message key="label.fwd.member.account" bundle="${msg}" /></li>
              </ol>
           </div>
        </div>
	<div class="container-fluid fwd-full-container eservices profile-active-page" id="savie-online-purchase-history">
		<div class="fwd-container-limit clearfix sidebar">
			<div class="row" id="purchase-history-page">
				<h2><fmt:message key="label.fwd.member.account2" bundle="${msg}" /></h2>
				<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="button-text"><fmt:message key="tab.member.profile" bundle="${msg}" /></span>
						<i class="fa fa-angle-down"></i>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li class="mobile-dropdown dropdown-profile active"><a href="#" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.member.profile" bundle="${msg}" /></a></li>
						<li class="mobile-dropdown dropdown-insurance-plan"><a href="#" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.insurance.plan" bundle="${msg}" /></a></li>
						<li class="mobile-dropdown dropdown-promo-offers"><a href="#" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
						<li class="mobile-dropdown dropdown-e-wallet"><a href="#" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
					</ul>
				</div>
				<div class="col-md-3 side-menu hidden-xs hidden-sm">
					<ul class="nav nav-pills nav-stacked">
						<li class="left-side-tab-menu profile active" id="profile-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="profile"></span><fmt:message key="tab.member.profile" bundle="${msg}" /></a></li>
						<li class="left-side-tab-menu insurance-plan" id="insurance-plan-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="insurance-plan"></span><fmt:message key="tab.insurance.plan" bundle="${msg}" /></a></li>
						<li class="left-side-tab-menu promo-offers" id="promo-offers-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="promo-offers"></span><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
						<li class="left-side-tab-menu e-wallet" id="e-wallet-tab-link"><a href="#"><span class="side-menu-icon hidden-xs hidden-sm" id="e-wallet"></span><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-md-9 right-side-content">
					<div id="purchase-history-tab-contents" class="hidden content">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#pending" data-toggle="tab"><fmt:message key="tab.member.top.pending" bundle="${msg}" /></a></li>
							<li><a href="#active" data-toggle="tab"><fmt:message key="tab.member.top.active" bundle="${msg}" /></a></li>
							<li id="past-tab"><a href="#past" data-toggle="tab"><fmt:message key="tab.member.top.past" bundle="${msg}" /></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="pending">
								<div class="life-and-health-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.life&health" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${pending_life.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${pending_life}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p></p>													
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>
								<!-- -->	
								<div class="travel-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.SavingInsurance" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${pending_saving.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${pending_saving}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /></h4>
															<p class="info-data"><a href="<fmt:message key="link.claims" bundle="${msg}" />" target="_blank"><fmt:message key="user.policy.claim.form" bundle="${msg}" /></a></p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>												
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>									
								<!-- -->
								<div class="saving-insurance-container hidden">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Household" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${pending_house.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${pending_house}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>											
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>
								<!-- -->
								<div class="saving-insurance-container hidden">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Travel" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${pending_travel.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${pending_travel}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}~${list.expiryDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>											
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="active">
								<div class="life-and-health-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.life&health" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>				
										<c:choose>
									        <c:when test="${active_life.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${active_life}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>	
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>												
								<!--TRAVEL -->	
								<div class="travel-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.SavingInsurance" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${active_saving.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${active_saving}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /></h4>
															<p class="info-data"><a href="<fmt:message key="link.claims" bundle="${msg}" />" target="_blank"><fmt:message key="label.status.claim.form" bundle="${msg}" /></a></p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>												
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>									
								<!-- -->
								<div class="saving-insurance-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Household" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${active_house.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${active_house}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">												
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p>												
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>
								<!-- -->
								<div class="saving-insurance-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Travel" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
											</div>	
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${active_travel.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${active_travel}">
									           		<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}~${list.expiryDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status.visit.customer.service" bundle="${msg}" /></h4>
															<p class="info-data pls-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
														<div class="col-xs-12 visible-xs visible-sm mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<p class="info-data please-visit"><enhance:out escapeXml="false">${list.status}</enhance:out></p>												
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="past">
								<div class="life-and-health-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.life&health" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${past_life.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${past_life}">
									            	<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>												
								<!--TRAVEL -->
								<div class="travel-container">	
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.SavingInsurance" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
											</div>
										</div>
										<c:choose>
									        <c:when test="${past_saving.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${past_saving}">
									            	<div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /></h4>
															<p class="info-data"><a href="<fmt:message key="link.claims" bundle="${msg}" />" target="_blank"><fmt:message key="label.status.claim.form" bundle="${msg}" /></a></p>
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>
								</div>									
								<!-- -->
								<div class="saving-insurance-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Household" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Start date</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>				
										<c:choose>
									        <c:when test="${past_house.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${past_house}">
									                <div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.start.date" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>		
								</div>
								<!-- -->
								<div class="saving-insurance-container">
									<div class="category-holder">
										<h4 class="category-title"><fmt:message key="label.Travel" bundle="${msg}" /></h4>
										<div class="row category-head">
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-2">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
											</div>
											<div class="col-xs-6 col-md-3">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Cover period</p>"></i></h4>
											</div>
											<div class="col-xs-6 col-md-2 visible-md visible-lg">
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
											</div>
										</div>				
										<c:choose>
									        <c:when test="${past_travel.size() > 0}">
									            <c:forEach varStatus="status" var="list" items="${past_travel}">
									                <div class="row category-info-row <c:if test='${status.count%2 != "0"}'>row-gray</c:if>">
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.plan.name" bundle="${msg}" /></h4>
															<p class="info-data plan-name">${list.planName}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.policy.no." bundle="${msg}" /></h4>
															<p class="info-data">${list.policyNumber}</p>
														</div>
														<div class="col-xs-6 col-md-3 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.cover.period" bundle="${msg}" /></h4>
															<p class="info-data">${list.commencementDateDesc}~${list.expiryDateDesc}</p>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.insured.amount" bundle="${msg}" /></h4>
															<p class="info-data">${list.amount}</p>
														</div>
													</div>
	                                            </c:forEach>
									        </c:when>
									    </c:choose>
									</div>		
								</div>						
							</div>
						</div>
						<p id="note"><fmt:message key="label.remark.status.account.value" bundle="${msg}" /></p>
					</div>
					<div id="eservices-tab-contents" class="content">
						<h3 class="heading-title"><fmt:message key="label.member.detail" bundle="${msg}" /></h3>
						<div id="member-details">	
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="label.fullname" bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${userDetails.getFullName() }
								</div>
							</div>
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="label.mobile.no." bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${userDetails.getMobileNo() }
								</div>
							</div>
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="label.email.address" bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${userDetails.getEmailAddress() }
								</div>
							</div>
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="label.username" bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${username }
								</div>
							</div>
						</div>
						<p class="member-account-details-footer"><fmt:message key="member.account.details.footer1" bundle="${msg}" /> <a href="<fmt:message key="member.account.details.footer2.link" bundle="${msg}"/>" target="_blank"><fmt:message key="member.account.details.footer2" bundle="${msg}" /></a> <fmt:message key="member.account.details.footer3" bundle="${msg}" /></p>
						<c:if test='${fnaLastUpdate.length() > 0}'>
						<h3 class="heading-title"><fmt:message key="label.fna" bundle="${msg}" /></h3>	
						<p id="complete-statement"><fmt:message key="label.complete.fna" bundle="${msg}" /> '${fnaLastUpdate }' <fmt:message key="label.complete.fna2" bundle="${msg}" /> <a class="bold text-bold" href="javascript:void(0);" onclick="goFna();" ><fmt:message key="button.review.fna" bundle="${msg}" /></a></p>
						</c:if>							
					</div>
					<div id="promo-offers-tab-contents" class="hidden content">
						<ul class="nav nav-tabs nav-justified visible-xs visible-sm mobile-promo-navtab">
							<li class="active"><a href="#promo-code" data-toggle="tab"><fmt:message key="label.personnal.promotion.code" bundle="${msg}" /></a></li>
							<li><a href="#ref-program" data-toggle="tab"><fmt:message key="label.refferal.program" bundle="${msg}" /></a></li>
							<li class="last"><a href="#fwd-partner" data-toggle="tab"><fmt:message key="label.member.top.active" bundle="${msg}" /></a></li>
						</ul>
						<div class="tab-content">
							<!--promotion code-->
							<div class="tab-pane active" id="promo-code">
								<div class="promotion-code-container">
									<h3 class="heading-title hidden-xs hidden-sm"><fmt:message key="label.personnal.promotion.code1" bundle="${msg}" /></h3>
									<p><fmt:message key="info.personnal.promotion.code" bundle="${msg}" /></p>
									<p><fmt:message key="label.personnal.promotion.code.your.code" bundle="${msg}" /> <br class="visible-xs visible-sm" /><span class="text-bold bold your-code">${userDetails.getReferralCode()}</span></p>
									<table class="table table-striped" id="promotion-code-table">
										 <thead>
										 	<tr>
										 		<th class="first-col"><fmt:message key="label.type.of.offer" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.discount" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.offer.period" bundle="${msg}" /></th>
										 	</tr>
										 </thead>
										 <tbody>
										 	<tr>
										 		<td class="first-col"><fmt:message key="label.account.promocode.row1.col1" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.promocode.row1.col2" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.promocode.row1.col3" bundle="${msg}" /></td>
										 	</tr>
										 	<tr>
										 		<td class="first-col"><fmt:message key="label.account.promocode.row2.col1" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.promocode.row2.col2" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.promocode.row2.col3" bundle="${msg}" /></td>
										 	</tr>
										 	<!--tr>
										 		<td class="first-col">Savie Insurance Plan</td>
										 		<td>20% off</td>
										 		<td>Year-round</td>
										 	</tr>
										 	<tr>
										 		<td class="first-col">Overseas StudyCare</td>
										 		<td>8% off</td>
										 		<td>Year-round</td>
										 	</tr-->
										 </tbody>
									</table>
								</div>
							</div>	
							<!--referral program code-->
							<div class="tab-pane" id="ref-program">
								<div class="referral-program-container">
									<h3 class="heading-title hidden-xs hidden-sm"><fmt:message key="label.refferal.program1" bundle="${msg}" /></h3>
									<p><fmt:message key="info.refferal.program" bundle="${msg}" /></p>
									<div class="row" id="input-social-holder">
										<div class="col-xs-12 col-md-7" id="promo-input-holder">
											<div class="form-control gray-textbox promo-code-input" id="toBeCopied" contenteditable="true">https://i.fwd.com.hk/${language}/home?promo=${userDetails.getReferralCode()}</div>
											<div id="copyTipBox" class="boxMain boxSub" style="display: none;">
												<span class="boxMessage hidden-sm hidden-xs">Press CTRL-C to copy</span>
												<span class="boxMessage hidden-md hidden-lg">Long-press to copy</span>
												<span class="boxDownArrow"></span>
											</div>
										</div>
										<div class="col-xs-12 col-md-5" id="social-btns-holder">
											<ul class="nav nav-pills">
											  <li role="presentation" class="click-copy-btn"><a href="javascript:autoSelect('toBeCopied');" id="copy-link-btn"><fmt:message key="button.copy.link" bundle="${msg}" /></a></li>
											  <li role="presentation"><div class="addthis_sharing_toolbox"></div></li>
											</ul>
										</div>
									</div>				
									<table class="table table-striped" id="referral-program-table">
										 <thead>
										 	<tr>
										 		<th class="first-col"><fmt:message key="label.type.of.offer" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.discount" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.offer.period" bundle="${msg}" /></th>
										 	</tr>
										 </thead>
										 <tbody>
										 	<tr>
										 		<td class="first-col"><fmt:message key="label.account.refferal.row1.col1" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.refferal.row1.col2" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.refferal.row1.col3" bundle="${msg}" /></td>
										 	</tr>
										 	<!--tr>
										 		<td class="first-col">Home Insurance</td>
										 		<td>30% off</td>
										 		<td>One-off<sup>2</sup></td>
										 	</tr>
										 	<tr>
										 		<td class="first-col">Savie Insurance Plan</td>
										 		<td>30% off</td>
										 		<td>One-off<sup>2</sup></td>
										 	</tr-->
										 </tbody>
									</table>
									<p class="referral-notes visible-xs visible-sm"><sup>1</sup> <fmt:message key="note.refferal.program1" bundle="${msg}" /> <fmt:message key="note.refferal.program2" bundle="${msg}" /></p>
								</div>
							</div>	
							<!--fwd partner code-->	
							<div class="tab-pane" id="fwd-partner">
								<div class="fwd-partner-container">
									<h3 class="heading-title hidden-xs hidden-sm"><fmt:message key="label.member.top.active1" bundle="${msg}" /></h3>
									<p><fmt:message key="note.member.top.active" bundle="${msg}" /></p>									
									<table class="table table-striped" id="fwd-partner-table">
										 <thead>
										 	<tr>
										 		<th class="first-col"><fmt:message key="label.type.of.offer" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.discount" bundle="${msg}" /></th>
										 		<th><fmt:message key="label.offer.period" bundle="${msg}" /></th>
										 	</tr>
										 </thead>
										 <tbody>
										 	<tr>
										 		<td class="first-col"><a href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="label.account.partner.row1.col1" bundle="${msg}" /></a></td>
										 		<td><fmt:message key="label.account.partner.row1.col2" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.partner.row1.col3" bundle="${msg}" /></td>
										 	</tr>
										 	<tr>
										 		<td class="first-col"><a href="<%=request.getContextPath()%>/${language}/offers"><fmt:message key="label.account.partner.row2.col1" bundle="${msg}" /></a></td>
										 		<td><fmt:message key="label.account.partner.row2.col2" bundle="${msg}" /></td>
										 		<td><fmt:message key="label.account.partner.row2.col3" bundle="${msg}" /></td>
										 	</tr>
										 	<tr>
										 		<td class="first-col"><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner_offers" bundle="${msg}" />" target="_blank"><fmt:message key="label.account.partner.row3.col1" bundle="${msg}" /></a><sup>2</sup></td>
										 		<td><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner_offers" bundle="${msg}" />" target="_blank"><fmt:message key="label.account.partner.row3.col2" bundle="${msg}" /></a></td>
										 		<td><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner_offers" bundle="${msg}" />" target="_blank"><fmt:message key="label.account.partner.row3.col3" bundle="${msg}" /></a></td>
										 	</tr>
										 </tbody>
									</table>
									<div id="partners-logo" class="visible-md visible-lg">
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/partner_theclub.png" id="the-club" />
										<img src="<%=request.getContextPath()%>/resources/images/savie-2016/partner_agoda.png" id="agoda" />
										<a href="<%=request.getContextPath()%>/${language}/offers"><img src="<%=request.getContextPath()%>/resources/images/savie-2016/CSL_logo.png" id="csl" /></a>
									</div>
									<p class="referral-notes hidden-xs hidden-sm "><sup>1</sup> <fmt:message key="note.refferal.program1" bundle="${msg}" /> <fmt:message key="note.refferal.program2" bundle="${msg}" /></p>
									<p class="referral-notes"><sup>2</sup> <fmt:message key="note.refferal.program3.1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="link.csl_simcard" bundle="${msg}" />" target="_blank"><fmt:message key="note.refferal.program3.2" bundle="${msg}" /></a><fmt:message key="note.refferal.program3.3" bundle="${msg}" /></p>
								</div>
							</div>		
						</div>		
					</div>
					<!-- e-wallet Begin-->
					<div id="e-wallet-tab-contents" class="hidden content">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#ewallet-plans" data-toggle="tab"><fmt:message key="tab.member.top.pending" bundle="${msg}" /></a></li>
							<li><a href="#ewallet-logs" data-toggle="tab"><fmt:message key="tab.member.top.active" bundle="${msg}" /></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="ewallet-plans">
								<div class="row ew_pol_list">
									<div class="col-xs-12 ew-tab-title">
										<h3 class="heading-title">保險計劃</h3>
									</div>
									<div class="col-xs-12 ew_pol">
										<div class="ew_pol_info">
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">計劃名稱</span>
												<span class="ew_pol_info_fieldValue">Savie 自助息理財XX(一筆)</span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">保單編號</span>
												<span class="ew_pol_info_fieldValue">2548451854</span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">本金*</span>
												<span class="ew_pol_info_fieldValue ew_pol_blance">$80,000</span>
											</p>
										</div>
										<div class="col-xs-12 ew_pol_sep">
										</div>
										<div class="col-xs-12">
											<p>提取方法</p>
										</div>
										<div class="col-xs-12 ew_pol_wd_linkup">
											<div class="col-xs-12 col-sm-8 ew_pol_wd_linkup_status">
												<img src="<%=request.getContextPath()%>/resources/images/eWallet/ewallet-tng-icon.png" alt="拍住賞" class="img-responsive ew_pol_wd_linkup_icon">
												<div class="ew_pol_wd_linkup_detail">
													<p class="ew_pol_info_fieldName">拍住賞<sup>1</sup>帳號:</p>
													<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_empty">尚未連結</p>
													<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_connected">
														<span class="ew_pol_wd_linkup_tngId">1651658698</span><br>
														<a href="#" class="ew_pol_wd_linkup_unlink">解除連結</a>
													</p>
													<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_locked">帳戶被凍結</p>	
												</div>
												
											</div>
											<div class="col-xs-12 col-sm-4 ew_pol_wd_linkup_action">
												<a class="ew_pol_wd_linkupBtn" href="javascript:void(0);">請先配對拍住賞</a>
												<a class="ew_pol_wd_withdrawBtn" href="javascript:void(0);">提取本金至拍住賞</a>
											</div>
										</div>
									</div>
									<div class="col-xs-12 ew_pol_wd_form">
										<a href="#" class="ew_pol_wd_formBtn">下載部份提取申請表格</a>
									</div>
								</div>

								
							</div>
							<div class="tab-pane" id="ewallet-logs">
								<!-- log -->
								<div class="row ew_pol_log">
									<div class="col-xs-12 ew-tab-title">
										<h3 class="heading-title">網上提取紀錄</h3>
									</div>
									<div class="col-xs-12 ew_log_selectWrapper">
										<div class="col-xs-12 col-sm-3">保單號碼</div>
										<div class="col-xs-12 col-sm-3">
											<div class="ew_pol_selector">
												<select>
												    <option>1258748</option>
												    <option selected>1258748</option>
												    <option>1258748</option>
												    <option>1258748</option>
												</select>
											</div>
										</div>
									</div>
									<div class="col-xs-12 ew_pol">
										<div class="ew_pol_info">
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">計劃名稱</span>
												<span class="ew_pol_info_fieldValue">Savie 自助息理財XX(一筆)</span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">保單編號</span>
												<span class="ew_pol_info_fieldValue">2548451854</span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName">本金*</span>
												<span class="ew_pol_info_fieldValue ew_pol_blance">$80,000</span>
											</p>
										</div>
									</div>
									<div class="col-xs-12 ew_log_dt_selectWrapper">
										<div class="ew_dt_from_txt">
											查閱交易紀錄期
										</div>
										<input id="dt_log_from" placeholder="Please Select..." />
										<div class="ew_dt_to_txt">
											至
										</div>
										<input id="dt_log_to" placeholder="Please Select..." />
										<div class="ew_btn_grp">
											<a href="javascript:void(0);" class="ew_btn_ok">確定</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<p id="note"><fmt:message key="label.remark.status.account.value" bundle="${msg}" /></p>
					</div>
					<!-- e-wallet End -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal for resume application -->
	<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	     	<h4 class="text-center welcome-msg">Welcome back! ${userDetails.getFullName() }</h4>
	     	<p class="text-center description-msg">Do you want to resume your application or start over?</p>
	     	<center><button class="btn savie-common-btn" id="resume-btn">Resume</button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn">Start over</button></center>
	    </div>
	  </div>
	</div>
	<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="text-center welcome-msg"><fmt:message key="eservices.fna.title" bundle="${msg}" /> ${userDetails.getFullName() }</h4>
				<p class="text-center description-msg"><fmt:message key="eservices.fna.desc" bundle="${msg}" /></p>
				<center><button class="btn savie-common-btn" id="review-fna-btn"><fmt:message key="eservices.fna.button" bundle="${msg}" /></button></center>
			</div>
		</div>
	</div>
	
	<!-- Modal for application after 30 days -->
	<div class="modal fade common-welcome-modal" id="application-after-days" tabindex="-1" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	     	<p class="text-center description-msg">The application must be completed within 30 days upon submission. The application has been expired. For any enquiry, please contact our 24-hour customer hotline 3123-3123.</p>
	     	<center><button class="btn savie-common-btn" id="back-to-home-btn">Back to home</button></center>
	    </div>
	  </div>
	</div>
	
	<!-- FOOTER -->
</div>
<!-- e-Wallet popup Begin-->
<!-- linkup	 -->
<div class="modal fade ew_popup_linkup" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title">配對拍住賞手機錢包</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<h4 class="ew_popup_sec_title">你所提取的保單</h4>
							<div class="col-xs-12 ew_popup_sec_pol">
								<div class="ew_pol_info">
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">計劃名稱</span>
										<span class="ew_pol_info_fieldValue">Savie 自助息理財XX(一筆)</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">保單編號</span>
										<span class="ew_pol_info_fieldValue">2548451854</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">本金*</span>
										<span class="ew_pol_info_fieldValue ew_pol_blance">$80,000</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_otpInput">
								<h4 class="ew_popup_sec_title">核對</h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<p class="ew_desc">
										一次性密碼己發送到您的手提電話<span class="ew_mobile">9876 ****</span>.<br>請於60秒內輸入您的一次性密碼</p>
									<div class="ew_pol_info">

										<div class="ew_otp_wrapper">
											<input type="text" class="ew_otp_input" maxlength="6">
										</div>
									</div>
									<div class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 ew_agreeBox">
										<input id="chk_otp" type="checkbox" name="chk">
										<label for="chk_otp">
											<span>
												本人同意並授權富衛人壽(百慕達)有限公司(“富衛人壽”)將本人的個人資料提供予HKT Payment Limited作核對用途。HKT Payment Limited將不會保存任何個人資料。
											</span>
										</label>
									</div>
									<div class="col-xs-12">
										<a href="#" class="ew_btn_confirm">確認</a>
									</div>
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<div class="col-xs-12 ew_desc_err">
										<p>
											一次性密碼錯誤,請重試。
										</p>
									</div>
								</div>
							</div>
							<div class="col-xs-12 ew_remark">
								<p><sup>^</sup>本提取服務不包括保單利息</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- linkup success -->
<div class="modal fade ew_popup_linkupSuccess" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title">配對拍住賞手機錢包</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<p class="ew_desc">
								一次性密碼核實成功。
							</p>
							<a href="#" class="ew_btn_confirm">確定</a>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- withdraw -->
<div class="modal fade ew_popup_withdraw" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title">提取保單本金至拍住賞</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<h4 class="ew_popup_sec_title">你所提取的保單</h4>
							<div class="col-xs-12 ew_popup_sec_pol">
								<div class="ew_pol_info">
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">計劃名稱</span>
										<span class="ew_pol_info_fieldValue">Savie 自助息理財XX(一筆)</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">保單編號</span>
										<span class="ew_pol_info_fieldValue">2548451854</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">本金*</span>
										<span class="ew_pol_info_fieldValue ew_pol_blance">$80,000</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">拍住賞帳號</span>
										<span class="ew_pol_info_fieldValue ew_tngId">2548451854</span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName">連結限期</span>
										<span class="ew_pol_info_fieldValue">01/10/2017</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_amountOpt">
								<h4 class="ew_popup_sec_title">請選擇提取金額</h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<div class="col-xs-12">
										<p class="ew_hint">
											最低金額: $500 / 最高金額: $3,000
										</p>
									</div>
									<div class="col-xs-12">
										<div class="ew_btn_grp">
											<a href="#" class="ew_btn ew_btn_amount">$500</a><!--
											--><a href="#" class="ew_btn ew_btn_amount">$1,000</a><!--
											--><a href="#" class="ew_btn ew_btn_amount">$2,000</a><!--
											--><a href="#" class="ew_btn ew_btn_amount">$3,000</a>
										</div>
										<div class="ew_txt_or ew_desc">或</div>
										<div class="ew_amount_input">
											<input type="text" placeholder="請輸入" id="ew_input_amount">
										</div>
										<div class="ew_btn_grp">
											<a href="" class="ew_btn_withdraw">提取</a>
										</div>
									</div>									
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<div class="col-xs-12 ew_desc_err">
										<p>
											一次性密碼錯誤,請重試。
										</p>
									</div>
								</div>
							</div>
							<div class="col-xs-12 ew_remark">
								<p><sup>^</sup>本提取服務不包括保單利息</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 ew_withdrawAmount">
							<p class="ew_desc">
								部份提取金額: <span class="ew_amount">港幣$1,000<sup>*</sup></span>
							</p>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_otpInput">
								<h4 class="ew_popup_sec_title">核對</h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<p class="ew_desc">
										一次性密碼己發送到您的手提電話<span class="ew_mobile">9876 ****</span>.<br>請於60秒內輸入您的一次性密碼</p>
									<p>
										請<a href="" class="ew_link_resendOTP">按此</a>重新發送一次密碼
									</p>
									<div class="ew_pol_info">

										<div class="ew_otp_wrapper">
											<input type="text" class="ew_otp_input" maxlength="6">
										</div>
									</div>
									<div class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 ew_agreeBox">
										<input id="chk_amount" type="checkbox" name="chk_tnc">
										<label for="chk_amount">
											<span>
												本人同意並授權富衛人壽(百慕達)有限公司(“富衛人壽”)將本人的個人資料提供予HKT Payment Limited作核對用途。HKT Payment Limited將不會保存任何個人資料。
											</span>
										</label>
									</div>
									<div class="col-xs-12">
										<a href="#" class="ew_btn_confirm">確認</a>
									</div>
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<div class="col-xs-12 ew_desc_err">
										<p>
											一次性密碼錯誤,請重試。
										</p>
									</div>
								</div>
							</div>
							<div class="col-xs-12 ew_remark">
								<p><sup>^</sup>本提取服務不包括保單利息</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_success">
								<p class="ew_bigTxt">成功</p>
								<p class="ew_desc">
									一次性密碼核實成功。
								</p>
								<a href="#" class="ew_btn_confirm">確定</a>
							</div>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- e-Wallet popup End-->
<!-- JS INCLUDES -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186"></script>
<script type="text/javascript">
	var language = "en";

	$(document).ready(function () {
		$(".dropdown-menu li a").click(function(){
		  var selText = $(this).text();
		  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
		  $('.dropdown-menu li').removeClass('active');
		  $(this).parent().addClass('active');
		  if($(this).parent('li').hasClass('dropdown-profile')) {
		  	$('.eservices').addClass('profile-active-page');
			$('.eservices').removeClass('insurance-active-page promo-active-page');
		  	$('.left-side-tab-menu').removeClass('active');
		  	$('.profile').addClass('active');
		  	$('#purchase-history-tab-contents').addClass('hidden');
			$('#eservices-tab-contents').removeClass('hidden');
			$('#promo-offers-tab-contents').addClass('hidden');
			$('#e-wallet-tab-contents').addClass('hidden');
		  } else if($(this).parent('li').hasClass('dropdown-insurance-plan')) {
		  	$('.eservices').addClass('insurance-active-page');
			$('.eservices').removeClass('profile-active-page promo-active-page');
		  	$('.left-side-tab-menu').removeClass('active');
		  	$('.insurance-plan').addClass('active');
			$('#purchase-history-tab-contents').removeClass('hidden');
			$('#eservices-tab-contents').addClass('hidden');
			$('#promo-offers-tab-contents').addClass('hidden');
			$('#e-wallet-tab-contents').addClass('hidden');
		  } else if($(this).parent('li').hasClass('dropdown-promo-offers')) {
		  	$('.eservices').addClass('promo-active-page');
			$('.eservices').removeClass('profile-active-page insurance-active-page');
		  	$('.fwd-savie-wrapper').attr('id', 'promo-page');
		  	$('.left-side-tab-menu').removeClass('active');
		  	$('.promo-offers').addClass('active');
			$('#promo-offers-tab-contents').removeClass('hidden');
			$('#purchase-history-tab-contents').addClass('hidden');
			$('#eservices-tab-contents').addClass('hidden');
			$('#e-wallet-tab-contents').addClass('hidden');
			alignMobilePromoNavtab();
		  } else if($(this).parent('li').hasClass('dropdown-e-wallet')) {
		  	$('.eservices').addClass('insurance-active-page');
			$('.eservices').removeClass('profile-active-page promo-active-page');
		  	$('.fwd-savie-wrapper').attr('id', 'e-wallet');
		  	$('.left-side-tab-menu').removeClass('active');
		  	$('.e-wallet').addClass('active');
			$('#e-wallet-tab-contents').removeClass('hidden');
			$('#purchase-history-tab-contents').addClass('hidden');
			$('#eservices-tab-contents').addClass('hidden');
			$('#promo-offers-tab-contents').addClass('hidden');
			alignMobilePromoNavtab();
		  }

		});

		$('.left-side-tab-menu').on('click', function () {
			$('.left-side-tab-menu').removeClass('active');
			$(this).addClass('active');
			if($(this).hasClass('profile')) {
				$('.eservices').addClass('profile-active-page');
				$('.eservices').removeClass('insurance-active-page promo-active-page');
				$('#purchase-history-tab-contents').addClass('hidden');
				$('#eservices-tab-contents').removeClass('hidden');
				$('#promo-offers-tab-contents').addClass('hidden');
				$('#e-wallet-tab-contents').addClass('hidden');
				$('.mobile-dropdown').removeClass('active');
				$('.dropdown-profile').addClass('active');
				var selText = '<fmt:message key="tab.member.profile" bundle="${msg}" />'; //'Profile';
		  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
			} else if ($(this).hasClass('insurance-plan')) {
				$('.eservices').addClass('insurance-active-page');
				$('.eservices').removeClass('profile-active-page promo-active-page');
				$('#purchase-history-tab-contents').removeClass('hidden');
				$('#eservices-tab-contents').addClass('hidden');
				$('#promo-offers-tab-contents').addClass('hidden');
				$('#e-wallet-tab-contents').addClass('hidden');
				$('.mobile-dropdown').removeClass('active');
				$('.dropdown-insurance-plan').addClass('active');
				var selText = '<fmt:message key="tab.insurance.plan" bundle="${msg}" />'; //'Insurance Plan';
		  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
			} else if ($(this).hasClass('promo-offers')) {
				$('.eservices').addClass('promo-active-page');
				$('.eservices').removeClass('profile-active-page insurance-active-page');
				$('#promo-offers-tab-contents').removeClass('hidden');
				$('#purchase-history-tab-contents').addClass('hidden');
				$('#eservices-tab-contents').addClass('hidden');
				$('#e-wallet-tab-contents').addClass('hidden');
				$('.mobile-dropdown').removeClass('active');
				$('.dropdown-promo-offers').addClass('active');
				var selText = '<fmt:message key="tab.promo.and.offers" bundle="${msg}" />'; //'Promo & Offers';
		  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
		  	} else if ($(this).hasClass('e-wallet')) {
				$('.eservices').addClass('insurance-active-page');
				$('.eservices').removeClass('profile-active-page promo-active-page');

				$('#e-wallet-tab-contents').removeClass('hidden');
				$('#purchase-history-tab-contents').addClass('hidden');
				$('#eservices-tab-contents').addClass('hidden');
				$('#promo-offers-tab-contents').addClass('hidden');

				$('.mobile-dropdown').removeClass('active');
				$('.dropdown-e-wallet').addClass('active');
				var selText = '<fmt:message key="tab.promo.and.offers" bundle="${msg}" />'; //'Promo & Offers';
		  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');
		  	}
		});

		$('.mobile-promo-navtab a[data-toggle="tab"]').on('shown.bs.tab', function () {
			console.log(123);
			alignMobilePromoNavtab();
		});

		var winWidth = $(window).width();
		var computedWidth = winWidth - 180;
		if (winWidth < 992) {
			$('#copy-link-btn').css('width', computedWidth+'px' );
			alignMobilePromoNavtab();
		}
		$(window).resize(function () {
			var winWidth = $(window).width();
			var computedWidth = winWidth - 180;
			if (winWidth < 972) {
				$('#copy-link-btn').css('width', computedWidth+'px' );
				alignMobilePromoNavtab();
			} else {
				$('#copy-link-btn').css('width', '115px' );
			}
		});
		$('p.plan-name').each(function(){
		    
		    if($(this).text()=="3HK"){
		    	$(this).html('<fmt:message key="label.plan.item.name" bundle="${msg}" />');
		    }
		  });
		
	});
	
	// show application after 30 days modal
	function showApplicationAfterDaysModal() {
		$('#application-after-days').modal('show');
	}
	
	$("#review-fna-btn").on('click', function(){
		window.location = '<%=request.getContextPath()%>/${language}/FNA/review';
	});
	
	function goFna() {
		if('${fnaLastUpdate }'!=null && '${fnaLastUpdate }'!=''){
			$('#review-fna-modal').modal('show');
		}
	}
	
	function alignMobilePromoNavtab() {
		if (!$('#promo-offers-tab-contents').hasClass('hidden')) {
			var common_height = 0;
			$('.mobile-promo-navtab > li').height('auto');
			$('.mobile-promo-navtab > li a').height('auto');
			$('.mobile-promo-navtab > li').each(function() {
				if ($(this).outerHeight(true) > common_height) {
					common_height = $(this).outerHeight(true);
				}
			});
			$('.mobile-promo-navtab > li').height(common_height);
			$('.mobile-promo-navtab > li.active a').height(common_height - 27);
		}
	}
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/eWallet/ewallet.style.css">
<link href="<%=request.getContextPath()%>/resources/css/easy-health/mobiscroll.custom-2.17.2.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/eWallet/ewallet.uifn.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>