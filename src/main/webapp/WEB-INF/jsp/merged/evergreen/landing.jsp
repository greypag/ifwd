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
		<div class="text-content">
			<img src="<%=request.getContextPath()%>/resources/images/savie/savie-text.png" title="Savie is always sweeter" alt="Savie is always sweeter" class="img-responsive hidden-md hidden-lg">
			<img src="<%=request.getContextPath()%>/resources/images/savie/savie-text-desktop.png" title="Savie is always sweeter" alt="Savie is always sweeter" class="img-responsive hidden-xs hidden-sm">
		</div>
		<a href="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}" class="buy-now" ><fmt:message key="savie.landing.buynow" bundle="${msg}" /><span class="icon icon-chevron-thin-right"></span></a>
	</div>

	<!--<div id="landing-calculator" class="fwd-full-container container-fluid">
		<img class="img-responsive hidden-xs" src="assets/images/bg-mini-calcu.png" />
		<img class="img-responsive hidden-sm hidden-md hidden-lg" src="assets/images/mini-mobile.png" />
	</div>-->
	<!--<iframe src="http://192.168.1.128:8080/mini-calculator/" class="full-calcu"></iframe>-->
	<div class="mini-calculator">
		<div id="calculatorDiv">
		<div class="wrapper">
			<div class="levelSelectionDiv">
			</div>
			<div class="arrow_left" onclick="javascript:fwd.onClickLeft();">
				<div class="arrow_left_desc"></div>
			</div>
			<div class="arrow_right" onclick="javascript:fwd.onClickRight();">
				<div class="arrow_right_desc"></div>
			</div>
			<div class="main_background">
				<div class="boy_figure young" onclick="javascript:fwd.sexSelection('manConfig');">
					<div class="animationDiv"></div>
					<div class="boy_figure_desc">Male</div>
				</div>
				<div class="girl_figure young" onclick="javascript:fwd.sexSelection('girlConfig');">
					<div class="animationDiv"></div>
					<div class="girl_figure_desc">Female</div>
				</div>
				<div id="smoke"></div>
				<div class="car middle">
					<div class="hand"></div>
					<div class="wheel"></div>
				</div>
				<div class="dreaming">
					<div class="car_dream_btn" onclick="javascript:fwd.onClickRight('car');">
		
					</div>
					<div class="saving_dream_btn" onclick="javascript:fwd.onClickRight('saving');">
		
					</div>
					<div class="wedding_dream_btn" onclick="javascript:fwd.onClickRight('wedding');">
		
					</div>
					<div class="trip_dream_btn" onclick="javascript:fwd.onClickRight('trip');">
		
					</div>
				</div>
				<div id="welcomePageText">
					<div class="title">Welcome to<br>My Dream Calculator</div>
					<div class="desc">We are here to help you find out the right amount of savings you would need in order to achieve any dreams you may have, big or small. Everything you need to know is only a few clicks away.</div>
				</div>
				<div class="letgo_btn" onclick="javascript:fwd.onClickRight();">
				</div>
				<!--div class="dream_text">
					<div class="tilte">
						WHAT IS YOUR DREAM?
					</div>
					<div class="desc">
						what are xjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskxjeskx
					</div>
				</div-->
				<div class="pageTitle">
					<div class="txtDialog">
						<div class="text">
							HOW OLD ARE YOU ?
						</div>
					</div>
				</div>
				<!--div class="calAge">
					<div class="sliderRange under"></div>
					<div id="slider" class="selectSlider">
					</div>
					<div class="sliderRange over"></div>
				</div-->
				<div id="sliderDiv">
					<div class="valueLevelDiv">
						<div class="valueLevelButton" id="valueLevelBtn_simple" onclick="javascript:fwd.valueLevelSelection(this, 1);"><div class="simple"></div></div>
						<div class="valueLevelButton" id="valueLevelBtn_elegant" onclick="javascript:fwd.valueLevelSelection(this, 2);"><div class="elegant"></div></div>
						<div class="valueLevelButton" id="valueLevelBtn_deluxe" onclick="javascript:fwd.valueLevelSelection(this, 3);"><div class="deluxe"></div></div>
					</div>        
					<div class="sliderUnit">Years</div>
					<div class="sliderContainer">
						<div id="slider"></div>
						<div class="slidersteps" id="ageScale">
							<span class="head">|<br>10</span>
							<span class="tail">|<br>80</span>
						</div>
						<div class="slidersteps" id="carScale">
							<span class="first">|<br>$0</span>
							<span class="second">|<br>$200,000</span>
							<span class="third">|<br>$400,000</span>
							<span class="forth">|<br>$600,000</span>
							<span class="fifth">|<br>$800,000</span>
							<span class="sixth">|<br>$1,000,000</span>
						</div>
						<div class="slidersteps" id="tripScale">
							<span class="first">|<br>$0</span>
							<span class="second">|<br>$100,000</span>
							<span class="third">|<br>$200,000</span>
							<span class="forth">|<br>$300,000</span>
							<span class="fifth">|<br>$400,000</span>
							<span class="sixth">|<br>$500,000</span>
						</div>
					</div>
				</div>
				<div id="sliderDivSaving"> 
					<div class="divLeft">
						<div class="sliderUnit saving">HKD</div>
						<div class="sliderContainerSaving">
							<div id="sliderSaving"></div>
							<div class="slidersteps">
								<span class="head">|<br>0</span>
								<span class="tail">|<br><span class="max">80</span></span>
							</div>
							<div class="sliderTitle">Current Savings</div>
						</div>
					</div>
					<div class="divRight">
						<div class="sliderUnit savingPeriod">Years</div>
						<div class="sliderContainerSavingPeriod">
							<div id="sliderSavingPeriod"></div>
							<div class="slidersteps">
								<span class="head">|<br>1</span>
								<span class="tail">|<br>99</span>
							</div>
							<div class="sliderTitle">Saving Period</div>
						</div>
					</div>
				</div>
				<div id="calculationResult">
					<img src="<%=request.getContextPath()%>/resources/images/mini-calculator/img_text_container_bubble.png"/>
					<div class="resultContent">
						<div class="first">Without compound interest, you have to save <span class="nonCompoundInterest"></span> each month.</div>
						<div class="second">With compound interest, you only need to save <span class="compoundInterest"></span> each month.</div>
						<div class="third">Annual Return Rate: <div id="rorReduceBtn" onclick="javascript:fwd.reduceROR();"></div><div id="ror"></div><div id="rorAddBtn" onclick="javascript:fwd.addROR();"></div></div>
					</div>
				</div>
				<div id="emailDiv">
					<div class="desc"></div>
					<div class="inputDiv">
						<div class="textfield">
							<form>
							<input type="text" name="emailAddress" id="emailAddress">
							</form>
						</div><div id="emailBtn" onclick="javascript:fwd.sendEmail();"><div>Email Me</div></div>
					</div>
					<div class="startoverDiv">
						<div id="startoverBtn" onclick="javascript:fwd.startOver();">Start Over</div>
					</div>
				</div>
			</div>
		</div><!--end of wrapper-->
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
                       <span class="icon icon-chevron-thin-left"></span>
                       <span class="sr-only"><fmt:message key="savie.landing.Previous" bundle="${msg}" /></span>
                   </a>
                   <a class="right carousel-control active" href="#fwd-carousel" role="button" data-slide="next">
                       <span class="icon icon-chevron-thin-right"></span>
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
               <button type="button" id="sticky-buy-now" class="btn btn-full btn-buy-now"><a href="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}"><fmt:message key="savie.landing.buynow" bundle="${msg}" /></a></button>
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
	
	<script type="text/javascript">
		var language = "en";
	</script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.animateSprite.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/jquery.loadImages.1.1.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/savie/index.js"></script>
