<!-- Hotel Promotion Start -->
<% if (isRegPromo == false) { %>
    <% if (hotelVoucherCampaignId == 14) { %>
    <!-- Hotel 1 Offer Start -->
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
    <!-- Hotel 1 Offer End -->
    <% } %>
    <% if (hotelVoucherCampaignId == 15) { %>
    <!-- Hotel 2 Offer Start -->
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
    <!-- Hotel 2 Offer End -->
    <% } %>
    <% if (hotelVoucherCampaignId == 16) { %>
    <!-- Hotel 3 Offer Start -->
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
    <!-- Hotel 3 Offer End -->
    <% } %>
    <% if (hotelVoucherCampaignId == 17) { %>
    <!-- Hotel 4 Offer Start -->
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
    <!-- Hotel 4 Offer End -->
    <% } %>
    <% if (hotelVoucherCampaignId == 18 || hotelVoucherCampaignId == -1) { %>
    <!-- Hotel 5 Offer Start -->
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
    <!-- Hotel 5 Offer End -->
    <% } %>
<% } else { %>
<!-- Hotel Promotion End -->


<!-- Hotel Voucher Plan Start -->
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
<!-- Hotel Voucher Plan End -->




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
<!-- Hotel Description Modal End -->

<!-- Hotel Partner Start -->
<% if (isRegPromo == false) { %>
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
<% } %>
<!-- Hotel Partner End -->

<script>
<%-- script outside document.ready() - remark#1 --%>
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
<%-- ./script outside document.ready() - remark#1 --%>

// Hotel Voucher Plan >> Promote code assign and Loginbox pop for Hotel Voucher
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
// ./Hotel Voucher Plan >> Promote code assign and Loginbox pop for Hotel Voucher

$(document).ready(function() {
    <%-- script inside document.ready() - remark#1 --%>
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
    <%-- ./script inside document.ready() - remark#1 --%>
};
</script>
