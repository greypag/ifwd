var currencyRate = {
	"hkd" : {
		r:1.025,
		y1:419.15,
		y2:878.04,
		y3:1000,
		s:"$"
	},
	"rmb" :{
		r:1.040,
		y1:410.06,
		y2:865.39,
		y3:1000,
		s:"¥"
	} 
}
$(document).ready(function(){


	$("input[type='checkbox']").change(function(){
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

 	$(".btn-calculate").click(function(){
 		var amount = parseInt($("#txt_amount").val().replace(/,/ig,""),10);
 		if(!isNaN(amount)){
 			if(amount > 0){
 				var currency = $("#sel_currency").val();
 				showCalculatedRate(amount,currency);
 			}else{
 				//Error handling?
 			}
 		}else{
 			//Error handling?
 		}
 	});

 	showCalculatedRate(100000,"hkd");

 	$("#sel_savie_provie").change(function(){
 		var val = $(this).val();
 		console.log("val",val);
 		$("#tableData").find("." + val).children().each(function(){
 			console.log($(this));
 			var key = $(this).attr("class");

 			$(".pv_compareTable").find(".sw-"+key).html($(this).html());
 		});
 	});


});



function showCalculatedRate(_amount,_currency){

	

	var rate = currencyRate[_currency].r;
	var thirdYear = (((_amount * rate) + _amount) * rate) * rate;
	var symbol = currencyRate[_currency].s;

	$(".ttl_pay_amount").text(formatDollar(_amount * 2,symbol));
	$(".yrs3_return").text(formatDollar(thirdYear,symbol));


	$(".y1-c1").text(formatDollar(_amount,symbol));
	$(".y1-c2").text(formatDollar(_amount * 1.1,symbol));
	$(".y1-c3").text(formatDollar(thirdYear * currencyRate[_currency].y1 / 1000,symbol));

	$(".y2-c1").text(formatDollar(_amount * 2,symbol));
	$(".y2-c2").text(formatDollar(_amount * 2 * 1.1,symbol));
	$(".y2-c3").text(formatDollar(thirdYear * currencyRate[_currency].y2 / 1000,symbol));

	$(".y3-c1").text(formatDollar(_amount * 2,symbol));
	$(".y3-c2").text(formatDollar(_amount * 2 * 1.1,symbol));
	$(".y3-c3").text(formatDollar(thirdYear * currencyRate[_currency].y3 / 1000,symbol));	
}

function formatDollar(_amount, _symbol){
	return _symbol + formatNumberComma(parseInt(_amount,10));
}
