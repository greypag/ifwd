<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="passkit" var="msg" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>

<!DOCTYPE HTML>
<html>
<body>

	

	<div class="closeMobileMenu commonBody"><div class="container main landing travelcare">
		<div class="hero" style="background-image: url('<%=request.getContextPath()%>/resources/images/passkit/banner.jpg');"></div>
		<div>
			<!-- body start -->
			<div class="col-xs-12 center verify-page">

				<div class="verify-form tabbed-page">
					<h3 class="verify-title">
						<fmt:message key="verification.identity.text" bundle="${msg}" />
					</h3>
					<p><fmt:message key="verification.identity.description" bundle="${msg}" /><br/><fmt:message key="verification.identity.select.description" bundle="${msg}" /></p>
					<div class="verify-content">
						<!-- server update -->
						<input type="hidden" id="tbx-policy-no" value="${policyNo}" />
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt"><fmt:message key="verification.identity.applicant" bundle="${msg}" /></span>
							<input type="radio" name="usertype" value="applicant" />
						</label>
						</div>
						<div class="verify-detail" data-type="applicant">
							<!-- <p>
								請輸入您香港身份證號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p> -->
							<p><fmt:message key="verification.identity.type.applicant.description" bundle="${msg}" /></p>
							<input class="verify-textfield" type="text" id="tbx-applicant-hkid" placeholder="<fmt:message key="verification.identity.example" bundle="${msg}" />" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-applicant-hkid" data-error-validate="<fmt:message key="verification.identity.applicant.error.massage" bundle="${msg}" />" data-error-required="<fmt:message key="verification.identity.applicant.error.need.massage" bundle="${msg}" />"></div>
						</div>
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt"><fmt:message key="verification.identity.insured.person" bundle="${msg}" /></span>
							<input type="radio" name="usertype" value="insuredperson" />
						</label>
						</div>
						<div class="verify-detail" data-type="insuredperson">
							<!-- <p>
								請輸入您的香港身份證或護照號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p> -->
							<p><fmt:message key="verification.identity.type.insured.person.description" bundle="${msg}" /></p>
							<input class="verify-textfield" type="text" id="tbx-insuredperson-hkid" placeholder="<fmt:message key="verification.identity.example" bundle="${msg}" />" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-insuredperson-hkid" data-error-validate="<fmt:message key="verification.identity.insured.person.error.massage" bundle="${msg}" />" data-error-required="<fmt:message key="verification.identity.insured.person.error.need.massage" bundle="${msg}" />"></div>
						</div>
						<div class="verify-action">
							<input type="submit" value="<fmt:message key="verification.identity.submit" bundle="${msg}" />" class="verify-button" id="tbx-verify-submit" />
							<p class="verify-remark">
							<fmt:message key="verification.identity.details.description" bundle="${msg}" />
							</p>
						</div>
					</div>
				</div>

				<div class="verify-expired tabbed-page">
					<h3 class="verify-title">
						<fmt:message key="verification.pass.expired.text" bundle="${msg}" />
					</h3>
					<p><fmt:message key="verification.pass.expired.text.detail" bundle="${msg}" /></p>
					<p class="verify-remark"><fmt:message key="verification.pass.expired.more" bundle="${msg}" /><a href="https://i.fwd.com.hk">i.fwd.com.hk</a>.</p>
					<p class="verify-remark"><fmt:message key="verification.pass.expired.contact.detail" bundle="${msg}" /><a href="https://www.fwd.com.hk"><fmt:message key="verification.pass.expired.contact.detail.website" bundle="${msg}" /></a><fmt:message key="verification.pass.expired.contact.detail.2" bundle="${msg}" /></p>
				</div>

				<div class="verify-qr-code tabbed-page">
					<h3 class="verify-title">
						<fmt:message key="verification.download.qrcode.text" bundle="${msg}" />
					</h3>
					<p><fmt:message key="verification.download.qrcode.description" bundle="${msg}" /></p>
					<div class="qr-code"><img src="<%=request.getContextPath()%>/resources/images/passkit/qr-sample.png" /></div>
					<p class="verify-remark"><fmt:message key="verification.download.qrcode.tips" bundle="${msg}" /></p>
				</div>

				<div class="verify-system-error tabbed-page">
					<h3 class="verify-title">
						<fmt:message key="verification.pass.system.busy.message" bundle="${msg}" />
					</h3>
					<p><fmt:message key="verification.pass.system.busy.try.later.message" bundle="${msg}" /></p>
				</div>
			</div>
			<div id="loading-overlay" class="modal fade bs-loading-modal-lg" tabindex="-1" role="dialog" aria-hidden="false" style="display: block;">
				<div class="modal-dialog modal-lg loading-dialog">
					<div class="modal-content plan-modal loading-modal">
						<img src="<%=request.getContextPath()%>/resources/images/loading.gif" width="300">
						
					</div>

				</div>
			</div>

			<!-- body end -->
		</div>
	</div>
	
	<script type="text/javascript">
    window.status = "Done";
  </script></div>
</body>

</html>