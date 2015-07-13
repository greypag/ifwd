$(function () {
	var wh_nowTemp = new Date();
	var wh_now = new Date(wh_nowTemp.getFullYear(), wh_nowTemp.getMonth(), wh_nowTemp.getDate(), 0, 0, 0, 0);
	var wh_tillDate_from = new Date((new Date()).getTime() + 179*24*60*60*1000);
	var wh_tillDate_back = wh_nowTemp.setFullYear(wh_nowTemp.getFullYear() + 1);
	var wh_duration = $('#frmTravelGetQuote').length > 0 ? 180*24*60*60*1000 :30*24*60*60*1000;
	
	// today
	var effective_start_date = new Date();
	
	// 30 days date
	var effective_end_date = new Date();

	effective_end_date.setDate(effective_end_date.getDate()+89);

	
	$('#birthdayDiv').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: "dd-mm-yyyy",
		startDate: effective_start_date,
		endDate: effective_end_date

	}).on('changeDate', function (ev) {
		$(".hidden-sm .form-container .topten").html($('#birthday').val())
		//setAtt("birthday", $('#birthday').val())
		$('#birthdayMsg').html('');
	});
	
});


function getSavieIllustration() {
	var amount = $('#R').val();
	var promocode = $('#promocode').val();
	var birthOfDay = $('#birthOfDay').val();
	
	var hostPath = window.location.host;
	var contextPath = window.location.pathname.split("/")[1];
	
	var planCode = "savie";
	var issueAge = jsGetAge(birthOfDay);
	var paymentTerm = 100-issueAge+1;
	var premium = amount;
	var referralCode = promocode;
	
	if(issueAge ==null || issueAge<18 || issueAge > 100){
		alert("Invalid date of birth!");
	}
	else if(premium ==null || premium <30000 || premium > 400000){
		alert("Invalid Savings amount!");
	}
	else{
		$.get('http://'+hostPath+'/'+contextPath+'/ajax/savie/planDetails/get',
				{ 
			        planCode : planCode,
					issueAge: issueAge,
					paymentTerm: paymentTerm,
					premium: premium,
					referralCode: referralCode
				},
				function(data) {
					alert(JSON.stringify(data));
					console.log(JSON.stringify(data));
					var json = $.parseJSON(JSON.stringify(data));
					
					
					var concatRateIsZero,concatRateIsTwo,concatRateIsThree,concatRateIsFour;
					for(var i = 0; i < json.salesIllustration.yearPlans.length;i++) {
						for(var j =0; j < 4;j++){
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
								var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
								var rateIsTwo =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
								var rateIsThree =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
								var rateIsFour =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}	
						}
						
					}
				})
				.fail(function(data) {
				});
	}
}

function jsGetAge(strBirthday){ 
	var returnAge;
	var strBirthdayArr=strBirthday.split("/");
	var birthYear = strBirthdayArr[2];
	var birthMonth = strBirthdayArr[0];
	var birthDay = strBirthdayArr[1];
	
	d = new Date();
	var nowYear = d.getFullYear();
	var nowMonth = d.getMonth() + 1;
	var nowDay = d.getDate();
	
	if(nowYear == birthYear){
		returnAge = 0;
	}
	else{
		var ageDiff = nowYear - birthYear ; 
		if(ageDiff > 0){
			if(nowMonth == birthMonth){
				var dayDiff = nowDay - birthDay;
				if(dayDiff < 0)
				{returnAge = ageDiff - 1;}
				else
				{returnAge = ageDiff ;}
			}else{
				var monthDiff = nowMonth - birthMonth;
				if(monthDiff < 0)
				{returnAge = ageDiff - 1;}
				else
				{returnAge = ageDiff ;}
			}
		}
		else{returnAge = -1;
		}
	}
	return returnAge;
}
