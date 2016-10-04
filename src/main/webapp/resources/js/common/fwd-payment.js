
/*
 * Credit Card Static Function
 */
var fwdPayment = (function(){

	// Card Regular Exp
	var _vsRgx = "^(4[0-9]{15})";
	var _mcRgx = "^(?:(5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12})"; 
	var _dcRgx = "^(6(?:011|5[0-9]{2})[0-9]{12})";
	var _aeRgx = "^(3[47][0-9]{13})";
	var _diRgx = "^(3(?:0[0-5]|[68][0-9])[0-9]{11})";
	var _jcRgx = "^(?:(2131|1800|35[0-9]{3})[0-9]{11})";
	var _cardRgx = "^(?:" + _vsRgx + '|' + _mcRgx + ")$";

	var vsPattern = new RegExp(_vsRgx);
	var mcPattern = new RegExp(_mcRgx);
	var dcPattern = new RegExp(_dcRgx);
	var aePattern = new RegExp(_aeRgx);
	var diPattern = new RegExp(_diRgx);
	var jcPattern = new RegExp(_jcRgx);
	var cardPattern = new RegExp(_cardRgx);
	
	var cardTypes = ['Visa', 'MasterCard', 'Discover', 'American Express', 'Diners Club', 'JCB'];
	
	var isValid = function(cc){

		return cardPattern.test(sanitize(cc));
	}

	var isVisa = function(cc){
		return vsPattern.test(sanitize(cc));
	}

	var isMaster = function(cc){
		return mcPattern.test(sanitize(cc));
	}

	var isDiscover = function(cc){
		return dcPattern.test(sanitize(cc));
	}

	var isAE = function(cc){
		return aePattern.test(sanitize(cc));
	}

	var isDiner = function(cc){
		return diPattern.test(sanitize(cc));
	}

	var isJcb = function(cc){
		return jcPattern.test(sanitize(cc));
	}

	var sanitize = function(cc){
		return cc.replace(/[^0-9]/g, '');
	}

	return {
		isValid: isValid,
		isVisa: isVisa,
		isMaster: isMaster,
		isDiscover: isDiscover,
		isAE: isAE,
		isDiner: isDiner,
		isJcb: isJcb
	};

})();
