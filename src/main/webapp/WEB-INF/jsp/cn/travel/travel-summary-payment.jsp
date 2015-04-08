<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
	function confirmPayment() {
		var geteWayUrl = $('#gateway').val();
		$.ajax({
			type : "POST",
			url : "processTravePayment",
			data : $("#paymentForm").serialize(),
			async : false,
			success : function(data) {
				if (data == 'success') {
					//document.paymentForm.action = "https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp";
					//window.location.href = "https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp";
					document.paymentForm.action = geteWayUrl;
				}
			}
		});
	}
	function BackMe() {
		window.history.back();
	}
</script>
<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>
<!--/#main-Content-->
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm" method="post" onsubmit="return cpayValid();">
				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">旅遊保險</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><span class="clearfix"></span> 您的選擇</a><i
						class="fa fa-caret-right"></i></li>
					<li><a href="#">個人資料</a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 總結及付款</li>
				</ol>
				<div class="container ">
					<div class="col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>總結及付款</h2>
						</div>
						<br> <br>
						<div class="col-lg-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c3"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle">
										<span class="status color3"> 您的選擇</span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle ">
										<span class="status color3">個人資料</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act">
										<span class="status color2"> 總結及付款</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status"> 確認保單</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
					<div
						class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1">
						<br>
						<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6 pad-none">
							<h3 class="margin-left-2 h2-3-existing-fwd-head">摘要</h3>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="h2-1 pad-none">申請編號</td>
										<td class="pad-none h4-5 ">${createPolicy.getReferenceNo()}</td>
									</tr>

									<tr>
									<td></td>
										<td class="h2-1 pad-none">${selectPlanName}  保險計劃</td>
										<!-- <td class="pad-none h4-5 ">計劃B 基本保障<br> HK$500,000

											醫療保障--><!--<br>
                        <h4 class="h4-4-full">+ [承保範圍]</h4>
										</td>

									</tr>-->
									<tr>
										<td class="h2-1 pad-none">總受保人數 <br>
										</td>
										<td class="pad-none h4-5 ">${travelBean.getTotalTraveller()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">保障期</td>
										<td class="pad-none h4-5 ">由
											${travelBean.getTrLeavingDate()} 至
											${travelBean.getTrBackDate()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none">日子總計</td>
										<td class="pad-none h4-5 ">${totalTravallingDays}</td>
									</tr>
									<tr>
										<td class="pad-none"><span class="h4-4-orange-b pad-none">所需保費
										</span></td>
										<td class="pad-none "><span
											class="h4-4-orange-b pad-none">港幣 ${dueAmount} 元正 </span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-none hidden-sm hidden-xs">
							<h4 class="h4-trav-full col-xs-offset-8">
								<a href="#" onclick="BackMe();" >更改資料</a>
							</h4>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none h2-3-existing-fwd-head ">申請人資料</td>
										<td class="pad-none h4-5 "></td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">英文全名</td>
										<td class="pad-none h4-5 ">${userDetails.getFullName() }</td>
									</tr>
									<tr>

										<td class="h2-1 pad-none ">香港身份證號碼/護照號碼</td>
										<td class="pad-none h4-5 ">${userDetails.getHkid()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">電郵地址</td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">手機號碼</td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo() }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
						<div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none">
							<table class="travel-tb wd2">

								<tbody>
									<tr class="travel-tb-head">
										<td class=" h2-1  travel-tb-td">受保人</td>
										<td class=" h2-1  travel-tb-td">英文全名</td>
										<td class=" h2-1  travel-tb-td">年齡</td>
										<td class=" h2-1  travel-tb-td">香港身份證號碼 /護照號碼</td>
										<td class=" h2-1  travel-tb-td">關係</td>
									</tr>
									<%
										PlanDetailsForm planDetailsForm = (PlanDetailsForm) request
												.getAttribute("planDetailsForm");
										for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
									%>

									<tr class="hidden-sm hidden-xs">
										<td data-title="Adult <%=i + 1%>"><span class="h2-1-td">成人
												<%=i + 1%></span></td>
										<td data-title="Full name"><span class="h4-5"><%=planDetailsForm.getAdultName()[i]%></span></td>
										<td data-title="Age range"><span class="h4-5"><%=planDetailsForm.getAdultAgeRange()[i]%></span></td>
										<td data-title="HKID"><span class="h4-5"><%=planDetailsForm.getAdultHKID()[i]%></span></td>
										<td data-title="Relationship"><span class="h4-5">自己 地產</span></td>
									</tr>
									<%
										if (planDetailsForm.getAdultBenificiaryFullName().length > 0) {
									%>
									<tr>
										<td data-title="Adult1"><span class="h4-6-td">受益人</span></td>
										<td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%></td>
										<td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
										<td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%></td>
										<td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getAdultBeneficiary()[i]%></td>
									</tr>
									<%
										}
									%>
								</tbody>
								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
								%>
								<tr>
									<td data-title="Child <%=i + 1%>"><span class="h2-1-td">孩子
											<%=i + 1%></span></td>
									<td class="h4-5" data-title="Full name"><%=planDetailsForm.getChildName()[i]%></td>
									<td class="h4-5" data-title="Age range"><%=planDetailsForm.getChildAgeRange()[i]%></td>
									<td class="h4-5" data-title="HKID"><%=planDetailsForm.getChildHKID()[i]%></td>
									<td class="h4-5" data-title="Relationship">自己 地產</td>
								</tr>
								<%
									if (planDetailsForm.getChildBenificiaryFullName().length > 0) {
								%>
								<tr>
									<td data-title="Adult1"><span class="h4-6-td">受益人</span></td>
									<td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryFullName()[i]%></td>
									<td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
									<td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryHkid()[i]%></td>
									<td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getAdultBeneficiary()[i]%></td>
								</tr>
								<%
									}
								%>
								</tbody>
								<%
									}
								%>
								<%
									for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
								%>
								<tbody>
									<tr class="hidden-sm hidden-xs">
										<td data-title="Other<%=i + 1%>"><span class="h2-1-td">其他
												<%=i + 1%></span></td>
										<td class=" h4-5" data-title="Full name"><%=planDetailsForm.getOtherName()[i]%></td>
										<td class=" h4-5" data-title="Age range"><%=planDetailsForm.getOtherAgeRange()[i]%></td>
										<td class=" h4-5" data-title="HKID"><%=planDetailsForm.getOtherHKID()[i]%></td>
										<td class=" h4-5" data-title="Relationship">自己 地產</td>
									</tr>
									<%
										if (planDetailsForm.getOtherBenificiaryFullName().length > 0) {
									%>
									<tr>
										<td data-title="Adult1"><span class="h4-6-td">受益人</span></td>
										<td data-title="Full name" class="travel-tb-h3 "><%=planDetailsForm.getOtherBenificiaryFullName()[i]%></td>
										<td data-title="Age range" class="travel-tb-h3 ">&nbsp;</td>
										<td data-title="HKID" class="travel-tb-h3 "><%=planDetailsForm.getOtherHKID()[i]%></td>
										<td data-title="Relationship" class="travel-tb-h3 "><%=planDetailsForm.getOtherBeneficiary()[i]%></td>
									</tr>
									<%
										}
									%>
								</tbody>
								<%
									}
								%>


							</table>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gray-bg1">
					<div class="clearfix"></div>
					<h2 class="from-control">付款</h2>
					<input type="hidden" name="merchantId"
						value="${createPolicy.getMerchantId()}"> <input
						type="hidden" name="amount" value="${dueAmount.trim()}"> <input
						type="hidden" name="orderRef"
						value="${createPolicy.getTransactionNo() }"> <input
						type="hidden" name="currCode"
						value="${createPolicy.getCurrCode() }"> <input
						type="hidden" name="successUrl" value="${path}"> <input
						type="hidden" name="failUrl" value="${failurePath }"> <input
						type="hidden" name="errorUrl" value="${failurePath }"> <input
						type="hidden" name="payType"
						value="${createPolicy.getPaymentType()}"> <input
						type="hidden" name="lang" value="${createPolicy.getLang()}">
					<input type="hidden" name="secureHash"
						value="${createPolicy.getSecureHash() }"> <input
						type="hidden" id="emailAddress" name="emailAddress"
						value="${userDetails.getEmailAddress()}"> <input
						type="hidden" id="gateway" name="gateway"
						value="${createPolicy.getPaymentGateway()}">



					<table class="table-responsive travel-tb">
						<tbody>
							<tr class="control-group" style="display: none;">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">信用卡類型</label></td>
								<td class="col-lg-8" colspan="2">
									<div class="controls">
										<input type="radio" name="pMethod" value="VISA" id="chkVisa" checked>VISA
										<input type="radio" name="pMethod" value="Master" id="chkMaster">MasterCard
										
										<div>
											<img src="resources/images/payment.png" alt="">
										</div>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">信用卡號碼</label></td>
								<td colspan="2">
									<div class="controls">
										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" min="16" title=""
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)" placeholder="信用卡號碼">
										<span id="errcardno" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">到期日</label></td>
								<td class="col-lg-4"><select class="pay-details-select"
									id="month" name="epMonth">
										<option>月</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
										<option>11</option>
										<option>12</option>
								</select></td>
								<td><select class="pay-details-select" id="year"
									name="epYear">
										<option>年</option>
										<option>2015</option>
										<option>2016</option>
										<option>2017</option>
										<option>2018</option>
										<option>2019</option>
										<option>2020</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td style="max-width: 200px"><span id="errmonth"
									class="error-msg"></span></td>
								<td style="max-width: 200px"><span id="erryear"
									class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">持卡人名稱</label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" name="cardHolder" type="text"
											class="input-block-level" placeholder="持卡人名稱"
											onblur="replaceAlpha(this);"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">驗證碼</label></td>
								<td>
									<div class="controls">
										<input id="seccode" type="password" name="securityCode"
											class="input-block-level" autocomplete="off" maxlength="3"
											title="" placeholder="驗證碼"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);" placeholder="驗證碼">

									</div>
								</td>
								<td><img src="resources/images/cards.png" alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td style="max-width: 200px"><span id="errcode"
									class="error-msg"></span></td>
								<td style="max-width: 200px"></td>
							</tr>
							<tr class="control-group">
								<td></td>
								<td colspan="2">
									<!-- <a class="sub-link" href="#">What is my security code?</a>-->
								</td>
							</tr>
						</tbody>
					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> 本人現授權富衛保險有限公司從我上述指定的信用卡賬戶扣除此保險所應繳之保費。</label>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!--<div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2">本人(等) 已參閱及明白保障範圍。</label>
						</div>-->
						<span id="errchk2" class="error-msg"></span>
						<div class="clearfix"></div>
						<!--     <div class="col-lg-12 pad-none"><a href="travel-plan-details.html" class="bdr-curve btn btn-primary bck-btn2">返回 </a> <a href="travel-confirmation.html" class="bdr-curve btn btn-primary nxt-btn margin-left" onclick="return payValid();"> 確認付款</a> </div>-->
						<div class="hidden-sm hidden-xs pad-none">
							<a href="#" onclick="BackMe()"
								class="bdr-curve btn btn-primary bck-btn2">返回 </a> <input
								type="submit"
								class="bdr-curve btn btn-primary nxt-btn margin-left"
								value="確認付款" onclick="confirmPayment()" />
						</div>
						<br> <br>
						
						<div class="pad-none hidden-md hidden-lg">
							<a href="travel-plan-details.html"
								class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">返回
							</a>
						</div>
						<!-- vincent add a button for paymnet confirmation (mobile) -->
						<div class="pad-none hidden-md hidden-lg">
							<input
								type="submit"
								class="bdr-curve btn btn-primary nxt-btn"
								value="確認付款" onclick="confirmPayment()" />
						<!-- vincent add a button for paymnet confirmation (mobile) -->							
							<div class="clearfix"></div>
						</div>
						<br>
						<br>
					</div>
				</div>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	<br>
</section>
<!--/end Main Content-->
</body>
</html>