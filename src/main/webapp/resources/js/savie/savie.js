var items = [[],[],[],[]];
var guaranteed3Years;
//var contextPath = window.location.pathname.split("/")[1];
var contextPath = '<%=request.getContextPath()%>';
var contextPath = context;
var jsonTableData;
var jsonTableData;
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
	$('#rate-0').removeClass('active');
	$('#rate-2').removeClass('active');
	$('#rate-3').addClass('active');
	$('#rate-4').removeClass('active');
	
	$('#rate-table-0').addClass('hidden');
	$('#rate-table-2').addClass('hidden');
	$('#rate-table-3').removeClass('hidden');
	$('#rate-table-4').addClass('hidden');
	
	var amount = $('#R').val();
	var promocode = $('#promocode').val();
	var birthOfDay = $('#sales-illu-dob').val();
	
	var planCode = "savie";
	var issueAge = jsGetAge(birthOfDay);
	var premium = amount;
	var referralCode = promocode;
	
	if(issueAge == null || issueAge < 18 || issueAge > 100){
		if($('#promo-code-dateOfBirth').hasClass('hideSpan')){
			$('#promo-code-dateOfBirth').removeClass('hideSpan');
		}
	}
	else if(premium ==null || premium <30000 || premium > 400000){
		console.log("Invalid Savings amount!");
	}
	else{
		$('#promo-code-dateOfBirth').addClass('hideSpan');
		$.get(contextPath+'/ajax/savie/planDetails/get',
		{ 
			planCode : planCode,
			issueAge: issueAge,
			premium: premium,
			referralCode: referralCode,
			birthOfDay:birthOfDay
		},
		function(data) {
			if(data.result == "success"){
				var json = $.parseJSON(JSON.stringify(data));
				jsonTableData = $.parseJSON(JSON.stringify(data));
				$total_years = json.salesIllustration.yearPlans.length;
				if ($total_years > 45) { // get only up to 45 years of data
					//$total_years = 45;
				}
				
				items = [[],[],[],[]]; // revert items
				
				for(var i = 0; i < $total_years; i++) {
					if (json.salesIllustration.yearPlans[i].year <= 100) { // do not include year 100 data from their response
						for(var j = 0; j < 4; j++){
							if((json.salesIllustration.yearPlans[i].plans[j].rate == "zero") && (json.salesIllustration.yearPlans[i].year == 3)){
									 guaranteed3Years = json.salesIllustration.yearPlans[i].plans[j].accountBalance;
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
								var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
								items[3][i] = rateIsZero;
								
																
								/*if (i == 0 || i == 1 || i == 2) {
									var rowCtr = i+1;
									$('#premium-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].totalPremium).toLocaleString('en'));
									$('#account-value-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].accountBalance).toLocaleString('en'));
									if(i == 2) {
										$("#3rd_policy_year").html(Number(json.salesIllustration.yearPlans[i].plans[j].accountBalance).toLocaleString('en'))
									}
									$('#surrender-'+rowCtr).html('<span>$</span> '+Number(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit).toLocaleString('en'));
								}*/
								
							}
							
							//rate 0
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
								if (i == 4) {
									$('#premium-change-0-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero"){
								if (i == 9) {
									$('#premium-change-0-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "zero" && json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-0-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-0-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-0-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
							}
							//rate 2
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
								if (i == 4) {
									$('#premium-change-2-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){
								if (i == 9) {
									$('#premium-change-2-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two" && json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-2-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-2-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-2-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
							}
							//rate 3
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
								if (i == 4) {
									$('#premium-change-3-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
								if (i == 9) {
									$('#premium-change-3-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three" && json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-3-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-3-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-3-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
							}
							//rate 4
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
								if (i == 4) {
									$('#premium-change-4-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-1').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
								if (i == 9) {
									$('#premium-change-4-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-2').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four" && json.salesIllustration.yearPlans[i].year == 100){
									$('#premium-change-4-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-4-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-4-3').html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
							}
							
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "two"){						
								var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
								items[2][i] = rateIsZero;
								
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "three"){
								var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
								items[1][i] = rateIsZero;
								
								if (i == 0 || i == 1 || i == 2) {
									var rowCtr = i+1;
									if(i == 2) {
										$("#3rd_policy_year").html(fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance))
									}
									
									$('#credit-rate-change-'+rowCtr).html(fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate))+"%");
									$('#premium-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
									
									console.log('Credit Rate:'+textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate));
									$('#credit-rate-'+rowCtr).html(fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate)));
									$('#premium-change-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-change-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-change-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
								
								
								
							}
							if(json.salesIllustration.yearPlans[i].plans[j].rate == "four"){
								var rateIsZero =  json.salesIllustration.yearPlans[i].plans[j].accountBalance;
								items[0][i] = rateIsZero;
								if(i==2){
									var rowCtr = 3;
									$('#credit-rate-change-'+rowCtr).html(fmoney(textToNumber(json.salesIllustration.yearPlans[i].plans[j].rate))+"%");
									$('#premium-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].totalPremium));
									$('#account-value-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].accountBalance));
									$('#surrender-'+rowCtr).html('<span>$</span> '+fmoney(json.salesIllustration.yearPlans[i].plans[j].guaranteedSurrenderBenefit));
								}
								
								

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
				//isCurrentDefault = false;
				//zoomCtr = 4;
				//currentRate = 3;
				//showFWDChart(currentRate, zoomCtr, isCurrentDefault);
				$('#promo-code-errmsg').addClass('hideSpan');
			}
			else{
				$('#promo-code-errmsg').removeClass('hideSpan');
				//data.errMsgs
				$('#promo-code-errmsg').html("Invalid promo code entered");
			}
		})
		.fail(function(data) {
		});
	}
}

function jsGetAge(strBirthday){ 
	var returnAge;
	var strBirthdayArr=strBirthday.split("-");
	var birthYear = strBirthdayArr[2];
	var birthMonth = strBirthdayArr[1];
	var birthDay = strBirthdayArr[0];
	
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
	
	$.get(contextPath+'/ajax/savie/sales-illustration/createPdf',
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
			window.open(contextPath+'/tc/savings-insurance/pdf-show?pdfName='+data.pdfName+'&requestNo='+data.Msgs.requestNo);
		}
		else{
		}
	})
	.fail(function(data) {
	});
}

function acceptPdf(pdfName,requestNo) {
	$.get(contextPath+'/ajax/savie/sales-illustration/uploadPdf',
	{ 
		pdfName : pdfName,
		requestNo : requestNo
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
			console.log(data.Msgs);
		}
	})
	.fail(function(data) {
	});
}

function getOccupation(value,language) {
	$.get(contextPath+'/ajax/savie/application/getOccupation',
	{ 
		value : value,
		language : language
	},
	function(data) {
		$("#savieEmploymentBeanOccupation").empty();
		if(data != null){
			for(var i = 0; i < data.length; i++) {
				$("#savieEmploymentBeanOccupation").append("<option value='"+data[i].itemCode+"-"+data[i].itemDesc+"'>"+data[i].itemDesc+"</option>");
			}
		}
	})
	.fail(function(data) {
		alert(data.length);
	});
}


function textToNumber(numbertxt){
	var num = 0;
	switch(numbertxt){
		case 'zero':
			num = 0;
			break;
		case 'two':
			num = 2;
			break;
		case 'three':
			num = 3;
			break;
		case 'four':
			num = 4;
			break;
	}
	return num;
}

function fmoney(s)   
{   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(0) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   t = "";   
   for(i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("");   
} 

