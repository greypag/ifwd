<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Date" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
    boolean isSaleActiveClass = true;
    boolean isEservicesActiveClass = false;
%>

<%
	int hotelVoucherCampaignId = Integer.parseInt(session.getAttribute("hotelVoucherCampaignId").toString());
    java.text.SimpleDateFormat cformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    long cCurrent = System.currentTimeMillis();
    /*hotelVoucherCampaignId = 16;*/
    //cCurrent = cformat.parse("2016-02-29 09:59:59").getTime();
    //cCurrent = cformat.parse("2016-02-29 10:00:00").getTime();
    
    long cStart = cformat.parse("2016-02-23 09:59:59").getTime();
    String disableOfferClass = "";
    String countDownDate = "";
    String countDownDD = "";
    String countDownMM = "";
    boolean isCNYOffer = false;
    if( cCurrent<= cStart ){
        //disableOfferClass = "paused-plan";
        disableOfferClass = "";
        countDownDate = "2016-02-29 09:59:59";
        countDownDD = "29";
        countDownMM = "FEB";
        isCNYOffer = true;
    } else {
        disableOfferClass = "";
        countDownDate = "2016-03-19 00:00:00";
        countDownDD = "19";
        countDownMM = "MAR";
        //isCNYOffer = false;
        isCNYOffer = true;
    }

%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-fwdiscover.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slick.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slick-theme.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/slick.min.js"></script>
        <div class="fwd-savie-wrapper fwdiscover-wrapper">          
            <!--Top Header-->
            <div class="page-fwdiscover">
                <div class="breadcrumbs-holder">
                    <div class="fwd-container container-fluid hidden-xs hidden-sm clearfix">
                        <div class="breadcrumbs pull-left">
                            <ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
                                <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
                                <li class="divider"><i class="fa fa-play"></i></li>
                                <li><a href="#"><fmt:message key="breadcrumb.fwdiscover.category" bundle="${msg}" /></a></li>
                                <li class="divider last"><i class="fa fa-play"></i></li>
                                <li class="active-bc"><fmt:message key="breadcrumb.fwdiscover.product" bundle="${msg}" /></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="fwdiscover-info clearfix">
                    <div class="fwd-full-container container-fluid fwdiscover-banner clearfix">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/page-banner-mobile.jpg" class="img-responsive hidden-md hidden-lg">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/page-banner-desktop.jpg" class="img-responsive hidden-sm hidden-xs">
                        <div class="banner-title">
                            <p class="welcome"><fmt:message key="jumbo.fwdiscover1" bundle="${msg}" /></p>
                            <p class="fwdiscover"><fmt:message key="jumbo.fwdiscover2" bundle="${msg}" /></p>
                        </div>
                    </div>

                    <div class="clearfix fwdiscover-container">
                        <div class="fwdiscover-description">
                            <p><fmt:message key="Fanfare.landingpage.description1.part1" bundle="${msg}" /></p>
                            <p><fmt:message key="Fanfare.landingpage.description1.part2" bundle="${msg}" />
                                <span class="grab"><fmt:message key="Fanfare.landingpage.description1.part3" bundle="${msg}" /></span>
                            </p>
                            <p class="register">
                                <fmt:message key="Fanfare.landingpage.description2.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%><fmt:message key="link.register" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.description2.part2" bundle="${msg}" /></a> <fmt:message key="Fanfare.landingpage.description2.part3" bundle="${msg}" />
                            </p>
                        </div>

                        <div class="fwdiscover-timer pull-right">
                            <p class="hurry"><fmt:message key="Fanfare.landingpage.timerword" bundle="${msg}" /></p>
                            <div class="clearfix">
                                <!-- month -->
                                <div class="timer-holder month-holder">
                                    <div class="bg gray-bg">
                                        <div class="clearfix">
                                            <span class="number pull-left"><%=countDownDD%></span>
                                            <span class="month pull-right"><%=countDownMM%></span>
                                        </div>
                                        <span class="line line-gray"></span>
                                    </div>
                                    <span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer1" bundle="${msg}" /></span>
                                </div>
                                <!-- end month -->

                                <!-- DAY HOUR MINS SECS -->
                                <div class="day-hour-min-sec" id="countdown">
                                    <div class="timer-holder">
                                        <div class="bg">
                                            <div class="clearfix">
                                                <span class="number" id="countdown-days">03</span>
                                            </div>
                                            <span class="line"></span>
                                        </div>
                                        <span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer2" bundle="${msg}" /></span>
                                    </div>

                                    <div class="timer-holder right">
                                        <div class="bg">
                                            <div class="clearfix">
                                                <span class="number" id="countdown-hours">20</span>
                                            </div>
                                            <span class="line"></span>
                                        </div>
                                        <span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer3" bundle="${msg}" /></span>
                                    </div>

                                    <div class="timer-holder right">
                                        <div class="bg">
                                            <div class="clearfix">
                                                <span class="number" id="countdown-minutes">42</span>
                                            </div>
                                            <span class="line"></span>
                                        </div>
                                        <span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer4" bundle="${msg}" /></span>
                                    </div>

                                    <div class="timer-holder right">
                                        <div class="bg">
                                            <div class="clearfix">
                                                <span class="number" id="countdown-seconds">28</span>
                                            </div>
                                            <span class="line"></span>
                                        </div>
                                        <span class="desc text-center"><fmt:message key="Fanfare.landingpage.timer5" bundle="${msg}" /></span>
                                    </div>
                                </div>
                                <!-- end DAY HOUR MINS SECS -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hotel-voucher-carousel-wrapper">
	                <div class="hotel-voucher-carousel-title-wrapper">
	                    <div class="Carousel-title"><fmt:message key="Fanfare.Hotel.Carousel.Title" bundle="${msg}" /></div>
	                    <div class="Carousel-subtitle"><fmt:message key="Fanfare.Hotel.Carousel.SubTitle" bundle="${msg}" /></div>
	                </div>
	                <div id="hotel-voucher-carousel" class="">
		                  <div class="carousel-item-container first<%=hotelVoucherCampaignId==14?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="0">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/mar14-oneworld.png" class="img-responsive">			                        
			                        <div class="carousel-description-container">
			                              <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.Mar14.Date" bundle="${msg}" /></div>
			                              <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar14.HotelName" bundle="${msg}" /></div>
			                        </div> 
		                        </div>   
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==15?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="1">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/mar13-Vivatel.png" class="img-responsive">		                        
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.Mar15.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar15.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>    
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==16?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="2">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/mar12-shangri-la-rasa.png" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.Mar16.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar16.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>    
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==17?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="3">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/mar11-goldensand-resort.png" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.Mar17.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar17.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>    
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==18?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="4">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/mar15-traders-hotel.png" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.Mar18.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar18.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>    
		                  </div>
	                </div>
	                <div class="clearfix"></div>
                </div>
                <div class="sponsor-logo-wrapper">
                    <div class="sponsor-text">
                        <fmt:message key="Fanfare.Hotel.Sponsor.Text" bundle="${msg}" />
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/agoda-logo.png" class="img-responsive">
                    </div>
                </div>
                <%--<div id="myCarousel-fwdiscover" class="carousel slide fwdiscover-container">
                    
                    <!-- Carousel items -->
                    <div class="carousel-inner clearfix">
                        <div class="item active">
                            <div class="row">
                                
                                
                                
                                <% if(isCNYOffer==true){ %>
                                <div class="col-xs-4">
                                    <a href="#offerCny"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/PremiumDiscount_hero_thumbnail.jpg" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm long-text">
                                        <p class="price"><fmt:message key="Fanfare.landingpage.thumbnail0.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail0.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail0" bundle="${msg}" /></p>
                                    </span>
                                </div>
                                <% } %>
                                
                                
                                <div class="col-xs-4">
                                    <a href="#offer1"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/annualtravel.png" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm">
                                        <p class="price"><fmt:message key="Fanfare.landingpage.thumbnail1.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail1.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail1" bundle="${msg}" /></p>
                                    </span>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#offer2"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/single-trip.jpg" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm">
                                        <p class="price"><fmt:message key="Fanfare.landingpage.thumbnail2.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail2.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail2" bundle="${msg}" /></p>
                                    </span>
                                </div>
                            </div>
                            <!--/row-->
                        </div>  

                        <div class="item">
                            <div class="row">
                                <div class="col-xs-4">
                                    <a href="#offer3"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/4daysingletrave.png" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm">
                                        <p class="price"><fmt:message key="Fanfare.landingpage.thumbnail3.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail3.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail3" bundle="${msg}" /></p>
                                    </span>
                                </div>                          
                                <div class="col-xs-4">
                                    <a href="#offer4"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/1yearhomeplan.jpg" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm">
                                        <p class="price percentage"><fmt:message key="Fanfare.landingpage.thumbnail4.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail4.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail4" bundle="${msg}" /></p>
                                    </span>
                                </div>
                                <div class="col-xs-4">
                                    <a href="#offer5"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/1yearworkingholiday.jpg" class="img-responsive"></a>
                                    <div class="gray-hover hidden hidden-xs hidden-sm">
                                        <p class="price"><fmt:message key="Fanfare.landingpage.thumbnail5.price" bundle="${msg}" /></p>
                                        <p class="discount"><fmt:message key="Fanfare.landingpage.thumbnail5.copy" bundle="${msg}" /></p>
                                    </div>
                                    <span class="text-center">
                                        <p><fmt:message key="Fanfare.landingpage.thumbnail5" bundle="${msg}" /></p>
                                    </span>
                                </div>
                                <div class="col-xs-4">
                                    
                                </div>
                            </div>
                            <!--/row-->
                        </div>  

                    </div>
                    <!--/carousel-inner--> 
                    <a class="left carousel-control hidden-md hidden-lg" href="#myCarousel-fwdiscover" data-slide="prev">
                        <div class="img-holder">
                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-left.png" class="img-responsive">
                        </div>
                    </a>

                    <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-fwdiscover" data-slide="next">
                        <div class="img-holder">
                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-right.png" class="img-responsive">
                        </div>
                    </a>
                </div>--%>
                <!--/myCarousel-->
                
                <!-- PLANS -->
                <div class="plans-holder fwdiscover-container">
                <!-- Hotel Promotion Start -->
                	<% if (hotelVoucherCampaignId == 14) { %>
                    <!-- Hotel 3-11 Offer Start -->
                    <div class="fwdiscover-plan hotel-voucher">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/one-world-mobile.png" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/one-world-desktop.png" class="img-responsive hidden-xs hidden-sm">               
                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer314.HotelName" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer314.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer314.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer314.bullet3" bundle="${msg}" /></li>
		                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
		                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
		                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
		                                </li>                                        
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.offer314.enddate" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.offer314.enddate.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer-311">
                                    <button class="details-btn" id="offer-311-button" data-toggle="modal" data-target="#offer-311-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hotel 3-11 Offer End -->
                    <% } %>
					<% if (hotelVoucherCampaignId == 15) { %>
                    <!-- Hotel 3-12 Offer Start -->
                    <div class="fwdiscover-plan hotel-voucher">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/vivatel-mobile.png" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/vivatel-desktop.png" class="img-responsive hidden-xs hidden-sm">                    
                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer315.HotelName" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer315.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer315.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer315.bullet3" bundle="${msg}" /></li>
		                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
		                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
		                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
		                                </li>                                    
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.offer315.enddate" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.offer315.enddate.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer-312">
                                    <button class="details-btn" id="offer-312-button" data-toggle="modal" data-target="#offer-312-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hotel 3-12 Offer End -->
                    <% } %>
					<% if (hotelVoucherCampaignId == 16) { %>
                    <!-- Hotel 3-13 Offer Start -->
                    <div class="fwdiscover-plan hotel-voucher">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/rasa-sayang-mobile.png" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/rasa-sayang-desktop.png" class="img-responsive hidden-xs hidden-sm">                    
                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer316.HotelName" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer316.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer316.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer316.bullet3" bundle="${msg}" /></li>
		                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
		                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
		                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
		                                </li>                                    
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.offer316.enddate" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.offer316.enddate.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer-313">
                                    <button class="details-btn" id="offer-313-button" data-toggle="modal" data-target="#offer-313-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hotel 3-13 Offer End -->
                    <% } %>
                    <% if (hotelVoucherCampaignId == 17) { %>
                    <!-- Hotel 3-14 Offer Start -->
                    <div class="fwdiscover-plan hotel-voucher">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/golden-sands-mobile.png" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/golden-sands-desktop.png" class="img-responsive hidden-xs hidden-sm">                    
                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer317.HotelName" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer317.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer317.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer317.bullet3" bundle="${msg}" /></li>
		                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
		                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
		                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
		                                </li>                                    
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.offer317.enddate" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.offer317.enddate.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer-314">
                                    <button class="details-btn" id="offer-314-button" data-toggle="modal" data-target="#offer-314-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hotel 3-14 Offer End -->
                    <% } %>
                    <% if (hotelVoucherCampaignId == 18 || hotelVoucherCampaignId == -1) { %>
                    <!-- Hotel 3-15 Offer Start -->
                    <div class="fwdiscover-plan hotel-voucher">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/traders-mobile.png" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/traders-desktop.png" class="img-responsive hidden-xs hidden-sm">
                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer318.HotelName" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer318.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer318.bullet2" bundle="${msg}" /></li>
		                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
		                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
		                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
		                                </li>                                        
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.offer318.enddate" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.offer318.enddate.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="details-button-holder text-center" name="offer-315">
                                    <button class="details-btn" id="offer-315-button" data-toggle="modal" data-target="#offer-315-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hotel 3-15 Offer End -->
                    <% } %>
                <!-- Hotel Promotion End -->          
                <!-- CNY PROMOTION START -->
                <%--<%
                    if (isCNYOffer) {
                %>
                    <div class="fwdiscover-plan">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/PremiumDiscount_hero_mobile.jpg" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/PremiumDiscount_hero.jpg" class="img-responsive hidden-xs hidden-sm">
                        <div class="plan-details-box red-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium" bundle="${msg}" /></p>
                                    <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle3" bundle="${msg}" /></span></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet3" bundle="${msg}" /> <a href="<fmt:message key="Fanfare.landingpage.offerPermium.bullet3.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerPermium.bullet3.linktext" bundle="${msg}" /></a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count5}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offerCny">
                                    <button class="details-btn" id="cny-plan-button" data-target="offerCny-details"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end CNY PROMOTION -->
                <%
                    } 
                %>      
                    <!-- first plan -->
                    <div class="fwdiscover-plan <%=disableOfferClass%>">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-annualtravel.jpg" class="img-responsive hidden-lg hidden-md">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-annualtravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

                        <div class="plan-details-box gray-bg left">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer1" bundle="${msg}" /></p>
                                    <p class="promo"><fmt:message key="Fanfare.landingpage.offer1.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer1.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer1.subtitle3" bundle="${msg}" /></span></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer1.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer1.bullet3" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer1.bullet4" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer1.bullet5" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offer1.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count0}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer1">
                                    <button class="details-btn" id="first-plan-button" data-target="offer1-details"><fmt:message key="Fanfare.landingpage.offer1.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end first plan -->
                    <!-- second plan -->
                    <div class="fwdiscover-plan <%=disableOfferClass%>">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-14dayssingletrip.jpg" class="img-responsive hidden-md hidden-lg">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-14dayssingletrip-desktop.jpg" class="img-responsive hidden-xs hidden-sm">
                        <div class="plan-details-box red-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" /></p>
                                    <p class="promo"><fmt:message key="Fanfare.landingpage.offer2.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer2.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer2.subtitle3" bundle="${msg}" /></span></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer2.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer2.bullet3" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer2.bullet4" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offer2.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count1}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer2">
                                    <button class="details-btn" id="second-plan-button" data-target="offer2-details"><fmt:message key="Fanfare.landingpage.offer2.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end second plan -->
                    <!-- third plan -->
                    <div class="fwdiscover-plan <%=disableOfferClass%>">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-4daysingletravel.jpg" class="img-responsive hidden-md hidden-lg">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-4daysingletravel-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

                        <div class="plan-details-box orange-bg left">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer3" bundle="${msg}" /></p>
                                    <p class="promo"><fmt:message key="Fanfare.landingpage.offer3.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer3.subtitle2" bundle="${msg}" /></span> </p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer3.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer3.bullet3" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer3.bullet4" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offer3.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count2}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer3">
                                    <button class="details-btn" id="third-plan-button" data-target="offer3-details"><fmt:message key="Fanfare.landingpage.offer3.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end third plan -->
                    <!-- fourth plan -->
                    <div class="fwdiscover-plan <%=disableOfferClass%>">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-1yearhome.jpg" class="img-responsive hidden-md hidden-lg">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-1yearhome-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

                        <div class="plan-details-box gray-bg right">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title"><fmt:message key="Fanfare.landingpage.offer4" bundle="${msg}" /></p>
                                    <p class="promo"><fmt:message key="Fanfare.landingpage.offer4.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer4.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer4.subtitle3" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer4.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer4.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer4.bullet3" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offer4.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count3}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer4">
                                    <button class="details-btn" id="fourth-plan-button" data-target="offer4-details"><fmt:message key="Fanfare.landingpage.offer4.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end fourth plan -->
                    <!-- fiffth plan -->
                    <div class="fwdiscover-plan <%=disableOfferClass%>">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-workingholiday.jpg" class="img-responsive hidden-md hidden-lg">
                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/plan-workingholiday-desktop.jpg" class="img-responsive hidden-xs hidden-sm">

                        <div class="plan-details-box red-bg left">
                            <div class="plan-desc">
                                <div class="upper-desc">
                                    <p class="title two-lines"><fmt:message key="Fanfare.landingpage.offer5" bundle="${msg}" /></p>
                                    <p class="promo"><fmt:message key="Fanfare.landingpage.offer5.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer5.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer5.subtitle3" bundle="${msg}" /></p>
                                </div>
                                <div class="lower-desc">
                                    <ul>
                                        <li><fmt:message key="Fanfare.landingpage.offer5.bullet1" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer5.bullet2" bundle="${msg}" /></li>
                                        <li><fmt:message key="Fanfare.landingpage.offer5.bullet3" bundle="${msg}" /></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="desc-and-button-holder clearfix">
                                <div class="promo-desc text-center">
                                    <div class="clearfix">
                                        <div class="holder">
                                            <p class="title"><fmt:message key="Fanfare.landingpage.offer5.box1" bundle="${msg}" /></p>
                                            <p class="value count">${count4}</p>
                                        </div>
                                        <div class="holder date hidden-xs hidden-sm">
                                            <fmt:message key="Fanfare.enddate1" bundle="${msg}" />
                                        </div>
                                        <div class="holder date hidden-md hidden-lg">
                                            <fmt:message key="Fanfare.enddate1.mobile" bundle="${msg}" />
                                        </div>
                                    </div>
                                </div>

                                <div class="details-button-holder text-center" name="offer5">
                                    <button class="details-btn" id="fifth-plan-button" data-target="offer5-details"><fmt:message key="Fanfare.landingpage.offer5.button" bundle="${msg}" /></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end fifth plan -->--%>
                </div>
                <!-- end PLANS -->
                <!-- Hotel Partner Start -->
                <div class="hotel-partner-wrapper">
                    <div class="hotel-partner-title"><fmt:message key="Fanfare.Hotel.Sponsor.Title" bundle="${msg}" /></div>
                    <div class="hotel-partner-icon-wrapper">
	                    <div class="col-1"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/goldensands-penang-icon.png" class="img-responsive"></div>
	                    <div class="col-2"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/shangri-la-rasa-penang-icon.png" class="img-responsive"></div>
	                    <div class="col-3"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/vivatel-icon.png" class="vivatel-icon img-responsive"></div>
	                    <div class="col-4"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/one-world-icon.png" class="img-responsive"></div>
	                    <div class="col-5"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/traders-icon.png" class="img-responsive"></div>
                    </div>
                </div>
                <!-- Hotel Partner End -->
                <!-- fwdiscover footer -->
                <div class="fwdiscover-footer">
                    <div id="myCarousel-footer" class="carousel slide hidden"> 
                        <ol class="carousel-indicators hidden-md hidden-lg">
                        <li data-target="#myCarousel-footer" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel-footer" data-slide-to="1"></li>
                        <li data-target="#myCarousel-footer" data-slide-to="2"></li>
                        <li data-target="#myCarousel-footer" data-slide-to="3"></li>
                        <li data-target="#myCarousel-footer" data-slide-to="4"></li>
                        <li data-target="#myCarousel-footer" data-slide-to="5"></li>
                      </ol>
                        <!-- Carousel items -->
                        <div class="carousel-inner">
                            <div class="item active clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>            
                            <div class="item clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>     
                            <div class="item clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>
                            <div class="item clearfix">
                                <div class="footer-image-holder">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-image.jpg" class="img-responsive">
                                </div>
                                <div class="footer-image-info-holder">
                                    <div class="sponsor-logo">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/footer-agoda.png" class="img-responsive">
                                    </div>

                                    <div class="promo-info-holder">
                                        <div class="clearfix">
                                            <p class="save">SAVE <span>UP TO</span></p>
                                            <p class="percent">75%</p>
                                        </div>
                                        <p class="hotels">on 525,000+ hotels with Agoda</p>
                                    </div>
                                </div>
                            </div>               
                        </div>
                        <!--/carousel-inner--> 
                        <a class="left carousel-control hidden-md hidden-lg" href="#myCarousel-footer" data-slide="prev">
                            <div class="img-holder">
                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-left.png" class="img-responsive">
                            </div>
                        </a>

                        <a class="right carousel-control hidden-md hidden-lg" href="#myCarousel-footer" data-slide="next">
                            <div class="img-holder">
                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/carousel-right.png" class="img-responsive">
                            </div>
                        </a>
                    </div>
                    <!--/myCarousel-->

                </div>
                <!-- end fwdiscover footer -->
    <%
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        long current = System.currentTimeMillis();  
        long start = format.parse("2016-01-31").getTime() + 36000000;
        if(current <= start) {
    %>
                <!-- MODALS -->             
                <div class="modal fade fwdiscover-modal" id="offer-announce" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.offer.announce" bundle="${msg}" /></p>
                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
    <%
        }
    %>                              
                <!-- 5 plans -->                
                <!-- CNY PROMOTION -->
                <div class="modal fade fwdiscover-modal" id="offerCny-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle3" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerPermium.bullet3" bundle="${msg}" /><a href="<fmt:message key="Fanfare.landingpage.offerPermium.bullet3.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerPermium.bullet3.linktext" bundle="${msg}" /></a></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-cny"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.offerPermium.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.offerPermium.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.offerPermium.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.redpacket" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <!-- END OF CNY PROMOTION -->               
                <div class="modal fade fwdiscover-modal" id="offer1-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer1" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offer1.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer1.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer1.subtitle3" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer1.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer1.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer1.bullet4" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer1.bullet5" bundle="${msg}" /></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-first"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer1" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <div class="modal fade fwdiscover-modal" id="offer2-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offer2.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer2.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer2.subtitle3" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer2.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer2.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer2.bullet4" bundle="${msg}" /></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-second"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer2" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <div class="modal fade fwdiscover-modal" id="offer3-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer3" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offer3.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer3.subtitle2" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer3.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer3.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer3.bullet4" bundle="${msg}" /></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-third"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer3" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <div class="modal fade fwdiscover-modal" id="offer4-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer4" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offer4.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer4.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer4.subtitle3" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer4.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer4.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer4.bullet3" bundle="${msg}" /></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-fourth"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer4" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <div class="modal fade fwdiscover-modal" id="offer5-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer5" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.offer5.subtitle1" bundle="${msg}" /> <span class="price"><fmt:message key="Fanfare.landingpage.offer5.subtitle2" bundle="${msg}" /></span> <span class="italic"><fmt:message key="Fanfare.landingpage.offer5.subtitle3" bundle="${msg}" /></span></p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer5.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer5.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer5.bullet3" bundle="${msg}" /></li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-fifth"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer5" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <!-- end 5 plans -->
				<!-- Hotel Voucher Plan Start -->
				<!-- Offer 311 -->
                <div class="modal fade fwdiscover-modal" id="offer-311-detail" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer314.HotelName" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer314.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer314.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer314.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
                                </li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-offer311"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel314" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
				<!-- Offer 312 -->
                <div class="modal fade fwdiscover-modal" id="offer-312-detail" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer315.HotelName" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer315.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer315.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer315.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
                                </li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-offer312"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel315" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
				<!-- Offer 313 -->
                <div class="modal fade fwdiscover-modal" id="offer-313-detail" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer316.HotelName" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer316.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer316.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer316.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
                                </li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-offer313"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel316" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
				<!-- Offer 314 -->
                <div class="modal fade fwdiscover-modal" id="offer-314-detail" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer317.HotelName" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer317.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer317.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer317.bullet3" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
                                </li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-offer314"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel317" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
				<!-- Offer 315 -->
                <div class="modal fade fwdiscover-modal" id="offer-315-detail" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offer318.HotelName" bundle="${msg}" /></p>
                            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

                            <ul>
                                <li><fmt:message key="Fanfare.landingpage.offer318.bullet1" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offer318.bullet2" bundle="${msg}" /></li>
                                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                                	<a target="_blank" href="<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
                                	<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part3" bundle="${msg}" />
                                </li>
                            </ul>

                            <div class="details-button-holder text-center">
                                <button class="details-btn modal-grab-button" id="modal-grab-button-offer315"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                            </div>

                            <div class="terms-and-condition">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel318" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                                </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>                                                                				
				<!-- Hotel Voucher Plan End -->				
                <div class="modal fade fwdiscover-modal" id="offer-details-promotion-code" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"></p>

                            <div class="promo-code-holder">
                                <p class="text-center congrats"><fmt:message key="Fanfare.HotelOffer.Success.Title" bundle="${msg}" /></p>
                                <p class="note"><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle2" bundle="${msg}" /></p>
                            </div>

                            <div class="details-button-holder text-center">
                                <a class="url" href="" target="_blank"><button class="details-btn"><fmt:message key="Fanfare.clickdetail.lightbox3.button" bundle="${msg}" /></button></a>
                            </div>

                            <div class="terms-and-condition offer-details">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet3" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a class="offer-details-tnc" href="" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>

                <div class="modal fade fwdiscover-modal" id="offer-details-promotion-code-error-once" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="error-message">
                                <p><fmt:message key="Fanfare.clickdetail.lightbox5.subtitle1" bundle="${msg}" /></p>
                                <p class="lower close-modal-link"><fmt:message key="Fanfare.clickdetail.lightbox5.subtitle2" bundle="${msg}" /></p>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>

                <div class="modal fade fwdiscover-modal" id="offer-details-promotion-code-error-sold" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="error-message">
                                <p><fmt:message key="Fanfare.clickdetail.lightbox4.subtitle1" bundle="${msg}" /></p>
                                <p class="lower"><fmt:message key="Fanfare.clickdetail.lightbox4.subtitle2" bundle="${msg}" /></p>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>

                <!-- Hotel promotion code modal -->
                <div class="modal fade fwdiscover-modal" id="offer-details-hotel-voucher" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="promo-code-holder">
                                <p class="text-center congrats"><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle1" bundle="${msg}" /></p>
                                <p class="text-center headline1"><fmt:message key="Fanfare.HotelOffer.Success.Headline1" bundle="${msg}" /></p>
                                <p class="text-center headline2"><fmt:message key="Fanfare.HotelOffer.Success.Headline2" bundle="${msg}" /></p>
                            </div>

                            <div class="terms-and-condition offer-details">
                                <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                <ul>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet1" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.landingpage.HoteOffer.terms.bullet2" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part1" bundle="${msg}" /><a class="offer-details-tnc" href="" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet6.offer.part3" bundle="${msg}" /></li>
                                 </ul>
                            </div>

                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <!-- Hotel promotion code modal End -->
                                
				<!-- Hotel Description Modal -->
				<div id="hotel-description-modal" class="modal fade" role="dialog" aria-hidden="true">
				    <div class="modal-dialog">
				
					    <!-- Modal content-->
					    <div class="modal-content container">
					        <div class="modal-body">
					            <div id="hotel-description-carosuel" class="carousel slide" data-ride="carousel" data-interval="false">
								  <!-- Left and right controls -->
								  <div class="hotel-carosuel-control">							      
									  <div class="left-control">
										  <a class="" href="#hotel-description-carosuel" role="button" data-slide="prev">
										    <span class="carosuel-arrow-left" aria-hidden="true"></span>
										    <span id="previous-hotel-date"></span>
										    <span id="previous-hotel-name"></span>
										    <div class="clearfix"></div>
										  </a>									  
									  </div>
				                       <div id="hotel-carosuel-selected" class="carousel-description-container">
			                                <div id="hotel-lanuch-date" class="fanfare-date"></div>
				                       </div>
				                       <div class="right-control">
										  <a class="" href="#hotel-description-carosuel" role="button" data-slide="next">
										    <span class="carosuel-arrow-right"aria-hidden="true"></span>
										    <span id="next-hotel-name"></span>
										    <span id="next-hotel-date"></span>
										    <div class="clearfix"></div>
										  </a>
								  		</div>
								  	</div>
								  	<button type="button" class="top-close btn btn-default" data-dismiss="modal">&times;</button>
								  	<div class="clearfix"></div>						            
					            	<div class="carousel-inner" role="listbox">
						            	  <!-- slide March 11 -->
				                          <div class="hotel-description-carosuel-container item active">
				                                <div class="hotel-description-left-wrapper">				                                
	                                                <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/one-world-icon.png" class="hotel-icon img-responsive"></div>		                                
				                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-oneworld-mobile.png" class="img-responsive hidden-lg hidden-md">
	                                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-oneworld-desktop.png" class="img-responsive hidden-xs hidden-sm">

	                                                <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar14.HotelName" bundle="${msg}" /></div>
				                                </div>
	                                            <div class="hotel-description-right-wrapper">
	                                                <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar14.Url" bundle="${msg}" />">
	                                                	<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
	                                                    <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar14.Addr" bundle="${msg}" /></span>
	                                                </a>
	                                                <div class="clearfix"></div>
	                                                <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar14.Detail" bundle="${msg}" /></div>
	                                            </div>
	                                            <div class="hotel-refer-wrapper">
	                                                <div class="hotel-refer">
	                                                    <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
	                                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
	                                                </div>
	                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                                <div class="clearfix"></div>
	                                            </div>	                                             			                                    
				                          </div>
				                          <!-- slide March 11 End -->
						            	  <!-- slide March 12 -->
				                          <div class="hotel-description-carosuel-container item selected">
				                                <div class="hotel-description-left-wrapper">
	                                                <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/vivatel-icon.png" class="hotel-icon vivatel-icon img-responsive"></div>		                                
				                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-vivatel-mobile.png" class="img-responsive hidden-lg hidden-md">
	                                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-vivatel-desktop.png" class="img-responsive hidden-xs hidden-sm">				                                				                            
	                                                <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar15.HotelName" bundle="${msg}" /></div>
				                                </div>
	                                            <div class="hotel-description-right-wrapper item">
	                                                <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar15.Url" bundle="${msg}" />">
	                                                	<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
	                                                    <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar15.Addr" bundle="${msg}" /></span>
	                                                </a>
	                                                <div class="clearfix"></div>
	                                                <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar15.Detail" bundle="${msg}" /></div>
	                                            </div>
	                                            <div class="hotel-refer-wrapper">
	                                                <div class="hotel-refer">
	                                                    <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
	                                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
	                                                </div>
	                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                                <div class="clearfix"></div>
	                                            </div>	                                             			                                    
				                          </div>
				                          <!-- slide March 12 End -->
						            	  <!-- slide March 13 -->
				                          <div class="hotel-description-carosuel-container item">
				                                <div class="hotel-description-left-wrapper">
	                                                <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/shangri-la-rasa-penang-icon.png" class="hotel-icon img-responsive"></div>		                                
				                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-rasa-mobile.png" class="img-responsive hidden-lg hidden-md">
	                                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-rasa-desktop.png" class="img-responsive hidden-xs hidden-sm">
	                                                <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar16.HotelName" bundle="${msg}" /></div>
				                                </div>
	                                            <div class="hotel-description-right-wrapper">
	                                                <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar16.Url" bundle="${msg}" />">
	                                                	<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
	                                                    <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar16.Addr" bundle="${msg}" /></span>
	                                                </a>
	                                                <div class="clearfix"></div>
	                                                <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar16.Detail" bundle="${msg}" /></div>
	                                            </div> 
	                                            <div class="hotel-refer-wrapper">
	                                                <div class="hotel-refer">
	                                                    <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
	                                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
	                                                </div>
	                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                                <div class="clearfix"></div>
	                                            </div>	                                            			                                    
				                          </div>
				                          <!-- slide March 13 End -->
						            	  <!-- slide March 14 -->
				                          <div class="hotel-description-carosuel-container item">
				                                <div class="hotel-description-left-wrapper">
	                                                <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/goldensands-penang-icon.png" class="hotel-icon img-responsive"></div>		                                
				                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-golden-mobile.png" class="img-responsive hidden-lg hidden-md">
	                                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-golden-desktop.png" class="img-responsive hidden-xs hidden-sm">				                                
				                                
	                                                <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar17.HotelName" bundle="${msg}" /></div>
				                                </div>
	                                            <div class="hotel-description-right-wrapper">
	                                                <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar17.Url" bundle="${msg}" />">
	                                                	<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
	                                                    <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar17.Addr" bundle="${msg}" /></span>
	                                                </a>
	                                                <div class="clearfix"></div>
	                                                <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar17.Detail" bundle="${msg}" /></div>
	                                            </div>
	                                            <div class="hotel-refer-wrapper">
	                                                <div class="hotel-refer">
	                                                    <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
	                                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
	                                                </div>
	                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                                <div class="clearfix"></div>
	                                            </div>	                                             			                                    
				                          </div>
				                          <!-- slide March 14 End -->
						            	  <!-- slide March 15 -->
				                          <div class="hotel-description-carosuel-container item">
				                                <div class="hotel-description-left-wrapper">
	                                                <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/traders-icon.png" class="hotel-icon img-responsive"></div>		                                
				                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-traders-mobile.png" class="img-responsive hidden-lg hidden-md">
	                                                <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-traders-desktop.png" class="img-responsive hidden-xs hidden-sm">
	                                                <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.Mar18.HotelName" bundle="${msg}" /></div>
				                                </div>
	                                            <div class="hotel-description-right-wrapper">
	                                                <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar18.Url" bundle="${msg}" />">
	                                                	<img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
	                                                    <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar18.Addr" bundle="${msg}" /></span>
	                                                </a>
	                                                <div class="clearfix"></div>
	                                                <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Mar18.Detail" bundle="${msg}" /></div>
	                                            </div>
	                                            <div class="hotel-refer-wrapper">
	                                                <div class="hotel-refer">
	                                                    <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
	                                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
	                                                </div>
	                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                                                <div class="clearfix"></div>
	                                            </div>  	                                             			                                    
				                          </div>			                          
				                          <!-- slide March 15 End -->
									  </div>								  			                          			                          			                          			                          			                          					               
					            </div>					            
					        </div>					        
					    </div>
				
				    </div>
				</div>                
                <!-- Hotel Description Modal End -->
                <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/to-top.jpg"></a> 
            </div>
            <!-- FOOTER -->
        </div>
        <!-- JS INCLUDES -->
        <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/fwdiscover/jquery.countdown.min.js"></script>
        <script type="text/javascript">
        var slide1Nav = {
        	Date: '<fmt:message key="Fanfare.Hotel.Carousel.Mar14.Date" bundle="${msg}" />',
        	LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar18.Date" bundle="${msg}" />',
        	RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar15.Date" bundle="${msg}" />',
        	LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar18.HotelName" bundle="${msg}" />',
        	RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar15.HotelName" bundle="${msg}" />'
        };
		var slide2Nav = {
		    Date: '<fmt:message key="Fanfare.Hotel.Carousel.Mar15.Date" bundle="${msg}" />',
		    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar14.Date" bundle="${msg}" />',
		    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar16.Date" bundle="${msg}" />',
		    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar14.HotelName" bundle="${msg}" />',
		    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar16.HotelName" bundle="${msg}" />'
		};
		var slide3Nav = {
		    Date: '<fmt:message key="Fanfare.Hotel.Carousel.Mar16.Date" bundle="${msg}" />',
		    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar15.Date" bundle="${msg}" />',
		    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar17.Date" bundle="${msg}" />',
		    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar15.HotelName" bundle="${msg}" />',
		    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar17.HotelName" bundle="${msg}" />'
		};
		var slide4Nav = {
		    Date: '<fmt:message key="Fanfare.Hotel.Carousel.Mar17.Date" bundle="${msg}" />',
		    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar16.Date" bundle="${msg}" />',
		    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar18.Date" bundle="${msg}" />',
		    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar16.HotelName" bundle="${msg}" />',
		    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar18.HotelName" bundle="${msg}" />'
		};
		var slide5Nav = {
		    Date: '<fmt:message key="Fanfare.Hotel.Carousel.Mar18.Date" bundle="${msg}" />',
		    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar17.Date" bundle="${msg}" />',
		    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.Mar14.Date" bundle="${msg}" />',
		    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar17.HotelName" bundle="${msg}" />',
		    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.Mar14.HotelName" bundle="${msg}" />'
		};        
        function assignHotelNav(slideNav){
        	//console.log(slideNav);
            $('#previous-hotel-name').html(slideNav.LeftNavHotel);
            $('#previous-hotel-date').html(slideNav.LeftNavDate);
            $('#hotel-lanuch-date').html(slideNav.Date);
            $('#next-hotel-date').html(slideNav.RightNavDate);
            $('#next-hotel-name').html(slideNav.RightNavHotel);
        }
        $( document ).ajaxComplete(function() {
            $('body').css("display","block");
        });
        $(window).load(function() {
            $('body').css("display","block");
        });
        $(document).ready(function() { 
            var carouselSlideIndex = 0;
            if(<%=hotelVoucherCampaignId%>==15) carouselSlideIndex = 1;
            if(<%=hotelVoucherCampaignId%>==16) carouselSlideIndex = 2;
            if(<%=hotelVoucherCampaignId%>==17) carouselSlideIndex = 3;
            if(<%=hotelVoucherCampaignId%>==18 ||<%=hotelVoucherCampaignId%>==-1) carouselSlideIndex = 4;
            $('#hotel-voucher-carousel').slick({
                infinite: true,
                initialSlide: carouselSlideIndex,
                arrows: true,
                speed: 300,
                prevArrow: '<button type="button" class="slick-prev arrow-left">Previous</button>',
                nextArrow: '<button type="button" class="slick-next arrow-right">Next</button>',
                slidesToShow: 1,
                mobileFirst: true,
                responsive: [
                  {
                    breakpoint: 768,
                    settings: {
                      initialSlide: carouselSlideIndex,
                      slidesToShow: 3,
                      slidesToScroll: 1
                    }
                  },                                 
                  {
                    breakpoint: 1600,
                    settings: {
                      initialSlide: 0,
                      arrows: false,  
                      slidesToShow: 5
                    }
                  }
                  // You can unslick at a given breakpoint now by adding:
                  // settings: "unslick"
                  // instead of a settings object
                  ]                   
            });
            /* IE9 slick carousel custom arrow btn border fix
               Removed border style in slick-theme.css
            */            
            if(msieversion != 9){
                $('#hotel-voucher-carousel').addClass('border-fix');
                $('#hotel-voucher-carousel').addClass('border-fix');
            }
        	$('#hotel-description-modal').on('hide.bs.modal', function () {
        		$('.modal-backdrop').remove();
        	}) 
        	$('#hotel-description-carosuel').on('slid.bs.carousel', function () {
        		  // This variable contains all kinds of data and methods related to the carousel
        		  var carouselData = $(this).data('bs.carousel');
        		  // EDIT: Doesn't work in Boostrap >= 3.2
        		  var currentIndex = carouselData.getActiveIndex();
        	      // For in Boostrap >= 3.2
        		  //var currentIndex = carouselData.getItemIndex(carouselData.$element.find('.item.active'));
        		  var total = carouselData.$items.length; 
        		  //console.log(text);
        		  console.log(currentIndex);
                  switch (currentIndex) {
                  case 0:
                      assignHotelNav(slide1Nav);
                      break;
                  case 1:
                      assignHotelNav(slide2Nav);
                      break;
                  case 2:
                      assignHotelNav(slide3Nav);
                      break;
                  case 3:
                      assignHotelNav(slide4Nav);
                      break;
                  case 4:
                      assignHotelNav(slide5Nav);
                      break;
                  }    
        	});
        	$('#hotel-description-modal').on('show.bs.modal', function () {
        		var carouselData = $('#hotel-description-carosuel').data('bs.carousel');
        		var currentIndex = carouselData.getActiveIndex();
      		  	var total = carouselData.$items.length;  
    		  	//console.log(text);
    		  	//console.log(currentIndex);
				switch (currentIndex + 1) {
				    case 1:
				    	assignHotelNav(slide1Nav);
				        break;
				    case 2:
				    	assignHotelNav(slide2Nav);
				        break;
				    case 3:
				    	assignHotelNav(slide3Nav);
				        break;
				    case 4:
				    	assignHotelNav(slide4Nav);
				        break;
				    case 5:
				    	assignHotelNav(slide5Nav);
				        break;
				}		  	
        	});        	
            //$(".plan-details-box").css("display","block")
            //var serverTime = new Date("2016-02-03 11:58:00");
            /*var serverTime = new Date();
            serverTime = serverTime.setMinutes(serverTime.getMinutes()+1);
            console.log(serverTime);
            $('#paused-Clock').countdown(serverTime)
            .on('finish.countdown', function(event){
                //alert("hehe");
                $( ".fwdiscover-plan" ).each(function() {
                       $( this ).removeClass( "paused-plan" );
                });
            })
            .on('update.countdown', function(event){
                $(this).html(event.strftime('%H:%M:%S'));
                console.log("ticking");             
            });*/          
            if(isMobile){
                $(".carousel-item-container").click(function(){
                    itemTop = $('.hotel-voucher-carousel-wrapper').offset();
                    $("#hotel-description-modal").on('show.bs.modal', function () {
                        $('body').css("position", "inital");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);      
                    });
                    $("#hotel-description-modal").on('hide.bs.modal', function () {
                        //alert(itemTop.top);
                        $('body').css("position", "initial");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);
                        //$('body').css("position", "relative");
                    });
                    $("#hotel-description-modal").on('hidden.bs.modal', function () {
                        /*($('body').attr("style", "");
                        if((navigator.userAgent.match(/iPad/i))) { 
                            $('body').addClass("hidden-show");
                            
                        }*/                        
                    });         
                });            	
                $(".fwdiscover-plan .details-btn").click(function(){
                    itemTop = $(this).parents(".fwdiscover-plan").offset();
                    $(".fwdiscover-modal").on('show.bs.modal', function () {
                        $('body').css("position", "inital");
                        //$('body').css("position", "fixed");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);      
                    });
                    $(".fwdiscover-modal").on('hide.bs.modal', function () {
                        //alert(itemTop.top);
                        $('body').css("position", "initial");
                        $('body').animate({scrollTop: itemTop.top - 60}, 0);
                        //$('body').css("position", "relative");
                    });
                    $(".fwdiscover-modal").on('hidden.bs.modal', function () {
                        /*$('body').attr("style", "");*/
                    });         
                });
            }

            //adjust CNY offer carousel-inner
            if (<%=(isCNYOffer)?true:false%>){
                $('#myCarousel-fwdiscover .carousel-inner').css('width', '70%');
                $('#myCarousel-fwdiscover .carousel-inner .desktop-img-align').css('width', '16.6%');
            }
        });
        
        if(getWidth() > 991) {
            $('.page-fwdiscover .fwdiscover-footer .terms-and-condition .message img.mobile').addClass('hidden');
        } else {
            $('.page-fwdiscover .fwdiscover-footer .terms-and-condition .message img.desktop').addClass('hidden');
        }
        
        $("#myCarousel-fwdiscover .carousel-inner .item a").click(function(){
            var temp = $(this).attr('href');
            var des = temp.substring(1, temp.length);

            if(getWidth()<992) {
                $('html, body').animate({
                    scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.fwdiscover-plan').find('.plan-details-box').height()-60)
                }, 1000);
            }
            else {
                $('html, body').animate({
                    scrollTop: $('[name="'+des+'"]').offset().top - ($('[name="'+des+'"]').parents('.fwdiscover-plan').find('.plan-details-box').height()+60 + $('.navbar-fixed-top').height())
                }, 1000);
            }
        });

        $("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").click(function(){
            $(this).parent().find('a').trigger('click');
        });

        $("#myCarousel-fwdiscover .carousel-inner .item a").mouseover(function() {
            $("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").addClass('hidden');
            $(this).next('.gray-hover').removeClass('hidden');
        });

        $("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").mouseleave(function() {
            $(this).addClass('hidden');
        });
        
        
        //modals
        <%String username = (String) session.getAttribute("username");%>
        $('#modal-grab-button').click(function(){
            if('<%=username%>' == 'null') {
                $('.modal').modal('hide');
                $('#loginpopup').modal('show');
            }else {
                $('.modal').modal('hide');
                $('#offer-details-promotion-code .title').html('<fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" />');
                $('#offer-details-promotion-code').modal('show');
            }
        });
        
        $("#cny-plan-button").on('click', function(){
            $('#offerCny-details').modal('show');
        });
        $('#modal-grab-button-cny').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("13");
            }else {
                assignPromoCode("13");
            }
        });
        /* Promote code assign and Loginbox pop for Hotel Voucher*/
        $('#modal-grab-button-offer311').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("<%=hotelVoucherCampaignId%>");
            }else {
                assignPromoCode("<%=hotelVoucherCampaignId%>");
            }
        });         
        $('#modal-grab-button-offer312').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("<%=hotelVoucherCampaignId%>");
            }else {
                assignPromoCode("<%=hotelVoucherCampaignId%>");
            }
        }); 
        $('#modal-grab-button-offer313').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("<%=hotelVoucherCampaignId%>");
            }else {
                assignPromoCode("<%=hotelVoucherCampaignId%>");
            }
        }); 
        $('#modal-grab-button-offer314').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("<%=hotelVoucherCampaignId%>");
            }else {
                assignPromoCode("<%=hotelVoucherCampaignId%>");
            }
        });
        $('#modal-grab-button-offer315').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("<%=hotelVoucherCampaignId%>");
            }else {
                assignPromoCode("<%=hotelVoucherCampaignId%>");
            }
        });
        /* Promote code assign and Loginbox pop for Hotel Voucher End*/
        
        $("#first-plan-button").on('click', function(){
            $('#offer1-details').modal('show');
        });
        $('#modal-grab-button-first').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("5");
            }else {
                assignPromoCode("5");
            }
        });
        
        $("#second-plan-button").on('click', function(){
            $('#offer2-details').modal('show');
        });
        $('#modal-grab-button-second').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("6");
            }else {
                assignPromoCode("6");
            }
        });
        
        $("#third-plan-button").on('click', function(){
            $('#offer3-details').modal('show');
        });
        $('#modal-grab-button-third').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("7");
            }else {
                assignPromoCode("7");
            }
        });
        
        $("#fourth-plan-button").on('click', function(){
            $('#offer4-details').modal('show');
        });
        $('#modal-grab-button-fourth').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("8");
            }else {
                assignPromoCode("8");
            }
        });
        
        $("#fifth-plan-button").on('click', function(){
            $('#offer5-details').modal('show');
        });
        $('#modal-grab-button-fifth').click(function(){
            if('<%=username%>' == 'null') {
                loginpopup("9");
            }else {
                assignPromoCode("9");
            }
        });

        $(".fwdiscover-modal .close-modal").on('click', function(){
            $('.modal').modal('hide');
        });
        
        $(".close-modal-link").on('click', function(){
            $('.modal').modal('hide');
        });

        $(".close-modal").on('click', function(){
            if((navigator.userAgent.match(/iPad/i))) { 
                $('body').addClass("hidden-show");
                
            }
        })
        
        $("#myDropdown").on('click', function(){
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/campaign/setChooseCampaign",
                data : {},
                async : false,
                success : function(data) {
                }
            });
        });
        
        function loginpopup(campaignId) {
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/campaign/setChooseCampaign",
                data : {campaignId:campaignId},
                async : false,
                success : function(data) {
                    $('.modal').modal('hide');
                    $('#loginpopup').modal('show');
                    if((navigator.userAgent.match(/iPad/i))) { 
                        $('body').addClass("hidden-show");
                    }
                }
            });
        }

        function assignPromoCode(campaignId) {
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/campaign/assignPromoCode",
                data : {campaignId:campaignId},
                async : false,
                success : function(data) {
                	console.log(data);
                    $('.modal').modal('hide');
                    var key = "Fanfare.offername"+data["index"];
                    var tncKey = "Fanfare.offer.tnc"+data["index"];
                    var fmt = getBundle(getBundleLanguage, key);
                    var fmtTnc = '<%=request.getContextPath()%>/' + getBundle(getBundleLanguage, tncKey);
                    if(data["result"]=="success"){
                        if(<%=hotelVoucherCampaignId>=14 && hotelVoucherCampaignId<=18%>){
                            $('#offer-details-hotel-voucher').modal('show');
                            $('#offer-details-hotel-voucher .terms-and-condition').find(".offer-details-tnc").attr('href', fmtTnc);                        	
                        }else{
                            $('.promo-code-holder .code').html(data["promoCode"]);
                            $('#offer-details-promotion-code').modal('show');
                            $('#offer-details-promotion-code .modal-content').children(".title").html(fmt);
                            $('#offer-details-promotion-code .terms-and-condition').find(".offer-details-tnc").attr('href', fmtTnc);                        
                            setPlanLink(campaignId, data["promoCode"]);                         
                        }
                    }else if(data["result"]=="duplicated") {
                        $('#offer-details-promotion-code-error-once').modal('show');
                        if(<%=hotelVoucherCampaignId<13%>){
	                        $('#offer-details-promotion-code-error-once .modal-content').children(".title").html(fmt);
	                        setPlanLink(campaignId, data["promoCode"]);
                        }
                    }else if(data["result"]=="notlogin") {
                        loginpopup(campaignId);
                    }else{
                        $('#offer-details-promotion-code-error-sold').modal('show');
                        if(<%=hotelVoucherCampaignId<=13%>){
                            $('#offer-details-promotion-code-error-sold .modal-content').children(".title").html(fmt);
                        }
                    }
                    updateAllPromoCodeCount();
                }
            });
        }

        function updateAllPromoCodeCount() {
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/campaign/getAllPromoCodeCount",
                async : false,
                success : function(data) {
                    $(".fwdiscover-plan .promo-desc .holder .count").each(function(index,domEle){
                        $(this).html(data["count"+index]);
                    });
                    if((navigator.userAgent.match(/iPad/i))) { 
                        $('body').addClass("hidden-show");
                    }
                }
            });
        }
        
        function setPlanLink(campaignId, code) {
            var link="";
            if("5"==campaignId){
                link="travel-insurance?product=annual&promo="+code;
            }else if("6"==campaignId){
                link="travel-insurance?promo="+code;
            }else if("7"==campaignId){
                link="travel-insurance?promo="+code;
            }else if("8"==campaignId){
                link="home-insurance?promo="+code;
            }else if("9"==campaignId){
                link="working-holiday-insurance?promo="+code;
            }else if("13"==campaignId){
                link="savings-insurance";
            }
            $("#offer-details-promotion-code .modal-content .details-btn").on('click', function(){
                $('#offer-details-promotion-code .url').attr('href', '<%=request.getContextPath()%>/${language}/' + link);                      
            });
        }

        $("#countdown")
           .countdown("<%=countDownDate%>", function(event) {
           //.countdown("2016/02/16", function(event) {
           //.countdown("2016/03/15", function(event) {    
            $('#countdown-days').text(
              event.strftime('%D')
            );

            $('#countdown-hours').text(
              event.strftime('%H')
            );

            $('#countdown-minutes').text(
              event.strftime('%M')
            );

            $('#countdown-seconds').text(
              event.strftime('%S')
            );

       });

        $(window).load(function () {
            $('#offer-announce').modal('show');
            if(msieversion() < 1) {
                carouselImgHeight();
            }
            $("#loginpopup").css("background", "rgba(6, 29, 42, 0.8)");
            if('<%=username%>' != 'null' && '<%=request.getAttribute("chooseIndex") %>' != 'null') {
                $('.modal').modal('hide');
                $('#offer-details-promotion-code').find(".title:first").html('<fmt:message key="Fanfare.offername${chooseIndex}" bundle="${msg}" />');
                if('<%=request.getAttribute("chooseCode")%>'=="failed" || '<%=request.getAttribute("chooseCode")%>'=="error"){
                    $('#offer-details-promotion-code-error-sold').modal('show');
                }else if('<%=request.getAttribute("chooseCode")%>'=="duplicated") {
                    $('#offer-details-promotion-code-error-once').modal('show');
                }else{
                    $('.promo-code-holder .code').html('<%=request.getAttribute("chooseCode")%>');
                    $('#offer-details-promotion-code').modal('show');
                    setPlanLink("${chooseId}", '<%=request.getAttribute("chooseCode")%>');
                }
            }
        });
        
        if(getWidth()>991) {
            $('#myCarousel-fwdiscover').removeClass('carousel slide');
            $('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('desktop-img-align');
            $('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('col-xs-4');
            $('#myCarousel-fwdiscover .carousel-inner .item').children().removeClass('row');
        

            $('#myCarousel-footer').removeClass('carousel slide');
            $('#myCarousel-footer .carousel-inner').children().wrap('<div class="col-md-4"></div>');
        }

        function carouselImgHeight() {
            if(getWidth()<992) {
                var list = new Array();
                $('#myCarousel-fwdiscover .carousel-inner .item.active .col-xs-4 img').each(function() {
                    var height = $(this).height();
                    list.push(height);
                });
                var newHeight = Math.min.apply( Math, list );
                $('#myCarousel-fwdiscover .carousel-inner .item .col-xs-4 img').css('height',newHeight+"px");
            }
        }
        function msieversion() {
            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0) { // If Internet Explorer, return version number
                return parseInt(ua.substring(msie + 5, ua.indexOf(".", msie)));
            } else { // If another browser, return 0
                return 0;
            }
        }        
        </script>
    </body>
</html>