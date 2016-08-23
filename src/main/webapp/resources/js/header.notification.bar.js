var obj = {
    'topBar': {
        'mobile':   0,
        // 'mobile':   106,
        'desktop':  98,
        'classname': {
            'mobile':   'div.closeMobileMenu',
            // 'mobile':   'div.navbar-header',
            'desktop':  'nav.navbar.navbar-inverse'
        }
    },
    'notificationBarOnly': {
        'mobile': 56,
        'desktop': 56,
        'classname': {
            'mobile':   '.header-notification-box.header-notification-box--mobile',
            'desktop':  '.header-notification-box.header-notification-box--desktop'
        }
    }
};
var isClicked = false;

function objPaddingTop(classname, px) {
    $(classname).css('padding-top', px+'px');
}
function screenJob(obj) {
    if ( $(window).width() < 992 ) {
        objPaddingTop(
            obj.topBar.classname.mobile,
            (isClicked == false) ? obj.topBar.mobile : (obj.topBar.mobile - obj.notificationBarOnly.mobile)
        );
    } else {
        objPaddingTop(
            obj.topBar.classname.desktop,
            (isClicked == false) ? obj.topBar.desktop : (obj.topBar.desktop - obj.notificationBarOnly.desktop)
        );
    }
}
function closeNotificationBox() {
    isClicked = true;
    screenJob(obj);
    $('.header-notification-box').remove();
}
$(function() {
    isClicked = false;
    screenJob(obj);
    $(window).resize(function() {
        screenJob(obj);
    });
});
