var savieDiscount = {};

savieDiscount = {
	usrTakeOverTable:null,
	order:-1,
	init:function(){

		var that = this;	
		
		$(".btn-spd-start").click(function(){
			//$(".spd-wrapper-inner").scrollTo(800);	
			$.scrollTo(this.hash, 800,{offset:{top:-50}});
			$(".spd-wrapper-inner").slideDown(400,function(){
				that.initSyncOverflowTable();	
			});
			return false;
		});
		
		/*$("#input-hkid").on("keyup",function(){
			console.log(IsHKID($(this).val()));
			console.log("$(this).val()",$(this).val());
		});
		*/
			

		$(".btn-hkid-submit").click(function(){
			$( "#form-hkid" ).submit();
			
		});

		$( "#form-hkid" ).submit(function( evt) {
			evt.preventDefault();
			
			var hkidVal = $("#input-hkid").val();	
			var isValidHKID = IsHKID(hkidVal);

			$(".tbl-spd, .tbl-spd-mobile").find("td").removeClass("bingo");	
			$(".won-msg, .loss-msg").hide();

			if(isValidHKID){
				$(".hkid-err-msg").empty();

				var count = (hkidVal.match(/[023]/g) || []).length;
				
				if(count > 0){

					$(".tbl-spd, .tbl-spd-mobile").find(".b" + count).addClass("bingo");
					$(".won-msg").slideDown();

					that.toSlide(count,700);


				}else{
					$(".loss-msg").slideDown();

				}
				
				
			}else{
				
				if($.trim(hkidVal) == ""){
					$(".hkid-err-msg").text(getBundle(getBundleLanguage, "savie.online.home.discount.error.hkid.empty"));
				}else{
					$(".hkid-err-msg").text(getBundle(getBundleLanguage, "savie.online.home.discount.error.hkid"));
				}
				
			}
			
		});

		 $(window).resize(function(){
            that.syncOverflowTable();
        });

		

        $(".btn-left").click(function(){
            that.btnSlide(-1);
        });

        $(".btn-right").click(function(){
            that.btnSlide(1);
        });
        
        /*$(".btn-spd-next").click(function(){
        	$("#spdModal").modal("show");
        });*/
        
        $(".btn-spd-tnc").click(function(){
        	$("#tncModal").modal("show");
        });
		
	},
	
	initSyncOverflowTable:function(){
		var that = this;
		that.syncOverflowTable(7);
        //$(".overflow-body").scrollLeft($(".overflow-body").width() * (7 - 1));
        $('.overflow-body').css('visibility','visible').hide().fadeIn(480,function(){
        	that.usrTakeOverTable = setInterval(function(){

        		var idx = Math.round($(".overflow-body").scrollLeft() / $(".overflow-body").width()) + 1;
        		var duration = 480;
        		if(idx == 1 && that.order == -1){
        			that.order = 1;
        		}else if(idx == 7 && that.order == 1){
        			that.order = -1;
        		}
        		
        		idx+=that.order;
        		
        		that.toSlide(idx);
        	},5000);
        });
        
        $(".overflow-body").on("touchstart",function(){
        	clearInterval(that.usrTakeOverTable);
        });
        
        $("#input-hkid").on("focus",function(){
        	clearInterval(that.usrTakeOverTable);
        });
	},

	syncOverflowTable : function (num){
		var firstRow = 0;
        $(".sticky-header tr").each(function(idx){
            var h = $(this).find("th").height();
            $($(".overflow-body tr").get(idx)).find("td").height(h);
            
            if(idx == 0) firstRow = h;
        });
        
        $(".sticky-btns").css("top",(firstRow - 27 )/2 + "px");	
        
        num = num || Math.round($(".overflow-body").scrollLeft() / $(".overflow-body").width()) + 1;
        var pos = $(".overflow-body").width() * (num - 1);
        $(".overflow-body").scrollLeft(pos);
        
    },

    btnSlide : function (needle){
        var idx = Math.round($(".overflow-body").scrollLeft() / $(".overflow-body").width()) + 1;
        this.toSlide(idx + needle);
	},

	toSlide : function(idx,duration){
		var pos = $(".overflow-body").width() * (idx - 1);
		duration = duration || 480;
        $(".overflow-body").animate({scrollLeft:pos},duration);
	}


};

$(document).ready(function(){
	savieDiscount.init();
});

;(function(f){"use strict";"function"===typeof define&&define.amd?define(["jquery"],f):"undefined"!==typeof module&&module.exports?module.exports=f(require("jquery")):f(jQuery)})(function($){"use strict";function n(a){return!a.nodeName||-1!==$.inArray(a.nodeName.toLowerCase(),["iframe","#document","html","body"])}function h(a){return $.isFunction(a)||$.isPlainObject(a)?a:{top:a,left:a}}var p=$.scrollTo=function(a,d,b){return $(window).scrollTo(a,d,b)};p.defaults={axis:"xy",duration:0,limit:!0};$.fn.scrollTo=function(a,d,b){"object"=== typeof d&&(b=d,d=0);"function"===typeof b&&(b={onAfter:b});"max"===a&&(a=9E9);b=$.extend({},p.defaults,b);d=d||b.duration;var u=b.queue&&1<b.axis.length;u&&(d/=2);b.offset=h(b.offset);b.over=h(b.over);return this.each(function(){function k(a){var k=$.extend({},b,{queue:!0,duration:d,complete:a&&function(){a.call(q,e,b)}});r.animate(f,k)}if(null!==a){var l=n(this),q=l?this.contentWindow||window:this,r=$(q),e=a,f={},t;switch(typeof e){case "number":case "string":if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(e)){e= h(e);break}e=l?$(e):$(e,q);case "object":if(e.length===0)return;if(e.is||e.style)t=(e=$(e)).offset()}var v=$.isFunction(b.offset)&&b.offset(q,e)||b.offset;$.each(b.axis.split(""),function(a,c){var d="x"===c?"Left":"Top",m=d.toLowerCase(),g="scroll"+d,h=r[g](),n=p.max(q,c);t?(f[g]=t[m]+(l?0:h-r.offset()[m]),b.margin&&(f[g]-=parseInt(e.css("margin"+d),10)||0,f[g]-=parseInt(e.css("border"+d+"Width"),10)||0),f[g]+=v[m]||0,b.over[m]&&(f[g]+=e["x"===c?"width":"height"]()*b.over[m])):(d=e[m],f[g]=d.slice&& "%"===d.slice(-1)?parseFloat(d)/100*n:d);b.limit&&/^\d+$/.test(f[g])&&(f[g]=0>=f[g]?0:Math.min(f[g],n));!a&&1<b.axis.length&&(h===f[g]?f={}:u&&(k(b.onAfterFirst),f={}))});k(b.onAfter)}})};p.max=function(a,d){var b="x"===d?"Width":"Height",h="scroll"+b;if(!n(a))return a[h]-$(a)[b.toLowerCase()]();var b="client"+b,k=a.ownerDocument||a.document,l=k.documentElement,k=k.body;return Math.max(l[h],k[h])-Math.min(l[b],k[b])};$.Tween.propHooks.scrollLeft=$.Tween.propHooks.scrollTop={get:function(a){return $(a.elem)[a.prop]()}, set:function(a){var d=this.get(a);if(a.options.interrupt&&a._last&&a._last!==d)return $(a.elem).stop();var b=Math.round(a.now);d!==b&&($(a.elem)[a.prop](b),a._last=this.get(a))}};return p});
