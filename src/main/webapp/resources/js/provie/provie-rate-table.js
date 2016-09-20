var provieRateTable = {};

provieRateTable = {
	usrTakeOverTable:null,
	order:-1,
	init:function(){

		var that = this;	
		
		
		that.initSyncOverflowTable();	
			
		
		

		 $(window).resize(function(){
            that.syncOverflowTable();
        });

		

        $(".btn-left").click(function(e){
            that.btnSlide(-1,$(e.currentTarget));
        });

        $(".btn-right").click(function(e){
            that.btnSlide(1,$(e.currentTarget));
        });		
	},
	
	initSyncOverflowTable:function(){
		var that = this;
		that.syncOverflowTable(0);
	},

	syncOverflowTable : function (num){

		$(".sticky-table").each(function(){
			var stickyTbl = $(this);
			var firstRow = 0;
			stickyTbl.find(".sticky-header tr").each(function(idx){
	        	var cellTag = "th";
	        	var cell = $(this).find(cellTag);

	        	if(cell.length == 0){
	        		cellTag = "td";
	        		cell = $(this).find(cellTag);	
	        	}

	            var targetCell = $(stickyTbl.find(".overflow-body tr").get(idx)).find(cellTag);

	            var h = Math.max(cell.height(),targetCell.height());

	            targetCell.height(h);
	            cell.height(h);

	            
	            
	            if(idx == 0) firstRow = h;
	        });
	        
	        stickyTbl.find(".sticky-btns").css("top",(firstRow - 20 )/2 + "px");	
	        
	        num = num || Math.round(stickyTbl.find(".overflow-body").scrollLeft() / stickyTbl.find(".overflow-body").width()) + 1;
	        var pos = stickyTbl.find(".overflow-body").width() * (num - 1);
	        stickyTbl.find(".overflow-body").scrollLeft(pos);
		});
		
        
    },

    btnSlide : function (needle,elm){
    	var stickyBd = elm.parents(".sticky-table").find(".overflow-body");
    	console.log(elm)
        var idx = Math.round(stickyBd.scrollLeft() / stickyBd.width()) + 1;
        this.toSlide(elm,idx + needle);
	},

	toSlide : function(elm,idx,duration){
		var pos = elm.parents(".sticky-table").find(".overflow-body").width() * (idx - 1);
		duration = duration || 480;
        elm.parents(".sticky-table").find(".overflow-body").animate({scrollLeft:pos},duration);
	}


};

$(document).ready(function(){
	provieRateTable.init();
});

;(function(f){"use strict";"function"===typeof define&&define.amd?define(["jquery"],f):"undefined"!==typeof module&&module.exports?module.exports=f(require("jquery")):f(jQuery)})(function($){"use strict";function n(a){return!a.nodeName||-1!==$.inArray(a.nodeName.toLowerCase(),["iframe","#document","html","body"])}function h(a){return $.isFunction(a)||$.isPlainObject(a)?a:{top:a,left:a}}var p=$.scrollTo=function(a,d,b){return $(window).scrollTo(a,d,b)};p.defaults={axis:"xy",duration:0,limit:!0};$.fn.scrollTo=function(a,d,b){"object"=== typeof d&&(b=d,d=0);"function"===typeof b&&(b={onAfter:b});"max"===a&&(a=9E9);b=$.extend({},p.defaults,b);d=d||b.duration;var u=b.queue&&1<b.axis.length;u&&(d/=2);b.offset=h(b.offset);b.over=h(b.over);return this.each(function(){function k(a){var k=$.extend({},b,{queue:!0,duration:d,complete:a&&function(){a.call(q,e,b)}});r.animate(f,k)}if(null!==a){var l=n(this),q=l?this.contentWindow||window:this,r=$(q),e=a,f={},t;switch(typeof e){case "number":case "string":if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(e)){e= h(e);break}e=l?$(e):$(e,q);case "object":if(e.length===0)return;if(e.is||e.style)t=(e=$(e)).offset()}var v=$.isFunction(b.offset)&&b.offset(q,e)||b.offset;$.each(b.axis.split(""),function(a,c){var d="x"===c?"Left":"Top",m=d.toLowerCase(),g="scroll"+d,h=r[g](),n=p.max(q,c);t?(f[g]=t[m]+(l?0:h-r.offset()[m]),b.margin&&(f[g]-=parseInt(e.css("margin"+d),10)||0,f[g]-=parseInt(e.css("border"+d+"Width"),10)||0),f[g]+=v[m]||0,b.over[m]&&(f[g]+=e["x"===c?"width":"height"]()*b.over[m])):(d=e[m],f[g]=d.slice&& "%"===d.slice(-1)?parseFloat(d)/100*n:d);b.limit&&/^\d+$/.test(f[g])&&(f[g]=0>=f[g]?0:Math.min(f[g],n));!a&&1<b.axis.length&&(h===f[g]?f={}:u&&(k(b.onAfterFirst),f={}))});k(b.onAfter)}})};p.max=function(a,d){var b="x"===d?"Width":"Height",h="scroll"+b;if(!n(a))return a[h]-$(a)[b.toLowerCase()]();var b="client"+b,k=a.ownerDocument||a.document,l=k.documentElement,k=k.body;return Math.max(l[h],k[h])-Math.min(l[b],k[b])};$.Tween.propHooks.scrollLeft=$.Tween.propHooks.scrollTop={get:function(a){return $(a.elem)[a.prop]()}, set:function(a){var d=this.get(a);if(a.options.interrupt&&a._last&&a._last!==d)return $(a.elem).stop();var b=Math.round(a.now);d!==b&&($(a.elem)[a.prop](b),a._last=this.get(a))}};return p});