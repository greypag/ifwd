$(document).ready(function(){
    var $custom_checkbox = $('.custom-checkbox .checkbox').not('.disabled');
    var $custom_radio = $('.custom-radio .radio');
    /*custom checkbox*/
    $custom_checkbox.on('click', function() {
        var $this = $(this).find('[type="checkbox"]');
        if($this.is(':checked')){
            $this.prop('checked', false);
            $this.val('false');
            $(this).validator('validate');
        }
        else{
            $this.prop('checked', true);
            $this.val('true');
            $(this).validator('validate');
         //   if(!$('.has-error').length)
         //       $('[type="submit"]').removeClass('disabled');
        }
    });
    $custom_radio.on('click', function() {
        var $this = $(this).find('[type="radio"]');
        if($this.is(':checked')){
        }
        else{
            $this.prop('checked', true);
            $this.parent().addClass('active').siblings().removeClass('active');
        }
    });
    var jsonData;
    /*
    $.getJSON( "/fwdhk/api/iMotor/QuoteMotorCare", function( data ) { //get json
        //var items = [];
        //$.each( data, function( key, val ) {
        //   items.push( "<li id='" + key + "'>" + val + "</li>" );
        // });
        // console.log(data);
        jsonData = data;
        
        if($('.yourQuote').length){
        	$('#yourQuotePrice').html(jsonData.grossPremium);
        	$('#yourQuotefromPrice').html(jsonData.compInsuranceAmount);
        	$('#addOn1Amount').html(jsonData.addOnPaAmt);
        	$('#addOn2Amount').html(jsonData.addOnTppdAmt);
        	$('#yourQuotesubTotal').html(jsonData.subTotalAmount);
        	$('#yourQuoteDiscount').html(jsonData.discountAmount);
        }
        
    });
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
            url: "/fwdhk/api/iMotor/QuoteMotorCare.json",  //post to api
            data: jsonData,
            success: function(){
                console.log('success');   
            },
            dataType: "json",
            contentType : "application/json"
        });
    });
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
				//		"contactNum": $('[name="contactNo"]').val(),
						"email": $("#contactEmail").val(),
						"preferredContactTime": $("#perferedDate").val(),
						"from": "",
						"reason": $("#reason").val(),
						"quoteMotorCare": quote
						}),
				error: function(xhr, textStatus, errorThrown) {
					e.preventDefault();
				},
				success: function(data) {
					e.preventDefault();
					$('#contactform-pop').addClass('hidden');
					$('#successMessage').removeClass('hidden');
					}
				});
			  }
	  });
    	
    }
});
