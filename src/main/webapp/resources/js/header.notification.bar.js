var isClicked = false;

function objPaddingTop(classname, px) {
    $(classname).css('padding-top', px + 'px');
}

function screenJob(obj) {

    var defaultedDesktopPaddingTop = obj.topBar.desktop;
    var notificationBarDesktopHeight = document.getElementById('notification-bar-desktop').clientHeight;

    if ( defaultedDesktopPaddingTop <= obj.topBar.desktop ) {
        defaultedDesktopPaddingTop += notificationBarDesktopHeight;
    } else {
        defaultedDesktopPaddingTop = obj.topBar.desktop;
    }
    console.log( 'defaultedDesktopPaddingTop = ' + defaultedDesktopPaddingTop );
    console.log( 'notificationBarDesktopHeight = ' + notificationBarDesktopHeight );

    if ($(window).width() < 992) {
        objPaddingTop(
            obj.topBar.classname.mobile,
            (isClicked == false) ? obj.topBar.mobile : (obj.topBar.mobile - obj.notificationBarOnly.mobile)
        );
    } else {
        objPaddingTop(
            obj.topBar.classname.desktop,
            (isClicked == false) ? defaultedDesktopPaddingTop : (defaultedDesktopPaddingTop - notificationBarDesktopHeight)
        );
    }
}

function closeNotificationBox() {
    isClicked = true;
    screenJob(obj);
    $('.header-notification-box').remove();
}

function updateNotificationBox(content, pageIndex) {
    var mobileBox = document.getElementById("notification-bar-content-mobile");
    var desktopBox = document.getElementById("notification-bar-content-desktop");
    mobileBox.innerHTML = "";
    desktopBox.innerHTML = "";
    mobileBox.innerHTML = content[pageIndex].mobile;
    desktopBox.innerHTML = content[pageIndex].desktop;
}

$(function() {
    isClicked = false;

    try {
        if (typeof obj.notificationBarOnly.content === "undefined") throw 'has not been defined yet.';
        if (obj.notificationBarOnly.content === null) throw 'is NULL value.';
    } catch (err) {
        console.error('"obj.notificationBarOnly.content" ' + err);
    }

    updateNotificationBox(obj.notificationBarOnly.content, pageIndex);

    screenJob(obj);
    $(window).resize(function() {
        screenJob(obj);
    });
});
