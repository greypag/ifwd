"use static";
var dummyJson = {"plans":[{"premiumYear":1,"rate":1.0,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":2,"rate":1.1,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":3,"rate":1.2,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":4,"rate":1.3,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":5,"rate":1.4,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0}]};

var pvCtr = {
	//values
	planSlider: document.getElementById('slider'),
	planDetailCtr: {},
	cal3Card : {},
	useDummyResult: true,
	//function
	onReady : function(){
		this.initAutoHeight();
		this.initPlanSlider();

		planInquiry.init();
		fnaLogin.init();
	},
	initAutoHeight: function(){
		this.cal3Card = $(".pv_plan_wrap .cardWrap").autoAlignHeight({child: ".card", minWidth: 0});
		$(".pv_plan_wrap .cardWrap .card").autoAlignHeight({child: ".name", minWidth: 0});
	},
	initPlanSlider: function (){
		noUiSlider.create(this.planSlider, {
			start    : [0,0],
			step     : 10,
			behaviour: 'drag',
			connect  : true,
			range    : {
				'min':  0,
				'max':  50
			}
		});

		this.initGraySliderBar();
	},
	initGraySliderBar: function(){
		//create gray color bar for slider
		var grayBarWidthRange = [20, 40, 50, 60, 80, 100];

		var grayBar$ = $("<div/>").addClass("grayBox").appendTo($(".pv_plan .pv_plan_wrap #slider .noUi-origin.noUi-background"));

		this.planSlider.noUiSlider.on('update.gray', function (curValueAry){
			var p = 100 -parseInt(curValueAry[1], 10) / 50 * 100;
			grayBar$.css("width", 20/p * 100 + "%");

		});
	},
	//genenic function
	toPriceStr: function(x){
		return "$" + x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	showAjaxLoading: function (){
		$("#loading-overlay").modal("show");
	},
	hideAjaxLoading: function (){
		$("#loading-overlay").modal("hide");
	}
};

var fnaLogin = {
	init: function (){
		var that = this;
		$(".pv_fna .btnStart").on("click", function (){that.login();});
		$(".pv_fna .btnForgotUser").on("click", function (){that.forgotUsrName();});
		$(".pv_fna .btnForgotPwd").on("click", function (){that.forgotPwd();});
	},
	login: function (){
		var that = this;
		$.ajax({
			beforeSend: that.showLoading,
			url:"/fwdhk/api/member/login",
			type:"post",
			contentType: "application/json",
			data:JSON.stringify({
				userName:$("#fnaUser").val(),
				password:$("#fnaPwd").val()
			}),
			cache:false,
			async:false,
			error: that.loginError,
		    success: that.loginSuccess,
		    complete: that.hideLoading
		});
	},
	showLoading: function (){
		pvCtr.showAjaxLoading();
	},
	loginError: function (response){
		$(".pv_fna .errorMsg").html(pvSetting.errMsg.loginFail);
	},
	loginSuccess: function (response){
		if(response){
    		window.location = window.context + '/' + window.language + "/FNA/financial-needs-analysis";
    	}
	},
	hideLoading: function (){
		pvCtr.hideAjaxLoading();
	},
	forgotPwd: function(){
		this.showMainLoginPopup();
		$("#link-forgotPassword").click();
	},
	forgotUsrName: function (){
		this.showMainLoginPopup();
		$("#forgotUserName").click();
	},
	showMainLoginPopup: function(){
		$("#loginpopup").modal();
	}
};

var planInquiry = {
	submitData: {},
	uiCtr: {
		errorPanel : $(".pv_sec_calculator .error_list"),
		submitBtn  : $(".pv_sec_calculator .btnSubmit"),
		ageInput   : $(".pv_sec_calculator .input_age"),
		methodInput: $(".pv_sec_calculator input[name=method]"),
		periodTxt  : $(".pv_sec_calculator .txtMonth")
	},
	amountLimit: {
		"minRPHKD": 1000,
		"maxRPHKD": 20000,
		"minSPHKD": 30000,
		"maxSPHKD": 1000000,
		"minRPUSD": 125,
		"maxRPUSD": 2500,
		"minSPUSD": 3750,
		"maxSPUSD": 125000,
	},
	errorMsgAry: [],
	init: function (){
		var that = this;

		this.uiCtr.submitBtn.on("click", function (){
			that.requestPlanDetail();
		});
		this.uiCtr.ageInput.on("change", function (){
			that.fillYearOpt($(this).val());
		});
		this.uiCtr.methodInput.on("change", function(){
			that.displayPeriodOpt($(this).val() === "RP");
		});
	},
	clearData: function (){
		this.submitData = {};
		this.errorMsgAry = [];
		this.uiCtr.errorPanel.empty();
	},
	isValidInfo: function (){
		this.checkGender();
		this.checkAge();
		this.checkMethod();
		this.checkCurrency();
		this.checkAmountLiimit();

		return this.errorMsgAry.length === 0;
	},
	fillYearOpt: function (age){
		//clear list 
		var yearList$ = $(".pv_sec_calculator .yearList");
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
	},
	showError: function (){
		for(var mi = 0; mi < this.errorMsgAry.length; mi++){
			var msg = $("<li>").html(this.errorMsgAry[mi]);
			this.uiCtr.errorPanel.append(msg);		
		}
	},
	requestPlanDetail: function (){
		var that = this;

		this.clearData();

		if(!this.isValidInfo()){
			this.showError();
		}else{
			// clear error msg 
			this.uiCtr.errorPanel.empty();

			//make a dob with age only for API
			var cusDob = new Date(new Date().getFullYear() - this.submitData.age, 0 ,1);

			$.ajax({
			    beforeSend: this.showLoading,
				url:"/fwdhk/api/provie/planDetails/",
				type:"get",
				data:{
					premium : this.submitData.amount,
					planCode: this.submitData.method,
					currency: this.submitData.currency,
					dob     : this.toDateStr(cusDob),
					rider   : "TERM_LIFE_BENEFIT"
				},	
				cache:false,
				async:false,
				error: function (response){that.requestPlanError(response);},
			    success: function (response){that.requestPlanSuccess(response);},
			    complete: this.hideLoading
			});
		}
	},
	showLoading: function (){
		pvCtr.showAjaxLoading();
	},
	hideLoading: function (){
		pvCtr.hideAjaxLoading();
	},
	requestPlanError: function (){
		if(pvCtr.useDummyResult){
			this.requestPlanSuccess(dummyJson);
			return;
		}
		alert("request could not complete, please try again...");
	},
	requestPlanSuccess: function (response){
		if(pvCtr.useDummyResult){
			response = dummyJson;
		}

		response = this.patchLast2YearData(response);

    	//pass data to details helper
    	pvCtr.planDetailCtr = planDetailViewer({
			slider     : pvCtr.planSlider,
			monthlyFee : this.submitData.amount,
			plans      : response.plans,
			currencyStr: this.submitData.currency,
			isMonthly  : this.submitData.method === "RP"
    	});

    	this.showPlanDetailPanel();

	},
	showPlanDetailPanel: function (){
		if(!$(".pv_plan").hasClass("isShow")){
    		$(".pv_plan").slideToggle( "slow" ).addClass("isShow");
    	}
	},
	patchLast2YearData: function (response){
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
    		response.plans.push(response.creditRates[2].plans);
    	}

    	return response;
	},
	checkGender: function (){
		//check not empty
		var genderSelected$ = $("input[name=gender]:checked");
		if(genderSelected$.length != 1){
			this.errorMsgAry.push(pvSetting.errMsg.genderEmpty);
			return;
		}
		this.submitData.gender = genderSelected$.val();
	},
	checkAge: function (){
		//check length >= 2
		var age$ = $(".input_age");
		if(age$.val().length < 2 || !(/^[0-9]{2}$/).test(age$.val())){
			age$.focus();
			this.errorMsgAry.push(pvSetting.errMsg.ageEmpty);
			return;
		}
		//check < 19
		if(age$.val() < 19){
			this.errorMsgAry.push(pvSetting.errMsg.ageLess);
			return;	
		}
		//check > 59
		if(age$.val() > 59){
			this.errorMsgAry.push(pvSetting.errMsg.ageMore);
			return;	
		}

		this.submitData.age = age$.val();
	},
	checkMethod: function (){
		var methodSelected$ = $("input[name=method]:checked");
		//check not empty
		if(methodSelected$.length != 1){
			this.errorMsgAry.push(pvSetting.errMsg.methodEmpty);
			return;
		}

		this.submitData.method = methodSelected$.val();
	},
	checkCurrency: function (){
		//check not empty
		var currencySelected$ = $("input[name=currency]:checked");
		if(currencySelected$.length != 1){
			this.errorMsgAry.push(pvSetting.errMsg.currencyEmpty);
			return;
		}

		this.submitData.currency = currencySelected$.val();
	},
	checkAmountLiimit: function (){
		// check min and max
		var amount$ = $(".input_amount");
		var limit = this.getAmountLimit(this.submitData.method, this.submitData.currency);
		if(!(/^[0-9]+$/).test(amount$.val())){
			this.errorMsgAry.push(pvSetting.errMsg.amountEmpty);
			return;
		}
		
		if(amount$.val() < limit.min){
			this.errorMsgAry.push(limit.lessMsg);
			return;
		}
		if(amount$.val() > limit.max){
			this.errorMsgAry.push(limit.moreMsg);
			return;
		}
		
		this.submitData.amount = amount$.val();
	},
	getAmountLimit : function (method, currency){
		return {
			"min"    : this.amountLimit["min" + method + currency],
			"max"    : this.amountLimit["max" + method + currency],
			"lessMsg": pvSetting.errMsg["amount" + method + currency + "Less"],
			"moreMsg": pvSetting.errMsg["amount" + method + currency + "More"]
		};
	},
	displayPeriodOpt: function (isShow){
		if(isShow){
			this.uiCtr.periodTxt.show();
		}else{
			this.uiCtr.periodTxt.hide();
		}
	},
	toDateStr: function (d){
	  function pad(s) { return (s < 10) ? '0' + s : s; }
	  return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('-');
	}
};

// {
// 	plans: [],
// 	slider: $("somthing"),
// 	monthlyFee: 12345,
//  currencyStr: "HKD" | "USD"
// }
function planDetailViewer(conf){
	var planData = conf.plans;
	var slider   = conf.slider;

	var rateLife       = 1;
	var rateAccidental = 5;
	var rateCancer     = 0.5;

	var uiCtr = {
		monthlyPaidWrap  : $(".pv_plan .money .left"),
		monthlyPaid      : $(".pv_plan .money .monthlyFee"),
		accountValue     : $(".pv_plan .amount"),
		totalPaid        : $(".pv_plan .totalPaid"),
		yearNum          : $(".pv_plan .accValue .year"),
		xLifeAmount      : $(".pv_plan .card1 .price"),
		xAccidentalAmount: $(".pv_plan .card2 .price"),
		xCancerAmount    : $(".pv_plan .card3 .price"),
		currencyTag      : $(".pv_plan .pricePrefix")
	};

	var reAlignCardHeight = function(){
		//pvCtr.cal3Card.reAlign();
		$(window).trigger("resize");
	};

	var displayMonthlyPaid = function (isShow){
		if(isShow){
			uiCtr.monthlyPaidWrap.show();
		}else{
			uiCtr.monthlyPaidWrap.hide();
		}
	};

	var showFixRate = function (){
		for (var ni = 1; ni <= planData.length; ni++) {
    		$(".pv_plan .scaleBottom " + ".num"+ ni).html(pvSetting.currencyData[conf.currencyStr].fixRate[ni - 1] + "%");
    	}
	};

	var showYearDetails = function (yearIdx){
		var accBaseValue = planData[yearIdx].accountValue;

		uiCtr.totalPaid.html(pvCtr.toPriceStr(planData[yearIdx].totalPaid));
		uiCtr.accountValue.html(pvCtr.toPriceStr(accBaseValue));
		uiCtr.yearNum.html(planData[yearIdx].premiumYear);
		uiCtr.xLifeAmount.html(pvCtr.toPriceStr(accBaseValue * rateLife));
		uiCtr.xAccidentalAmount.html(pvCtr.toPriceStr(accBaseValue * rateAccidental));
		uiCtr.xCancerAmount.html(pvCtr.toPriceStr(accBaseValue * rateCancer));

		reAlignCardHeight();
	};

	var reset = function(){
		conf.slider.noUiSlider.set([0, 0]);
		displayMonthlyPaid(conf.isMonthly);
	};

	//### act as init ###
	//set monthly fee
	uiCtr.monthlyPaid.html(pvCtr.toPriceStr(!!conf.monthlyFee ? conf.monthlyFee : 0));
	uiCtr.currencyTag.html(pvSetting.currencyData[conf.currencyStr].prefix);
	showFixRate();


	//ubind change event
	conf.slider.noUiSlider.off("update.planView");//unbind namespaced event
	conf.slider.noUiSlider.on('update.planView', function(curValueAry){
		var idx = parseInt(curValueAry[1], 10) / 10;
		showYearDetails(idx);
	});

	//trigger show first year data
	reset();
	
	return {
		reset: reset,
		showYearDetails: showYearDetails
	};
}

// sample config
// conf{
// 	child: ".inner",
// 	minWidth: 992
// }
$.fn.autoAlignHeight = function(conf) {
	var parentDom = this;
	var childDom  = conf.child;
	var _conf     = conf;

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
		        var c_height = parseInt($(this).outerHeight(false));
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
	
	return {
		reAlign : reAlignHeight
	};
};


$(document).ready(function (){
	pvCtr.onReady();
});