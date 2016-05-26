$(document).ready(function(){

	if($("#eh-app-underwriting").length){

		// var 

		$("#ef-form-underwriting").bootstrapValidator({
			fields:{
				ehUnderWriting1:{
					container:'#ehUnderWriting1ErrMsg',
					validators:{
						notEmpty:{
							message:' '
						},
						callback:{
							message:' ',
							callback:function(){
								return validateUnderWriting("ehUnderWriting1")
							}
						}
					}
				},
				ehUnderWriting2:{
					container:'#ehUnderWriting2ErrMsg',
					validators:{
						notEmpty:{
							message:' '
						},
						callback:{
							message:' ',
							callback:function(){
								return validateUnderWriting("ehUnderWriting2")
							}
						}
					}
				},
				ehUnderWriting3:{
					container:'#ehUnderWriting3ErrMsg',
					validators:{
						notEmpty:{
							message:' '
						},
						callback:{
							message:' ',
							callback:function(){
								return validateUnderWriting("ehUnderWriting2")
							}
						}
					}
				},
				cbTNC:{
					container:'#ehUnderWriting4ErrMsg',
					validators:{
						notEmpty:{
							message:' '
						},
						callback:{
							message:' ',
							callback:validateUnderWriting
						}
					}
				}				
			}
		});

		$(".eh-btn-next").on("click",function(){
			$('#ef-form-underwriting').bootstrapValidator('validate');
			if($('#ef-form-underwriting').data('bootstrapValidator').isValid()){
				window.location = nextPageFlow;
			}
		});

		
	}

	if($("#eh-app-signature").length){
		application.signature.init("#signature",{
			width:830,
			height:308,
			useParentWidth:true,
			ratio:308/830,
			events:{
				change:validateSignature
			}
		});

		$(".btn-confirm").click(function(){
			var response = validateSignature();
			if(response.error === 0){
				//Do Something
			}
		});

		$(".link-clear").click(function(){
			application.signature.clear();
			$("#signatureError").empty();
			$("#correct-signature").addClass("hidden");
		});
	}

	function validateUnderWriting(radio){
		
		var allNo = $('input[name="ehUnderWriting1"]').prop('checked')
			 		&& $('input[name="ehUnderWriting2"]').prop('checked')
			 		&& $('input[name="ehUnderWriting3"]').prop('checked')

		if(radio){
			 if($('input[name="'+ radio+'"]:checked').val() == "Yes"){
			 	$("#cannot-apply-modal").modal("show");
			 }
		}

		if(allNo && $('#cbTNC').is(":checked")){
			$(".eh-btn-next").removeClass("grey-out");
		}else{
			$(".eh-btn-next").addClass("grey-out");
		}
		//must be return true to avoid the error message
		return true;
	}

	function validateSignature(){
		var response = application.signature.validate();
		$("#signatureError").empty();
		if(response.error === 0){
			//Do something
			$("#correct-signature").removeClass("hidden");
		}else if(response.error === 1){
			$("#signatureError").html($("<small/>").text("Please sign in the grey area."));
			//$("#signatureError").html($("<small/>").text(getBundle(getBundleLanguage, "error.signature.empty")));
		}else if(response.error === 2){
			$("#signatureError").html($("<small/>").text("Signature file's size exceeds limit. Please clear the signature to retry again."));
			//$("#signatureError").html($("<small/>").text(getBundle(getBundleLanguage, "error.signature.size")));
		}

		return response;
	}


	if($("#eh-app-payment").length){

		//Using jquery.payment.js plug-in for creditcard checking
		$('#ccNumber').payment('formatCardNumber');

		$("#paymentForm").bootstrapValidator({
			fields:{
				ccNumber:{
					container:'#ccNumberErrMsg',
					validators:{
						notEmpty:{
							message:'Please enter your credit card number.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.notNull.message")
						},
						callback:{
							message:"Please enter your credit card number.",
							//message:getBundle(getBundleLanguage, "applicant.creditcard.notValid.message"),
							callback:function(e){
								if($("#ccNumber").data("bv.result.notEmpty") === "INVALID"){
									return true
								}
								var cardtype = "";
								$(".cardtype").find("span").removeClass("detected");
								cardtype = $("#ccNumber").hasClass("visa")?"visa":$("#ccNumber").hasClass("mastercard")?"mastercard":"";
								if(cardtype != ""){
									if($.payment.validateCardNumber($("#ccNumber").val())){
										$(".cardtype").find("span."+cardtype).addClass("detected");
										$('#pMethod').val($("#ccNumber").hasClass("visa")?"VISA":$("#ccNumber").hasClass("mastercard")?"Master":"Unknown");
										return true;
									}else{
										return false;
									}									
								}else{
									return false;
								}
								//console.log($("#ccNumber").data());
								
							}
						},
						onStatus:function(){
							console.log(1);
						}
					}
				},
				cardHolder:{
					container:'#cardHolderErrMsg',
					validators: {
						notEmpty:{
							message:'Please enter name printed on credit card.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.name.notNull.message")
						},
						callback:{
							message:"Name on credit card does not match with the applicant's name. Please try to use another credit card or contact our customer hotline at 3123 3123 for more details.",
							//message:getBundle(getBundleLanguage, "form.payment.cardholder.name.unmatch"),
							callback:function(e){
								if($("#cardHolder").data("bv.result.notEmpty") === "INVALID"){
									return true
								}
								if(application.common.validateCardHolder($("#appFirstName"),$("#appLastName"),$("#cardHolder"))){
									return true;
								}else{
									return false;
								}
							}
						}
					}
				},
				securityCode: {
					container:'#securityCodeErrMsg',
					validators: {
						notEmpty:{
							message:'Please enter security code on credit card.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.cvv.notNull.message")
						},
						cvv: {
							creditCardField: 'ccNumber',
							message: 'Your security code is invalid.'
						}
					}
				},
				epMonth:{
					container:'#epMonthErrMsg',
					validators: {
						notEmpty:{
							message:"Please specify your credit card's expiry month."
							//message:getBundle(getBundleLanguage, "applicant.creditcard.month.notNull.message")
						}
					}
				},
				epYear:{
					container:'#epYearErrMsg',
					validators: {
						notEmpty:{
							message:"Please specify your credit card's expiry year."
							//message:getBundle(getBundleLanguage, "applicant.creditcard.year.notNull.message")
						}
					}
				},
				cbTNC:{
					container:'#cbTNCErrMsg',
					validators:{
						notEmpty:{
							message:'Please read and accept the Payment Authorization.'
							//message:getBundle(getBundleLanguage, "payment.tnc.notChecked.message")
						}
					}
				}				
			}
		})
	}



	//
	$(".mdl-select").each(function(){
		var p = $(this);

		$(this).find("select").on('focus',function(){ p.addClass("is-focused"); });

		$(this).find("select").on('blur',function(){ p.removeClass("is-focused"); });

		$(this).find("select").on("change",function(){
			if($(this).find("option:selected").val() != ""){
				p.addClass("is-dirty");
			}else{
				p.removeClass("is-dirty");
			}
			p.removeClass("is-focused");
		});

	});
});
