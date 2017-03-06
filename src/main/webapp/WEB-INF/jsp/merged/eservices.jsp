<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="isFwdCust" value="${'FWDCUST' eq memberType}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
var customerId ="<%=session.getAttribute("customerId")%>";
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
				<c:if test="${isFwdCust}"><h2><fmt:message key="label.fwd.customer.account" bundle="${msg}" /></h2></c:if>
				<c:if test="${not isFwdCust}"><h2><fmt:message key="label.fwd.member.account2" bundle="${msg}" /></h2></c:if>
				<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="button-text">
						<c:if test="${isFwdCust}"><fmt:message key="tab.customer.profile" bundle="${msg}" /></c:if>
						<c:if test="${not isFwdCust}"><fmt:message key="tab.member.profile" bundle="${msg}" /></c:if></span>
						<i class="fa fa-angle-down"></i>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li class="mobile-dropdown dropdown-profile active"><a href="#profile-tab-link" data-toggle="tab" aria-expanded="true">
						<c:if test="${isFwdCust}"><fmt:message key="tab.customer.profile" bundle="${msg}" /></c:if>
						<c:if test="${not isFwdCust}"><fmt:message key="tab.member.profile" bundle="${msg}" /></c:if>
						</a></li>
						<li class="mobile-dropdown dropdown-insurance-plan"><a href="#insurance-plan-tab-link" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.insurance.plan" bundle="${msg}" /></a></li>
						<li class="mobile-dropdown dropdown-promo-offers"><a href="#promo-offers-tab-link" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
						<c:if test="${isFwdCust}">
						<li class="mobile-dropdown dropdown-e-wallet"><a href="#e-wallet-tab-link" data-toggle="tab" aria-expanded="true"><fmt:message key="tab.withdrawal" bundle="${msg}" /></a></li>
						</c:if>
					</ul>
				</div>
				<div class="col-md-3 side-menu hidden-xs hidden-sm">
					<ul class="nav nav-pills nav-stacked">
						<li class="left-side-tab-menu profile active" id="profile-tab-link"><a href="#profile-tab-link"><span class="side-menu-icon hidden-xs hidden-sm" id="profile"></span>
						<c:if test="${isFwdCust}"><fmt:message key="tab.customer.profile" bundle="${msg}" /></c:if>
						<c:if test="${not isFwdCust}"><fmt:message key="tab.member.profile" bundle="${msg}" /></c:if>
						</a></li>
						<li class="left-side-tab-menu insurance-plan" id="insurance-plan-tab-link"><a href="#insurance-plan-tab-link"><span class="side-menu-icon hidden-xs hidden-sm" id="insurance-plan"></span><fmt:message key="tab.insurance.plan" bundle="${msg}" /></a></li>
						<li class="left-side-tab-menu promo-offers" id="promo-offers-tab-link"><a href="#promo-offers-tab-link"><span class="side-menu-icon hidden-xs hidden-sm" id="promo-offers"></span><fmt:message key="tab.promo.and.offers" bundle="${msg}" /></a></li>
						<c:if test="${isFwdCust}">
						<li class="left-side-tab-menu e-wallet" id="e-wallet-tab-link"><a href="#e-wallet-tab-link"><span class="side-menu-icon hidden-xs hidden-sm" id="e-wallet"></span><fmt:message key="tab.withdrawal" bundle="${msg}" /></a></li>
						</c:if>
					</ul>
				</div>
				<div class="col-xs-12 col-md-9 right-side-content">
					<div id="purchase-history-tab-contents" class="hidden content">
						<ul class="nav nav-tabs nav-justified">
							<li><a id="pending-tab" href="#pending" data-toggle="tab"><fmt:message key="tab.member.top.pending" bundle="${msg}" /></a></li>
							<li id="active-tab" class="active"><a href="#active" data-toggle="tab"><fmt:message key="tab.member.top.active" bundle="${msg}" /></a></li>
							<li id="past-tab"><a href="#past" data-toggle="tab"><fmt:message key="tab.member.top.past" bundle="${msg}" /></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="pending">
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
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.principal" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
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
							<div class="tab-pane active" id="active">
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
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.principal" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
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
															<c:if test='${isFwdCust}'><p class="info-data">${list.commencementDateDesc}</p></c:if>
															<c:if test='${not isFwdCust}'><p class="info-data"><fmt:message key="label.call_cs" bundle="${msg}" /></p></c:if>
														</div>
														<div class="col-xs-6 col-md-2 visible-md visible-lg mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.status" bundle="${msg}" /></h4>
															<c:if test='${isFwdCust}'><p class="info-data"><enhance:out escapeXml="false">${list.status}</enhance:out></p></c:if>
															<c:if test='${not isFwdCust}'><p class="info-data"><fmt:message key="label.hyphen" bundle="${msg}" /></p></c:if>
														</div>											
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.resources" bundle="${msg}" /></h4>
															<c:if test="${isFwdCust and list.amount ne '0.0'}"><p class="info-data"><fmt:formatNumber value="${list.amount}" type="currency" currencySymbol="$" minFractionDigits="0" maxFractionDigits="2"/> (<fmt:message key="label.principal.asAt" bundle="${msg}" />${list.amountAsOfDate})</p></c:if>
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
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /></h4>
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
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /></h4>
															<p class="info-data">${list.expiryDateDesc}</p>
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
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /> <i class="fa fa-info-circle hidden" data-toggle="tooltip" data-html="true" data-placement="right" title="<p>Resources</p>"></i></h4>
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
															<c:if test='${isFwdCust}'><p class="info-data">${list.commencementDateDesc}</p></c:if>
															<c:if test='${not isFwdCust}'><p class="info-data"><fmt:message key="label.hyphen" bundle="${msg}" /></p></c:if>
														</div>
														<div class="col-xs-6 col-md-2 mbview-category-info">
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /></h4>
															<c:if test='${isFwdCust and not empty list.expiryDateDesc}'><p class="info-data">${list.expiryDateDesc}</p></c:if>
															<c:if test='${not isFwdCust}'><p class="info-data"><fmt:message key="label.call_cs" bundle="${msg}" /></p></c:if>
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
												<h4 class="hidden-xs hidden-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /></h4>
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
															<h4 class="visible-xs visible-sm info-head"><fmt:message key="label.endDate" bundle="${msg}" /></h4>
															<p class="info-data">${list.expiryDateDesc}</p>
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
						<h3 class="heading-title">
						<c:if test="${isFwdCust}"><fmt:message key="label.customer.detail" bundle="${msg}" /></c:if>
						<c:if test="${not isFwdCust}"><fmt:message key="label.member.detail" bundle="${msg}" /></c:if>
						</h3>
						<div id="member-details">	
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="member.account.details.label.fullName" bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${userDetails.getFullName() }
								</div>
							</div>
							<div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="member.account.details.label.mobileNo" bundle="${msg}" />
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
							<%-- <div class="row member-data-holder">
								<div class="text-bold col-xs-6 col-md-4 member-data-label">
									<fmt:message key="label.username" bundle="${msg}" />
								</div>
								<div class="col-xs-6 col-md-4 member-data-info">
									${username }
								</div>
							</div> --%>
						</div>
						<p class="member-account-details-footer"><fmt:message key="member.account.details.footer1" bundle="${msg}" /> <a href="<fmt:message key="member.account.details.footer2.link" bundle="${msg}"/>" target="_blank"><fmt:message key="member.account.details.footer2" bundle="${msg}" /></a> <fmt:message key="member.account.details.footer3" bundle="${msg}" /> <br><b><fmt:message key="member.account.details.remark" bundle="${msg}" /></b></p>
						<c:if test='${fnaLastUpdate.length() > 0}'>
						<h3 class="heading-title"><fmt:message key="label.fna" bundle="${msg}" /></h3>	
						<p id="complete-statement"><fmt:message key="label.complete.fna" bundle="${msg}" /> '${fnaLastUpdate }' <fmt:message key="label.complete.fna2" bundle="${msg}" /> <a class="bold text-bold" href="javascript:void(0);" onclick="goFna();" ><fmt:message key="button.review.fna" bundle="${msg}" /></a></p>
						</c:if>							
					</div>
					<div id="promo-offers-tab-contents" class="hidden content">
						<ul class="nav nav-tabs nav-justified visible-xs visible-sm mobile-promo-navtab">
							<li class="active"><a href="#promo-code" data-toggle="tab"><fmt:message key="label.personnal.promotion.code" bundle="${msg}" /></a></li>
							<%--<li><a href="#ref-program" data-toggle="tab"><fmt:message key="label.refferal.program" bundle="${msg}" /></a></li>--%>
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
							<%--
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
							--%>	
						</div>		
					</div>
					<!-- e-wallet Begin-->
					<div id="e-wallet-tab-contents" class="hidden content">
						<!-- <div class="ew_loading"></div> -->
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#ewallet-plans" data-toggle="tab"><fmt:message key="ewallet.tab.withdrawal.policy.info" bundle="${msg}" /></a></li>
							<li><a href="#ewallet-logs" data-toggle="tab"><fmt:message key="ewallet.tab.withdrawal.record" bundle="${msg}" /></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="ewallet-plans">
								<div class="row ew_pol_list">
									<div class="col-xs-12 ew-tab-title">
										<h3 class="heading-title"><fmt:message key="ewallet.planList.pol.title" bundle="${msg}" /></h3>
									</div>

									<div class="col-xs-12 text-center ew_loading">
										<i class="fa fa-refresh fa-spin ew_spin"></i>
									</div>

									<div class="col-xs-12">
										<p class="ew_accErrMsg"></p>
									</div>

									<div class="col-xs-12 ew_pol_wd_form">
										<a href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/support-claims/forms/life/policy-services-request-form.pdf" class="ew_pol_wd_formBtn"><fmt:message key="ewallet.downloadFormBtnText" bundle="${msg}" /></a>
									</div>
								</div>

								
							</div>
							<!-- template -->
							<div class="col-xs-12 ew_pol ew_pol_template">
								<div class="ew_pol_info">
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planNameText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_name"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planPolicyNumberText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_id"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planBalanceText" bundle="${msg}" /><span class="ew_pol_principal_date"></span>)</span>
										<span class="ew_pol_info_fieldValue ew_pol_blance"></span>
									</p>
								</div>
								<div class="col-xs-12 ew_pol_sep">
								</div>
								<div class="col-xs-12">
									<p><fmt:message key="ewallet.withdrawMethod.linkUp.title" bundle="${msg}" /></p>
								</div>
								<div class="col-xs-12 ew_pol_wd_linkup">
									<div class="col-xs-12 col-sm-4 ew_pol_wd_linkup_status">
										<img src="<%=request.getContextPath()%>/resources/images/eWallet/ewallet-tng-icon.png" alt="<fmt:message key='ewallet.tapngo' bundle='${msg}'/>" class="img-responsive ew_pol_wd_linkup_icon">
										<div class="ew_pol_wd_linkup_detail">
											<p class="ew_pol_info_fieldName"><fmt:message key="ewallet.withdrawMethod.linkUp.name" bundle="${msg}" /></p>
											<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_empty"><fmt:message key="ewallet.withdrawMethod.status.emptyText" bundle="${msg}" /></p>
											<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_connected">
												<span class="ew_pol_wd_linkup_tngId"></span><br>
												<a href="javascript:void(0);" class="ew_pol_wd_linkup_unlink"><fmt:message key="ewallet.withdrawMethod.status.connectedUnlinkPromptLinkText" bundle="${msg}" /></a>
											</p>
											<p class="ew_pol_info_fieldName ew_pol_wd_linkup_status ew_pol_wd_linkup_locked"><fmt:message key="ewallet.withdrawMethod.status.lockedText" bundle="${msg}" /></p>	
										</div>
										
									</div>
									<div class="ew_pol_info">	
										<p class="col-xs-12 col-sm-4 ew_pol_info_data">
											
										</p>
									</div>
									<div class="col-xs-12 col-sm-4 ew_pol_wd_linkup_action">
										<a class="ew_pol_wd_linkupBtn" href="javascript:void(0);"><i class="fa fa-refresh fa-spin ew_spin"></i><fmt:message key="ewallet.withdrawMethod.linkUpBtnText" bundle="${msg}" /></a>
										<a class="ew_pol_wd_withdrawBtn" href="javascript:void(0);"><i class="fa fa-refresh fa-spin ew_spin"></i><fmt:message key="ewallet.withdrawMethod.withdrawBtnText" bundle="${msg}" /></a>
									</div>
								</div>
								<div class="col-xs-12 ew_pol_warns">
									<a class="ew_pol_btnMore" role="button" data-toggle="collapse">
										<span class="glyphicon glyphicon-exclamation-sign"></span>
										<span class="txt"><fmt:message key="ewallet.planList.pol.info.warningTitle" bundle="${msg}" /></span>
									</a>
									<ul class="collapse ew_pol_warnList">
									</ul>
								</div>
							</div>

							<div class="tab-pane" id="ewallet-logs">
								<!-- log -->
								<div class="row ew_pol_log">
									<div class="col-xs-12 ew-tab-title"> 
										<h3 class="heading-title"><fmt:message key="ewallet.log.heading.title" bundle="${msg}" /></h3>
									</div> 
									<div class="col-xs-12 ew_log_selectWrapper">
										<div class="col-xs-12 col-sm-3"><fmt:message key="ewallet.planList.pol.info.planPolicyNumberText1" bundle="${msg}" /></div>
										<div class="col-xs-12 col-sm-3">
											<div class="ew_pol_selector">
												<select>
												</select>
											</div>
										</div>
									</div>
									<div class="col-xs-12 ew_pol">
										<div class="ew_pol_info">
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planNameText" bundle="${msg}" /></span>
												<span class="ew_pol_info_fieldValue ew_pol_name"></span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planPolicyNumberText" bundle="${msg}" /></span>
												<span class="ew_pol_info_fieldValue ew_pol_id"></span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planBalanceText" bundle="${msg}" /><span class="ew_pol_principal_date"></span>)</span>
												<span class="ew_pol_info_fieldValue ew_pol_blance"></span>
											</p>
											<p class="col-xs-12 col-sm-4 ew_pol_info_data">
												<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.tngId" bundle="${msg}" /></span>
												<span class="ew_pol_info_fieldValue ew_pol_tngId"></span>
											</p>
										</div> 
									</div>
									<div class="col-xs-12 ew_log_dt_selectWrapper">
										<div class="ew_dt_from_txt">
											<fmt:message key="ewallet.planList.pol.info.period" bundle="${msg}"/>
										</div>
										<input id="dt_log_from" placeholder="Please Select..." />
										<div class="ew_dt_to_txt">
											<fmt:message key="ewallet.planList.pol.info.to" bundle="${msg}"/>
										</div>
										<input id="dt_log_to" placeholder="Please Select..." />
										<div class="ew_btn_grp">
											<a href="javascript:void(0);" class="ew_btn_ok"><i class="fa fa-refresh fa-spin ew_spin"></i><fmt:message key="ewallet.prompt.confirm" bundle="${msg}"/></a>
										</div>
									</div>
									<div class="col-xs-12 ew_logTable_wrapper">
										<table class="ew_log_table">
										  <tr>
										    <th><fmt:message key="ewallet.withdraw.linkdate" bundle="${msg}"/></th> 
										    <th><fmt:message key="ewallet.withdraw.refno" bundle="${msg}"/></th> 
										    <th><fmt:message key="ewallet.withdraw.amount.text" bundle="${msg}"/></th>
										  </tr>
										</table>
									</div>
									<div class="col-xs-12 text-center ew_loading">
										<i class="fa fa-refresh fa-spin ew_spin"></i>
									</div>
								</div>
							</div>
						</div>
						<div id="note">
						<!-- <fmt:message key="ewallet.label.remark.last.update" bundle="${msg}" /> <br/> -->
						<fmt:message key="ewallet.remark.remark" bundle="${msg}" />
						<ol>
						<li><fmt:message key="ewallet.remark.line1" bundle="${msg}" /></li>
						<li><fmt:message key="ewallet.remark.line2" bundle="${msg}" /></li> 
						<li><fmt:message key="ewallet.remark.line3" bundle="${msg}" /></li> 
						<li><fmt:message key="ewallet.remark.line4" bundle="${msg}" /></li> 
						</ol>
						</div>
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
<div class="modal fade ew_popup_linkup" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title"><fmt:message key="ewallet.linkup.title" bundle="${msg}" /> </h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<h4 class="ew_popup_sec_title"><fmt:message key="ewallet.popup.sec.title" bundle="${msg}" /></h4>
							<div class="col-xs-12 ew_popup_sec_pol">
								<div class="ew_pol_info">
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planNameText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_name"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planPolicyNumberText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_id"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planBalanceText" bundle="${msg}" /><span class="ew_pol_principal_date"></span>)</span>
										<span class="ew_pol_info_fieldValue ew_pol_blance"></span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_otpInput">
								<h4 class="ew_popup_sec_title"><fmt:message key="ewallet.popup.sec.check.title" bundle="${msg}" /></h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<p class="ew_desc">
										<fmt:message key="ewallet.popup.sec.content.text1" bundle="${msg}" /><span class="ew_mobile"></span>.<br><fmt:message key="ewallet.popup.sec.content.text2" bundle="${msg}" /></p>
										<p class="ew_sentOtp"><fmt:message key="ewallet.sent" bundle="${msg}" /></p>
										
									<div class="ew_pol_info">

										<div class="ew_otp_wrapper">
											<input type="text" class="ew_otp_input" maxlength="6">
										</div>
									</div>
									<div class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2 ew_agreeBox">
										<input id="chk_otp" type="checkbox" name="chk">
										<label for="chk_otp">
											<span>
												<fmt:message key="ewallet.popup.checkbox.agreement" bundle="${msg}" />
											</span>
										</label>
									</div>
									<div class="col-xs-12">
										<a href="javascript:void(0);" class="ew_btn_confirm"><fmt:message key="ewallet.popup.checkbox.confirmBtnText" bundle="${msg}" /></a>
									</div>
									<div class="col-xs-12">
										<p class="ew_resendOtp">							
											<fmt:message key="ewallet.resendOTP.please" bundle="${msg}" /> <a href="javascript:void(0);" class="ew_link_resendOTP"><fmt:message key="ewallet.popup.btn.selecthere" bundle="${msg}" /> </a><fmt:message key="ewallet.resendOTP.resentPW" bundle="${msg}" />
										</p>
									</div>
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<div class="col-xs-12">
										<ul class="ew_desc_err">
										</ul>
									</div>
								</div>
							</div>
							<div class="col-xs-12 ew_remark">
								<p><sup>^</sup><fmt:message key="ewallet.popup.remark" bundle="${msg}" /></p>
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
				<h4 class="modal-title"><fmt:message key="ewallet.popup.pair.success.title" bundle="${msg}" /></h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<h3 class="sub-header"><fmt:message key="ewallet.popup.pair.success.txt1" bundle="${msg}" /></h3>

							<p class="ew_desc">
								<fmt:message key="ewallet.popup.pair.success.txt2" bundle="${msg}" />
								${userDetails.getEmailAddress()}
							</p>
							<a href="javascript:void(0);" data-dismiss="modal" class="ew_btn_confirm"><fmt:message key="ewallet.popup.pair.success.btn" bundle="${msg}" /></a>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- withdraw -->
<div class="modal fade ew_popup_withdraw" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="ew_popup_loading">
				<p><i class="fa fa-refresh fa-spin fa-3x fa-fw ew_spin"></i></p>
			</div>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title"><fmt:message key="ewallet.withdraw.title" bundle="${msg}" /></h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row ew_step_1">
						<div class="col-xs-12 ew_popup_sec">
							<h4 class="ew_popup_sec_title"><fmt:message key="ewallet.popup.sec.title" bundle="${msg}" /></h4>
							<div class="col-xs-12 ew_popup_sec_pol">
								<div class="ew_pol_info">
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planNameText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_name"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planPolicyNumberText" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_pol_id"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.planList.pol.info.planBalanceText" bundle="${msg}" /><span class="ew_pol_principal_date"></span>)</span>
										<span class="ew_pol_info_fieldValue ew_pol_blance"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										<span class="ew_pol_info_fieldName"><fmt:message key="ewallet.withdraw.name" bundle="${msg}" /></span>
										<span class="ew_pol_info_fieldValue ew_tngId"></span>
									</p>
									<p class="col-xs-12 col-sm-4 ew_pol_info_data">
										
									</p>
								</div>
							</div>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_amountOpt">
								<h4 class="ew_popup_sec_title"><fmt:message key="ewallet.popup.sec.amountOpt.title" bundle="${msg}" /></h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<div class="col-xs-12">
										<!-- <p class="ew_hint">
											<fmt:message key="ewallet.popup.sec.amountOpt.min" bundle="${msg}" /> $500 / <fmt:message key="ewallet.popup.sec.amountOpt.max" bundle="${msg}" /> $3,000
										</p> -->
									</div>
									<div class="col-xs-12">
										<div class="ew_btn_grp">
											<a href="javascript:void(0);" class="ew_btn ew_btn_amount" data-amount="500">$500</a><!--
											--><a href="javascript:void(0);" class="ew_btn ew_btn_amount" data-amount="1000">$1,000</a><!--
											--><a href="javascript:void(0);" class="ew_btn ew_btn_amount" data-amount="2000">$2,000</a><!--
											--><a href="javascript:void(0);" class="ew_btn ew_btn_amount" data-amount="3000">$3,000</a>
										</div>
										<div class="ew_txt_or ew_desc"><fmt:message key="ewallet.popup.sec.amountOpt.or" bundle="${msg}" /></div>
										<div class="ew_amount_input">
											<input type="text" placeholder="<fmt:message key='ewallet.placeholder.input' bundle='${msg}'/>" id="ew_input_amount">
										</div>
										<div class="ew_btn_grp">
											<a href="javascript:void(0);" class="ew_btn_withdraw"><fmt:message key="ewallet.popup.sec.withdraw.btn" bundle="${msg}" /></a>
										</div>
									</div>									
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<!-- <div class="col-xs-12">
										<ul class="ew_desc_err">
										</ul>
									</div> -->
								</div>
							</div>
							<%-- <div class="col-xs-12 ew_remark">
								<p><sup>^</sup><fmt:message key="ewallet.popup.remark" bundle="${msg}" /></p>
							</div> --%>
						</div>
					</div>
					<div class="row ew_step_2">
						<div class="col-xs-12 ew_withdrawAmount">
							<p class="ew_desc">
								<fmt:message key="ewallet.withdraw.amount.text" bundle="${msg}" /> <span class="ew_amount"><fmt:message key="ewallet.withdraw.HKD" bundle="${msg}" />$1,000<sup>*</sup></span>
							</p>
						</div>
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_popup_sec_otpInput">
								<h4 class="ew_popup_sec_title"><fmt:message key="ewallet.popup.sec.content.check" bundle="${msg}" /></h4>
								<div class="col-xs-12 ew_popup_sec_content">
									<p class="ew_desc">
										<fmt:message key="ewallet.popup.sec.content.text1" bundle="${msg}" /><span class="ew_mobile">9876 ****</span>.<br><fmt:message key="ewallet.popup.sec.content.text2" bundle="${msg}" /></p>
									<p class="ew_sentOtp"><fmt:message key="ewallet.sent" bundle="${msg}" /></p>
									<div class="ew_pol_info">

										<div class="ew_otp_wrapper">
											<input type="text" class="ew_otp_input" maxlength="6">
										</div>
									</div>
									<div class="col-xs-12">
										<a href="javascript:void(0);" class="ew_btn_confirm"><fmt:message key="ewallet.popup.checkbox.confirmBtnText" bundle="${msg}"/></a>
									</div>
									<div class="col-xs-12">
										<p class="ew_resendOtp">
											<fmt:message key="ewallet.resendOTP.please" bundle="${msg}" /> <a href="javascript:void(0);" class="ew_link_resendOTP"><fmt:message key="ewallet.popup.btn.selecthere" bundle="${msg}" /> </a><fmt:message key="ewallet.resendOTP.resentPW" bundle="${msg}" />
										</p>
									</div>
									<div class="col-xs-12">
										<p class="ew_desc_opt"></p>
									</div>
									<div class="col-xs-12 ew_desc_err">
										<p>
										</p>
									</div>
								</div>
							</div>
							<%-- <div class="col-xs-12 ew_remark">
								<p><sup>^</sup><fmt:message key="ewallet.popup.remark" bundle="${msg}"/></p>
							</div> --%>
						</div>
					</div>
					<div class="row ew_step_3">
						<div class="col-xs-12 ew_popup_sec">
							<div class="ew_success">
								<p class="ew_bigTxt"><fmt:message key="ewallet.prompt.success" bundle="${msg}" /></p>
								<p class="ew_desc">
									<fmt:message key="ewallet.prompt.withdrawal.successTxt1" bundle="${msg}" /><span class="pid"></span><fmt:message key="ewallet.prompt.withdrawal.successTxt2" bundle="${msg}" />
								</p>
								<a href="javascript:void(0);" class="ew_btn_confirm" data-dismiss="modal"><fmt:message key="ewallet.prompt.confirm" bundle="${msg}"/></a>
							</div>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- unlink confirm -->
<div class="modal fade ew_popup_unlinkConfirm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<p class="ew_desc">
								<fmt:message key="ewallet.prompt.unlink.confirmMsg" bundle="${msg}" />
							</p>
							<a href="javascript:void(0);" class="ew_btn_confirm"><fmt:message key="ewallet.prompt.unlink.confirmBtn1" bundle="${msg}" /></a>
							<a href="javascript:void(0);" class="ew_btn_cancel" data-dismiss="modal"><fmt:message key="ewallet.prompt.unlink.confirmBtn2" bundle="${msg}" /></a>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- error -->
<div class="modal fade ew_popup_error" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid bd-example-row">
					<div class="row">
						<div class="col-xs-12 ew_popup_sec">
							<p class="ew_desc">
							</p>
							<a href="javascript:void(0);" class="ew_btn_confirm" data-dismiss="modal"><fmt:message key="ewallet.popup.checkbox.confirmBtnText1" bundle="${msg}" /></a>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div>
<form id="linkupform" method="post">
<input type="hidden" name="appId" id="appId" value=""/>
<input type="hidden" name="merTradeNo" id="merTradeNo" value="" />
<input type="hidden" name="paymentType" id="paymentType" value=""/>
<input type="hidden" name="payload" id="payload" value=""/>
<input type="hidden" name="extras" id="extras" value=""/>
<input type="hidden" name="transactionType" id="transactionType" value=""/>
<input type="hidden" name="sign" id="sign" value=""/>
</form>
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
			window.location.hash = 'profile-tab-link';
		  } else if($(this).parent('li').hasClass('dropdown-insurance-plan')) {
		  	$('.eservices').addClass('insurance-active-page');
			$('.eservices').removeClass('profile-active-page promo-active-page');
		  	$('.left-side-tab-menu').removeClass('active');
		  	$('.insurance-plan').addClass('active');
			$('#purchase-history-tab-contents').removeClass('hidden');
			$('#eservices-tab-contents').addClass('hidden');
			$('#promo-offers-tab-contents').addClass('hidden');
			$('#e-wallet-tab-contents').addClass('hidden');
			window.location.hash = 'insurance-plan-tab-link';
			$("#active-tab a").trigger("click");
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
			window.location.hash = 'promo-offers-tab-link';
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
			window.location.hash = 'e-wallet-tab-link';
			policyHelper.reloadPolicy();
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
				var selText = '<c:if test="${isFwdCust}"><fmt:message key="tab.customer.profile" bundle="${msg}" /></c:if><c:if test="${not isFwdCust}"><fmt:message key="tab.member.profile" bundle="${msg}" /></c:if>'; //'Profile';
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
		  		$("#active-tab a").trigger("click");
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
				var selText = '<fmt:message key="tab.withdrawal" bundle="${msg}" />'; //'Promo & Offers';
		  		$('.dropdown-menu li a').parents('.btn-group').find('.dropdown-toggle').html(selText+' <i class="fa fa-angle-down"></i>');

		  		policyHelper.reloadPolicy();
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
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.custom-2.17.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.en_fwd.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/vendor/mobiscroll.i18n.zh_fwd.js" type="text/javascript"></script>