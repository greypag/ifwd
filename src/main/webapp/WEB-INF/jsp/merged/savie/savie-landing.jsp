<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


	<div class="text-center banner-widget container-fluid">
		<div class="fwd-container container-fluid breadcrumbs">
			<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
				<li><a href="#"><fmt:message key="savie.landing.home" bundle="${msg}" /></a></li>
				<li class="divider"><i class="fa fa-play"></i></li>
				<li><a href="#"><fmt:message key="savie.landing.save" bundle="${msg}" /></a></li>
				<li class="divider last"><i class="fa fa-play"></i></li>
				<li class="active-bc"><fmt:message key="savie.landing.savie" bundle="${msg}" /></li>
			</ol>
		</div>
		<!-- <div class="widget-title">
			<span class="first"><fmt:message key="savie.landing.save" bundle="${msg}" /></span>
			<span class="second"><fmt:message key="savie.landing.for" bundle="${msg}" /></span>
			<span class="third"><fmt:message key="savie.landing.that" bundle="${msg}" /></span>
			<span class="fourth"><fmt:message key="savie.landing.dream" bundle="${msg}" /></span>
			<div class="widget-desc">
				<fmt:message key="savie.landing.explore" bundle="${msg}" />
			</div>
		</div>		
		<div class="widget-btns">
			<a href="<%=request.getContextPath()%>/${language}/savie-illustration"><fmt:message key="savie.landing.buynow" bundle="${msg}" /></a>						
		</div>
		<div class="widget-link">
		</div> -->
		<div class="text-content">
			<img src="<%=request.getContextPath()%>/resources/images/savie/savie-text.png" title="Savie is always sweeter" alt="Savie is always sweeter" class="img-responsive hidden-md hidden-lg">
			<img src="<%=request.getContextPath()%>/resources/images/savie/savie-text-desktop.png" title="Savie is always sweeter" alt="Savie is always sweeter" class="img-responsive hidden-xs hidden-sm">
		</div>
		<a href="<%=request.getContextPath()%>/${language}/savie-illustration" class="buy-now" >Buy now</a>
	</div>

	<!--<div id="landing-calculator" class="fwd-full-container container-fluid">
		<img class="img-responsive hidden-xs" src="assets/images/bg-mini-calcu.png" />
		<img class="img-responsive hidden-sm hidden-md hidden-lg" src="assets/images/mini-mobile.png" />
	</div>-->
	<!--<iframe src="http://192.168.1.128:8080/mini-calculator/" class="full-calcu"></iframe>-->
	<div class="mini-calculator">
		<div class="wrapper">
			<div class="levelSelectionDiv">
			</div>
			<div class="arrow_left" onclick="fwd.onClickLeft()">
				<div class="arrow_left_desc"><fmt:message key="savie.landing.Previous" bundle="${msg}" /></div>
			</div>
			<div class="arrow_right" onclick="fwd.onClickRight()">
				<div class="arrow_right_desc"><fmt:message key="savie.landing.Next" bundle="${msg}" /></div>
			</div>
			<div class="main_background">
				<div class="boy_figure young" onclick="fwd.sexSelection('manConfig')">
					<div class="animationDiv"></div>
					<div class="boy_figure_desc"><fmt:message key="savie.landing.Male" bundle="${msg}" /></div>
				</div>
				<div class="girl_figure young" onclick="fwd.sexSelection('girlConfig')">
					<div class="animationDiv"></div>
					<div class="girl_figure_desc"><fmt:message key="savie.landing.Female" bundle="${msg}" /></div>
				</div>
				<div id="smoke"></div>
				<div class="car middle">
					<div class="hand"></div>
					<div class="wheel"></div>
				</div>
				<div class="dreaming">
					<div class="car_dream_btn" onclick="fwd.onClickRight('car')">
		
					</div>
					<div class="saving_dream_btn" onclick="fwd.onClickRight('saving')">
		
					</div>
					<div class="wedding_dream_btn" onclick="fwd.onClickRight('wedding')">
		
					</div>
					<div class="trip_dream_btn" onclick="fwd.onClickRight('trip')">
		
					</div>
				</div>
		
				<div class="letgo_btn" onclick="fwd.onClickRight()">
				</div>
				<div class="dream_text">
					<div class="tilte">
						<fmt:message key="savie.landing.tilte" bundle="${msg}" />
					</div>
					<div class="desc">
						<fmt:message key="savie.landing.desc" bundle="${msg}" />
					</div>
				</div>
				<div class="pageTitle">
					<div class="txtDialog">
						<div class="text">
							<fmt:message key="savie.landing.text" bundle="${msg}" />
						</div>
					</div>
				</div>
				<div class="calAge">
					<div class="sliderRange under"></div>
					<div id="slider" class="selectSlider">
					</div>
					<div class="sliderRange over"></div>
				</div>
			</div>
		</div>
	</div>
	
       <div id="flux">
           <div id="landing-three-column" class="fwd-container container-fluid three-column-widget">
               <div class="row row-top text-center">
                   <div class="col-xs-12 col-md-4 fwd-col">
                       <div class="col-content">
                           <h2><fmt:message key="savie.landing.Simple.H2" bundle="${msg}" /></h2>
                           <h3><fmt:message key="savie.landing.Simple.H3" bundle="${msg}" /></h3>
                           <img src="<%=request.getContextPath()%>/resources/images/savie/big-on-savings.png">
                           <p><fmt:message key="savie.landing.Simple.p" bundle="${msg}" /></p>
                       </div>
                   </div>
                   <div class="col-xs-12 col-md-4 fwd-col">
                       <div class="col-content">
                           <h2><fmt:message key="savie.landing.Nocharges.H2" bundle="${msg}" /></h2>
                           <h3><fmt:message key="savie.landing.Nocharges.H3" bundle="${msg}" /></h3>
                           <img src="<%=request.getContextPath()%>/resources/images/savie/no-commitment.png">
                           <p><fmt:message key="savie.landing.Nocharges.p" bundle="${msg}" /></p>
                       </div>
                   </div>
                   <div class="col-xs-12 col-md-4 fwd-col">
                       <div class="col-content">
                           <h2><fmt:message key="savie.landing.Free.H2" bundle="${msg}" /></h2>
                           <h3><fmt:message key="savie.landing.Free.H3" bundle="${msg}" /></h3>
                           <img src="<%=request.getContextPath()%>/resources/images/savie/free-additional.png">
                           <p><fmt:message key="savie.landing.Free.p" bundle="${msg}" /></p>
                       </div>
                   </div>
               </div>
           </div>
           
           <div class="fwd-container container-fluid">     
               <div id="other-benefits" class="row">
               	<div class="col-xs-12 col-md-8 pull-right">
                   	<h2 class="text-center"><fmt:message key="savie.landing.Other.H2" bundle="${msg}" /></h2>
                   </div>	                    
                   <div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
                       <img src="<%=request.getContextPath()%>/resources/images/savie/other-benefits-img.png">
                   </div>
                   <div class="col-xs-12 col-md-8 fwd-col">
                       <ul>
                           <li><p><fmt:message key="savie.landing.Other.l1" bundle="${msg}" /></p></li>
                           <li><p><fmt:message key="savie.landing.Other.l2" bundle="${msg}" /></p></li>
                           <li><p><fmt:message key="savie.landing.Other.l3" bundle="${msg}" /></p></li>
                           <li><p><fmt:message key="savie.landing.Other.l4" bundle="${msg}" /></p></li>
                           <li><p><fmt:message key="savie.landing.Other.l5" bundle="${msg}" /></p></li>
                       </ul>
                   </div>
               </div>
               <!-- Disclaimer and Policy Provisions -->
               <div class="disclaimer-policy">
                   <p><fmt:message key="savie.landing.Other.p1" bundle="${msg}" /></p>
                   <p><fmt:message key="savie.landing.Other.p2" bundle="${msg}" /></p>
               </div>
           </div>
           
           <!-- FEATURES AND ACTIONS -->
           <div class="fwd-full-container container-fluid fwd-action">
               <div id="fwd-carousel" class="fwd-carousel carousel slide fwd-action-one" data-ride="carousel">
                   <!-- Indicators -->
                   <ol class="carousel-indicators">
                       <li data-target="#fwd-carousel" data-slide-to="0" class="active"></li>
                       <li data-target="#fwd-carousel" data-slide-to="1"></li>
                       <li data-target="#fwd-carousel" data-slide-to="2"></li>
                   </ol>

                   <!-- Wrapper for slides -->
                   <div class="carousel-inner" role="listbox">
                       <div class="item active">
                           <div>
                               <div>
                                   <h2><fmt:message key="savie.landing.item1.H2" bundle="${msg}" /></h2>
                                   <p><fmt:message key="savie.landing.item1.p" bundle="${msg}" /></p>
                               </div>
                           </div>
                       </div>
                       <div class="item">
                           <div>
                               <div>
                                  <h2><fmt:message key="savie.landing.item1.H2" bundle="${msg}" /></h2>
                                   <p><fmt:message key="savie.landing.item1.p" bundle="${msg}" /></p>
                               </div>
                           </div>
                       </div>
                       <div class="item">
                           <div>
                               <div>
                                  <h2><fmt:message key="savie.landing.item1.H2" bundle="${msg}" /></h2>
                                   <p><fmt:message key="savie.landing.item1.p" bundle="${msg}" /></p>
                               </div>
                           </div>
                       </div>
                   </div>

                   <!-- Controls -->
                   <a class="left carousel-control disabled" href="#fwd-carousel" role="button" data-slide="prev">
                       <span class="icon icon-chevron-thin-left">
                       <span class="sr-only"><fmt:message key="savie.landing.Previous" bundle="${msg}" /></span>
                   </a>
                   <a class="right carousel-control active" href="#fwd-carousel" role="button" data-slide="next">
                       <span class="icon icon-chevron-thin-right">
                       <span class="sr-only"><fmt:message key="savie.landing.Next" bundle="${msg}" /></span>
                   </a>
               </div>
               <div class="fwd-action-container fwd-action-two">
                   <button class="action-one talk-to-experts">
                       <img src="<%=request.getContextPath()%>/resources/images/savie/talk-to-one.png" class="img-responsive" />
                       <div class="action-text">
                           <h2><fmt:message key="savie.landing.actiontext1.h2" bundle="${msg}" /></h2>
                           <p><fmt:message key="savie.landing.actiontext1.p" bundle="${msg}" /></p>
                       </div>
                   </button>
                   <button class="action-two download-brochure">
                       <img src="<%=request.getContextPath()%>/resources/images/savie/view-the-full.png" class="img-responsive" />
                       <div class="action-text">
                      		<h2><fmt:message key="savie.landing.actiontext2.h2" bundle="${msg}" /></h2>
                           <p><fmt:message key="savie.landing.actiontext2.p" bundle="${msg}" /></p>
                       </div>
                   </button>
               </div>
               <button type="button" id="sticky-buy-now" class="btn btn-full btn-buy-now"><a href="<%=request.getContextPath()%>/${language}/savie-illustration"><fmt:message key="savie.landing.buynow" bundle="${msg}" /></a></button>
           </div>
       </div>
	
	<!-- OUR BLOG -->
	<div id="landing-page-blog" class="fwd-container blog-widget container-fluid text-center">
		<div class="read-blog-desktop three-column-widget">
			<h2 class="hidden-xs hidden-sm"><fmt:message key="savie.landing.hidden.h2.l1" bundle="${msg}" /></h2>
			<h2 class="hidden-md hidden-lg"><fmt:message key="savie.landing.hidden.h2.l2" bundle="${msg}" /></h2>
			<div class="row text-left">
				<div class="col-xs-12 col-md-4 fwd-col">
					<img src="<%=request.getContextPath()%>/resources/images/savie/stay-connect.png"/>
					<h3><a href="#"><fmt:message key="savie.landing.hidden.row.h3" bundle="${msg}" /> <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
				</div>
				<div class="col-md-4 fwd-col hidden-xs hidden-sm">
					<img src="<%=request.getContextPath()%>/resources/images/savie/7-musts.png"/>
					<h3><a href="#"><fmt:message key="savie.landing.hidden.row1.h3" bundle="${msg}" /> <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
				</div>
				<div class="col-md-4 fwd-col hidden-xs hidden-sm">
					<img src="<%=request.getContextPath()%>/resources/images/savie/top-tips.png"/>
					<h3><a href="#"><fmt:message key="savie.landing.hidden.row2.h3" bundle="${msg}" /> <span class="glyphicon glyphicon-play" aria-hidden="true"></span></a></h3>
				</div>
			</div>
			<p class="text-left hidden-xs hidden-sm"><fmt:message key="savie.landing.hidden.p" bundle="${msg}" /></p>
		</div>			
	</div>
	<!--<button type="button" class="btn btn-full hidden-md hidden-lg">Read more</button>-->
	<a class="btn btn-full hidden-md hidden-lg" href="http://blog.fwd.com.hk/en_US/" target="_blank"><fmt:message key="savie.landing.hidden.readmore" bundle="${msg}" /></a>
