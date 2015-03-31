<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="homeCarepaymentForm" id="homeCarepaymentForm"
				onsubmit="confirmPayment(this);" method="post">
				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">家居保險 </a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">您的選擇 </a><i class="fa fa-caret-right"></i></li>
					<li><a href="#">您的保單 </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 您的賬單</li>
				</ol>
				<div class="container ">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>您的賬單</h2>
						</div>
						<br> <br>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c3"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle">
										<span class="status color3">您的選擇</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle ">
										<span class="status color3">您的保單</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act">
										<span class="status color2">您的賬單</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">確認保單</span>
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
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none white-bg1">
						<br>


						<div class="col-lg-6 col-xs-12 col-sm-12 col-md-6 pad-none">
							<h3 class="margin-left-2 h2-3-existing-fwd-head">摘要</h3>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="h2-1 pad-left1 col-lg-5">申請號碼</td>
										<td class=" h4-5">${createdPolicy.getReferenceNo() }</td>
									</tr>
									<tr>
										<td class="h2-1 ">保險計劃</td>
										<td class="h4-5 ">基本保障<br> 家居保障<br>
											<h4 class="h4-4-full">+ 承保範圍</h4></td>
									</tr>
									<tr>
										<td class="h2-1 ">通訊地址</td>
										<td class=" h4-5 ">
											${homeCareDetails.getApplicantRoom()}/${homeCareDetails.getApplicantFloor()},${homeCareDetails.getApplicantBlock()},<br>
											${homeCareDetails.getApplicantBuilding() },${homeCareDetails.getApplicantEstate() },<br>
											${homeCareDetails.getApplicantStreetName()}
											${homeCareDetails.getApplicantDistrict()}
										</td>
									</tr>
									<tr>
										<td class="h2-1 ">投保居所地址</td>
										<td class=" h4-5 ">
											${homeCareDetails.getaRoom()}/${homeCareDetails.getaFloor()},
											${homeCareDetails.getaBlock() },
											${homeCareDetails.getaBuilding()},
											${homeCareDetails.getaEstate() },${homeCareDetails.getaStreetNo() }
											${homeCareDetails.getaStreetName() }
											${homeCareDetails.getaDistrict()},
											${homeCareDetails.getaArea() }</td>
									</tr>
									<tr>
										<td class="h2-1 ">實用面積(平方尺)</td>
										<td class=" h4-5 ">${homeCareDetails.getNetFloorArea()}</td>
									</tr>
									<tr>
										<td class="h2-1 ">保障期</td>
										<td class=" h4-5 ">Yearly</td>
									</tr>
									<tr>
										<td class="h2-1 ">保單生效日期</td>
										<td class=" h4-5 ">From ${effectiveDate } to
											${effectiveEndDate}</td>
									</tr>
									<tr>
										<td class="pad-none"><span class="h4-4-orange-b pad-none">所需保費
										</span></td>
										<td><span class="h4-4-orange-b ">${totalDue}</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div
							class="col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-none hidden-sm hidden-xs">
							<h4 class="h4-trav-full col-xs-offset-8">
								<a href="homecare-plan-details.html">更改資料</a>
							</h4>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none h2-3-existing-fwd-head ">申請人資料</td>
										<td class="pad-none h4-5 "></td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">中文全名</td>
										<td class="pad-none h4-5 ">${userDetails.getFullName()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">香港身份證號碼</td>
										<td class="pad-none h4-5 ">${userDetails.getHkid() }</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">電郵地址</td>
										<td class="pad-none h4-5 ">${userDetails.getEmailAddress()}</td>
									</tr>
									<tr>
										<td class="h2-1 pad-none ">手提電話</td>
										<td class="pad-none h4-5 ">${userDetails.getMobileNo()}</td>
									</tr>
								</tbody>
							</table>
						</div>


					</div>
					<div class="clearfix"></div>
				</div>
				<div class="gray-bg1">
					<div class="clearfix"></div>
					<h2 class="from-control">付款</h2>
					<table class="table-responsive travel-tb">
						<input type="hidden" name="merchantId"
							value="${createdPolicy.getMerchantId()}">
						<input type="hidden" name="amount" value="${totalDue.trim()}">
						<input type="hidden" name="orderRef"
							value="${confirm.getTransactionNo() }">
						<input type="hidden" name="currCode"
							value="${createdPolicy.getCurrCode() }">
						<input type="hidden" name="successUrl" value="${path}">
						<input type="hidden" name="failUrl" value="${failurePath}">
						<input type="hidden" name="errorUrl" value="${failurePath}">
						<input type="hidden" name="payType"
							value="${createdPolicy.getPaymentType() }">
						<input type="hidden" name="lang"
							value="${createdPolicy.getLang()}">
						<input type="hidden" name="secureHash"
							value="${confirm.getSecureHash() }">
						<input type="hidden" id="emailAddress" name="emailAddress"
							value="${userDetails.getEmailAddress()}">
						<input type="hidden" id="transactionDate" name="transactionDate"
							value="${effectiveDate}">
						<input type="hidden" id="gateway" name="gateway"
							value="${createdPolicy.getPaymentGateway()}">
						<tbody>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">信用卡類型</label></td>
								<td class="col-lg-8" colspan="2"><div class="controls">
										<div>
											<img src="resources/images/payment.png" alt="">
										</div>
									</div></td>
							</tr>
							<tr>
								<td align="right">Payment Method</td>
								<td><input type="radio" name="pMethod" value="VISA">VISA
									<input type="radio" name="pMethod" value="Master">MasterCard
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5">信用卡號碼</label></td>
								<td colspan="2"><div class="controls">

										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											pattern="" title="" required="" placeholder="信用卡號碼"
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)"> <span
											id="errcardno" class="error-msg"></span>

									</div></td>
							</tr>



							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">到期日</label></td>
								<td><select class="input-block-level soflow select-style"
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
								<td><select class="input-block-level soflow select-style"
									id="year" name="epYear">
										<option>月</option>
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
								<td><span id="errmonth" class="error-msg"></span></td>
								<td><span id="erryear" class="error-msg"></span></td>
							</tr>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">持卡人名稱</label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" name="cardHolder" type="text"
											class="input-block-level" pattern="" title="" required=""
											placeholder="持卡人名稱" onblur="replaceAlpha(this);"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5">驗證碼</label></td>
								<td><div class="controls">
										<input id="seccode" name="securityCode" type="password"
											class="input-block-level" autocomplete="off" maxlength="3"
											pattern="" title="" required="" placeholder="CVV"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">

									</div></td>
								<td><img src="resources/images/cards.png" alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="errcode" class="error-msg"></span></td>
								<td></td>
							</tr>



							<tr class="control-group">
								<td></td>
								<td colspan="2"><a class="sub-link" href="#">這是什麼？</a></td>
							</tr>






						</tbody>

					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> 本人現授權富衛保險有限公司從我上述指定的信用卡賬戶扣除此保險所應繳之保費。 </label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!--   <div class="checkbox">
              <input id="checkbox2" type="checkbox">
              <label for="checkbox2"> 本人(等) 已參閱及明白保障範圍，並同意接受其約束。</a> </label>
                 <div class="clearfix"></div>
            </div>
            <span id="errchk2" class="error-msg"></span> -->
						<div class="clearfix"></div>
						<div class="hidden-sm hidden-xs pad-none">
							<input type="button" class="bdr-curve btn btn-primary bck-btn"
								value="返回">
							<!--<a href="homecare-plan-details-cn.html" class="bdr-curve btn btn-primary bck-btn">返回 </a>-->
							<!--<a href="homecare-confirmation-cn.html" class="bdr-curve btn btn-primary nxt-btn margin-left" onclick="return payValid();"> 確認付款</a>-->
							<input type="submit"
								class="bdr-curve btn btn-primary nxt-btn margin-left"
								value="確認付款">

						</div>
						<br> <br>
						<div class="pad-none hidden-md hidden-lg">

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pad-none">
								<a href="travel-plan-details-cn.html"
									class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">返回
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<input type="submit"
									class="bdr-curve btn btn-primary nxt-btn margin-left col-xs-6 col-sm-6 text-center"
									value="Pay Now">
							</div>



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
</section>

<!--/end- Main Content-->

<script>
	function confirmPayment(form) {
		if (cpayValid()) {
			var geteWayUrl = $('#gateway').val();
			$.ajax({
				type : "POST",
				url : "processHomeCarePayment",
				data : $("#homeCarepaymentForm").serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						//  form.action = "https://test.paydollar.com/b2cDemo/eng/payment/payForm.jsp";
						form.action = geteWayUrl;
						;
					}
				}
			});
		}

	}
</script>