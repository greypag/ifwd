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
	"yearEmpty":"請選擇供款年期。"
};

"use static";
var planFormValidator = null;
var planDetailHelper = null;
var behaviourSlider = null;
$(document).ready(function (){
	planFormValidator = planFormValidatorHelper();

	behaviourSlider = document.getElementById('slider');
	noUiSlider.create(behaviourSlider, {
			start: [ 0, 0 ],
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
	behaviourSlider.noUiSlider.on('slide', function (curValueStr){
		var idx = parseInt(curValueStr, 10) / 10;
		grayBar$.css("width", grayBarWidthRange[idx] + "%");

		planDetailHelper.changeYear(idx);
	});
});

var fnaHelper = (function (){
	var helper = {};

	helper.showForgotPwdPopup = function (){
		$("#loginpopup").modal();$("#link-forgotPassword").click();
	};
	helper.showForgotUserPopup = function (){
		$("#loginpopup").modal();$("#forgotUserName").click();
	};

	$("pv_fna .btnStart").click(function (){
		$.ajax({
			beforeSend:function(){
				$("#loading-overlay").modal("show");
			},
			url:"/api/member/login",
			type:"post",
			contentType: "application/json",
			data:JSON.stringify(postData),
			cache:false,
			async:false,
			error:function(response){
				$(".loginPanErrMsg").append($("<small/>").text(response.responseJSON.message));	
		    },
		    success:function(response){
		    	if(response){
		    		console.log(response);
		    		//redirect to FNA page

		    		//if not success, then what????
		    	}
		    },
		    complete:function(){
		    	$("#loading-overlay").modal("hide");
		    }
		});
	});

	$(".pv_fna .btnForgotUser").click(helper.showForgotUserPopup);

	$(".pv_fna .btnForgotPwd").click(helper.showForgotPwdPopup);
	
	return helper;
})();

function planDetails(data){
	var planData = data;

	var rateLife = 1.2;
	var rateAccidental = 1.2;
	var rateCancer = 1.2;

	var accountValue$ = null;
	var totalPaid$ = null;
	var exLifeAmount$ = null;
	var exAccidentalAmount$ = null;
	var exCancerAmount$ = null;


	return {
		reset : function (){
			behaviourSlider.noUiSlider.set([0, 0]);
			//unhide monthly fee
		},
		changeYear : function (yearIdx){
			//planData[yearIdx].accountValue
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
		reset: function (){
			submitData = {};
			errorOutputAry = [];
			errorList$.empty();

			planDetailHelper.reset();
		},
		checkInput: function (){
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
			    	console.log(response.plans);

			    	for (var ni = 1; ni <= 5; ni++) {
			    		$(".pv_plan .scaleBottom " + ".num"+ ni).html(response.plans[ni-1].rate);
			    		console.log("rate", response.plans[ni-1].rate);
			    	}

			    	//pass data to details helper
			    	planDetailHelper = planDetails(response.plans);
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
	};
}