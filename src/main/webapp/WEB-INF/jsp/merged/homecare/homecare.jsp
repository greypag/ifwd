<%
//  session = request.getSession();
//  String uatAuth = (String) session.getAttribute("uatAuth");
//  System.out.println("uatAuth " + uatAuth);
//  if (uatAuth == null)
//      response.sendRedirect(request.getContextPath() + "/uatAuth");
    
//  if (!uatAuth.equals("ifwdUser"))
//      response.sendRedirect(request.getContextPath() + "/uatAuth");
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareQuetionaries"%>
<%@page import="java.util.*"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<c:set var="context" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="messages" var="msg" />
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
<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $("header .top-bar").addClass("fixed-header");
    $(".navbar-inverse").addClass("product-header");
});
</script>
<!-- End fixed header -->
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
		<img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.image.mobile" bundle="${msg}" />" alt=""
			class="img-responsive hidden-lg hidden-md" />
		<!--desktop-->
		<div class="carousel slide hidden-xs hidden-sm">
			<div class="carousel-inner">
				<div class="item active item-border">
					
					<img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.image" bundle="${msg}" />" alt="" />
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<div class="homecare hidden-xs hidden-sm" id="homecare-scroll">
                        <div class="container">
                            <div class="row">

                                <form:form name="getHomeQuote" id="getHomeQuote" action="${pageContext.request.contextPath}/${language}/home-insurance/quote" method="post" modelAttribute="homeCarelPlan">
                                    <div class="hidden-xs hidden-sm slide-form">
                                        <!-- <h2 class="col-xs-12"><fmt:message key="home.main.quote.top.heading" bundle="${msg}" /></h2> -->
                                        <%
                                            List lst = (List) request
                                                        .getAttribute("homeCareQuetionariesList");

                                                Iterator itr = lst.iterator();
                                                int i = 1;
                                                while (itr.hasNext()) {

                                                    HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
                                                            .next();
                                        %>

                                        <div class="col-md-4">
                                            <h4>
                                                <%=quetionList.getQuetion()%>
                                            </h4>
                                            <input type="hidden" id="lblCount" value="<%=lst.size()%>"></input>
                                            <label class="radio radio-warning radio-inline radio-homecare"> <input
                                                name="home_situated<%=quetionList.getQid()%>"
                                                id="inlineDeskRadio1a<%=quetionList.getQid()%>"
                                                data-id="home"
                                                value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
                                                type="radio"> <label
                                                for="inlineDeskRadio1a<%=quetionList.getQid()%>"> <span><%=quetionList.getAnswer1()%></span>
                                            </label>
                                            </label> <label class="radio radio-warning radio-inline radio-homecare"> <input
                                                name="home_situated<%=quetionList.getQid()%>"
                                                id="inlineDeskRadio1b<%=quetionList.getQid()%>"
                                                data-id="home"
                                                value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
                                                type="radio"> <label
                                                for="inlineDeskRadio1b<%=quetionList.getQid()%>"> <span>
                                                        <%=quetionList.getAnswer2()%></span>
                                            </label>
                                            </label>
                                        </div>
                                        <%
                                            }
                                                i++;
                                        %>
                                        <div class="col-md-4">
                                            <button type="submit"
                                                class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare"
                                                onclick="return msgAlertDesk('getHomeQuote')"><fmt:message key="home.main.quote.top.action" bundle="${msg}" /></button>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p class="col-xs-12 mute">
                                            <!--<fmt:message key="home.main.quote.subheading" bundle="${msg}" /><br>
                                            <br>--> 
                                            <fmt:message key="home.main.quote.terms" bundle="${msg}" />
                                        </p>
                                        
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
	</section>
	
		
		<!--mobile-->
		<form:form name="getHomeQuote" id="getHomeQuoteMob" action="${pageContext.request.contextPath}/${language}/home-insurance/quote"
			method="post" modelAttribute="homeCarelPlan">
			<div
				class="col-lg-12 col-md-12 hidden-lg  hidden-md pad-none homecare ">
				<h2 class="center"><fmt:message key="home.main.quote.bottom.heading" bundle="${msg}" /></h2>
				<%
					List lst = (List) request
								.getAttribute("homeCareQuetionariesList");

						Iterator itr = lst.iterator();
						int i = 1;
						while (itr.hasNext()) {

							HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
									.next();
				%>

				<div class="col-lg-3 col-md-3 marg20 ">
					<h4>
						<%=quetionList.getQuetion()%>
					</h4>
					<input type="hidden" name="questionCount" id="lblCount"
						value="<%=lst.size()%>"></input> <label
						class="radio radio-warning radio-inline radio-homecare"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2a<%=quetionList.getQid()%>" data-id="home"
						value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
						type="radio"> <label
						for="inlineDeskRadio2a<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer1()%>
						</span>
					</label>
					</label> <label class="radio radio-warning radio-inline radio-homecare"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2b<%=quetionList.getQid()%>" data-id="home"
						value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
						type="radio"> <label
						for="inlineDeskRadio2b<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer2()%></span>
					</label>
					</label>
				</div>
				<%
					}
						i++;
				%>

				<div class="btn-box">
						<button type="submit" class="bdr-curve btn btn-primary nxt-btn"
							onclick="return msgAlertDesk('getHomeQuoteMob')"><fmt:message key="home.main.quote.bottom.action" bundle="${msg}" /></button>
				</div>

			</div>
		</form:form>
		<!--/.carousel-->
	<!--Mobile-form-->

	<!--Mobile-form-->

	<!--/#main-slider-->

	<section id="feature">
		<div class="container pad-none">
			<div class="center">
				<div class="spacer3"></div>
				<!--desktop-->
				<h2 class="col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="home.main.desc" bundle="${msg}" /></h2>
				<!--end desktop-->

				<!--Mobile-->
				<h2 class="hidden-lg hidden-md feature-ttl"><fmt:message key="home.main.desc" bundle="${msg}" /></h2>
				<!--end Mobile-->
			</div>

			<!--desktop Features-->
			<div class="hidden-xs hidden-sm">
				<div class="col-lg-12 col-md-12 home-features pad-none">
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="<%=request.getContextPath()%>/resources/images/homecare1.png" alt="" />
					</div>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								<fmt:message key="home.main.feature1.heading.part1" bundle="${msg}" /> <br> <fmt:message key="home.main.feature1.heading.part2" bundle="${msg}" />
							</h2>
							<p class="h4-3"><fmt:message key="home.main.feature1.paragraph" bundle="${msg}" /></p>
						    <a href="${pageContext.request.contextPath}/${language}/homecare/quote" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								<fmt:message key="home.main.feature2.heading.part1" bundle="${msg}" /> <br> <fmt:message key="home.main.feature2.heading.part2" bundle="${msg}" />

							</h2>
							<p class="h4-3"><fmt:message key="home.main.feature2.paragraph" bundle="${msg}" /></p>
							<a href="" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
						</div>
					</div>
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="<%=request.getContextPath()%>/resources/images/homecare2.png" alt="" />
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="col-md-6 col-lg-6 pad-none text-center">
						<img src="<%=request.getContextPath()%>/resources/images/homecare3.png" alt="" />
					</div>
					<div class="col-md-6 col-lg-6 pad-none">
						<div class="content">
							<h2>
								<fmt:message key="home.main.feature3.heading.part1" bundle="${msg}" />
								<fmt:message key="home.main.feature3.heading.part2" bundle="${msg}" />

							</h2>
							<p class="h4-3">
							
							
								<fmt:message key="home.main.feature3.paragraph.part1" bundle="${msg}" />
								<br> <small><fmt:message key="home.main.feature3.paragraph.part2" bundle="${msg}" />
								</small>
							</p>
							<a href="" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<!--mobile-Features-->

				<!--/.row-->
			</div>

			<!--mob-Features-->
			<div class="mob-features hidden-lg hidden-md">
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/homecare1.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							<fmt:message key="home.main.feature1.heading.part1" bundle="${msg}" /><br>
							<fmt:message key="home.main.feature1.heading.part2" bundle="${msg}" />
						

						</h2>
						<p class="h4-3"><fmt:message key="home.main.feature1.paragraph" bundle="${msg}" /><br>
							</p>
						<a href="" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
				<br>
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/homecare2.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							<fmt:message key="home.main.feature2.heading.part1" bundle="${msg}" /><br>
							<fmt:message key="home.main.feature2.heading.part2" bundle="${msg}" />
						</h2>
						<p class="h4-3"><fmt:message key="home.main.feature2.paragraph" bundle="${msg}" /></p>
						<a href="" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
					</div>
				</div>
				<div class="clearfix"></div>
				<br>
				<div class="col-xs-4 col-sm-4 text-center">
					<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/homecare3.png"
						alt="" />
				</div>
				<div class="col-xs-8 col-sm-8">
					<div>
						<h2 class="h2-3">
							<fmt:message key="home.main.feature3.heading.part1" bundle="${msg}" /><br>
							<fmt:message key="home.main.feature3.heading.part2" bundle="${msg}" />
						</h2>
						<p class="h4-3">
							<fmt:message key="home.main.feature3.paragraph.part1" bundle="${msg}" /><br>
							<small><fmt:message key="home.main.feature3.paragraph.part2" bundle="${msg}" /></small>

						</p>
						<a href="" class="h4-4 scrollToTop"><fmt:message key="home.main.feature.getquote" bundle="${msg}" /></a>
					</div>
				</div>
				<div class="text-red"><c:out value="${errMsgs}" /></div>
			</div>
			<div class="other-benefits col-lg-12">


				<div class="spacer1"></div>


				<p class="col-xs-12 h4-6">
				<fmt:message key="home.main.other.disclaimer.part1" bundle="${msg}" />
							
					<a href="<%=request.getContextPath()%>/<fmt:message key="home.provision.link" bundle="${msg}" />" target="_blank" class="sub-link"> 
					<fmt:message key="home.main.other.disclaimer.part2" bundle="${msg}" /></a> 
					<fmt:message key="home.main.other.disclaimer.part3" bundle="${msg}" /><br> 
					<fmt:message key="home.main.other.disclaimer.part4" bundle="${msg}" />					


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
							<img src="<%=request.getContextPath()%>/resources/images/time.png" alt="" />
							<h1>
								<fmt:message key="home.main.highlight1.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight1.heading.line2" bundle="${msg}" />
							</h1>
							<p>
								<fmt:message key="home.main.highlight1.desc.part1" bundle="${msg}" /> <a
									href="<fmt:message key="app.download.link" bundle="${msg}" />"
									target="_blank"><fmt:message key="home.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="home.main.highlight1.desc.part3" bundle="${msg}" />
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap-mid wrap text-center">
						<div class="recent-work-inner">
							<img src="<%=request.getContextPath()%>/resources/images/secure.png" alt="" />
							<h1><fmt:message key="home.main.highlight2.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight2.heading.line2" bundle="${msg}" /></h1>
							<p>
								<fmt:message key="home.main.highlight2.desc" bundle="${msg}" /><br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="" />
							<h1><fmt:message key="home.main.highlight3.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight3.heading.line2" bundle="${msg}" /></h1>
							<p>
								<fmt:message key="home.main.highlight3.desc" bundle="${msg}" /><br>
							</p>

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
									<img src="<%=request.getContextPath()%>/resources/images/time.png" alt="" />
									
									<h1>
								<fmt:message key="home.main.highlight1.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight1.heading.line2" bundle="${msg}" />
							</h1>
									
								<p>
								<fmt:message key="home.main.highlight1.desc.part1" bundle="${msg}" /><a
									href="<fmt:message key="app.download.link" bundle="${msg}" />"
									target="_blank"><fmt:message key="home.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="home.main.highlight1.desc.part3" bundle="${msg}" />
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
									<img src="<%=request.getContextPath()%>/resources/images/secure.png" alt="" />
										<h1>
								<fmt:message key="home.main.highlight2.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight2.heading.line2" bundle="${msg}" />
							</h1>
									<p>
										<fmt:message key="home.main.highlight2.desc" bundle="${msg}" /><br>
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
									<img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="" />
									<h1>
										<fmt:message key="home.main.highlight3.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight3.heading.line2" bundle="${msg}" />
									</h1>
									<p><fmt:message key="home.main.highlight3.desc" bundle="${msg}" /><br></p>

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
					<h2><fmt:message key="home.main.testimonial.heading" bundle="${msg}" /></h2>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-left">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none text-italic">
								<fmt:message key="home.main.testimonial.customer1" bundle="${msg}" />
								
							</p>
							<br>
							<div class="hr1"></div>
							<h2><fmt:message key="home.main.testimonial.customer1.name" bundle="${msg}" /></h2>
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
							<p class="pad-none text-italic">
							
								<fmt:message key="home.main.testimonial.customer2" bundle="${msg}" />
								</p>
							<div class="hr1"></div>
							<h2><fmt:message key="home.main.testimonial.customer2.name1" bundle="${msg}" /></h2>
							<h4><fmt:message key="home.main.testimonial.customer2.name2" bundle="${msg}" /></h4>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<br>
				<P class="pad-none p1">
					<br> <fmt:message key="home.main.testimonial.disclaimer" bundle="${msg}" />

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
				<h2><fmt:message key="home.main.testimonial.heading" bundle="${msg}" /></h2>
			</div>
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div class="testimonials-wrap text-center">
								<div class="testimonials-inner travel-testimonial text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>
									<fmt:message key="home.main.testimonial.customer1" bundle="${msg}" />
									</p>
									<div class="hr1"></div>
									<h2><fmt:message key="home.main.testimonial.customer1.name" bundle="${msg}" /></h2>
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
								<div class="testimonials-inner travel-testimonial text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>
									<fmt:message key="home.main.testimonial.customer2" bundle="${msg}" />
									</p>
									<div class="hr1"></div>
									<h2><fmt:message key="home.main.testimonial.customer2.name1" bundle="${msg}" /></h2>
									<h4><fmt:message key="home.main.testimonial.customer2.name2" bundle="${msg}" /></h4>
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
				<h2><fmt:message key="home.main.blog.heading" bundle="${msg}" /></h2>
			</div>
			<div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx1">
						<div>
							<a href="<fmt:message key="home.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home8.png" alt=""></a>
							<h3>
								<a href="<fmt:message key="home.blog.post1.link" bundle="${msg}" />" target="_blank">
									<fmt:message key="home.main.blog.subheading1.part1" bundle="${msg}" /> <fmt:message key="home.main.blog.subheading1.part2" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx2">
						<div>
							<a href="<fmt:message key="home.blog.post2.link" bundle="${msg}" />" target="_blank">
							<img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home9.png" alt="">
								</a>
							<h3>
								<a href="<fmt:message key="home.blog.post2.link" bundle="${msg}" />" target="_blank"> 
								<fmt:message key="home.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx3">
						<div>
						<a href="<fmt:message key="home.blog.post3.link" bundle="${msg}" />" target="_blank">
							<img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home10.png" alt=""></a>
							<h3>
								<a href="<fmt:message key="home.blog.post3.link" bundle="${msg}" />" target="_blank">
									<fmt:message key="home.main.blog.subheading3.part1" bundle="${msg}" /> <fmt:message key="home.main.blog.subheading3.part2" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<p>
			<fmt:message key="home.main.blog.disclaimer" bundle="${msg}" />
			
			</p>


			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#services-->

	<!--bottom-form-->
	<section id="bottom-form" class="hidden-sm hidden-xs homecare">
		<div class="container">
			<div class="row">
				<form:form name="getHomeQuoteBottom" id="getHomeQuoteBottom" action="${pageContext.request.contextPath}/${language}/home-insurance/quote" method="post" modelAttribute="homeCarelPlan">
					<div class="col-lg-12 col-md-12 hidden-xs pad-none homecare slide-form">
						<!-- <h2><fmt:message key="home.main.quote.bottom.heading" bundle="${msg}" /></h2> -->
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
							<label class="radio radio-warning radio-inline radio-homecare"> <input
								type="hidden" id="lblCount" value="<%=blst.size()%>"></input> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio3a<%=bQuetionList.getQid()%>" data-id="home"
								value="<%=bQuetionList.getAnswer1()%>" <%=bQuetionList.getAnswer1Checked()%> type="radio">
								<label for="inlineDeskRadio3a<%=bQuetionList.getQid()%>">
									<span> <%=bQuetionList.getAnswer1()%>
								</span>
							</label>
							</label> <label class="radio radio-warning radio-inline radio-homecare"> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio3b<%=bQuetionList.getQid()%>" data-id="home"
								value="<%=bQuetionList.getAnswer2()%>" <%=bQuetionList.getAnswer2Checked()%> type="radio"> <label
								for="inlineDeskRadio3b<%=bQuetionList.getQid()%>"> <span>
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
								class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare"
								onclick="return msgAlertDesk('getHomeQuoteBottom')"><fmt:message key="home.main.quote.bottom.action" bundle="${msg}" /></button>
						</div>
						<div class="clearfix"></div>
						<p class="pad-none mute">
							<!-- FWD Easy HomeCare*<br>
							<br>  -->
							<fmt:message key="home.main.quote.terms" bundle="${msg}" />
						</p>
					</div>
				</form:form>
			</div>
		</div>
	</section>

	<!--/mob-#bottom-->
	<div class="modal fade" id="oldHome"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" 
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
		   <div class="modal-body">
		   <div style="overflow: hidden;"><a class="close" aria-label="Close" data-dismiss="modal">
                 <span aria-hidden="true" style="font-size:30px;">×</span>
               </a>
            </div>
		     
		   		<p class="errorMsg"><fmt:message key="homecare.uw.question1.notEntitled.message" bundle="${msg}" /></p>
		   		<br/>
      		</div>
		</div>
	</div>
</div>
</body>
</html>