// (function() {
// 	"use strict";
var linkupHelper;
var withdrawHelper;
var eWalletCtr = {
	langMapping: {
		tc: "zh",
		en: "en"
	},
	init: function() {
		policyHelper.setTemplate();
		linkupHelper = new LinkupClass();
		linkupHelper.init();
		withdrawHelper = new WithdrawClass();
		withdrawHelper.init();
		policyHelper.init();
		logViewer.init();

		var isGoing2Ewallet = this.getQueryStringByName("sec") === "ew";
		if (isGoing2Ewallet) {
			$("#e-wallet-tab-link").trigger("click");
		}

		var linkupStatus = this.getQueryStringByName("ew_linkup_result");
		if (linkupStatus === "") {
			if (linkupStatus === "success") {
				$(".ew_popup_linkupSuccess").modal();
			} else {
				eWalletCtr.showGenericMsg("linkup fail", "Error");
			}
		}
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
	showApiLoading: function() {

	},
	hideApiLoading: function() {

	},
	showGenericMsg: function(title, msg) {
		var dom = $(".ew_popup_error");
		dom.find(".modal-title").html(title);
		dom.find(".ew_popup_sec .ew_desc").html(msg);
		dom.modal();
	},
	toPriceStr: function(x) {
		return "$" + this.toPriceWithComma(x);
	},
	toPriceWithComma: function(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	getQueryStringByName(name, url) {
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
};

// ====== Policy List Process Begin ====== 
var policyHelper = {
	htmlTemplate: null,
	isShowingPopup: false,
	setTemplate: function() {
		var template = $(".ew_pol_template").clone();
		this.htmlTemplate = template;
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

		apiReqHelper.makeRequest({
			link: apiLink.getPolicyListByCustomer,
			method: "post",
			data: {
				customerId: window.customerId
			},
			successFn: function(response) {
				that.composePolicyList(response.policies);
			},
			failFn: function(xhr, textStatus, errorThrown) {
				alert(xhr);
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
							if(that.isShowingPopup) return;

							that.isShowingPopup = true;
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
							if(that.isShowingPopup) return;

							that.isShowingPopup = true;
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

		logViewer.optDom.trigger("change");
		logViewer.fetechPolicyInfo();

		$('#loading-overlay').modal('hide');
	},
	unlinkTng: function(pid, tid) {
		//call API 
		//if success reload
		//else show error msg

		this.reloadPolicy();
	},
	clearAllPolicy: function() {
		//need to unbind all click event ???
		$(".ew_pol_list .ew_pol").remove();
	},
	reloadPolicy: function() {
		$('#loading-overlay').modal();
		this.clearAllPolicy();
		this.getCustomerPolicy();
	},
	popupClosed: function (){
		$(".ew_pol_wd_linkupBtn, .ew_pol_wd_withdrawBtn").removeClass("isLoading");
		this.isShowingPopup = false;
	}
};
// ====== Policy List Process End ====== 




// ====== Linkup Process Being ====== 
function LinkupClass() {
	BaseErrMsgHelper.apply(this);
	BaseOtpHelper.apply(this);


	this.popupDom = $(".ew_popup_linkup");
	this.policyId = null;

	this.init = function() {
		var that = this;

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
				that.appendErrMsg(msgCtr.linkup_notCheckTnc);
			}
			if (!haveOtp) {
				that.appendErrMsg(msgCtr.linkup_invalidOtpInput);
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
			failFn: function(xhr, textStatus, errorThrown) {
				that.requestShowPanel();
				// alert(xhr);
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
			failFn: function(xhr, textStatus, errorThrown) {
				alert("Fail getPolicyInfo");
			}
		});
	};

	this.showPanel = function(data) {
		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile);

		this.popupDom.modal();
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
				//pass all response result to TNG
				alert("pass data to TNG");
			},
			failFn: function(xhr, textStatus, errorThrown) {
				alert("Fail authTngOtp");
			}
		});
	};

	this.reset = function() {
		this.policyId = null;
		this.popupDom.find(".ew_otp_wrapper input").val("");
		this.clearErrMsg();

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
			failFn: function(xhr, textStatus, errorThrown) {
				alert("Resend OTP Fail");
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

		//only allow enter number 
		$("#ew_input_amount").on("keypress", function (key){
			var key = window.event ? event.keyCode : event.which;

		    if (event.keyCode === 8 || event.keyCode === 46
		     || event.keyCode === 37 || event.keyCode === 39) {
		        return true;
		    }
		    else if ( key < 48 || key > 57 ) {
		        return false;
		    }
		    else return true;
		});

		this.popupDom.on("hidden.bs.modal", function() {
			that.reset();
			$(document).trigger('ew_popupClose', this);
		});

		this.popupDom.find(".ew_btn_amount").on("click", function (){
			that.amountWithdraw = parseInt($(this).attr("data-amount"), 10);
			that.requestWithdraw();
		});

		this.popupDom.find(".ew_btn_withdraw").on("click", function (){
			that.amountWithdraw = parseInt($("#ew_input_amount").val(), 10);
			that.requestWithdraw();
		});
		this.popupDom.find(".ew_btn_confirm").on("click", function (){
			that.clearErrMsg();

			var isCheckTnc = $("#chk_amount:checked").length > 0;
			var haveOtp = that.getOtpInput().length == 6;

			if(isCheckTnc && haveOtp){
				that.performWithdraw();
				return;
			}

			if(!isCheckTnc){
				that.appendErrMsg(msgCtr.linkup_notCheckTnc);
			}
			if(!haveOtp){
				that.appendErrMsg(msgCtr.linkup_invalidOtpInput);
			}
			
		});
		this.bindResendOtpEvent();
	};

	this.reset =  function() {
		this.policyId = null;
		this.amountWithdraw = 0;

		this.stopResendCountdown();
	};

	this.startWithdraw = function(pid) {
		var that = this;
		this.policyId = pid;

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
			failFn: function(xhr, textStatus, errorThrown) {
				alert(xhr);
			}
		});
	};

	this.showPanel = function(data) {
		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile);

		this.popupDom.modal();
	};

	this.requestWithdraw = function() {
		var that = this;

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
			failFn: function(xhr, textStatus, errorThrown) {
				alert(xhr);
			}
		});
	};

	this.resendOtp = function (){
		this.requestWithdraw();
	};

	this.performWithdraw = function() {
		var that = this;

		apiReqHelper.makeRequest({
			link: apiLink.performWithdraw,
			method: "post",
			data: {
				otp: this.getOtpInput(),
				policyId: this.policyId,
				withdrawAmount: this.amountWithdraw
			},
			successFn: function(response) {
				that.switchSection(3);
			},
			failFn: function(xhr, textStatus, errorThrown) {
				alert(xhr);
			}
		});
	};

	this.switchSection = function(secNum) {
		this.popupDom.find(".ew_step_1, .ew_step_2, .ew_step_3").hide();
		this.popupDom.find(".ew_step_"+secNum).show();
	};

	this.showLoading = function (){
		console.log("open loading");
	};

	this.hideLoading = function (){
		console.log("close loading");
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
		clearTimeout(this.resendLockTimeout);
	};
	this.getOtpInput = function() {
		return this.popupDom.find(".ew_otp_input").val();
	}
	this.bindResendOtpEvent = function(){
		var that = this;
		this.popupDom.find(".ew_link_resendOTP").on("click", function() {
			that.resendOtp();
		});
	}
};

function BaseErrMsgHelper() {
	this.appendErrMsg = function(msg) {
		var errDom = this.popupDom.find(".ew_desc_err");
		var msgDom = $("<li/>").html(msg);

		msgDom.appendTo(errDom);
	};
	this.clearErrMsg = function() {
		this.popupDom.find(".ew_desc_err").html("");
	};
};

var logViewer = {
	policyId: null,
	htmlDom: $("#ewallet-logs"),
	optDom: $("#ewallet-logs .ew_pol_selector select"),
	fetechLogs: function (){
		var that = this;

		apiReqHelper.makeRequest({
			link: apiLink.withdrawLog,
			method: "post",
			data: {
				policyId: this.policyId,
				startDate: $('#dt_log_from').val(),
				endDate: $('#dt_log_to').val()
			},
			successFn: function(response) {
				console.log(response);
			},
			failFn: function(xhr, textStatus, errorThrown) {
				alert("Fail fetechLogs");
			}
		});
	},
	composeLogTable: function (data){
		var logs = data.transaction;
		for(var li = 0; li < logs.length; li++){
			var logData = logs[li];
			var logRow = $("<tr/>").addClass("ew_log");
			var tngId = $("<td/>").html(logData.txnId);
			var withdrawAmount = $("<td/>").html(logData.txnAmount);
			var date = $("<td/>").html(logData.txnDate);

			logRow.append([tngId, withdrawAmount, date]);

			this.htmlDom.find("table").append(logRow);
		}

	},
	clearLogTable: function (){
		this.htmlDom.find("table .ew_log").remove();
	},
	fetechPolicyInfo: function (){
		var that = this;
		apiReqHelper.makeRequest({
			link: apiLink.getPolicyInfo,
			method: "post",
			data: {
				policyId: this.policyId
			},
			successFn: function(response) {
				eWalletCtr.fillPolicyInfo(that.htmlDom.find(".ew_pol_info"), response.policy);
			},
			failFn: function(xhr, textStatus, errorThrown) {
				alert("Fail getPolicyInfo");
			}
		});
	},
	init: function(){
		var that = this;

		this.initDatePicker();
		this.htmlDom.find(".ew_btn_ok").on("click", function (){
			that.fetechLogs();
		});
		this.optDom.on("change", function (){
			that.policyId = that.optDom.val();
			that.fetechPolicyInfo();
		});
	},
	initDatePicker: function() {
		// Initial end date
        var endDate = new Date();
	    var startDate = new Date(endDate.getFullYear(), endDate.getMonth() - 1, endDate.getDate());
	    var $startBox = $('#dt_log_from');
	    var $endBox = $('#dt_log_to');

        // Init start calendar
	    var $startCal = $('#dt_log_from').mobiscroll().calendar({
            maxDate: new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate() - 1),
            defaultValue: startDate,
            onSelect: updateMinMaxDate,
            dateFormat: "dd/mm/yyyy"
        });
	    // Init end calendar
        var $endCal = $('#dt_log_to').mobiscroll().calendar({
        	minDate: startDate,
            maxDate: endDate,
            defaultValue: endDate,
            onSelect: updateMinMaxDate,
            dateFormat: "dd/mm/yyyy"
        });
        
        $startCal.mobiscroll("setVal", startDate);
        $endCal.mobiscroll("setVal", endDate);
        
        $startBox.trigger("change");
        $endBox.trigger("change");
        
 		
 		function updateMinMaxDate(dateText, inst){
 			var curEndDate = $endCal.mobiscroll("getVal");
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
					conf.failFn(xhr, textStatus, errorThrown);
				} else {
					eWalletCtr.showGenericMsg("Error", "network problem.");
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
	sendTngOtpSms: context + "/api/withdrawal/sendTngOtpSms",
	getPolicyInfo: context + "/api/withdrawal/getPolicyInfo",
	authTngOtp: context + "/api/withdrawal/authTngOtp",
	unlinkTngPolicy: context + "",
	requestWithdraw: context + "",
	performWithdraw: context + "",
	withdrawLog: context + "/api/withdrawal/getTngPolicyHistory",

};

// })();


var msgCtr = {
	otpFailMsg: "發送一次性密碼失敗",
	linkup_invalidOtpInput: "請輸入有效的一次性密碼",
	linkup_notCheckTnc: "請同意條款及細則"
}