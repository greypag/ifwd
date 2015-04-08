<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<title>FWD</title>
<meta name="description"
	content="Get affordable home insurance with protection for emergencies and accidents â24/7 support â 'A' rated secure & stable financial strength â Rewards & benefits" />

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>-->

<!--Google Code for SEO-->

<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTMK7TX8B"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTMK7TX8B');
</script>

<!--END -Google Code for SEO-->

<!--VWO-->
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 95373, settings_tolerance = 2000, library_tolerance = 2500, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<script>
	function applyPromoCode() {
		$.ajax({
			type : 'POST',
			url : 'applyHomePromoCode',
			data : $('#frmHomeCarePlan input').serialize(),
			success : function(data) {
				document.getElementById("errPromoCode").innerHTML = data;
				var json = JSON.parse(data);
				//  alert(json);
				// setValue(json);
			}

		});
	}
	function BackMe() {
		window.history.back();
	}
</script>
</head>
<body>
	<!-- Google Tag Manager -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
	</script>
	<!-- End Google Tag Manager-->
	<!--Desktop-header-->



	<!--/#main-Content-->
	<section>
		<div id="cn" class="container">
			<div class="row">

				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">家居保險 </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 您的選擇</li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>您的選擇</h2>
						</div>
						<br> <br>
						<div class="col-lg-12 col-md-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c1"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle act">
										<span class="status">您的選擇</span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle disabled">
										<span class="status"> 個人資料</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled">
										<span class="status">總結及付款</span>
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
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">Choose a plan</h2>

						<div class="col-lg-12 col-md-12 home-plan-box3">
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 pad-none">
								<h2>${planQuote.getPlanCode() }<br>保
								</h2>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
									<br>
									<div class="h4">
										HK$ <br>
										<div class="flightcare-hk">
											${planQuote.getGrossPremium()}</div>
									</div>
								</div>
								<!-- Plan benefits -->
								<div class="fwdpanel">
									<div class="fwdpanel-heading">
										<h4 class="uline benefits">
											<span><a href="#"
												class="fwdpanel-minimize uline color-wht"><i
													class="fa fa-plus"></i> 承保範圍 </a> </span>
										</h4>
									</div>

									<div class="fwdpanel-body" style="display: none;">
										<p class="color-wht">
											<i class="fa fa-plus"></i>住院或檢疫現金津貼 $10,000<br> <i
												class="fa fa-plus"></i> 全球緊急支援服務 <br> <i
												class="fa fa-plus"></i> 租車自負額 $5,000 <br> <i
												class="fa fa-plus"></i> 高爾夫球“一桿入洞” $3,000 <br> <i
												class="fa fa-plus"></i> 更多詳情 <br>
										</p>

									</div>

									<div class="clearfix"></div>

								</div>
								<!-- / Plan benefits -->
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<br>
								<h3>港幣</h3>
								<h6>360元正</h6>
							</div>
							<div class="clearfix"></div>



						</div>
						<!--Full coverage -->
						<div class="fwdpanel  hidden-sm hidden-xs">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> 更多保障詳情 </a> </span>
								</h4>
							</div>
							<div class="fwdpanel-body" style="display: none;">
								<div class="row">
									<div class="col-md-12">

										<!--  Product Highlights  -->

										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 產品特點 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>享有高達港幣500,000 的家居物品保障</p>
												<br>
												<p>提供高達港幣5,000,000 作為業主、住戶及個人的個人法律責任及個人全球法律責任保障</p>
												<br>
												<p>保障居所內的家居財物、傢俬及電器等因火災、水浸、水渠爆裂、颱風、盜竊或意外而導致之損毀</p>
												<br>
												<p>適用於實用面積為1,000平方呎以內之家居</p>
												<br>
											</div>
										</div>
										<!-- /  Product Highlights -->

										<!--  Summary of Coverage  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i>保障範圍 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<h4 class="h4-2">
													<strong> 第一部份：家居物品全險</strong>
												</h4>
												<p>易安心家居保為你的家居財物提供
													'全面保障'，範圍包括因火災、水浸、颱風、爆炸、盜竊或意外而導致之損壞。賠償總額每年最高可達港幣500,000，每件財物最高賠償額為港幣100,000。貴重物件如珠寶首飾、金、銀、手錶、攝影器材、皮草或樂器（鋼琴除外）等，每件最高賠償額為港幣10,000，而每年最高賠償總額為港幣100,000。</p>
												<br>
												<p>除以上保障外，本計劃更為你提供以下多項額外保障：</p>


												<br>
												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td><strong>項目</strong></td>
															<td><strong>保障範圍</strong></td>
															<td><strong>最高賠償金額(港幣)</strong></td>
														</tr>
														<tr>
															<td>1</td>
															<td><strong>窗戶、門鎖及門匙更換費用<br />
																	因爆竊或企圖爆竊而引致損毀需更換之大門門鎖、門匙或窗戶
															</strong></td>
															<td>每年港幣$3,000</td>
														</tr>
														<tr>
															<td>2</td>
															<td><strong>短暫寄存保障<br />
																	家居物品需短暫寄存於其他地方進行翻新、維修或清潔時所受到的意外損毀
															</strong></td>
															<td>每年港幣$50,000</td>
														</tr>
														<tr>
															<td>3</td>
															<td><strong>搬遷保障<br /> 家居物品在下列情況下因意外而導致損毀:<br />
																	(a) 由專業搬運公司運往香港範圍內之新居; 或<br /> (b) 以七天為上限之短暫傢具儲存處; 或<br />
																	(c) 在尚未入住的新居內，以不超過兩個月為限。<br /> (必須事先通知本公司)
															</strong></td>
															<td>每年港幣$50,000</td>
														</tr>
														<tr>
															<td>4</td>
															<td><strong>冷藏食物保障<br />
																	冷藏食物因冰箱意外停電或故障而變壞並需重新購買之食物
															</strong></td>
															<td>每年港幣$5,000</td>
														</tr>
														<tr>
															<td>5</td>
															<td><strong>災場淸理費用<br /> 意外發生後，清理現場廢物之費用
															</strong></td>
															<td>每年港幣$10,000</td>
														</tr>
														<tr>
															<td>6</td>
															<td><strong>金錢保障<br /> 存放於家居的金錢遺失或被竊
															</strong></td>
															<td>每年港幣$2,500</td>
														</tr>
														<tr>
															<td rowspan="2">7</td>
															<td><strong>家傭財物保障</strong></td>
															<td>每件港幣$1,000</td>
														</tr>
														<tr>
															<td><strong>家庭僱傭於家中損失之個人物品</strong></td>
															<td>每年港幣$5,000</td>
														</tr>
														<tr>
															<td>8</td>
															<td><strong>加設之裝修保障t<br /> 住戶加設之室內裝修意外損毀
															</strong></td>
															<td>每件港幣$100,000</td>
														</tr>
														<tr>
															<td>9</td>
															<td><strong>室內裝修工程保障<br />
																	室內裝修工程期間引致家居財物意外損毀 (工程期以不超過兩個月為限)
															</strong></td>
															<td>每年港幣$100,000</td>
														</tr>
														<tr>
															<td rowspan="2">10</td>
															<td rowspan="2"><strong>臨時住所保障<br />
																	家居因意外損毀以致不宜居住，需另覓臨時住所之費用
															</strong></td>
															<td>每天港幣$1,000</td>
														</tr>
														<tr>
															<td>每年港幣$50,000</td>
														</tr>
														<tr>
															<td rowspan="2">11</td>
															<td rowspan="2"><strong>人身意外保障<br />
																	投保人或家庭成員於家中因火災或盜竊而引致死亡
															</strong></td>
															<td>每人港幣$50,000</td>
														</tr>
														<tr>
															<td>每年港幣$200,000</td>
														</tr>
													</tbody>
												</table>


												<h4 class="h4-2">
													<strong> 第二部份： 個人法律責任保險 </strong>
												</h4>
												<p>如你或同住的家庭成員在以下情況因疏忽而導致他人身體受傷或財物損失需負上法律責任及作出金錢賠償時，本計劃可提供高達港幣5,000,000之保障。惟訴訟必須由香港法庭處理:</p>
												<br>
												<p>
													a) 以住戶身份佔用家居<br> b) 以業主身份(包括所在大廈公共地方)<br> c)
													以個人身份(全球保障)<br> 法律責任更包括保障貴為租客的你對業主之樓宇結構固定裝置和建設的損毀。
												</p>
											</div>
										</div>
										<!-- / Summary of Coverage -->

										<!-- / Excess limit -->
										<!--   Premium table (HK$)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 保費表（港幣） </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<h4 class="h4-1">適用於實用面積為1,000平方呎以內之家居</h4>

												<table id="Premium1" class="table table-bordred">
													<tbody>
														<tr>
															<td><strong>項目</strong></td>
															<td><strong>保障範圍</strong></td>
															<td><strong>最高賠償金額(港幣)</strong></td>
															<td><strong>年費(港幣)</strong></td>
														</tr>
														<tr>
															<td>第一部份</td>
															<td>家居物品</td>
															<td>500,000</td>
															<td>360</td>
														</tr>
														<tr>
															<td>第二部份</td>
															<td>個人法律責任</td>
															<td>5,000,000</td>
															<td>隨第一部份免費附送</td>
														</tr>
													</tbody>
												</table>

											</div>
										</div>
										<!-- / Premium table (HK$) -->
										<!--   Major Exclusions  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 主要不受保項目</a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>
													以下為不保事項之概略，詳細內容請參閱保單。<br>
													一般不受保的損失如刮花、自然損耗、機械或電力等故障而導致失靈、錯誤使用或因家中飼養的動物引致等<br>
													眼鏡、隱形眼鏡、使用中的運動器材、電腦紀錄、手提電話的遺失或損壞、放置在天台上或戶外的物品、無線電接收或發放裝置或衛星天線<br>
													居所空置超逾60天期間發生之損失<br> 外遊超過90天所發生的個人責任<br>
													戰爭、恐怖活動、聲震及輻射
												</p>
											</div>
										</div>
										<!-- /  Major Exclusions -->


										<!--   Excess limit  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i>自負金額</a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<table id="excess" class="table table-bordred">
													<tbody>
														<tr>
															<td rowspan="2"><strong>第一部份： -<br />
																	家居財物全險
															</strong></td>
															<td colspan="2">因水浸導致的家居財物損失為每次事故賠償額之首港幣1,000</td>
														</tr>
														<tr>
															<td colspan="2">因其他原因導致的家居財物損失為每次事故賠償額之首港幣500</td>
														</tr>
														<tr>
															<td><strong>第二部份： -<br /> 個人法律責任保障
															</strong></td>
															<td colspan="2">第三者財物損失之自負金額為每次事故賠償額之首港幣500</td>
														</tr>
													</tbody>
												</table>



											</div>
										</div>



									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>


						</div>

						<h4 class="h4-4  hidden-sm hidden-xs">
							<a href="">下載小冊子</a>
						</h4>
						<!--Full coverage end -->
					</div>
					<div
						class="col-lg-5 col-md-5 col-sm-5 col-xs-5 gray-bg pad-none hidden-sm hidden-xs">
						<form:form name="frmTravelPlan" id="frmTravelPlan"
							action="getYourHomeCareDetails" method="post"
							modelAttribute="getYoursDetails">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">${planQuote.getPlanCode() }</h2>
									<h4>計劃慨覽</h4>
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											港幣
											<div class="flightcare-hk">${planQuote.getGrossPremium()}</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3>計劃類型</h3>
								<div class="form-group">
									<p class="h4-5 pad-none">基本保障，年度</p>
								</div>
								<h3>推廣編號</h3>
								<div class="form-group">
									<div class="input-group">
										<span class="text-red" id="errPromoCode"></span> <input
											type="text" id="promoCode" name="promoCode"
											class="form-control" placeholder="eg.FWD789"> <span
											class="input-group-addon in black-bold"> <input
											type="button" name="Apply" value="APPLY"
											onclick="applyPromoCode()">
										</span>
										<!--<input name="promoCode" id="promoCode" type="text" class="form-control placeholder-fl" placeholder="eg.FWD789">
                  <span class="input-group-addon in"><span class="apply">使用</span></span>-->
									</div>
								</div>

								<div class="travel-italic">
									<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i>如何取得推廣編號?</i></a>
								</div>
							</div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">小計</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planQuote.getTotalDue()}</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">折扣優惠</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">-${planQuote.getDiscountAmount()}</h3>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">所需保費</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planQuote.getTotalDue()}</h3>

							<input type="hidden" name="planCode" id="planCode"
								value="${planQuote.getPlanCode() }">
							<input type="hidden" name="grossPremium" id="grossPremium"
								value="${planQuote.getGrossPremium()}">
							<input type="hidden" name="discountAmount" id="discountAmount"
								value="${planQuote.getDiscountAmount()}">
							<input type="hidden" name="totalDue" id="totalDue"
								value="${planQuote.getTotalDue()}">

							<input type="hidden" name="referralCode" id="referralCode"
								value="${planQuote.getReferralCode()}">
							<input type="hidden" name="referralName" id="referralName"
								value="${planQuote.getReferralName()}">

							<input type="hidden" name="answer1" value="${answer1}">
							<input type="hidden" name="answer2" value="${answer2}">


							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<button onclick="BackMe();"
									class="bdr-curve btn btn-primary bck-btn">上一頁</button>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<button class="bdr-curve btn btn-primary nxt-btn"
									onclick="return pageValidate();">下一頁</button>
							</div>

							<div class="clearfix"></div>
							<br>
							<br>
						</form:form>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">以上資料只作參考用途。詳情請查看保單條款。
					有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>

			</div>
			<!--/.row-->
		</div>
		<!--/.container-->

	</section>

	<!--/end Main Content-->

	<!--mob-#bottom-->
	<!--Apply-->

	<div class="row hidden-lg hidden-md text-center">
		<br>
		<div class="col-sm-12 col-xs-12 gray-bg">
			<h3 class="col-sm-6 col-xs-6">推廣編號</h3>
			<h5 class="col-sm-6 col-xs-6 padding7">
				<a href="" class="sub-link" data-toggle="modal"
					data-target=".bs-promo-modal-lg"><i>如何取得推廣編號?</i></a>
			</h5>
			<div class="clearfix"></div>

			<div class="form-group col-sm-12 col-xs-12">
				<div class="input-group">
					<input name="" type="text" class="form-control placeholder-fl"
						placeholder="eg.FWD789"> <span
						class="input-group-addon in"><span class="apply">使用</span></span>
				</div>
			</div>
		</div>

	</div>

	<div class="row-fluid hidden-lg hidden-md text-center">
		<div class="btn-box">
			<h3 class="text-center">
				<a href="http://blog.fwd.com.hk" target="_blank">博客</a>
			</h3>
		</div>
		<!--
		<p class="text-center mob-bottom">&copy; 2015 FWD 富衛香港 版權所有 不得轉載</p>
		-->
	</div>
	<!--/mob-#bottom-->


	<!--Get promotion code popup-->
	<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
					<div class="form-container">
						<h2>不要有一个促销代码？输入您的电子邮件地址，我们会送你一个</h2>
						<h4>电子邮件 </h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">Submit</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
							</div>
						</div>
					</div>
				</form>
				</div>
				
				
			</div>
		</div>
	</div>
	<!--/ Get promotion code popup-->





</body>
</html>