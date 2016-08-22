var obj = {
    'topBar': {
        'mobile':   106,
        'desktop':  98,
        'classname': {
            'mobile':   '.logobox',
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
function objPaddingTop(classname, px) {
    $(classname).css('padding-top', px+'px');
}
function removeNotificationBox() {
    $('.header-notification-box').remove();
}
function screenJob(obj) {
    if ( $(window).width() < 992 ) {
        objPaddingTop(
            obj.topBar.classname.mobile,
            readCookie('isClickedNotificationBar') == false ? obj.topBar.mobile : obj.topBar.mobile - obj.notificationBarOnly.mobile
        );
    } else {
        objPaddingTop(
            obj.topBar.classname.desktop,
            readCookie('isClickedNotificationBar') == false ? obj.topBar.desktop : obj.topBar.desktop - obj.notificationBarOnly.desktop
        );
    }
}
function closeNotificationBox() {
    screenJob(obj);
    removeNotificationBox();
    createCookie('isClickedNotificationBar', true, 0);
}
$(function() {
    console.log(obj);
    createCookie('isClickedNotificationBar', false, 0);
    screenJob(obj);
    $(window).resize(function() {
        screenJob(obj);
    });

});
