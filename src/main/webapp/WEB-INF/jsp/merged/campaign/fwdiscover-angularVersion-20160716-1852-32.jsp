<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Date,com.ifwd.fwdhk.util.WebServiceUtils,com.ifwd.fwdhk.controller.UserRestURIConstants" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%!
    // JSP Declarations
    boolean isSaleActiveClass = true;
    boolean isEservicesActiveClass = false;
%>
<%
    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
    long current = System.currentTimeMillis();
    long cCurrent = System.currentTimeMillis(); // for hotel?
    long start = format.parse("2016-01-31").getTime() + 36000000; // 20170312T16:00:00 || fwdOfferPeriod.config.monthlyCampiagn.fanfareOfferAnnounce.start.timestamp
%>
<%
    int hotelVoucherCampaignId = Integer.parseInt(session.getAttribute("hotelVoucherCampaignId").toString());
    java.text.SimpleDateFormat cformat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    if (request.getParameter("hid")!=null && ((String)request.getParameter("hid")).length() > 0) {
        hotelVoucherCampaignId = Integer.parseInt((String)request.getParameter("hid"));
        if (hotelVoucherCampaignId == -1) {
            cCurrent = cformat.parse("2016-05-01 00:00:00").getTime();
        } else {
            cCurrent = cformat.parse("2016-04-21 00:00:00").getTime();
        }
    }

    if (request.getParameter("month")!=null && ((String)request.getParameter("month")).length() > 0) {
        int month = Integer.parseInt((String)request.getParameter("month"));
        if (month == 7) {
            cCurrent = cformat.parse("2016-07-31 14:59:59").getTime();
        } else {
            cCurrent = cformat.parse("2016-07-31 15:00:00").getTime();
        }
    }

    //hotel monthly campiagn display end time
    long hotelcEnd = cformat.parse("2016-04-30 14:59:59").getTime();    // fwdOfferPeriod.config.monthlyCampiagn.hotel.start.timestamp
    //hotel monthly campiagn display end time
    long hotelcStart = cformat.parse("2016-04-20 15:00:00").getTime();  // fwdOfferPeriod.config.monthlyCampiagn.hotel.end.timestamp
    //GI monthly campiagn display end time
    long cStart = cformat.parse("2016-07-31 14:59:59").getTime();       // fwdOfferPeriod.config.monthlyCampiagn.giProduct.start.timestamp

    String disableOfferClass = "";
    String countDownDate = "";
    String countDownDD = "";
    String countDownMM = "";
    String countDownDate_special = "2016-05-21 14:59:59";               // fwdOfferPeriod.config.countDown.special.timestamp
    String countDownDate_regular = "2016-07-31 14:59:59";               // fwdOfferPeriod.config.countDown.regular.timestamp
    String countDownDate_regular2 = "2016-06-30 14:59:59";              // fwdOfferPeriod.config.countDown.regular2.timestamp
    String lang = UserRestURIConstants.getLanaguage(request);
    String offerCountDownLabel = WebServiceUtils.getMessage("Fanfare.landingpage.timerword", lang);
    boolean isRegPromo = true;
    boolean isRegSpecial = false;

    if ( cCurrent <= hotelcEnd && cCurrent >= hotelcStart && (hotelVoucherCampaignId != -1 || hotelVoucherCampaignId == -1) ) {
        //  ==============================  JSP: HotelVoucher Offer Period  =================================
        //  ==============================  ./JSP: HotelVoucher Offer Period  =================================
    } else {
        // Regular Offer Period
        countDownDate = countDownDate_regular;
        // countDownDD = "31";
        // countDownMM = "July";

        //  ==============================  JSP: Special Offer Period  =================================
        //  ==============================  ./JSP: Special Offer Period  =================================

        //  ==============================  JSP: Regular Offer ends Period  =================================
        //  ==============================  ./JSP: Regular Offer ends Period  =================================
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
                                            <span class="number pull-left" ng-bind-html="cCurrent || dd"></span>
                                            <span class="month pull-right" ng-bind-html="cCurrent || MMM"></span>
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
                <div ng-if=>
                <!-- RegPromo: Fanfare.Hotel  -->
                <!-- ./RegPromo: Fanfare.Hotel  -->

                <% } else if(isRegPromo == true && isRegSpecial == false) { %>

                <div id="myCarousel-fwdiscover" class="carousel slide fwdiscover-container">

                    <!-- Json-generated: miniCarousel items -->
                    <div class="carousel-inner clearfix">
                        <div class="item" ng-repeat="items in miniCarousel.offerItems" ng-class="{ 'active': $first }">
                            <div class="row">
                                <div class="col-xs-4" ng-repeat="item in items | filter: { isActive: true }" ng-style="{ 'width': miniCarousel.config.current.gutterWidth }">
                                    <a href="#offer{{item._id}}" du-smooth-scroll du-scrollspy offset="0" ng-mouseenter="miniCarousel.config.desktop.hoverHidden[item._id] = false" ng-mouseleave="miniCarousel.config.desktop.hoverHidden[item._id] = true">
                                        <img class="img-responsive" ng-src="<%=request.getContextPath()%>/{{ item.miniCarousel.img[currentLang] }}">
                                        <div class="gray-hover hidden-xs hidden-sm" ng-class="{'hidden': !!miniCarousel.config.desktop.hoverHidden[item._id]}">
                                            <p class="price" ng-bind-html="item.miniCarousel.price[currentLang]"></p>
                                            <p class="discount" ng-bind-html="item.miniCarousel.discount[currentLang]"></p>
                                            <br>
                                        </div>
                                        <span class="text-center">
                                            <p ng-bind-html="item.miniCarousel.desc[currentLang]"></p>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./Json-generated: miniCarousel -->

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

                <% } %>

                <!-- PLANS -->
                <div class="plans-holder fwdiscover-container">

            <% if (isRegPromo == false) { %>
                <div ng-if="promoIsVisible.hotel">
                <!-- Hotel Promotion -->
                <!-- ./Hotel Promotion -->
                </div>
            <% } else { %>
                <%
                    if (isRegSpecial==true && isRegPromo==true) {
                %>
                <div ng-if="promoIsVisible.cny">
                <!-- CNY PROMOTION -->
                <!-- ./CNY PROMOTION -->
                </div>
                <%
                    } else if (isRegSpecial==false && isRegPromo==true) {
                %>
                <div ng-if="promoIsVisible.general">
                    <!-- Json-generated: 1st-6th plan -->
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
                    <!-- ./Json-generated: 1st-6th plan -->
                </div>
                <% } %>
            <% } %>

                <% if (isRegPromo == false) { %>
                <div ng-if="promoIsVisible.hotel">
                <!-- Hotel Partner -->
                <!-- ./Hotel Partner -->
                </div>
                <% } %>

                <!-- div.fwdiscover-footer -->
                <div class="fwdiscover-footer">
                    <!-- myCarousel-footer -->
                    <!-- ./#myCarousel-footer -->
                </div>
                <!-- ./div.fwdiscover-footer -->

    <%
        // if(current <= start) {
    %>
                <!-- fanfareOfferAnnounce Modal -->
                <div ng-if="current <= offerPeriod.config.monthlyCampiagn.fanfareOfferAnnounce.start" class="modal fade fwdiscover-modal" id="offer-announce" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <p class="title"><fmt:message key="Fanfare.offer.announce" bundle="${msg}" /></p>
                            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
                        </div>
                    </div>
                </div>
                <!-- ./fanfareOfferAnnounce Modal -->
    <%
        // }
    %>
                <!-- CNY PROMOTION: Modal -->
                <!-- ./CNY PROMOTION: Modal -->

                <!-- Json-generated: modals -->
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
                <!-- ./Json-generated: modals -->

				<!-- Hotel Voucher Plan -->
				<!-- ./Hotel Voucher Plan -->

                <!-- Fanfare -->
                <!-- ./Fanfare -->

                <!-- Hotel promotion code modal -->
                <!-- ./Hotel promotion code modal -->

				<!-- Hotel Description Modal -->
                <!-- ./Hotel Description Modal -->

                <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/to-top.jpg"></a>
            </div>
            <!-- FOOTER -->
        </div>
        <!-- ./page-fwdiscover -->

        <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/fwdiscover/jquery.countdown.min.js"></script>

        <script type="text/javascript">

        <%-- angular --%>
        <%-- Note >>> ng-app="fwdDemo" ng-controller="ctrlFwdiscover" is put into the <html> tag on the decorators/template_discover_ng.jsp --%>
        var app = angular.module('fwdDemo', [ 'ngSanitize', 'ngAnimate', 'duScroll' ]);
        app.run(function($rootScope, $location) {
            return $rootScope._ = _;                                            // Lodash is declarred in javascript already
        })
        .controller( 'ctrlFwdiscover', function( $scope, $http, $window, $location, $document ) {

            // -- declarVariable: from JSP --
            <%String username = (String) session.getAttribute("username");%>
            <%String username2 = (String) session.getAttribute("username");%>
            <%
                // long cCurrent = System.currentTimeMillis(); // countDownDD & countDownMM
                // long current = System.currentTimeMillis();
            %>

            var current = $scope.current = new Date(<%=cCurrent%>); // refer to countDown Date, Time & Logic in campaign
            var cCurrent = $scope.cCurrent = new Date(<%=cCurrent%>); // refer to countDown Date, Time & Logic in campaign

            var currentLang = "<%= session.getAttribute( "uiLocale" ) %>";      // Define current language in javascript by the JSP uiLocale param
            // -- ./declarVariable: from JSP --

            // -- declarVariable: for $scope --
            $scope.currentLang = currentLang.trim();
            $scope.hover = [];
            $scope.isLeft = function(orientation) {
                if ( orientation == 'left' ) { return true; }
                if ( orientation != 'left' ) { return false; }
            };
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
                'offerItems': [],                                               // DATA render to the View
            };
            // -- ./declarVariable: for $scope --

            // -- ngPrivateFunct: initMiniCourasel() --
            var initMiniCourasel = function() {                                 // Supplementary for the modal clicking behaviors

                if ( !_.isEmpty( $scope.offersItems ) ) {

                    // var temp = '';
                    // for (i = 0; i < $scope.offersItems.length; i++) {
                    //     console.log( '#offer' + $scope.offersItems[i]._id + '-details');
                    //     $scope.apply() {
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

                } else {
                    console.error('Friendly reminder: "offersItems" is empty. Please check');
                }
            }
            // -- ./ngPrivateFunct: initMiniCourasel() --

            // -- ngPrivateFunct: genArrObjTrue() --
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
            // -- ./ngPrivateFunct: genArrObjTrue() --

            // -- ngPrivateFunct: offersAJAXLoader() --
            var offersAJAXLoader = function(url) {
                $http.get(url)
                    .then(function(response) {
                        $scope.offersItems = response.data.fwdiscoverOffers;
                        $scope.offerPeriod = response.data.fwdOfferPeriod;
                        $scope.pageContent = response.data.fwdiscoverPage;

                        var isRegPromo = $scope.offerPeriod.config.isRegPromo;
                        var isRegSpecial = $scope.offerPeriod.config.isRegSpecial;
                        $scope.promoIsVisible = {
                            "hotel":    (isRegPromo == false) ? true : false,
                            "cny":      (isRegSpecial==true && isRegPromo==true) ? true : false,
                            "general":  (isRegSpecial==false && isRegPromo==true) ? true : false
                        }
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
            };
            // -- ./ngPrivateFunct: offersAJAXLoader() --

            // -- Initialize the custom-made ngPrivateFunct --
            offersAJAXLoader("<%=request.getContextPath()%>/resources/js/fwdiscover/fwdiscover_offers.json");
            // -- ./Initialize the custom-made ngPrivateFunct --
        });
        <%-- ./angular --%>

        // -- slide1-5Nav --
        // -- ./slide1-5Nav --

        $(document).ajaxComplete(function() {
            $('body').css("display","block");
        });
        $(window).load(function() {
            $('body').css("display","block");
        });
        $(document).ready(function() {
            // -- hotel-related JS --
        	// -- ./hotel-related JS --

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

            // JS .carousel-item-container && RegPromo: Fanfare.Hotel
            // ./JS .carousel-item-container && RegPromo: Fanfare.Hotel

            // -- adjust CNY offer carousel-inner --
            // -- ./adjust CNY offer carousel-inner --

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

        $("#myCarousel-fwdiscover .carousel-inner .item .gray-hover").click( function(){
            $(this).parent().find('a').trigger('click');
        });

        //modals (maybe trash codes, remove it later)
        // $('#modal-grab-button').click(function() {
        //     if ('<%=username%>' == 'null') {
        //         $('.modal').modal('hide');
        //         $('#loginpopup').modal('show');
        //     } else {
        //         $('.modal').modal('hide');
        //         $('#offer-details-promotion-code .title').html('<fmt:message key="Fanfare.landingpage.offer2" bundle="${msg}" />');
        //         $('#offer-details-promotion-code').modal('show');
        //     }
        // });

        // -- #cny-plan-button JS --
        // -- ./#cny-plan-button JS --

        // -- Promote code assign and Loginbox pop for Hotel Voucher --
        // -- ./Promote code assign and Loginbox pop for Hotel Voucher --

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

        $("#myDropdown").on('click', function() {
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
                    if ((navigator.userAgent.match(/iPad/i))) {
                        $('body').addClass("hidden-show");
                    }
                }
            });
        }

        // -- Fanfare JS - assignPromoCode() --
        // -- ./Fanfare JS - assignPromoCode() --

        // -- Fanfare JS - updateAllPromoCodeCount() --
        // -- ./Fanfare JS - updateAllPromoCodeCount() --

        // -- Fanfare JS - setPlanLink(campaignId, code) --
        // -- ./Fanfare JS - setPlanLink(campaignId, code) --

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

        // -- hotelVoucherCampaignId JS --
        // -- ./hotelVoucherCampaignId JS --

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
