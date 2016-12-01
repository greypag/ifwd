
var linkupHelper;
var withdrawHelper;

var eWalletCtr = {
	init: function() {
		//init Policy
		policyHelper.setTemplate();
		policyHelper.init();
		//init Linkup
		linkupHelper = new LinkupClass();
		linkupHelper.init();
		//init Withdraw
		withdrawHelper = new WithdrawClass();
		withdrawHelper.init();
		//init Log
		logViewer.init();

		this.tryDisplayLinkupSuccess();
	},
	tryDisplayLinkupSuccess: function (){
		var flag = this.getQueryStringByName("statusFlag");
		if (flag == null) {
			return;
		}

		$("#e-wallet-tab-link").trigger("click");
		if (flag) {
			$(".ew_popup_linkupSuccess").modal();
		} else {
			eWalletCtr.showGenericMsg("", msgCtr.linkup.tngLinkupFail);
		}
	},
	//Common Function Begin
	langMapping: {
		tc: "zh",
		en: "en"
	},
	fillPolicyInfo: function(policyDom, info) {
		//policy name
		var langSubfix = this.langMapping[languageP];
		policyDom.find(".ew_pol_name").html(info["product_" + langSubfix]);
		//policy Id
		policyDom.find(".ew_pol_id").html(info.policyId);
		//policy balance
		policyDom.find(".ew_pol_blance").html(eWalletCtr.toPriceStr(info.policyPrincipal));
	},
	showGenericMsg: function(title, msg, btnTxt) {
		var dom = $(".ew_popup_error");

		//custom title
		if(title == "" || !title){
			dom.find(".modal-title").hide();
		}else{
			dom.find(".modal-title").html(title).show();
		}

		//custom btn text
		if(!btnTxt){
			dom.find(".ew_btn_confirm").html(btnTxt);
		}

		//body msg
		dom.find(".ew_popup_sec .ew_desc").html(msg);

		dom.modal();
	},
	toPriceStr: function(x) {
		if(!x) return 0;
		return "$" + this.toPriceWithComma(x);
	},
	toPriceWithComma: function(x) {
		if(!x)return x;
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	getQueryStringByName: function(name, url) {
		if (!url) {
			url = window.location.href;
		}
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
			results = regex.exec(url);
		if (!results) return null;
		if (!results[2]) return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
	//Common Function End
};

// ====== Policy List Process Begin ======
var policyHelper = {
	htmlTemplate: null,
	isOccupied: false,
	setTemplate: function() {
		this.htmlTemplate = $(".ew_pol_template").clone();
		this.htmlTemplate.removeClass("ew_pol_template");
	},
	init: function (){
		var that = this;

		$(document).on("ew_popupClose", function (){
			that.popupClosed();
		});
	},
	getCustomerPolicy: function() {
		var that = this;

		this.showLoading();

		apiReqHelper.makeRequest({
			link: apiLink.getPolicyListByCustomer,
			method: "post",
			data: {
				customerId: window.customerId
			},
			successFn: function(response) {
				that.composePolicyList(response.policies);
			},
			failFn: function(response) {
				eWalletCtr.showGenericMsg("", msgCtr.policyList.policyListApiFail);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	},
	composePolicyList: function(policyAry) {
		var that = this;

		logViewer.clearPolicyOption();


		for (var pi = 0; pi < policyAry.length; pi++) {
			var info = policyAry[pi];
			//clone template and fill policy info
			var policyDom = this.htmlTemplate.clone();

			//fill policy info
			eWalletCtr.fillPolicyInfo(policyDom, info);

			//set tng status
			var statusWrapper = policyDom.find(".ew_pol_wd_linkup");
			switch (info.tngPolicyStatus.toLowerCase()) {
				case "eligible":
					statusWrapper.addClass("isEmpty");

					(function(pid) {
						policyDom.find(".ew_pol_wd_linkupBtn").on("click", function() {
							if(that.isOccupied) return;

							that.isOccupied = true;
							$(this).addClass("isLoading");
							linkupHelper.startLinkup(pid);
						});
					})(info.policyId);

					break;
				case "linked":
					statusWrapper.addClass("isConnected");

					policyDom.find(".ew_pol_wd_linkup_tngId").html(info.tngAccountId);
					(function(pid, tid) {
						policyDom.find(".ew_pol_wd_linkup_unlink").on("click", function() {
							that.unlinkTng(pid, tid);
						});

						policyDom.find(".ew_pol_wd_withdrawBtn").on("click", function() {
							if(that.isOccupied) return;

							that.isOccupied = true;
							$(this).addClass("isLoading");
							withdrawHelper.startWithdraw(pid);
						});
					})(info.policyId, info.tngAccountId);

					break;
				case "locked":
					statusWrapper.addClass("isLocked");
					break;
			}

			$(".ew_pol_list .ew-tab-title").after(policyDom);

			logViewer.addPolicyNum(info.policyId);
			
		}

		// get first policy info in log view
		logViewer.optDom.trigger("change");
	},
	unlinkTng: function(pid, tid) {
		var that = this;

		that.showLoading();

		apiReqHelper.makeRequest({
			link: apiLink.unlinkTngPolicy,
			method: "post",
			data: {
				policyId: pid,
				tngAccountId: tid
			},
			successFn: function(response) {
				eWalletCtr.showGenericMsg("Success", "unlink policy ("+pid+")");
				that.reloadPolicy();
			},
			failFn: function(response) {
				eWalletCtr.showGenericMsg("", msgCtr.policyList.unlinkApiFail);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	},
	clearAllPolicy: function() {
		//need to unbind all click event ???
		$(".ew_pol_list .ew_pol").remove();
	},
	reloadPolicy: function() {
		this.clearAllPolicy();
		this.getCustomerPolicy();
	},
	popupClosed: function (){
		$(".ew_pol_wd_linkupBtn, .ew_pol_wd_withdrawBtn").removeClass("isLoading");
		this.isOccupied = false;
	},
	showLoading: function (){
		$('#ewallet-plans .ew_loading').show();
	},
	hideLoading: function (){
		$('#ewallet-plans .ew_loading').hide();
	}
};
// ====== Policy List Process End ======


 

// ====== Linkup Process Being ======
function LinkupClass() {
	// Borrowing Methods inheritance
	BaseErrMsgHelper.apply(this);
	BaseOtpHelper.apply(this);

	this.popupDom = $(".ew_popup_linkup");
	this.policyId = null;

	this.init = function() {
		var that = this;

		// popup close event callback
		this.popupDom.on("hidden.bs.modal", function() {
			that.reset();
			$(document).trigger('ew_popupClose', this);
		});

		this.popupDom.find(".ew_btn_confirm").on("click", function() {
			that.clearErrMsg();

			var isCheckTnc = $("#chk_otp:checked").length > 0;
			var haveOtp = that.getOtpInput().length == 6;

			if (isCheckTnc && haveOtp) {
				that.requestLinkup();
				return;
			}

			if (!isCheckTnc) {
				that.appendErrMsg(msgCtr.linkup.notCheckTnc);
			}
			if (!haveOtp) {
				that.appendErrMsg(msgCtr.linkup.invalidOtpInput);
			}

		});

		this.bindResendOtpEvent();
	};

	this.startLinkup = function(pid) {
		var that = this;

		this.policyId = pid;

		//send TngOtpSMS API
		apiReqHelper.makeRequest({
			link: apiLink.sendTngOtpSms,
			method: "post",
			data: {
				policyId: pid
			},
			successFn: function(response) {
				that.requestShowPanel();
			},
			failFn: function(response) {
				// hide policyList btn loading
				$(document).trigger('ew_popupClose', this);

				eWalletCtr.showGenericMsg("",response["message_"+ eWalletCtr.langMapping[languageP]]);
			}
		});
		//else show error popup
	};

	this.requestShowPanel = function() {
		var that = this;
		//send TngOtpSMS API
		apiReqHelper.makeRequest({
			link: apiLink.getPolicyInfo,
			method: "post",
			data: {
				policyId: this.policyId
			},
			successFn: function(response) {
				that.showPanel(response);
			},
			failFn: function(response) {
				//eWalletCtr.showGenericMsg("", msgCtr.policyList.policyInfoApiFail);
				eWalletCtr.showGenericMsg("", response["message_"+ eWalletCtr.langMapping[languageP]]);
			}
		});
	};

	this.showPanel = function(data) {
		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile);

		this.popupDom.modal();
		this.startResendCountdown();
	};

	this.hidePanel = function() {
		this.popupDom.modal("hide");
	};

	this.requestLinkup = function() {
		var otp = this.getOtpInput();

		apiReqHelper.makeRequest({
			link: apiLink.authTngOtp,
			method: "post",
			data: {
				policyId: this.policyId,
				otp: otp
			},
			successFn: function(response) {
				var data =response.payload;
				$('#appId').val(data.appId);
				$('#merTradeNo').val(data.merTradeNo);
				$('#payload').val(data.payload);
				$('#paymentType').val(data.paymentType);
				$('#extras').val(data.extras);
				$('#transactionType').val(data.transactionType);
				$('#sign').val(data.sign);
				$("#linkupform").attr("action",response.geteWayUrl);
				$("#linkupform").submit();
			},
			failFn: function(response) {
				//eWalletCtr.showGenericMsg("", msgCtr.policyList.requestApiFail);
				eWalletCtr.showGenericMsg("", response["message_"+eWalletCtr.langMapping[languageP]]);
			}
		});
	};

	this.reset = function() {
		this.policyId = null;
		this.clearErrMsg();
		this.resetOtpInput();
		this.stopResendCountdown();
	};

	this.resendOtp = function() {
		//put it down to successFn
		this.startResendCountdown();

		apiReqHelper.makeRequest({
			link: apiLink.sendTngOtpSms,
			method: "post",
			data: {
				policyId: this.policyId
			},
			successFn: function(response) {
				//pass all response result to TNG
				console.log(response);
			},
			failFn: function(response) {
				//eWalletCtr.showGenericMsg("", msgCtr.policyList.otpApiFail);
				eWalletCtr.showGenericMsg("", response["message_"+eWalletCtr.langMapping[languageP]]);
			}
		});
	};

}
// ====== Linkup Process End ======

// ====== Withdraw Process Being ======
function WithdrawClass(){
	BaseErrMsgHelper.apply(this);
	BaseOtpHelper.apply(this);

	this.popupDom = $(".ew_popup_withdraw");
	this.policyId = null;
	this.amountWithdraw = 0;

	this.init = function() {
		var that = this;

		this.restrictAmountInput();

		this.popupDom.on("hidden.bs.modal", function() {
			that.reset();
			$(document).trigger('ew_popupClose', this);
			policyHelper.reloadPolicy();
		});

		this.popupDom.find(".ew_btn_amount").on("click", function (){
			that.amountWithdraw = parseInt($(this).attr("data-amount"), 10);
			that.requestWithdraw();
		});

		this.popupDom.find(".ew_btn_withdraw").on("click", function (){
			var inputDom = $("#ew_input_amount");
			var amount = parseInt(inputDom.val(), 10);
			if(inputDom.val().length < 3 || amount < 500 || amount > 3000){
				inputDom.addClass("ew_err_input");
				return;
			}
			that.amountWithdraw = amount;
			that.requestWithdraw();
		});

		this.popupDom.find(".ew_step_2 .ew_btn_confirm").on("click", function (){
			that.clearErrMsg();

			var isCheckTnc = $("#chk_amount:checked").length > 0;
			var haveOtp = that.getOtpInput().length == 6;

			if(isCheckTnc && haveOtp){
				that.performWithdraw();
				return;
			}

			if(!isCheckTnc){
				that.appendErrMsg(msgCtr.linkup.notCheckTnc);
			}
			if(!haveOtp){
				that.appendErrMsg(msgCtr.linkup.invalidOtpInput);
			}
		});

		this.bindResendOtpEvent();
	};

	this.restrictAmountInput = function (){
		//only allow enter number
		$("#ew_input_amount").on("keypress", function (key){
			var key = window.event ? event.keyCode : event.which;

			if (event.keyCode === 8 || event.keyCode === 46 ||
				event.keyCode === 37 || event.keyCode === 39) {
				return true;
			}
			else if ( key < 48 || key > 57 ) {
				return false;
			}
			else return true;
		});
	};

	this.reset =  function() {
		this.policyId = null;
		this.amountWithdraw = 0;

		$("#ew_input_amount").removeClass("ew_err_input").val("");

		this.switchSection(1);

		this.resetOtpInput();

		this.stopResendCountdown();
	};

	this.startWithdraw = function(pid) {
		var that = this;
		this.policyId = pid;

		that.showLoading();
		//send TngOtpSMS API
		apiReqHelper.makeRequest({
			link: apiLink.getPolicyInfo,
			method: "post",
			data: {
				policyId: this.policyId
			},
			successFn: function(response) {
				that.showPanel(response);
			},
			failFn: function(response) {
				$(document).trigger('ew_popupClose', this); // hide policyList loading
				//eWalletCtr.showGenericMsg("", msgCtr.withdraw.policyInfoApiFail);
				eWalletCtr.showGenericMsg("", response["message_"+eWalletCtr.langMapping[languageP]]);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	};

	this.showPanel = function(data) {
		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile);
		this.popupDom.find(".ew_tngId").html(data.policy.tngAccountId);
		this.popupDom.find(".ew_tngExp").html(data.policy.principalAsOfDate.split(" ")[0]);

		this.popupDom.modal();
	};

	this.requestWithdraw = function() {
		var that = this;

		that.showLoading();

		apiReqHelper.makeRequest({
			link: apiLink.requestWithdraw,
			method: "post",
			data: {
				policyId: this.policyId,
				withdrawAmount: this.amountWithdraw
			},
			successFn: function(response) {
				that.startResendCountdown();
				that.popupDom.find(".ew_amount").html(eWalletCtr.toPriceStr(that.amountWithdraw));
				that.switchSection(2);
			},
			failFn: function(response) {
				// eWalletCtr.showGenericMsg("", msgCtr.withdraw.requestApiFail);\
				that.popupDom.modal("hide");
				eWalletCtr.showGenericMsg("", response["message_"+eWalletCtr.langMapping[languageP]]);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	};

	this.resendOtp = function (){
		this.requestWithdraw();
	};

	this.performWithdraw = function() {
		var that = this;

		that.showLoading();

		apiReqHelper.makeRequest({
			link: apiLink.performWithdraw,
			method: "post",
			data: {
				otp           : this.getOtpInput(),
				policyId      : this.policyId,
				withdrawAmount: this.amountWithdraw
			},
			successFn: function(response) {
				that.switchSection(3);
			},
			failFn: function(response) {
				// eWalletCtr.showGenericMsg("", msgCtr.withdraw.performApiFail);\
				eWalletCtr.showGenericMsg("", response["message_"+eWalletCtr.langMapping[langMapping]]);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	};

	this.switchSection = function(secNum) {
		this.popupDom.find(".ew_step_1, .ew_step_2, .ew_step_3").hide();
		this.popupDom.find(".ew_step_"+secNum).show();
	};

	this.showLoading = function (){
		this.popupDom.find(".ew_popup_loading").show();
	};

	this.hideLoading = function (){
		this.popupDom.find(".ew_popup_loading").hide();
	};
}
// ====== Withdraw Process End ======

function BaseOtpHelper() {
	this.resendLockTimeout = null;
	this.resendTimeoutMs = 30000;
	this.startResendCountdown = function() {
		this.stopResendCountdown();

		var that = this;
		var resendDom = that.popupDom.find(".ew_resendOtp");

		resendDom.hide();
		that.popupDom.find(".ew_sentOtp").show();

		this.resendLockTimeout = setTimeout(function() {
			resendDom.show();
			that.popupDom.find(".ew_sentOtp").hide();
		}, this.resendTimeoutMs);
	};
	this.stopResendCountdown = function() {
		this.popupDom.find(".ew_resendOtp").hide();
		clearTimeout(this.resendLockTimeout);
	};
	this.getOtpInput = function() {
		return this.popupDom.find(".ew_otp_input").val();
	};
	this.resetOtpInput = function (){
		this.popupDom.find(".ew_otp_input").val("");
		this.popupDom.find("input[type=checkbox]").prop('checked', false);
	};
	this.bindResendOtpEvent = function(){
		var that = this;
		this.popupDom.find(".ew_link_resendOTP").on("click", function() {
			that.resendOtp();
		});
	};
}

function BaseErrMsgHelper() {
	this.appendErrMsg = function(msg) {
		var errDom = this.popupDom.find(".ew_desc_err");
		var msgDom = $("<li/>").html(msg);

		msgDom.appendTo(errDom);
	};
	this.clearErrMsg = function() {
		this.popupDom.find(".ew_desc_err").html("");
	};
}

var logViewer = {
	policyId: null,
	htmlDom: $("#ewallet-logs"),
	optDom:  $("#ewallet-logs .ew_pol_selector select"),
	fetechLogs: function (){
		var that = this;

		apiReqHelper.makeRequest({
			link: apiLink.withdrawLog,
			method: "post",
			data: {
				policyId: this.policyId,
				startDate: this.toApiDateFormat($('#dt_log_from').val()),
				endDate  : this.toApiDateFormat($('#dt_log_to').val())
			},
			successFn: function(response) {
				that.composeLogTable(response);
			},
			failFn: function(xhr, textStatus, errorThrown) {
				eWalletCtr.showGenericMsg("", msgCtr.log.logApiFail);
			}
		});
	},
	composeLogTable: function (data){
		this.clearLogTable();

		var logs = data.transaction;
		for(var li = 0; li < logs.length; li++){
			var logData = logs[li];
			var logDt = logData.txnDate.split(" ")[0];

			var logRow = $("<tr/>").addClass("ew_log");

			var tngId = $("<td/>").html(logData.txnId);

			var dateMobile = $("<span/>").addClass("ew_dateMobile").html(logDt);
			tngId.append(dateMobile);

			var withdrawAmount = $("<td/>").html(eWalletCtr.toPriceStr(logData.txnAmount));

			var date = $("<td/>").html(logDt);

			logRow.append([tngId, date, withdrawAmount]);

			this.htmlDom.find("table").append(logRow);
		}

		this.hideLogLoading();
		this.htmlDom.find(".ew_logTable_wrapper").show();
	},
	clearLogTable: function (){
		this.htmlDom.find("table .ew_log").remove();
	},
	fetechPolicyInfo: function (){
		var that = this;

		this.hideOptionNLog();
		this.htmlDom.find(".ew_loading").show();

		apiReqHelper.makeRequest({
			link: apiLink.getPolicyInfo,
			method: "post",
			data: {
				policyId: this.policyId
			},
			successFn: function(response) {
				eWalletCtr.fillPolicyInfo(that.htmlDom.find(".ew_pol_info"), response.policy);
				that.htmlDom.find(".ew_log_dt_selectWrapper").show();
				that.htmlDom.find(".ew_loading").hide();
			},
			failFn: function(xhr, textStatus, errorThrown) {
				eWalletCtr.showGenericMsg("", msgCtr.log.policyInfoApiFail);
			}
		});
	},
	init: function(){
		var that = this;

		this.initDatePicker();

		this.htmlDom.find(".ew_btn_ok").on("click", function (){
			that.showLogLoading();
			that.fetechLogs();
		});
		this.optDom.on("change", function (){
			that.policyId = that.optDom.val();
			that.fetechPolicyInfo();
		});
	},
	initDatePicker: function() {
		// Initial end date
		var endDate   = new Date();
		var startDate = new Date(endDate.getFullYear(), endDate.getMonth() - 1, endDate.getDate());
		var $startBox = $('#dt_log_from');
		var $endBox   = $('#dt_log_to');

		// Init start calendar
		var $startCal = $startBox.mobiscroll().calendar({
			maxDate     : new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate() - 1),
			defaultValue: startDate,
			onSelect    : updateMinMaxDate,
			dateFormat  : "dd/mm/yyyy"
		});
		// Init end calendar
		var $endCal = $endBox.mobiscroll().calendar({
			minDate     : startDate,
			maxDate     : endDate,
			defaultValue: endDate,
			onSelect    : updateMinMaxDate,
			dateFormat  : "dd/mm/yyyy"
		});

		$startCal.mobiscroll("setVal", startDate);
		$endCal.mobiscroll("setVal", endDate);

		$startBox.trigger("change");
		$endBox.trigger("change");


		function updateMinMaxDate(dateText, inst){
			var curEndDate   = $endCal.mobiscroll("getVal");
			var curStartDate = $startCal.mobiscroll("getVal");

			$startCal.mobiscroll("setDate", curStartDate);
			$endCal.mobiscroll("setDate", curEndDate);

			$startCal = $('#dt_log_from').mobiscroll('option', {
				maxDate: new Date(curEndDate.setDate(curEndDate.getDate()-1))
			});

			$endCal = $('#dt_log_to').mobiscroll('option', {
				minDate: new Date(curStartDate.setDate(curStartDate.getDate() + 1))
			});
		}
	},
	addPolicyNum: function (policyId){
		this.optDom.append($("<option/>").val(policyId).html(policyId));
	},
	clearPolicyOption: function (){
		this.optDom.html("");
		this.policyId = null;
	},
	hideOptionNLog: function (){
		this.htmlDom.find(".ew_logTable_wrapper, .ew_log_dt_selectWrapper").hide();
	},
	showLogLoading: function (){
		this.htmlDom.find(".ew_btn_ok").addClass("isLoading");
	},
	hideLogLoading: function (){
		this.htmlDom.find(".ew_btn_ok").removeClass("isLoading");
	},
	toApiDateFormat: function(str){
		//yyyy-mm-dd
		var strAry = str.split("/");
		return strAry[2] + "-" + strAry[1] + "-" + strAry[0];
	}
};

var apiReqHelper = {
	isWorking: false,
	makeRequest: function(conf) {
		// {
		// 	link: "http://expmale.com/req",
		// 	method: "post",
		// 	data: {key1: "value"},
		// 	successFn: function(response){

		// 	},
		//	failFn:function(xhr, textStatus, errorThrown){

		// 	},
		//  completeFn: function (){}
		// }
		var that = this;

		this.isWorking = true;
		$.ajax({
			url: conf.link,
			type: conf.method,
			contentType: "application/json",
			data: JSON.stringify(conf.data),
			cache: false,
			success: function(response) {
				that.isWorking = false;
				conf.successFn(response);
			},
			error: function(xhr, textStatus, errorThrown) {
				that.isWorking = false;
				if (!!conf.failFn) {
					conf.failFn(JSON.parse(xhr.responseText), xhr, textStatus, errorThrown);
				} else {
					eWalletCtr.showGenericMsg(msgCtr.common.errorTitle, msgCtr.common.errorMsg);
				}
			},
			complete: function (){
				that.isWorking = false;
				if (!!conf.doneFn) {
					conf.doneFn();
				}
			},
			async: true
		});
	}
};

$("document").ready(function() {
	eWalletCtr.init();

});

var apiLink = {
	getPolicyListByCustomer: context + "/api/withdrawal/getPolicyInfoList",
	sendTngOtpSms          : context + "/api/withdrawal/sendTngOtpSms",
	getPolicyInfo          : context + "/api/withdrawal/getPolicyInfo",
	authTngOtp             : context + "/api/withdrawal/authTngOtp",
	unlinkTngPolicy        : context + "/api/withdrawal/unlinkTngPolicy",
	requestWithdraw        : context + "/api/withdrawal/requestTngPolicyWithdraw",
	performWithdraw        : context + "/api/withdrawal/performTngPolicyWithdraw",
	withdrawLog            : context + "/api/withdrawal/getTngPolicyHistory",

};


var msgCtr = {
	common:{ //getBundle(getBundleLanguage,"");
		errorTitle: getBundle(getBundleLanguage,"ewallet.msgctr.common.error.title") ,
		errorMsg  : getBundle(getBundleLanguage,"ewallet.msgctr.common.error.msg")
	},
	policyList:{
		otpApiFail       : getBundle(getBundleLanguage,"ewallet.msgctr.policylist.error.otpapifail"),
		policyListApiFail: getBundle(getBundleLanguage,"ewallet.msgctr.policylist.error.policylistapifail"),
		requestApiFail   : getBundle(getBundleLanguage,"ewallet.msgctr.policylist.error.requestapifail"),
		unlinkApiFail    : getBundle(getBundleLanguage,"ewallet.msgctr.policylist.error.unlinkapifail"),
		policyInfoApiFail: getBundle(getBundleLanguage,"ewallet.msgctr.policylist.error.policyinfoapifail")
	},
	withdraw:{
		requestApiFail   : getBundle(getBundleLanguage,"ewallet.msgctr.withdraw.error.requestapifail"),
		performApiFail   : getBundle(getBundleLanguage,"ewallet.msgctr.withdraw.error.performapifail"),
		policyInfoApiFail: getBundle(getBundleLanguage,"ewallet.msgctr.withdraw.error.policyinfoapifail"),
		otpApiFail       : getBundle(getBundleLanguage,"ewallet.msgctr.withdraw.error.otpapifail")
	},
	log: {
		logApiFail       : getBundle(getBundleLanguage,"ewallet.msgctr.log.error.logapifail"),
		policyInfoApiFail: getBundle(getBundleLanguage,"ewallet.msgctr.log.error.policyinfoapifail")
	},
	linkup:{
		invalidOtpInput: getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.invalidotpinput"),
		notCheckTnc    : getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.notchecktnc"),
		tngLinkupFail  : getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.tnglinkupfail")
	}
};