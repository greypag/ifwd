<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareQuetionaries"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<title>找尋適合您的家居保險 | 富衛香港</title>
<meta name="description"
	content="Get affordable home insurance with protection for emergencies and accidents ✓24/7 support ✓ 'A' rated secure & stable financial strength ✓ Rewards & benefits" />
<!-- core CSS -->

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

</head>
<body class="chin">
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


	<!--   Main Content-->
	<section id="main-slider" class="no-margin">
		<!--Mobile--->
		<img src="resources/images/slider/home_en_m.jpg" alt=""
			class="img-responsive hidden-lg hidden-md" />
		<!--desktop-->
		<div class="carousel slide hidden-xs hidden-sm">
			<div class="carousel-inner">
				<div class="item active item-border">
					<div class="homecare homecare-hei">
						<div class="container pad-none">
							<div class="row">

								<form:form name="getHomeQuote" id="getHomeQuote"
									action="getHomePlan" method="post"
									modelAttribute="homeCarelPlan">


									<div class="col-lg-12 col-md-12 hidden-xs hidden-sm pad-none">
										<h2>立即取得易安心家居保</h2>

										<%
											List lst = (List) request
														.getAttribute("homeCareQuetionariesList");

												Iterator itr = lst.iterator();
												int i = 1;
												while (itr.hasNext()) {

													HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
															.next();
										%>

										<div class="col-lg-4 col-md-4">
											<h4>
												<%=quetionList.getQuetion()%>
											</h4>
											<input type="hidden" id="lblCount" value="<%=lst.size()%>"></input>
											<label class="radio radio-warning radio-inline"> <input
												name="home_situated<%=quetionList.getQid()%>"
												id="inlineDeskRadio1<%=quetionList.getQid()%>" data-id="btm"
												class="plan" value="<%=quetionList.getAnswer1()%>"
												checked="" type="radio"> <label
												for="inlineDeskRadio1<%=quetionList.getQid()%>"> <span><%=quetionList.getAnswer1()%></span>
											</label>
											</label> <label class="radio radio-warning radio-inline"> <input
												name="home_situated<%=quetionList.getQid()%>"
												id="inlineDeskRadio2<%=quetionList.getQid()%>" data-id="btm"
												class="plan" value="<%=quetionList.getAnswer2()%>"
												checked="" type="radio"> <label
												for="inlineDeskRadio2<%=quetionList.getQid()%>"> <span>
														<%=quetionList.getAnswer2()%></span>
											</label>
											</label>
										</div>
										<%
											}
												i++;
										%>
										<div class="col-lg-4 col-md-4">

											<button type="submit"
												class="bdr-curve btn btn-primary nxt-btn"
												onclick="return msgAlertDesk()">Get Quote</button>
											<!-- <a href="homecare-plan.html" class="border-radius btn btn-primary  get-btn get-btn-home" onclick="return msgAlertDesk()">Get Quote</a> -->
										</div>
										<div class="clearfix"></div>
										<p class="pad-none">
											FWD Easy HomeCare*<br> <br> *適用於實用面積一千尺以下單位
										</p>
									</div>
								</form:form>

							</div>
						</div>
					</div>
					<img src="resources/images/slider/home_en.jpg" alt="" />
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>

		<!--mobile-->
		<form:form name="getHomeQuote" id="getHomeQuote" action="getHomePlan"
			method="post" modelAttribute="homeCarelPlan">
			<div
				class="col-lg-12 col-md-12 hidden-lg  hidden-md pad-none homecare ">
				<h2 class="center">Get your Easy HomeCare insurance now</h2>
				<%
					List lst = (List) request
								.getAttribute("homeCareQuetionariesList");

						Iterator itr = lst.iterator();
						int i = 1;
						while (itr.hasNext()) {

							HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
									.next();
				%>

				<div class="col-lg-3 col-md-3  col-xs-offset-1 ">
					<h4>
						<%=quetionList.getQuetion()%>
					</h4>
					<input type="hidden" name="questionCount" id="lblCount"
						value="<%=lst.size()%>"></input> <label
						class="radio radio-warning radio-inline"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio1<%=quetionList.getQid()%>" data-id="btm"
						class="plan" value="<%=quetionList.getAnswer1()%>" checked=""
						type="radio"> <label
						for="inlineDeskRadio1<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer1()%>
						</span>
					</label>
					</label> <label class="radio radio-warning radio-inline"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2<%=quetionList.getQid()%>" data-id="btm"
						class="plan" value="<%=quetionList.getAnswer2()%>" checked=""
						type="radio"> <label
						for="inlineDeskRadio2<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer2()%></span>
					</label>
					</label>
				</div>
				<%
					}
						i++;
				%>

				<!--<div class=" col-sm-12  col-xs-12">
                <a href="homecare-plan.html" type="button" class="border-radius btn btn-primary  get-btn get-btn-home" onclick="return flightValidateBtmTravel()">Get Quote</a>
            </div>-->
				<div class="btn-box">
					<h3 class="text-center">
						<button type="submit" class="bdr-curve btn btn-primary nxt-btn"
							onclick="return msgAlertDesk()">Get Quote</button>
					</h3>
				</div>

			</div>
		</form:form>
		<!--/.carousel-->
	</section>
	<!--Mobile-form-->

	<!--Mobile-form-->

	<!--/#main-slider-->

	<section id="feature">
		<div class="container pad-none">
			<div class="center">
				<div class="spacer3"></div>
				<!--desktop-->
				<h2 class="hidden-sm hidden-xs">
				每天只需約港幣$1,<br>便可保障家居因火災、水浸、水渠爆裂、颱風、<br> 盜竊或意外導致的損失或毀壞。
					</h2>
				<!--end desktop-->

				<!--Mobile-->
				<h2 class="hidden-lg hidden-md feature-ttl">
				每天只需約港幣$1,<br> 便可保障家居因火災、水浸、水渠爆裂、颱風、<br> 盜竊或意外導致的損失或毀壞。
					</h2>
				<!--end Mobile-->
			</div>

			<!--desktop Features-->
			<div class="hidden-xs hidden-sm">
				<div class="col-lg-12 col-md-12 home-features pad-none">
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="resources/images/homecare1.png" alt="" />
					</div>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								保障您所珍愛的一切
							</h2>
							<p class="h4-3">您將受到全險綜合保障，涵蓋家居財物高達港幣$500,000，私人財物高達港幣$100,000，其中每件私人財物最高賠償額為港幣$10,000。購買易安心家居保，您的傢俬以至雪櫃裡的食物都一律受到保障。</p>
							<a href="" class="h4-4 scrollToTop">了解更多</a>
						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								保障，豈止重新添置家居物品

							</h2>
							<p class="h4-3">假如您的家居因意外損失或毀壞變得不宜居住，我們會為您支付另覓臨時居所的費用，每年高達港幣$50,000或每天高達港幣$1,000，助您的生活重拾正軌。</p>
							<a href="" class="h4-4 scrollToTop">了解更多</a>
						</div>
					</div>
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="resources/images/homecare2.png" alt="" />
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="resources/images/homecare3.png" alt="" />
					</div>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								保障您的家居，還有您和您的家人!

							</h2>
							<p class="h4-3">
								易安心家居保的個人法律責任保險為您和您的家人提供保障。一旦有人因您或您的家人受到意外的身體傷害或財物損失，不論發生在世界任何地方*，我們都會提供高達港幣$5,000,000之法律保障。</small>
							</p>
							<a href="" class="h4-4 scrollToTop">了解更多</a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<!--mobile-Features-->

				<!--/.row-->
			</div>

			<!--mob-Features-->
			<div class="row mob-features hidden-lg hidden-md">
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="resources/images/homecare1.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							保障您所珍愛的一切
						</h2>
						<p class="h4-3">您將受到全險綜合保障，涵蓋家居財物高達港幣$500,000，私人財物高達港幣$100,000，其中每件私人財物最高賠償額為港幣$10,000。購買易安心家居保，您的傢俬以至雪櫃裡的食物都一律受到保障。 </p>
						<a href="" class="h4-4 scrollToTop">了解更多</a>
					</div>
				</div>
				<div class="clearfix"></div>
				<br>
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="resources/images/homecare2.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							保障，豈止重新添置家居物品
						</h2>
						<p class="h4-3">假如您的家居因意外損失或毀壞變得不宜居住，我們會為您支付另覓臨時居所的費用，每年高達港幣$50,000或每天高達港幣$1,000，助您的生活重拾正軌。</p>
						<a href="" class="h4-4 scrollToTop">了解更多</a>
					</div>
				</div>
				<div class="clearfix"></div>
				<br>
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="resources/images/homecare3.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							保障您的家居，還有您和您的家人!
						</h2>
						<p class="h4-3">
							易安心家居保的個人法律責任保險為您和您的家人提供保障。一旦有人因您或您的家人受到意外的身體傷害或財物損失，不論發生在世界任何地方*，我們都會提供高達港幣$5,000,000之法律保障。</small>

						</p>
						<a href="" class="h4-4 scrollToTop">了解更多</a>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="other-benefits col-lg-12">


				<div class="spacer1"></div>


				<p class="h4-6">以上資料只作參考用途 。<a href="resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf" target="_blank" class="sub-link">詳情請查看保單條款</a>。<br>
    有關條款細則的詳細資料，請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>
				<!-- <p class="h4-6">
				The features above are indicative only. Please refer to the <a
						href="policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
						target="_blank" class="sub-link"> Policy Provisions </a> for details. 
For a complete explanation of the terms and conditions, feel free to contact an adviser or our 24-hour hotline at 3123 3123 for more details.
				
				</p>-->
			</div>
			<!--/.container-->
		</div>
	</section>

	<!--/#feature-->

	<section id="recent-works-homecare" class="hidden-xs hidden-sm">
		<div class="container">
			<div class="row hidden-sm hidden-xs">
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/time.png" alt="" />
							<h1>
								常在您左右
							</h1>
							<p>
							富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動<a
									href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
									target="_blank">應用程式</a>，隨時為您解答任何查詢。
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap-mid wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/secure.png" alt="" />
							<h1>安全，可靠</h1>
							<p>
								富衛香港的壽險及一般保險營運機構均獲國際評級機構授予卓越的財務實力評級 -- 其中獲「穆迪」 評為A3級 及「惠譽國際」評為A級。 <br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/rewards.png" alt="" />
							<h1>
								賞您所想
							</h1>
							<p>富衛不斷為您提供各種獎賞及優惠，令您的保險計劃更吸引，例如將來的保費折扣及其他商户提供的優惠等。</p>

						</div>
					</div>
				</div>
			</div>
			<!--End-Desktop-Support-->
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#recent-works-->

	<section id="recent-works-mob" class="hidden-lg hidden-md">
		<div class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div class="recent-work-wrap text-center">
								<div class="recent-work-inner">
									<img src="resources/images/time.png" alt="" />
									<h1>
										常在您左右
									</h1>
									<p>
										富衛提供全天候24小時熱線支援，另設有5間分佈全港的客戶服務中心，加上富衛流動<a
									href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
									target="_blank">應用程式</a>，隨時為您解答任何查詢。
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
				<div class="item">
					<div class="container">
						<div class="row slide-margin">
							<div class="recent-work-wrap-mid text-center">
								<div class="recent-work-inner">
									<img src="resources/images/secure.png" alt="" />
									<h1>
										安全，可靠
									</h1>
									<p>
										富衛香港的壽險及一般保險營運機構均獲國際評級機構授予卓越的財務實力評級 -- 其中獲「穆迪」 評為A3級 及「惠譽國際」評為A級。 <br>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
				<div class="item">
					<div class="container">
						<div class="row slide-margin">
							<div class="recent-work-wrap text-center">
								<div class="recent-work-inner">
									<img src="resources/images/rewards.png" alt="" />
									<h1>
										賞您所想
									</h1>
									<p>富衛不斷為您提供各種獎賞及優惠，令您的保險計劃更吸引，例如將來的保費折扣及其他商户提供的優惠等。</p>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
		<a class="prev" href="#recent-works-mob" data-slide="prev"> <i
			class="fa fa-chevron-left"></i>
		</a> <a class="next" href="#recent-works-mob" data-slide="next"> <i
			class="fa fa-chevron-right"></i>
		</a>
	</section>




	<!--/#testiomonials-->
	<section id="testimonials" class="hidden-sm hidden-xs">
		<div class="container pad-none">
			<!--desktop-testimonials-->
			<div class="hidden-sm hidden-xs">
				<div class="center">
					<h2>顧客親身體驗</h2>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-left">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none">富衛易安心家居保的保障全面，而且性價比也是全城數一數二，於是我便立即轉用。申請過程簡單快捷，只需數分鐘便完成所有手續。</p>
							<br>
							<div class="hr1"></div>
							<h2>葉小姐</h2>
							<h4></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-right">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none">富衛家居保係我首份於富衛買既保險。本來我想找一些最普遍的家居保險，例如法律責任，但後來於網上見到一份由富衛提供的「全險保障」產品，既全面又可以保障家裡的貴重物品！以後我都會將富衛家居保推薦俾身邊既人。</p>
							<div class="hr1"></div>
							<h2>梁先生</h2>
							<h4>(一位非常滿意的客戶)</h4>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<br>
				<P class="pad-none p1">
					<br> 以上意見及觀點純屬客戶意見，並不代表富衛人壽保險（百慕達）有限公司或其下公司（“富衛”）之意見。 富衛不需要承擔任何有關之責任及其準確性或完整性。

				</P>
			</div>
			<!--/.row-->
			<!--/.desktop-testimonials-->

		</div>
		<!--/.container-->
	</section>
	<!--/#testiomonials-->

	<!--/#testiomonials mob-->
	<section id="testimonials-mob" class="hidden-lg hidden-md">
		<div class="carousel slide">
			<div class="center">
				<h2>顧客親身體驗</h2>
			</div>
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div class="testimonials-wrap text-center">
								<div class="testimonials-inner text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>富衛易安心家居保的保障全面，而且性價比也是全城數一數二，於是我便立即轉用。申請過程簡單快捷，只需數分鐘便完成所有手續。</p>
									<div class="hr1"></div>
									<h2>葉小姐</h2>
									<h4></h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
				<div class="item">
					<div class="container">
						<div class="row slide-margin">
							<div class="testimonials-wrap text-center">
								<div class="testimonials-inner text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>富衛家居保係我首份於富衛買既保險。本來我想找一些最普遍的家居保險，例如法律責任，但後來於網上見到一份由富衛提供的「全險保障」產品，既全面又可以保障家裡的貴重物品！以後我都會將富衛家居保推薦俾身邊既人。</p>
									<div class="hr1"></div>
									<h2>梁先生</h2>
									<h4> (一位非常滿意的客戶)</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
		<a class="prev" href="#testimonials-mob" data-slide="prev"> <i
			class="fa fa-chevron-left"></i>
		</a> <a class="next" href="#testimonials-mob" data-slide="next"> <i
			class="fa fa-chevron-right"></i>
		</a>
	</section>
	<!--/#testiomonials mob-->

	<section class="blog-item hidden-sm hidden-xs">
		<div class="container pad-none">
			<div class="center">
				<h2>閱讀更多</h2>
			</div>
			<div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx1">
						<div>
							<img class="img-responsive bdr-img"
								src="resources/images/home8.png" alt="">
							<h3>
								<a href="http://blog.fwd.com.hk/" target="_blank">
									傳家之寶收藏法 <br /> heirlooms <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx2">
						<div>
							<img class="img-responsive bdr-img"
								src="resources/images/home9.png" alt="">
							<h3>
								<a href="http://blog.fwd.com.hk/" target="_blank"> 打造型格窩居 <i class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx3">
						<div>
							<img class="img-responsive bdr-img"
								src="resources/images/home10.png" alt="">
							<h3>
								<a href="http://blog.fwd.com.hk/" target="_blank">
									預防家居意外 <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<p>博客資料謹供參考，富衛人壽保險(百慕達)有限公司及其聯繫公司 (“富衛”)雖然已盡力確保所載的資料正確無誤，但富衛並不就資料的準確性或完整性作出任何保證或陳述。富衛將不會因無法或不能使用任何資料或任何此博客所載之資料的錯誤或遺漏而負上任何直接、附帶、後果性、間接或懲罰性的損失的責任，使用者應自行小心評估資料。</p>


			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#services-->

	<!--bottom-form-->
	<section id="bottom-form" class="hidden-sm hidden-xs">
		<div class="container">
			<div class="row">
				<form:form name="getHomeQuote" id="getHomeQuote"
									action="getHomePlan" method="post"
									modelAttribute="homeCarelPlan">


									<div class="col-lg-12 col-md-12 hidden-xs hidden-sm pad-none">
										<h2>立即取得易安心家居保</h2>

										<%
											List lst = (List) request
														.getAttribute("homeCareQuetionariesList");

												Iterator itr = lst.iterator();
												int i = 1;
												while (itr.hasNext()) {

													HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
															.next();
										%>

										<div class="col-lg-4 col-md-4">
											<h4>
												<%=quetionList.getQuetion()%>
											</h4>
											<input type="hidden" id="lblCount" value="<%=lst.size()%>"></input>
											<label class="radio radio-warning radio-inline"> <input
												name="home_situated<%=quetionList.getQid()%>"
												id="inlineDeskRadio1<%=quetionList.getQid()%>" data-id="btm"
												class="plan" value="<%=quetionList.getAnswer1()%>"
												checked="" type="radio"> <label
												for="inlineDeskRadio1<%=quetionList.getQid()%>"> <span><%=quetionList.getAnswer1()%></span>
											</label>
											</label> <label class="radio radio-warning radio-inline"> <input
												name="home_situated<%=quetionList.getQid()%>"
												id="inlineDeskRadio2<%=quetionList.getQid()%>" data-id="btm"
												class="plan" value="<%=quetionList.getAnswer2()%>"
												checked="" type="radio"> <label
												for="inlineDeskRadio2<%=quetionList.getQid()%>"> <span>
														<%=quetionList.getAnswer2()%></span>
											</label>
											</label>
										</div>
										<%
											}
												i++;
										%>
										<div class="col-lg-4 col-md-4">

											<button type="submit"
												class="bdr-curve btn btn-primary nxt-btn"
												onclick="return msgAlertDesk()">Get Quote</button>
											<!-- <a href="homecare-plan.html" class="border-radius btn btn-primary  get-btn get-btn-home" onclick="return msgAlertDesk()">Get Quote</a> -->
										</div>
										<div class="clearfix"></div>
										<p class="pad-none">
											FWD Easy HomeCare*<br> <br> *適用於實用面積一千尺以下單位
										</p>
									</div>
								</form:form>
			</div>
		</div>
	</section>

	<!--/mob-#bottom-->

</body>
</html>