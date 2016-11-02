// (function() {
// 	"use strict";

	var eWalletCtr = {
		langMapping: {
			tc: "zh",
			en: "en"
		},
		init: function() {
			this.initDatePicker();
		},
		initDatePicker: function() {
			$('#dt_log_from, #dt_log_to').mobiscroll().calendar({
				theme: 'mobiscroll',
				display: 'bottom',
				lang: languageP == "en" ? "en_fwd" : "zh_fwd"
			});
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
		showApiLoading: function(){

		},
		hideApiLoading: function (){

		},
		showGenericErrMsg: function (title, msg){
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
		}
	};

	// ====== Policy List Process Begin ====== 
	var policyHelper = {
		htmlTemplate: null,
		setTemplate: function() {
			var template = $(".ew_pol_template").clone();
			this.htmlTemplate = template;
			this.htmlTemplate.removeClass("ew_pol_template");
		},
		getCustomerPolicy: function() {
			var that = this;

			apiReqHelper.makeRequest({
				link: apiLink.getPolicyListByCustomer,
				method: "post",
				data: {customerId: window.customerId},
				successFn: function(response){
					that.composePolicyList(response.policies);
				},
				failFn: function (xhr, textStatus, errorThrown){
					alert(xhr);
				}
			});

		},
		composePolicyList: function (policyAry){

			for (var pi = 0; pi < policyAry.length; pi++) {
				var info = policyAry[pi];
				//clone template and fill policy info
				var policyDom = this.htmlTemplate.clone();

				//fill policy info
				eWalletCtr.fillPolicyInfo(policyDom, info);

				//set tng status
				var statusWrapper = policyDom.find(".ew_pol_wd_linkup");
				switch (info.tngStatus_en.toLowerCase()) {
					case "unlinked":
						statusWrapper.addClass("isEmpty");

						(function(pid) {
							policyDom.find(".ew_pol_wd_linkupBtn").on("click", function() {
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
						})(info.policyId, info.tngAccountId);

						break;
					case "locked":
						statusWrapper.addClass("isLocked");
						break;
				}

				$(".ew_pol_list .ew-tab-title").after(policyDom);
			}
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
			this.clearAllPolicy();
			this.getCustomerPolicy();
		}
	};
	// ====== Policy List Process End ====== 

	// ====== Linkup Process Being ====== 
	var linkupHelper = {
		popupDom: $(".ew_popup_linkup"),
		policyId: null,
		errMsg: $(""),
		init: function() {
			var that = this;
			this.popupDom.on("hidden.bs.modal", function() {
				that.reset();
			});
			this.popupDom.find(".ew_btn_confirm").on("click", function (){
				var otp = this.popupDom.find(".ew_otp_input").val();
				that.request(otp);
			});
			// this.popupDom.find(".ew_btn_confirm").on("click", function (){
			// 	var otp = this.popupDom.find(".ew_otp_input").val();
			// 	that.request(otp);
			// })
		},
		startLinkup: function(pid) {
			var that = this;
			this.policyId = pid;

			//send TngOtpSMS API
			apiReqHelper.makeRequest({
				link: apiLink.sendTngOtpSms,
				method: "post",
				data: {policyId: pid},
				successFn: function(response){
					that.requestShowPanel();
				},
				failFn: function (xhr, textStatus, errorThrown){
					that.requestShowPanel();
					// alert(xhr);
				}
			});

			
			//else show error popup

		},
		requestShowPanel: function(){
			var that = this;
			//send TngOtpSMS API
			apiReqHelper.makeRequest({
				link: apiLink.getPolicyInfo,
				method: "post",
				data: {policyId: this.policyId},
				successFn: function(response){
					that.showPanel(response);
				},
				failFn: function (xhr, textStatus, errorThrown){
					alert(xhr);
				}
			});
		},
		showPanel: function(data) {
			eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
			this.popupDom.find(".ew_mobile").html(data.mobile.slice(0, 4) + "****");

			this.popupDom.modal();
		},
		hidePanel: function() {
			this.popupDom.modal("hide");
		},
		request: function(otp) {
			apiReqHelper.makeRequest({
				link: apiLink.authTngOtp,
				method: "post",
				data: {policyId: this.policyId, otp: otp},
				successFn: function(response){
					//pass all response result to TNG
					console.log(response);
				},
				failFn: function (xhr, textStatus, errorThrown){
					alert(xhr);
				}
			});
		},
		reset: function() {
			this.policyId = null;
			this.popupDom.find(".ew_otp_wrapper input").val("");
		},
		resendOtp: function (){

		}
	};
	// ====== Linkup Process End ====== 

	var apiReqHelper = {
		isWorking: false,
		makeRequest: function (conf){
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
				success: function (response){
					that.isWorking = false;
					conf.successFn(response);
				},
				error: function(xhr, textStatus, errorThrown){
					that.isWorking = false;
					if(!!conf.failFn){
						conf.failFn(xhr, textStatus, errorThrown);	
					}else{
						eWalletCtr.showGenericErrMsg("Error", "network problem.");
					}
					
				},
				async: false
			});
		}
	}

	$("document").ready(function() {
		eWalletCtr.init();
		policyHelper.setTemplate();
		linkupHelper.init();

	});

	var apiLink = {
		getPolicyListByCustomer: context + "/api/withdrawal/getPolicyInfoList",
		sendTngOtpSms: context + "/api/withdrawal/sendTngOtpSms",
		getPolicyInfo: context + "/api/withdrawal/getPolicyInfo",
		authTngOtp: context + "/api/withdrawal/authTngOtp",
		unlinkTngPolicy: context + "",
		requestWithdraw: context + "",
		performWithdraw: context + "",
		withdrawLog: context + ""
	};

	// var devApiResult = {
	// 	getPolicyListByCustomer: [{
	// 		"customerId": "15174796",
	// 		"mobile": "11111111",
	// 		"policy": [{
	// 			"policyId": "17545015",
	// 			"product_code": "KSTS",
	// 			"product_en": "Savie Insurance Plan",
	// 			"product_zh": "自助息理財壽險計劃",
	// 			"validPolicy": true,
	// 			"policyBalance": 48500,
	// 			"asOfDate": "2016-10-12 17:00:00",
	// 			"tngAccountId": null,
	// 			"tngExpiryDate": null,
	// 			"tngPolicyStatus": "eligible"
	// 		}, {
	// 			"policyId": "17545016",
	// 			"product_code": "KSTS",
	// 			"product_en": "Savie Insurance Plan",
	// 			"product_zh": "自助息理財壽險計劃",
	// 			"validPolicy": true,
	// 			"policyBalance": 48500,
	// 			"asOfDate": "2016-10-12 17:00:00",
	// 			"tngAccountId": "123456789012",
	// 			"tngExpiryDate": "2017-09-01 23:59:59",
	// 			"tngPolicyStatus": "linked"
	// 		}, {
	// 			"policyId": "17545017",
	// 			"product_code": "KSTS",
	// 			"product_en": "Savie Insurance Plan",
	// 			"product_zh": "自助息理財壽險計劃",
	// 			"validPolicy": true,
	// 			"policyBalance": 48500,
	// 			"asOfDate": "2016-10-12 17:00:00",
	// 			"tngAccountId": "123456789012",
	// 			"tngExpiryDate": "2017-09-01 23:59:59",
	// 			"tngPolicyStatus": "locked"
	// 		}]
	// 	}],
	// 	getPolicyListByPolicy: {
	// 		"customerId": "15174796",
	// 		"mobile": "11111111",
	// 		"policy": [{
	// 			"policyId": "17545016",
	// 			"product_code": "KSTS",
	// 			"product_en": "Savie Insurance Plan",
	// 			"product_zh": "自助息理財壽險計劃",
	// 			"validPolicy": true,
	// 			"policyBalance": 48500,
	// 			"asOfDate": "2016-10-12 17:00:00",
	// 			"tngAccountId": "123456789012",
	// 			"tngExpiryDate": "2017-09-01 23:59:59",
	// 			"tngPolicyStatus": "linked"
	// 		}]
	// 	},
	// 	otpSms: {
	// 		"customerId": "15174796",
	// 		"mobile": "92345678",
	// 		"result": true,
	// 		"otpExpiryDate": "2016-09-20 18:01:00"
	// 	},

	// };
// })();


var msgCtr = {
	otpFailMsg: "發送一次性密碼失敗",
}