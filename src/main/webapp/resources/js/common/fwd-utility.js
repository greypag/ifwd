var fwdUtility = (function(){


	/*
	 * Format Currency
	 *
	 * @method formatCurreny
	 * @param {String/Integer/Float} a number value
	 * @param {Integer} n number of decimal no. Default to be 2.
	 * @return {Float} Returns the comma seperated currency amount
	 */
	var _formatCurrency = function(a, n){
		var _decimal = (typeof(n)==='number')?n:2;
		return parseFloat(a).toFixed(_decimal).replace(/\B(?=(\d{3})+(?!\d))/g, ",");;

	};

	/*
	 * Format Float
	 *
	 * @method formatFloat
	 * @param {String/Integer/Float} a number value
	 * @param {Integer} n number of decimal no. Default to be 2.
	 * @return {Float} Returns the comma seperated float amount
	 */
	var _formatFloat = function(a, n){
		var _decimal = (typeof(n)==='number')?n:2;
		return (isNaN(parseFloat(a)))?0:parseFloat(a).toFixed(_decimal);
	};
	//
	// /*
	//  * Process each element in an object with callback function
	//  *
	//  * @method forEachObject
	//  * @param {Object} obj Object to be loop through
	//  * @param {Function} cb Callback function for each object key pairs
	//  * @return {Object} Return a processed object
	//  */
	// function forEachObject(obj, cb){
	// 	// To Be
	// }
	//
	// /*
	//  * Process each item in an array with callback function
	//  *
	//  * @method forEachArry
	//  * @param {Array} Array to be loop through
	//  * @param {Function} cb Callback function for each array item
	//  * @return {Array} Return a processed array
	//  */
	// function forEachArray(arr, cb){
	// 	// To Be
	// }
	//

	var _floatingBox = function () {
		/* scrolling code starts */
		var floatingbox = $('.floatingbox');

	    if (floatingbox[0]){
	    	var floatingboxY = floatingbox.offset().top,
	        wrapboxY = $("#quote-wrap").offset().top;
	        var topMargin = 40;

	        $(window).on('scroll', function(event) {
	        	if ($("#quote-wrap").height() > $(".floatingbox").height()){
	        		var scrollTop = $(window).scrollTop();
	        		var wrapboxRY = wrapboxY+$("#quote-wrap").height();
	        		var floatingboxRY = scrollTop+$(".floatingbox").height()+topMargin;

	        		if (wrapboxRY > floatingboxRY){
	        			floatingbox.stop(false).animate({
	                        top: scrollTop < floatingboxY ? 0 : scrollTop - floatingboxY + topMargin
	                    }, 100);
	        		}else{
	        			if (floatingboxRY > wrapboxRY){
	                        floatingbox.css("top", $("#quote-wrap").height()-$(".floatingbox").height())
	                    }
	        		}
	        	}
	        });
	    }
    	/* scrolling code ends */
	};

	var _dateDiffInDays = function(a, b) {
		// Discard the time and time-zone information.
		var diffDays = (b - a) / 1000 / 60 / 60 / 24;
		return diffDays + 1;
	};

	var _dateDiffInDaysFromNow = function(dat){
	    var nowTemp = new Date();
	    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	    return _dateDiffInDays(now, dat);
	};

	var _temp_flightCare = function() {
		console.log('_temp_flightCare');
		$("#txtStartDateDesk").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateDesk").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});

		$("#txtStartDateMob").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin2.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateMob").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout2.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});

		$("#txtStartDateBtm").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkin3.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
		$("#txtEndDateBtm").blur(function() {
			var dateDiff = _dateDiffInDaysFromNow(checkout3.datepicker("getDate").valueOf());
		    if(dateDiff < 0){ this.focus();return false; }
		});
	};

	return {
		'counter': {
			'dateDiffInDaysFromNow': _dateDiffInDaysFromNow
			, 'dateDiffInDays': _dateDiffInDays
		}
		, 'ux': {
			'floatingBox': _floatingBox
		}
		, 'temp': {
			'flightCare': _temp_flightCare
		}
		// , 'data': {} // role familiar with lodash, underscore, but some are dedicated to FWD
	};

})();
