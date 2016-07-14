
<!-- ==============================  Hotel Promotion  ================================= -->
<!-- Hotel Promotion -->
<% if (hotelVoucherCampaignId == 14) { %>
<!-- Hotel 1 Offer -->
<!-- ./Hotel 1 Offer -->
<% } %>
<% if (hotelVoucherCampaignId == 15) { %>
<!-- Hotel 2 Offer -->
<!-- ./Hotel 2 Offer -->
<% } %>
<% if (hotelVoucherCampaignId == 16) { %>
<!-- Hotel 3 Offer -->
<!-- ./Hotel 3 Offer -->
<% } %>
<% if (hotelVoucherCampaignId == 17) { %>
<!-- Hotel 4 Offer -->
<!-- ./Hotel 4 Offer -->
<% } %>
<% if (hotelVoucherCampaignId == 18 || hotelVoucherCampaignId == -1) { %>
<!-- Hotel 5 Offer -->
<!-- ./Hotel 5 Offer -->
<% } %>
<!-- ./Hotel Promotion -->


<!-- == == == == == == == == == == == == == == == == == == == == == == == == == == == == -->

<!-- Hotel 1 Offer -->
<div class="fwdiscover-plan hotel-voucher">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/bayview-mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/desktop-bayview.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box gray-bg right">
        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel1.HotelName" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
            </div>
            <div class="lower-desc">
                <ul>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet1" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet2" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet3" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                        <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                        <fmt:message key="Fanfare.landingpage.offerHotel1.enddate" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.landingpage.offerHotel1.enddate.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offer-311">
                <button class="details-btn" id="offer-311-button" data-toggle="modal" data-target="#offer-311-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>
    </div>
</div>
<!-- ./Hotel 1 Offer -->


<!-- Hotel 2 Offer -->
<div class="fwdiscover-plan hotel-voucher">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/subang-mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/desktop-subang.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box gray-bg right">

        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel2.HotelName" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
            </div>
            <div class="lower-desc">
                <ul>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet1" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet2" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet3" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                        <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                        <fmt:message key="Fanfare.landingpage.offerHotel2.enddate" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.landingpage.offerHotel2.enddate.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offer-312">
                <button class="details-btn" id="offer-312-button" data-toggle="modal" data-target="#offer-312-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>

    </div>
</div>
<!-- ./Hotel 2 Offer -->


<!-- Hotel 3 Offer -->
<div class="fwdiscover-plan hotel-voucher">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/regency-mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/desktop-regency.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box gray-bg right">
        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel3.HotelName" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
            </div>
            <div class="lower-desc">
                <ul>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet1" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet2" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet3" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                        <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                        <fmt:message key="Fanfare.landingpage.offerHotel3.enddate" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.landingpage.offerHotel3.enddate.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offer-313">
                <button class="details-btn" id="offer-313-button" data-toggle="modal" data-target="#offer-313-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>
    </div>
</div>
<!-- ./Hotel 3 Offer -->


<!-- Hotel 4 Offer -->
<div class="fwdiscover-plan hotel-voucher">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lanson-mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/desktop-lanson.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box gray-bg right">
        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel4.HotelName" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
            </div>
            <div class="lower-desc">
                <ul>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet1" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet2" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet3" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                        <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                        <fmt:message key="Fanfare.landingpage.offerHotel4.enddate" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.landingpage.offerHotel4.enddate.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offer-314">
                <button class="details-btn" id="offer-314-button" data-toggle="modal" data-target="#offer-314-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>
    </div>
</div>
<!-- ./Hotel 4 Offer -->


<!-- Hotel 5 Offer -->
<div class="fwdiscover-plan hotel-voucher">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/ming-mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/desktop-ming.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box gray-bg right">
        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel5.HotelName" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /></p>
            </div>
            <div class="lower-desc">
                <ul>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet1" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet2" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet3" bundle="${msg}" /></li>
                    <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                        <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                        <fmt:message key="Fanfare.landingpage.offerHotel5.enddate" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.landingpage.offerHotel5.enddate.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offer-315">
                <button class="details-btn" id="offer-315-button" data-toggle="modal" data-target="#offer-315-detail"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>
    </div>
</div>
<!-- ./Hotel 5 Offer -->
<!-- ==============================  ./Hotel Promotion  ================================= -->


<!-- ==============================  Hotel Partner (near footer)  ================================= -->
<!-- Hotel Partner -->
<div class="hotel-partner-wrapper">
    <div class="hotel-partner-title"><fmt:message key="Fanfare.Hotel.Sponsor.Title" bundle="${msg}" /></div>
    <div class="hotel-partner-icon-wrapper">
        <div class="col-1"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/Bayview_langkawai_logo.png" class="img-responsive"></div>
        <div class="col-2"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/logo-dorsettgrand-subang.png" class="img-responsive"></div>
        <div class="col-3"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/Lanson_Place_logo.png" class="img-responsive"></div>
        <div class="col-4"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/dorsett-kualalumpur-logo.png" class="img-responsive"></div>
        <div class="col-5"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/logo_ming.png" class="img-responsive"></div>
    </div>
</div>
<!-- ./Hotel Partner -->
<!-- ==============================  ./Hotel Partner (near footer)  ================================= -->

<!-- ==============================  #myCarousel-footer  ================================= -->
<!-- #myCarousel-footer -->
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
<!-- ./#myCarousel-footer -->
<!-- ==============================  ./#myCarousel-footer  ================================= -->



<!-- ==============================  Hotel Voucher Plan  ================================= -->
<!-- Hotel Voucher Plan -->
<!-- Offer 311 -->
<div class="modal fade fwdiscover-modal" id="offer-311-detail" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel1.HotelName" bundle="${msg}" /></p>
            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

            <ul>
                <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet1" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet2" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel1.bullet3" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                    <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel14" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
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
            <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel2.HotelName" bundle="${msg}" /></p>
            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

            <ul>
                <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet1" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet2" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel2.bullet3" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                    <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel15" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
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
            <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel3.HotelName" bundle="${msg}" /></p>
            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

            <ul>
                <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet1" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet2" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel3.bullet3" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                    <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel16" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
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
            <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel4.HotelName" bundle="${msg}" /></p>
            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

            <ul>
                <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet1" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet2" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel4.bullet3" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                    <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel17" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
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
            <p class="title"><fmt:message key="Fanfare.landingpage.offerHotel5.HotelName" bundle="${msg}" /></p>
            <p class="promo"><fmt:message key="Fanfare.landingpage.HotelOfferName" bundle="${msg}" /> </p>

            <ul>
                <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet1" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet2" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel5.bullet3" bundle="${msg}" /></li>
                <li><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part1" bundle="${msg}" />
                    <a target="_blank" href="<%=request.getContextPath()%>/<fmt:message key="Fanfare.landingpage.offerHotel.bullet4.link" bundle="${msg}" />"><fmt:message key="Fanfare.landingpage.offerHotel.bullet4.part2" bundle="${msg}" /></a>
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
                    <li><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel18" bundle="${msg}" />" target="_blank"><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part2" bundle="${msg}" /></a><fmt:message key="Fanfare.clickdetail.lightbox.terms.HoteOffer.part3" bundle="${msg}" /></li>
                </ul>
            </div>

            <p class="close-modal"><fmt:message key="Fanfare.close" bundle="${msg}" /></p>
        </div>
    </div>
</div>
<!-- ./Hotel Voucher Plan -->
<!-- ==============================  ./Hotel Voucher Plan  ================================= -->

<!-- ==============================  Fanfare  ================================= -->
<!-- Fanfare -->
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
<!-- ./Fanfare -->
<!-- ==============================  ./Fanfare  ================================= -->
