//@prepros-append form_handler.js

(function ($) {
var isAndroid = function() {
	return ( navigator.userAgent.toLowerCase().indexOf('android') != -1 );
}, responsiveHandler = { 
    list: [],
    win : {h: window.innerHeight, w: window.innerWidth},
	isIE8: function(){
		return ($('html').hasClass('ie8'))? true : false;
	},   
    getWinSize: function(){
		/*this function is important for determine the current viewport and rely on the viewport to trigger different function.*/
        if (document.body && document.body.offsetWidth){
			this.win.w = document.body.offsetWidth;
            this.win.h = document.body.offsetHeight;
        }
		if (document.compatMode=="CSS1Compat" && document.documentElement && document.documentElement.offsetWidth ){
			this.win.w = document.documentElement.offsetWidth;
            this.win.h = document.documentElement.offsetHeight;
        }
		if (window.innerWidth && window.innerHeight){
			this.win.w = window.innerWidth;
            this.win.h = window.innerHeight;
        }
        
        if (isIOS){
            this.win.w = document.body.offsetWidth;
            this.win.h = document.body.offsetHeight;
        }
        
    },
    init: function(){
		var timeout;
        this.getMode();
		responsiveHandler.updateMode();        
        
        $( window ).resize(function() {
            responsiveHandler.updateMode(); 
        });        
    },
    m : '',
    register: function(sel, t, o){
        if(sel!='' && $.grep(this.list, function(e){ if(e.selector == sel && e.type == t){ e.obj = o; return e} }).length == 0)
            this.list.push({selector:sel, type : t, obj: o});
    },
    unregister: function(sel){
        if(sel!=''){
			var index;
			$(responsiveHandler.list).each(function(i, e){
				if(e.selector == sel){index=i;}
			});
			if(index>-1)
				(responsiveHandler.list).splice(index, 1);
        }
    },
    find: function(sel){
        value = false;
        if(sel!=''){
			for (var i=0; i < this.list.length; i++) {  
				var v = this.list[i];
				if(v.selector == sel){
                    value = i;
                }
			}
        }
        return value;
    },
    getMode: function(){
		this.getWinSize();
        
        if(this.win.w >= 1000 || $('body').hasClass('nonresponsive')){
            return 'desktop';
        }
        else if(this.win.w >=768){
            return 'tablet';
        }
        else{
            return 'mobile';
        }
    },
	updateMode: function(){  
		var m = this.getMode(), $body = $('body'), h = this.win.h;
        
        $body.css('padding-bottom', $('header').height() + $('footer').height());
       
		if(m==this.m){
            return false;
		}
        
        $body.removeClass(this.m).addClass(m);      
        
        if(m != 'mobile'){
            $body.addClass('highres');
            if( $body.hasClass('t2') ){
                $( ".input-wrap" ).each(function(  ) {
                    var $this = $(this), 
                        $discount = $this.parents('.discount');
                    $this.insertAfter($discount.find('.content-box'));
                    $this.find('.title').insertBefore($discount.find('.content-box ul'));
                });
            }
            $('footer .copyright-links').insertBefore('.corp-links');
        }else{
            $body.removeClass('highres');
            $( ".title" ).each(function() {
                var $this = $(this), 
                    $discount = $this.parents('.discount'),
                    $wrap = $('.input-wrap');
                $this.insertAfter($discount.find('.input-wrap .icon'));
            });
            $( ".input-wrap" ).each(function(  ) {
                var $this = $(this), 
                    $discount = $this.parents('.discount');
                $this.appendTo($discount.find('.image-wrap'));
            });
            $('footer .copyright-links').appendTo('footer .full-width-container .container');            
        }
        
		this.m = m;
        
		return true;
	},
    recalculate: function(){
    },
    resize: function(){        
	}
}, animateScroll = function(y, t) {
    $('html,body').animate({
        'scrollTop': y
    }, {
        duration: t,
        easing: 'swing'
    });    
}, getParameterByName = function (name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}, getAndroidVersion = function() {
    var ua = navigator.userAgent.toLowerCase(); 
    var match = ua.match(/android\s([0-9\.]*)/);
    return match ? match[1] : false;
}, isIOS = function() {   
	return ( navigator.userAgent.match(/(iPod|iPhone|iPad)/) ? true : false );
}, copyToClipboard = function () {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val($('#wifi-voucher').val()).select();
    document.execCommand("copy");
    $temp.remove();
}, generateCode = function () {
    var code = "";
    var letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        digit = "0123456789";

    for( var i=0; i < 3; i++ )
        code += letter.charAt(Math.floor(Math.random() * letter.length));
    
    for( var j=0; j < 3; j++ )
        code += digit.charAt(Math.floor(Math.random() * digit.length));

    return code;
}

$('document').ready(function(){    
    responsiveHandler.init();
        
    var $body = $('body'),
        $timeout;
    
    if ( $body.hasClass('t2') ){    
        $(".more").click(function() {
            $(this).parents('.discount').toggleClass("expand");
        })
    }    
        
    if ( $body.hasClass('t4') ){
        var $voucher = $('input#wifi-voucher'),
            inp = $voucher[0];

//        $voucher.val(generateCode()); // for dummy voucher code   

        default_value = inp.value;
        
        inp.addEventListener("input", function () { 
            this.value = default_value;
        }, false);  
        
        $('.btn.copy').click(function(e) {
            e.preventDefault();
            copyToClipboard();

            if(isIOS()){
                document.getElementById("wifi-voucher").selectionStart = 0;
                document.getElementById("wifi-voucher").selectionEnd = 999;
                
                $voucher.on('copy', function(){
                    clearTimeout($timeout);
                    $timeout = setTimeout(function(){  document.activeElement.blur(); }, 500);                
                });
                
            }
        });
    }            
});

$(window).load(function(){   
    responsiveHandler.init();
});

})(jQuery);

