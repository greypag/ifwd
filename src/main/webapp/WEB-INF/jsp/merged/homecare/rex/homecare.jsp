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
										<h2> ##home.main.quote.top.heading@@ </h2>
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
												onclick="return msgAlertDesk()"> ##home.main.quote.top.action@@ </button>
										</div>
										<div class="clearfix"></div>
										<p class="pad-none">
											##home.main.quote.subheading@@ <br>
											<br> ##home.main.quote.terms@@
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
				<h2 class="center"> ##home.main.quote.bottom.heading@@ </h2>
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
							onclick="return msgAlertDesk()"> ##home.main.quote.bottom.action@@ </button>
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
				<h2 class="hidden-sm hidden-xs"> ##home.main.desc@@ </h2>
				<!--end desktop-->

				<!--Mobile-->
				<h2 class="hidden-lg hidden-md feature-ttl"> ##home.main.desc@@ </h2>
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
								##home.main.feature1.heading.part1@@ <br> ##home.main.feature1.heading.part2@@
							</h2>
							<p class="h4-3"> ##home.main.feature1.paragraph@@ </p>
							<a href="" class="h4-4 scrollToTop"> ##home.main.feature.getquote@@ </a>
						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								##home.main.feature2.heading.part1@@ <br> ##home.main.feature2.heading.part2@@

							</h2>
							<p class="h4-3"> ##home.main.feature2.paragraph@@ </p>
							<a href="" class="h4-4 scrollToTop"> ##home.main.feature.getquote@@ </a>
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
								##home.main.feature3.heading.part1@@ <br> ##home.main.feature3.heading.part2@@

							</h2>
							<p class="h4-3">
								##home.main.feature3.paragraph.part1@@ <br>
								<br> <small> ##home.main.feature3.paragraph.part2@@ </small>
							</p>
							<a href="" class="h4-4 scrollToTop"> ##home.main.feature.getquote@@ </a>
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
							##home.main.feature1.heading.part1@@ <br> ##home.main.feature1.heading.part2@@
						</h2>
						<p class="h4-3"> ##home.main.feature1.paragraph@@ </p>
						<a href="" class="h4-4 scrollToTop"> ##home.main.feature.getquote@@ </a>
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
							##home.main.feature2.heading.part1@@ <br> ##home.main.feature2.heading.part2@@
						</h2>
						<p class="h4-3">##home.main.feature2.paragraph@@</p>
						<a href="" class="h4-4 scrollToTop">##home.main.feature.getquote@@</a>
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
							##home.main.feature3.heading.part1@@ <br> ##home.main.feature3.heading.part2@@
						</h2>
						<p class="h4-3">
							##home.main.feature3.paragraph.part1@@ <br>
							<small> ##home.main.feature3.paragraph.part2@@ </small>

						</p>
						<a href="" class="h4-4 scrollToTop">##home.main.feature.getquote@@</a>
					</div>
				</div>
				<div class="text-red"><c:out value="${errMsgs}" /></div>
			</div>
			<div class="other-benefits col-lg-12">


				<div class="spacer1"></div>


				<p class="h4-6">
					##home.main.other.disclaimer.part1@@ <a
						href="policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
						target="_blank" class="sub-link"> ##home.main.other.disclaimer.part2@@ </a> ##home.main.other.disclaimer.part3@@ <br> ##home.main.other.disclaimer.part4@@ 


				</p>
				<!-- <p class="h4-6">
				##home.main.other.disclaimer.part1@@ <a
						href="policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
						target="_blank" class="sub-link"> ##home.main.other.disclaimer.part2@@ </a> f##home.main.other.disclaimer.part3@@ 
##home.main.other.disclaimer.part4@@ 

				
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
								##home.main.highlight1.heading.line1@@ <br> ##home.main.highlight1.heading.line2@@
							</h1>
							<p>
								##home.main.highlight1.desc.part1@@ <a
									href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
									target="_blank">##home.main.highlight1.desc.part2@@</a> ##home.main.highlight1.desc.part3@@
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap-mid wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/secure.png" alt="" />
							<h1> ##home.main.highlight2.heading.line1@@ &amp; ##home.main.highlight2.heading.line2@@ </h1>
							<p>
								##home.main.highlight2.desc@@ <br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="resources/images/rewards.png" alt="" />
							<h1>
								##home.main.highlight3.heading.line1@@ &amp;<br> ##home.main.highlight3.heading.line2@@
							</h1>
							<p> ##home.main.highlight3.desc@@ </p>

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
										##home.main.highlight1.heading.line1@@ <br> ##home.main.highlight1.heading.line2@@
									</h1>
									<p>
										##home.main.highlight1.desc.part1@@ <a
											href=" http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html"
											target="_blank">##home.main.highlight1.desc.part2@@</a> ##home.main.highlight1.desc.part3@@ 
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
										##home.main.highlight2.heading.line1@@ &amp; <br> ##home.main.highlight2.heading.line2@@ 
									</h1>
									<p>
										##home.main.highlight2.desc@@ <br>
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
										##home.main.highlight3.heading.line1@@ &amp;<br> ##home.main.highlight3.heading.line2@@
									</h1>
									<p> ##home.main.highlight3.desc@@ </p>

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
					<h2> ##home.main.testimonial.heading@@ </h2>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-left">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none">##home.main.testimonial.customer1@@</p>
							<br>
							<div class="hr1"></div>
							<h2>##home.main.testimonial.customer1.name@@</h2>
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
							<p class="pad-none">##home.main.testimonial.customer2@@</p>
							<div class="hr1"></div>
							<h2>##home.main.testimonial.customer2.name1@@</h2>
							<h4>##home.main.testimonial.customer2.name2@@</h4>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<br>
				<P class="pad-none p1">
					<br> ##home.main.testimonial.disclaimer@@

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
				<h2>##home.main.testimonial.heading@@</h2>
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
									<p>##home.main.testimonial.customer1@@</p>
									<div class="hr1"></div>
									<h2>##home.main.testimonial.customer1.name@@</h2>
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
									<p>##home.main.testimonial.customer2@@</p>
									<div class="hr1"></div>
									<h2>##home.main.testimonial.customer2.name1@@</h2>
									<h4>##home.main.testimonial.customer2.name2@@</h4>
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
				<h2>##home.main.blog.heading@@</h2>
			</div>
			<div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx1">
						<div>
							<img class="img-responsive bdr-img"
								src="resources/images/home8.png" alt="">
							<h3>
								<a href="http://blog.fwd.com.hk/" target="_blank">
									##home.main.blog.subheading1.part1@@ <br /> ##home.main.blog.subheading1.part2@@ <i
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
								<a href="http://blog.fwd.com.hk/" target="_blank"> ##home.main.blog.subheading2@@ <i class="fa fa-caret-right"></i>
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
									##home.main.blog.subheading3.part1@@ <br /> ##home.main.blog.subheading3.part2@@ <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<p>##home.main.blog.disclaimer@@</p>


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
						<h2>##home.main.quote.top.heading@@</h2>
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
								onclick="return msgAlertDesk()">##home.main.quote.top.action@@</button>
						</div>
						<div class="clearfix"></div>
						<p class="pad-none">
							##home.main.quote.subheading@@ <br>
							<br> ##home.main.quote.terms@@
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