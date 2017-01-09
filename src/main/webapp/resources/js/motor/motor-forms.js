var chin = $('body').hasClass('chin'),
enErr = {
417: 'Your vehicle type is not eligible for an instant quote.',
414: 'Your vehicle type is not eligible for an instant quote.',
410: 'Your vehicle is aged over 13 years.',
406: 'Your occupation is not eligible for an instant quote.',
415: 'Your No Claim Discount is not eligible for an instant quote.',
408: 'Your age is not between 25 and 70 years old.',
409: 'Your driving experience is not eligible for an instant quote.',
422: 'Quotation information is invalid.',
504: 'System service is currently unavailable.',
412: 'The estimated value of your car exceeds the maximum value allowed.',
413: 'The estimated value of your car is below the minimum value allowed.',
416: 'Your vehicle is not eligible for an instant quote.'
},
cnErr ={
		417: '您的汽車類型未能合乎即時報價的要求。',   
		414: '您的汽車類型未能合乎即時報價的要求。',      
		410: '您的汽車車齡超過13年。',                          
		406: '您的職業未能合乎即時報價的要求。',        
		415: '您的無索償折扣未能合乎即時報價的要求。', 
		408: '您的年齡並非界乎25至70歲。',                 
		409: '您的駕駛年資未能合乎即時報價的要求。',
		422: '報價資料不正確。',
		504: '系統現時未能提供服務。',
		412: '您輸入的座駕估計市值超出最高上限。',
		413: '您輸入的座駕估計市值低於最低下限。',
		416: '您的汽車未能符合即時報價的要求。'
};
var APIServer = "";
var fwdApi = {
		url:{
			session						: APIServer + context + "/api/member/session",
			login						: APIServer + context + "/api/member/login",
			member						: APIServer + context + "/api/member",
			forgotPassword				: APIServer + context + "/api/member/forgotPassword",
			retrieveUserName			: APIServer + context + "/api/member/retrieveUserName",
			resume						: APIServer + context + "/api/iMotor/policy/save4Later/resume",
		}
};
var $mortgageBank ;
var motor_mortgageBank, $motor_mortgageBank, 
motor_district , $motor_district, 
motor_occupation, $motor_occupation, 
motor_d2occupation , $motor_d2occupation,
motor_d3occupation , $motor_d3occupation,
motor_d4occupation , $motor_d4occupation,
motor_d5occupation , $motor_d5occupation;

function system_error_message(code, policyID)
{
	switch(code)
	{
		case "-11111111":
			return "System cannot find the policy";
		case "-22222222":
			return "Invalid Details";	
		case "-33333333":
			return "Invalid Car Band";	
		case "-99999999":
			return policyID;
		default:
			return "System error";
				
		
	}
}
var motorlanguage=UILANGUAGE;
if(motorlanguage == "TC")
	motorlanguage = "ZH";
$(document).ready(function(){
	
	var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
	
	/*isobar*/
	
	$mortgageBank = $('#mortgageBank').selectize({
        valueField: 'desc',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
        	
            $('#mortgageBank-selectized').data('required-error', $('#mortgageBank').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/bankMortgages',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
						
                        callback(res); 
						var match =false;
						$.each(res, function(i, item) {
							if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
							{	
								if(item.code == quote.carDetail.bankMortgageName)
								{	match=true;
									
									$(".switch-light").removeClass("orange");
									//$('[name="bankMortgage"]').bootstrapSwitch('setState',true);
									$('[name="bankMortgage"]').bootstrapSwitch('state',true);
									$("[name=bankMortgage]").prop("checked",true);
									$(".sly").addClass("orange");
									$("#bankNameHandle,.mortgageBank").removeClass("hidden");
									$('#mortgageBank').prop('required',true);
									//$('#mortgageBank').find('input').prop('required',true);
									$('#mortgageBank').find('.selectize-input > input').prop('required',false);
									//$mortgageBankSelect[0].selectize.clear();
								
									$mortgageBank[0].selectize.setValue(item.code);
									
								}
							}
						});
								
								if(match == false &&  quote.carDetail.bankMortgageName != "" && typeof quote.carDetail.bankMortgageName != "undefined" && (getUrlParameter("edit")=="yes"  || getUrlParameter("back")=="yes" ))
								{		
										$(".switch-light").removeClass("orange");
										//$('[name="bankMortgage"]').bootstrapSwitch('setState',true);
										$('[name="bankMortgage"]').bootstrapSwitch('state',true);
										$("[name=bankMortgage]").prop("checked",true);
										$(".sly").addClass("orange");
										$("#bankNameHandle,.mortgageBank").removeClass("hidden");
										$('#mortgageBank, #bankName').prop('required',true);
										//$('#mortgageBank').find('input').prop('required',true);
										$('#mortgageBank').find('.selectize-input > input').prop('required',false);
										//$mortgageBankSelect[0].selectize.clear();
										$mortgageBank[0].selectize.setValue("OTHER");
										$('#motor_registerForm').validator('update');
										$("input[name=bankName]").prop('required',false);
										$("#bankNameHandle").removeClass("hidden");
										$('#bankName').val(quote.carDetail.bankMortgageName);
								}	
							$('#motor_registerForm').validator('update');				
                    }
            });
        },
        onChange: function(value){
			$(".label-mortgageBank").removeClass("hidden");
			$(".label-mortgageBank").css({
				"font-size": "12px",
				"top": "52px",
				"left":"16px",
				"visibility": "visible",
				"z-index": "100"
				});
			$("#mortgageBank-selectized").prop('required',false);
			if(value=="OTHER")
			{	
				$("#bankNameHandle").removeClass("hidden");
				$("input[name=bankName]").prop('required',true);
				$('#mortgageBank').find('.selectize-input > input').prop('required',true);
				$('#motor_registerForm').validator('update');
			}else 
			{
				
				$("#bankNameHandle").addClass("hidden");
				$('#bankName').val("");
				$("input[name=bankName]").prop('required',false);
				$('#mortgageBank').find('.selectize-input > input').prop('required',false);
				$('#motor_registerForm').validator('update');
			}	
        }
    });
	/*
	$motor_area = $('#area').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#area-selectized').data('required-error', $('#area').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/areas',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                        callback(newres);
						if(quote.applicant.correspondenceAddress != null)
							$.each(newres, function(i, item) {
								if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes" )
								{
								
									if(item.code == quote.applicant.correspondenceAddress.hkKlNt)
									{	
										$motor_area[0].selectize.setValue(item.code);	
									}
								}
							});
                    }
            });
        },
        onChange: function(value){
        }
    });*/
	
	
	
	
	/*$motor_area = $('#area').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#area-selectized').data('required-error', $('#area').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/areas',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
						var newres= new Array();
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang==motorlanguage) 
                    		newres.push(res[i]);
                    	});
						console.dir(newres);
                        callback(newres);
						$.each(res, function(i, item) {
							if(getUrlParameter("edit")=="yes")
							{
								if(item.desc == quote.applicant.correspondenceAddress.hkKlNt)
								{
									$motor_area[0].selectize.setValue(item.code);	
								}
							}
						});
                    }
            });
        },
        onChange: function(value){
        }
    });*/
	
    var $custom_checkbox = $('.custom-checkbox .checkbox').not('.disabled');
    var $custom_radio = $('.custom-radio .radio');
    /*custom checkbox*/
    $custom_checkbox.on('click', function() {
		
			var $this = $(this).find('[type="checkbox"]');
			if($this.is(':checked')){
				$this.prop('checked', false);
				$this.val('false');
				if($('.custom-checkbox').find(':input[required]:checked').length < $('.custom-checkbox').length){
					//if(window.location.search.indexOf('policy-details')!= -1)
						//$(this).parents('form').validator('validate');
					$this.prop('checked', false);
					$this.trigger('input'); 
				}
			}
			else{
				$this.prop('checked', true);
				$this.val('true');
				//alert($('.custom-checkbox').find(':input[required]:checked').length + " | " + $('.custom-checkbox:visible').length);
				if($('.custom-checkbox').find(':input[required]:checked').length <= $('.custom-checkbox:visible').length){
					//if(window.location.search.indexOf('policy-details')!= -1)
						//$(this).parents('form').validator('validate');
					$this.prop('checked', true);
					$this.trigger('input'); 
				}
				if(!$('.has-error').length){
				}
			}
    });
    $custom_radio.on('click', function() {
        var $this = $(this).find('[type="radio"]');
        $this.prop('checked', true);
        $this.parent().addClass('active').siblings().removeClass('active');
        /*if($('[value="yes"]:checked').length == 3){
			$("#reasonMsg").text("choice 3");
            $("#contactpopup").modal('show');
        }*/
			if($('.has-error').length)
                $(this).parents('form').validator('validate');
        
    });
	
	//var jsonData, contactJson;
    //$.getJSON( "./api/iMotor/QuoteMotorCare.json", function( data ) { //get json
	
    //$.getJSON( "./api/iMotor/ContactMe.json", function( data ) { //get json
    //    contactJson = data;
    //});
    /*if($('#saveForm').length){
		$('#saveForm').click(function( event ) {
			event.preventDefault();

	    if($('[value="yes"]:checked').length){
            $("#reasonMsg").text("choice 3");
            $("#contactpopup").modal('show');
        }
		else
		{
			var
			personalAccident = $('[name="addon1"]').val(),
			thirdPartyPropertyDemage = $('[name="addon2"]').val();
			jsonData.personalAccident = personalAccident;
			jsonData.thirdPartyPropertyDemage = thirdPartyPropertyDemage;
			console.log(jsonData);
			$.ajax({
				type: "POST",
				url: "./api/iMotor/QuoteMotorCare.json",  //post to api
				data: jsonData,
				success: function(){
					console.log('success');   
				},
				dataType: "json",
				contentType : "application/json"
			});
		}
		});
    }*/
    
    /* Merge conflict - 20161124 - It seems there are more advanced handling in latest release
     if($('#contactform-pop').length){
        $('#contactform-pop').submit(function( event ) {
            event.preventDefault();
            var
            fullName = $(this).find('[name="fullName"]').val(),
            contactNum = $(this).find('[name="contactNum"]').val(),
            preferredContactTime = $(this).find('[name="preferredContactTime"]').val(),
            email = $(this).find('[name="email"]').val();
            contactJson.quoteMotorCare = jsonData;
            contactJson.contactNum = contactNum;
            contactJson.fullName = contactNum;
            contactJson.preferredContactTime = contactNum;
            contactJson.email = email;
            console.log(contactJson);
            $.ajax({
                type: "POST",
                url: "./api/iMotor/QuoteMotorCare.json",  //post to api
                data: jsonData,
                success: function(){
                    console.log('success');   
                },
                dataType: "json",
                contentType : "application/json"
            });
        });
    }
    */

    if($('#contactform-pop').length){
        $('#contactpopup').on('hidden.bs.modal', function () {
            $('#contactform-pop').removeClass('hidden');
            $('#successMessage').addClass('hidden');
        });
        
        $('#submitEnquiry').on('click', function( e ) { 
            e.preventDefault();
            $('#contactform-pop').validator('validate');
            if(!$('#contactform-pop .has-error').length){
                $.ajax({
                    url: context + '/api/iMotor/contactMe',
                    contentType: "application/json",
                    type: 'POST',
                    dataType: "json",
                    async: false,
                    cache: false,
                    data: JSON.stringify({
                            "refNum": $("#quote-num").val(),
                            "fullName": $("#fullName").val(), 
                            "contactNum": $("#contactNo").val(),
                    //      "contactNum": $('[name="contactNo"]').val(),
                            "email": $("#contactEmail").val(),
                            "preferredContactTime": $("#perferedDate").val(),
                            "from": "",
                            "reason": $("#reason").val(),
                            "motorCareDetails": jQuery.isEmptyObject(quote) ? submitData : quote
                            }),
                    error: function(xhr, textStatus, errorThrown) {
                        e.preventDefault();
                    },
                    success: function(data) {
                        window.location.hash = "callme=complete";
                        e.preventDefault();
                        window.location.hash = "callme=complete";
                        $('#contactform-pop').addClass('hidden');
                        //$('#successMessage').removeClass('hidden');
                    }
                });
            }
        });    
    };
});
