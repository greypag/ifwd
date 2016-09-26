"use static";
var dummyJson = {"plans":[{"premiumYear":1,"rate":1.0,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":2,"rate":1.1,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":3,"rate":1.2,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":4,"rate":1.3,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0},{"premiumYear":5,"rate":1.4,"accountValue":10001.0,"deathBenefit":10002.0,"riderValue":10003.0,"totalPaid":10000.0}]};

var pvCtr = {
	//values
	planSlider: document.getElementById('slider'),
	planDetailCtr: {},
	cal3Card : {},
	useDummyResult: false,
	ddeFixItv: null,
	//function
	onReady : function(){
		this.initAutoHeight();
		this.initPlanSlider();
		this.initDropdownEhn();
		this.initPaymentOffer();

		planInquiry.init();
		fnaLogin.init();

		$("#btn-blog-link").on("click", function (){
			var url = $(".blogs.first .btn-read-now").attr("href");
			window.open(url,'_blank');
		});
	},
	initAutoHeight: function(){
		this.cal3Card = $(".pv_plan_wrap .cardWrap").autoAlignHeight({child: ".card", minWidth: 0});
		$(".pv_plan_wrap .cardWrap .card").autoAlignHeight({child: ".name", minWidth: 0});
	},
	initPlanSlider: function (){
		noUiSlider.create(this.planSlider, {
			start    : 0,
			step     : 10,
			behaviour: 'snap',
			connect  : 'lower',
			range    : {
				'min':  0,
				'max':  50
			}
		});

		this.initGraySliderBar();
	},
	initGraySliderBar: function(){
		//create gray color bar for slider
		var grayBar$ = $("<div/>").addClass("grayBox").appendTo($(".pv_plan .pv_plan_wrap #slider .noUi-origin.noUi-background"));

		this.planSlider.noUiSlider.on('update.gray', function (curValueAry){
			var p = 100 -parseInt(curValueAry[0], 10) / 50 * 100;
			grayBar$.css("width", 20/p * 100 + "%");

		});
	},
	initPaymentOffer: function (){
		var currencyBtn$ = $(".pv_currency_btn");
		var offerCat$ = $(".pv_offer_cat");

		currencyBtn$.on("click", function (){
			var childId = $(this).attr("data-childId");

			offerCat$.hide();
			console.log(childId);
			$("#" + childId).show();

			currencyBtn$.removeClass("active");
			$(this).addClass("active");
		});

		$(currencyBtn$[0]).click();
	},
	initDropdownEhn: function (){
		this.ddeFixItv = setInterval(function (){
			$(".pv_sec_calculator .dropdown-toggle").each(function (){
				var placeholderStr = $(this).attr("data-placeholder");
				var htmlStr = $(this).html();

				if(htmlStr != placeholderStr){
					$(this).addClass("isSelected");
				}else{
					$(this).removeClass("isSelected");
				}
			});
		}, 800);
	},
	//genenic function
	toPriceStr: function(x){
		return "$" + this.toPriceWithComma(x);
	},
	toPriceWithComma: function(x){
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	showAjaxLoading: function (){
		$("#loading-overlay").modal("show");
	},
	hideAjaxLoading: function (){
		$("#loading-overlay").modal("hide");
	}
};

var fnaLogin = {
	isLoggedIn: false,
	init: function (){
		var that = this;
		$(".pv_fna .btnStart").on("click", function (){
			$(".pv_fna .errorMsg").empty();

			if(that.isLoggedIn){
				that.loginSuccess({});
				return;
			}

			if($("#fnaUser").val().length < 1 || $("#fnaPwd").val().length < 1){
				$(".pv_fna .errorMsg").html(pvSetting.errMsg.fnaLoginEmpty);	
			}else{
				that.login();	
			}
		});
		$(".pv_fna .btnForgotUser").on("click", function (){that.forgotUsrName();});
		$(".pv_fna .btnForgotPwd").on("click", function (){that.forgotPwd();});

		setTimeout(function (){that.checkLoginStatus();}, 500);
	},
	login: function (){
		var that = this;
		$.ajax({
			beforeSend: that.showLoading,
			url: context + "/api/member/login",
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
	},
	checkLoginStatus: function (){
		var that = this;
		$.ajax({
			url: context + "/api/member/session",
			type:"get",
			contentType: "application/json",
			cache:false,
			async:false,
			beforeSend: pvCtr.showAjaxLoading,
		    error:function (xhr, textStatus, errorThrown){
		    	pvCtr.hideAjaxLoading();
		    },
		    success:function(response){
		    	if(response){
		    		if(response.userName == '*DIRECTGI'){
		    			pvCtr.hideAjaxLoading();
		    			return false;	
		    		}
		    		pvCtr.hideAjaxLoading();
		    		that.hideLoginPanel();
		    		that.isLoggedIn = true;
		    	}
		    }
		});
	},
	hideLoginPanel: function (){
		$(".pv_fna_loginPanel").hide();
	}
};

var planInquiry = {
	submitData: {},
	uiCtr: {
		errorPanel : $(".pv_sec_calculator .error_list"),
		submitBtn  : $(".pv_sec_calculator .btnSubmit"),
		ageInput   : $(".pv_sec_calculator .input_age"),
		methodInput: $(".pv_sec_calculator input[name=method]"),
		periodTxt  : $(".pv_sec_calculator .txtMonth"),
		yearInput  : function (){return $(".pv_sec_calculator input[name=year]:checked");},
		amountinput: $(".input_amount")
	},
	amountLimit: {
		"minPROVIE-RPHKD": 1000,
		"maxPROVIE-RPHKD": 20000,
		"minPROVIE-SPHKD": 30000,
		"maxPROVIE-SPHKD": 1000000,
		"minPROVIE-RPUSD": 125,
		"maxPROVIE-RPUSD": 2500,
		"minPROVIE-SPUSD": 3750,
		"maxPROVIE-SPUSD": 125000,
	},
	errorMsgAry: [],
	init: function (){
		var that = this;

		this.uiCtr.submitBtn.on("click", function (){
			that.requestPlanDetail();
		});
		this.uiCtr.ageInput.on("change", function (){
			that.fillYearOpt($(this).val());
			$(".yearList").prev().html($(".yearList").prev().attr("data-placeholder"));
		});
		this.uiCtr.methodInput.on("change", function(){
			that.displayPeriodOpt(!that.isSpMethod());
		});

		this.uiCtr.amountinput.on("keyup", function (){
			var inputIntValue = parseInt(that.uiCtr.amountinput.val().replace(/,/g,""), 10);
			if(!inputIntValue){
				that.uiCtr.amountinput.val("");
			}else{
				that.uiCtr.amountinput.val(pvCtr.toPriceWithComma(inputIntValue));
			}
			
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
		this.checkYear();

		return this.errorMsgAry.length === 0;
	},
	fillYearOpt: function (age){
		//clear list 
		var yearList$ = $(".pv_sec_calculator .yearList");
		yearList$.find("li").remove();

		//loop all option (60 - age - 1)
		var yearOptCount = 60 - age;
		for(var yi = 1; yi <= yearOptCount; yi++){
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
				url: context + "/api/provie/planDetails",
				type:"get",
				data:{
					premium    : this.submitData.amount,
					planCode   : this.submitData.method,
					currency   : this.submitData.currency,
					dob        : this.toDateStr(cusDob),
					paymentTerm: this.isSpMethod() ? 1 : this.uiCtr.yearInput().val(),
					rider      : "TERM_LIFE_BENEFIT"
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
			isMonthly  : !this.isSpMethod()
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
				"premiumYear": 99,
				"rate": 2,
				"accountValue": 10001,
				"deathBenefit": 10002,
				"riderValue": 10003,
				"totalPaid": 10000
			});
    	}else{
    		response.plans.push(response.creditRates[2].plans[1]);
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
		//check < 18
		if(age$.val() < 18){
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
		var amount = parseInt(this.uiCtr.amountinput.val().replace(/,/g,""), 10);
		var limit = this.getAmountLimit(this.submitData.method, this.submitData.currency);
		// if(!(/^[0-9]+$/).test(amount$.val())){
		// 	this.errorMsgAry.push(pvSetting.errMsg.amountEmpty);
		// 	return;
		// }

		if(!amount || amount < 1){
			this.errorMsgAry.push(pvSetting.errMsg.amountEmpty);
			return;
		}
		
		if(amount < limit.min){
			this.errorMsgAry.push(limit.lessMsg);
			return;
		}
		if(amount > limit.max){
			this.errorMsgAry.push(limit.moreMsg);
			return;
		}
		
		this.submitData.amount = amount;
	},
	checkYear : function (){
		var yearNum = parseInt(this.uiCtr.yearInput().val(), 10);
		if(!this.isSpMethod() && (!yearNum || yearNum < 1)){
			this.errorMsgAry.push(pvSetting.errMsg.yearEmpty);
			return;
		}
	},
	isSpMethod : function (){
		if($(".pv_sec_calculator input[name=method]:checked").val() === "PROVIE-SP"){
			return true;
		}
		return false;
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
	var self = this;

	var planData = conf.plans;
	var slider   = conf.slider;

	var rateLife       = 1;
	var rateAccidental = 5;
	var rateCancer     = 0.5;

	var uiCtr = {
		accountWrap		 : $(".pv_plan .accValue"),
		moneyPaidWrap	 : $(".pv_plan .money"),
		monthlyPaidWrap  : $(".pv_plan .money .left"),
		monthlyPaid      : $(".pv_plan .money .monthlyFee"),
		accountValue     : $(".pv_plan .amount"),
		totalPaid        : $(".pv_plan .totalPaid"),
		yearNum          : $(".pv_plan .accValue .year"),
		xLifeAmount      : $(".pv_plan .card1 .price"),
		xAccidentalAmount: $(".pv_plan .card2 .price"),
		xCancerAmount    : $(".pv_plan .card3 .price"),
		currencyTag      : $(".pv_plan .pricePrefix"),
		riderCards		 : []
	};

	var reAlignCardHeight = function(){
		//pvCtr.cal3Card.reAlign();
		//$(window).trigger("resize");
		pvCtr.cal3Card.reAlign();
	};

	var displayMonthlyPaid = function (isShow){
		if(isShow){
			uiCtr.monthlyPaidWrap.show();
			uiCtr.moneyPaidWrap.removeClass("isOneOff");
		}else{
			uiCtr.monthlyPaidWrap.hide();
			uiCtr.moneyPaidWrap.addClass("isOneOff");
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
		uiCtr.riderCards[0] = uiCtr.xLifeAmount.html(pvCtr.toPriceStr(accBaseValue * rateLife));
		uiCtr.riderCards[1] = uiCtr.xAccidentalAmount.html(pvCtr.toPriceStr(accBaseValue * rateAccidental));
		uiCtr.riderCards[2] = uiCtr.xCancerAmount.html(pvCtr.toPriceStr(accBaseValue * rateCancer));

		reAlignCardHeight();
	};

	var reset = function(){
		conf.slider.noUiSlider.set(0);
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
		var idx = parseInt(curValueAry[0], 10) / 10;
		console.log("try to show: ", idx);
		showYearDetails(idx);
	});

	//fill year number
	for(var i=0; i<planData.length; i++){
		$(".topScale .num"+(i+1)).html(planData[i].premiumYear);
	}


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
	
	this.reAlign = reAlignHeight
	return this;
};


$(document).ready(function (){
	pvCtr.onReady();
});