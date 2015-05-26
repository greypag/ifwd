var reg = /^[a-zA-Z]+$/;
var emailreg = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regex_malasia = /\+60[-]\d{2,4}[-]?\d{6,9}\b/;
var mobile_pattern = /^1[0-9]{10}$|^[5689][0-9]{7}$/;   /* /^\d{8}$/; */

var password_full_pattern = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[&%$!]).{8,}$/;
var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
var passport_pattern = /^[a-zA-Z0-9]{5,15}$/;

var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
 
	
var getBundleLanguage = "";
var lang = UILANGUAGE;

if(lang === "EN"){
	getBundleLanguage = "en";
}else 
if(lang === "tc"){
	getBundleLanguage = "zh";
} 
else{
	getBundleLanguage = "en";
}

var chin = false;
/* datepicker script*/

/* hkid validation script */
function IsHKID(str) {
	var strValidChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

		// basic check length
		if (str.length < 8)
			return false;

	// handling bracket
	if (str.charAt(str.length - 3) == '(' && str.charAt(str.length - 1) == ')')
		str = str.substring(0, str.length - 3) + str.charAt(str.length - 2);

	// convert to upper case
	str = str.toUpperCase();

	// regular expression to check pattern and split
	var hkidPat = /^([A-Z]{1,2})([0-9]{6})([A0-9])$/;
	var matchArray = str.match(hkidPat);

	// not match, return false
	if (matchArray == null)
		return false;

	// the character part, numeric part and check digit part
	var charPart = matchArray[1];
	var numPart = matchArray[2];
	var checkDigit = matchArray[3];

	// calculate the checksum for character part
	var checkSum = 0;
	if (charPart.length == 2) {
		checkSum += 9 * (10 + strValidChars.indexOf(charPart.charAt(0)));
		checkSum += 8 * (10 + strValidChars.indexOf(charPart.charAt(1)));
	} else {
		checkSum += 9 * 36;
		checkSum += 8 * (10 + strValidChars.indexOf(charPart));
	}

	// calculate the checksum for numeric part
	for (var i = 0, j = 7; i < numPart.length; i++, j--)
		checkSum += j * numPart.charAt(i);

	// verify the check digit
	var remaining = checkSum % 11;
	var verify = remaining == 0 ? 0 : 11 - remaining;

	return verify == checkDigit || (verify == 10 && checkDigit == 'A');
}

/* empty error message when*/
function emptyMembershipError(){
	 $(".error-hide-"+getBundleLanguage).hide();
}

$(function () {
	
    /* scrolling code starts */
	if (!isMobile){
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
	}
    /* scrolling code ends */
    
	chin = $('body').hasClass('chin');
	
	/*get now date*/
	
	
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var tillDate_from= new Date((new Date()).getTime() + 89*24*60*60*1000);
	var duration = $('#frmTravelGetQuote').length > 0 || $('#frmTravelPlan').length > 0 ? 180*24*60*60*1000 :30*24*60*60*1000;
	
	var checkout;
	/* desktoip datepicker*/
	$("#txtStartDateDesk").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkin.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});
	$("#txtEndDateDesk").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkout.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});	
	
	$("#txtStartDateMob").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkin2.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});
	$("#txtEndDateMob").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkout2.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});
	
	$("#txtStartDateBtm").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkin3.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});
	$("#txtEndDateBtm").blur(function() {
		var dateDiff = dateDiffInDaysFromNow(checkout3.datepicker("getDate").valueOf());
	    if(dateDiff < 0){ this.focus();return false; }
	});
	
	
	
	
	//================================================================================================================================
	//================================================================================================================================trval detail page datepicker
	//================================================================================================================================
	
	
	var checkinTravelDetail = $('#trval-dp1').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from;
		},
		//startDate:nowTemp,
		//endDate:  tillDate_from,
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
		//if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
		
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
								
			
			var startDate = $("#trval-dp1").datepicker("getDate");
			var endDate = $("#trval-dp2").datepicker("getDate");
			
			
						
			
			if(startDate>endDate){					
				$('#trval-dp2').datepicker('update', newDate);								
			}
			
			
			
					                 
			//-------------------------------------------------------------------------------ajax
			
			var path = window.location.href;		
			
	
					
		
				end = path.indexOf('travel-insurance');
				fullPath = path.substring(0, end) + "travel-insurance/quote";			
			
			
			
			//要搵返D 變數post 返
					
//			$.ajax({
//				  type: "POST",
//				  url: fullPath,
//				  data: { 'trLeavingDate': dateFormate(startDate),
//					  	  'trBackDate': dateFormate(endDate),
//					  	  'totalAdultTraveller':'',
//					  	  'totalChildTraveller':'',					  	  
//					  	  'days':'',
//					  	  'travellerCount':'',
//					  	  'ToalDue':'1',
//					  	  'planSelected':''					  	 
//				  },					  				  							  
//				  success: function(){					 					 
//				  }
//			
//			});
							
			//-------------------------------------------------------------------------------ajax		
						
			
	    
	});
	
	
	
	
	



	
	
	checkoutTravelDetail = $('#trval-dp2').datepicker({
		beforeShowDay: function (date) {
			if (!checkinTravelDetail.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf() && date.valueOf() < tillDate_from;
			} else {
				
				return date.valueOf() >= checkinTravelDetail.datepicker("getDate").valueOf() && date.valueOf() < checkinTravelDetail.datepicker("getDate").valueOf()+duration;
			}
		},
		autoclose: true,
		
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		
		var startDate = new Date($('#trval-dp1').datepicker("getDate").valueOf());
		var endDate = new Date($('#trval-dp2').datepicker("getDate").valueOf());
		
		
		
		
		//-------------------------------------------------------------------------------ajax
		
		var path = window.location.href;		
		

				
	
			end = path.indexOf('travel-insurance');
			fullPath = path.substring(0, end) + "travel-insurance/quote";			
		
		
		
		//要搵返D 變數post 返
				
//		$.ajax({
//			  type: "POST",
//			  url: fullPath,
//			  data: { 'trLeavingDate': dateFormate(startDate),
//				  	  'trBackDate': dateFormate(endDate),
//				  	  'totalAdultTraveller':'',
//				  	  'totalChildTraveller':'',					  	  
//				  	  'days':'',
//				  	  'travellerCount':'',
//				  	  'ToalDue':'1',
//				  	  'planSelected':''					  	 
//			  },					  				  							  
//			  success: function(){					 					 
//			  }
//		
//		});
								
		
		
		
	//	document.getElementById("divPersonsDesk").style.visibility = "visible";
	//	document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});

	
	
	
	
	
	
	
	
	
	
	
	//================================================================================================================================
	//================================================================================================================================flight detail page datepicker
	//================================================================================================================================
	
	
	var checkinFightDetail = $('#dp1-detail-page').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from;
		},
		//startDate:nowTemp,
		//endDate:  tillDate_from,
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
		//if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
		
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
								
			
			var startDate = $("#dp1-detail-page").datepicker("getDate");
			var endDate = $("#dp2-detail-page").datepicker("getDate");
			
			
						
			
			if(startDate>endDate){					
				$('#dp2-detail-page').datepicker('update', newDate);								
			}
			
			
			
					                 
			//-------------------------------------------------------------------------------ajax
			
			var path = window.location.href;		
			
			var end = path.indexOf('flight-insurance');
			var fullPath = "";				
			
			if(end>0){
				fullPath = path.substring(0, end) + "flight-insurance/quote";					
			}
			else{
				path.indexOf('travel-insurance');
				fullPath = path.substring(0, end) + "travel-insurance/quote";			
			}
			
			
			
					
//			$.ajax({
//				  type: "POST",
//				  url: fullPath,
//				  data: { 'departureDate': dateFormate(startDate),
//					  	  'returnDate': dateFormate(endDate),
//					  	  'totalAdultTraveller':'',
//					  	  'totalChildTraveller':'',					  	  
//					  	  'days':'',
//					  	  'travellerCount':'',
//					  	  'ToalDue':'1',
//					  	  'planSelected':''					  	 
//				  },					  				  							  
//				  success: function(){					 					 
//				  }
//			
//			});
							
			//-------------------------------------------------------------------------------ajax		
						
			
	    
	});
	
	
	
	
	function dateFormate(thisDate){
		
		 var monthNames = [
		                      "January", "February", "March",
		                      "April", "May", "June", "July",
		                      "August", "September", "October",
		                      "November", "December"
		                  ];

		                  var date = new Date(thisDate);
		                  var day = date.getDate();
		                 if(day<10){		                	 
		                	 day = '0' + day;
		                 }
		                 
		                  var monthIndex = date.getMonth();		                  
		                  var year = date.getFullYear();
		                  var formateDate = day + " " + monthNames[monthIndex] +" " + year;
		                  return formateDate;
		
	}
	
	
	
	
	
	checkoutFightDetail = $('#dp2-detail-page').datepicker({
		beforeShowDay: function (date) {
			if (!checkinFightDetail.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf() && date.valueOf() < tillDate_from;
			} else {
				
				return date.valueOf() >= checkinFightDetail.datepicker("getDate").valueOf() && date.valueOf() < checkinFightDetail.datepicker("getDate").valueOf()+duration;
			}
		},
		autoclose: true,
		
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		
		var startDate = new Date($('#dp1-detail-page').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp2-detail-page').datepicker("getDate").valueOf());
		
		
		
		
		//-------------------------------------------------------------------------------ajax
							
		var path = window.location.href;		
		var end = path.indexOf('flight-insurance');
		var fullPath = path.substring(0, end) + "flight-insurance/quote";
				
//		$.ajax({
//			  type: "POST",
//			  url: fullPath,
//			  data: { 'departureDate': dateFormate(startDate),
//				  	  'returnDate': dateFormate(endDate),
//				  	  'totalAdultTraveller':'',
//				  	  'totalChildTraveller':'',					  	  
//				  	  'days':'',
//				  	  'travellerCount':'',
//				  	  'ToalDue':'1',
//				  	  'planSelected':''					  	 
//			  },					  				  							  
//			  success: function(){					 					 
//			  }
//		
//		});
						
		//-------------------------------------------------------------------------------ajax			
		
		
		
	//	document.getElementById("divPersonsDesk").style.visibility = "visible";
	//	document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

	});

	
	
	
	
	//================================================================================================================================	
	//================================================================================================================================ end fight page detail datepicker
	//================================================================================================================================
	
	// 18 year ago date
	var dob_end_date = new Date();
	dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
	
	// 86 year ago date
	var dob_start_date = new Date();
	dob_start_date.setFullYear(dob_start_date.getFullYear()-86);
	dob_start_date.setDate(dob_start_date.getDate()+1);
	
	// birthday datepicker, only 18-85 year-old users can buy the insurance
	$('#input_dob').datepicker({
		startView: "decade",
		autoclose: true,
		format: "dd MM yyyy",
		startDate: dob_start_date,
		endDate: dob_end_date
		/*language: getBundleLanguage*/
	});
	$('#input_dob').datepicker('setDate', dob_end_date);

	var checkin = $('#dp1').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from;
		},
		//startDate:nowTemp,
		//endDate:  tillDate_from,
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
		//if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
		
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			
			$('#dp3').datepicker('update', newDate);
			$('#dp5').datepicker('update', newDate);
			if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
				checkout.datepicker("update", newDate);
				checkout2.datepicker("update", newDate);
				checkout3.datepicker("update", newDate);
			}
			//checkout.datepicker("setEndDate", new Date(checkin.datepicker("getDate").valueOf() + duration));
			
		//}
		
		
		
			$('#dp2')[0].focus();
			var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
			var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
			/*document.getElementById("divPersonsDesk").style.visibility = "visible";
			document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);*/
	    
		
			
			
			$('#dp2-detail-page').datepicker('update', newDate);
		
		
				
			//-------------------------------------------------------------------------------ajax
			var path = window.location.href;		
			
			var end = path.indexOf('flight-insurance');
			var fullPath = "";				
			
			if(end>0){
				fullPath = path.substring(0, end) + "flight-insurance/quote";	
//				$.ajax({
//					  type: "POST",
//					  url: fullPath,
//					  data: { 'departureDate': dateFormate(startDate),
//						  	  'returnDate': dateFormate(endDate),
//						  	  'totalAdultTraveller':'',
//						  	  'totalChildTraveller':'',					  	  
//						  	  'days':'',
//						  	  'travellerCount':'',
//						  	  'ToalDue':'1',
//						  	  'planSelected':''					  	 
//					  },					  				  							  
//					  success: function(){					 					 
//					  }
//				
//				});
				
			}else{
				end = path.indexOf('travel-insurance')
				fullPath = path.substring(0, end) + "travel-insurance/quote";	
				
				
//				$.ajax({
//					  type: "POST",
//					  url: fullPath,
//					  data: { 'trLeavingDate': dateFormate(startDate),
//						  	  'trBackDate': dateFormate(endDate),
//						  	  'totalAdultTraveller':'',
//						  	  'totalChildTraveller':'',					  	  
//						  	  'days':'',
//						  	  'travellerCount':'',
//						  	  'ToalDue':'1',
//						  	  'planSelected':''					  	 
//					  },					  				  							  
//					  success: function(){					 					 
//					  }
//				
//				});
			}
			
			
					
			
							
			//-------------------------------------------------------------------------------ajax			
			
			
			
			
	
			if($(this).hasClass("bmg-flight-inline-dp1")){
				updateFlightQuote();
			}else if($(this).hasClass("bmg-travel-inline-dp1")){
				updateTravelQuote();
			}
	});
	
	checkout = $('#dp2').datepicker({
		beforeShowDay: function (date) {
			if (!checkin.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf() && date.valueOf() < tillDate_from;
			} else {
				
				return date.valueOf() >= checkin.datepicker("getDate").valueOf() && date.valueOf() < checkin.datepicker("getDate").valueOf()+duration;
			}
		},
		autoclose: true,
		
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		var startDate = new Date($('#dp1').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp2').datepicker("getDate").valueOf());
		/*document.getElementById("divPersonsDesk").style.visibility = "visible";
		document.getElementById("lblDaysDesk").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);*/

		if (ev.date.valueOf() < checkin.datepicker("getDate").valueOf() || !checkin.datepicker("getDate").valueOf()) {
			checkin.datepicker("update", endDate);
			checkin2.datepicker("update", endDate);
			checkin3.datepicker("update", endDate);
		}
		
		$('#dp4').datepicker('update', endDate);
		$('#dp6').datepicker('update', endDate);
		
		
		//-------------------------------------------------------------------------------ajax		
		//-------------------------------------------------------------------------------ajax
		var path = window.location.href;		
		
		var end = path.indexOf('flight-insurance');
		var fullPath = "";				
		
		if(end>0){
			fullPath = path.substring(0, end) + "flight-insurance/quote";	
//			$.ajax({
//				  type: "POST",
//				  url: fullPath,
//				  data: { 'departureDate': dateFormate(startDate),
//					  	  'returnDate': dateFormate(endDate),
//					  	  'totalAdultTraveller':'',
//					  	  'totalChildTraveller':'',					  	  
//					  	  'days':'',
//					  	  'travellerCount':'',
//					  	  'ToalDue':'1',
//					  	  'planSelected':''					  	 
//				  },					  				  							  
//				  success: function(){					 					 
//				  }
//			
//			});
			
		}
		
		else{
			
			 end = path.indexOf('travel-insurance')
			
			fullPath = path.substring(0, end) + "travel-insurance/quote";	
			
			
//			$.ajax({
//				  type: "POST",
//				  url: fullPath,
//				  data: { 'trLeavingDate': dateFormate(startDate),
//					  	  'trBackDate': dateFormate(endDate),
//					  	  'totalAdultTraveller':'',
//					  	  'totalChildTraveller':'',					  	  
//					  	  'days':'',
//					  	  'travellerCount':'',
//					  	  'ToalDue':'1',
//					  	  'planSelected':''					  	 
//				  },					  				  							  
//				  success: function(){					 					 
//				  }
//			
//			});
			
			
		}
		
		
				
		
						
		//-------------------------------------------------------------------------------ajax		
		
				
		
						
		//-------------------------------------------------------------------------------ajax			
		//-------------------------------------------------------------------------------ajax			
		
		if($(this).hasClass("bmg-flight-inline-dp2")){
			updateFlightQuote();
		}else if($(this).hasClass("bmg-travel-inline-dp2")){
			updateTravelQuote();
		}
	});



	/* mobile datepicker */
	var checkin2 = $('#dp3').datepicker({
		beforeShowDay: function (date) {
			//return date.valueOf() >= now.valueOf();
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		//if (ev.date.valueOf() > checkout2.datepicker("getDate").valueOf() || !checkout2.datepicker("getDate").valueOf()) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			
			$('#dp1').datepicker('update', newDate);
			$('#dp5').datepicker('update', newDate);
			
			if (ev.date.valueOf() > checkout2.datepicker("getDate").valueOf() || !checkout2.datepicker("getDate").valueOf()) {
				checkout.datepicker("update", newDate);
				checkout2.datepicker("update", newDate);
				checkout3.datepicker("update", newDate);
			}
		//}
		$('#dp4')[0].focus();

		var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
		document.getElementById("divPersonsMob").style.visibility = "visible";
		document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

		
	});
	var checkout2 = $('#dp4').datepicker({
		beforeShowDay: function (date) {
//			if (!checkin2.datepicker("getDate").valueOf()) {
//				return date.valueOf() >= new Date().valueOf();
//			} else {
//				return date.valueOf() >= checkin2.datepicker("getDate").valueOf();
//			}
			if (!checkin2.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf() && date.valueOf() < tillDate_from;
			} else {
				
				return date.valueOf() >= checkin2.datepicker("getDate").valueOf() && date.valueOf() < checkin2.datepicker("getDate").valueOf()+duration;
			}
		},
		autoclose: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {

		var startDate = new Date($('#dp3').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp4').datepicker("getDate").valueOf());
		document.getElementById("divPersonsMob").style.visibility = "visible";
		document.getElementById("lblDaysMob").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

		if (ev.date.valueOf() < checkin2.datepicker("getDate").valueOf() || !checkin2.datepicker("getDate").valueOf()) {
			checkin.datepicker("update", endDate);
			checkin2.datepicker("update", endDate);
			checkin3.datepicker("update", endDate);
		}
		
		$('#dp2').datepicker('update', endDate);
		$('#dp6').datepicker('update', endDate);
	});



	/* bottom datepicker */
	var checkin3 = $('#dp5').datepicker({
		beforeShowDay: function (date) {
			//return date.valueOf() >= now.valueOf();
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		//if (ev.date.valueOf() > checkout3.datepicker("getDate").valueOf() || !checkout3.datepicker("getDate").valueOf()) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			
			$('#dp1').datepicker('update', newDate);
			$('#dp3').datepicker('update', newDate);
			
			checkout.datepicker("update", newDate);
			checkout2.datepicker("update", newDate);
			checkout3.datepicker("update", newDate);
		//}
		$('#dp6')[0].focus();
		var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
		document.getElementById("divPersonsBtm").style.visibility = "visible";
		document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

		
	});
	var checkout3 = $('#dp6').datepicker({
		beforeShowDay: function (date) {
//			if (!checkin3.datepicker("getDate").valueOf()) {
//
//				return date.valueOf() >= new Date().valueOf();
//			} else {
//				return date.valueOf() >= checkin3.datepicker("getDate").valueOf();
//			}
			if (!checkin3.datepicker("getDate").valueOf()) {

				return date.valueOf() >= new Date().valueOf() && date.valueOf() < tillDate_from;
			} else {
				
				return date.valueOf() >= checkin3.datepicker("getDate").valueOf() && date.valueOf() < checkin3.datepicker("getDate").valueOf()+duration;
			}
		},
		autoclose: true,
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) { 

		var startDate = new Date($('#dp5').datepicker("getDate").valueOf());
		var endDate = new Date($('#dp6').datepicker("getDate").valueOf());
		document.getElementById("divPersonsBtm").style.visibility = "visible";
		document.getElementById("lblDaysBtm").innerHTML = isNaN(dateDiffInDays(startDate, endDate)) ? 0 : dateDiffInDays(startDate, endDate);

		if (ev.date.valueOf() < checkin3.datepicker("getDate").valueOf() || !checkin3.datepicker("getDate").valueOf()) {
			checkin.datepicker("update", endDate);
			checkin2.datepicker("update", endDate);
			checkin3.datepicker("update", endDate);
		}
		
		$('#dp2').datepicker('update', endDate);
		$('#dp4').datepicker('update', endDate);
	});

});//]]>  

/* No spinner */




function dateDiffInDays(a, b) {
	// Discard the time and time-zone information.
	var diffDays = (b - a) / 1000 / 60 / 60 / 24;
	return diffDays + 1;
}


/* login popup and overlay scirpt */


$("#fwd-login").on('click', function (e) {
	if (!$('#overlay').length) {
		$('body').append('<div id="overlay"> </div>')
	}
})
$('body').click(function (e) {
	if (!$(e.target).is('#fwd-login')) {
		$('#overlay').remove();
	}
})

$('#myDropdown .dropdown-menu,#myDropdownMob .dropdown-menu').on({
	"click": function (e) {
		e.stopPropagation();
	}
});
$('#myFWDropdown .dropdown-menu,#myFWDropdownMob .dropdown-menu,#myFWDropdownBtm .dropdown-menu').on({
	"click": function (e) {
		e.stopPropagation();
	}
});

function setDropDownValue(elm, val){
	var dropdown = $(elm).closest(".simulate-drop-down");
	dropdown.find(".select-label").html($(elm).html());
	dropdown.find("[role=value]").val(val);
}

/* flight plan details your details validation */

function fPlanValid()
{
	var flag=true;
	$('#chk2').html('');

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;

	
	

	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message");
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");
		flag = false;
	}


    if (fullname.trim() == "") {
    	document.getElementById("fullnameinvalid").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");
        flag = false;
    }

    if (emailId.trim() == "") {
        document.getElementById("emailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notNull.message");
        flag = false;
    }
    else {
        if (emailreg.test(emailId) == false) {

            document.getElementById("emailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notValid.message");
            flag = false;
        }
    }

    if (appHkid.trim() == "") {
    	document.getElementById("errAppHkid").innerHTML = getBundle(getBundleLanguage, "applicant.hkId.notNull.message");
        flag = false;
    }
	else
	{
		var tr=IsHKID(appHkid.trim());
		if(tr==false)
		{
				
			document.getElementById("errAppHkid").innerHTML = getBundle(getBundleLanguage, "applicant.hkId.notValid.message");
        	flag = false;
		}
	}

    if (mobileNo.trim() == "") {
        document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
        flag = false;
    }
    else {        
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
            flag = false;
        }
    }
    if (applicantDob.trim() == "") {
        document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
        flag = false;
    } else {
		 var age = document.getElementById("selectAgeRange1").value;
		 var applicantDobDate = new Date(applicantDob);
		 var today = new Date();

		 
		 var difference = Math.abs(today - applicantDobDate);
		 difference = Math.floor(difference / (1000 * 3600 * 24 * 365)); 
		 if (age == 1) {
			 if ( difference > 18) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }  
		 } else if (age == 2) {
			 if ( difference < 18 || difference > 70) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }
		 } else if (age == 3) {
			 if ( difference < 70 || difference > 85) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }
		 }
		 
	 }
   
// bug fix - avoid unnecessary validation if the user already login
	var isLogin = document.getElementById("isLogin").value;
	if (!isLogin)
	{
	   if( verifyUserBookingRegistration() === false)
		   flag = false;
	}
	if (applicantDob.trim() == "") {
        document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
        flag = false;
    }
    else {        
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("mobileNoInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
            flag = false;
        }
    }


	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	var rowCountOther=document.getElementById("totalCountOther").value;
	var rowCountPersonal=document.getElementById("totalPersonalTraveller").value;

	for (var i = 1; i <= parseInt(rowCountPersonal) ; i++)
	{
		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = "";
		}
		
		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}
		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "";
		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message"); // "Please enter Insured Person's HKID No.";
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				flag = false;
			}
		}
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}

			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		var selectedValue = document.getElementById("personalselectBenificiary" + i).value;
		var HkidPass = document.getElementById("personalBenefitiaryHKId"+i).value;
		var selectPersonalBenefitiaryHkidPass = document.getElementById("selectPersonalBenefitiaryHkidPass" + i).value;
		
		
		
		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(HkidPass.trim());
//				if(tr==false)
//				{
//					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
//			
			
			if (document.getElementById("personalBenefitiaryId" + i).value.trim() == "")
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("personalBenefitiaryHKId" + i).value;
			
			if (selectPersonalBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					}
				}

				
				
			}

		}
	}
	
	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{

		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}



		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		
		if (hkid.trim() == "") {
			document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				flag = false;
			}
		}
		
		
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		
		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;
		var HkidPass = document.getElementById("adultBenefitiaryHKId"+i).value;

		
		var selectAdBenefitiaryHkidPass = document.getElementById("selectAdBenefitiaryHkidPass" + i).value;
		
		
		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(hkid.trim());
//				if(tr==false)
//				{
//					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
			
			
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("adultBenefitiaryHKId" + i).value;

			if (selectAdBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {				
				if (hkida.trim() == "") {
			    	$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#erradultBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					}
				}

				
				
			}
			
			
		} 
			


	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		
		var fullname = document.getElementById("txtChldFullName" + i).value;
		var age = document.getElementById("selectchildAgeRange" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errchildRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message"); // getBundle(getBundleLanguage, "insured.age.notValid.message");;
			flag = false;
		}else{
			document.getElementById("errchildRange" + i).innerHTML = "";
		}
		
		
		
		
		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		
		
		
		if (hkid.trim() == "") {
			document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
			flag = false;
		}
		else
		{
			var tr=IsHKID(hkid.trim());
			if(tr==false)
			{
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
				flag = false;
			}
		}
		
		if (hkid.trim() != "") {
			
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtChldInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		
		
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		var HkidPass = document.getElementById("txtchildInsuHkid"+i).value;
		var selectedChldBenefitiaryHkidPass = document.getElementById("selectedChldBenefitiaryHkidPass" + i).value;

		if(selectedValue != "SE"){
			
//			if (HkidPass.trim() == "") {
//				document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(HkidPass.trim());
//				if(tr==false)
//				{
//					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
//			
			
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("txtchildInsuHkid" + i).value;
			if (selectedChldBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
					if(IsHKID(hkida.trim())==false)
					{	
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errtxtchildInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					}
				}
			}
		}

	}

	/* Other Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountOther) ; i++)
	{
		var hkid = document.getElementById("txtOtherInsuHkid" + i).value;
		var fullname = document.getElementById("txtOtherFullName" + i).value;
		var age = document.getElementById("selectOtherAgeRange" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtOtherFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			flag = false;
		}else{
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "";
		}


		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "";
		}

		

		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1 ; j++)
			{
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{
					document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage");
					flag = false;
				}
			}
		}

		var selectedValue = document.getElementById("otherSelectBenificiary" + i).value;
		if(selectedValue != "SE"){
//			if (hkid.trim() == "") {
//				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
//				flag = false;
//			}
//			else
//			{
//				var tr=IsHKID(hkid.trim());
//				if(tr==false)
//				{
//					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
//					flag = false;
//				}
//			}
			
			
			if (document.getElementById("otherBenefitiaryName" + i).value == "")
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML=getBundle(getBundleLanguage, "beneficiary.name.notNull.message");
				flag = false;             
			}
			else
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML = "";
				
			}

			var hkidc = document.getElementById("txtOtherBenInsuHkid" + i).value;
			$("#errtxtOtherBenInsuHkid" + i).html("");
			var selectOtherBenefitiaryHkidPass = document.getElementById("selectOtherBenefitiaryHkidPass" + i).value;
			
			
			if (selectOtherBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkidc.trim() == "") {
			    	$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
					if(IsHKID(hkidc.trim())==false)
					{	
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == hkidc.toUpperCase()){
						$('#errtxtOtherBenInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
			} else {
				if (hkidc.trim() == "") {
					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkidc.trim()) == false) {
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					}
				}
			}
		}
	}


	return flag;

}

function allLetter(inputtxt) {
	var letters = /^[A-Za-z ]+$/;
	if (inputtxt.match(letters)) {
		
		return true;
	} else {
		
		return false;
	}
}

// bmg input fields validation START
function validateName(inputId, errorId, insureBoolean, inputType){
	var fullname = $("#"+inputId).val();
	
	if (fullname.trim() == "") {
		if(inputType=="applicant"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "applicant.name.notNull.message"));
		}else if(inputType=="insured"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "insured.name.notNull.message"));
		}else if(inputType=="beneficiary"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));
		}
		return false;
	}
	if (allLetter(fullname) == false) {
		if(inputType=="applicant"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "applicant.name.notNull.message"));
		}else if(inputType=="insured"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "insured.name.notNull.message"));
		}else if(inputType=="beneficiary"){
			$("#"+errorId).html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));
		}
		return false;
	}
	if(insureBoolean){
		$("#txtInsuFullName1").val(fullname);
	}
	$("#"+errorId).html('');
}

function validateHkid(inputId, selectId, errorId, insureBoolean, inputType){
	$('#'+inputId).val($('#'+inputId).val().toUpperCase());
	var appHkid = $('#'+inputId).val();
	var mySelectId = $('#'+selectId).val();
	if($('#'+selectId).length > 0 && ($('#'+selectId).val().toLowerCase() == 'passport' || $('#'+selectId).val().toLowerCase() == 'apppassport')){
		if (appHkid.trim() == "") {
			if(inputType=="applicant"){
				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			}else if(inputType=="insured"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.passport.lengthViolation.message"));
			}else if(inputType=="beneficiary"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
			}
			return false;
		}else{
			var tr = chkTravelHKPassLen(appHkid.trim());
            var tr1 = chkTravelHKPass(appHkid.trim());
            
			if (tr == false) {
				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
				
				return false;
			}	
			if (tr1 == false) {
				if(inputType=="applicant"){
					$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
				}else if(inputType=="insured"){
					$("#"+errorId).html(getBundle(getBundleLanguage, "insured.passport.notEnglish.message"));
				}else if(inputType=="beneficiary"){
					$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
				}			
				return false;						
			}
		}
	}else{
		if (appHkid.trim() == "") {
			if(inputType=="applicant"){
				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
			}else if(inputType=="insured"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.hkId.notNull.message"));
			}else if(inputType=="beneficiary"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			}	
			return false;
		}
		var tr=IsHKID(appHkid.trim());
		if(tr==false){
			if(inputType=="applicant"){
				$('#'+errorId).html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
			}else if(inputType=="insured"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "insured.hkId.notValid.message"));
			}else if(inputType=="beneficiary"){
				$("#"+errorId).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			}	
			return false;
		}
	}
	if(insureBoolean){
		$("#txtInsuHkid1").val(appHkid);
		$("#txtInsuHkid1").removeClass("bmg_custom_placeholder");
	}
	$('#'+errorId).html('');
}

function validateEmail(inputId, errorId, inputType){
	var emailId = $("#"+inputId).val();
	
	if (emailId.trim() == "") {
		$("#"+errorId).html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		return false;
	} else if (emailreg.test(emailId) == false) {
		$("#"+errorId).html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
		return false;
	}
	$("#"+errorId).html("");
}

function validateMobile(inputId, errorId, inputType){
	var mobileNo = $("#"+inputId).val();
	
	if (mobileNo.trim() == "") {
		$("#"+errorId).html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
		return false;
	}else if (mobile_pattern.test(mobileNo) == false) {
		$("#"+errorId).html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
		return false;
	}
	$("#"+errorId).html("");
}


function validateDob(inputId, errorId, inputType){
	var dob = $("#"+inputId).val();
	
	if (dob.trim() == "") {
		$("#"+errorId).html(getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
		return false;
	} else {
		$("#"+errorId).html("");	
	}
	
}

//bmg input fields validation END



$(function () {
	if($('#inputFullName').length > 0){   // run only for the flight-plan-details page
		
//		$("#inputFullName").blur(function() {
//			var fullname = document.getElementById("inputFullName").value;
//			
//			if (fullname.trim() == "") {
//				$("#fullnameinvalid").html( getBundle(getBundleLanguage, "applicant.name.notNull.message"));//"Please enter your Name in English.";
//				return false;
//			}
//			if (allLetter(fullname) == false) {
//				
//				$("#fullnameinvalid")
//						.html(
//								getBundle(getBundleLanguage,
//										"applicant.name.notNull.message"));
//				return false;
//			}
//				
//			$("#txtAdFullName1").val($(this).val());
//			$("#fullnameinvalid").html('');
//		});
//		
//		$("#inputTxtAppHkid, #txtAppHkid").blur(function() {
//			var appHkid = $(this).val();
//				
//			if($('#selectHkidPass').length > 0 && ($('#selectHkidPass').val().toLowerCase() == 'passport' || $('#selectHkidPass').val().toLowerCase() == 'apppassport')){
//
//				if (appHkid.trim() == "") {
//					$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
//					return false;
//				}else{
//					var tr = chkTravelHKPass(appHkid.trim());
//                    var tr1 = chkTravelHKPassLen(appHkid.trim());
//                    
//					if (tr == false) {
//						$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
//						
//						return false;
//					}	
//					if (tr1 == false) {
//						$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
//						
//						return false;						
//					}
//				}
//				
//			}else{ 
//				if (appHkid.trim() == "") {
//					$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				var tr=IsHKID(appHkid.trim());
//				if(tr==false)
//				{
//					$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
//					return false;
//				}
//			}
//			
//			$("#txtInsuHkid1").val($(this).val());
//			$('#errAppHkid').html('');
//		});
//		
//		$("#inputEmailId").blur(function() {
//			var emailId = $(this).val();
//			
//			if (emailId.trim() == "") {
//				$("#emailid").html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
//				return false;
//			} else {
//				if (emailreg.test(emailId) == false) {
//
//					$("#emailid").html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
//					return false;
//				}
//			}
//			$("#emailid").html("");
//			
//		});
//		
//		$("#inputMobileNo").blur(function() {
//			var mobileNo = $(this).val();
//			
//			if (mobileNo.trim() == "") {
//				$("#mobileNo").html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
//				return false;
//			}else {        
//				if (mobile_pattern.test(mobileNo) == false) {
//					$("#mobileNo").html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
//					return false;
//				}
//			}
//			$("#mobileNo").html("");
//		});
		
		// Adult Validation for the next 2 actions
		
//		$( "input[id^='txtAdFullName']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtAdFullName").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "") {
//					$("#errtxtAdFullName"+errNo).html( getBundle(getBundleLanguage, "insured.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				$("#errtxtAdFullName"+errNo).html('');
//		});
//		
//		$( "input[id^='txtInsuHkid']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtInsuHkid").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				
//				
//				if($('#selectedAdHkidPass'+errNo).length > 0 && $('#selectedAdHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#errtxtInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.lengthViolation.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#errtxtInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.notEnglish.message"));
//							
//							return false;
//						}	
//					}
//					
//				}else{ 
//				
//					if (appHkid.trim() == "") {
//						$("#errtxtInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#errtxtInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notValid.message"));
//						return false;
//					}
//				}
//				
//				$("#errtxtInsuHkid"+errNo).html('');
//				
//				
//				
//		});
		
		//Child Validation for the next 2 actions
		
//		$( "input[id^='txtChldFullName']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtChldFullName").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "") {
//					$("#errtxtChldFullName"+errNo).html( getBundle(getBundleLanguage, "insured.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				
//				if (allLetter(fullname) == false) {
//					
//					$("#fullnameinvalid")
//							.html(
//									getBundle(getBundleLanguage,
//											"insured.name.notNull.message"));
//					return false;
//				}
//					
//				$("#errtxtChldFullName"+errNo).html('');
//		});
//		$( "input[id^='txtChldInsuHkid']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtChldInsuHkid").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				
//				if($('#selectChldHkidPass'+errNo).length > 0 && $('#selectChldHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#errtxtChldInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.lengthViolation.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#errtxtChldInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.notEnglish.message"));
//							
//							return false;
//						}	
//					}
//					
//				}else{ 
//				
//					if (appHkid.trim() == "") {
//						$("#errtxtChldInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#errtxtChldInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notValid.message"));
//						return false;
//					}
//					
//				}
//				$("#errtxtChldInsuHkid"+errNo).html('');
//				
//		});
		
		// Others Validation for the next 2 actions
		
//		$( "input[id^='txtOtherFullName']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtOtherFullName").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "") {
//					$("#errtxtOtherFullName"+errNo).html( getBundle(getBundleLanguage, "insured.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				$("#errtxtOtherFullName"+errNo).html('');
//		});
//		$( "input[id^='txtOtherInsuHkid']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtOtherInsuHkid").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				if($('#selectOtHkidPass'+errNo).length > 0 && $('#selectOtHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#errtxtOtherInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.lengthViolation.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#errtxtOtherInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.passport.notEnglish.message"));
//							
//							return false;
//						}	
//					}
//					
//				}else{ 
//				
//					if (appHkid.trim() == "") {
//						$("#errtxtOtherInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#errtxtOtherInsuHkid"+errNo).html(getBundle(getBundleLanguage, "insured.hkId.notValid.message"));
//						return false;
//					}
//				}
//				$("#errtxtOtherInsuHkid"+errNo).html('');
//		});
		
		
		// Set the default values of Benefeciary to Self
		$('input[id^="childselectBenificiary"],input[id^="adultsselectBenificiary"],input[id^="otherSelectBenificiary"] ').each(function( index ) {
			  $(this).val('SE');
		});
		
		// Set the default values of the Age for child and adults
		
		
		
		
		// Adult Beneficiary Validation for the next 2 actions
		
//		$( "input[id^='adultBenefitiaryId']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("adultBenefitiaryId").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "" && $(this).parent().parent().hasClass('hide') == false) {
//					$("#erradultBenefitiaryId"+errNo).html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				$("#erradultBenefitiaryId"+errNo).html('');
//		});
//		$( "input[id^='adultBenefitiaryHKId']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("adultBenefitiaryHKId").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				if($('#selectAdBenefitiaryHkidPass'+errNo).length > 0 && $('#selectAdBenefitiaryHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#erradultBenefitiaryHKId"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#erradultBenefitiaryHKId"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.lengthViolation.message"));
//							
//							return false;
//						}	
//					}
//					
//				}else{ 
//				
//					if (appHkid.trim() == "") {
//						$("#erradultBenefitiaryHKId"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#erradultBenefitiaryHKId"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
//						return false;
//					}
//				}
//				$("#erradultBenefitiaryHKId"+errNo).html('');
//		});
		
		// Child Beneficiary Validation for the next 2 actions
		
//		$( "input[id^='childBenefitiaryName']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("childBenefitiaryName").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "") {
//					$("#errchildBenefitiaryName"+errNo).html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				$("#errchildBenefitiaryName"+errNo).html('');
//		});
//		$( "input[id^='txtchildInsuHkid']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtchildInsuHkid").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				
//				if($('#selectChldBenefitiaryHkidPass'+errNo).length > 0 && $('#selectChldBenefitiaryHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#errtxtchildInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#errtxtchildInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.lengthViolation.message"));
//							return false;
//						}	
//					}
//					
//				}else{ 
//				
//					if (appHkid.trim() == "") {
//						$("#errtxtchildInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#errtxtchildInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
//						return false;
//					}
//				}
//				$("#errtxtchildInsuHkid"+errNo).html('');
//		});
		
		// Others Beneficiary Validation for the next 2 actions
		
//		$( "input[id^='otherBenefitiaryName']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("otherBenefitiaryName").pop(); 
//			  var fullname = $(this).val();
//				if (fullname.trim() == "") {
//					$("#errotherBenefitiaryName"+errNo).html( getBundle(getBundleLanguage, "beneficiary.name.notNull.message"));//"Please enter your Name in English.";
//					return false;
//				}
//				$("#errotherBenefitiaryName"+errNo).html('');
//		});
//		$( "input[id^='txtOtherBenInsuHkid']" ).on( "change blur", function() {
//			  var errNo = $(this).attr('id').split("txtOtherBenInsuHkid").pop(); 
//				
//				var appHkid = $(this).val();
//				
//				if($('#selectOtherBenefitiaryHkidPass'+errNo).length > 0 && $('#selectOtherBenefitiaryHkidPass'+errNo).val().toLowerCase() == 'passport'){
//
//					if (appHkid.trim() == "") {
//						$("#errtxtOtherBenInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"));
//						return false;
//					}else{
//						var tr = chkTravelHKPass(appHkid.trim());
//						if (tr == false) {
//							$("#errtxtOtherBenInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.passport.lengthViolation.message"));
//							return false;
//						}	
//					}
//					
//				}else{ 
//					if (appHkid.trim() == "") {
//						$("#errtxtOtherBenInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));//"Please enter your Name in English.";
//						return false;
//					}
//					var tr=IsHKID(appHkid.trim());
//					if(tr==false)
//					{
//						$("#errtxtOtherBenInsuHkid"+errNo).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
//						return false;
//					}
//				}
//				$("#errtxtOtherBenInsuHkid"+errNo).html('');
//		});	
	
	
		
		$('select[id^="selectOtherAgeRange"],select[id^="selectAgeRange"]').each(function( index ) {
			  $(this).val('2');
		});
		$('select[id^="selectchildAgeRange"]').each(function( index ) {
			  $(this).val('1');
		});
		
		$('select[id^="selectAgeRange"]').on( "change",function( index ) {
			  var errNo = $(this).attr('id').split("selectAgeRange").pop();
			  if($(this).val() == '' || $(this).val() == 0){
				  $('#errselectAgeRange'+errNo).html(getBundle(getBundleLanguage, "insured.age.notValid.message"));
			  }else{
				  $('#errselectAgeRange'+errNo).html("");
			  } 
		});
		$('select[id^="selectchildAgeRange"]').on( "change",function( index ) {
			  var errNo = $(this).attr('id').split("selectchildAgeRange").pop();
			  if($(this).val() == '' || $(this).val() == 0){
				  $('#errchildRange'+errNo).html(getBundle(getBundleLanguage, "insured.age.notValid.message"));
			  }else{
				  $('#errchildRange'+errNo).html("");
			  } 
		});		
		$('select[id^="selectOtherAgeRange"]').on( "change",function( index ) {
			  var errNo = $(this).attr('id').split("selectOtherAgeRange").pop();
			  if($(this).val() == '' || $(this).val() == 0){
				  $('#errselectOtherAgeRange'+errNo).html(getBundle(getBundleLanguage, "insured.age.notValid.message"));
			  }else{
				  $('#errselectOtherAgeRange'+errNo).html("");
			  } 
		});		
		

		
		/*if($('#selectAgeRange1').length > 0){
			$('#selectAgeRange1').val('2');
			//$('#selectAgeRange1').parent
		}
		
		
		if($('#selectchildAgeRange1').length > 0){
			$('#selectchildAgeRange1').val('1');
		}*/
		
	}
	
});




//Travel plan details page validation
var travelp_click = false;
function tPlanValid()
{

	var flag=true;
	document.getElementById("fullnameinvalid").innerHTML = "";
	document.getElementById("errAppHkid").innerHTML = "";
	document.getElementById("emailid").innerHTML = "";    
	document.getElementById("mobileNo").innerHTML = "";
	document.getElementById("dobInvalid").innerHTML = "";
	
	
	
	
	
	
	
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";

	var fullname = document.getElementById("inputFullName").value;
	var emailId = document.getElementById("inputEmailId").value;
	var mobileNo = document.getElementById("inputMobileNo").value;
	var appHkid = document.getElementById("inputTxtAppHkid").value;
	var applicantDob = document.getElementById("applicantDob").value;
	


	if (document.getElementById("checkbox1").checked == false) {
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"); //"Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		flag = false;
	}
	if (document.getElementById("checkbox2").checked == false) {
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "homecare.tnc.notChecked.message");;//"Please read and accept the Personal Information Collection Statement before submitting the application";
		flag = false;
	}

	if (fullname.trim() == "") {
		document.getElementById("fullnameinvalid").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");//"Please enter your Name in English.";
		flag = false;
	}

	if (emailId.trim() == "") {
		$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notNull.message"));
		flag = false;
	} else {
		if (emailreg.test(emailId) == false) {
			$('#emailid').html(getBundle(getBundleLanguage, "applicant.email.notValid.message"));
			flag = false;
		}
	}
	
	
	


	/**** VAlidation for HKID and Passport ***/
	var selectHkidPass = document.getElementById("selectHkidPass").value;
	if (appHkid.trim() == "") {
		if (selectHkidPass.toUpperCase() == "HKID") {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
			flag = false;
		}
		else {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
			flag = false;
		}
	}
	else {
		if (selectHkidPass.toUpperCase() == "HKID") {
			var tr = IsHKID(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
				flag = false;
			}
		}
		else {
			var tr = chkTravelHKPass(appHkid.trim());
			var tr1 = chkTravelHKPassLen(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
				
				flag = false;
			}
			if (tr1 == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
				
				flag = false;
			}			
		}
	}

	 if (mobileNo.trim() == "") 
	 {
		 	$('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message"));
	        flag = false;
	 }
	 else 
	 {        
	        if (mobile_pattern.test(mobileNo) == false) 
	        {
	            $('#errMobileNo').html(getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message"));
	            flag = false;
	        }
	 }

	 if (applicantDob.trim() == "") 
	 {
		 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notNull.message"));
	     flag = false;
	 } else {
		 var age = document.getElementById("selectAgeRange1").value;
		 var applicantDobDate = new Date(applicantDob);
		 var today = new Date();

		 
		 var difference = Math.abs(today - applicantDobDate);
		 difference = Math.floor(difference / (1000 * 3600 * 24 * 365)); 
		 if (age == 1) {
			 if ( difference > 18) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }  
		 } else if (age == 2) {
			 if ( difference < 18 || difference > 70) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }
		 } else if (age == 3) {
			 if ( difference < 70 || difference > 85) {
				 $('#dobInvalid').html(getBundle(getBundleLanguage, "applicant.dob.notValid.message"));
			     flag = false;		 
			 }
		 }
		 
	 }
	 

	

	var rowCountAdult=document.getElementById("totalAdultTraveler").value;
	var rowCountChild=document.getElementById("totalCountOfChild").value;
	var rowCountOther=document.getElementById("totalCountOther").value;
	var rowCountPersonal=document.getElementById("totalPersonalTraveller").value;
	

	for (var i = 1; i <= parseInt(rowCountPersonal) ; i++)
	{
		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtPersonalFullName" + i).innerHTML = "";
		}
		
		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}
		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		document.getElementById("errtxtInvalidInsuHkid" + i).innerHTML = "";
		
		
		var selectedPersonalHkidPass = document.getElementById("selectedPersonalHkidPass" + i).value;
		if (hkid.trim() == "") {
			if (selectedPersonalHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message"); // "Please enter Insured Person's HKID No.";
				flag = false;	
			} else {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
				flag = false;	
			}
			
		}
		else
		{
			if (selectedPersonalHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			}
			
		}
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}

			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		var selectedValue = document.getElementById("personalselectBenificiary" + i).value;
		var HkidPass = document.getElementById("personalBenefitiaryHKId"+i).value;
		var selectPersonalBenefitiaryHkidPass = document.getElementById("selectPersonalBenefitiaryHkidPass" + i).value;
		
		
		
		if(selectedValue != "SE"){
			

			if (document.getElementById("personalBenefitiaryId" + i).value.trim() == "")
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("errpersonalBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("personalBenefitiaryHKId" + i).value;
			
			if (selectPersonalBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errpersonalBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					} else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						flag = false;
					}	 
					
					
					
				}

				
				
			}

		}
	}
	
	/* Adult Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountAdult) ; i++)
	{

		var fullname = document.getElementById("txtInsuFullName" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtAdFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message"); //"Please enter Insured Person's Name in English.";
			flag = false;
		}else{
			document.getElementById("errtxtAdFullName" + i).innerHTML = "";
		}

		var age = document.getElementById("selectAgeRange" + i).value;
		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectAgeRange" + i).innerHTML = "";
		}



		var hkid = document.getElementById("txtInsuHkid" + i).value;
		document.getElementById("errtxtInsuHkid" + i).innerHTML = "";
		var selectedAdHkidPass = document.getElementById("selectedAdHkidPass" + i).value;
		
		if (hkid.trim() == "") {
			if (selectedAdHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
				flag = false;					
			} else {
				document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message")
				flag = false;
			}
			
		}
		else
		{
			if (selectedAdHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				} 
			}
		}
		
		
		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountChild);j++){
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtChldInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		
		var selectedValue = document.getElementById("adultsselectBenificiary" + i).value;
		var HkidPass = document.getElementById("adultBenefitiaryHKId"+i).value;

		
		var selectAdBenefitiaryHkidPass = document.getElementById("selectAdBenefitiaryHkidPass" + i).value;
		
		
		if(selectedValue != "SE"){
			if (document.getElementById("adultBenefitiaryId" + i).value == "")
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("erradultBenefitiaryId" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("adultBenefitiaryHKId" + i).value;

			if (selectAdBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {				
				if (hkida.trim() == "") {
			    	$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
			    	if(IsHKID(hkida.trim())==false)
					{	
						$("#erradultBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#erradultBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
					
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("erradultBenefitiaryHKId" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errpersonalBenefitiaryHKId" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					}  else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						flag = false;
					}	 
				}

				
				
			}
			
			
		} 
			


	}

	/* Child Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountChild) ; i++)
	{
		
		var fullname = document.getElementById("txtChldFullName" + i).value;
		var age = document.getElementById("selectchildAgeRange" + i).value;
		if (fullname.trim() == "") {
			document.getElementById("errtxtChldFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			flag = false;
		}else{
			document.getElementById("errtxtChldFullName" + i).innerHTML = "";
		}

		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errchildRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message"); // getBundle(getBundleLanguage, "insured.age.notValid.message");;
			flag = false;
		}else{
			document.getElementById("errchildRange" + i).innerHTML = "";
		}
		
		
		
		
		var hkid = document.getElementById("txtChldInsuHkid" + i).value;
		var selectedChldHkidPass = document.getElementById("selectedChldHkidPass" + i).value;
		
		
		if (hkid.trim() == "") {
			if (selectedChldHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
				flag = false;	
			} else {
				document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message")
				flag = false;	
			}
			 
		}
		else
		{
			if (selectedChldHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtChldInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			}
		}
		
		if (hkid.trim() != "") {
			
			for (var j = 1; j <= i-1; j++)
			{
				var hkid1 = document.getElementById("txtChldInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{	
					$('#errtxtChldInsuHkid'+i).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
			for (var j=1; j<=parseInt(rowCountOther);j++){
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase()){
					$('#errtxtOtherInsuHkid'+j).html(getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage"));
					flag = false;
				}
			}
		}
		
		
		var selectedValue = document.getElementById("childselectBenificiary" + i).value;
		var HkidPass = document.getElementById("txtchildInsuHkid"+i).value;
		var selectedChldBenefitiaryHkidPass = document.getElementById("selectedChldBenefitiaryHkidPass" + i).value;

		if(selectedValue != "SE"){
			
			
			if (document.getElementById("childBenefitiaryName" + i).value == "")
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML= getBundle(getBundleLanguage, "beneficiary.name.notNull.message"); // getBundle(getBundleLanguage, "beneficiary.name.notNull.message");;
				flag = false;             
			}
			else
			{
				document.getElementById("errchildBenefitiaryName" + i).innerHTML = "";
			}
			
			var hkida = document.getElementById("txtchildInsuHkid" + i).value;
			if (selectedChldBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkida.trim() == "") {
			    	$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
					if(IsHKID(hkida.trim())==false)
					{	
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == HkidPass.toUpperCase()){
						$('#errtxtchildInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
			} else {
				if (hkida.trim() == "") {
					document.getElementById("errtxtchildInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkida.trim()) == false) {
						$("#errtxtchildInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					} else if (hkida.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						flag = false;
					}	 
				}
			}
		}

	}

	/* Other Beneficiary validation */
	for (var i = 1; i <= parseInt(rowCountOther) ; i++)
	{
		var hkid = document.getElementById("txtOtherInsuHkid" + i).value;
		var fullname = document.getElementById("txtOtherFullName" + i).value;
		var age = document.getElementById("selectOtherAgeRange" + i).value;
		var selectedValue = document.getElementById("otherSelectBenificiary" + i).value;
		var selectOtHkidPass = document.getElementById("selectOtHkidPass" + i).value;
		
		if (fullname.trim() == "") {
			document.getElementById("errtxtOtherFullName" + i).innerHTML = getBundle(getBundleLanguage, "insured.name.notNull.message");
			flag = false;
		}else{
			document.getElementById("errtxtOtherFullName" + i).innerHTML = "";
		}


		if (age.trim() == "" || age.trim() == 0) {
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = getBundle(getBundleLanguage, "insured.age.notValid.message");
			flag = false;
		}else{
			document.getElementById("errselectOtherAgeRange" + i).innerHTML = "";
		}

		if (hkid.trim() == "") {
			if (selectOtHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notNull.message")
				flag = false;	
			} else {
				document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notNull.message")
				flag = false;	
			}
			 
		}
		else
		{
			if (selectOtHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			}
		}

		if (hkid.trim() != "") {
			for (var j = 1; j <= i-1 ; j++)
			{
				var hkid1 = document.getElementById("txtOtherInsuHkid" + j).value;
				if (hkid.toUpperCase() == hkid1.toUpperCase())
				{
					document.getElementById("errtxtOtherInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.hkId.duplicate.meesage");
					flag = false;
				}
			}
		}
		var selectOtherBenefitiaryHkidPass = document.getElementById("selectOtherBenefitiaryHkidPass" + i).value;
		if(selectedValue != "SE"){
		if (hkid.trim() == "") {
			if (selectOtherBenefitiaryHkidPass.toUpperCase() == 'HKID') {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message")
				flag = false;	
			} else {
				document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message")
				flag = false;	
			}
		}
		else
		{
			if (selectOtherBenefitiaryHkidPass.toUpperCase() == 'HKID') {
				var tr=IsHKID(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");;
					flag = false;
				}
			} else {
				var tr=chkTravelHKPass(hkid.trim());
				if(tr==false)
				{
					document.getElementById("errtxtInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "insured.passport.notValid.message"); // getBundle(getBundleLanguage, "insured.hkId.notValid.message");;
					flag = false;
				}
			}
		}
			
			
			if (document.getElementById("otherBenefitiaryName" + i).value == "")
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML=getBundle(getBundleLanguage, "beneficiary.name.notNull.message");
				flag = false;             
			}
			else
			{
				document.getElementById("errotherBenefitiaryName" + i).innerHTML = "";
				
			}

			var hkidc = document.getElementById("txtOtherBenInsuHkid" + i).value;
			$("#errtxtOtherBenInsuHkid" + i).html("");
			var selectOtherBenefitiaryHkidPass = document.getElementById("selectOtherBenefitiaryHkidPass" + i).value;
			
			
			if (selectOtherBenefitiaryHkidPass.toUpperCase() == 'HKID' ) {
				if (hkidc.trim() == "") {
			    	$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message"));
			        flag = false;
			    } else {
					if(IsHKID(hkidc.trim())==false)
					{	
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message"));
			        	flag = false;
					} else if (hkid.toUpperCase() == hkidc.toUpperCase()){
						$('#errtxtOtherBenInsuHkid'+i).html(getBundle(getBundleLanguage, "beneficiary.hkId.duplicate.message"));
						flag = false;
					}	
			    }
				
			} else {
				if (hkidc.trim() == "") {
					document.getElementById("errtxtOtherBenInsuHkid" + i).innerHTML = getBundle(getBundleLanguage, "beneficiary.passport.notNull.message"); // "Please enter Insured Person's HKID No.";
					flag = false;
				} else {
					if(chkTravelHKPass(hkidc.trim()) == false) {
						$("#errtxtOtherBenInsuHkid" + i).html(getBundle(getBundleLanguage, "beneficiary.passport.notValid.message"));
			        	flag = false;
					} else if (hkidc.toUpperCase() == hkid.toUpperCase()){
						$('#errpersonalBenefitiaryHKId'+i).html(getBundle(getBundleLanguage, "beneficiary.passport.duplicate.message"));
						flag = false;
					}	 
				}
			}
		}
	}
	
	
    if(travelp_click)
    	return false
    else{
    	if(flag)
    		travelp_click = true;
    	return flag;
    }	
	

}



function isAlphaNumeric(evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
	if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && (charCode < 47 || charCode > 57)) {
		return false;
	}
	return true;
}
function replaceAlphaNumeric(id) {
	var string = id.value;
	string = string.replace(/[^a-zA-Z0-9 ]/g, '');
	id.value = string;
}
function isNumeric(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;

	return true;
}
function replaceNumeric(id) {
	var string = id.value;
	string = string.replace(/[^0-9]/g, '');
	id.value = string;
}
function alphaOnly(evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
	if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		return false;
	}
	return true;
}
function replaceAlpha(id) {
	var string = id.value;
	string = string.replace(/[^\sa-zA-Z]/g, '');
	id.value = string;
}

/* flight page apply for no button validation */


/* Apply for now Top */
// flight
function flightValidateDesk()
{
	var flag = true;
	flag = flightValidateGetQuote("txtStartDateDesk", "startDateDeskIn", "txtEndDateDesk", "endDateDeskIn", "txtTravellersDesk", "lblPeopleDesk", "travelCountDeskIn");
	return flag;
}
function flightValidateMob() {
	var flag = true;

	flag = flightValidateGetQuote("txtStartDateMob", "startDateMobIn", "txtEndDateMob", "endDateMobIn", "txtTravellersMob", "lblPeopleMob", "travelCountMobIn");
	return flag;

}
function flightValidateBtm() {
	var flag = true;

	flag = flightValidateGetQuote("txtStartDateBtm", "startDateBtmIn", "txtEndDateBtm", "endDateBtmIn", "txtTravellersBtm", "lblPeopleBtm", "travelCountBtmIn");
	return flag;

}
function flightValidateGetQuote(depDateId, errDepDateId, returnDateId, errReturnDateId, travellersId, peopleCountId, errTravelCountId){
	var flag = true;
	
	
	//default
	if( document.getElementById(errTravelCountId) ){
		document.getElementById(errTravelCountId).style.display = "none";
	}
	
	var travellers = document.getElementById(travellersId).value;
	var peopleCount = document.getElementById(peopleCountId).innerHTML;
	
	var returnDateElement = document.getElementById(returnDateId);
	flag = chkValidFlightDate(returnDateElement, errReturnDateId, getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"), depDateId, errDepDateId, getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
	if(travellers > 0){
		
	}else if(peopleCount > 0){
		
	}
	else{
		if (travellers.trim() == "" || travellers =="0") {

			document.getElementById(errTravelCountId).style.display = "block";
			
			var msg = getBundle(getBundleLanguage, "flight.traveller.notNull.message");
			document.getElementById(errTravelCountId).innerHTML =msg;		
			flag = false;
		}
		if (peopleCount.trim()=="" || peopleCount=="0"){

			document.getElementById(errTravelCountId).style.display = "block";
		
			var msg = getBundle(getBundleLanguage, "flight.traveller.notNull.message");
			document.getElementById(errTravelCountId).innerHTML =msg;		
			flag = false;
		}
		if (peopleCount.trim() > 15){
			document.getElementById(errTravelCountId).style.display = "block";
			
			var msg = getBundle(getBundleLanguage, "flight.traveller.notValid.message");
			document.getElementById(errTravelCountId).innerHTML =msg;
			flag = false;
		}
	}
	
	if($('#'+depDateId).closest('form').find('input:radio[name=planSelected]:checked').val() == 'personal'){
		$('#txtAdultsMob, #txtChildMob, #txtOtherMob').val(0);
 		$('#txtAdultsBtm, #txtChildBtm, #txtOtherBtm').val(0);
 		$('#txtAdultsDesk, #txtOtherDesk, #txtChildDesk').val(0);
	}
	
	return flag;
}

function flightValidateDeskTravel()
{
	var flag = true;
	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("travelCountDeskIn").style.display = "none";
	
	/*var startDate = document.getElementById("txtStartDateDesk").value;    
	var endDate = document.getElementById("txtEndDateDesk").value;
	var travellers = document.getElementById("txtTravellersDesk").value;*/
	
	var startDate = $("#txtStartDateDesk").val();    
	var endDate = $("#txtEndDateDesk").val();
	var travellers = $("#txtTravellersDesk").val();
	
	var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);
		
	if(startDate.trim()=="")
	{
		$('#startDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	}
	else {
		if (startdays > 90) {
			$('#startDateDeskIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if(endDate.trim()=="")
	{
		$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	}
	else {
		if (enddays > 180) {
			$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if(travellers.trim()=="")
	{
		document.getElementById("travelCountDeskIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountDeskIn").style.display = "block";
		flag = false;
	}
	return flag;

}

function flightValidateMobTravel() {
	var flag = true;

	document.getElementById("startDateMobIn").innerHTML = "";
	document.getElementById("endDateMobIn").innerHTML = "";
	document.getElementById("travelCountMobIn").style.display = "none";
	
	/*var startDate = document.getElementById("txtStartDateMob").value;
	var endDate = document.getElementById("txtEndDateMob").value;
	var travellers = document.getElementById("txtTravellersMob").value;*/
	var startDate = $("#txtStartDateMob").val();
	var endDate = $("#txtEndDateMob").val();
	var travellers = $("#txtTravellersMob").val();
	
	var peopleCount = document.getElementById("lblPeopleMob").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		$('#startDateMobIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	} else {
		if (startdays > 90) {
			
			$('#startDateMobIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		$('#endDateMobIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	} else {
		if (enddays > 180) {
			$('#endDateMobIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("travelCountMobIn").style.display = "block";
		flag = false;
	}
	return flag;

}
function flightValidateBtmTravel() {
	var flag = true;

	document.getElementById("startDateBtmIn").innerHTML = "";
	document.getElementById("endDateBtmIn").innerHTML = "";
	$("#travelCountBtmIn").hide();
	/*var startDate = document.getElementById("txtStartDateBtm").value;
	var endDate = document.getElementById("txtEndDateBtm").value;
	var travellers = document.getElementById("txtTravellersBtm").value;*/
	
	var startDate =$("#txtStartDateBtm").val();
	var endDate = $("#txtEndDateBtm").val();
	var travellers = $("#txtTravellersBtm").val();
	
	var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		$('#startDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	}
	else
	{
		if(startdays>90)
		{
			$('#startDateBtmIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		$('#endDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	}
	else
	{
		if (enddays > 180) {
			$('#endDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if (travellers.trim() == "") {
		$("#travelCountBtmIn").show();
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		$("#travelCountBtmIn").show();
		flag = false;
	}
	return flag;

}

function flightValidateDeskWorkingHoliday()
{
	return true;
	var flag = true;

	document.getElementById("startDateDeskIn").innerHTML = "";
	document.getElementById("endDateDeskIn").innerHTML = "";
	document.getElementById("workingholidayCountDeskIn").style.display = "none";
	/*var startDate = document.getElementById("txtStartDateDesk").value;    
	var endDate = document.getElementById("txtEndDateDesk").value;
	var workingholidayers = document.getElementById("txtworkingholidayersDesk").value;*/
	
	var startDate = $("#txtStartDateDesk").val();    
	var endDate = $("#txtEndDateDesk").val();
	var workingholidayers = $("#txtworkingholidayersDesk").val();
	var peopleCount = document.getElementById("lblPeopleDesk").innerHTML;

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);
	if(startDate.trim()=="")
	{
		$('#startDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	}
	else {
		if (startdays > 30) {
			$('#startDateDeskIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if(endDate.trim()=="")
	{
		$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	}
	else {
		if (enddays > 180) {
			$('#endDateDeskIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if(workingholidayers.trim()=="")
	{
		document.getElementById("workingholidayCountDeskIn").style.display = "block";
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		document.getElementById("workingholidayCountDeskIn").style.display = "block";
		flag = false;
	}
	return flag;

}


function flightValidateBtmWorkingHoliday() {
	return true;
	var flag = true;

	document.getElementById("startDateBtmIn").innerHTML = "";
	document.getElementById("endDateBtmIn").innerHTML = "";
	$("#workingholidayCountBtmIn").hide();
	/*var startDate = document.getElementById("txtStartDateBtm").value;
	var endDate = document.getElementById("txtEndDateBtm").value;
	var workingholidayers = document.getElementById("txtworkingholidayersBtm").value;*/
	var startDate = $("#txtStartDateBtm").val();
	var endDate = $("#txtEndDateBtm").val();
	var workingholidayers = $("#txtworkingholidayersBtm").val();
	
	var peopleCount = document.getElementById("lblPeopleBtm").innerHTML;
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var new_start = new Date(startDate);
	var new_end = new Date(endDate);
	var startdays = dateDiffInDays(now, new_start);
	var enddays = dateDiffInDays(new_start, new_end);

	if (startDate.trim() == "") {
		$('#startDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.startDate.notValid.message"));
		flag = false;
	}
	else
	{
		if(startdays>30)
		{
			$('#startDateBtmIn').html(getBundle(getBundleLanguage, "travelcare.policy.startDate.moreThan30Days.message"));
			flag = false;
		}
	}
	if (endDate.trim() == "") {
		$('#endDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
		flag = false;
	}
	else
	{
		if (enddays > 180) {
			$('#endDateBtmIn').html(getBundle(getBundleLanguage, "date.policy.endDate.notValid.message"));
			flag = false;
		}
	}
	if (workingholidayers.trim() == "") {
		$("#workingholidayCountBtmIn").show();
		flag = false;
	}
	if(peopleCount.trim()==""||peopleCount=="0")
	{
		$("#workingholidayCountBtmIn").show();
		flag = false;
	}
	return flag;

}


/* join us page validation */
function validateJoinUsForm() {


	var valid = true;

	
	var fullName = $("#txtFullName").val();
	var mobileNo = $("#txtMobileNo").val();
	var emailId = $("#txtEmailId").val();
	var userName = $("#txtUserName1").val();
	var password = $("#txtPass1").val();
	var confirmPassword = $("#txtConfPass").val();


	document.getElementById("errorEmptyName").innerHTML = "";
	document.getElementById("errorEmptyMob").innerHTML = "";
	document.getElementById("errorEmptyEmailId").innerHTML= "";
	document.getElementById("errorEmptyUName").innerHTML = "";
	document.getElementById("errorJoinUsPassword").innerHTML = "";
	document.getElementById("errorEmptyConfPass").innerHTML= "";
	document.getElementById("chk1").innerHTML = "";
	document.getElementById("chk2").innerHTML = "";


	// FULL NAME VALIDATION
	if (fullName.trim() == "") {
		document.getElementById("errorEmptyName").innerHTML = getBundle(getBundleLanguage, "memeber.name.notNull.message"); // "Please enter your Name in English.";

		valid = false;

	} 
	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").innerHTML = getBundle(getBundleLanguage, "memeber.mobileNo.notNull.message"); // "Please enter your Mobile No.";

		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorEmptyMob").innerHTML = getBundle(getBundleLanguage, "memeber.mobileNo.notValid.message"); // "Please enter an 8-digit Mobile No.";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").innerHTML = getBundle(getBundleLanguage, "memeber.email.notNull.message"); // "Please enter your Email Address.";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorEmptyEmailId").innerHTML = getBundle(getBundleLanguage, "memeber.email.notValid.message"); // "Please enter a valid Email Address.";

			valid = false;
		}
	}
	var reg_user = /^[a-zA-Z0-9!??@%&??)*\+,.\/;\[\\\]\^_`{|}~-]{6,50}$/;
	// UserName Validation
	if (userName.trim() == "") {
		document.getElementById("errorEmptyUName").innerHTML = getBundle(getBundleLanguage, "memeber.username.notNull.message"); // "Please enter your Username.";

		valid = false;

	} else {
		if (reg_user.test(userName) == false) {
			document.getElementById("errorEmptyUName").innerHTML= getBundle(getBundleLanguage, "memeber.username.notValidLength.message"); // "Username must be between 6 and 50 characters.";
			valid = false;
		}
	}

	// validation for Passsword
	var passWordPttrn = "[a-zA-Z0-9]{8,}";
	var specialChar = "\\W";
	var rg = new RegExp(passWordPttrn);
	var spChar = new RegExp(specialChar);
	var message = "";
	if (password.trim() == ""){
		message  = getBundle(getBundleLanguage, "memeber.password.notNull.message"); // "Please enter your Password.";
		valid = false;
	} else if(!rg.test(password)) {  
		message += getBundle(getBundleLanguage, "memeber.password.notValidLength.message"); // "Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		valid = false;
	} else if(spChar.test(password)){
		message += getBundle(getBundleLanguage, "memeber.password.notValid.message"); // "\n Password must be at least 8 characters and alphanumeric (both upper AND lower cases).";
		valid = false;
	}
	document.getElementById("errorJoinUsPassword").innerHTML = message;


	if (confirmPassword.trim() == "") {
		document.getElementById("errorEmptyConfPass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notNull.message"); // "Please Confirm Password.";
		valid = false;
	} else {
		if (confirmPassword !== password) {
			document.getElementById("errorEmptyConfPass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notMatch.message"); // "Passwords you entered do not match. Please enter the same Password in both fields.";
			valid = false;
		}
	}
	if (document.getElementById("checkbox1").checked == false)
	{
		document.getElementById("chk1").innerHTML = getBundle(getBundleLanguage, "memeber.declaration.tnc.notChecked.message"); // "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
		valid = false;
	}
	if (document.getElementById("checkbox2").checked == false)
	{
		document.getElementById("chk2").innerHTML = getBundle(getBundleLanguage, "memeber.declaration.pics.notChecked.message"); // "Please read and accept the Personal Information Collection Statement before submitting the application.";
		valid = false;
	}


	return valid;

}



/*  forgot password validation */
function forgotPassword()
{

	var valid = true;


	var mobileNo = document.getElementById("mobileNo").value;

	var emailId = document.getElementById("emailAddress").value; 
	var userName = document.getElementById("userName").value; 


	document.getElementById("errorEmptyMob").style.display = "none";
	document.getElementById("errorInvalidMob").style.display = "none";
	document.getElementById("errorEmptyEmailId").style.display = "none";
	document.getElementById("errorInvalidEmailId").style.display = "none";
	document.getElementById("errorEmptyUName").style.display = "none";    
	document.getElementById("errorInvalidUName").style.display = "none";

	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").style.display = "block";


		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorInvalidMob").style.display = "block";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").style.display = "block";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorInvalidEmailId").style.display = "block";

			valid = false;
		}
	}

	// UserName Validation
	if (userName.trim() == "") {
		document.getElementById("errorEmptyUName").style.display = "block";

		valid = false;

	} else {
		if (reg.test(userName) == false) {
			document.getElementById("errorInvalidUName").style.display = "block";
			valid = false;
		}
	}
	return valid;
}
function forgotUserName() {


	var valid = true;


	var mobileNo = document.getElementById("mobileNo").value;
	var emailId = document.getElementById("emailAddress").value;


	document.getElementById("errorEmptyMob").style.display = "none";
	document.getElementById("errorInvalidMob").style.display = "none";
	document.getElementById("errorEmptyEmailId").style.display = "none";
	document.getElementById("errorInvalidEmailId").style.display = "none";


	// Mobile Number Validation
	if (mobileNo.trim() == "") {
		document.getElementById("errorEmptyMob").style.display = "block";

		valid = false;

	} else {
		if (mobile_pattern.test(mobileNo) == false) {
			document.getElementById("errorInvalidMob").style.display = "block";

			valid = false;
		}
	}

	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errorEmptyEmailId").style.display = "block";

		valid = false;
	} else {
		if (emailreg.test(emailId) == false) {
			document.getElementById("errorInvalidEmailId").style.display = "block";

			valid = false;
		}
	}

	return valid;
}
function resetPassword() {

	var flag = true;

	var pass = document.getElementById("password").value;
	var confpass = document.getElementById("confirmPassword").value;
	document.getElementById("errconfpass").innerHTML = "";
	document.getElementById("errpass").innerHTML = "";

	if (pass.trim() == "") {

		flag = false;
		document.getElementById("errpass").innerHTML = getBundle(getBundleLanguage, "memeber.password.notNull.message"); // "Please enter a Password";
	}
	else {
		if (password_pattern.test(pass) == false) {
			document.getElementById("errpass").innerHTML = getBundle(getBundleLanguage, "memeber.password.notValid.message"); // "Please enter a Valid Password";
			flag = false;
		}
	}

	if (confpass.trim() == "") {
		document.getElementById("errconfpass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notNull.message"); // "Please enter a Confirm Password";
		flag = false;
	} else {
		if (confpass !== pass) {
			document.getElementById("errconfpass").innerHTML = getBundle(getBundleLanguage, "memeber.confirmPassword.notValid.message"); // "Please enter a Valid Confirm Password";
			flag = false;
		}
	}
	return flag;
}

function validUser(formID)
{
	var flag = true;
	var userName = $("#"+formID+" #headerUserName").val();//document.getElementById("headerUserName").value;
	var password = $("#"+formID+" #headerPassword").val();//document.getElementById("headerPassword").value;
	
	//document.getElementById("errUserName").innerHTML = "";
	//document.getElementById("errPass").innerHTML = "";
	$("#"+formID+" #errUserName").html("");
	$("#"+formID+" #errPass").html("");

	if (password.trim() == "")
	{    	
		$("#"+formID+" #errPass").html(getBundle(getBundleLanguage, "user.password.notNull.message")); 
		flag = false;
	} 
	if (userName.trim() == "") {
		$("#"+formID+" #errUserName").html(getBundle(getBundleLanguage, "user.username.notValid.message"));
		
		flag = false;
	}

	return flag;
}
var device = 0; // 0 of desktop and 1 for mob
$(window).resize(function() {
	  var width = $(window).width();
	  
	  if(width>=992 && device == 1){
		 if($('body').hasClass('canvas-slid')){
			  $('.navmenu').offcanvas('hide');
			  $('.offcanvas').hide();
			  $('#overlay').remove();
	  	}
		  device = 0;
	  }else if( width <= 991 && device == 0){
		  $('#myDropdown').removeClass('open');
		  $('#overlay').remove();
		  device = 1;
	  }
	  
	  
})




//Chat API Calling
/*function zopim_chat_start(lang)
{
	window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
	d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
	_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
	$.src='//v2.zopim.com/?2sTG811AexKTVEObAoKHjEIw6cIoJccV';z.t=+new Date;$.
	type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');

	$zopim(function() {
        $zopim.livechat.setLanguage(lang);
    });
}
zopim_chat_start('en');*/


function isCreditCard(CC) {
	
    if (CC.length > 19) return (false);
  
    sum = 0;
    mul = 1;
    l = CC.length;
    for (i = 0; i < l; i++) {
      digit = CC.substring(l - i - 1, l - i);
      tproduct = parseInt(digit, 10) * mul;
      if (tproduct >= 10) sum += (tproduct % 10) + 1;
      else sum += tproduct;
      if (mul == 1) mul++;
      else mul--;
    }
    if ((sum % 10) == 0) return (true);
    else return (false);
}

//travel Payment Summary Payment details//
function validatecardnumber(cardnumber) {
	// Strip spaces and dashes


	cardnumber = cardnumber.replace(/[ -]/g, '');
	// See if the card is valid
	// The regex will capture the number in one of the capturing groups
	//var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
	var match = /^(?:(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
	
	if (match && isCreditCard(cardnumber)) {
		// List of card types, in the same order as the regex capturing groups
		var types = ['Visa', 'MasterCard', 'Discover', 'American Express', 'Diners Club', 'JCB'];
		// Find the capturing group that matched
		// Skip the zeroth element of the match array (the overall match)
		for (var i = 1; i < match.length; i++) {
			if (match[i]) {
				// Display the card type for that group
//				document.getElementById('errcardno').innerHTML = types[i - 1];
				if (i == 1) {
					document.getElementById("chkVisa").checked=true;
				} else {
					document.getElementById("chkMaster").checked=true;
					
				}
				document.getElementById('errcardno').innerHTML = '';
				break;
			}
		}
	} else {
		document.getElementById('errcardno').innerHTML = getBundle(getBundleLanguage, "applicant.creditcard.notValid.message");//'(invalid card number)';
		return false;
	}
	return true;
}

function payValid()
{

	var flag=true;
	var cardno=document.getElementById("cardnumber").value;

	var month=document.getElementById("month").value;


	var year=document.getElementById("year").value;
	var seccode=document.getElementById("seccode").value;
	var holdername=document.getElementById("holdername").value;

	document.getElementById('errcardno').innerHTML="";
	document.getElementById('errmonth').innerHTML="";
	document.getElementById('erryear').innerHTML="";
	document.getElementById('errname').innerHTML="";	
	document.getElementById('errcode').innerHTML="";
	document.getElementById('errchk1').innerHTML="";
	/*document.getElementById('errchk2').innerHTML="";*/

	if(cardno.length<16)
	{
		flag=false;
		$('#errcardno').html(getBundle(getBundleLanguage, "payment.creditCard.number.notValid.message"));
	}
	
	if(!isCreditCard(cardno))
	{
		flag=false;
		$('#errcardno').html(getBundle(getBundleLanguage, "applicant.creditcard.notValid.message"));
	}
	
	if(month=="" || month== 0)
	{
		flag=false;
		$('#errmonth').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.month.notValid.message"));
	}
	if(year=="" || year == 0)
	{
		flag=false;
		$('#erryear').html(getBundle(getBundleLanguage, "payment.creditCard.expiryDate.year.notValid.message"));
	}
	if(holdername.trim()=="")
	{
		flag=false;
		$('#errname').html(getBundle(getBundleLanguage, "payment.creditCard.name.notValid.message"));
	}
	if(seccode.trim()=="")
	{
		flag=false;
		$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notNull.message"));
	}
	
	if(seccode.length <3)
	{
		flag=false;
		$('#errcode').html(getBundle(getBundleLanguage, "payment.creditCard.securityCode.notValid.message"));
	}
	if (document.getElementById("checkbox3").checked == false)
	{
		$('#errchk1').html(getBundle(getBundleLanguage, "payment.tnc.notChecked.message"));
		flag = false;
	}
	
	return flag;
}


/*Promo popup*/
function get_promo_val()
{

	var valid = true;
	var emailId = document.getElementById("emailToSendPromoCode").value; 
	document.getElementById("errPromoEmail").style.display = "none";
	// Email Address Validation
	if (emailId.trim() == "") {
		document.getElementById("errPromoEmail").style.display = "block";
		document.getElementById("errPromoEmail").innerHTML = getBundle(getBundleLanguage, "promotion.email.notNull.message");//"Your E-mail Address is invalid.";
		valid = false;

	} else {

		if (emailreg.test(emailId) == false) {
			document.getElementById("errPromoEmail").style.display = "block";
			document.getElementById("errPromoEmail").innerHTML = getBundle(getBundleLanguage, "promotion.email.notValid.message");//"Your E-mail Address is invalid.";
			valid = false;
		}
	}

	return valid;
}

//Side Menu

//<![CDATA[ 
$(window).load(function(){
	$('.navmenu-fixed-left').offcanvas({
		placement: 'left',
		autohide: 'true',
		recalc: 'true'
	});
});//]]> 

function chkTravelHKPassLen(value) {
   var len = value.length;
   
   if (len > 15 || len < 5)
   {
	   return false;
   }
   else
   {
	   return true;
   }
}

function chkTravelHKPass(value) {
    var flag = true;
    var filter = passport_pattern;///^[!??%&??)*\+,.\/;\[\\\]\^_`{|}~-]+$/;
    
    value = value.replace(/[-/(/)]/g, '');
    if(!chkTravelHKPassLen(value.trim())){
    	flag = false;
    }
    var data = value.trim();
    if (data != "") {
        /*if (/^[A-Za-z ]+$/.test(data)) {
            //there are only characters
            flag = false;
        }
        else if (/^[0-9 ]+$/.test(data)) {
            //it contains numbers
            flag = false;
        }
        else */
        if (!filter.test(data)) {
            flag = false;
        }
    }
    else {
        flag = false;
    }
    return flag;
}

//ie9 placeholder solution
function placeholderOnFocus(element, placeholderVal){
	$(element).removeClass("bmg_custom_placeholder");
	if($(element).val()==placeholderVal){
		$(element).val('');
	}
}

function placeholderOnBlur(element, placeholderVal){
	if($(element).val()==''){
		$(element).addClass("bmg_custom_placeholder");
		$(element).val(placeholderVal);
	}
}


//HOME CARE VALIDATION
var home_click = false;
function hc_planValid() {
    var flag = true;
    
//    document.getElementById("appfullname").innerHTML = "";
//    var appFullName = document.getElementById("inputFullName").value;
//    
//    document.getElementById("errAppHkid").innerHTML = "";
//    var appHkid = document.getElementById("txtAppHkid").value;
//    
//    document.getElementById("errMobileNo").innerHTML = "";
//    var mobileNo = document.getElementById("inputMobileNo").value;
//    
//    document.getElementById("errEmailid").innerHTML = "";
//    
//    document.getElementById("dobInvalid").innerHTML = "";
//    
//    
//    var EmailId = document.getElementById("inputEmailId").value;
    
    /*document.getElementById("errRegUser").innerHTML = "";
    var RegUserName = document.getElementById("inputRegUserName").value;
    alert('jdj');
    document.getElementById("errRegPass").innerHTML = "";
    var RegPass = document.getElementById("inputRegPass").value;
    document.getElementById("errRegCPass").innerHTML = "";
    var RegCPass = document.getElementById("inputRegCPass").value;*/
    // corrosponding address
//    document.getElementById("errCABuilding").innerHTML = "";
//    var CABuilding = document.getElementById("inputCABuilding").value;
//    document.getElementById("errCAEstate").innerHTML = "";
//    var CAEstate = document.getElementById("inputCAEstate").value;
//    // address details
//    document.getElementById("errABuilding").innerHTML = "";
//    var ABuilding = document.getElementById("inputABuilding").value;
//    document.getElementById("errAEstate").innerHTML = "";
//    var AEstate = document.getElementById("inputAEstate").value;
//    document.getElementById("errNFA").innerHTML = "";
//    var NFA = document.getElementById("selectNFA").value;
//    document.getElementById("errEffDate").innerHTML = "";
//    var EffDate = document.getElementById("txtEffDate").value;
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(EffDate);
    var startdays = dateDiffInDays(now, new_start);
    
    
    
    
    //bmg edit
    
    if($("#txtAppHkid").val()==hkidPlaceholder){
    	$("#txtAppHkid").val('');
    }
    
    
    if($("#inputCARoom").val()==roomPlaceholder){
    	$("#inputCARoom").val('');
    }
    if($("#inputCAFloor").val()==floorPlaceholder){
    	$("#inputCAFloor").val('');
    }
    if($("#inputCABlock").val()==blockPlaceholder){
    	$("#inputCABlock").val('');
    }
    if($("#inputCABuilding").val()==buildingPlaceholder){
    	$("#inputCABuilding").val('');
    }
    if($("#inputCAEstate").val()==estatePlaceholder){
    	$("#inputCAEstate").val('');
    }
    if($("#inputCAStreetNo").val()==streetNoPlaceholder){
    	$("#inputCAStreetNo").val('');
    }
    if($("#inputCAStreetName").val()==streetNamePlaceholder){
    	$("#inputCAStreetName").val('');
    }
    
    
    if($("#inputARoom").val()==roomPlaceholder){
    	$("#inputARoom").val('');
    }
    if($("#inputAFloor").val()==floorPlaceholder){
    	$("#inputAFloor").val('');
    }
    if($("#inputABlock").val()==blockPlaceholder){
    	$("#inputABlock").val('');
    }
    if($("#inputABuilding").val()==buildingPlaceholder){
    	$("#inputABuilding").val('');
    }
    if($("#inputAEstate").val()==estatePlaceholder){
    	$("#inputAEstate").val('');
    }
    if($("#inputAStreetNo").val()==streetNoPlaceholder){
    	$("#inputAStreetNo").val('');
    }
    if($("#inputAStreetName").val()==streetNamePlaceholder){
    	$("#inputAStreetName").val('');
    }
    
    document.getElementById("appfullname").innerHTML = "";
    var appFullName = $("#inputFullName").val();
    
    document.getElementById("errAppHkid").innerHTML = "";
    var appHkid = $("#txtAppHkid").val();
    
    document.getElementById("errMobileNo").innerHTML = "";
    var mobileNo = $("#inputMobileNo").val();
    
    document.getElementById("errEmailid").innerHTML = "";
    
    document.getElementById("dobInvalid").innerHTML = "";
    
    
    var EmailId = $("#inputEmailId").val();
    
    /*document.getElementById("errRegUser").innerHTML = "";
    var RegUserName = document.getElementById("inputRegUserName").value;
    alert('jdj');
    document.getElementById("errRegPass").innerHTML = "";
    var RegPass = document.getElementById("inputRegPass").value;
    document.getElementById("errRegCPass").innerHTML = "";
    var RegCPass = document.getElementById("inputRegCPass").value;*/
    // corrosponding address
    document.getElementById("errCABuilding").innerHTML = "";
    var CABuilding = $("#inputCABuilding").val();
    document.getElementById("errCAEstate").innerHTML = "";
    var CAEstate = $("#inputCAEstate").val();
    // address details
    document.getElementById("errABuilding").innerHTML = "";
    var ABuilding = $("#inputABuilding").val();
    document.getElementById("errAEstate").innerHTML = "";
    var AEstate = $("#inputAEstate").val();
    document.getElementById("errNFA").innerHTML = "";
    var NFA = $("#selectNFA").val();
    document.getElementById("errEffDate").innerHTML = "";
    var EffDate = $("#txtEffDate").val();
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    var new_start = new Date(EffDate);
    var startdays = dateDiffInDays(now, new_start);
    
    //bmg edit
    
    document.getElementById("chk1").innerHTML = "";
    document.getElementById("chk2").innerHTML = "";
    
    $('#errCADist').html('');
    $('#errADist').html('');
    
    /**** VAlidation for HKID and Passport ***/
	 
//    var selectHkidPass = document.getElementById("selectHkidPass").value;
    var selectHkidPass = $("#selectHkidPass").val();
	if (appHkid.trim() == "") {
		if (selectHkidPass == "appHkid") {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
		else {
			$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message"));
			flag = false;
		}
	}
	else {
		if (selectHkidPass == "appHkid") {
			var tr = IsHKID(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
				flag = false;
			}
		}
		else {
			var tr = chkTravelHKPass(appHkid.trim());
			if (tr == false) {
				$('#errAppHkid').html(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
				
				flag = false;
			}
						
			
		}
	}
//	var applicantDob = document.getElementById("applicantDob").value;
	var applicantDob = $("#applicantDob").val();
	if (applicantDob.trim() == "") {
		document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
        flag = false;
    
	}
    
//    
    if (appFullName.trim() == "") {
        document.getElementById("appfullname").innerHTML = getBundle(getBundleLanguage, "applicant.name.notNull.message");
        flag = false;
    }
    
    if (mobileNo.trim() == "") {
        document.getElementById("errMobileNo").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
        flag = false;
    }
    else {        
        if (mobile_pattern.test(mobileNo) == false) {
            document.getElementById("errMobileNo").innerHTML = getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
            flag = false;
        }
    }
    
    if (EmailId.trim() == "") {
        document.getElementById("errEmailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notNull.message");
        flag = false;
    }
    else {
        if (emailreg.test(EmailId) == false) {

            document.getElementById("errEmailid").innerHTML = getBundle(getBundleLanguage, "applicant.email.notValid.message");
            flag = false;
        }
    }
    

    /*if (RegUserName.trim() != "") {
        if (reg.test(RegUserName) == false) {
            document.getElementById("errRegUser").innerHTML = "Please enter an Username";
            flag = false;
        }
    }
    if (RegPass.trim() != "") {
        if (password_pattern.test(RegPass) == false) {
            document.getElementById("errRegPass").innerHTML = "Please enter a Valid Password";
            flag = false;
        }
        if (RegCPass !== RegPass) {
            document.getElementById("errRegCPass").innerHTML = "Password does not match";
            flag = false;
        }
    }*/
    if (CABuilding.trim() == "" && CAEstate.trim() == "") {
        //document.getElementById("errCABuilding").innerHTML = "Name of Building is invalid.";
        $('#errCABuilding').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.building.notNull.message"));
        $('#errCAEstate').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.estate.notNull.message"));
        flag = false;
    }
    
    if (ABuilding.trim() == "" && AEstate.trim() == "") {
        //document.getElementById("errABuilding").innerHTML = "Please enter your Corresponding Address.";
        $('#errABuilding').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.building.notNull.message"));
        $('#errAEstate').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.estate.notNull.message"));
        flag = false;
    }
     
    if (NFA.trim() == "") {
        //document.getElementById("errNFA").innerHTML = "Please select Net Floor Area.";
        $('#errNFA').html(getBundle(getBundleLanguage, "homecare.netFloorArea.notNull.message"));
        flag = false;
    }
    if (EffDate.trim() == "") {
       // document.getElementById("errEffDate").innerHTML = "Effective Date must be within 60 days of Application Date.";
        $('#errEffDate').html(getBundle(getBundleLanguage, "homecare.effectiveDate.notValid.message"));
        flag = false;
    }
    else {
        if (startdays > 60) {
           // document.getElementById("errEffDate").innerHTML = "Effective Date must be within 60 days of Application Date.";
            $('#errEffDate').html(getBundle(getBundleLanguage, "homecare.effectiveDate.notValid.message"));
            flag = false;
        }
    }
    if (document.getElementById("checkbox1").checked == false) {
        //document.getElementById("chk1").innerHTML = "Please read and accept the Declaration, Terms & Conditions before submitting the application.";
        $('#chk1').html(getBundle(getBundleLanguage, "travelcare.declaration.notChecked.message"));
        flag = false;
    }
    if (document.getElementById("checkbox2").checked == false) {
        //document.getElementById("chk2").innerHTML = "Please read and accept the Personal Information Collection Statement before submitting the application.";
        $('#chk2').html(getBundle(getBundleLanguage, "homecare.tnc.notChecked.message"));
        flag = false;
    }
    
    //Distrct Validation
    if($('#selectCADist').val() == ''){
    	$('#errCADist').html(getBundle(getBundleLanguage, "homecare.district.notNull.message"));
    	flag = false;
    }
    if($('#selectADist').val() == ''){
    	$('#errADist').html(getBundle(getBundleLanguage, "homecare.district.notNull.message"));
    	flag = false;
    }
    
    //Remove the disabled / area select
    if(flag){
    	$('#selectADist').removeAttr('disabled');
    	$('#inlineDeskRadio31').removeAttr('disabled');
    	$('#inlineDeskRadio41').removeAttr('disabled');
    	$('#inlineDeskRadio51').removeAttr('disabled');
    }
    if(home_click)
    	return false;
    else{
    	if(flag)
    		home_click = true;
    	return flag;
    }	
    
}


////home care page validation
function msgAlertDesk(formID) {
    var flag = true;

    if(formID == 'getHomeQuote'){
    	if (document.getElementById("inlineDeskRadio1a1").checked){
        	flag=false;
        } else if (document.getElementById("inlineDeskRadio1a2").checked){
        	flag=false;
        }
    }else if(formID == 'getHomeQuoteMob'){
    	if (document.getElementById("inlineDeskRadio2a1").checked){
        	flag=false;
        } else if (document.getElementById("inlineDeskRadio2a2").checked){
        	flag=false;
        }
    }else if(formID == 'getHomeQuoteBottom'){
    	if (document.getElementById("inlineDeskRadio3a1").checked){
        	flag=false;
        } else if (document.getElementById("inlineDeskRadio3a2").checked){
        	flag=false;
        }
    }
    
    if (flag == false) {
    	$('#oldHome').modal('show');
    	$('#oldHome').on('shown.bs.modal', function (e) {
			var newHeight=($( window ).height()/2)-($('#homecareLandingModal').height()/2);
    		$('#homecareLandingModal').css({'top':newHeight+"px"});
        })
    	
	}
    return flag;    
}
/*
$('#oldHome').on('show.bs.modal', function (event) {
	  var modal = $(this);
	  modal.find('.errorMsg').text(getBundle(getBundleLanguage, "homecare.uw.question1.notEntitled.message"));
})*/
 
// common function
String.format = function() {
    // The string containing the format items (e.g. "{0}")
    // will and always has to be the first argument.
    var theString = arguments[0];
    
    // start with the second argument (i = 1)
    for (var i = 1; i < arguments.length; i++) {
        // "gm" = RegEx options for Global search (more than one instance)
        // and for Multiline search
        var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        theString = theString.replace(regEx, arguments[i]);
    }
    
    return theString;
}
function IsNumeric(input){
   return (input - 0) == input && input.length > 0;
}




//validation
function resetErrElement(errElementId){
	if(errElementId != null && document.getElementById(errElementId) != null){
		document.getElementById(errElementId).innerHTML = "";
	}
}
function isNull(element){
	if(element != null){
		if(element.value == null || element.value.trim() == ""){
			return true;
		}else{
			return false
		}
	}
	return false;
}
function dateLessThanCurrent(dat){
	
}
function dateDiffInDaysFromNow(dat){	
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
    
    return dateDiffInDays(now, dat);
}

// validation - date
function chkValidDate(element, errElementId, name){
	if(isNull(element)){

		var msg = getBundle(getBundleLanguage, "date.notNull.message");
		msg = String.format(msg, name);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		//resetErrElement(errElementId);
		return true;		
	}
}

// flight
function chkValidFlightDepartureDate(element, errElementId, name){
	
	if(chkValidDate(element, errElementId, name)){
	    //var departureDate = element.value;
		var departureDate = $(element).val();
	    departureDate = new Date(departureDate);
	    
	    
	    var dateDiff = dateDiffInDaysFromNow(departureDate);
	    if(dateDiff < 0){
	    	var msg = getBundle(getBundleLanguage, "flight.departureDate.notLessThanCurrent.message");
        	document.getElementById(errElementId).innerHTML = msg;
            return false;
	    }
	    if (dateDiff > 90) {
        	var msg = getBundle(getBundleLanguage, "flight.departureDate.notValid.message");
        	document.getElementById(errElementId).innerHTML = msg;
            return false;
        }else{
        	//resetErrElement(errElementId);
        	return true;
        }        
	}else{
		return false;
	}	
}
function chkValidFlightDate(element, errElementId, name, departureDateId, errDepartureDateId, departureDateName){
	//check departure date
	var flag = true;
//	var departureDate = document.getElementById("txtStartDateDesk").value;
//	
//	var returnDate = document.getElementById("txtEndDateDesk").value;
//	
//	if (departureDate.trim() == "") {
//		document.getElementById("startDateDeskIn").innerHTML = getBundle(getBundleLanguage, "date.policy.startDate.notValid.message");
//		flag = false;
//	}
//	if (returnDate.trim() == "") {
//		document.getElementById("endDateDeskIn").innerHTML = getBundle(getBundleLanguage, "date.policy.endDate.notValid.message");
//		flag = false;
//	}
//	
	/*var departureDate = document.getElementById(departureDateId).value; 
	var returnDate = element.value;*/
	
	var departureDate = $("#"+departureDateId).val(); 
	var returnDate = $(element).val();
	

	
	
	if (departureDate.trim() == "") {
		document.getElementById(errDepartureDateId).innerHTML = departureDateName;
		flag = false;
	}
	
	
	if (returnDate.trim() == "") {
		document.getElementById(errElementId).innerHTML = name;
		flag = false;
	}
	
	
	
	var elementDepartureDate = document.getElementById(departureDateId);

	if(chkValidFlightDepartureDate(elementDepartureDate, errDepartureDateId, departureDateName)){
		
		// check return date
		if(chkValidDate(element, errElementId, name)){
		    var departureDate = elementDepartureDate.value;
		    var returnDate = element.value;	    
		    
		    departureDate = new Date(departureDate);
		    returnDate = new Date(returnDate);
		    
		    var dateDiff = dateDiffInDays(departureDate, returnDate);
		    if(dateDiff < 0){
		    	var msg = getBundle(getBundleLanguage, "flight.returnDate.notLessThanCurrent.message");
	        	document.getElementById(errElementId).innerHTML = msg;
	        	flag = false;
		    }
	        if (dateDiff > 31) {
	        	var msg = getBundle(getBundleLanguage, "flight.returnDate.notValid.message");
	        	document.getElementById(errElementId).innerHTML = msg;
	        	flag = false;
	        } 
		}else{
			flag = false;
		}			
	}
	return flag;
}

// validation - applicant  
function chkNotNullApplicantName(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.name.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}
}
function chkValidApplicantHkId(element, errElementId, typeId){
	var type = "";
	if(typeId != ""){	//idType is id of control
		var e = document.getElementById(typeId);  
		var type = e.options[e.selectedIndex].text;
	}
	if(type == ""){
		type="HKID";
	}
	

	element.value = element.value.toUpperCase();
	
	if(isNull(element) && type == 'HKID'){
		var msg = getBundle(getBundleLanguage, "applicant.hkId.notNull.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!IsHKID(element.value) && type == 'HKID'){
		var msg = getBundle(getBundleLanguage, "applicant.hkId.notValid.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!chkTravelHKPassLen(element.value) && type == 'Passport'){
		var msg = getBundle(getBundleLanguage, "applicant.passport.notValidLength.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(isNull(element) && type == 'Passport'){
		var msg = getBundle(getBundleLanguage, "applicant.missingHkidOrPassport.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!chkTravelHKPass(element.value) && type == 'Passport'){
		var msg = getBundle(getBundleLanguage, "applicant.passport.notEnglish.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}		
}
function chkValidApplicantMobileNo(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!mobile_pattern.test(element.value)){
		var msg = getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}	
}
function chkValidApplicantEmail(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.email.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!emailreg.test(element.value)){
		var msg = getBundle(getBundleLanguage, "applicant.email.notValid.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}	
}
//validation - insured
function chkNotNullInsuredName(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "insured.name.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}
}
function chkValidInsuredHkId(element, errElementId, typeId){
	var type = "";
	if(typeId != ""){	//idType is id of control
		var e = document.getElementById(typeId);  
		var type = e.options[e.selectedIndex].text;
	}
	if(type == ""){
		type="HKID";
	}
	
	if(isNull(element)){	
		var msg = getBundle(getBundleLanguage, "insured.hkId.notNull.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(!IsHKID(element.value)){
		var msg = getBundle(getBundleLanguage, "insured.hkId.notValid.message");
		msg = String.format(msg, type);
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}
	else{
		resetErrElement(errElementId);
		return true;
	}
}
function chkNotNullBeneficiary(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "insured.beneficiary.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}	
}
//validation - beneficiary
function chkNotNullBeneficiaryName(element, errElementId, beneficiary){
	if(beneficiary != null){
		var selectedValue = beneficiary.value;
		if(selectedValue != "SE"){
			if(isNull(element)){
				var msg = getBundle(getBundleLanguage, "beneficiary.name.notNull.message");
				document.getElementById(errElementId).innerHTML = msg;
				return false;
			}else{
				resetErrElement(errElementId);
				return true;
			}			
		}else{
			resetErrElement(errElementId);
			return true;
		}
	}
}
function chkNotNullBeneficiaryHkId(element, errElementId, beneficiary){
	if(beneficiary != null){
		var selectedValue = beneficiary.value;
		if(selectedValue != "SE"){
			if(isNull(element)){
				var msg = getBundle(getBundleLanguage, "beneficiary.hkId.notNull.message");
				document.getElementById(errElementId).innerHTML = msg;
				return false;
			}else if(!IsHKID(element.value)){
				var msg = getBundle(getBundleLanguage, "beneficiary.hkId.notValid.message");
				document.getElementById(errElementId).innerHTML = msg;
				return false;
			}
			else{
				resetErrElement(errElementId);
				return true;
			}			
		}else{
			resetErrElement(errElementId);
			return true;
		}
		
	}
}
// validation - credit card
function chkValidCreditCard(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.creditcard.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else if(element.value.length<16){
		var msg = getBundle(getBundleLanguage, "applicant.creditcard.notValid.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}	
}
function chkValidCreditCardExpDate(element, errElementId, monthId, errMonthElementId){
	var month = 0;
	var year = 0;
	var now = new Date();
	var nowYear = now.getFullYear();
	var nowMonth = now.getMonth();
	if(monthId != ""){	//idType is id of control
		var e = document.getElementById(monthId);  
		month = e.options[e.selectedIndex].value;

		if(!IsNumeric(month)){
			var msg = getBundle(getBundleLanguage, "applicant.creditcard.month.notNull.message");
			document.getElementById(errMonthElementId).innerHTML = msg;
			return false;
		}else if (month < 1){
			var msg = getBundle(getBundleLanguage, "applicant.creditcard.month.notValid.message");
			document.getElementById(errMonthElementId).innerHTML = msg;
			return false;
		}else{
			resetErrElement(errMonthElementId);
			return true;
		}
			
		
	}
	
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.creditcard.year.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{	
		year = element.value;
		
		if(!IsNumeric(year)){
			var msg = getBundle(getBundleLanguage, "applicant.creditcard.year.notValid.message");
			document.getElementById(errElementId).innerHTML = msg;
			return false;
		} else {
			year = parseInt(year);
			nowYear = parseInt(nowYear);
			
			month = parseInt(month);
			nowMonth = parseInt(nowMonth);
			
			
			if(year < nowYear){	
				var msg = getBundle(getBundleLanguage, "applicant.creditcard.year.notValid.message");
				document.getElementById(errElementId).innerHTML = msg;
				return false;
				
			} else if(year <= nowYear && month <= nowMonth){
			
				var msg = getBundle(getBundleLanguage, "applicant.creditcard.month.notValid.message");
				document.getElementById(errMonthElementId).innerHTML = msg;
				
				var msg = getBundle(getBundleLanguage, "applicant.creditcard.year.notValid.message");
				document.getElementById(errElementId).innerHTML = msg;
				
				return false;
				
			} else{
				resetErrElement(errElementId);
				resetErrElement(errMonthElementId);
				
				return true;
			}			
		}
			
	}		
}
function chkNotNullCreditCareName(element, errElementId)
{
	// alert ( element.value.trim().indexOf(" ") );
	
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "applicant.creditcard.name.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}
	else if (element.value.length < 7 && element.value.trim().indexOf(" ") > 0) {
		var msg = getBundle(getBundleLanguage, "applicant.creditcard.noSpaces.message");
		document.getElementById(errElementId).innerHTML = msg;
	}
	else{
		resetErrElement(errElementId);
		return true;
	}
}
// validation - address
function chkNotNullCABuilding(element, errElementId){
	document.getElementById(errElementId).innerHTML = '';
	//COMMENT BY NAT - AS THE RULE NOW IS EITHER BUILDING / ESTATE NEED TO FILLED
	return true;
//	if(isNull(element)){
//		var msg = getBundle(getBundleLanguage, "applicant.address.correspondence.building.notNull.message");
//		document.getElementById(errElementId).innerHTML = msg;
//		return false;
//	}else{
//		resetErrElement(errElementId);
//		return true;
//	}	
}
function chkNotNullCAEstate(element, errElementId){
	document.getElementById(errElementId).innerHTML = '';
	//COMMENT BY NAT - AS THE RULE NOW IS EITHER BUILDING / ESTATE NEED TO FILLED
	return true;
//	if(isNull(element)){
//		var msg = getBundle(getBundleLanguage, "applicant.address.correspondence.estate.notNull.message");
//		document.getElementById(errElementId).innerHTML = msg;
//		return false;
//	}else{
//		resetErrElement(errElementId);
//		return true;
//	}	
}
function chkNotNullIABuilding(element, errElementId){
	document.getElementById(errElementId).innerHTML = '';
	//COMMENT BY NAT - AS THE RULE NOW IS EITHER BUILDING / ESTATE NEED TO FILLED
	return true;
//	if(isNull(element)){
//		var msg = getBundle(getBundleLanguage, "insured.address.building.notNull.message");
//		document.getElementById(errElementId).innerHTML = msg;
//		return false;
//	}else{
//		resetErrElement(errElementId);
//		return true
//	}	
}
function chkNotNullIAEstate(element, errElementId){
	document.getElementById(errElementId).innerHTML = '';
	//COMMENT BY NAT - AS THE RULE NOW IS EITHER BUILDING / ESTATE NEED TO FILLED
	return true;
//	if(isNull(element)){
//		var msg = getBundle(getBundleLanguage, "insured.address.estate.notNull.message");
//		document.getElementById(errElementId).innerHTML = msg;
//		return false;
//	}else{
//		resetErrElement(errElementId);
//		return true;
//	}	
}
function chkNotNullIANetFloorArea(element, errElementId){
	if(isNull(element)){
		var msg = getBundle(getBundleLanguage, "insured.address.netFloorArea.notNull.message");
		document.getElementById(errElementId).innerHTML = msg;
		return false;
	}else{
		resetErrElement(errElementId);
		return true;
	}		
}
function chkValidIAEffDate(element, errElementId, name){
	if(chkValidDate(element, errElementId, name)){
	    var EffDate = element.value;
	    var startdays = dateDiffInDaysfromNow(EffDate);
        if (startdays > 60) {
        	var msg = getBundle(getBundleLanguage, "insured.address.effectiveDate.notValid.message");
        	document.getElementById(errElementId).innerHTML = msg;
            return false;
        }else{
        	resetErrElement(errElementId);
        	return true;
        }
        
	}
}

// get resource bundle
function getBundle(lang, key) {
	var rtn; 
	loadBundles(lang, key, function(value){
		rtn = value;
	});
	return rtn;
}
function loadBundles(lang, key, fn) {
	//var u = window.location.origin+''+home+'/resources/bundle/';
   	$.i18n.properties({
        name: 'Messages',
        path: ''+home_url+'/resources/bundle/',
        mode: 'both',
        language: lang,
        cache: true,
        callback: function() {
        	fn($.i18n.prop(key)); //msg_welcome;	//$.i18n.prop("msg_welcome")      
        }
    });
}





///////////////

function isValidUsername(el){
	var plan_user = /^[a-zA-Z0-9!??@%&??)*\+,.\/;\[\\\]\^_`{|}~-]{6,50}$/;
	if (el.trim() == "") {
		return getBundle(getBundleLanguage, "user.username.notValid.message");
		
		valid = false;

	} else if (!plan_user.test(el)) {
		return getBundle(getBundleLanguage, "user.username.length.message");
	}
	else{
		return true;
	}
}
function isValidPassword(el){
	var passwordPattern = "[a-zA-Z0-9]{8,}";
	var passwordPattern2 = "[A-Z]";
	var specialChar = "\\W";
	var rg = new RegExp(passwordPattern);
	var rg2 = new RegExp(passwordPattern2);
	var spChar = new RegExp(specialChar);
	
	if (el.trim() == ""){
		message  = getBundle(getBundleLanguage, "user.password.notNull.message");
		return message;
	} else if(!(rg2.test(el) && rg.test(el))) { 
		message = getBundle(getBundleLanguage, "user.password.validate.message");
		return message;
	} else if(spChar.test(el)){
		message = getBundle(getBundleLanguage, "user.password.validate.message");
		return message;
	}
	else{
		return true;
	}
}
function passMatch(pass, confirm){
	if (confirm.trim() == "") {
		return getBundle(getBundleLanguage, "user.confirmPassword.empty.message");
	} else if (confirm !== pass) {
		return getBundle(getBundleLanguage, "user.confirmPassword.validate.message");
	}
	else{
		return true;
	}
}

function verifyUserBookingRegistration()
{
	var check = true;
	var userName = $('#Username').val();
	var password = $('#Password').val();
	var checkPassword = $('#Confirm-Password').val();
	if(userName.trim() === '' && password.trim() === '' && checkPassword.trim() === '')
	{
		$('#UsernameError').text('');
		$('#PasswordError').text('');
		$('#Confirm-PasswordError').text('');
	}
	else
	{
		if(isValidUsername(value) !== true){
			$('#UsernameError').text(isValidUsername(value));
			
			check = false;
		};
		if(isValidPassword(value) !== true){
			$('#PasswordError').text(isValidPassword(value));
			check = false;
		};
		if(passMatch(passwordToMatch, value) !== true){
			$('#Confirm-PasswordError').text(passMatch(passwordToMatch, value));
			check = false;
		};
	}
	return check;
}
function checkMembership(field){
	if (field == "Username"){
		value = $("#Username").val().trim();
		$("#Username").val(value);
		if(value == ''){
			$('#UsernameError').text('');
		}
		else if(isValidUsername(value) !== true){
			$('#UsernameError').text(isValidUsername(value));
		}else
			$('#UsernameError').text('');
	}else if (field == "Password"){
		value = $("#Password").val().trim();
		$("#Password").val(value);
		if(value == ''){
			$('#PasswordError').text('');
		}
		else if(isValidPassword(value) !== true){
			$('#PasswordError').text(isValidPassword(value));
		}else $('#PasswordError').text('');
	}else if (field == "Confirm-Password"){
		var passwordToMatch = $('#Password').val();
		value = $("#Confirm-Password").val().trim();
		$("#Confirm-Password").val(value);
		if(value == ''){
			$('#Confirm-PasswordError').text('');
		}
		else if(passMatch(passwordToMatch, value) !== true){
			$('#Confirm-PasswordError').text(passMatch(passwordToMatch, value));
		} else $('#Confirm-PasswordError').text('');
	}
}
$(function () {
if($('#Username').length){
	$cur = $('#Username');
	$cur.on('blur', function(){
		checkMembership("Username");
	})
}
if($('#Password').length){
	$cur = $('#Password');
	$cur.on('blur', function(){
		checkMembership("Password");
	})
}
if($('#Confirm-Password').length && $('#Password').length){
	$cur = $('#Confirm-Password');
	$cur.on('blur', function(){
		checkMembership("Confirm-Password");
		
	})
}
});


function isMobileNo(val){
	if(val == ''){
		return getBundle(getBundleLanguage, "applicant.mobileNo.notNull.message");
	}
	else if(!mobile_pattern.test(val)){
		return getBundle(getBundleLanguage, "applicant.mobileNo.notValid.message");
	}
	else{
		return true;
	}
}

function isEmail(val){
	if(val == ''){
		return getBundle(getBundleLanguage, "applicant.email.notNull.message");
	}
	else if(!emailreg.test(val)){
		return getBundle(getBundleLanguage, "applicant.email.notValid.message");
	}
	else{
		return true;
	}
}


//Join Us Page
//Full Name
if($('#txtFullName').length){
	$('#txtFullName').on('blur', function(){
		if($(this).val() == ''){
			$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.empty.message"));
		}
		else{
			$('#errorEmptyName').text('');
		}
	})
}
//Mobile
if($('#txtMobileNo').length){
	$('#txtMobileNo').on('blur', function(){
		var value = $(this).val();
		if(isMobileNo(value) != true){
			$('#errorEmptyMob').text(isMobileNo(value));
		}
		else{
			$('#errorEmptyMob').text('');
		}
	})
}
//Email
if($('#txtEmailId').length){
	$('#txtEmailId').on('blur', function(){
		var value = $(this).val();
		if(isEmail(value) != true){
			$('#errorEmptyEmailId').text(isEmail(value));
		}
		else{
			$('#errorEmptyEmailId').text('');
		}
	})
}
//Username
if($('#txtUserName1').length){
	$cur = $('#txtUserName1');
	$cur.on('blur', function(){
		value = $(this).val();
		if(isValidUsername(value) !== true){
			$('#errorEmptyUName').text(isValidUsername(value));
		}else
			$('#errorEmptyUName').text('');
	})
}

//Password
if($('#txtPass1').length){
	$cur = $('#txtPass1');
	$cur.on('blur', function(){
		value = $(this).val();
		if(isValidPassword(value) !== true){
			$('#errorJoinUsPassword').text(isValidPassword(value));
		}else $('#errorJoinUsPassword').text('');
	})
}

//Confirm Password
if($('#txtConfPass').length && $('#txtPass1').length){
	$cur = $('#txtConfPass');
	
	$cur.on('blur', function(){
		var passwordToMatch = $('#txtPass1').val();
		value = $(this).val();	
		if(passMatch(passwordToMatch, value) !== true){
			$('#errorEmptyConfPass').text(passMatch(passwordToMatch, value));
		} else $('#errorEmptyConfPass').text('');
	})
}

function activateUserAccount(){
	var check = true;
	var name = $('#txtFullName').val();
	var mobile = $('#txtMobileNo').val();
	var email = $('#txtEmailId').val();
	var userName = $('#txtUserName1').val();
	var password = $('#txtPass1').val();
	var checkPassword = $('#txtConfPass').val();
	var declaration = $('#checkbox1').is(':checked');

	
	
	
	if(name == ''){
		$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.empty.message"));
		check = false;
	} else {
		if(name == password){
			$('#errorEmptyName').text(getBundle(getBundleLanguage, "membership.fullName.equal.password.message"));
			check = false;
		}
	}
	
	var mobileValidateResult = isMobileNo(mobile);
	
	if(mobileValidateResult != true){
		$('#errorEmptyMobJoinUs').text(mobileValidateResult);
		check = false;
	}
	if(isEmail(email) !== true){
		$('#errorEmptyEmailIdJoinUs').text(isEmail(email));
		check = false;
	}
	if(isValidUsername(userName) !== true){
		$('#errorEmptyUNameJoinUs').text(isValidUsername(userName));
		check = false;
	};
	
	if(isValidPassword(password) !== true){
		$('#errorJoinUsPassword').text(isValidPassword(password));
		check = false;
	};
	if(passMatch(password, checkPassword) !== true){
		$('#errorEmptyConfPass').text(passMatch(password, checkPassword));
		check = false;
	};
	
	
	
	
	if(!declaration){
		$('#errorDeclaration').text(getBundle(getBundleLanguage, "membership.declaration.notChecked.message"));
		
		check = false;
	}
	return check;
}


//forbade to input special character
function hkidValid(ths){
	childObj = $(ths);
	inputId =$(ths).attr('id');
	parentObj = $(ths).parent();
	preObj = parentObj.prev();
	childrenObj = preObj.children();
	grandson = childrenObj.children();
	selectId = grandson.attr('id');
	
	var inputVal = $('#'+inputId).val();
	var selectHkPass = document.getElementById(selectId).value;
	if(selectHkPass == 'HKID' || selectHkPass == 'appHkid'){
		inputVal = inputVal.replace(/[\W]/g,'');
		$('#'+inputId).val(inputVal);
	}
}


// ***** homecare *****

// 1. save credit card info by calling processHomeCarePayment
// 2. post to payment gatway when step 1 success 



$(function () {
	
	
	
	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	var tillDate_from_home= new Date((new Date()).getTime() + 59*24*60*60*1000);
	
	//Homecare Calender
	var checkin = $('#homecareDp').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= now.valueOf() && date.valueOf() < tillDate_from_home;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy"
	}).on('changeDate', function (ev) {
		$('#errEffDate').html('');
	});
	
});
