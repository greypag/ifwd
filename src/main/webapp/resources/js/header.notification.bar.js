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

function updateNotificationBox(content, contentIndex) {
    if ( typeof contentIndex !== "undefined" && contentIndex !== null ) {
        var mobileBoxElem = document.getElementById("notification-bar-content-mobile");
        var desktopBoxElem = document.getElementById("notification-bar-content-desktop");

        if ( typeof mobileBoxElem !== "undefined" && mobileBoxElem !== null ) {
            mobileBoxElem.innerHTML = "";
            mobileBoxElem.innerHTML = content[contentIndex].mobile;
        } else {
            console.error( "Element with the class \"notification-bar-content-mobile\" may not existed." );
        }
        if ( typeof desktopBoxElem !== "undefined" && desktopBoxElem !== null ) {
            desktopBoxElem.innerHTML = "";
            desktopBoxElem.innerHTML = content[contentIndex].desktop;
        } else {
            console.error( "Element with the class \"notification-bar-content-desktop\" may not existed." );
        }
    } else {
        console.error("Failure to updated the content in Notification Bar.");
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

    updateNotificationBox(obj.notificationBarOnly.content, notificationBarContentIndex);

    screenJob(obj);
    $(window).resize(function() {
        screenJob(obj);
    });
});
