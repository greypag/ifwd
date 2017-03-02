<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
var currentPath = "<%=request.getContextPath()%>";
</script>
<html lang="en">
	<head>
	<!-- <meta charset="utf-8"> -->
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	<!-- <meta name="author" content=""> -->
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
	<!--Google Code for SEO-->





	<%-- <% --%>
	<%-- 	session = request.getSession();
	// 	String uatAuth = (String) session.getAttribute("uatAuth");
	// 	//System.out.println("uatAuth " + uatAuth);
	// 	if (uatAuth == null)


	<%
	// 	session = request.getSession();
	// 	String uatAuth = (String) session.getAttribute("uatAuth");
	// 	//System.out.println("uatAuth " + uatAuth);
	// 	if (uatAuth == null)
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");

	// 	if (!uatAuth.equals("ifwdUser"))
	// 		response.sendRedirect(request.getContextPath() + "/uatAuth");
	<%-- %> --%>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/savie-styles.css">
	</head>
	<body>

		<!--   Main Content-->
		<div>
			<div class="hero-banner">
				<div class="hidden-xs hidden-sm">
					<img src="<%=request.getContextPath()%>/resources/images/slider/main_en.jpg" class="img-responsive banner-image" alt="<fmt:message key="image.alt_1" bundle="${msg}"/>" />
				</div>
				<div class="hidden-md hidden-lg">
					<img src="<%=request.getContextPath()%>/resources/images/slider/main_en_m.jpg" class="img-responsive banner-image" alt="<fmt:message key="image.alt_1" bundle="${msg}"/>" />
				</div>
				<div class="banner-text">
					<fmt:message key="jumbo.homepage.homepage" bundle="${msg}" />
				</div>
			</div>
			<div class="product-list">
				<div class="content-container row fwd-container-limit">
					<div class="hidden psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4 wow fadeInUpBig" data-wow-delay="0s">
						<button id="psa-btn1" class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-1" aria-expanded="false"><span class="text-bold psa-title"><fmt:message key="navbar.catergory1" bundle="${msg}" /></span><img id="btn-collapse1" class="hidden-lg hidden-md psa-plus" src="<%=request.getContextPath()%>/resources/images/savie-2016/plus-slim.png" />
						</button>
						<div class="collapse psa-collapse-content" id="psa-collapse-1">
						  <div class="psa-content">
							<p class="description"><fmt:message key="custom.index.protect.copy1" bundle="${msg}" /></p>
							<div class="psa-link-content">
								<img class="psa-arrow visible-md visible-lg" src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-circle.png" />
								<ul class="psa-ul">
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.easy.health" bundle="${msg}" />"><fmt:message key="header.product.type1.group1.linkname2.full" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.elite.term" bundle="${msg}" />"><fmt:message key="header.product.type1.group1.linkname1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.flight" bundle="${msg}" />"><fmt:message key="header.product.type1.group2.linkname1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.travel" bundle="${msg}" />"><fmt:message key="header.product.type1.group2.linkname3" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.oversea" bundle="${msg}" />"><fmt:message key="header.product.type1.group2.linkname2" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.working.holiday" bundle="${msg}" />"><fmt:message key="header.product.type1.group2.linkname4" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.home" bundle="${msg}" />"><fmt:message key="header.product.type1.group3.linkname1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.home.liability" bundle="${msg}" />" bundle="${msg}" /><fmt:message key="header.product.type1.group3.linkname2" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/screen-insurance/${language}" bundle="${msg}" /><fmt:message key="header.product.type1.group3.linkname3" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
	                             	<li><a href="<%=request.getContextPath()%>/phone-insurance/${language}" bundle="${msg}" /><fmt:message key="header.product.type1.group3.linkname4" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/motor-insurance" bundle="${msg}" /><fmt:message key="header.product.type1.group4.linkname1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
	                             </ul>
								</ul>
							</div>
						  </div>
						</div>
					</div>
					<div class="hidden psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4 wow fadeInUpBig" data-wow-delay="0.2s">
						<button id="psa-btn2" class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-2" aria-expanded="false"><span class="text-bold psa-title"><fmt:message key="navbar.category2" bundle="${msg}" /></span><img id="btn-collapse2" class="hidden-lg hidden-md psa-plus" src="<%=request.getContextPath()%>/resources/images/savie-2016/plus-slim.png" />
						</button>
						<div class="collapse psa-collapse-content" id="psa-collapse-2">
						  <div class="psa-content">
							<p class="description"><fmt:message key="custom.index.save.copy1" bundle="${msg}" /></p>
							<div class="psa-link-content">
								<img class="psa-arrow visible-md visible-lg" src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-circle.png" />
								<ul class="psa-ul">
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.savie" bundle="${msg}" />"><fmt:message key="navbar.category2.group2.item1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.provie" bundle="${msg}" />"><fmt:message key="navbar.category2.group2.item2" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.wealthree" bundle="${msg}" />"><fmt:message key="navbar.category2.group2.item3" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
								</ul>
							</div>
						  </div>
						</div>
					</div>
					<div class="hidden psa-divider col-sm-12 col-xs-12 col-md-4 col-lg-4 wow fadeInUpBig" data-wow-delay="0.4s">
						<button id="psa-btn3" class="btn psa-btn" type="button" data-toggle="collapse" data-target="#psa-collapse-3" aria-expanded="false"><span class="text-bold psa-title"><fmt:message key="navbar.category3" bundle="${msg}" /></span><img id="btn-collapse3" class="hidden-lg hidden-md psa-plus" src="<%=request.getContextPath()%>/resources/images/savie-2016/plus-slim.png" />
						</button>
						<div class="collapse psa-collapse-content" id="psa-collapse-3">
						  <div class="psa-content">
							<p class="description save"><fmt:message key="custom.index.enjoy.copy1" bundle="${msg}" /></p>
							<div class="psa-link-content">
								<img class="psa-arrow visible-md visible-lg" src="<%=request.getContextPath()%>/resources/images/savie-2016/arrow-circle.png" />
								<ul class="psa-ul">
									<%-- <li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.fwdiscover" bundle="${msg}" />"><fmt:message key="navbar.category3.group3.item1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li> --%>
									<li><a href='<fmt:message key="footer.product.type3.link" bundle="${msg}" />'><fmt:message key="navbar.category3.group3.item1" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner.offer" bundle="${msg}" />"><fmt:message key="navbar.category3.group3.item2" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
									<li><a href="<fmt:message key="link.blog" bundle="${msg}" />" target="_blank"><fmt:message key="navbar.category3.group3.item3" bundle="${msg}" /> <i class="fa fa-caret-right orange-caret-right"></i></a></li>
								</ul>
							</div>
						  </div>
						</div>
					</div>
				</div>
				<div class="see-more text-center hidden-sm hidden-xs">
					<p class="text-bold" id="see-all-product-btn"><fmt:message key="label.seeallourproducts" bundle="${msg}" /> <i class="fa fa-caret-right"></i></p>
				</div>
			</div>
			<div class="fna fwd-full-container">
				<div class="fna-body center-block clearfix">
					<img class="fna-img" src="<%=request.getContextPath()%>/resources/images/savie-2016/FWD_FNA-workingfile6-bg-01.jpg" />
					<div class="fna-box">
						<h3 class="text-bold"><fmt:message key="label.fna" bundle="${msg}" /></h3>
						<p><fmt:message key="fna.copy1" bundle="${msg}" /></p>
					</div>
					<button id="btn-fna-cta" class="text-bold btn common-yellow-btn get-btn"><fmt:message key="button.getstart" bundle="${msg}" /></button>
				</div>
				<div class="fna-icons-body text-center clearfix">
					<div class="fwd-container-limit container-fluid" id="nav-holder">
						<ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
							<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
								<a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna"><fmt:message key="pillar.support.title" bundle="${msg}" /></a>
							</li>
							<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
								<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></a>
							</li>
							<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
								<a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></a>
							</li>
							<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-4">
								<a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></a>
							</li>
						</ul>
						<div class="fna-carousel" id="so-carousel">
							<div class="tab-content">
								<div role="tabpanel" class="fna-tab-content tab-pane active wow fadeIn" data-wow-delay="0s" id="navtabs-1">
									<div class="so-fna-content">
										<div class="fna-icon-circle">
											<img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-01.png" alt="<fmt:message key="image.alt_13" bundle="${msg}" />" />
										</div>
										<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
										<p><fmt:message key="pillar.support.copy1" bundle="${msg}" /></p>
									</div>
								</div>
								<div role="tabpanel" class="fna-tab-content tab-pane wow fadeIn" data-wow-delay="0s" id="navtabs-2">
									<div class="so-fna-content">
										<div class="fna-icon-circle">
											<img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-02.png" alt="<fmt:message key="image.alt_11" bundle="${msg}" />" />
										</div>
										<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
										<p><fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
									</div>
								</div>
								<div role="tabpanel" class="fna-tab-content tab-pane wow fadeIn" data-wow-delay="0s" id="navtabs-3">
									<div class="so-fna-content">
										<div class="fna-icon-circle">
											<img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-03.png" alt="<fmt:message key="image.alt_9" bundle="${msg}" />" />
										</div>
										<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></h3>
										<p><fmt:message key="pillar.claim.easy.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.claim.easy.link1" bundle="${msg}" />" class="eserv-link ui-link"><fmt:message key="pillar.claim.easy.copy2" bundle="${msg}" /></a> <fmt:message key="pillar.claim.easy.copy3" bundle="${msg}" /></p>
									</div>
								</div>
								<div role="tabpanel" class="fna-tab-content tab-pane wow fadeIn" data-wow-delay="0s" id="navtabs-4">
									<div class="so-fna-content">
										<div class="fna-icon-circle">
											<img src="<%=request.getContextPath()%>/resources/images/pillar/pillar-04.png" alt="<fmt:message key="image.alt_12" bundle="${msg}" />" />
										</div>
										<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></h3>
										<p><fmt:message key="pillar.eservice.app.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.eservice.app" bundle="${msg}" />" class="eserv-link ui-link"><fmt:message key="pillar.eservice.app.copy2" bundle="${msg}" /></a> <fmt:message key="pillar.eservice.app.copy3" bundle="${msg}" /></p>
									</div>
								</div>
							</div>
							<!-- Carousel -->
							<a class="left carousel-control hidden-lg hidden-md" href="#so-carousel" role="button" data-slide="prev">
							</a>
							<a class="right carousel-control hidden-lg hidden-md" href="#so-carousel" role="button" data-slide="next">
							</a>
						</div>
					</div>
				</div>
				<!-- <a href="#">
					<div class="dropup text-center fna-top-btn">
						<span style="" class="caret"></span><p>TOP</p>
					</div>
				</a> -->
				<div class="content-disclaimer">
					<p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
				</div>
				<div class="read-blog text-center fwd-container-limit">
					<div class="blog-img-container hidden-lg hidden-md">
						<img class="img-responsive blog-img" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-1-mobile.jpg" />
						<div class="transparent-overlay"></div>
						<p class="blog-img-text">7 musts before a long vacation</p>
					</div>
					<p class="text-bold savie-common-btn visible-md visible-lg read-more-btn"><fmt:message key="blog.title" bundle="${msg}" /></p>
					<button class="savie-common-btn btn read-more-btn  read-more-btn-mb ui-btn ui-shadow"><fmt:message key="blog.title" bundle="${msg}" /></button>
					<hr class="hidden-sm hidden-xs" />
				</div>
			</div>
			<!-- Products Gallery -->
			<div class="container-products fwd-container-limit center-block hidden-sm hidden-xs">
				<div class="li-container hidden">
					<ul>
						<li><a href="#">All</a></li>
						<li><a href="#">Save</a></li>
						<li><a href="#">Working Holiday</a></li>
						<li><a href="#">Travel</a></li>
						<li><a href="#">Home</a></li>
					</ul>
				</div>
				<div class="row row-products">
					<div class="products-first-block">
						<div class="col-lg-3 col-md-3 portfolio-item wow fadeIn" data-wow-delay="0s">
							<div class="caption">
								<h4><fmt:message key="blog.blog1.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog1.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog1.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog1.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-1.jpg" />
						</div>
						<div class="col-lg-3 col-md-3 portfolio-item wow fadeIn" data-wow-delay="0.2s">
							<div class="caption">
								<h4><fmt:message key="blog.blog2.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog2.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog2.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog2.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-2.jpg" />
						</div>
						<div class="col-lg-3 col-md-3 portfolio-item wow fadeIn" data-wow-delay="0.4s">
							<div class="caption">
								<h4><fmt:message key="blog.blog3.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog3.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog3.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog3.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-3.jpg" />
						</div>
						<div class="col-lg-3 col-md-3 portfolio-item wow fadeIn" data-wow-delay="0.6s">
							<div class="caption">
								<h4><fmt:message key="blog.blog4.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog4.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog4.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog4.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-4.jpg" />
						</div>
					</div>
					<div class="products-first-block">
						<div class="col-md-3 col-lg-3 portfolio-item wow fadeIn" data-wow-delay="0.8s">
							<div class="caption">
								<h4><fmt:message key="blog.blog5.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog5.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog5.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog5.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-5.jpg" />
						</div>
						<div class="col-md-3 col-lg-3 portfolio-item wow fadeIn" data-wow-delay="1s">
							<div class="caption">
								<h4><fmt:message key="blog.blog6.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog6.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog6.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog6.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-6.jpg" />
						</div>
						<div class="col-md-3 col-lg-3 portfolio-item wow fadeIn" data-wow-delay="1.2s">
							<div class="caption">
								<h4><fmt:message key="blog.blog7.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog7.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog7.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog7.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-7.jpg" />
						</div>
						<div class="col-md-3 col-lg-3 portfolio-item wow fadeIn" data-wow-delay="1.4s">
							<div class="caption">
								<h4><fmt:message key="blog.blog8.title1" bundle="${msg}" /></h4>
								<h5 class="show-travel"><fmt:message key="blog.blog8.title2" bundle="${msg}" /></h5>
								<p class="show-sentence"><fmt:message key="blog.blog8.title3" bundle="${msg}" /></p>
								<a href="<fmt:message key="link.blog8.link" bundle="${msg}" />" target="_blank"><button class="btn-readnow" rel="tooltip"><fmt:message key="button.read.now" bundle="${msg}" /></button></a>
							</div>
							<img class="img-responsive img-container" src="<%=request.getContextPath()%>/resources/images/savie-2016/blog-8.jpg" />
						</div>
					</div>
				</div>
			</div>
			<div class="container-information fwd-container-limit center-block hidden-sm hidden-xs">
				<p><fmt:message key="p.information.text" bundle="${msg}" /></p>
			</div>
			<!-- Business Partners -->
			<div class="bg-business-partners">
				<div id="business-partners-container" class="container-fluid content-container">
				   <h2 class="text-bold text-center"><fmt:message key="label.partner" bundle="${msg}" /></h2>
				   <div class="bp-divider"></div>
				   <div id="business-partners">
				   <div class="row threeCol-wrapper">
						  <div id="bp-7eleven" class="col-xs-12 col-md-4 text-center">
						  	<img class="seven_eleven_logo" src="<%=request.getContextPath()%>/resources/images/7-Eleven_Bar_Logo.png">
						  </div>
						  <%-- 
						  <div id="bp-agoda" class="col-xs-12 col-md-3 text-center">
 							<img class="agoda_logo" src="<%=request.getContextPath()%>/resources/images/savie-2016/partner_agoda.png">
						</div>
						--%>
						<div id="bp-cx" class="col-xs-12 col-md-4 text-center">
						   <img class="cx_logo">
					   </div>
						<div id="bp-cfucome" class="col-xs-12 col-md-4 text-center">
							<img class="cfucome_logo" src="<%=request.getContextPath()%>/resources/images/partner_logo_cfucome.png">
						</div>											   
					</div> <!-- end of row -->
					<div class="row">
						<div id="bp-csl" class="col-xs-12 col-md-3 text-center">
							<img class="csl_logo" src="<%=request.getContextPath()%>/resources/images/savie-2016/CSL_logo.png">
						</div> 
						<div id="bp-klook" class="col-xs-12 col-md-3 text-center">
							<img class="bp-klook" src="<%=request.getContextPath()%>/resources/images/KLOOK_LOGO_HK_MKT.png">
						</div>					
						<div id="bp-tng" class="col-xs-12 col-md-3 text-center">
							<img class="bp_tng" src="<%=request.getContextPath()%>/resources/images/tng.png">
						</div>					
						<%-- <div id="bp-sony" class="col-xs-12 col-md-3 text-center">
							<div class="desktop-center clearfix">
								<img class="sony_logo" src="<%=request.getContextPath()%>/resources/images/partner_sony_logo.png">
							</div>
						</div> --%>
						<div id="bp-club" class="col-xs-12 col-md-3 text-center">
							<div class="desktop-center clearfix">
	 							<img class="club_logo" src="<%=request.getContextPath()%>/resources/images/savie-2016/theclub-logo.png">
	 <%-- 							<a class="hidden-md hidden-lg" href="<fmt:message key="link.partner.offer.agoda.link1" bundle="${msg}" />"> <fmt:message key="label.partner.offer.agoda.copy2" bundle="${msg}" /></a> --%>
	 <%-- 							<p class="hidden-xs hidden-sm"><fmt:message key="label.partner.offer.agoda.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.offer.agoda.link1" bundle="${msg}" />"> <fmt:message key="label.partner.offer.agoda.copy2" bundle="${msg}" /></a> <fmt:message key="label.partner.offer.agoda.copy3" bundle="${msg}" /> <a href="<fmt:message key="link.partner.offer.agoda.link2" bundle="${msg}" />"><fmt:message key="label.partner.offer.agoda.copy4" bundle="${msg}" /></a><fmt:message key="label.partner.offer.agoda.copy5" bundle="${msg}" /> --%>
	 						</div>
						</div>
					</div> <!-- end of row -->
				   </div>

				</div>
			</div>
		</div>
		<!-- Review FNA modal  -->
		<div class="modal fade common-welcome-modal" id="review-fna-modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog">
			    <div class="modal-content">
			    	<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
			     	<h4 class="text-center welcome-msg"><fmt:message key="label.review.fna.title" bundle="${msg}" /> <span id="fullName">${userDetails.fullName }</span></h4>
			     	<p class="text-center description-msg"><fmt:message key="label.review.fna.copy" bundle="${msg}" /></p>
			     	<center><button class="btn savie-common-btn" id="review-fna-btn"><fmt:message key="button.review.fna" bundle="${msg}" /></button></center>
			    </div>
			 </div>
		</div>

		<div class="modal fade common-welcome-modal" id="prev-savie-app-modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button> -->
		     	<h4 class="text-center welcome-msg"><fmt:message key="label.savie.repeat.buy.title" bundle="${msg}" /><span id="fullName1">${userDetails.fullName }</span></h4>
		     	<p class="text-center description-msg"><fmt:message key="label.savie.repeat.buy.copy" bundle="${msg}" /></p>
		     	<center><button class="btn savie-common-btn" id="make-appointment-btn"><fmt:message key="button.appointment" bundle="${msg}" /></button></center>
		    </div>
		  </div>
		</div>

		<div class="modal fade common-welcome-modal" id="retrieve-application-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		     	<h4 class="text-center welcome-msg"><fmt:message key="label.savie.welcome.back" bundle="${msg}" /> <span id="fullNames">${userDetails.fullName }</span></h4>
		     	<p class="text-center description-msg"><fmt:message key="label.resume.or.start.over" bundle="${msg}" /></p>
		     	<center><button class="btn savie-common-btn" id="resume-btn"><fmt:message key="button.resume" bundle="${msg}" /></button><button class="btn savie-common-btn disabled-gray-btn" id="start-over-btn"><fmt:message key="button.start.over" bundle="${msg}" /></button></center>
		    </div>
		  </div>
		</div>

		<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript">
			// #3988 update
			(function() {
				var languageP = "${language}";
				var currentPath = "<%=request.getContextPath()%>";

				if ( languageP == 'en') {

					$('.cx_logo').attr("src", currentPath + "/resources/images/partner_cx_" + languageP + ".png");

				} else if ( languageP == 'tc') {

					// tc also use en version image
					// $('.cx_logo').attr("src", currentPath + "/resources/images/partner_cx_" + languageP + ".png");
					$('.cx_logo').attr("src", currentPath + "/resources/images/partner_cx_en.png");

				} else {

					$('.cx_logo').attr("src", currentPath + "/resources/images/partner_cx_en.png");
					console.error('No defaulted language found');

				}
			})();
			// End of #3988 update

			var language = "en";

            jQuery(document).ready(function($) {
					<% if(session.getAttribute("username")==null){ %>
						console.log('no session username');
						if (window.location.hash) {
							var hash = window.location.hash.substring(1);
							if (hash == "login") {
								$('#loginpopup').modal();
							}
						}
					<% }else{ %>
						console.log('has session username');
					<% } %>
            	
            	// To show review fna modal when clicking FNA CTA button
                $('#btn-fna-cta').click(function() {
                	if("${authenticate}" == "true" && "${authenticate}" != "*DIRECTGI"){
                		$.ajax({
			    		    url:'${pageContext.request.contextPath}/ajax/savings-insurance/show',
			    		    type:'get',
						    cache:false,
						    async:false,
			    		    error:function(){
			    		    },
			    		    success:function(data){
			    		    	$('#loginpopup').modal('hide');
			    		    	if(data != null && data.errMsgs == null && data.name !=null){
			    		    		$('#review-fna-modal').modal({backdrop: 'static', keyboard: false});
			    		    		$('#review-fna-modal').modal('show');
			    		    	}
			    		    	else{
			    		    		window.location = '<%=request.getContextPath()%>/${language}/FNA/financial-needs-analysis';
			    		    	}
			    		    }
			    		});
            		}else{
            			$('.modal').modal('hide');
                        $('.login-info').removeClass('hidden');
                        $('#loginpopup #fna-check').val("false");
                        $('#loginpopup #nav-bar-check').val("false");
                        $('#loginpopup #forcefna').val("true");
                        $('#loginpopup .modal-dialog').addClass('loginpopupext');
            			$('#loginpopup').modal('show');

            		}
                });

            	$("#make-appointment-btn").on('click', function(){
            		window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/customer-service-centre';
            	});

            	$("#review-fna-btn").on('click', function(){
            		window.location = '<%=request.getContextPath()%>/${language}/FNA/review';
            	});

            	$("#resume-btn").on('click', function(){
            		window.location = '<%=request.getContextPath()%>/'+nextPage;
            	});

            	$("#start-over-btn").on('click', function(){
            		$('#retrieve-application-modal').modal('hide');
            	});

				$("#so-carousel").swipe( {
			        swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
			          if(direction == 'right') {
			        	  $(this).carousel('prev');
			          } else if(direction == 'left') {
			        	  $(this).carousel('next');
			          }
			        },
			        threshold:0,
			        fingers:'all'
			      });

				if(getWidth() < 992) {
					//console.log(getWidth());
					//$(window).scroll(function(){
					//		setTimeout(function(){
					//				if(!$(".wow.active").hasClass("animated")){$(".wow:not('.active')").removeClass("animated//");new WOW().init();}
					//			},100);
					//	});
					//	$(".navtabs-title").click(function(){$(window).scroll()});
					$('.psa-btn').attr('data-toggle', 'collapse');
					$('.psa-collapse-content').addClass('collapse');
					$('.fna-tab-content').removeClass('col-lg-3 col-md-3 active');
					$('#navtabs-1').addClass('active');

					 $('#so-carousel').carousel({
                         interval: false
                     });

					 $('#so-carousel').addClass('carousel slide');
                     $('#so-carousel').attr('data-ride', 'carousel');
                     $('.fna-carousel .tab-content').addClass('carousel-inner');
                     $('.fna-carousel .tab-content').attr('role', 'listbox');
                     $('.fna-tab-content').addClass('item');

                     $('#so-carousel').on('slid.bs.carousel', function() {
                    	 //$(window).scroll();
                         if($('#navtabs-1').hasClass('active')) {
                             $('.navtabs-li').removeClass('active');
                             $('#nav-title-1').addClass('active');
                         }
                         if($('#navtabs-2').hasClass('active')) {
                             $('.navtabs-li').removeClass('active');
                             $('#nav-title-2').addClass('active');
                         }
                         if($('#navtabs-3').hasClass('active')) {
                             $('.navtabs-li').removeClass('active');
                             $('#nav-title-3').addClass('active');
                         }
                         if($('#navtabs-4').hasClass('active')) {
                             $('.navtabs-li').removeClass('active');
                             $('#nav-title-4').addClass('active');
                         }
                     });
                     //$('.psa-link-content').hide();

						$('.psa-divider').removeClass('hidden');
				} else {
					$('.psa-btn').attr('data-toggle', 'none');
					$('.psa-collapse-content').removeClass('collapse');

					$('.fna-tab-content').addClass('col-lg-3 col-md-3 active');
					$('.psa-collapse-content').css('height', 'auto');
					$('.psa-divider').removeClass('hidden');
				}
				$(window).resize(function() {
					if(getWidth() < 992) {
						//$(window).scroll(function(){
						//	setTimeout(function(){
						//			if(!$(".wow.active").hasClass("animated")){$(".wow:not('.active')").removeClass("animated//");new WOW().init();}
						//		},100);
						//});
						//$(".navtabs-title").click(function(){$(window).scroll()});
						$('.psa-btn').attr('data-toggle', 'collapse');
						$('.psa-collapse-content').addClass('collapse');
						$('.fna-tab-content').removeClass('col-lg-3 col-md-3 active');
						$('#navtabs-1').addClass('active');
						$('#so-carousel').carousel({
                      interval: false
                  });

						$('#so-carousel').addClass('carousel slide');
	               $('#so-carousel').attr('data-ride', 'carousel');
	               $('.fna-carousel .tab-content').addClass('carousel-inner');
	               $('.fna-carousel .tab-content').attr('role', 'listbox');
	               $('.fna-tab-content').addClass('item');

	               $('#so-carousel').on('slid.bs.carousel', function() {
	            	   //$(window).scroll();
	                   if($('#navtabs-1').hasClass('active')) {
	                       $('.navtabs-li').removeClass('active');
	                       $('#nav-title-1').addClass('active');
	                   }
	                   if($('#navtabs-2').hasClass('active')) {
	                       $('.navtabs-li').removeClass('active');
	                       $('#nav-title-2').addClass('active');
	                   }
	                   if($('#navtabs-3').hasClass('active')) {
	                       $('.navtabs-li').removeClass('active');
	                       $('#nav-title-3').addClass('active');
	                   }
	                   if($('#navtabs-4').hasClass('active')) {
	                       $('.navtabs-li').removeClass('active');
	                       $('#nav-title-4').addClass('active');
	                   }
	               });

	               $('.psa-link-content').show();
						$('.psa-divider').removeClass('hidden');
					} else {
						$('.psa-btn').attr('data-toggle', 'none');
						$('.psa-collapse-content').removeClass('collapse');

						$('.fna-tab-content').addClass('col-lg-3 col-md-3 active');
						$('.psa-collapse-content').css('height', 'auto');
						$('.psa-divider').removeClass('hidden');
					}
				});
				 function getWidth() {
                if (self.innerWidth) {
                    return self.innerWidth;
                }
                else if (document.documentElement && document.documentElement.clientHeight){
                    return document.documentElement.clientWidth;
                }
                else if (document.body) {
                    return document.body.clientWidth;
                }
                return 0;
             }

				$('#see-all-product-btn').on('click', function() {
					$('.psa-link-content').slideToggle("slow");
				});

					// plus / minus button
					$('#psa-btn1').on({
					    'click': function () {
					        var origsrc = $('#btn-collapse1').attr('src');
					        var src = context+'/resources/images/savie-2016/plus-slim.png';
					        if (origsrc == context+'/resources/images/savie-2016/plus-slim.png') src = context+'/resources/images/savie-2016/minus-slim.png';
					        $('#btn-collapse1').attr('src', src);
					    }
					});
					$('#psa-btn2').on({
					    'click': function () {
					        var origsrc = $('#btn-collapse2').attr('src');
					        var src = context+'/resources/images/savie-2016/plus-slim.png';
					        if (origsrc == context+'/resources/images/savie-2016/plus-slim.png') src = context+'/resources/images/savie-2016/minus-slim.png';
					        $('#btn-collapse2').attr('src', src);
					    }
					});
					$('#psa-btn3').on({
					    'click': function () {
					        var origsrc = $('#btn-collapse3').attr('src');
					        var src = context+'/resources/images/savie-2016/plus-slim.png';
					        if (origsrc == context+'/resources/images/savie-2016/plus-slim.png') src = context+'/resources/images/savie-2016/minus-slim.png';
					        $('#btn-collapse3').attr('src', src);
					    }
					});

					//mobile blog read more button open blog page
					$('.read-more-btn-mb').click(function(){
						window.open('<fmt:message key="link.blog1.link" bundle="${msg}" />');
					});
            });

		</script>
	</body>
</html>
