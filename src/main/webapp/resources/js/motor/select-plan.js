$(document).ready(function(){
    var silver = {},
        gold = {},
        third ={};

    /**call api twice**/

    if($('.comp-plan').length){ 
        for(var i= 0; i<2; i++){
            if(i==0){
                $.getJSON( "./api/iMotor/QuoteMotorCare.json", function( data ) { //get json
                    $('#silverValue').html(data.amtFromThirdPartyToCompSilver); //print silver price
                    data.compPlan = "Silver";
					
                }).done(function(data){
                    silver = data;

                    $('#ownDamageExcess').html(silver.ownDamageExcess); //print silver price
                    $('#theftExcess').html(silver.theftExcess); //print silver price
                    $('#unnamedDriverExcess').html(silver.unnamedDriverExcess); //print silver price
                    $('#youngDriverExcess').html(silver.youngDriverExcess); //print silver price
                    $('#inexperiencedDriverExcess').html(silver.inexperiencedDriverExcess); //print silver price
                    $('#tPPDExcess').html(silver.tPPDExcess); //print silver price
                    $('#parkingExcess').html(silver.parkingExcess); //print silver price
                    
                    console.log(silver);
                }).fail(function( jqxhr, textStatus, error ) {
                    var err = textStatus + ", " + error;
                    console.log( "Request Failed: " + err );
                });
            }
            else{
                $.getJSON( "./api/iMotor/QuoteMotorCare.json", function( data ) { //get json
				$('#goldValue').html(data.amtFromThirdPartyToCompGold);//print gold price
                    data.compPlan = "Gold";
                }).done(function(data){
                    gold = data;

                    $('#g_ownDamageExcess').html(gold.ownDamageExcess); //print silver price
                    $('#g_theftExcess').html(gold.theftExcess); //print silver price
                    $('#g_unnamedDriverExcess').html(gold.unnamedDriverExcess); //print silver price
                    $('#g_youngDriverExcess').html(gold.youngDriverExcess); //print silver price
                    $('#g_inexperiencedDriverExcess').html(gold.inexperiencedDriverExcess); //print silver price
                    $('#g_tPPDExcess').html(gold.tPPDExcess); //print silver price
                    $('#g_parkingExcess').html(gold.parkingExcess); //print silver price
                    console.log(gold);
                }).fail(function( jqxhr, textStatus, error ) {
                    var err = textStatus + ", " + error;
                    console.log( "Request Failed: " + err );
                });
            }
        }
    }

	
		
	
    /*call api*/
    if($('.third-party').length){ 
        $.getJSON( "./api/iMotor/QuoteMotorCare.json", function( data ) { //get json
        }).done(function(data){
            third = data;
			$('#thirdPrice').html(data.amountDueAmount); //print third price
			$('#youngDriverExcess').html(data.youngDriverExcess); //print third price
			$('#inexperiencedDriverExcess').html(data.inexperiencedDriverExcess); //print third price
			$('#tPPDExcess').html(data.tPPDExcess); //print third price
			$('#parkingExcess').html(data.parkingExcess); //print third price
            console.log(third);
        }).fail(function( jqxhr, textStatus, error ) {
            var err = textStatus + ", " + error;
            console.log( "Request Failed: " + err );
        });
    }

/*
    $('#getGold').click(function( event ) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/iMotor/quote",  //post to api
            data: gold,
            success: function(){
                console.log(gold);   
            },
            dataType: "json",
            contentType : "application/json"
        });
        console.log(gold);   
    });
    $('#getSilver').click(function( event ) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/iMotor/quote",  //post to api
            data: gold,
            success: function(){
                console.log(silver);   
            },
            dataType: "json",
            contentType : "application/json"
        });
        console.log(silver);   
    });
    $('#thirdParty').click(function( event ) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "./api/iMotor/quote",  //post to api
            data: third,
            success: function(){
                console.log(third);   
            },
            dataType: "json",
            contentType : "application/json"
        });
        console.log(third);   
    });
*/
});
