<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
		<%!
			boolean isSaleActiveClass = true;
		%>
		<div class="fwd-savie-wrapper">
			<!--Application Header Info Widget-->
			<div class="container-fluid fwd-full-container">
				<div class="application-page-header">
					<div class="row">
						<div class="col-xs-12 orange-section">
							<div class="clearfix position">
								<div class="back-arrow-left">
									<a id="order-summary-return-btn" class="btn back-arrow-btn" href="">
										<span class="icon-arrow-left2 arrow-left"></span>
									</a>
								</div>
								<div class="description-order-summary">
									<span><fmt:message key="savie.summary.title" bundle="${msg}" /></span>
								</div>
								<div class="dollars-monthly-right">
									<div class="figures">
										<span class="figure-description"><fmt:message key="savie.summary.single_premium" bundle="${msg}" /></span>
										<span class="dollars"><fmt:message key="savie.summary.HK" bundle="${msg}" /> <span class="figure">100,000</span></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 gray-section">
							<div class="description"><fmt:message key="savie.summary.title" bundle="${msg}" /></div>
						</div>
					</div>
				</div>
			</div>

			<div class="application-flux">
				<!-- Illustration Review Block -->
				<div class="fwd-full-container container-fluid illustration-review investment">
					<div class="fwd-container-limit illustrate investment-summary-and-table">
						<div id="sales-contents" class="tab-content credits">
							<div>
								<div class="container-fluid summary-tab-max-width">
									<div id="application-review-container" class="fwd-container">
										<div class="illustration-head">
											<h2 class="text-center appli"><fmt:message key="savie.summary.application_summary" bundle="${msg}" /></h2>
										</div>
										<div class="row plan-row inner-plan-row">
											<div class="clearfix inner-plan-col">
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3><fmt:message key="savie.summary.personal" bundle="${msg}" /> <a class="hidden-xs hidden-sm" href="#"><fmt:message key="savie.summary.edit" bundle="${msg}" /></a></h3>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.name_english" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p></p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3 name-pad">
															<p><fmt:message key="savie.summary.last_name" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>${savieDetail.savieApplicantBean.lastName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3 name-pad">
															<p><fmt:message key="savie.summary.given_name" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col name-pad">
															<p>${savieDetail.savieApplicantBean.firstName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.name_chinese" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col chinese">
															<p>${savieDetail.savieApplicantBean.chineseName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.hkid" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.hkId }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.gender" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.gender }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.marital_status" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.maritalStatusDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.date_birth" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.birthday }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.place_birth" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.placeOfBirthDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.nationality" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.nationalityDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.email_address" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieApplicantBean.email }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.tel_no" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>+852 1234-5678</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.residential_address" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p class="line">${savieDetail.savieApplicantBean.residentialAdress1 },${savieDetail.savieApplicantBean.residentialAdress2 },${savieDetail.savieApplicantBean.residentialAdress3 },${savieDetail.savieApplicantBean.residentialDistrictDesc }</p>
														</div>
													</div>
												</div>
												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3 class="h3-pad"><fmt:message key="savie.summary.employment_info" bundle="${msg}" /> <a class="hidden-xs hidden-sm" href="#"><fmt:message key="savie.summary.edit" bundle="${msg}" /></a></h3>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.employment_status" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieEmploymentBean.employmentStatusDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.occupation" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieEmploymentBean.occupationDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.nature_business" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieEmploymentBean.natureOfBusinessDesc }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.monthly_personal" bundle="${msg}" /> <span class="p-monthly"><fmt:message key="savie.summary.income" bundle="${msg}" /></span></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.savieEmploymentBean.monthlyPersonalIncomeDesc }</p>
														</div>
													</div>
												</div>
												<c:forEach var="savieBeneficiaryBean" varStatus="status" items="${savieDetail.savieBeneficiaryBeans}">
													<div class="col-xs-12 col-md-12 inner-col">
														<div class="row">
															<h3 class="h3-pad"><fmt:message key="savie.summary.beneficiary" bundle="${msg}" /> <span>(<fmt:message key="savie.summary.person" bundle="${msg}" />) ${status.index + 1 }</span> <a class="hidden-xs hidden-sm" href="#"><fmt:message key="savie.summary.edit" bundle="${msg}" /></a></h3>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.name_english" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p></p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3 name-pad">
																<p><fmt:message key="savie.summary.last_name" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col name-pad">
																<p>${savieBeneficiaryBean.lastName }</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3 name-pad">
																<p><fmt:message key="savie.summary.given_name" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col name-pad">
																<p>${savieBeneficiaryBean.firstName }</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.relationship" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>${savieBeneficiaryBean.relationshipDesc }</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.gender" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>${savieBeneficiaryBean.gender }</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.entitlement" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>${savieBeneficiaryBean.entitlement }</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.plan_name" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>Savie</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.currency" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>HK$</p>
															</div>
															<div class="clearfix"></div>
															<div class="col-xs-6 col-md-3">
																<p><fmt:message key="savie.summary.single_premium" bundle="${msg}" /></p>
															</div>
															<div class="col-xs-6 col-md-9 plan-col">
																<p>HK$ 10000.0</p>
															</div>
														</div>
													</div>
												</c:forEach>

												<div class="col-xs-12 col-md-12 inner-col">
													<div class="row">
														<h3 class="h3-pad"><fmt:message key="savie.summary.payment_info" bundle="${msg}" /> <a class="hidden-xs hidden-sm" href="#"><fmt:message key="savie.summary.edit" bundle="${msg}" /></a></h3>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.payment_method" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.saviePaymentBean.paymentMethod }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.amount" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>HK$ ${savieDetail.saviePaymentBean.amount }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.account_no" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.saviePaymentBean.accountNo }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.bank_name" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.saviePaymentBean.bankName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.branch_name" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.saviePaymentBean.branchName }</p>
														</div>
														<div class="clearfix"></div>
														<div class="col-xs-6 col-md-3">
															<p><fmt:message key="savie.summary.expiry_date" bundle="${msg}" /></p>
														</div>
														<div class="col-xs-6 col-md-9 plan-col">
															<p>${savieDetail.saviePaymentBean.expiryDate }</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> <!-- application-review end tag -->
									<div class="btn-style btn-pro text-center">
										<button id="order-summary-proceed-btn" type="button" class="text-center btn-next"><fmt:message key="savie.summary.next" bundle="${msg}" /></button>
									</div>
								</div> <!-- tab summary end -->
							</div>
						</div> <!-- tab content credits -->
					</div> <!-- investment summary table end -->
				</div> <!-- investment end -->
			</div>

			<!-- FOOTER -->
			<div id="illustration-result" class="modal fade illustration-result application-modal" role="dialog" data-backdrop="false" aria-labelledby="illustration-result">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
						<div class="modal-body">
							<h2>Here’s your sales illustration result</h2>
							<p class="single-premium">Single premium</p>
							<span class="amount">HK$ 100,00</span>
							<p class="guaranteed">Guaranteed at the end of 3rd policy year HK$ 110,334</p>
							<button id="review-accept" class="btn next" data-dismiss="modal">Review and accept</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- JS INCLUDES -->
		<script>
			$(function() {
				//$('#illustration-result').modal('show');
			});
		</script>
