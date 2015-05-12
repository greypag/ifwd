$(function () {
	var wh_nowTemp = new Date();
	var wh_now = new Date(wh_nowTemp.getFullYear(), wh_nowTemp.getMonth(), wh_nowTemp.getDate(), 0, 0, 0, 0);
	var wh_tillDate_from = new Date((new Date()).getTime() + 29*24*60*60*1000);
	var wh_tillDate_back = wh_nowTemp.setFullYear(wh_nowTemp.getFullYear() + 1);
	var wh_duration = $('#frmTravelGetQuote').length > 0 ? 180*24*60*60*1000 :30*24*60*60*1000;
	var checkout;
	
	var checkin = $('#whDp1').datepicker({
		beforeShowDay: function (date) {
			return date.valueOf() >= wh_now.valueOf() && date.valueOf() < wh_tillDate_from;
		},
		autoclose: true,
		todayHighlight: true,
		format: "dd MM yyyy",


	}).on('changeDate', function (ev) {
			var newDate = new Date(ev.date);
			newDate.setDate(newDate.getDate());
			newDate.setFullYear(newDate.getFullYear() + 1);
			if (ev.date.valueOf() > checkout.datepicker("getDate").valueOf() || !checkout.datepicker("getDate").valueOf()) {
				checkout.datepicker("update", newDate);
			}
			$('#whDp2')[0].focus();
			var startDate = new Date($('#whDp1').datepicker("getDate").valueOf());
			var endDate = new Date($('#whDp2').datepicker("getDate").valueOf());
			var path = window.location.href;
			
			var end;
			if(path.indexOf('workingholiday-insurance/user-details')>0){
				end = path.indexOf('workingholiday-insurance/user-details');
			}
			var fullPath = "";				
			if(end>0){
				fullPath = path.substring(0, end) + "flight-insurance/quote";	
				$.ajax({
					  type: "POST",
					  url: fullPath,
					  data: { 'departureDate': dateFormate(startDate),
						  	  'returnDate': dateFormate(endDate),
						  	  'totalAdultTraveller':'',
						  	  'totalChildTraveller':'',					  	  
						  	  'days':'',
						  	  'travellerCount':'',
						  	  'ToalDue':'1',
						  	  'planSelected':''					  	 
					  },					  				  							  
					  success: function(){
						  
					  }
				
				});
				
				
				var selectedPlanName = $("input[name='selectedPlanName']").val();
				
				fullPath = path.substring(0, end) + "applyWHQuote";	
				$.ajax({
					  type: "POST",
					  url: fullPath,
					  data: { 'trLeavingDate': dateFormate(startDate),
						  	  'trBackDate': dateFormate(endDate),
						  	  'referralCode':'',
						  	  'selectedPlanName': selectedPlanName
					  },					  				  							  
					  success: function(data){
						  alert(data)
					  }
				
				});
			}else{
				end = path.indexOf('travel-insurance')
				fullPath = path.substring(0, end) + "travel-insurance/quote";	
				
				
				$.ajax({
					  type: "POST",
					  url: fullPath,
					  data: { 'trLeavingDate': dateFormate(startDate),
						  	  'trBackDate': dateFormate(endDate),
						  	  'totalAdultTraveller':'',
						  	  'totalChildTraveller':'',					  	  
						  	  'days':'',
						  	  'travellerCount':'',
						  	  'ToalDue':'1',
						  	  'planSelected':''					  	 
					  },					  				  							  
					  success: function(){					 					 
					  }
				
				});
			}
	});
	var checkDate;
	checkout = $('#whDp2').datepicker({
		beforeShowDay: function (date) {
			if (!checkin.datepicker("getDate").valueOf()) {
				return date.valueOf() >= new Date().valueOf() && date.valueOf() < wh_tillDate_back - 24*60*60*1000;
			} else {
				checkDate=checkin.datepicker("getDate");
				return date.valueOf() >= checkin.datepicker("getDate").valueOf() && date.valueOf() < checkDate.setFullYear(checkDate.getFullYear() + 1).valueOf();
			}
		},
		autoclose: true,
		
		format: "dd MM yyyy"

	}).on('changeDate', function (ev) {
		var startDate = new Date($('#whDp1').datepicker("getDate").valueOf());
		var endDate = new Date($('#whwhDp2').datepicker("getDate").valueOf());
		var path = window.location.href;		
		var end = path.indexOf('flight-insurance');
		var fullPath = "";				
		
		if(end>0){
			fullPath = path.substring(0, end) + "flight-insurance/quote";	
			$.ajax({
				  type: "POST",
				  url: fullPath,
				  data: { 'departureDate': dateFormate(startDate),
					  	  'returnDate': dateFormate(endDate),
					  	  'totalAdultTraveller':'',
					  	  'totalChildTraveller':'',					  	  
					  	  'days':'',
					  	  'travellerCount':'',
					  	  'ToalDue':'1',
					  	  'planSelected':''					  	 
				  },					  				  							  
				  success: function(){					 					 
				  }
			
			});
			
		}
		else{
			end = path.indexOf('travel-insurance')
			fullPath = path.substring(0, end) + "travel-insurance/quote";	
			
			$.ajax({
				  type: "POST",
				  url: fullPath,
				  data: { 'trLeavingDate': dateFormate(startDate),
					  	  'trBackDate': dateFormate(endDate),
					  	  'totalAdultTraveller':'',
					  	  'totalChildTraveller':'',					  	  
					  	  'days':'',
					  	  'travellerCount':'',
					  	  'ToalDue':'1',
					  	  'planSelected':''					  	 
				  },					  				  							  
				  success: function(){					 					 
				  }
			
			});
		}
	});
});

function dateFormate(thisDate) {
	var monthNames = [ "January", "February", "March", "April", "May", "June",
			"July", "August", "September", "October", "November", "December" ];

	var date = new Date(thisDate);
	var day = date.getDate();
	if (day < 10) {
		day = '0' + day;
	}

	var monthIndex = date.getMonth();
	var year = date.getFullYear();
	var formateDate = day + " " + monthNames[monthIndex] + " " + year;
	return formateDate;
}
