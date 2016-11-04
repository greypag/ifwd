/*
 * Motor API Endpoint
 */
var motorApi = {
    'policy'                : Site.context + '/api/iMotor/policy',
    'policyCarDetails'     : Site.context + '/api/iMotor/policy/carDetails',
    'policyConfirmation'   : Site.context + '/api/iMotor/policy/confirmation',
    'policyDeclarations'   : Site.context + '/api/iMotor/policy/declarations',
    'policyDetails'        : Site.context + '/api/iMotor/policy/details',
    'policyDriverDetails'  : Site.context + '/api/iMotor/policy/driverDetails',
    'policyFileUpload'     : Site.context + '/api/iMotor/policy/fileUpload',
    'quote'                 : Site.context + '/api/iMotor/quote',
    'quoteSaving'          : Site.context + '/api/iMotor/quote/saving',
    'saveForLater'          : Site.context + '/api/iMotor/saveForLater',
    'contactMe'             : Site.context + '/api/iMotor/contactMe',
}

/*
 * Store the Quoted Price response
 */
var motorPrice = {
    'silver': {},
    'gold': {},
    'third': {}
}

/*
 * Get Motor Quote Price by Plan Type
 */
function getMotorQuotePrice(planType, quote){
    //console.log('calling ... ' + planType);
    var deferredReady = $.Deferred();

    var _compPlan = '';
    var _planCode = '';
    switch(planType){
        case 'silver': 
            _compPlan = 'Silver';
            _planCode = 'Comp';
            break;
        case 'gold':
            _compPlan = 'Gold';
            _planCode = 'Comp';
            break;
        case 'third':
            _compPlan = null;
            _planCode = 'Third';
            break;
        default: break;
    }
    $.ajax({
        url: motorApi.quote,
        contentType: "application/json",        
        type: 'POST',
        dataType: "json",
        async: true,
        cache: false,
        data: JSON.stringify({
           "applicant": {
	        	"ncb": quote.applicant.ncb,
	        	"occupation": quote.applicant.occupation,
                "driveMoreThanTwo": true,
                "validAgeGroup": true
            },
	        "carDetail": {
	        	 "estimatedValue": quote.carDetail.estimatedValue,
	             "makeCode": quote.carDetail.makeCode,
	             "engineCapacity": quote.carDetail.engineCapacity,
	             "model": quote.carDetail.model,
	             "yearOfManufacture": quote.carDetail.yearOfManufacture                        
	        },  
            "planCode": _planCode,
            "compPlan": _compPlan,
            "personalAccident": quote.personalAccident,
            "thirdPartyPropertyDamage": quote.thirdPartyPropertyDamage
        }),
        error: function() {
            motorPrice[planType]['valid'] = false;
            deferredReady.resolve();
        },
        success: function(data) {
            motorPrice[planType] = data;
            motorPrice[planType]['valid'] = true;
            deferredReady.resolve();
        }
    });

    return deferredReady.promise();
}

function redirectQuotePage(url, quoteData){
	var $form = $("<form />");
    $form.attr("action", url);
    $form.attr("method", "post");
    var $quote = $("<input type='hidden' name='data' />");
    $quote.attr("value", JSON.stringify(quoteData));
    $form.append($quote);
    $("body").append($form);
    $form.submit();
}
