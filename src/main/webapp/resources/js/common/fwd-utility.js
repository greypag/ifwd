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
		
		// 35 day
		var dob_42_date = new Date();
		dob_42_date.setDate(dob_42_date.getDate()-43);

		// 18 year ago date
		var dob_end_date = new Date();
		dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
		// this year
		var dob_end_date_this_year = new Date();
		// this year - 90 days
		var dob_end_date_this_year_plus_90 = new Date();
		dob_end_date_this_year_plus_90.setDate(dob_end_date_this_year_plus_90.getDate() + 90);


		// 65 year ago date
		var dob_65_date = new Date();
		dob_65_date.setFullYear(dob_end_date_this_year.getFullYear() - 65);
		dob_65_date.setDate(dob_65_date.getDate() + 1);

		// 12 year ago date
		var dob_12_date = new Date();
		dob_12_date.setFullYear(dob_12_date.getFullYear() - 12);
		dob_12_date.setDate(dob_12_date.getDate() + 90);

		// 10 year and 9 month ago date
		var dob_10_date = new Date();
		dob_10_date.setFullYear(dob_10_date.getFullYear() - 11);
		dob_10_date.setDate(dob_10_date.getDate() + 90);

		// 86 year ago date
		var dob_start_date = new Date();
		dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
		dob_start_date.setDate(dob_start_date.getDate()+1);

		// 71 year ago date
		var dob_70_date = new Date();
		dob_70_date.setFullYear(dob_70_date.getFullYear()-71);
		dob_70_date.setDate(dob_70_date.getDate());

		// 70 year ago date for Annual Travel
		var dob_69_date = new Date();
		dob_69_date.setFullYear(dob_69_date.getFullYear()-70);
		//console.log(dob_69_date);
		dob_69_date.setDate(dob_69_date.getDate());

		//Start at 1900
		/*var dob_1900_date = new Date();
		dob_1900_date.setFullYear(1900,0,1);*/

		//one day before 69 year old date
		var dob_70_99_date = new Date();
		dob_70_99_date.setFullYear(dob_70_99_date.getFullYear()-69);
		dob_70_99_date.setDate(dob_70_99_date.getDate() + 1);

		// birthday datepicker, only 18-85 year-old users can buy the insurance
		$('#input_dob').datepicker({
			startView: "decade",
			autoclose: true,
			format: "dd-mm-yyyy",
			startDate: dob_start_date,
			endDate: dob_end_date
			/*language: getBundleLanguage*/
		}).on('changeDate', function (ev) {
			$("#freeFlightForm").val($("#input_dob").datepicker('getFormattedDate'));
			$('#freeFlightForm').formValidation('revalidateField', "applicantDob");
			var selected = 2;
			if(ev.date != undefined) {
				if(ev.date.valueOf() < dob_end_date.valueOf() && ev.date.valueOf() > dob_70_date.valueOf()){
					selected = 2;
				}else{
					selected = 3;
				}
				if($("#selectAgeRange1").length > 0){
					$("#selectAgeRange1").val(selected);
				}else if($("#insureDob1").length > 0){
					$("#insureDob1").val($("#applicantDob").val());
				}
			}
			//$("#dobInvalid").html("");
			//$("#input_dob").removeClass("invalid-field");
		});
		//$('#input_dob').datepicker('setDate', dob_end_date);

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
