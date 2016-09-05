var isClicked = false; // public variable

function inlinePaddingTop(classname, px) {
    $(classname).css('padding-top', px + 'px');
}

function screenJob(obj) {

    var nBarDesktopElem = document.getElementById('notification-bar-desktop');
    var defaultedDesktopPaddingTop = obj.topBar.desktop;
    var notificationBarDesktopHeight = ( typeof nBarDesktopElem !== "undefined" && nBarDesktopElem !== null ) ? nBarDesktopElem.clientHeight : 0 ;

    if ( defaultedDesktopPaddingTop <= obj.topBar.desktop ) {
        defaultedDesktopPaddingTop += notificationBarDesktopHeight;
    } else {
        defaultedDesktopPaddingTop = obj.topBar.desktop;
    }
    // console.log( 'defaultedDesktopPaddingTop = ' + defaultedDesktopPaddingTop );
    // console.log( 'notificationBarDesktopHeight = ' + notificationBarDesktopHeight );

    if ($(window).width() < 992) {
        inlinePaddingTop(
            obj.topBar.classname.mobile,
            (isClicked == false) ? obj.topBar.mobile : (obj.topBar.mobile - obj.notificationBarOnly.mobile)
        );
    } else {
        inlinePaddingTop(
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
    var mobileBoxElem = document.getElementById("notification-bar-content-mobile");
    var desktopBoxElem = document.getElementById("notification-bar-content-desktop");

    if ( typeof mobileBoxElem !== "undefined" && mobileBoxElem !== null ) {
        mobileBoxElem.innerHTML = "";
        mobileBoxElem.innerHTML = content[pageIndex].mobile;
    } else {
        console.error( "Element with class \"notification-bar-content-mobile\" may not existed." );
    }
    if ( typeof desktopBoxElem !== "undefined" && desktopBoxElem !== null ) {
        desktopBoxElem.innerHTML = "";
        desktopBoxElem.innerHTML = content[pageIndex].desktop;
    } else {
        console.error( "Element with class \"notification-bar-content-desktop\" may not existed." );
    }
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
