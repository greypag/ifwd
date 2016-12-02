var currencyRate = {
	"hkd" : {
		r:1.025,
		y1:419.15,
		y2:878.04,
		y3:1000,
		s:"$",
		min:48000,
		max:4800000
	},
	"rmb" :{
		r:1.040,
		y1:410.06,
		y2:865.38,
		y3:1000,
		s:"¥",
		min:37000,
		max:3700000
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
 		var amount = parseInt($("#txt_amount").val().replace(/,/ig,""),10);
 		var errMsg = "";
 		if(!isNaN(amount)){
 			
 			var currency = $("#sel_currency").val();

 			if(currencyRate[currency].min > amount){
 				//Min reached
 				errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid."+ currency+".min");
 			}else if(currencyRate[currency].max < amount){
 				//Max reached
 				errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid."+ currency+".max");
 			}else{
 				showCalculatedRate(amount,currency);


 			}

 		}else{
 			//Error handling?
 			errMsg = getBundle(getBundleLanguage, "wealthree.input.error.invalid");
 		}

 		if(errMsg != ""){
 			$("#box-input-msg").text(errMsg).show();
 		}else{
 			$("#box-input-msg").hide();
 		}
 	});

 	//showCalculatedRate(100000,"hkd");
 	$("#sel_savie_provie").change(function(){
 		var val = $(this).val();
 		console.log("val",val);
 		$("#tableData").find("." + val).children().each(function(){
 			console.log($(this));
 			var key = $(this).attr("class");

 			$(".pv_compareTable").find(".sw-"+key).html($(this).html());
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

$(".col-data-control.left").click(function(){
	//scroll left function here
	var crt = 0;
	//var offset = 10;
	var scrollInterval = setInterval(function(){
		if(crt < 10){
			offset += 10;
			$("div.col-data").scrollLeft(offset);
			crt++;
		}else{
			clearInterval(scrollInterval);
		}
	}, 20);
});

});



function showCalculatedRate(_amount,_currency){

	

	var rate = currencyRate[_currency].r;
	var thirdYear = (((_amount * rate) + _amount) * rate) * rate;
	var symbol = currencyRate[_currency].s;

	if (_currency == "hkd"){
		$(".calTableTitleHKD").css("display","table-row");
		$(".calTableTitleRMB").css("display","none");
	}else if (_currency == "rmb"){
		$(".calTableTitleRMB").css("display","table-row");
		$(".calTableTitleHKD").css("display","none");
	}
	$(".tbl-result-wrapper").removeClass().addClass("tbl-result-wrapper");
	
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
	
	$(".box-result .over-bubble").hide();
 	$(".box-result ." + _currency).show();
 	
 	setTimeout(function(){
 		var far = $('.col-data').width()+50;
 	    var pos = $('.col-data').scrollLeft() + far;
 	    $(".col-data").animate( { scrollLeft: pos }, 1000, 'easeOutQuad' )
 	}, 500);
 }

function formatDollar(_amount, _symbol){
	return _symbol + formatNumberComma(parseInt(_amount,10));
}
