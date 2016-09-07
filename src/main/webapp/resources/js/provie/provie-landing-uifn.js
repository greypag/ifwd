var errMsg = {
	"genderEmpty": "請選擇性別。",
	"ageEmpty": "請輸入你的年齡。",
	"ageLess":"您的年齡必須是18歲以上。",
	"ageMore":"您的年齡必須是59歲以下。",
	"methodEmpty":"請選擇繳費方式。",
	"amountEmpty":"請輸入你的供款。",
	"amountRPHKDLess":"月繳供款最少為HKD$1,000。",
	"amountRPHKDMore":"月繳供款最多為HKD$20,000。",
	"amountSPHKDLess":"一筆過供款最少為HKD$30,000。",
	"amountSPHKDMore":"一筆過供款最多為HKD$1,000,000。",
	"amountRPUSDLess":"月繳供款最少為USD$125。",
	"amountRPUSDMore":"月繳供款最多為USD$2,500。",
	"amountSPUSDLess":"一筆過供款最少為USD$3,750。",
	"amountSPUSDMore":"一筆過供款最多為USD$125,000。",
	"currencyEmpty":"請選擇貨幣。",
	"yearEmpty":"請選擇供款年期。",
	"loginFail":"未能成功登入。"
};

"use static";

var currencyData = {
	"HKD": {
		"fixRate": [1.5, 1.5, 2, 2, 3, 2, 2],
		"enPricePrefix": "HK$",
		"tcPricePrefix": "港元"
	},
	"USD": {
		"fixRate": [2, 2, 2, 2, 3, 2, 2],
		"enPricePrefix": "US$",
		"tcPricePrefix": "美元"
	}
}


var planFormValidator = null;
var planDetailHelper = null;
var behaviourSlider = null;

$(document).ready(function (){
	$(".pv_plan_wrap .cardWrap").autoAlignHeight({child: ".card", minWidth: 992});
	$(".pv_plan_wrap .cardWrap .card").autoAlignHeight({child: ".name", minWidth: 992});
	
	planFormValidator = planFormValidatorHelper();
	planFormValidator.init();

	var fnaHelper = fnaLogin();
	fnaHelper.init();

	behaviourSlider = document.getElementById('slider');
	noUiSlider.create(behaviourSlider, {
			start: [0,0],
			step: 10,
			behaviour: 'drag',
			connect: true,
			range: {
			'min':  0,
			'max':  60
		}
	});

	//create gray color bar for slider
	var grayBarWidthRange = [33.333, 40, 50, 66.8, 100, 100, 100];
	var grayBar$ = $("<div/>").addClass("grayBox");
	grayBar$.appendTo($(".pv_plan .pv_plan_wrap #slider .noUi-origin.noUi-background"));
	behaviourSlider.noUiSlider.on('update', function (curValueAry){
		var idx = parseInt(curValueAry[1], 10) / 10;
		grayBar$.css("width", grayBarWidthRange[idx] + "%");

		planDetailHelper.changeYear(idx);
		console.log(idx);
	});

});

function fnaLogin(){
	return {
		init: function (){
			$(".pv_fna .btnStart").click(function (){
				$.ajax({
					beforeSend:function(){
						$("#loading-overlay").modal("show");
					},
					url:"/fwdhk/api/member/login",
					type:"post",
					contentType: "application/json",
					data:JSON.stringify({
						userName:$("#fnaUser").val(),
						password:$("#fnaPwd").val()
					}),
					cache:false,
					async:false,
					error:function(response){
						$(".pv_fna .errorMsg").html(errMsg.loginFail);
				    },
				    success:function(response){
				    	if(response){
				    		//TODO: redirect to FNA page

				    	}
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
			});

			$(".pv_fna .btnForgotUser").click(this.showForgotUserPopup);

			$(".pv_fna .btnForgotPwd").click(this.showForgotPwdPopup);
		},
		showForgotPwdPopup: function (){
			$("#loginpopup").modal();$("#link-forgotPassword").click();
		},
		showForgotUserPopup: function (){
			$("#loginpopup").modal();$("#forgotUserName").click();
		}
	}
}

function planDetails(data){
	var planData = data;

	var rateLife = 1;
	var rateAccidental = 5;
	var rateCancer = .5;

	var monthlyValue$ = $(".pv_plan .money .left");
	var accountValue$ = $(".pv_plan .amount");
	var totalPaid$ = $(".pv_plan .totalPaid");
	var yearNum$ = $(".pv_plan .accValue .year");
	var exLifeAmount$ = $(".pv_plan .card1 .price");
	var exAccidentalAmount$ = $(".pv_plan .card2 .price");
	var exCancerAmount$ = $(".pv_plan .card3 .price");


	return {
		reset : function (){
			behaviourSlider.noUiSlider.set([0, 0]);
			monthlyValue$.show();
		},
		changeYear : function (yearIdx){
			//planData[yearIdx].accountValue
			totalPaid$.html(toPriceStr(planData[yearIdx].totalPaid));
			
			var accountValue = planData[yearIdx].accountValue;
			accountValue$.html(toPriceStr(accountValue));
			
			yearNum$.html(planData[yearIdx].premiumYear);
			
			exLifeAmount$.html(toPriceStr(accountValue * rateLife));
			exAccidentalAmount$.html(toPriceStr(accountValue * rateAccidental));
			exCancerAmount$.html(toPriceStr(accountValue * rateCancer));

			//to re-align height of 3 card
			$(window).trigger('resize');
		}
	};
}


function planFormValidatorHelper(){
	var errorList$ = $(".pv_sec_calculator .error_list");
	var submitData = {};
	var amountLimit = {
		"minRPHKD": 1000,
		"maxRPHKD": 20000,
		"minSPHKD": 30000,
		"maxSPHKD": 1000000,
		"minRPUSD": 125,
		"maxRPUSD": 2500,
		"minSPUSD": 3750,
		"maxSPUSD": 125000,
	};
	var errorOutputAry = [];

	return {
		init: function (){
			var that = this;
			$(".pv_sec_calculator .btnSubmit").click(function (){
				that.trySubmit();
			});

			$(".pv_sec_calculator .input_age").on("change", function (){
				that.checkAge();
				that.fillYearOpt(submitData.age);
			});

			$(".pv_sec_calculator input[name=method]").on("change", function (){
				that.checkMethod();
				if(submitData.method == "SP"){
					$(".pv_sec_calculator .txtMonth").hide();
				}else{
					$(".pv_sec_calculator .txtMonth").show();
				}
			});			

		},
		reset: function (){
			submitData = {};
			errorOutputAry = [];
			errorList$.empty();

			if(!!planDetailHelper){
				planDetailHelper.reset();
			}
		},
		trySubmit: function (){
			this.reset();
			
			this.checkGender();
			this.checkAge();
			this.checkMethod();
			this.checkCurrency();
			this.checkAmount();
			
			if(errorOutputAry.length < 1){
				this.submitData();	
			}else{
				this.showErrMsg();
			}
		},
		checkGender : function (){
			//check not empty
			var genderSelected$ = $("input[name=gender]:checked");
			if(genderSelected$.length != 1){
				errorOutputAry.push(errMsg.genderEmpty);
				return;
			}
			submitData.gender = genderSelected$.val();
		},
		checkAge : function (){
			//check length >= 2
			var age$ = $(".input_age");
			if(age$.val().length < 2 || !(/^[0-9]{2}$/).test(age$.val())){
				age$.fource();
				errorOutputAry.push(errMsg.ageEmpty);
				return;
			}
			//check < 19
			if(age$.val() < 19){
				errorOutputAry.push(errMsg.ageLess);
				return;	
			}
			//check > 59
			if(age$.val() > 59){
				errorOutputAry.push(errMsg.ageMore);
				return;	
			}

			submitData.age = age$.val();
		},
		checkMethod : function (){
			var methodSelected$ = $("input[name=method]:checked");
			//check not empty
			if(methodSelected$.length != 1){
				errorOutputAry.push(errMsg.methodEmpty);
				return;
			}

			submitData.method = methodSelected$.val();
		},
		checkCurrency : function (){
			//check not empty
			var currencySelected$ = $("input[name=currency]:checked");
			if(currencySelected$.length != 1){
				errorOutputAry.push(errMsg.currencyEmpty);
				return;
			}

			submitData.currency = currencySelected$.val();
		},
		checkAmount : function (){
			// check min and max
			var amount$ = $(".input_amount");
			var limit = this.getAmountLimit(submitData.method, submitData.currency);
			if(!(/^[0-9]+$/).test(amount$.val())){
				errorOutputAry.push(errMsg.amountEmpty);
				return;
			}
			
			if(amount$.val() < limit.min){
				errorOutputAry.push(limit.lessMsg);
				return;
			}
			if(amount$.val() > limit.max){
				errorOutputAry.push(limit.moreMsg);
				return;
			}
			
			submitData.amount = amount$.val();
		},
		checkYear : function (){
			//not empty??
			var yearSelected$ = $("input[name=year]:checked");
			if(yearSelected$.length != 1){
				errorOutputAry.push(errMsg.yearEmpty);
				return;
			}
			submitData.year = yearSelected$.val();
		},
		getAmountLimit : function (method, currency){
			return {
				"min": amountLimit["min" + method + currency],
				"max": amountLimit["max" + method + currency],
				"lessMsg": errMsg["amount" + method + currency + "Less"],
				"moreMsg": errMsg["amount" + method + currency + "More"]
			};
		},
		fillYearOpt : function(age){
			//clear list 
			var yearList$ = $(".yearList");
			yearList$.find("li").remove();
			//loop all option (60 - age - 1)
			var yearOptCount = 60 - age - 1;
			for(var yi = 60; yi >= yearOptCount; yi--){
				var opt_input = $("<input>").attr({"type": "radio", "name": "year", "value": yi, "id":"year"+yi});
				var opt_label = $("<label>").attr({"for": "year"+yi}).html(yi);
				var opt = $("<li>");
				opt.append(opt_input).append(opt_label);
				
				yearList$.append(opt);
			}
			//auto select one? when age changed
		},
		showErrMsg : function (){
			for(var mi = 0; mi < errorOutputAry.length; mi++){
				var msg = $("<li>").html(errorOutputAry[mi]);
				errorList$.append(msg);		
			}
			
		},
		submitData : function (){
			var cusDob = new Date(new Date().getFullYear() - submitData.age - 1, 0 ,1);
			$.ajax({
			    beforeSend:function(){
			    	$("#loading-overlay").modal("show");
			    },
				url:"/fwdhk/api/provie/planDetails/",
				type:"get",
				data:{
					premium: submitData.amount,
					planCode:submitData.method,
					currency:submitData.currency,
					dob: cusDob,
					rider: "TERM_LIFE_BENEFIT"
				},	
				cache:false,
				async:false,
				error:function(){
					console.log("expected error");
			    },
			    success:function(response){
			    	//pack dummy year 15 and 100 if api not ready
			    	if(!response.creditRates){
			    		response.plans.push({
							"premiumYear": 15,
							"rate": 2,
							"accountValue": 10001,
							"deathBenefit": 10002,
							"riderValue": 10003,
							"totalPaid": 10000
						}, {
							"premiumYear": 100,
							"rate": 2,
							"accountValue": 10001,
							"deathBenefit": 10002,
							"riderValue": 10003,
							"totalPaid": 10000
						});
			    	}else{
			    		response.creditRates[2].shift();
			    		response,plans.push(response.creditRates[2].plans);
			    	}


			    	//pass data to details helper
			    	planDetailHelper = planDetails(response.plans);
			    	planDetailHelper.reset();

			    	for (var ni = 1; ni <= 7; ni++) {
			    		$(".pv_plan .scaleBottom " + ".num"+ ni).html(currencyData[submitData.currency].fixRate[ni - 1] + "%");
			    	}

			    	var monthlyValue$ = $(".pv_plan .money .left");
			    	if(submitData.method == "SP"){
						monthlyValue$.hide();
					}else{
						monthlyValue$.find(".monthlyFee").html(toPriceStr(submitData.amount));
					}

			    	if(!$(".pv_plan").hasClass("isShow")){
			    		$(".pv_plan").slideToggle( "slow" ).addClass("isShow");
			    	}

			    	//trigger first year 
			    	behaviourSlider.noUiSlider.set([0,0]);
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
	};
}

function toPriceStr(x) {
    return "$" + x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// sample config
// conf{
// 	child: ".inner",
// 	minWidth: 992
// }
$.fn.autoAlignHeight = function(conf) {
		var parentDom = this;
		var childDom = conf.child;
		var _conf = conf;

		reAlignHeight();

		$(window).on("resize", reAlignHeight);
		$(window).on("orientationchange", reAlignHeight);

		// window.onorientationchange = reAlignHeight;
		// window.onresize = reAlignHeight;

		function reAlignHeight(){
			if(window.innerWidth < _conf.minWidth){
				resetChildHeight();
				return;
			}
			alignChildHeight(parentDom, conf.child);
		}

		function resetChildHeight(){
			$(parentDom).find(childDom).each(function() {
		        $(this).css("height", "auto");
		    });
		}

		function alignChildHeight(sel, child) {
		    //reset all child height
			$(sel).find(child).css("height", "auto");
			
			setTimeout(function (){
				var max = 0;
			    $(sel).find(child).each(function() {
			        c_height = parseInt($(this).outerHeight(false));
			        if (c_height > max) {
			            max = c_height;
			        }
			    });
			    $(sel).find(child).outerHeight(max);
			    
			    if(!!conf.onFinish){
			    	conf.onFinish();
			    }
			}, 500);
			
		}	
	
};