<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>

<!DOCTYPE HTML>
<html>
<body>

	

	<div class="container main landing travelcare">
		<div class="hero" style="background-image: url('<%=request.getContextPath()%>/resources/images/passkit/banner.jpg');"></div>
		<div>
			<!-- body start -->
			<div class="col-xs-12 center verify-page">

				<div class="verify-form tabbed-page">
					<h3 class="verify-title">
						身份驗證
					</h3>
					<p>您即將下載電子版本的保險證明書。<br/>請選擇您於保單的身份以繼續︰</p>
					<div class="verify-content">
						<!-- server update -->
						<input type="hidden" id="tbx-policy-no" value="${policyNo}" />
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt">投保人</span>
							<input type="radio" name="usertype" value="applicant" />
						</label>
						</div>
						<div class="verify-detail" data-type="applicant">
							<p>
								請輸入您香港身份證號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p>
							<input class="verify-textfield" type="text" id="tbx-applicant-hkid" placeholder="(例如︰A1234)" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-applicant-hkid" data-error-validate="投保人資料不正確" data-error-required="請輸入您香港身份證號碼"></div>
						</div>
						<div class="verify-option">
							<label>
							<span class="radio"></span>
							<span class="radio-txt">被保人</span>
							<input type="radio" name="usertype" value="insuredperson" />
						</label>
						</div>
						<div class="verify-detail" data-type="insuredperson">
							<p>
								請輸入您的香港身份證或護照號碼<br/>的頭5位字母或數字以作驗證
								<br/>（您輸入的資料，必須與申請紀錄一致)
							</p>
							<input class="verify-textfield" type="text" id="tbx-insuredperson-hkid" placeholder="(例如︰A1234)" maxlength="5" />
							<div class="verify-error" data-error-for="tbx-insuredperson-hkid" data-error-validate="被保人資料不正確" data-error-required="請輸入您的香港身份證或護照號碼"></div>
						</div>
						<div class="verify-action">
							<input type="submit" value="提交" class="verify-button" id="tbx-verify-submit" />
							<p class="verify-remark">
								只要按下提交，您便可下載流動版本的保險證明書。此證書可於iOS或Andriod系統上顯示及儲存於您的手機，方便您聯絡我們或查閱保單詳情。
							</p>
						</div>
					</div>
				</div>

				<div class="verify-expired tabbed-page">
					<h3 class="verify-title">
						證明書已逾期
					</h3>
					<p>您好！您的證明書已逾期，我們希望您有一個愉快的旅程。</p>
					<p class="verify-remark">如欲查看更多精彩優惠，請到<a href="https://i.fwd.com.hk">i.fwd.com.hk</a>。</p>
					<p class="verify-remark">如有任何查詢或索償，請致電富衛24小時服務熱線(852) 3123 3123或瀏覽本公司的<a href="https://www.fwd.com.hk">網站</a>以了解索償程序。</p>
				</div>

				<div class="verify-qr-code tabbed-page">
					<h3 class="verify-title">
						下載證明書
					</h3>
					<p>請以手機掃描以下QR條碼以下載流動版本的保險證明書。</p>
					<div class="qr-code"><img src="<%=request.getContextPath()%>/resources/images/passkit/qr-sample.png" /></div>
					<p class="verify-remark">提示：於下載證明書期間，您的個人資料將會轉交予服務供應商以作於流動手機版本下載之用。</p>
				</div>

				<div class="verify-system-error tabbed-page">
					<h3 class="verify-title">
						System busy
					</h3>
					<p>System busy, please try again later.</p>
				</div>
			</div>

			<div class="loading-container">
			</div>
			<div class="loading">
				<div class="loading-inner">
					<div class='loading-anim'>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(0deg) translate(0,-60px);transform:rotate(0deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(30deg) translate(0,-60px);transform:rotate(30deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(60deg) translate(0,-60px);transform:rotate(60deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(90deg) translate(0,-60px);transform:rotate(90deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(120deg) translate(0,-60px);transform:rotate(120deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(150deg) translate(0,-60px);transform:rotate(150deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(180deg) translate(0,-60px);transform:rotate(180deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(210deg) translate(0,-60px);transform:rotate(210deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(240deg) translate(0,-60px);transform:rotate(240deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(270deg) translate(0,-60px);transform:rotate(270deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(300deg) translate(0,-60px);transform:rotate(300deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
						<div style='top:80px;left:93px;width:14px;height:40px;background:#ffffff;-webkit-transform:rotate(330deg) translate(0,-60px);transform:rotate(330deg) translate(0,-60px);border-radius:10px;position:absolute;'></div>
					</div>
					<div class="loading-text">請稍後</div>
				</div>
			</div>

			<!-- body end -->
		</div>
	</div>


	<script type="text/javascript">
    window.status = "Done";
  </script>
</body>

</html>