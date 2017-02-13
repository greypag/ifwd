var currencyRate = {
	"hkd" : {
		r:1.025,
		y1:419.15,
		y2:878.04,
		y3:1000,
		s:"$",
		min:94100,
		max:9400600,
		g3:0.47003,
		g1:0.41915,
		g2:0.87804
	},
	"rmb" :{
		r:1.040,
		y1:410.06,
		y2:865.38,
		y3:1000,
		s:"¥",
		min:72600,
		max:7251300,
		g3: 0.45321,
		g1: 0.41006,
		g2: 0.86538
	} 
}
$(document).ready(function(){


	$(".checkbox-slider--b input[type='checkbox']").change(function(){
 		var p = $(this).parent();
 		p.removeClass("on off");
 		if($(this).is(":checked")) {
 			p.addClass("on");
 		}else{
 			p.addClass("off");
 		}

 		if(p.hasClass("on")){
 			$(".chart-hkd").removeClass("show");
 			$(".chart-hkd").addClass("hide");
 			$(".chart-rmb").addClass("show");
 		}else{
 			$(".chart-rmb").removeClass("show");
 			$(".chart-rmb").addClass("hide");
 			$(".chart-hkd").addClass("show");
 		}
 	});

 	$("#txt_amount").on("focus",function(e){
 		var val = $(this).val().replace(/[^0-9.]/g, "");
		var newVal = formatNumberComma(val);
 		if(val != "" &&  newVal != $(this).val()){
 			$(this).val(formatNumberComma(val));
 		}
 	});

 	$("#txt_amount").on("blur",function(e){
 		var val = $(this).val().replace(/[^0-9.]/g, "");
		var newVal = formatNumberComma(val);
 		if(val != "" &&  newVal != $(this).val()){
 			$(this).val(formatNumberComma(val));
 		}
 	});
		
 	$("#txt_amount").on("keypress",function(evt){
 		var charCode = (evt.which) ? evt.which : evt.keyCode;
 		var txt = String.fromCharCode(charCode);
 		var FnKey = [
 			45,	//Insert
			46,	//Delete
			36,	//Home
			35,	//End
			37,	//Left
			38,	//Top
			39,	//Right
			40,	//Bottom
			8	//Backspace
		];
        if((!txt.match(/[0-9\,]/) || $.inArray(charCode,FnKey) != -1)) 
        {
            return false;
        }else{

        }

 	});

 	$("#txt_amount").on("keyup",function(e){
 		var val = $(this).val().replace(/[^0-9.]/g, "");
 		var newVal = formatNumberComma(val);
 		if(val != "" &&  newVal != $(this).val()){
 			$(this).val(formatNumberComma(val));
 		}
 	});



 	$(".btn-calculate").click(function(){
 		var amount = parseInt($("#txt_amount").val().replace(/,/ig,""),10) ;
 		var errMsg = "";
 		if(!isNaN(amount)){
 			
 			var currency = $("#sel_currency").val();

 			var cb_next = currency == "rmb";
 			var cb_curr = $("input[name='cb1']").prop("checked");

 			if(cb_next != cb_curr){
 				$("input[name='cb1']").prop("checked",cb_next);
 				$("input[name='cb1']").change();
 			}


 			if(currencyRate[currency].min > amount){
 				//Min reached
 				errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid."+ currency+".min");
 			}else if(currencyRate[currency].max < amount){
 				//Max reached
 				errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid."+ currency+".max");
 			}else if(amount % 100 != 0){
 				errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid.amount.multiple");
 			}else{
 				showCalculatedRate(amount,currency);
 				$(".tbl-result-wrapper").collapse("show");

 				//recalibrate Table Height
 				recalibrateTable();
 				$.scrollTo('.box-result', 300, {offset:{top:($(".logobox").outerHeight() + 50) * -1}});
 			}

 		}else{
 			//Error handling?
 			errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid.amount.multiple");
 		}

 		if(errMsg != ""){
 			$("#box-input-msg").text(errMsg).show();
 		}else{
 			$("#box-input-msg").hide();
 		}
 	});

 	$(".savie-landing .start-btn").on('click', function(){
 		$.scrollTo('.wp_productCalculator', 300, {offset:{top:($(".logobox").outerHeight() + 20) * -1}});
	});
 	
 	//showCalculatedRate(100000,"hkd");
 	$("#sel_savie_provie").change(function(){
 		var val = $(this).val();
 		console.log("val",val);
 		$("#tableData").find("." + val).children().each(function(){
 			console.log($(this));
 			var key = $(this).attr("class");
 			
 			var field = $(".pv_compareTable").find(".sw-"+key);
 			field.html($(this).html());
 			
 			if(key == "monthly"){
 				var tdObj = field.parents("td");
 				if(!$(this).html().replace(/\s+/g, '')){
 					tdObj.removeClass("sep");
 				}else{
 					tdObj.addClass("sep");
 				}
 			}
 		});
 	});

 	$("#tableCarousel").swipe( {
		//Generic swipe handler for all directions
		swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
			if(direction == "right"){
				$("#tableCarousel .left.carousel-control").trigger("click");
			}else if(direction == "left"){
				$("#tableCarousel .right.carousel-control").trigger("click");
			}
		}, allowPageScroll: "auto"
	});
 	
 	$("#sel_savie_provie").parents(".sel_wrapper").css("width", $("#sel_savie_provie").width() + 30);
 	
 	var recalibrateTableTimeout;
 	$(window).resize(function(){
		recalibrateTable_discount();
		
 		clearTimeout(recalibrateTableTimeout);
 		recalibrateTableTimeout = setTimeout(recalibrateTable,500);
 		$("#sel_savie_provie").parents(".sel_wrapper").css("width", $("#sel_savie_provie").width() + 30);
 	});

 	$(".col-data-control.right").on("click",function(){
 		$(".col-data").animate({scrollLeft:"200%"},300);
 	});

 	$(".col-data-control.left").on("click",function(){
 		$(".col-data").animate({scrollLeft:0},300);
 	});
	
 	$(".discount-col-data-control.right").on("click",function(){
 		$(".discount-col-data").animate({scrollLeft:"500%"},300);
 	});

 	$(".discount-col-data-control.left").on("click",function(){
 		$(".discount-col-data").animate({scrollLeft:0},300);
 	});
	
	//calculate heading height of discunt example table
	recalibrateTable_discount();
});

function recalibrateTable(){
	var maxHeight = 0;
	
	$(".tbl-result-wrapper .tbl-wrapper th").each(function(){
		maxHeight = Math.max($(this).height(),maxHeight);
	});
	
	$(".tbl-result-wrapper .tbl-wrapper th").height(maxHeight);
}



function showCalculatedRate(_amount,_currency){

	var rate = currencyRate[_currency].r;
	var thirdYear = (((_amount / 2 * rate) + _amount / 2) * rate) * rate;
	var symbol = currencyRate[_currency].s;

	if (_currency == "hkd"){
		$(".calTableTitleHKD").css("display","table-row");
		$(".calTableTitleRMB").css("display","none");
	}else if (_currency == "rmb"){
		$(".calTableTitleRMB").css("display","table-row");
		$(".calTableTitleHKD").css("display","none");
	}
	
	var guaranteedCash_3rd =Math.ceil(_amount / 2 / currencyRate[_currency].g3);
	var guaranteedCash_1st = Math.floor(guaranteedCash_3rd * currencyRate[_currency].g1);
	var guaranteedCash_2nd = Math.floor(guaranteedCash_3rd * currencyRate[_currency].g2);
	
	$(".ttl_pay_amount").text(formatDollar(_amount ,symbol));
	$(".yrs3_return").text(formatDollar(guaranteedCash_3rd,symbol));
	
	$(".y1-c1").text(formatDollar(_amount / 2,symbol));
	$(".y1-c2").text(formatDollar(_amount / 2 * 1.1,symbol));
	$(".y1-c3").text(formatDollar(Math.floor(guaranteedCash_1st),symbol));

	$(".y2-c1").text(formatDollar(_amount,symbol));
	$(".y2-c2").text(formatDollar(_amount * 1.1,symbol));
	$(".y2-c3").text(formatDollar(Math.floor(guaranteedCash_2nd),symbol));

	$(".y3-c1").text(formatDollar(_amount,symbol));
	//For RMB, the third year of the Death Benefit should take the highest value out of Death Benefit and Guaranteed Cash
	if (_currency == "hkd"){
		$(".y3-c2").text(formatDollar(_amount * 1.1,symbol));
	}
	else {
		if (_amount * 1.1 > guaranteedCash_3rd){
		$(".y3-c2").text(formatDollar(_amount * 1.1,symbol));
		}
		else{
			$(".y3-c2").text(formatDollar(guaranteedCash_3rd,symbol),symbol);
		}
	}

	$(".y3-c3").text(formatDollar(guaranteedCash_3rd,symbol));
	
	$(".box-result .over-bubble").addClass("hide");
 	$(".box-result ." + _currency).removeClass("hide");
 	
 }

function formatDollar(_amount, _symbol){
	return _symbol + formatNumberComma(parseInt(_amount,10));
}

/**
 * Copyright (c) 2007-2015 Ariel Flesler - aflesler<a>gmail<d>com | http://flesler.blogspot.com
 * Licensed under MIT
 * @author Ariel Flesler
 * @version 2.1.2
 */
;(function(f){"use strict";"function"===typeof define&&define.amd?define(["jquery"],f):"undefined"!==typeof module&&module.exports?module.exports=f(require("jquery")):f(jQuery)})(function($){"use strict";function n(a){return!a.nodeName||-1!==$.inArray(a.nodeName.toLowerCase(),["iframe","#document","html","body"])}function h(a){return $.isFunction(a)||$.isPlainObject(a)?a:{top:a,left:a}}var p=$.scrollTo=function(a,d,b){return $(window).scrollTo(a,d,b)};p.defaults={axis:"xy",duration:0,limit:!0};$.fn.scrollTo=function(a,d,b){"object"=== typeof d&&(b=d,d=0);"function"===typeof b&&(b={onAfter:b});"max"===a&&(a=9E9);b=$.extend({},p.defaults,b);d=d||b.duration;var u=b.queue&&1<b.axis.length;u&&(d/=2);b.offset=h(b.offset);b.over=h(b.over);return this.each(function(){function k(a){var k=$.extend({},b,{queue:!0,duration:d,complete:a&&function(){a.call(q,e,b)}});r.animate(f,k)}if(null!==a){var l=n(this),q=l?this.contentWindow||window:this,r=$(q),e=a,f={},t;switch(typeof e){case "number":case "string":if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(e)){e= h(e);break}e=l?$(e):$(e,q);case "object":if(e.length===0)return;if(e.is||e.style)t=(e=$(e)).offset()}var v=$.isFunction(b.offset)&&b.offset(q,e)||b.offset;$.each(b.axis.split(""),function(a,c){var d="x"===c?"Left":"Top",m=d.toLowerCase(),g="scroll"+d,h=r[g](),n=p.max(q,c);t?(f[g]=t[m]+(l?0:h-r.offset()[m]),b.margin&&(f[g]-=parseInt(e.css("margin"+d),10)||0,f[g]-=parseInt(e.css("border"+d+"Width"),10)||0),f[g]+=v[m]||0,b.over[m]&&(f[g]+=e["x"===c?"width":"height"]()*b.over[m])):(d=e[m],f[g]=d.slice&& "%"===d.slice(-1)?parseFloat(d)/100*n:d);b.limit&&/^\d+$/.test(f[g])&&(f[g]=0>=f[g]?0:Math.min(f[g],n));!a&&1<b.axis.length&&(h===f[g]?f={}:u&&(k(b.onAfterFirst),f={}))});k(b.onAfter)}})};p.max=function(a,d){var b="x"===d?"Width":"Height",h="scroll"+b;if(!n(a))return a[h]-$(a)[b.toLowerCase()]();var b="client"+b,k=a.ownerDocument||a.document,l=k.documentElement,k=k.body;return Math.max(l[h],k[h])-Math.min(l[b],k[b])};$.Tween.propHooks.scrollLeft=$.Tween.propHooks.scrollTop={get:function(a){return $(a.elem)[a.prop]()}, set:function(a){var d=this.get(a);if(a.options.interrupt&&a._last&&a._last!==d)return $(a.elem).stop();var b=Math.round(a.now);d!==b&&($(a.elem)[a.prop](b),a._last=this.get(a))}};return p});


function recalibrateTable_discount(){
	var maxHeight = 0;
	var rowNum = 4;
	
	$(".tbl-discount .tbl-wrapper th").removeAttr('style');
	$(".tbl-discount .tbl-wrapper th").each(function(){
		maxHeight = Math.max($(this).height(),maxHeight);
	});
	$(".tbl-discount .tbl-wrapper th").height(maxHeight);
	
	for(i=1;i<=rowNum;i++){
		maxHeight = 0;
		$(".tbl-discount .tbl-wrapper td.r"+i).removeAttr('style');
		$(".tbl-discount .tbl-wrapper td.r"+i).each(function(){
			maxHeight = Math.max($(this).height(),maxHeight);
		});
		$(".tbl-discount .tbl-wrapper td.r"+i).height(maxHeight);
	}
}