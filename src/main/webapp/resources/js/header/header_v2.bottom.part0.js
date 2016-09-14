$(function() {
    if ((navigator.userAgent.match(/iPhone/i)) || (navigator.userAgent.match(/iPod/i)) || (navigator.userAgent.match(/iPad/i))) {
        $(".fwd-savie-wrapper .menutab-V2 li").click(function() {
            // Update '.change-this-class' to the class of your menu
            // Leave this empty, that's the magic sauce
        });
    }
    var pageControllerName = actionName;
    if (pageControllerName != "") {
        pageControllerName = "#" + pageControllerName;
    }
    var faqProductLink = context + "/" + language + "/faq";
    $("#faqProductLink").attr("href", "" + faqProductLink + pageControllerName + "");
    var faqLinkRe = new RegExp(/^faq/);
    var langFaqProductLink = window.location.href.substr(window.location.href.lastIndexOf("/") + 1);
});
function offerMenuActive() {
    var site_uri = window.location.pathname;
    var uri_array = site_uri.split("/");
    if (uri_array[uri_array.length - 1] == 'offers') {
        $(".enjoy").addClass("active");
    }
}
$(document).ready(function() {
    $('ul.maintabs li').hover(function () {
    	$("a", this).addClass('maintabs-hover');
    }, function () {
        $("a", this).removeClass('maintabs-hover');
    });

    if (isMobile) {
        if (window.orientation == 0 || window.orientation == 180) // Portrait
        {
            //alert("Portrait");
            $(".mobile-menu-V2.navbar-collapse").css("max-height", $(window).height() * 0.7);
        } else // Landscape
        {
            $(".mobile-menu-V2.navbar-collapse").css("max-height", $(window).height() * 0.6);
            //alert("Landscape"+$(".mobile-menu-V2.navbar-collapse").css("max-height"));
        }
        $(window).on("orientationchange", function() {
            if (window.orientation == 0 || window.orientation == 180) // Portrait
            {
                // alert("Portrait");
                $(".mobile-menu-V2.navbar-collapse").css("max-height", $(window).height() * 0.7);
            } else // Landscape
            {
                $(".mobile-menu-V2.navbar-collapse").css("max-height", $(window).height() * 0.6);
                //alert("Landscape"+$(".mobile-menu-V2.navbar-collapse").css("max-height"));
            }
        });
    }

    $('.copyright .options li').click(function() {
        var link = $(this).attr('data-raw-value');
        window.open(link, '_blank');
    });
    offerMenuActive();
    //console.log(window.location.pathname.substring(-5));
    //$("#loginform2").appendTo("body");
    //console.log(navigator.userAgent.match('CriOS'));

});

$('.navmenu').on('show.bs.offcanvas', function() {
    $('#test').show();
});
$('.navmenu').on('hidden.bs.offcanvas', function() {
    $('#test').hide(function() {
        $("#toplefthotline").trigger("click");
    });
});
$('#test').click(function() {
    $('.navmenu').offcanvas('hide');
});
$( "li.link-btn.link-grp" ).click(function() {
      $(this).find("img").toggle();
    });
//$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
//    // Avoid following the href location when clicking
//    event.preventDefault();
//    // Avoid having the menu to close when clicking
//    event.stopPropagation();
//    // Re-add .open to parent sub-menu item
//    if($(this).parent().hasClass('open')){
//        $(this).parent().removeClass('open');
//    }else{
//        $(this).parent().addClass('open');
//        $(this).parent().siblings("li").removeClass('open');
//        $(this).parent().find("ul").parent().find("li.dropdown").addClass('open');
//    }
//});
