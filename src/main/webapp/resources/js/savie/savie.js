var items = [[],[],[],[]];
var guaranteed3Years;
var contextPath = window.location.pathname.split("/")[1];
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
	
	// 70 year ago date
	var dob_start_date = new Date();
	dob_start_date.setFullYear(dob_start_date.getFullYear()-70);
	dob_start_date.setDate(dob_start_date.getDate()+1);
	
	$('#birthdayDiv').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: "dd-mm-yyyy",
		startDate: dob_start_date,
		endDate: effective_end_date

	}).on('changeDate', function (ev) {
		$(".hidden-sm .form-container .topten").html($('#birthday').val())
		//setAtt("birthday", $('#birthday').val())
		$('#birthdayMsg').html('');
	});
	getSaviePlanDetails();
});


function getSaviePlanDetails() {
	var amount = $('#R').val();
	var promocode = $('#promocode').val();
	var birthOfDay = $('#birthOfDay').val();
	
	
	var planCode = "savie";
	var issueAge = jsGetAge(birthOfDay);
	var paymentTerm = 100-issueAge+1;
	var premium = amount;
	var referralCode = promocode;
	
	if(issueAge == null || issueAge < 18 || issueAge > 100){
		//alert("Invalid date of birth!");
		$('#promo-code-dateOfBirth').removeClass('hidden');
	}
	else if(premium ==null || premium <30000 || premium > 400000){
		alert("Invalid Savings amount!");
	}
	else{
		$('#promo-code-dateOfBirth').addClass('hidden');
		$.get('/'+contextPath+'/ajax/savie/planDetails/get',
		{ 
			planCode : planCode,
			issueAge: issueAge,
			paymentTerm: paymentTerm,
			premium: premium,
			referralCode: referralCode
		},
		function(data) {
			var json = $.parseJSON(JSON.stringify(data));
			
			$total_years = json.salesIllustration.yearPlans.length;
			if ($total_years > 45) { // get only up to 45 years of data
				$total_years = 45;
			}
			
			items = [[],[],[],[]]; // revert items
			
			for(var i = 0; i < $total_years; i++) {
				if (json.salesIllustration.yearPlans[i].year < 100) { // do not include year 100 data from their response
					for(var j = 0; j < 4; j++){
						if((json.salesIllustration.yearPlans[i].plans[j].rate == "zero") && (json.salesIllustration.yearPlans[i].year == 3)){
								 guaranteed3Years = json.salesIllustration.yearPlans[i].plans[j].accountBalance;
						}
						if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
							var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							items[3][i] = rateIsZero;
							
							if (i == 0 || i == 1 || i == 2) {
								var rowCtr = i+1;
								$('#premium-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].totalPremium).toLocaleString('en'));
								$('#account-value-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].accountBalance).toLocaleString('en'));
								$('#surrender-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit).toLocaleString('en'));
							}
						}
						if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){						
							var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							items[2][i] = rateIsZero;
						}
						if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
							var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							items[1][i] = rateIsZero;
						}
						if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
							var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							items[0][i] = rateIsZero;
						}
					}
				}
			}
			
			// fill in data for users with less than 45 years
			for(var j = 0; j < 4; j++){
				var totalRateItems = items[j].length;
				if (totalRateItems < 45) {
					for(var x = totalRateItems; x < 45; x++) {
						items[j][x] = items[j][totalRateItems - 1];
					}
				}
			}
			
			isCurrentDefault = false;
			zoomCtr = 4;
			currentRate = 3;
			showFWDChart(currentRate, zoomCtr, isCurrentDefault);
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

function getguaranteed3Years(){
	if(typeof guaranteed3Years == "undefined"){
		return '145000';
	}else{
		return guaranteed3Years;
	}
}

function createPdf() {
	//var amount = $('#R').val();
	
	var chineseName = "劉德華";
	var gender = "男";
	var dateTime = "11/12/1986";
	var singlePremiumAmount = "100,000";
	var age = "15";
	var paymentMethod = "港幣";
	var Premium = "1,000";
	var paymentType = " - "
	
	$.get('/'+contextPath+'/ajax/savie/sales-illustration/createPdf',
	{ 
		chineseName : chineseName,
		gender : gender,
		dateTime : dateTime,
		singlePremiumAmount : singlePremiumAmount,
		age : age,
		paymentMethod : paymentMethod,
		Premium : Premium,
		paymentType : paymentType
	},
	function(data) {
		if(data.pdfName){
			window.open('/'+contextPath+'/tc/savings-insurance/pdf-show?pdfName='+data.pdfName);
		}
		else{
			alert("data error");
		}
	})
	.fail(function(data) {
	});
}

function acceptPdf(pdfName) {
	$.get('/'+contextPath+'/ajax/savie/sales-illustration/uploadPdf',
	{ 
		pdfName : pdfName
	},
	function(data) {
		if(data.Msgs=="success"){
			if(confirm("You accept the PDF has been uploaded to the server, the current page is about to shut down!")){  
				self.opener=null;  
				self.open('','_self');  
				self.close();  
			}  
		}
		else{
			alert(data.Msgs);
		}
	})
	.fail(function(data) {
	});
}
