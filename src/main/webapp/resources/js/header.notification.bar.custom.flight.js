function hideAllQuotationBar() {

    $('section#middle').removeClass();
    $('section#bottom-form').removeClass();
    $('div#mobile-form').removeClass();

    $('section#middle').addClass('hide');
    $('section#bottom-form').addClass('hide');
    $('div#mobile-form').addClass('hide');

}

$(function() {
    hideAllQuotationBar();
});
