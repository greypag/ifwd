
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

<!-- ==============================  Hotel promotion code  ================================= -->
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
<!-- ./Hotel promotion code modal -->
<!-- ==============================  ./Hotel promotion code  ================================= -->

<!-- ==============================  Hotel promotion code  ================================= -->
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
                          <!-- slide hotel 1 -->
                          <div class="hotel-description-carosuel-container item active">
                                <div class="hotel-description-left-wrapper">
                                    <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/Bayview_langkawai_logo.png" class="hotel-icon img-responsive"></div>
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-bayview-mobile.jpg" class="img-responsive hidden-lg hidden-md">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-bayview.jpg" class="img-responsive hidden-xs hidden-sm">

                                    <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.1.HotelName" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-description-right-wrapper">
                                    <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.1.Url" bundle="${msg}" />">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
                                        <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.1.Addr" bundle="${msg}" /></span>
                                    </a>
                                    <div class="clearfix"></div>
                                    <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.1.Detail" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-refer-wrapper">
                                    <div class="hotel-refer">
                                        <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
                                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
                                        </a>
                                    </div>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Close" bundle="${msg}" /></button>
                                    <div class="clearfix"></div>
                                </div>
                          </div>
                          <!-- slide hotel 1 End -->
                          <!-- slide hotel 2 -->
                          <div class="hotel-description-carosuel-container item selected">
                                <div class="hotel-description-left-wrapper">
                                    <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/logo-dorsettgrand-subang.png" class="hotel-icon img-responsive"></div>
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-subang-mobile.jpg" class="img-responsive hidden-lg hidden-md">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-subang.jpg" class="img-responsive hidden-xs hidden-sm">
                                    <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.2.HotelName" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-description-right-wrapper item">
                                    <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.2.Url" bundle="${msg}" />">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
                                        <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.2.Addr" bundle="${msg}" /></span>
                                    </a>
                                    <div class="clearfix"></div>
                                    <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.2.Detail" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-refer-wrapper">
                                    <div class="hotel-refer">
                                        <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
                                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
                                        </a>
                                    </div>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Close" bundle="${msg}" /></button>
                                    <div class="clearfix"></div>
                                </div>
                          </div>
                          <!-- slide hotel 2 End -->
                          <!-- slide hotel 3 -->
                          <div class="hotel-description-carosuel-container item">
                                <div class="hotel-description-left-wrapper">
                                    <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/dorsett-kualalumpur-logo.png" class="hotel-icon img-responsive"></div>
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-regency-mobile.jpg" class="img-responsive hidden-lg hidden-md">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-regency.jpg" class="img-responsive hidden-xs hidden-sm">
                                    <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.3.HotelName" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-description-right-wrapper">
                                    <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.3.Url" bundle="${msg}" />">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
                                        <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.3.Addr" bundle="${msg}" /></span>
                                    </a>
                                    <div class="clearfix"></div>
                                    <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.3.Detail" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-refer-wrapper">
                                    <div class="hotel-refer">
                                        <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
                                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
                                        </a>
                                    </div>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Close" bundle="${msg}" /></button>
                                    <div class="clearfix"></div>
                                </div>
                          </div>
                          <!-- slide hotel 3 End -->
                          <!-- slide hotel 4 -->
                          <div class="hotel-description-carosuel-container item">
                                <div class="hotel-description-left-wrapper">
                                    <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/Lanson_Place_logo.png" class="hotel-icon img-responsive"></div>
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-lanson-mobile.jpg" class="img-responsive hidden-lg hidden-md">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-lanson.jpg" class="img-responsive hidden-xs hidden-sm">

                                    <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.4.HotelName" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-description-right-wrapper">
                                    <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.4.Url" bundle="${msg}" />">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
                                        <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.4.Addr" bundle="${msg}" /></span>
                                    </a>
                                    <div class="clearfix"></div>
                                    <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.4.Detail" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-refer-wrapper">
                                    <div class="hotel-refer">
                                        <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
                                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
                                        </a>
                                    </div>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Close" bundle="${msg}" /></button>
                                    <div class="clearfix"></div>
                                </div>
                          </div>
                          <!-- slide hotel 4 End -->
                          <!-- slide hotel 5 -->
                          <div class="hotel-description-carosuel-container item">
                                <div class="hotel-description-left-wrapper">
                                    <div class="hotel-icon-wrapper"><img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/logo_ming.png" class="hotel-icon img-responsive"></div>
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-ming-mobile.jpg" class="img-responsive hidden-lg hidden-md">
                                    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/hotel-round2/lightbox-ming.jpg" class="img-responsive hidden-xs hidden-sm">
                                    <div class="hotel-name"><fmt:message key="Fanfare.Hotel.Carousel.5.HotelName" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-description-right-wrapper">
                                    <a class="hotel-link" target="_blank" href="<fmt:message key="Fanfare.Hotel.Lightbox.Hotel.5.Url" bundle="${msg}" />">
                                        <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-pin.png" class="img-responsive">
                                        <span><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.5.Addr" bundle="${msg}" /></span>
                                    </a>
                                    <div class="clearfix"></div>
                                    <div class="hotel-description"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.5.Detail" bundle="${msg}" /></div>
                                </div>
                                <div class="hotel-refer-wrapper">
                                    <div class="hotel-refer">
                                        <fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Refer" bundle="${msg}" />
                                        <a href="<fmt:message key="agoda.link" bundle="${msg}" />" target="_blank">
                                            <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/hotel/lightbox-destop-agoda.png" class="img-responsive">
                                        </a>
                                    </div>
                                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="Fanfare.Hotel.Lightbox.Hotel.Close" bundle="${msg}" /></button>
                                    <div class="clearfix"></div>
                                </div>
                          </div>
                          <!-- slide hotel 5 End -->
                      </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- ./Hotel Description Modal -->
<!-- ==============================  ./Hotel promotion code  ================================= -->






<!-- ==============================  Hotel promotion code  ================================= -->
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
<!-- ==============================  ./Hotel promotion code  ================================= -->



<!-- ==============================  RegPromo: Fanfare.Hotel  ================================= -->
<!-- RegPromo: Fanfare.Hotel  -->
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
<!-- ./RegPromo: Fanfare.Hotel  -->
<!-- ==============================  ./RegPromo: Fanfare.Hotel  ================================= -->



<script type="text/javascript">
// -- slide1-5Nav --
var slide1Nav = {
    Date: '<fmt:message key="Fanfare.Hotel.Carousel.1.Date" bundle="${msg}" />',
    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.5.Date" bundle="${msg}" />',
    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.2.Date" bundle="${msg}" />',
    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.5.HotelName" bundle="${msg}" />',
    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.2.HotelName" bundle="${msg}" />'
};
var slide2Nav = {
    Date: '<fmt:message key="Fanfare.Hotel.Carousel.2.Date" bundle="${msg}" />',
    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.1.Date" bundle="${msg}" />',
    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.3.Date" bundle="${msg}" />',
    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.1.HotelName" bundle="${msg}" />',
    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.3.HotelName" bundle="${msg}" />'
};
var slide3Nav = {
    Date: '<fmt:message key="Fanfare.Hotel.Carousel.3.Date" bundle="${msg}" />',
    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.2.Date" bundle="${msg}" />',
    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.4.Date" bundle="${msg}" />',
    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.2.HotelName" bundle="${msg}" />',
    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.4.HotelName" bundle="${msg}" />'
};
var slide4Nav = {
    Date: '<fmt:message key="Fanfare.Hotel.Carousel.4.Date" bundle="${msg}" />',
    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.3.Date" bundle="${msg}" />',
    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.5.Date" bundle="${msg}" />',
    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.3.HotelName" bundle="${msg}" />',
    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.5.HotelName" bundle="${msg}" />'
};
var slide5Nav = {
    Date: '<fmt:message key="Fanfare.Hotel.Carousel.5.Date" bundle="${msg}" />',
    LeftNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.4.Date" bundle="${msg}" />',
    RightNavDate: '<fmt:message key="Fanfare.Hotel.Carousel.1.Date" bundle="${msg}" />',
    LeftNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.4.HotelName" bundle="${msg}" />',
    RightNavHotel: '<fmt:message key="Fanfare.Hotel.Carousel.1.HotelName" bundle="${msg}" />'
};
function assignHotelNav(slideNav){
    //console.log(slideNav);
    $('#previous-hotel-name').html(slideNav.LeftNavHotel);
    $('#previous-hotel-date').html(slideNav.LeftNavDate);
    $('#hotel-lanuch-date').html(slideNav.Date);
    $('#next-hotel-date').html(slideNav.RightNavDate);
    $('#next-hotel-name').html(slideNav.RightNavHotel);
}
// -- ./slide1-5Nav --

$(document).ready(function() {

    // -- hotel-related JS --

    //$('#offer-details-hotel-voucher').modal('show');
    //$('#offer-details-promotion-code').modal('show');

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
              infinite: false,
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
    // -- ./hotel-related JS --



    // -- Fanfare JS - assignPromoCode() --
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
                    } else {
                        $('.promo-code-holder .code').html(data["promoCode"]);
                        $('#offer-details-promotion-code').modal('show');
                        $('#offer-details-promotion-code .modal-content').children(".title").html(fmt);
                        $('#offer-details-promotion-code .terms-and-condition').find(".offer-details-tnc").attr('href', fmtTnc);
                        setPlanLink(campaignId, data["promoCode"]);
                    }
                } else if(data["result"]=="duplicated") {
                    $('#offer-details-promotion-code-error-once').modal('show');
                    if(/*true ||*/ <%=hotelVoucherCampaignId<13%>){
                        $('#offer-details-promotion-code-error-once .modal-content').children(".title").html(fmt);
                        setPlanLink(campaignId, data["promoCode"]);
                    }
                } else if(data["result"]=="notlogin") {
                    loginpopup(campaignId);
                } else {
                    $('#offer-details-promotion-code-error-sold').modal('show');
                    if(/*true ||*/ <%=hotelVoucherCampaignId<=13%>){
                        $('#offer-details-promotion-code-error-sold .modal-content').children(".title").html(fmt);
                    }
                }
                updateAllPromoCodeCount();
            }
        });
    }
    // -- ./Fanfare JS - assignPromoCode() --

    // -- Fanfare JS - updateAllPromoCodeCount() --
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
    // -- ./Fanfare JS - updateAllPromoCodeCount() --





    // -- Fanfare JS - setPlanLink(campaignId, code) --
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
    // -- ./Fanfare JS - setPlanLink(campaignId, code) --


    // -- hotelVoucherCampaignId JS --
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

                if (/*false &&*/ <%=hotelVoucherCampaignId>=14 && hotelVoucherCampaignId<=18%>) {
                    $('#offer-details-hotel-voucher').modal('show');
                    $('#offer-details-hotel-voucher .terms-and-condition').find(".offer-details-tnc").attr('href', '<%=request.getContextPath()%>/<fmt:message key="link.tnc.fwdiscover.offer.special.hotel${hotelVoucherCampaignId}" bundle="${msg}" />');
                } else {
                    $('.promo-code-holder .code').html('<%=request.getAttribute("chooseCode")%>');
                    $('#offer-details-promotion-code').modal('show');
                    setPlanName("${chooseId}");
                    setPlanLink("${chooseId}", '<%=request.getAttribute("chooseCode")%>');
                    setTnCLink("${chooseId}");
                }

            }
        }
    });

    // -- ./hotelVoucherCampaignId JS --
    

    // JS .carousel-item-container && RegPromo: Fanfare.Hotel
    if (isMobile) {
        $(".carousel-item-container").click(function(){
            // -- $(".carousel-item-container").click(function(){ --
            // -- ./$(".carousel-item-container").click(function(){ --
        });
        $(".fwdiscover-plan .details-btn").click(function(){
            // -- $(".fwdiscover-plan .details-btn").click(function(){ --
            // -- ./$(".fwdiscover-plan .details-btn").click(function(){ --
        });
    }
    // ./JS .carousel-item-container && RegPromo: Fanfare.Hotel



    // -- $(".carousel-item-container").click(function(){ --
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
    // -- ./$(".carousel-item-container").click(function(){ --



    // -- $(".fwdiscover-plan .details-btn").click(function(){ --
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
    // -- ./$(".fwdiscover-plan .details-btn").click(function(){ --















};

</script>
