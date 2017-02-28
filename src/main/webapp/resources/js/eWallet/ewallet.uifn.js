
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

		this.initHashChange();
		
		this.initPairSuccessPopup();

		// for internal testing only
		var isShowEWalletTab = this.getQueryStringByName("showWallet");
		if(!isShowEWalletTab || isShowEWalletTab != "1"){
			$("#e-wallet-tab-link, .mobile-dropdown.dropdown-e-wallet").hide();
		}

		
	},
	tryDisplayLinkupSuccess: function (){
		var flag = this.getQueryStringByName("statusFlag");
		if (flag == null) {
			return;
		}

		$("#e-wallet-tab-link").trigger("click");
		if (flag == "true") {
			$(".ew_popup_linkupSuccess").modal();
		} else {
			eWalletCtr.showGenericMsg("", msgCtr.linkup.tngLinkupFail);
		}
	},
	initPairSuccessPopup: function (){
		$(".ew_popup_linkupSuccess").on('hidden.bs.modal', function (){
			var _newurl = window.location.protocol + "//" + window.location.host + window.location.pathname;

			//take out statusFlag and append to url
			var _qs = window.location.search.substring(1).split('&');
			var _qi;
			var _newQS = "";
			for(_qi = 0; _qi < _qs.length; _qi++){
				var _qsItem = _qs[_qi];
				if(_qsItem == "statusFlag=true") continue;

				_newQS += _newQS.length == 0 ? "?" : "&";
				_newQS += _qsItem;
			}

			_newurl += _newQS;


			_newurl += window.location.hash;

    		window.history.pushState({path:_newurl},'',_newurl);

		});
	},
	initHashChange: function (){
    	window.addEventListener("hashchange", function(e) {
    		if(e.oldURL == e.newURL) return;
			var targetTab = e.newURL.match(/(#[\w-]+)/g);
			console.log(targetTab);
			$(targetTab).trigger("click");
		});
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
		//policy principal date
		policyDom.find(".ew_pol_principal_date").html(info.principalAsOfDate.slice(0,10).split('-').reverse().join('-'));
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
	},
	getApiErrorMsg: function (apiName, headerCode, code){
		var errMsg = msgCtr.common.errorMsg;
		var errMsgCode = "c_" + headerCode + "_";

		// errorCode
		if(!code){
			code = "";
		}
		
		//header status code 431 has Code MPXXX or IPXXX
		if(headerCode == 431 && code != "IP004"){
			errMsgCode += code.substring(0,2);
		}else{
			errMsgCode += code;
		}

		// patch error code
		if(!!apiErrMsg[apiName][errMsgCode]){
			errMsg = apiErrMsg[apiName][errMsgCode];
			if(code){
				errMsg += " (" + code + ")";
			}
		}

		return errMsg;
	}
	//Common Function End
};

// ====== Policy List Process Begin ======
var policyHelper = {
	isLoadingApi: false,
	htmlTemplate: null,
	isOccupied: false,
	isInvalidMobile: false,
	errMsgDom: $("#ewallet-plans .ew_accErrMsg"),
	setTemplate: function() {
		this.htmlTemplate = $(".ew_pol_template").clone();
		this.htmlTemplate.removeClass("ew_pol_template");
	},
	init: function (){
		var that = this;

		$(document).on("ew_popupClose", function (){
			that.popupClosed();
		});

		$(".ew_popup_unlinkConfirm").find(".ew_btn_confirm").on("click", function (){
			var pid = Number($(this).attr("data-pid"));
			var tid = Number($(this).attr("data-tid"));

			if(!pid || !tid){
				return;
			}

			that.unlinkTng(pid, tid);

			$(".ew_popup_unlinkConfirm").modal("hide");

		});
	},
	getCustomerPolicy: function() {
		var that = this;

		this.showLoading();
		this.isLoadingApi = true;
		logViewer.clearPolicyOption();

		apiReqHelper.makeRequest({
			link: apiLink.getPolicyListByCustomer,
			method: "post",
			data: {
				customerId: window.customerId
			},
			successFn: function(response) {
				//check mobile number
				if(response.mobile.length != 8){
					// eWalletCtr.showGenericMsg("", msgCtr.policyList.noMobileNum);
					that.isInvalidMobile = true;
				}

				if(that.isAllPolicyLocked(response.policies)){
					//eWalletCtr.showGenericMsg(msgCtr.policyList.policyAllLockedTitle, msgCtr.policyList.policyAllLocked);
					that.errMsgDom.show().html(msgCtr.policyList.policyAllLocked);
				}else if(response.policies.length == 0){
					that.errMsgDom.show().html(msgCtr.policyList.policyEmpty);
				}else{
					that.composePolicyList(response.policies);	
				}
			},
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("getPolicyListByCustomer", xhr.status, response.code);
				that.errMsgDom.show().html(msg);
			},
			doneFn: function (){
				that.hideLoading();
				that.isLoadingApi = false;
			}
		});
	},
	isAllPolicyLocked: function (policyAry){
		var lockedCount = 0;
		for (var pi = 0; pi < policyAry.length; pi++) {
			if(policyAry[pi].tngPolicyStatus.toLowerCase() == "locked"){
				lockedCount++;
				continue;
			}
		}

		return lockedCount > 0 && lockedCount == policyAry.length;
	},
	composePolicyList: function(policyAry) {
		var that = this;

        // show msg if no mobile number
        if(that.isInvalidMobile){
            eWalletCtr.showGenericMsg("", msgCtr.policyList.noMobileNum);
            return;
        }


		for (var pi = 0; pi < policyAry.length; pi++) {
			var info = policyAry[pi];
			// add wraning msg
			var warns = info.warnMsg;

			//clone template and fill policy info
			var policyDom = this.htmlTemplate.clone();

			//fill policy info
			eWalletCtr.fillPolicyInfo(policyDom, info);

			//set tng status
			var statusWrapper = policyDom.find(".ew_pol_wd_linkup");
			//set tng expiry date
			policyDom.find(".ew_pol_tngExp").html(info.valueAsOfDate.split(' ')[0]);
			switch (info.tngPolicyStatus.toLowerCase()) {
				case "eligible":
					statusWrapper.addClass("isEmpty");

					if(warns.length > 0){
						statusWrapper.addClass("isDisabled");
					}else{
						(function(pid) {
							policyDom.find(".ew_pol_wd_linkupBtn").on("click", function() {
								if(that.isOccupied) return;

								that.isOccupied = true;
								$(this).addClass("isLoading");
								linkupHelper.startLinkup(pid);
							});
						})(info.policyId);
					}

					break;
				case "linked":
					statusWrapper.addClass("isConnected");

					if(warns.length > 0){
						statusWrapper.addClass("isDisabled");
					}else{
						policyDom.find(".ew_pol_wd_linkup_tngId").html(info.tngAccountId);
						(function(pid, tid) {
							policyDom.find(".ew_pol_wd_linkup_unlink").on("click", function() {
								that.showUnlinkConfirm();

								$(".ew_popup_unlinkConfirm").find(".ew_btn_confirm").attr({"data-pid": pid, "data-tid": tid});
							});

							policyDom.find(".ew_pol_wd_withdrawBtn").on("click", function() {
								if(that.isOccupied) return;

								that.isOccupied = true;
								$(this).addClass("isLoading");
								withdrawHelper.startWithdraw(pid);
							});
						})(info.policyId, info.tngAccountId);	
					}					

					break;
				case "locked":
					statusWrapper.addClass("isLocked");
					break;
			}

			

			if(warns.length == 0 && !that.isInvalidMobile){
				policyDom.find(".ew_pol_warns .ew_pol_btnMore").hide();
			}else{
				policyDom.find(".ew_pol_warns .ew_pol_btnMore").attr("href", "#p" + info.policyId);
				policyDom.find(".ew_pol_warns .ew_pol_warnList").attr("id", "p" + info.policyId);	

				for( var wi = 0; wi < warns.length; wi++){
					var wranItem = $("<li/>");
					var txt = apiErrMsg.getPolicyListByCustomer["c_200_"+warns[wi].code];
					if(!txt) continue;
					wranItem.html(txt);
					policyDom.find(".ew_pol_warns .ew_pol_warnList").append(wranItem);	
				}
			}

			$(".ew_pol_list .ew-tab-title").after(policyDom);

			logViewer.addPolicyNum(info.policyId);
		}

		// get first policy info in log view
		logViewer.optDom.trigger("change");
	},
	showUnlinkConfirm: function (){
		$(".ew_popup_unlinkConfirm").modal();
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
				eWalletCtr.showGenericMsg(msgCtr.unlink.successMsgTitle, msgCtr.unlink.successMsg);
				that.reloadPolicy();
			},
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("unlinkTngPolicy", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	},
	clearAllPolicy: function() {
		//need to unbind all click event ???
		this.errMsgDom.hide().html('');
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

		this.initOtpHelper();
	};

	this.startLinkup = function(pid) {
		var that = this;

		that.reset();

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
			failFn: function(response, xhr) {
				// hide policyList btn loading
				$(document).trigger('ew_popupClose', this);

				var msg = eWalletCtr.getApiErrorMsg("sendTngOtpSms", xhr.status, response.code || "");
				eWalletCtr.showGenericMsg("", msg);
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
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("getPolicyInfo", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
			}
		});
	};

	this.showPanel = function(data) {
		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile.substring(0,4).concat("xxxx"));

		this.popupDom.modal();
		this.startResendCountdown();
	};

	this.hidePanel = function() {
		this.popupDom.modal("hide");
	};

	this.requestLinkup = function() {
		var otp = this.getOtpInput();
		var that = this;

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
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("authTngOtp", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);

				if(xhr.status == 412){
					that.popupDom.modal("hide");
					policyHelper.reloadPolicy();
				}

				if(xhr.status == 413 && response.code == "OTE005"){
					that.resetOtpInput();
				}
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
				//console.log(response);
			},
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("sendTngOtpSms", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
			}
		});
	};

}
// ====== Linkup Process End ======

// ====== Withdraw Process Being ======
function WithdrawClass(){
	BaseErrMsgHelper.apply(this);
	BaseOtpHelper.apply(this);

	var _productName = "";

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

			if(isNaN(amount) || amount < 500 || amount > 3000){
				inputDom.addClass("ew_err_input");
				eWalletCtr.showGenericMsg("", msgCtr.withdrawal.invalidAmount);	
				return;
			}
		
			that.amountWithdraw = amount;
			that.requestWithdraw();
		});

		this.popupDom.find(".ew_step_2 .ew_btn_confirm").on("click", function (){
			that.clearErrMsg();

			var haveOtp = that.getOtpInput().length == 6;

			if(haveOtp){
				that.performWithdraw();
				return;
			}else{
				that.appendErrMsg(msgCtr.linkup.invalidOtpInput);
			}
		});

		this.initOtpHelper();
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
		this.reset();
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
			failFn: function(response, xhr) {
				$(document).trigger('ew_popupClose', this); // hide policyList loading
				
				var msg = eWalletCtr.getApiErrorMsg("getPolicyInfo", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
			},
			doneFn: function (){
				that.hideLoading();
			}
		});
	};

	this.showPanel = function(data) {
		
		_productName = data.policy["product_" + eWalletCtr.langMapping[languageP]];

		eWalletCtr.fillPolicyInfo(this.popupDom.find(".ew_pol_info"), data.policy);
		this.popupDom.find(".ew_mobile").html(data.mobile.substring(0,4).concat("xxxx"));
		this.popupDom.find(".ew_tngId").html(data.policy.tngAccountId);
		this.popupDom.find(".ew_tngExp").html(data.policy.tngExpiryDate.split(" ")[0]);

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
			failFn: function(response, xhr) {

				if(!(xhr.status == 415 && (response.code == "TWE001" || response.code == "TWE003"))){
					that.popupDom.modal("hide");	
				}
				
				var msg = eWalletCtr.getApiErrorMsg("requestWithdraw", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg.replace("%productName%", _productName));
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
				that.popupDom.find(".ew_step_3 .ew_desc .pid").html(that.policyId);
			},
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("performWithdraw", xhr.status, response.code);
				

				if(xhr.status != 413) {
					that.popupDom.modal("hide");
				}else if(response.code == "OTE005"){
					that.resetOtpInput();
					that.appendErrMsg(msg);
					return;
				}

				eWalletCtr.showGenericMsg("", msg);
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
	this.resendTimeoutMs = 60000;
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
	this.initOtpHelper = function(){
		var that = this;
		this.popupDom.find(".ew_link_resendOTP").on("click", function() {
			that.resendOtp();
		});

		// click edge of input box (underline) will focus on text box
		// underline is not part of input box.
		this.popupDom.find(".ew_otp_wrapper").on("click", function (){
			that.popupDom.find(".ew_otp_input").focus();
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
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("withdrawLog", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
			}
		});
	},
	composeLogTable: function (data){
		this.clearLogTable();

		var usrTngId = data.tngAccountId;
		var logs = data.transaction;
		for(var li = 0; li < logs.length; li++){
			var logData = logs[li];
			var logDt = logData.txnDate.split(" ")[0];
			var tngRefNo = logData.tngRefNo;

			var logRow = $("<tr/>").addClass("ew_log");

			var withdrawAmount = $("<td/>").html(eWalletCtr.toPriceStr(logData.txnAmount));

			var date = $("<td/>").html(logDt);

			var refNo = $("<td/>").html(tngRefNo);
			var refNoMobile = $("<span/>").addClass("ew_refNoMobile").html(tngRefNo);

			date.append([refNoMobile]);

			logRow.append([date, refNo, withdrawAmount]);

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
				that.htmlDom.find(".ew_pol_info .ew_pol_tngId").html(response.policy.tngAccountId || "-");
			},
			failFn: function(response, xhr) {
				var msg = eWalletCtr.getApiErrorMsg("getPolicyInfo", xhr.status, response.code);
				eWalletCtr.showGenericMsg("", msg);
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
					try {
					    conf.failFn(JSON.parse(xhr.responseText), xhr, textStatus, errorThrown);
					}
					catch(err) {
					    conf.failFn({code: ""}, xhr, textStatus, errorThrown);
					}
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
	linkup:{
		invalidOtpInput: getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.invalidotpinput"),
		notCheckTnc    : getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.notchecktnc"),
		tngLinkupFail  : getBundle(getBundleLanguage,"ewallet.msgctr.linkup.error.tnglinkupfail")
	},
	policyList: {
		noMobileNum: getBundle(getBundleLanguage,"ewallet.msgctr.policyList.error.noMobile"),
		policyLocked: getBundle(getBundleLanguage,"ewallet.msgctr.policyList.error.policyLocked"),
		policyEmpty: getBundle(getBundleLanguage,"ewallet.msgctr.policyList.error.policyEmpty"),
		policyAllLockedTitle: getBundle(getBundleLanguage,"ewallet.msgctr.policyList.error.policyAllLockedTitle"),		
		policyAllLocked: getBundle(getBundleLanguage,"ewallet.msgctr.policyList.error.policyAllLocked")
	},
	withdrawal:{
		invalidAmount: getBundle(getBundleLanguage,"ewallet.msgctr.withdrawal.error.invalidAmount")
	},
	unlink: {
		confirmMsg: getBundle(getBundleLanguage,"ewallet.msgctr.unlink.confirmmsg"),
		successMsgTitle: getBundle(getBundleLanguage,"ewallet.msgctr.unlink.successTitle"),
		successMsg: getBundle(getBundleLanguage,"ewallet.msgctr.unlink.successMsg"),
		failMsg: getBundle(getBundleLanguage,"ewallet.msgctr.unlink.failMsg"),
	}
};

var apiErrMsg = { 
	getPolicyListByCustomer:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_400_IP"),
		c_431_IP004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_400_IP004"),
		// c_200_TPW001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_200_TPW001"),
		c_200_TPW002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_200_TPW002"),
		c_200_TPW003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_200_TPW003"),
		c_200_TPW004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_200_TPW004"),
		c_200_GPE004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyListByCustomer.c_200_GPE004")
   },	
    unlinkTngPolicy:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.unlinkTngPolicy.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.unlinkTngPolicy.c_400_IP"),
		c_417_TGE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.unlinkTngPolicy.c_417_TGE001"),
		c_417_TGE002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.unlinkTngPolicy.c_417_TGE002")
   },
    getPolicyInfo:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_400_IP")
		// c_411_GPE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_411_GPE001"),
		// c_411_GPE002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_411_GPE002"),
		// c_411_GPE003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_411_GPE003"),
		// c_411_GPE004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.getPolicyInfo.c_411_GPE004")
   },
    authTngOtp:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_400_IP"),
		c_412_:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_412_"),
		c_413_OTE004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_413_OTE004"),
		c_413_OTE005:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_413_OTE005"),
		c_413_OTE006:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_413_OTE006"),
		c_413_OTE008:getBundle(getBundleLanguage,"ewallet.apiErrMsg.authTngOtp.c_413_OTE008")
   },
    sendTngOtpSms:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_400_IP"),
		c_412_:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_412_"),
		c_413_OTE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_413_OTE001"),
		c_413_OTE002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_413_OTE002"),
		c_413_OTE003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_413_OTE003"),
		c_416_SYE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.sendTngOtpSms.c_416_SYE001")
   },
    requestWithdraw:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_400_IP"),
		c_411_:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_411_"),
		c_412_:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_412_"),
		c_413_OTE003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_413_OTE003"),
		c_413_OTE007:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_413_OTE007"),
		c_415_TWE000:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE000"),
		c_415_TWE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE001"),
		c_415_TWE002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE002"),
		c_415_TWE003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE003"),
		c_415_TWE004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE004"),
		c_415_TWE005:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_415_TWE005"),
		c_416_SYE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.requestWithdraw.c_416_SYE001")
   },
    performWithdraw:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_400_IP"),
		c_412_:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_412_"),
		c_413_OTE003:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_413_OTE003"),
		c_413_OTE004:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_413_OTE004"),
		c_413_OTE005:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_413_OTE005"),
		c_413_OTE006:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_413_OTE006"),
		c_416_SYE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_416_SYE001"),
		c_417_TGE001:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_417_TGE001"),
		c_417_TGE002:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_417_TGE002"),
		c_510_DB:getBundle(getBundleLanguage,"ewallet.apiErrMsg.performWithdraw.c_500_DB")
   },
    withdrawLog:{  
		c_431_MP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.withdrawLog.c_400_MP"),
		c_431_IP:getBundle(getBundleLanguage,"ewallet.apiErrMsg.withdrawLog.c_400_IP")
   }
};