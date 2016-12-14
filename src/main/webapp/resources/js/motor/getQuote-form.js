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

var newMin = parseInt($('#madeYearVal').prop('max'))-20,
newMax = parseInt($('#madeYearVal').prop('max'))+1;
$('#madeYearVal').prop('min', newMin);
$('#madeYearVal').prop('max', newMax);

var quote;
var submitData;
var carMake, $carMake, occupation, $occupation, ncd, $ncd;
var car_details, $car_details;
var resume = false;
$(document).ready(function(){
    var $custom_dollarBox = $('.custom-dollar-box input[type="text"]');
    var $q1 = $('.get-quote-field').find('.q1');
    var $q2 = $('.get-quote-field').find('.q2');
    var $q3 = $('.get-quote-field').find('.q3');
    var $q4 = $('.get-quote-field').find('.q4');
    /*q1 logic*/
    $q1.find('select').change(function(){
        var empty_text = $q1.find("input[type='number']:visible").filter(function() {
            return this.value === "";
        });
        var empty_select = $q1.find("select").filter(function() {
            return this.value === "";
        });
        var error = $q1.find('.has-error').length;
        if(!empty_text.length && !empty_select.length && !error)
        	$q1.next().removeClass('hidden');
    });
    
    $q1.find('input[name="carYearOfManufacture"]').keyup(function(e){
        if($(this).val().length > 2){
            $q1.next().removeClass('hidden');
            occupation.open();
        }
    });
    $q2.find('input[name="carEstimatedValue"]').keyup(function(e){
        if($(this).val().length == 3){
            $q2.next().removeClass('hidden');
            $(".selectize-dropdown ").css({"width":"250px"});
            setTimeout(function(){
                occupation.open();
            },2000);
        }
    });
    $q1.find('input[type="number"]').keyup(function(e){
    	
    	if($(this).val() > parseInt($(this).prop('max'))){
        	console.log($(this).val());
        	$(this).val(parseInt($(this).prop('max')));
      	  $(this).blur().focus();
    	}

    	
        var empty_text = $q1.find("input[type='number']:visible").filter(function() {
            return this.value === "";
        });
        var empty_select = $q1.find("select").filter(function() {
            return this.value === "";
        });
        var error = $q1.find('.has-error').length;
        
     //   console.log(empty_text.length + ' | ' + empty_select.length + '|'  + error);  
        
        if(e.keyCode == 13)
        	$(this).parents('.form-group').next().find('input').focus();
        if(e.keyCode == 13 && !empty_text.length && !empty_select.length && !error){
        	$q1.next().removeClass('hidden').find('input').focus();
        }
    });
    $q1.find('input[type="number"]').blur(function(){
        var empty_text = $q1.find("input[type='number']:visible").filter(function() {
            return this.value === "";
        });
        var empty_select = $q1.find("select").filter(function() {
            return this.value === "";
        });
        var error = $q1.find('.has-error').length;
        $(this).parents('.form-group').next().find('input').focus();
        if(!empty_text.length && !empty_select.length && !error)
        	$q1.next().removeClass('hidden').find('input').focus();
    });
    /*q2 logic*/
    $q2.find('input[type="text"]').maskMoney({precision: 0});
    $q2.find('input[type="text"]').keyup(function(e){
    	var sel = $occupation[0],
    	selValue = sel.options[sel.selectedIndex].value,
    	num = $(this).maskMoney('unmasked')[0]*1000;
    	
    	if($(this).prop('required')){
    	if(num < 50000){
    		 $('.custom-dollar-box').addClass('has-error has-danger');
    		 var err = $(this).data('min-error');
    		 $(this).parents('.form-group').find('.help-block.with-errors').html('<ul class="list-unstyled"><li>' + err + '</li></ul>');
    	}
    	else{
    		$(this).parents('.form-group').find('.help-block.with-errors').empty();
    		$('.custom-dollar-box').removeClass('has-error has-danger');
    	}
    	}

    	 //   if (getUrlParameter('plan')=='third') {
    	 //   	$q2.next().removeClass('hidden');
    	 //   	if(selValue == "")
    	 //   	occupation.open();
    	 //   }
    	 //   else{
    //	var currency = (formatCurrency($q2.find('input[type="number"]').val()));
    	
   // 	$q2.find('input[type="number"]').val(currency);
  
    	        var empty_text = $q2.find('input[type="text"]').filter(function() {
    	            return this.value === "";
    	        });
    	        var error = $q2.find('.has-error').length;
    	        if(e.keyCode == 13 && !empty_text.length && !error){
    	        	$q2.next().removeClass('hidden');
    	        	if(selValue == "")
    	        	occupation.open();
    	        }
    	  //  }
    });
    $q2.find('input[type="text"]').blur(function(){
    	var sel = $occupation[0],
    	selValue = sel.options[sel.selectedIndex].value,
    	num = $(this).maskMoney('unmasked')[0]*1000;
    	
    	if($(this).prop('required')){
    	if(num < 50000){
    		 $('.custom-dollar-box').addClass('has-error has-danger');
    		 var err = $(this).data('min-error');
    		 $(this).parents('.form-group').find('.help-block.with-errors').html('<ul class="list-unstyled"><li>' + err + '</li></ul>');
    	}
    	else{
    		$(this).parents('.form-group').find('.help-block.with-errors').empty();
    		$('.custom-dollar-box').removeClass('has-error has-danger');
    	}
    	}
    	
        if (getUrlParameter('plan')=='third') {
        	$q2.next().removeClass('hidden');
        	if(selValue == "")
        	occupation.open();
        }
        
        else{
            var empty_text = $q2.find('input[type="text"]').filter(function() {
                return this.value === "";
            });
            var error = $q2.find('.has-error').length;
            if(!empty_text.length && !error){
            	$q2.next().removeClass('hidden');
            	if(selValue == "")
            	occupation.open();
            }
        }
        
    });
    /*q3 logic*/
    $q3.find('select').change(function(){
    	var sel = $ncd[0],
    	selValue = sel.options[sel.selectedIndex].value;
    	
        var empty_select = $q3.find("select").filter(function() {
            return this.value === "";
        });
        var error = $q3.find('.has-error').length;
        
        
        if(!empty_select.length && !error){
           	$q3.next().removeClass('hidden');
           	if(selValue == "")
           	ncd.open();
        }
      
    });
    /*q4 logic*/
    $q4.find('select').change(function(){
        var empty_select = $q4.find("select").filter(function() {
            return this.value === "";
        });
        var error = $q4.find('.has-error').length;
        if(!empty_select.length && !error) 
        	$q4.next().removeClass('hidden').find('input').focus(); 

    });
    $('[data-toggle="tooltip"]').tooltip();
    
    var carMakeApi;
    
    var xhr;

    if($('.get-quote-form').length){
       $carMake = $('#carMake').selectize({
            valueField: 'makeCode',
            labelField: 'makeCode',
            searchField: 'makeCode',
            create: false,
            preload: true,
            load: function(query, callback) {
            	$('.quote-form-wrapper').removeClass('hidden');
                $('#carMake-selectized').data('required-error', $('#carMake').data('required-error'));
                $.ajax({
                    url: context + '/api/iMotor/list/carMakes',
                    type: 'GET',
                    dataType: 'json',
                    error: function() {
                            callback();
                        },
                        success: function(res) {
                            callback(res);
							
                            var sessionCarMake = sessionStorage.getItem('carMake');
                            if(sessionCarMake){
                            	$carMake[0].selectize.setValue(sessionCarMake);
                            	$('.q1, .q2, .q3, .q4, .q5').removeClass('hidden');
                            }
							//$.each(res, function(i, item) {
								if(getUrlParameter("edit")=="yes")
								{
									//console.log(item.makeCode+"-"+quote.carDetail.makeCode);
									//if(item.makeCode == quote.carDetail.makeCode)
									{
										$carMake[0].selectize.setValue(quote.carDetail.makeCode);	
									}
								}
							//});
                        }
                });
            },
            onChange: function(value){
				
            	carMakeApi = "";
                if (!value.length) {
                    car_details.disable();
                    car_details.clearOptions();
                    return;
                }
                else{
                car_details.disable();
                car_details.clearOptions();
                car_details.load(function(callback) {
                	 $('#carModel-selectized').data('required-error', $('#carModel').data('required-error'));
                    xhr && xhr.abort();
                    xhr = $.ajax({
                        url: context + '/api/iMotor/carDetails/'+value,
                        success: function(results) {
                            car_details.enable();
                            callback(results);
                            var i = 0, eCar;
                           
                            carMakeApi = context + '/api/iMotor/carDetails/'+value;
                           
                            var sessionCarModel = sessionStorage.getItem('carModel');
                            if(sessionCarModel){
                            	$car_details[0].selectize.setValue(sessionCarModel);
                            	setTimeout(function(){
                            		sessionStorage.clear();
                            		}, 500);
                            }
							else if(getUrlParameter("edit")=="yes")
							{
								$car_details[0].selectize.setValue(quote.carDetail.model);	
							}
                            else
                            	car_details.open();
                            	
                        },
                        error: function() {
                            callback();
                        }
                    });
                });
                }
            }
        });
       carMake = $carMake[0].selectize;
        $car_details =  $('#carModel').selectize({
            valueField: 'model',
            labelField: 'model',
            searchField: ['model'],
			load: function(query, callback) {

				if(getUrlParameter("edit")=="yes")
				{
					var eCarApi = carMakeApi + "/supplement" + "?carModel=" + value; 
            	$.ajax({
            		  url: eCarApi,
            		  contentType: "application/json",
            		  type: 'GET',
            		  dataType: "json",
            		  success: function(data) {
            		//	  console.log(data);
            	//		  console.log(data.electricCar);
            	            if(data.electricCar){
            	            //	console.log('eCar!!');
            	            	$('#cc').addClass('hidden');
            	            	$('#cc').find('div > input[name="cc"]').removeAttr('required');
            	            }
            	            else{
            	        //    	console.log('Not eCar!!');
            	            	$('#cc').removeClass('hidden');
            	            	$('#cc').find('div > input[name="cc"]').prop('required',true);
            	            }
							$.each(data, function(i, item) {
							//console.log(item.model+"-"+quote.carDetail.model);
							if(item.model == quote.carDetail.model)
							{
								$car_details[0].selectize.setValue(item.model);	
							}
					
					});
							
                      }, 
                      error: function() {
                        //  alert(eCarApi);
                      }
            		});
            	

            	
            	$('#cc').find('input').focus();
					
				}
			},
            onChange: function(value){
            	var eCarApi = carMakeApi + "/supplement" + "?carModel=" + value; 
            	$.ajax({
            		  url: eCarApi,
            		  contentType: "application/json",
            		  type: 'GET',
            		  dataType: "json",
            		  success: function(data) {
            		//	  console.log(data);
            	//		  console.log(data.electricCar);
            	            if(data.electricCar){
            	            //	console.log('eCar!!');
            	            	$('#cc').addClass('hidden');
            	            	$('#cc').find('div > input[name="cc"]').removeAttr('required');
            	            }
            	            else{
            	        //    	console.log('Not eCar!!');
            	            	$('#cc').removeClass('hidden');
            	            	$('#cc').find('div > input[name="cc"]').prop('required',true);
            	            }
							
							
                      }, 
                      error: function() {
                        //  alert(eCarApi);
                      }
            		});
            	

            	
            	$('#cc').find('input').focus();
            }
        });
        car_details = $car_details[0].selectize;
        car_details.disable();
        var occuField = 'desc';
        if('tc' === language){
        	occuField = 'descZh';
        }
        $occupation = $('#occupation').selectize({
            valueField: 'id',
            labelField: occuField,
            searchField: occuField,
            create: false,
            preload: true,
            load: function(query, callback) {
                $('#occupation-selectized').data('required-error', $('#occupation').data('required-error'));
                $.ajax({
                    url: context + '/api/iMotor/list/occupations.json', //change to get api
                    type: 'GET',
                    dataType: 'json',
                    data: {
                        desc: query,
                    },
                    error: function() {
                            callback();
                        },
                        success: function(res) {
                            callback(res);
                            var sessionOccupation = sessionStorage.getItem('occupation');
                            if(sessionOccupation){
                            	$occupation[0].selectize.setValue(sessionOccupation);
                            }
							if(getUrlParameter("edit")=="yes")
							{
								$.each(res, function(i, item) {
								//console.log(item.code+"-"+quote.applicant.occupation);
									if(item.code == quote.applicant.occupation)
									{
										$occupation[0].selectize.setValue(item.code);	
									}
								});
							}
                        }
                });
            }
        });
        occupation = $occupation[0].selectize;
        $ncd = $('#ncd').selectize({
        	preload: true,
            load: function(query, callback) {
            	 $('#ncd-selectized').data('required-error', $('#ncd').data('required-error'));
				if(getUrlParameter("edit")=="yes")
				{
						$ncd[0].selectize.setValue(quote.applicant.ncb);	
				}
            }
        });
        ncd = $ncd[0].selectize;
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
        
    	if (getUrlParameter('plan')=='third')
    		$q2.find('#carValue').removeAttr('required');
		var promo=false;
		
		$("#findPromo").on('click',function(e){
			$("#PromoModal").modal("show");
		});
		
        $('#submitGetQuote').on('click', function(e){
			if(promo==false)
			{
				promo=true;
				$("#testimonials").removeClass('hidden');
				setTimeout(function(){ 
					$('html, body').animate({
						scrollTop: $("#testimonials").offset().top
					}, 500);	
				},500);
				$('#promoCode').prop('required',true);
				return false;
			}
		});
		
		$('.finalsubmitGetQuote').on('click', function(e){

		
			e.preventDefault();
			
				  $('#get-quote-form').validator('validate');
				  var num = $('[name="carEstimatedValue"]').maskMoney('unmasked')[0]*1000;
				if($('#carValue').prop('required')){
					if(num < 50000){
						 $('.custom-dollar-box').addClass('has-error has-danger');
						 var err = $('#carValue').data('min-error');
						 $('#carValue').parents('.form-group').find('.help-block.with-errors').html('<ul class="list-unstyled"><li>' + err + '</li></ul>');
					}
					else{
						$('#carValue').parents('.form-group').find('.help-block.with-errors').empty();
						$('.custom-dollar-box').removeClass('has-error has-danger');
					}
					}
				  
				if(!$('#get-quote-form .has-error').length){
					var isThird;
					if (getUrlParameter('plan')=='third') {
						isThird = true;
					} else {
						isThird = false;
					}
					var
					//formObject = $(this).serializeArray(),
					carMakeCode = $('[name="carMakeCode"]').val(),
					carModel = $('[name="carModel"]').val(),
					cc = $('[name="cc"]').val(),
					ncb = $('[name="ncb"]').val(),
					carYearOfManufacture = $('[name="carYearOfManufacture"]').val(),
					clubMember = $('[name="clubMember"]').val(),
					num = $('[name="carEstimatedValue"]').maskMoney('unmasked')[0]*1000,
					occupation = $('[name="occupation"]').val(),
					driveMoreThanTwo = "true",
					validAgeGroup = "true",
					promoCode = $('[name="promoCode"]').val(),
					clubMemberNum = $('[name="clubMemberNum"]').val(),
					ncd = $('[name="ncd"]').val(),
					driveMoreThanTwo = $('[name="driveMoreThanTwo"]').is(':checked'),
					validAgeGroup = $('[name="validAgeGroup"]').is(':checked');
					
					if (isThird)
						var carEstimatedValue = (num == 0) ? "" : num;
					else
						var carEstimatedValue = num;
					
						submitData = {
						"applicant": {
							"ncb": ncd,
							"occupation": occupation,
							"driveMoreThanTwo": driveMoreThanTwo,         
							"validAgeGroup": validAgeGroup
						},
						"carDetail": {
							 "estimatedValue": carEstimatedValue,
							 "makeCode": carMakeCode,
							 "engineCapacity": cc,
							 "model": carModel,
							 "yearOfManufacture": carYearOfManufacture                        
						}, 
						"driver" : [{   
							"ncb": ncd,
							"occupation": occupation,
							"driveMoreThanTwo": driveMoreThanTwo,         
							"validAgeGroup": validAgeGroup, 
						}],
						"planCode": null,
						"compPlan": null,
						"personalAccident": false,
						"thirdPartyPropertyDamage": false
						//"promoCode":promoCode
					};
					if (isThird) {
						submitData.planCode = "Third";
						submitData.compPlan = null; 
					} else {
						submitData.planCode = "Comp";
						submitData.compPlan = "Silver"; 
					}
			if($(this).attr('data')=="check")
			{
				submitData.promoCode = promoCode;
					 $.ajax({
						  type: "POST",
						  data: JSON.stringify(submitData),
						  dataType: "json",
						  contentType : "application/json",
						  cache: false,
						  async: false,
						  url:context + "/api/iMotor/quote",
						  success: function(data){
	
							$.ajax({
							beforeSend: function(){
								$('#loading-overlay').modal("show");
							},
							type: "POST",
							url: context + "/api/iMotor/quote",  //post to api
							data: JSON.stringify(submitData),
							success: function(){
								sessionStorage.setItem('carMake', carMakeCode);
								sessionStorage.setItem('carModel', carModel);
								sessionStorage.setItem('occupation', occupation);
							  //	e.preventDefault();
								$('#loading-overlay').modal("hide");
								var $form = $("<form id='quote-form' />");
								if (isThird) {
									if(resume==true)
										$form.attr("action", "third-party-quote?edit=yes");
									else if(getUrlParameter("edit")=="yes")
										$form.attr("action", "third-party-quote?edit=yes");
									else
										$form.attr("action", "third-party-quote");
								} else {
									if(resume==true)
										$form.attr("action", "comprehensive-quote?edit=yes");
									else if(getUrlParameter("edit")=="yes")
										$form.attr("action", "comprehensive-quote?edit=yes");
									else
										$form.attr("action", "comprehensive-quote");
								}
								$form.attr("method", "post");
								var $quote = $("<input type='hidden' name='data' />");
								if(resume==true)
								{
									var opts = {};
									opts = $.extend(opts,quote, submitData);
									opts=  $.extend(opts,{"applicant": $.extend(quote.applicant, submitData.applicant)});
									opts=  $.extend(opts,{"carDetail": $.extend(quote.carDetail, submitData.carDetail)});
									opts=  $.extend(opts,{"driver": $.extend(quote.driver[0], submitData.driver[0])});
									$quote.attr("value", JSON.stringify(opts));				
								}
								else if(getUrlParameter("edit")=="yes")
								{
									var opts = {};
									opts = $.extend(opts,quote, submitData);
									opts=  $.extend(opts,{"applicant": $.extend(quote.applicant, submitData.applicant)});
									opts=  $.extend(opts,{"carDetail": $.extend(quote.carDetail, submitData.carDetail)});
									opts=  $.extend(opts,{"driver": $.extend([],quote.driver, submitData.driver)});
									$quote.attr("value", JSON.stringify(opts));	
								}
								else
								{
									$quote.attr("value", JSON.stringify(submitData));
								}//$quote.attr("value", JSON.stringify(quote));
								//console.dir(opts);
								$form.append($quote);
								$("body").append($form);
								$('#quote-form').submit();                        
							},
							dataType: "json",
							contentType : "application/json",
							cache: false,
							async: false,
							error: function(xhr, textStatus, errorThrown) {
								$('#reason').attr('value', xhr.status);
								e.preventDefault();
                            	if (xhr.status == 422) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[422]);
									else
                            			$("#reasonMsg").text(enErr[422]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								if (xhr.status == 405) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 417) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								}
								else if (xhr.status == 418) {
									if(chin)
										$("#reasonMsg").text(cnErr[418]);
									else
										$("#reasonMsg").text(enErr[418]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 								
								else if (xhr.status == 406) {
									if(chin)
										$("#reasonMsg").text(cnErr[406]);
									else
										$("#reasonMsg").text(enErr[406]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 408) {
									if(chin)
										$("#reasonMsg").text(cnErr[408]);
									else
										$("#reasonMsg").text(enErr[408]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 409) {
									if(chin)
										$("#reasonMsg").text(cnErr[409]);
									else
										$("#reasonMsg").text(enErr[409]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 412) {
									if(chin)
										$("#reasonMsg").text(cnErr[412]);
									else
										$("#reasonMsg").text(enErr[412]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 413) {
									if(chin)
										$("#reasonMsg").text(cnErr[413]);
									else
										$("#reasonMsg").text(enErr[413]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 414) {
									if(chin)
										$("#reasonMsg").text(cnErr[414]);
									else
										$("#reasonMsg").text(enErr[414]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 415) {
									if(chin)
										$("#reasonMsg").text(cnErr[415]);
									else
										$("#reasonMsg").text(enErr[415]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 416) {
									if(chin)
										$("#reasonMsg").text(cnErr[416]);
									else
										$("#reasonMsg").text(enErr[416]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
                            	else if (xhr.status == 504) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[504]);
									else
                            			$("#reasonMsg").text(enErr[504]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
									
								} else {
									$("#reasonMsg").text('System error');
									console.log(xhr.status, textStatus, errorThrown);
								 
								}
								$("#loading-overlay").modal("hide");
							 
							}
						});
							
						  },error: function(xhr, textStatus, errorThrown) {
							$('#reason').attr('value', xhr.status);
							e.preventDefault();
							if (xhr.status == 418)
								$("#promo-errors").html("Wrong Promo Code");
							else if (xhr.status == 422) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[422]);
									else
                            			$("#reasonMsg").text(enErr[422]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								if (xhr.status == 405) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 417) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								}/*
								else if (xhr.status == 418) {
									if(chin)
										$("#reasonMsg").text(cnErr[418]);
									else
										$("#reasonMsg").text(enErr[418]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								}*/ 								
								else if (xhr.status == 406) {
									if(chin)
										$("#reasonMsg").text(cnErr[406]);
									else
										$("#reasonMsg").text(enErr[406]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 408) {
									if(chin)
										$("#reasonMsg").text(cnErr[408]);
									else
										$("#reasonMsg").text(enErr[408]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 409) {
									if(chin)
										$("#reasonMsg").text(cnErr[409]);
									else
										$("#reasonMsg").text(enErr[409]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 412) {
									if(chin)
										$("#reasonMsg").text(cnErr[412]);
									else
										$("#reasonMsg").text(enErr[412]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 413) {
									if(chin)
										$("#reasonMsg").text(cnErr[413]);
									else
										$("#reasonMsg").text(enErr[413]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 414) {
									if(chin)
										$("#reasonMsg").text(cnErr[414]);
									else
										$("#reasonMsg").text(enErr[414]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 415) {
									if(chin)
										$("#reasonMsg").text(cnErr[415]);
									else
										$("#reasonMsg").text(enErr[415]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 416) {
									if(chin)
										$("#reasonMsg").text(cnErr[416]);
									else
										$("#reasonMsg").text(enErr[416]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
                            	else if (xhr.status == 504) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[504]);
									else
                            			$("#reasonMsg").text(enErr[504]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
									
								} else {
									$("#reasonMsg").text('System error');
									console.log(xhr.status, textStatus, errorThrown);
								 
								}
								$("#loading-overlay").modal("hide");
						  }
						});
			}
			else if($(this).attr('data')=="go")
			{
				submitData.promoCode =null;
					
			  //  console.log(num);
						$.ajax({
							beforeSend: function(){
								$('#loading-overlay').modal("show");
							},
							type: "POST",
							url: context + "/api/iMotor/quote",  //post to api
							data: JSON.stringify(submitData),
							success: function(){
								sessionStorage.setItem('carMake', carMakeCode);
								sessionStorage.setItem('carModel', carModel);
								sessionStorage.setItem('occupation', occupation);
							  //	e.preventDefault();
								$('#loading-overlay').modal("hide");
								var $form = $("<form id='quote-form' />");
								if (isThird) {
									if(resume==true)
										$form.attr("action", "third-party-quote?edit=yes");
									else if(getUrlParameter("edit")=="yes")
										$form.attr("action", "third-party-quote?edit=yes");
									else
										$form.attr("action", "third-party-quote");
								} else {
									if(resume==true)
										$form.attr("action", "comprehensive-quote?edit=yes");
									else if(getUrlParameter("edit")=="yes")
										$form.attr("action", "comprehensive-quote?edit=yes");
									else
										$form.attr("action", "comprehensive-quote");
								}
								$form.attr("method", "post");
								var $quote = $("<input type='hidden' name='data' />");
								if(resume==true)
								{
									var opts = {};
									opts = $.extend(opts,quote, submitData);
									opts=  $.extend(opts,{"applicant": $.extend(quote.applicant, submitData.applicant)});
									opts=  $.extend(opts,{"carDetail": $.extend(quote.carDetail, submitData.carDetail)});
									opts=  $.extend(opts,{"driver": $.extend(quote.driver[0], submitData.driver[0])});
									$quote.attr("value", JSON.stringify(opts));				
								}
								else if(getUrlParameter("edit")=="yes")
								{
									var opts = {};
									opts = $.extend(opts,quote, submitData);
									opts=  $.extend(opts,{"applicant": $.extend(quote.applicant, submitData.applicant)});
									opts=  $.extend(opts,{"carDetail": $.extend(quote.carDetail, submitData.carDetail)});
									opts=  $.extend(opts,{"driver": $.extend([],quote.driver, submitData.driver)});
									$quote.attr("value", JSON.stringify(opts));	
								}
								else
								{
									$quote.attr("value", JSON.stringify(submitData));
								}//$quote.attr("value", JSON.stringify(quote));
								//console.dir(opts);
								$form.append($quote);
								$("body").append($form);
								$('#quote-form').submit();                        
							},
							dataType: "json",
							contentType : "application/json",
							cache: false,
							async: false,
							error: function(xhr, textStatus, errorThrown) {
								$('#reason').attr('value', xhr.status);
								e.preventDefault();
                            	if (xhr.status == 422) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[422]);
									else
                            			$("#reasonMsg").text(enErr[422]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								if (xhr.status == 405) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 417) {
									if(chin)
										$("#reasonMsg").text(cnErr[417]);
									else
										$("#reasonMsg").text(enErr[417]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								}
								else if (xhr.status == 418) {
									if(chin)
										$("#reasonMsg").text(cnErr[418]);
									else
										$("#reasonMsg").text(enErr[418]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 								
								else if (xhr.status == 406) {
									if(chin)
										$("#reasonMsg").text(cnErr[406]);
									else
										$("#reasonMsg").text(enErr[406]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 408) {
									if(chin)
										$("#reasonMsg").text(cnErr[408]);
									else
										$("#reasonMsg").text(enErr[408]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 409) {
									if(chin)
										$("#reasonMsg").text(cnErr[409]);
									else
										$("#reasonMsg").text(enErr[409]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 410) {
									if(chin)
										$("#reasonMsg").text(cnErr[410]);
									else
										$("#reasonMsg").text(enErr[410]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 412) {
									if(chin)
										$("#reasonMsg").text(cnErr[412]);
									else
										$("#reasonMsg").text(enErr[412]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 413) {
									if(chin)
										$("#reasonMsg").text(cnErr[413]);
									else
										$("#reasonMsg").text(enErr[413]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 414) {
									if(chin)
										$("#reasonMsg").text(cnErr[414]);
									else
										$("#reasonMsg").text(enErr[414]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 415) {
									if(chin)
										$("#reasonMsg").text(cnErr[415]);
									else
										$("#reasonMsg").text(enErr[415]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
								else if (xhr.status == 416) {
									if(chin)
										$("#reasonMsg").text(cnErr[416]);
									else
										$("#reasonMsg").text(enErr[416]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
								} 
                            	else if (xhr.status == 504) {
									if(chin)
                            			$("#reasonMsg").text(cnErr[504]);
									else
                            			$("#reasonMsg").text(enErr[504]);
									$("#contactpopup").modal('show');
									window.location.hash = "callme=popup";
									console.log(xhr.status, textStatus, errorThrown);
									
								} else {
									$("#reasonMsg").text('System error');
									console.log(xhr.status, textStatus, errorThrown);
								 
								}
								$("#loading-overlay").modal("hide");
							 
							}
						});
					
				} 
			}
		});
      
       

    }
});
