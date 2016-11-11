var chin = $('body').hasClass('chin'),
enErr = {
417: 'Your vehicle type is not eligible for an instant quote.',
414: 'Your vehicle type is not eligible for an instant quote.',
410: 'Your vehicle is aged over 13 years.',
406: 'Your occupation is not eligible for an instant quote.',
415: 'Your No Claim Discount is not eligible for an instant quote.',
408: 'Your age is not between 25 and 70 years old.',
409: 'Your driving experience is not eligible for an instant quote.',
400: 'Quotation information is invalid.',
500: 'System service is currently unavailable.',
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
		400: '報價資料不正確。',
		500: '系統現時未能提供服務。',
		412: '您輸入的座駕估計市值超出最高上限。',
		413: '您輸入的座駕估計市值低於最低下限。',
		416: '您的汽車未能符合即時報價的要求。'
};
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
$(document).ready(function(){
	
	/*isobar*/
	$mortgageBank = $('#mortgageBank').selectize({
        valueField: 'code',
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
                    	console.dir(res);
                        callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });

	$motor_district = $('#district').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#district-selectized').data('required-error', $('#district').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/districts',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	//console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	
	$motor_occupation = $('#occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#occupation-selectized').data('required-error', $('#occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	$motor_d2occupation = $('#d2occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d2occupation-selectized').data('required-error', $('#d2occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	$motor_d3occupation = $('#d3occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d3occupation-selectized').data('required-error', $('#d3occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	$motor_d4occupation = $('#motor_d4occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#motor_d4occupation-selectized').data('required-error', $('#motor_d4occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	$motor_d5occupation = $('#d5occupation').selectize({
        valueField: 'code',
        labelField: 'desc',
        searchField: 'desc',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#d5occupation-selectized').data('required-error', $('#d5occupation').data('required-error'));
            $.ajax({
                url: context + '/api/iMotor/list/occupations/v2',
                type: 'GET',
                dataType: 'json',
                error: function() {
                        callback();
                    },
                    success: function(res) {
                    	console.dir(res);
                    	var total = res.length;
                    	$.each(res, function(i, item) {
                    		if(item.lang!="EN")                    		
                    		{delete res[i];total--;}
                    	});
                    	res.length = total;
                              callback(res);                        
                    }
            });
        },
        onChange: function(value){
        }
    });
	
    var $custom_checkbox = $('.custom-checkbox .checkbox').not('.disabled');
    var $custom_radio = $('.custom-radio .radio');
    /*custom checkbox*/
    $custom_checkbox.on('click', function() {
        var $this = $(this).find('[type="checkbox"]');
        if($this.is(':checked')){
            $this.prop('checked', false);
            $this.val('false');
            if($('.custom-checkbox').find(':input[required]:checked').length < $('.custom-checkbox').length){
                $(this).parents('form').validator('validate');
            }
        }
        else{
            $this.prop('checked', true);
            $this.val('true');
            
			if($('.custom-checkbox').find(':input[required]:checked').length == $('.custom-checkbox:visible').length){
            $(this).parents('form').validator('validate');
			}
			if(!$('.has-error').length){
            }
        }
    });
    $custom_radio.on('click', function() {
        var $this = $(this).find('[type="radio"]');
        $this.prop('checked', true);
        $this.parent().addClass('active').siblings().removeClass('active');
        if($('[value="yes"]:checked').length == 3){
			$("#reasonMsg").text("choice 3");
            $("#contactpopup").modal('show');
        }
			if($('.has-error').length)
                $(this).parents('form').validator('validate');
        
    });
	
	var jsonData, contactJson;
    $.getJSON( "./api/iMotor/QuoteMotorCare.json", function( data ) { //get json
	
    var jsonData;
	 });
    $.getJSON( "./api/iMotor/ContactMe.json", function( data ) { //get json
        contactJson = data;
    });
    if($('#saveForm').length){
		$('#saveForm').click(function( event ) {
			event.preventDefault();
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
		});
    }
    
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
});
