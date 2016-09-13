var isClicked = false; // public variable

function inlinePaddingTop(classname, px) {
    $(classname).css('padding-top', px + 'px');
}

function isVisible(index) {
    if (index !== true) {
        $('.header-notification-box').addClass('hide');
    } else {
        $('.header-notification-box').removeClass('hide');
    }
}

function screenJob(obj) {

    var nBarDesktopElem = document.getElementById('notification-bar-desktop');
    var defaultDesktopPaddingTop = obj.topBar.desktop;
    var nBarDesktopHeight = (typeof nBarDesktopElem !== "undefined" && nBarDesktopElem !== null) ? nBarDesktopElem.clientHeight : 0;

    if (defaultDesktopPaddingTop == obj.topBar.desktop || defaultDesktopPaddingTop > obj.topBar.desktop ) {
        defaultDesktopPaddingTop += nBarDesktopHeight;
    } else {
        defaultDesktopPaddingTop = obj.topBar.desktop;
    }

    if ($(window).width() < 992) {
        inlinePaddingTop(
            obj.topBar.classname.mobile,
            (isClicked == false) ? obj.topBar.mobile : (obj.topBar.mobile - obj.nBarOnly.mobile)
        );
    } else {
    	var temp = (isClicked == false) ? defaultDesktopPaddingTop : (defaultDesktopPaddingTop - nBarDesktopHeight);
        inlinePaddingTop(
            obj.topBar.classname.desktop,
            (isClicked == false) ? defaultDesktopPaddingTop : (defaultDesktopPaddingTop - nBarDesktopHeight)
        );
    }
}

function closeNotificationBox() {
    isClicked = true;
    screenJob(obj);
    $('.header-notification-box').remove();
}

function updateNotificationBox(content, contentIndex) {
    if (typeof contentIndex !== "undefined" && contentIndex !== null) {
        var mobileBoxElem = document.getElementById("notification-bar-content-mobile");
        var desktopBoxElem = document.getElementById("notification-bar-content-desktop");

        if (typeof mobileBoxElem !== "undefined" && mobileBoxElem !== null) {
            mobileBoxElem.innerHTML = "";
            mobileBoxElem.innerHTML = content[contentIndex].mobile;
        } else {
            console.error("Element with the class \"notification-bar-content-mobile\" may not existed.");
        }
        if (typeof desktopBoxElem !== "undefined" && desktopBoxElem !== null) {
            desktopBoxElem.innerHTML = "";
            desktopBoxElem.innerHTML = content[contentIndex].desktop;
        } else {
            console.error("Element with the class \"notification-bar-content-desktop\" may not existed.");
        }
    } else {
        console.error("Failure to updated the content in Notification Bar.");
    }
}

$(function() {

    isClicked = false;

    if (nBarConfig.isVisible == true) {

        isVisible(true);

        try {
            if (typeof obj.nBarOnly.content === "undefined") throw 'has not been defined yet.';
            if (obj.nBarOnly.content === null) throw 'is NULL value.';
        } catch (err) {
            console.error('Variable "obj.nBarOnly.content" ' + err);
        }

        updateNotificationBox(obj.nBarOnly.content, nBarConfig.contentIndex);

        // "setTimeout" is for fixing the "document.getElementById('notification-bar-desktop').clientHeight" bug on fwdiscover page problem
        setTimeout(function(){
            screenJob(obj);
        }, 1500);
        $(window).resize(function() {
            screenJob(obj);
        });

    } else {

        isVisible(false);

    }

});
