<!-- CNY PROMOTION -->
<div class="fwdiscover-plan">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/PremiumDiscount_hero_mobile.jpg" class="img-responsive hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/resources/images/fwdiscover/PremiumDiscount_hero.jpg" class="img-responsive hidden-xs hidden-sm">
    <div class="plan-details-box red-bg right">
        <div class="plan-desc">
            <div class="upper-desc">
                <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium" bundle="${msg}" /></p>
                <p class="title"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle1" bundle="${msg}" /></p>
                <p class="promo"><span class="price"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle2" bundle="${msg}" /></span><br><span class="italic"><fmt:message key="Fanfare.landingpage.offerPermium.subtitle3" bundle="${msg}" /></span></p>
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
                        <p class="value count">${count0}</p>
                    </div>
                    <div class="holder date hidden-xs hidden-sm">
                        <fmt:message key="Fanfare.enddate.speical" bundle="${msg}" />
                    </div>
                    <div class="holder date hidden-md hidden-lg">
                        <fmt:message key="Fanfare.enddate.speical.mobile" bundle="${msg}" />
                    </div>
                </div>
            </div>

            <div class="details-button-holder text-center" name="offerCny">
                <button class="details-btn" id="cny-plan-button" data-target="offerCny-details"><fmt:message key="Fanfare.landingpage.offerPermium.button" bundle="${msg}" /></button>
            </div>
        </div>
    </div>
</div>
<!-- ./CNY PROMOTION -->

<!-- CNY PROMOTION: Modal -->
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
<!-- ./CNY PROMOTION: Modal -->

<script type="text/javascript">
// -- #cny-plan-button JS --
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
// -- ./#cny-plan-button JS --

$(document).ready(function() {
    // -- adjust CNY offer carousel-inner --
    if (<%=(isRegPromo)?true:false%>){
        $('#myCarousel-fwdiscover .carousel-inner').css('width', '70%');
        $('#myCarousel-fwdiscover .carousel-inner .desktop-img-align').css('width', '16.6%');
    }
    // -- ./adjust CNY offer carousel-inner --
};
</script>
