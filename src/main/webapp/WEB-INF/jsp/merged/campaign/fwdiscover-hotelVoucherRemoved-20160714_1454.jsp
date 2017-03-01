<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Date,com.ifwd.fwdhk.util.WebServiceUtils,com.ifwd.fwdhk.controller.UserRestURIConstants" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
    boolean isSaleActiveClass = true;
    boolean isEservicesActiveClass = false;
%>

<%-- fwdiscover_jspLogic.jsp --%>
<%-- /fwdiscover_jspLogic.jsp --%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles-fwdiscover.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slick.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/slick-theme.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/slick.min.js"></script>
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
                            <p ng-bind-html="pageContent.description.part1[currentLang]"></p>
                            <p>
                                <span ng-bind-html="pageContent.description.part2[currentLang]"></span>
                                <span class="grab" ng-bind-html="pageContent.description.part3[currentLang]"></span>
                            </p>
                            <p class="register">
                                <span ng-bind-html="pageContent.register.part1[currentLang]"></span>
                                <a ng-href="<%=request.getContextPath()%>/{{ pageContent.register.url[currentLang] }}" ng-bind-html="pageContent.register.part2[currentLang]"></a>
                                <span ng-bind-html="pageContent.register.part3[currentLang]"></span>
                            </p>
                        </div>

                        <div class="fwdiscover-timer pull-right">
                            <p class="hurry"><%=offerCountDownLabel%></p>
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
                <% if (isRegPromo == false) { %>
                <div class="hotel-voucher-carousel-wrapper">
	                <div class="hotel-voucher-carousel-title-wrapper">
	                    <div class="Carousel-title"><fmt:message key="Fanfare.Hotel.Carousel.Title" bundle="${msg}" /></div>
	                    <div class="Carousel-subtitle"><fmt:message key="Fanfare.Hotel.Carousel.SubTitle" bundle="${msg}" /></div>
	                </div>
	                <div id="hotel-voucher-carousel" class="">
		                  <div class="carousel-item-container first<%=hotelVoucherCampaignId==14?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="0">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/c-bayview.jpg" class="img-responsive">
			                        <div class="carousel-description-container">
			                              <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.1.Date" bundle="${msg}" /></div>
			                              <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.1.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==15?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="1">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/c-subang.jpg" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.2.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.2.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==16?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="2">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/c-regency.jpg" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.3.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.3.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==17?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="3">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/c-lanson.jpg" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.4.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name long-hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.4.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>
		                  </div>
		                  <div class="carousel-item-container<%=hotelVoucherCampaignId==18?" selected":"" %>">
		                        <div class="hotel-item-wrapper" data-toggle="modal" data-target="#hotel-description-modal,#hotel-description-carosuel" data-slide-to="4">
			                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/c-ming.jpg" class="img-responsive">
			                        <div class="carousel-description-container">
		                                  <div class="fanfare-date"><fmt:message key="Fanfare.Hotel.Carousel.5.Date" bundle="${msg}" /></div>
		                                  <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.5.HotelName" bundle="${msg}" /></div>
			                        </div>
		                        </div>
		                  </div>
	                </div>
	                <div class="clearfix"></div>
                </div>
                <div class="sponsor-logo-wrapper">
                    <div class="sponsor-text">
                        <fmt:message key="Fanfare.Hotel.Sponsor.Text" bundle="${msg}" />
                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/agoda-logo.png" class="img-responsive">
                        </a>
                    </div>
                </div>
                <% } else if(isRegPromo == true && isRegSpecial == false) { %>
                <!-- #myCarousel-fwdiscover -->
                <div id="myCarousel-fwdiscover" class="carousel slide fwdiscover-container">
                    <!-- miniCarousel items -->
                    <div class="carousel-inner clearfix">
                        <div class="item" ng-repeat="items in miniCarousel.offerItems" ng-class="{ 'active': $first }">
                            <div class="row">
                                <div class="col-xs-4" ng-repeat="item in items | filter: { isActive: true }" ng-style="{ 'width': miniCarousel.config.current.gutterWidth }">
                                    <a href="#offer{{item._id}}" du-smooth-scroll du-scrollspy offset="0" ng-mouseenter="miniCarousel.config.desktop.hoverHidden[item._id] = false" ng-mouseleave="miniCarousel.config.desktop.hoverHidden[item._id] = true"> <img class="img-responsive" ng-src="<%=request.getContextPath()%>/{{ item.miniCarousel.img[currentLang] }}"> </a>
                                    <div class="gray-hover hidden-xs hidden-sm" ng-class="{'hidden': !!miniCarousel.config.desktop.hoverHidden[item._id]}">
                                        <p class="price" ng-bind-html="item.miniCarousel.price[currentLang]"></p>
                                        <p class="discount" ng-bind-html="item.miniCarousel.discount[currentLang]"></p>
                                        <br>
                                    </div>
                                    <span class="text-center">
                                        <p ng-bind-html="item.miniCarousel.desc[currentLang]"></p>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./miniCarousel -->

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
                </div>
                <!-- ./#myCarousel-fwdiscover -->
                <% } %>

                <!-- PLANS -->
                <div class="plans-holder fwdiscover-container">
                <!-- Hotel Promotion Start -->
                <!-- Hotel Promotion End -->
                <!-- CNY PROMOTION START -->
                <!-- CNY PROMOTION End -->
                <%
                    } else if (isRegSpecial==false && isRegPromo==true) {
                %>
                    <!-- json-generated: 1st-6th plan -->
                    <div id="offer{{item._id}}" ng-repeat="item in offersItems">
                        <div class="fwdiscover-plan <%=disableOfferClass%>">
                            <img ng-src="<%=request.getContextPath()%>/{{ item.bgImg.mobile[currentLang] }}" class="img-responsive hidden-md hidden-lg">
                            <img ng-src="<%=request.getContextPath()%>/{{ item.bgImg.desktop[currentLang] }}" class="img-responsive hidden-xs hidden-sm">

                            <div class="plan-details-box gray-bg" ng-class="{'left': isLeft( item.detailMsgBox.orientation ), 'right': !isLeft( item.detailMsgBox.orientation )}" ng-style="{'background-color': item.detailMsgBox.backgroundColor}">
                                <div class="plan-desc">
                                    <div class="upper-desc">
                                        <p class="title two-lines" ng-bind-html="item.title[currentLang]"></p>
                                        <p class="promo">
                                            <span ng-bind-html="item.subTitles.promo[currentLang]"></span>
                                            <span class="price" ng-bind-html="item.subTitles.amount[currentLang]"></span>
                                            <span class="italic" ng-bind-html="item.subTitles.discount[currentLang]"></span>
                                        </p>
                                    </div>
                                    <div class="lower-desc">
                                        <ul>
                                            <li ng-repeat="bulletMsg in item.bulletMsgs" ng-bind-html="bulletMsg[currentLang]"></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="desc-and-button-holder clearfix">
                                    <div class="promo-desc text-center">
                                        <div class="clearfix">
                                            <div class="holder">
                                                <p class="title" ng-bind-html="item.quota.action[currentLang]"></p>
                                                <p class="value count">${count1}</p>
                                            </div>
                                            <div class="holder date hidden-xs hidden-sm">
                                                <p class="title" ng-bind-html="item.end.action[currentLang]"></p>
                                                <p class="value date" ng-bind-html="item.end.timestamp | date:'MMMM'"></p>
                                                <p class="value date day" ng-bind-html="item.end.timestamp | date:'dd'"></p>
                                            </div>
                                            <div class="holder date hidden-md hidden-lg">
                                                <p class="title" ng-bind-html="item.end.action[currentLang]"></p>
                                                <p class="value date" ng-bind-html="item.end.timestamp | date:'MMMM'"></p>
                                                <p class="value date day" ng-bind-html="item.end.timestamp | date:'dd'"></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="details-button-holder text-center" name="offer{{item._id}}">
                                        <button class="clickme details-btn" id="{{item._codeName}}-plan-button" data-toggle="modal" data-target="offer{{item._id}}-details"><fmt:message key="Fanfare.landingpage.offer5.button" bundle="${msg}" /></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./json-generated: 1st-6th plan -->
                <% } %>
                <% } %>

                <!-- Hotel Partner Start -->
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
                    <!-- ./myCarousel -->

                </div>
                <!-- ./fwdiscover footer -->
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
                <!-- 6 plans -->
                <!-- CNY PROMOTION -->
                <div class="modal fade fwdiscover-modal" id="offerCny-details" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium" bundle="${msg}" /></p>
                            <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle1" bundle="${msg}" /></p>
                            <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle2" bundle="${msg}" /></span><br><span class="italic"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle3" bundle="${msg}" /></span></p>

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

                <!-- json-generated: modals -->
                <div ng-repeat="item in offersItems">
                    <div class="modal fade fwdiscover-modal" id="offer{{item._id}}-details" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <p class="title two-lines" ng-bind-html="item.title[currentLang]"></p>
                                <p class="promo">
                                    <span ng-bind-html="item.subTitles.promo[currentLang]"></span>
                                    <span class="price" ng-bind-html="item.subTitles.amount[currentLang]"></span>
                                    <span class="italic" ng-bind-html="item.subTitles.discount[currentLang]"></span>
                                </p>

                                <ul>
                                    <li ng-repeat="bulletMsg in item.bulletMsgs" ng-bind-html="bulletMsg[currentLang]"></li>
                                </ul>

                                <div class="details-button-holder text-center">
                                    <button class="details-btn modal-grab-button" id="modal-grab-button-{{item._codeName}}"><fmt:message key="Fanfare.grab" bundle="${msg}" /></button>
                                </div>

                                <div class="terms-and-condition">
                                    <p class="title"><fmt:message key="Fanfare.clickdetail.lightbox.terms" bundle="${msg}" /></p>
                                    <ul>
                                        <li ng-repeat="tnc in item.tncs" ng-bind-html="tnc[currentLang]"></li>
                                    </ul>
                                </div>

                                <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ./json-generated: modals -->

				<!-- Hotel Voucher Plan Start -->
				<!-- Hotel Voucher Plan End -->

                <div class="modal fade fwdiscover-modal" id="offer-details-promotion-code" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"></p>

                            <div class="promo-code-holder">
                                <p class="text-center congrats"><fmt:message key="Fanfare.clickdetail.lightbox3.subtitle1" bundle="${msg}" /></p>
                                <p class="code">FWD987654321</p>
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
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet4" bundle="${msg}" /></li>
                                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.bullet5" bundle="${msg}" /></li>
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
                <!-- Hotel promotion code modal End -->
				<!-- Hotel Description Modal -->
                <!-- Hotel Description Modal End -->
                <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/to-top.jpg"></a>
            </div>
            <!-- FOOTER -->
        </div>
        <!-- JS INCLUDES -->
        <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/fwdiscover/jquery.countdown.min.js"></script>

        <script type="text/javascript">

        <%-- angular --%>
        <%-- Friendly Reminder for developer: ng-app="fwdDemo" ng-controller="ctrlFwdiscover" is put into the <html> tag on the decorators/template_discover_ng.jsp --%>
        var app = angular.module('fwdDemo', [ 'ngSanitize', 'ngAnimate', 'duScroll' ]);

        app.run(function($rootScope, $location) {
            return $rootScope._ = _;                                            // Lodash is declarred in javascript already
        })
        .controller( 'ctrlFwdiscover', function( $scope, $http, $window, $location, $document ) {

            var currentLang = "<%= session.getAttribute( "uiLocale" ) %>";      // Define current language in javascript by the JSP uiLocale param
            $scope.currentLang = currentLang.trim();
            $scope.hover = [];
            $scope.isLeft = function(orientation) {
                if ( orientation == 'left' ) { return true; }
                if ( orientation != 'left' ) { return false; }
            };

            <%String username2 = (String) session.getAttribute("username");%>
            $scope.miniCarousel = {                                       // miniCarousel Configs
                'config': {
                    'mobile': {
                        'isMobile': null,
                        'numItemPerRow': 3                                                    // how many thumbnail item per row
                    },
                    'desktop': {
                        'isDesktop': null,
                        'hoverHidden': []
                    },
                    'current': {
                        'gutterWidth': ''                                                      // for buffer to view
                    }
                },
                'offerItems': [],                                        // DATA render to the View
            };

            var initMiniCourasel = function() {                                 // Supplementary for the modal clicking behaviors

                // if ( !_.isEmpty( $scope.offersItems ) ) {
                //
                //     var temp = '';
                //     for (i = 0; i < $scope.offersItems.length; i++) {
                //         console.log( '#offer' + $scope.offersItems[i]._id + '-details');
                //         $(document).on("click", "#" + $scope.offersItems[i]._codeName + "-plan-button", function() {
                //             temp = '';
                //             temp = '#offer' + $scope.offersItems[i]._id + '-details';
                //             console.log("[i="+i+"] temp = "+ temp);
                //             $(temp).modal("show");
                //         });
                //         //
                //         // $(document).on("click", "#modal-grab-button-" + $scope.offersItems[i]._codeName, function() {
                //         //     if('<%=username2%>' == 'null') {
                //         //         loginpopup( $scope.offersItems[i]._config.loginpopup );
                //         //     } else {
                //         //         assignPromoCode( $scope.offersItems[i]._config.assignPromoCode );
                //         //     }
                //         // });
                //     }
                //
                // } else {
                //     console.error('Friendly reminder: "offersItems" is empty. Please check');
                // }

                $(document).on("click", "#first-plan-button", function() {
                	$('#offer1-details').modal('show');
                });
                $(document).on("click", "#second-plan-button", function() {
                    $('#offer2-details').modal('show');
                });
                $(document).on("click", "#third-plan-button", function() {
                    $('#offer3-details').modal('show');
                });
                $(document).on("click", "#fourth-plan-button", function() {
                    $('#offer4-details').modal('show');
                });
                $(document).on("click", "#fifth-plan-button", function() {
                	$('#offer5-details').modal('show');
                });

                $(document).on("click", "#modal-grab-button-first", function() {
                    if('<%=username2%>' == 'null') {
                        loginpopup("5");
                    }else {
                        assignPromoCode("5");
                    }
                });
                $(document).on("click", "#modal-grab-button-second", function() {
                    if('<%=username2%>' == 'null') {
                        loginpopup("6");
                    }else {
                        assignPromoCode("6");
                    }
                });
                $(document).on("click", "#modal-grab-button-third", function() {
                    if('<%=username2%>' == 'null') {
                        loginpopup("7");
                    }else {
                        assignPromoCode("7");
                    }
                });
                $(document).on("click", "#modal-grab-button-fourth", function() {
                    if('<%=username2%>' == 'null') {
                        loginpopup("8");
                    }else {
                        assignPromoCode("8");
                    }
                });
                $(document).on("click", "#modal-grab-button-fifth", function() {
                    if('<%=username2%>' == 'null') {
                        loginpopup("9");
                    }else {
                        assignPromoCode("9");
                    }
                });

                $(document).on('click', ".fwdiscover-modal .close-modal", function() {
                    console.log(".fwdiscover-modal .close-modal was clicked");
                    $('.modal').modal('hide');
                });
                $(document).on('click', ".close-modal-link", function() {
                    console.log(".close-modal-link was clicked");
                    $('.modal').modal('hide');
                });
                $(document).on('click', ".close-modal", function() {
                    console.log(".close-modal was clicked");
                    if((navigator.userAgent.match(/iPad/i))) {
                        $('body').addClass("hidden-show");
                    }
                });

                // $(document).on('click', "#sixth-plan-button", function(){
                //     // $("#sixth-plan-button").on('click', function(){
                //     $('#offer6-details').modal('show');
                // });
                // $(document).on("click", "#modal-grab-button-sixth", function() {
                //     // $('#modal-grab-button-sixth').click(function(){
                //     if('<%=username2%>' == 'null') {
                //         loginpopup("23");
                //     }else {
                //         assignPromoCode("23");
                //     }
                // });
            }
            var genArrObjTrue = function(obj) {
                var result = [];
                for (i = 0; i < obj.length+1; i++) {
                    if ( i == 0 ) {
                        result = [true];
                    } else {
                        result.push(true);
                    }
                }
                return result;
            }

            $http.get("<%=request.getContextPath()%>/resources/js/fwdiscover/fwdiscover_offers.json")
                .then(function(response) {
                    $scope.offersItems = response.data.fwdiscoverOffers;
                    $scope.pageContent = response.data.fwdiscoverPage;
                    var desktopGutterWidth = (100 / $scope.offersItems.length) + '%';
                    var mobileGutterWidth = (100 / $scope.miniCarousel.config.mobile.numItemPerRow) + '%';

                    $scope.miniCarousel.config.desktop.hoverHidden = genArrObjTrue($scope.offersItems);

                    $(document).ready(function() {
                        $(window).on("load resize",function(){
                            if(isMobile){
            	                if(window.innerHeight > window.innerWidth) // Portrait
            	                {
            	                	if ( getWidth() < 992 ) {
                                        $('#myCarousel-fwdiscover').addClass('carousel slide');
                                        $('#myCarousel-fwdiscover .carousel-inner .item').children().addClass('row');
                                        $('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('desktop-img-align');
                                        $('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('col-xs-4');
                                        $scope.$apply(function() {
                                            $scope.miniCarousel.config.current.gutterWidth = mobileGutterWidth;
                                            $scope.miniCarousel.config.mobile.isMobile = true;
                                            $scope.miniCarousel.config.desktop.isDesktop = false;
                                        });
                                    }
            	                }
            	                else // Landscape
            	                {
            	                    if ( getWidth() > 991 ) {
            	                        $('#myCarousel-fwdiscover').removeClass('carousel slide');
            	                        $('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('desktop-img-align');
            	                        $('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('col-xs-4');
            	                        $('#myCarousel-fwdiscover .carousel-inner .item').children().removeClass('row');
                                        $scope.$apply(function() {
                                            $scope.miniCarousel.config.current.gutterWidth = mobileGutterWidth;
                                            $scope.miniCarousel.config.mobile.isMobile = true;
                                            $scope.miniCarousel.config.desktop.isDesktop = false;
                                        });
            	                    }
            	                }
                    	} else {
                            if ( getWidth() > 991 ) {
                                $('#myCarousel-fwdiscover').removeClass('carousel slide');
                                $('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('desktop-img-align');
                                $('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('col-xs-4');
                                $('#myCarousel-fwdiscover .carousel-inner .item').children().removeClass('row');
                                $scope.$apply(function() {
                                    $scope.miniCarousel.config.current.gutterWidth = desktopGutterWidth;
                                    $scope.miniCarousel.config.mobile.isMobile = false;
                                    $scope.miniCarousel.config.desktop.isDesktop = true;
                                });
                            } else {
                                $('#myCarousel-fwdiscover').addClass('carousel slide');
                                $('#myCarousel-fwdiscover .carousel-inner .item .row').children().removeClass('desktop-img-align');
                                $('#myCarousel-fwdiscover .carousel-inner .item .row').children().addClass('col-xs-4');
                                $('#myCarousel-fwdiscover .carousel-inner .item').children().addClass('row');
                                $scope.$apply(function() {
                                    $scope.miniCarousel.config.current.gutterWidth = mobileGutterWidth;
                                    $scope.miniCarousel.config.mobile.isMobile = false;
                                    $scope.miniCarousel.config.desktop.isDesktop = true;
                                });
                            }
                    	}
                        // console.log( $scope.miniCarousel.config.current.gutterWidth );
                        });
                    });
                    $scope.miniCarousel.offerItems = _.chunk($scope.offersItems, $scope.miniCarousel.config.mobile.numItemPerRow);
                    initMiniCourasel();
                });

        });
        <%-- /angular --%>


        $( document ).ajaxComplete(function() {
            $('body').css("display","block");
        });
        $(window).load(function() {
            $('body').css("display","block");
        });

        $(document).ready(function() {
            <%-- script inside document.ready() - remark#1 --%>
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
			/*if (<%=(isRegPromo)?true:false%>){
                $('#myCarousel-fwdiscover .carousel-inner').css('width', '70%');
                $('#myCarousel-fwdiscover .carousel-inner .desktop-img-align').css('width', '16.6%');
            }*/

            if( window.location.href.indexOf("mar29=") > -1 ){
                $('.paused-plan').removeClass('paused-plan');
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

        // Hotel Voucher Plan >> Promote code assign and Loginbox pop for Hotel Voucher
        // ./Hotel Voucher Plan >> Promote code assign and Loginbox pop for Hotel Voucher

        /* Promote code assign and Loginbox pop for Hotel Voucher End*/
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
                    var key = "Fanfare.offername"+campaignId;
                    var tncKey = "Fanfare.offer.tnc"+campaignId;
                    var fmt = getBundle(getBundleLanguage, key);
                    var fmtTnc = '<%=request.getContextPath()%>/' + getBundle(getBundleLanguage, tncKey);
                    if(data["result"]=="success"){
                        if(/*false &&*/ <%=hotelVoucherCampaignId>=14 && hotelVoucherCampaignId<=18%>){
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
                        if(/*true ||*/ <%=hotelVoucherCampaignId<13%>){
	                        $('#offer-details-promotion-code-error-once .modal-content').children(".title").html(fmt);
	                        setPlanLink(campaignId, data["promoCode"]);
                        }
                    }else if(data["result"]=="notlogin") {
                        loginpopup(campaignId);
                    }else{
                        $('#offer-details-promotion-code-error-sold').modal('show');
                        if(/*true ||*/ <%=hotelVoucherCampaignId<=13%>){
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
                <%
                	if (hotelVoucherCampaignId >= 14 && hotelVoucherCampaignId <=18) {
				%>
                data : "hid=<%=hotelVoucherCampaignId%>",
				<%
                	}
                %>
                <%
	            	if (request.getParameter("savie")!=null) {
				%>
	            data : "savie=Y",
				<%
	            	}
	            %>
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
                link="savings-insurance?promo="+code;
            }else if("23"==campaignId){
                link="overseas-study-insurance?promo="+code;
            }
            $("#offer-details-promotion-code .modal-content .details-btn").on('click', function(){
                $('#offer-details-promotion-code .url').attr('href', '<%=request.getContextPath()%>/${language}/' + link);
            });
        }

        function setTnCLink(campaignId) {

            var tncKey = "link.tnc.fanfare.offer"+ campaignId;
            var fmtTnc = '<%=request.getContextPath()%>/' + getBundle(getBundleLanguage, tncKey);

            $('#offer-details-promotion-code .terms-and-condition').find(".offer-details-tnc").attr('href', fmtTnc);
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
		function setPlanName(campaignId){
            var planNameKey = "Fanfare.offername"+ campaignId;
            var fmtPlanName = getBundle(getBundleLanguage, planNameKey);
            $('#offer-details-promotion-code').find(".title:first").html(fmtPlanName);
		}
        $(window).load(function () {
            $('#offer-announce').modal('show');
            if(msieversion() < 1) {
                //carouselImgHeight();
            }
            $("#loginpopup").css("background", "rgba(6, 29, 42, 0.8)");
            if('<%=username%>' != 'null' && '<%=request.getAttribute("chooseIndex") %>' != 'null') {
                $('.modal').modal('hide');
                //$('#offer-details-promotion-code').find(".title:first").html('<fmt:message key="Fanfare.offername${chooseId}" bundle="${msg}" />');
                if('<%=request.getAttribute("chooseCode")%>'=="failed" || '<%=request.getAttribute("chooseCode")%>'=="error"){
                    $('#offer-details-promotion-code-error-sold').modal('show');
                }else if('<%=request.getAttribute("chooseCode")%>'=="duplicated") {
                    $('#offer-details-promotion-code-error-once').modal('show');
                }else{
                    if(/*false &&*/ <%=hotelVoucherCampaignId>=14 && hotelVoucherCampaignId<=18%>){
                        $('#offer-details-hotel-voucher').modal('show');
                        $('#offer-details-hotel-voucher .terms-and-condition').find(".offer-details-tnc").attr('href', '<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel${hotelVoucherCampaignId}" bundle="${msg}" />');
                    }else{
	                    $('.promo-code-holder .code').html('<%=request.getAttribute("chooseCode")%>');
	                    $('#offer-details-promotion-code').modal('show');
	                    setPlanName("${chooseId}");
	                    setPlanLink("${chooseId}", '<%=request.getAttribute("chooseCode")%>');
                        setTnCLink("${chooseId}");
                    }
                }
            }
        });


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
