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
<title>Find affordable home insurance | FWD Hong Kong</title>
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
										<h2>Get your Easy HomeCare insurance now</h2>
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
												id="inlineDeskRadio1<%=quetionList.getQid()%>"
												data-id="btm" class="plan"
												value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
												type="radio"> <label
												for="inlineDeskRadio1<%=quetionList.getQid()%>"> <span><%=quetionList.getAnswer1()%></span>
											</label>
											</label> <label class="radio radio-warning radio-inline"> <input
												name="home_situated<%=quetionList.getQid()%>"
												id="inlineDeskRadio2<%=quetionList.getQid()%>"
												data-id="btm" class="plan"
												value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
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
										<div class="col-lg-4 col-md-4">
											<button type="submit"
												class="bdr-curve btn btn-primary nxt-btn"
												onclick="return msgAlertDesk()">Get Quote</button>
										</div>
										<div class="clearfix"></div>
										<p class="pad-none">
											FWD Easy HomeCare*<br>
											<br> *applicable to any home below gross area of 1,000 sq. ft.
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
						class="plan" value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
						type="radio"> <label
						for="inlineDeskRadio1<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer1()%>
						</span>
					</label>
					</label> <label class="radio radio-warning radio-inline"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2<%=quetionList.getQid()%>" data-id="btm"
						class="plan" value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
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
				<h2 class="hidden-sm hidden-xs">Protect your home for around
					HK$1 a day, against loss or damage from fire, flood, bursting
					pipes, typhoon, theft, and accidents.</h2>
				<!--end desktop-->

				<!--Mobile-->
				<h2 class="hidden-lg hidden-md feature-ttl">Protect your home
					for around HK$1 a day, against loss or damage from fire, flood,
					bursting pipes, typhoon, theft, and accidents.</h2>
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
								Protection for everything <br> that matters to you
							</h2>
							<p class="h4-3">You'll receive extensive 'All Risks' cover:
								up to HK$500,000 on Household Contents as well as up to
								HK$100,000 for personal items, with a maximum of $10,000 per
								item. So with us, from your furniture to your freezer food you
								are protected.</p>
							<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								Protection that goes <br> beyond just replacements

							</h2>
							<p class="h4-3">In an event where your home becomes
								uninhabitable as a result of accidental loss or damage, we will
								help you with the costs of alternative accommodation of up to
								HK$1,000 per day / HK$50,000 per year so things can get back on
								track.</p>
							<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
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
								Protection that covers your <br> home, you and your family

							</h2>
							<p class="h4-3">
								Easy HomeCare's personal liability coverage provides protection
								for you and your family. If someone sustains a accidential
								bodily injury or accidental property damage and you, or your
								family members, are responsible, we’ll pay up to HK$5 million on
								legal expenses*...anywhere in the world! <br>
								<br> <small>*provided that the legal proceedings is
									submitted to the Hong Kong court.</small>
							</p>
							<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
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
							Protection for everything <br> that matters to you
						</h2>
						<p class="h4-3">You’ll receive extensive 'All Risks' cover: up
							to HK$500,000 on Household Contents as well as up to HK$100,000
							for personal items, with a maximum of $10,000 per item. So with
							us, from your furniture to your freezer food you are protected.</p>
						<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
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
							Protection that goes <br> beyond just replacements
						</h2>
						<p class="h4-3">In an event where your home becomes
							uninhabitable as a result of accidental loss or damage, we will
							help you with the costs of alternative accommodation of up to
							HK$1,000 per day / HK$50,000 per year so things can get back on
							track.</p>
						<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
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
							Protection that covers your <br> home, you and your family
						</h2>
						<p class="h4-3">
							Easy HomeCare's personal liability coverage provides protection
							for you and your family. If someone sustains a accidential bodily
							injury or accidental property damage and you, or your family
							members, are responsible, we’ll pay up to HK$5 million on legal
							expenses*...anywhere in the world! <br>
							<small>*provided that the legal proceedings is submitted
								to the Hong Kong court.</small>

						</p>
						<a href="" class="h4-4 scrollToTop">Get a quote to learn more</a>
					</div>
				</div>
				<div class="text-red"><c:out value="${errMsgs}" /></div>
			</div>
			<div class="other-benefits col-lg-12">


				<div class="spacer1"></div>


				<p class="h4-6">
					The features above are indicative only. Please refer to the <a
						href="policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
						target="_blank" class="sub-link"> Policy Provisions </a> for
					details.<br> For a complete explanation of the terms and
					conditions, feel free to contact an adviser or our 24-hour hotline
					at 3123 3123 for more details.


				</p>
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
								Here When<br> You Need Us
							</h1>
							<p>
								Our 24x7 call centre support, 5 drop-in locations across Hong
								Kong and our <a
									href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
									target="_blank">app</a> ensures you get the support you need,
								when you need it.
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap-mid wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/secure.png" alt="" />
							<h1>Secure &amp; Stable</h1>
							<p>
								We have been assigned strong financial strength ratings by
								international rating agencies -- we have been rated "A3" by
								Moody's and "A" by Fitch. <br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/rewards.png" alt="" />
							<h1>
								Rewards &amp;<br> Benefits
							</h1>
							<p>We continue to find you great rewards and benefits that
								let you get more from your insurance -- discounts on future
								insurance, special offers from partners and more.</p>

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
										Here When<br> You Need Us
									</h1>
									<p>
										Our 24x7 call centre support, 5 drop-in locations across Hong
										Kong and our <a
											href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
											target="_blank">app</a> ensures you get the support you need,
										when you need it.
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
										Secure &amp; <br> Stable
									</h1>
									<p>
										We have been assigned strong financial strength ratings by
										international rating agencies -- we have been rated "A3" by
										Moody's and "A" by Fitch. <br>
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
										Rewards &amp;<br> Benefits
									</h1>
									<p>We continue to find you great rewards and benefits that
										let you get more from your insurance -- discounts on future
										insurance, special offers from partners and more.</p>

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
					<h2>Customer testimonials</h2>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-left">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none">I immediately switched my home insurance
								to FWD Easy HomeCare plan when I realized that it was probably
								the best plan in town yet the cheapest I can find so far. The
								process was quick and easy; it only took me a few minutes to
								complete the process.</p>
							<br>
							<div class="hr1"></div>
							<h2>Michelle</h2>
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
							<p class="pad-none">FWD HomeCare is my first insurance with
								FWD. At first, I just planned to find a simple product with
								personal liability coverage but I found a comprehensive product
								from FWD with “All Risks” coverage online, that could even
								protect my valuables at home! I would recommend this Home
								Insurance plan to anyone!</p>
							<div class="hr1"></div>
							<h2>Adrian</h2>
							<h4>(One very happy customer)</h4>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<br>
				<P class="pad-none p1">
					<br> The opinion and view expressed here are entirely the
					writer's own and do not represent the views of FWD Life Insurance
					Company (Bermuda) Limited or its affiliates (“FWD”). FWD does not
					take any responsibility for that opinion and view, nor endorse
					their accuracy or completeness.

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
				<h2>Customer Testimonials</h2>
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
									<p>I immediately switched my home insurance to FWD Easy
										HomeCare plan when I realized that it was probably the best
										plan in town yet the cheapest I can find so far. The process
										was quick and easy; it only took me a few minutes to complete
										the process.</p>
									<div class="hr1"></div>
									<h2>Michelle</h2>
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
									<p>FWD HomeCare is my first insurance with FWD. At first, I
										just planned to find a simple product with personal liability
										coverage but I found a comprehensive product from FWD with
										“All Risks” coverage online, that could even protect my
										valuables at home! I would recommend this Home Insurance plan
										to anyone!</p>
									<div class="hr1"></div>
									<h2>Adrian</h2>
									<h4>(One very happy customer)</h4>
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
				<h2>Read more from our blog</h2>
			</div>
			<div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx1">
						<div>
							<img class="img-responsive bdr-img"
								src="resources/images/home8.png" alt="">
							<h3>
								<a href="http://blog.fwd.com.hk/" target="_blank">
									Protecting your family <br /> heirlooms <i
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
								<a href="http://blog.fwd.com.hk/" target="_blank"> Top tips
									to make a small flat stylish <i class="fa fa-caret-right"></i>
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
									Preventing household <br /> accidents <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<p>The information provided in the blogs is for reference only.
				While FWD Life Insurance Company (Bermuda) Limited and its
				affiliates (“FWD”) use reasonable efforts to ensure the information
				is accurate, FWD makes no warranties or representations as to the
				accuracy or completeness of any of the information and assumes no
				liability for any errors or omissions thereof. FWD shall not be
				liable for any direct, incidental, consequential, indirect or
				punitive damages arising out of access to, use of or inability to
				use the information, or any errors or omissions in the content of
				this material. Users should carefully evaluate the information.</p>


			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#services-->

	<!--bottom-form-->
	<section id="bottom-form" class="hidden-sm hidden-xs">
		<div class="container">
			<div class="row">
				<form:form name="getHomeQuoteBottom" id="getHomeQuoteBottom"
					action="getHomePlan" method="post" modelAttribute="homeCarelPlan">
					<div class="col-lg-12 col-md-12 hidden-xs pad-none homecare">
						<h2>Get your Easy HomeCare insurance now</h2>
						<%
							List blst = (List) request
										.getAttribute("homeCareQuetionariesList");

								Iterator bitr = blst.iterator();
								int i = 1;
								while (bitr.hasNext()) {

									HomeCareQuetionaries bQuetionList = (HomeCareQuetionaries) bitr
											.next();
						%>

						<div class="col-lg-4 col-md-4 pad-none">
							<h4>
								<%=bQuetionList.getQuetion()%>
							</h4>
							<label class="radio radio-warning radio-inline"> <input
								type="hidden" id="lblCount" value="<%=blst.size()%>"></input> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio5<%=bQuetionList.getQid()%>" data-id="btm"
								class="plan" value="personal" <%=bQuetionList.getAnswer1Checked()%> type="radio">
								<label for="inlineDeskRadio5<%=bQuetionList.getQid()%>">
									<span> <%=bQuetionList.getAnswer1()%>
								</span>
							</label>
							</label> <label class="radio radio-warning radio-inline"> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio6<%=bQuetionList.getQid()%>" data-id="btm"
								class="plan" value="personal" <%=bQuetionList.getAnswer2Checked()%> type="radio"> <label
								for="inlineDeskRadio6<%=bQuetionList.getQid()%>"> <span>
										<%=bQuetionList.getAnswer2()%>
								</span>
							</label>
							</label>
						</div>
						<%
							}
								i++;
						%>
						<div class="col-lg-4 col-md-2 ">
							<button type="submit"
								class="border-radius btn btn-primary  get-btn get-btn-home"
								onclick="return msgAlertDesk()">Get Quote</button>
						</div>
						<div class="clearfix"></div>
						<p class="pad-none">
							FWD Easy HomeCare*<br>
							<br> *applicable to any home below gross area of 1,000 sq.
							ft.
						</p>
					</div>
				</form:form>
			</div>
		</div>
	</section>

	<!--/mob-#bottom-->

</body>
</html>