var contextPath = context;
var lang = UILANGUAGE;
var nextPage = nextPage;
$(document).ready(function(){



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


	 if($("#ef-form-selectplan").length > 0){

	 	$(".btn-select-plan").click(function(){
	 		if(!$(this).parents(".planb1").hasClass("selected")){

	 			$(".app-selectplan-tab-head").find(".planb1").removeClass("selected");
	 			$(this).parents(".planb1").addClass("selected");

	 			$(".easy-home-toggle, .home-liability-toggle").hide();

	 			$("."+ $(this).data("plan") + "-toggle").show();
	 		}
	 		
	 	});

	 	$("#the-club-member-toggle").change(function(){
	 		$("#theClubMembershipNo").prop("disabled",!$(this).is(":checked"));
	 		if($(this).is(":checked")){
	 			// $("#theClubMembershipNo").focus();

	 			if($("#theClubMembershipNo").data("phantom")){
	 				$("#theClubMembershipNo").val($("#theClubMembershipNo").data("phantom"));
	 				$("#theClubMembershipNo").select();
	 			}
	 		}else{
	 			if($.trim($("#theClubMembershipNo").val()) != ""){
	 				$("#theClubMembershipNo").data("phantom",$.trim($("#theClubMembershipNo").val()));
	 				$("#theClubMembershipNo").val("");
	 			}
	 		}
	 	});
	 }

	 if($("#ef-form-screening").length > 0){

	 	$("input[type='checkbox']").change(function(){
	 		
	 		$(this).parent().removeClass("on off");
	 		if($(this).is(":checked")) {
	 			$(this).parent().addClass("on");
	 		}else{
	 			$(this).parent().addClass("off");
	 		}
	 	});

		$(".eh-btn-next").on("click",function(){
			var allNo = $('input[name="cb1"]:checked').attr("checked")
			 		&& $('input[name="cb2"]:checked').attr("checked")
			 		&& $('input[name="cb3"]:checked').attr("checked");
			//oldHome

			if(allNo){
				$.ajax({
			        type : "get",
			        cache:false, 
			        async:false, 
			        url : contextPath+'/ajax/homeliability/getHomeCareQuote',
			        data : {
				        	referralCode : "",
				        	answer1 : "N",
				        	answer2 : "N"
				           },
			        success : function(data) {
				      	if(data !=null && data.errorMsg ==null){
				      		window.location = contextPath+"/"+lang+'/home-liability-insurance/'+nextPage;
						}
				      	else{
				      		console.log(data.errorMsg); 
				      	}
			        },
			        error:function(){
			            console.log('error');   
			        }
			  });
				//alert("implement screening logic in here");
			}else{
				$("#oldHome").modal("show");
				centerModals($("#oldHome"));
			}
		});
	 }
	//Application Form
	if($("#ef-form-application").length > 0){

		var dob_end_date = new Date();
		dob_end_date.setFullYear(dob_end_date.getFullYear()-18);
		//18 Years old

		// 85 year ago date
		var dob_start_date = new Date();
		dob_start_date.setFullYear(dob_start_date.getFullYear()-85);
		dob_start_date.setDate(dob_start_date.getDate()+1);


		$('#dob').mobiscroll().date({
			minDate:dob_start_date,
			maxDate:dob_end_date,
			dateOrder: 'ddMyy',
        	dateFormat: 'dd-mm-yy',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed
		});
		
		//60 Days	
		var sixtyDays = new Date();
		sixtyDays.setDate(dob_start_date.getDate()+60);

		 $('#effectdate').mobiscroll().date({
		 	minDate:new Date(),
		 	maxDate:sixtyDays,
		 	dateOrder: 'ddMyy',
        	dateFormat: 'dd-mm-yy',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed
	    });

		 $("#cbSameCorrAddr").change(function(){
	 		
	 		$(this).parent().removeClass("on off");
	 		if($(this).is(":checked")) {
	 			$(this).parent().addClass("on");
	 			$(".insured-addr-more").slideUp();

	 			shadowCopy($("#applicantRoom"),$("#aRoom"));
	 			shadowCopy($("#applicantFloor"),$("#aFloor"));
	 			shadowCopy($("#applicantBlock"),$("#aBlock"));
	 			shadowCopy($("#applicantBuilding"),$("#aBuilding"));
	 			shadowCopy($("#applicantEstate"),$("#aEstate"));
	 			shadowCopy($("#applicantStreetNo"),$("#aStreetNo"));
	 			shadowCopy($("#applicantStreetName"),$("#aStreetName"));
	 			shadowCopy($("#applicantDistrict"),$("#aDistrict"));
	 			shadowCopy($("#applicantArea"),$("#aArea"));
	 		}else{
	 			$(this).parent().addClass("off");
	 			$(".insured-addr-more").slideDown();

	 			$("#aRoom, #aFloor, #aBlock, #aBuilding, #aEstate, #aStreetNo, #aStreetName, #aDistrict, #aArea").val("");
	 			$("#aRoom, #aFloor, #aBlock, #aBuilding, #aEstate, #aStreetNo, #aStreetName, #aDistrict, #aArea").parent().removeClass("is-dirty");

	 		}
	 	});

		 $("#ef-form-application").bootstrapValidator({
			fields:{
				applicantName:{
					container:'#applicantNameErrMsg',
					validators: {
						notEmpty:{
							message:'Please enter your Name in English.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.name.notNull.message")
						},
						callback:{
							message:'Your full name is invalid.',
							callback:function(){
								if($.trim($("#applicantName").val()) == ""){
									return true;
								}else{
									return application.common.validate($("#applicantName").val(),"Alphabet");
								}
								
							}
						}
					}
				},
				dob:{
					container:'#dobErrMsg',
					validators:{
						notEmpty:{
							message:'Please select your Date of Birth.'
						}
					}
				},
				apphkidandpassport:{
					container:'#apphkidandpassportErrMsg',
					validators:{
						notEmpty:{
							message:'Please select'
						}
					}
				},
				hkId:{
					container:'#hkIdErrMsg',
					validators:{
						callback:{
							message:'',
							callback:function(){
								if($("#apphkidandpassport").val() == ""){
									return true;
								}else{
									var isEmpty = $.trim($("#hkId").val()) == "";
									var val = $.trim($("#hkId").val());
									var errElm = $("#hkId").parents(".form-group").find("small[data-bv-validator='callback']");

									if($("#apphkidandpassport").val() == "appHkid"){
										var isValidHKID = IsHKID(val);

										if(isEmpty){
											errElm.text(getBundle(getBundleLanguage, "applicant.hkId.notNull.message"));
											return false;
										}else if(!isValidHKID){
											errElm.text(getBundle(getBundleLanguage, "applicant.hkId.notValid.message"));
											return false;
										}else{
											return true;
										}
									}else if($("#apphkidandpassport").val() == "appPassport"){
										var isValidPassportLen = chkTravelHKPassLen(val);
										var isValidPassport = chkTravelHKPass(val);

										if(isEmpty){
											errElm.text(getBundle(getBundleLanguage, "applicant.passport.notNull.message"));
											return false;
										}else if(!isValidPassportLen){
											errElm.text(getBundle(getBundleLanguage, "applicant.passport.notValidLength.message"));
											return false;
										}else if(!isValidPassport){
											errElm.text(getBundle(getBundleLanguage, "applicant.passport.notEnglish.message"));
											return false;
										}else{
											return true;
										}

									}
								}
							}
						}
					}
				},
				mobileNo:{
					container:'#mobileNoErrMsg',
					validators:{
						callback:{
							message:'Please enter your mobile no. or email address.',
							callback:function(a,b){

								var isEmpty = $.trim($("#inputMobileNo").val()) == "";
								var isValidMobile = application.common.validate($("#inputMobileNo").val(),"Mobileno");
								var errElm = $("#inputMobileNo").parents(".form-group").find("small[data-bv-validator='callback']");
							
								if($.trim($("#inputEmail").val()) != ""){
									if(isEmpty || isValidMobile){
										return true;
									}else{
										errElm.text("Your mobile no. is invalid.");
										return false;
									}
								}else{
									if(isEmpty){
										errElm.text("Please enter your mobile no. or email address.");
										return false;
									}else if(!isValidMobile){
										errElm.text("Your mobile no. is invalid.");
										return false;
									}else{
										return true;
									}
								}
								
								return false;
							}
						}
					}
				},
				inputEmail:{
					container:'#emailAddressErrMsg',
					validators:{
						notEmpty:{
							message:'Please enter your Email Address.'
						},
						emailAddress: {
                           message: 'Your email address is invalid.'
                        },
                        callback:{
                        	message:'',
                        	callback:function(){
                        		$("#ef-form-application").bootstrapValidator('updateStatus', 'mobileNo', 'NOT_VALIDATED').bootstrapValidator('validateField', "mobileNo")
                        		return true;
                        	}
                        }
					}
				},				

				applicantRoom:{
					container:"#applicantRoomErrMsg",
					validators:{
                        callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantRoom"),$("#aRoom"));
                        			// $("#aRoom").parent().addClass("is-dirty");
                        		}

                        		return true;
                        	}
                        }
					}

				},

				applicantFloor:{
					container:"#applicantFloorErrMsg",
					validators:{
                        callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantFloor"),$("#aFloor"));
                        		}

                        		return true;
                        	}
                        }
					}

				},

				applicantBlock:{
					container:"#applicantBlockErrMsg",
					validators:{
                        callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantBlock"),$("#aBlock"));
                        		}

                        		return true;
                        	}
                        }
					}

				},

				applicantBuilding:{
					container:'#applicantBuildingErrMsg',
					validators:{
                        callback:{
                        	message:'Either Building or Estate must be filled in.',
                        	callback:function(){
                        		var eitherone = $.trim($("#applicantBuilding").val()) != "" || $.trim($("#applicantEstate").val()) != "";
                        		if(eitherone) $("#ef-form-application").bootstrapValidator('updateStatus', 'applicantEstate', 'VALIDATED');

                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantBuilding"),$("#aBuilding"));
                        		}
                        		return eitherone;
                        	}
                        }
					}
				},


				applicantStreetNo:{
					container:"#applicantStreetNoErrMsg",
					validators:{
                        callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantStreetNo"),$("#aStreetNo"));
                        		}

                        		return true;
                        	}
                        }
					}

				},


				applicantStreetName:{
					container:"#applicantStreetNameErrMsg",
					validators:{
                        callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantStreetName"),$("#aStreetName"));
                        		}

                        		return true;
                        	}
                        }
					}

				},

				applicantEstate:{
					container:'#applicantEstateErrMsg',
					validators:{
                        callback:{
                        	message:'Either Building or Estate must be filled in.',
                        	callback:function(){
                        		var eitherone = $.trim($("#applicantBuilding").val()) != "" || $.trim($("#applicantEstate").val()) != "";
                        		if(eitherone) $("#ef-form-application").bootstrapValidator('updateStatus', 'applicantBuilding', 'VALIDATED');

                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantEstate"),$("#aEstate"));
                        		}

                        		return eitherone;
                        	}
                        }
					}
				},

				applicantDistrict:{
					container:'#applicantDistrictErrMsg',
					validators:{
						notEmpty:{
							message:'Please select district'
						},
						callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantDistrict"),$("#aDistrict"));
                        		}

                        		return true;
                        	}
                        }
					}
				},
				applicantArea:{
					container:'#applicantAreaErrMsg',
					validators:{
						notEmpty:{
							message:'Please enter your area'
						},
						callback:{
                        	message:' ',
                        	callback:function(){
                        		if($("#cbSameCorrAddr").is(":checked")){
                        			shadowCopy($("#applicantArea"),$("#aArea"));
                        		}

                        		return true;
                        	}
                        }
					}
				},

				aBuilding:{
					container:'#aBuildingErrMsg',
					validators:{
                        callback:{
                        	message:'Either Building or Estate must be filled in.',
                        	callback:function(){
                        		if(!$("#cbSameCorrAddr").is(":checked")){
                        			var eitherone = $.trim($("#aBuilding").val()) != "" || $.trim($("#aEstate").val()) != "";
                        			if(eitherone) $("#ef-form-application").bootstrapValidator('updateStatus', 'aEstate', 'VALIDATED');
                        			return eitherone;
                        		}
                        	}
                        }
					}
				},

				aEstate:{
					container:'#aEstateErrMsg',
					validators:{
                        callback:{
                        	message:'Either Building or Estate must be filled in.',
                        	callback:function(){
                        		if(!$("#cbSameCorrAddr").is(":checked")){
                        			var eitherone = $.trim($("#aBuilding").val()) != "" || $.trim($("#aEstate").val()) != "";
                        			if(eitherone) $("#ef-form-application").bootstrapValidator('updateStatus', 'aBuilding', 'VALIDATED');
                        			return eitherone;
                        		}
                        		return true;
                        		
                        	}
                        }
					}
				},

				aDistrict:{
					container:'#aDistrictErrMsg',
					validators:{
						callback:{
							message:"Please select district",
							callback:function(){
								if(!$("#cbSameCorrAddr").is(":checked")){
									if($.trim($("#aDistrict").val()) == ""){
										return false;
									}
								}

								return true;
							}
						}
					}
				},
				aArea:{
					container:'#aAreaErrMsg',
					validators:{
						callback:{
							message:"Please enter your area",
							callback:function(){
								if(!$("#cbSameCorrAddr").is(":checked")){
									if($.trim($("#aArea").val()) == ""){
										return false;
									}
								}

								return true;
							}
						}
					}
				},

				netFloorArea:{
					container:'#netFloorAreaErrMsg',
					validators:{
						notEmpty:{
							message:'Please select Net Floor Area.'
						}
					}
				},
				effectdate:{
					container:'#effectdateErrMsg',
					validators:{
						notEmpty:{
							message:'Effective Date must be within 60 days of Application Date.'
						}
					}
				},
				declarration:{
					container:'#declarrationErrMsg',
					validators:{
						notEmpty:{
							message:'Please read and accept the Declaration, Terms & Conditions before submitting the application.'
						}
					}
				},
				declarration2:{
					container:'#declarration2ErrMsg',
					validators:{
						notEmpty:{
							message:'Please read and accept the Personal Information Collection Statement before submitting the application.'
						}
					}
				},


				//Create FWD Account
				userName:{
					container:'#userNameErrMsg',
					validators:{
						callback:{
							message:'',
							callback:function(){
								/*$("#ef-form-application")
								.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED').bootstrapValidator('validateField', "password")
								.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED').bootstrapValidator('validateField', "Confirm-Password");*/

								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";

								if(noAccountInfo){
									return true;
								}else{
									var isValid = isValidUsername($.trim($("#cUserName").val()));
									if(isValid == true){
										$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED');

										return true;
									}else{
										$("#cUserName").parents(".form-group").find("small[data-bv-validator='callback']").text(isValid);
										return false;
									}
								}
								
							}
						}
					}
				},

				password:{
					container:'#passwordErrMsg',
					validators:{
						callback:{
							message:'',
							callback:function(){
								/*$("#ef-form-application")
								.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED').bootstrapValidator('validateField', "userName")
								.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED').bootstrapValidator('validateField', "Confirm-Password");*/

								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
								if(noAccountInfo){
									return true;
								}else{

									var isValid = isValidPassword($.trim($("#cPassword").val()));
									if(isValid == true){
										$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED');
										
										return true;
									}else{
										$("#cPassword").parents(".form-group").find("small[data-bv-validator='callback']").text(isValid);
										return false;
									}
								}
								
							}
						}
					}
				},

				"Confirm-Password":{
					container:'#Confirm-PasswordErrMsg',
					validators:{
						callback:{
							message:'',
							callback:function(){
								/*$("#ef-form-application")
								.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED').bootstrapValidator('validateField', "userName")
								.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED').bootstrapValidator('validateField', "password");*/

								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
								if(noAccountInfo){
									return true;
								}else{
									
									var isValid = passMatch($.trim($("#cPassword").val()),$.trim($("#Confirm-Password").val()));
									if(isValid == true){
										$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED');

										return true;
									}else{
										$("#Confirm-Password").parents(".form-group").find("small[data-bv-validator='callback']").text(isValid);
										return false;
									}
								}
								
							}
						}
					}
				}

					


			}

		})

		$(".eh-btn-next").on("click",function(){
			$('#ef-form-application').bootstrapValidator('validate');
			if($('#ef-form-application').data('bootstrapValidator').isValid()){
				//do something
				$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
				var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
				if(!noAccountInfo) {
					var optIn1 = "false";
					var optIn2 = "false";
			        if($('#donotWishDirectMarketing').is(':checked')){
			            optIn1 = "true";    
			        }
					if($('#donotDisclose').is(':checked')){
						optIn2 = "true";    
					}
					var password = $("#cPassword").val();
					var mobile = $("#inputMobileNo").val();
					var name = $("#applicantName").val();
					var userName = $("#cUserName").val();
					var email = $("#inputEmail").val();
					
					
			        $.ajax({
		                type : 'POST',
		                url : contextPath + '/' + lang + '/joinus',
		                data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
		                async : false,
		                success : function(data) {
	                    	if (data == 'success') {
	                        	document.getElementById("cUserName").value = "";
	                       	    document.getElementById("cPassword").value = "";
	                       	    document.getElementById("Confirm-Password").value = "";
	                        	$('#ef-form-application').submit();
	                            return;                            
	                        } else {
	                        	console.log(data);
	                        	$('#loading-overlay').modal('hide');
	                        	
								if (data == 'This username already in use, please try again') {
								    //$('.error-hide').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
								} else if (data == 'email address and mobile no. already registered') {
								    //$('.error-hide').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
								} else {
								    //$('.error-hide').html(data);
								}
	                            return;
	                        } 
	                    },
	                    error : function(xhr, status, error) {
	                    	$('#loading-overlay').modal('hide');
	                    }
	                });
				}else {
					$('#ef-form-application').submit();
				}
			}
		});
	}


	//Summary Form
	if($("#ef-form-summary").length > 0){
		$('#ccNumber').payment('formatCardNumber');

		$("#ef-form-summary").bootstrapValidator({
			fields:{
				cardNo:{
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
										if(cardtype == "mastercard"){
											$("#pMethod").val("Master");
										}else {
											$("#pMethod").val("VISA");
										}
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
							
						}
					}
				},
				cardHolder:{
					container:'#ccNameErrMsg',
					validators: {
						notEmpty:{
							message:'Please enter name printed on credit card.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.name.notNull.message")
						},
						callback:{
							message:"Name on credit card does not match with the applicant's name. Please try to use another credit card or contact our customer service at 3123 3123 for more details.",
							//message:getBundle(getBundleLanguage, "form.payment.cardholder.name.unmatch"),
							callback:function(e){
								if($("#ccName").data("bv.result.notEmpty") === "INVALID"){
									return true
								}

								//no appFirstName and appLastName
								/*if(application.common.validateCardHolder($("#appFirstName"),$("#appLastName"),$("#ccName"))){
									return true;
								}else{
									return false;
								}*/
								return true;
							}
						}
					}
				},
				securityCode: {
					container:'#cvvNumberErrMsg',
					validators: {
						notEmpty:{
							message:'Please enter security code on credit card.'
							//message:getBundle(getBundleLanguage, "applicant.creditcard.cvv.notNull.message")
						},
						/*cvv: {
							creditCardField: 'ccNumber',
							message: 'Your security code is invalid.'
						}*/
					}
				},
				epMonth:{
					container:'#expMonthErrMsg',
					validators: {
						notEmpty:{
							message:"Please specify your credit card's expiry month."
							//message:getBundle(getBundleLanguage, "applicant.creditcard.month.notNull.message")
						},
						callback:{
							callback:function(e){
								$("#expErrMsg").empty();
								$("#expMonthErrMsg > *").each(function(){
									$("#expErrMsg").append($(this).clone());
								});

								$("#expYearErrMsg > *").each(function(){
									$("#expErrMsg").append($(this).clone());
								});

								return true;
							}
						}
					}
				},
				epYear:{
					container:'#expYearErrMsg',
					validators: {
						notEmpty:{
							message:"Please specify your credit card's expiry year."
							//message:getBundle(getBundleLanguage, "applicant.creditcard.year.notNull.message")
						},
						callback:{
							callback:function(e){
								$("#expErrMsg").empty();
								$("#expMonthErrMsg > *").each(function(){
									$("#expErrMsg").append($(this).clone());
								});

								$("#expYearErrMsg > *").each(function(){
									$("#expErrMsg").append($(this).clone());
								});

								return true;
							}
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

		$(".eh-btn-next").on("click",function(){
			$('#ef-form-summary').bootstrapValidator('validate');
			if($('#ef-form-summary').data('bootstrapValidator').isValid()){
				//do something
				
				$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
	 			var form = $("#ef-form-summary");
	 			var geteWayUrl = $('#gateway').val();
	 			$.ajax({
					type : "POST",
					url : contextPath + "/ajax/homeliability/submitPolicy",
					data : form.serialize(),
					async : false,
					success : function(data) {
						clicked = false;
                    //$("#PaymentingDiv").hide();
						if (data.errMsgs == null) {
							setTimeout(function(){
								$("#ef-form-summary").attr('action', geteWayUrl);
							    document.getElementById('ef-form-summary').submit();
							}, 3000);
						} else {
							$('#loading-overlay').modal('hide');
							console.log(data.errMsgs);
							enablePayment=true;
							return false;
						}
					}
				});
				//alert("implement summary logic in here");
			}
		});
	}
	
	$("#ef-form-application").submit(function(e){
		$.ajax({
			type: "POST",
			url:contextPath+'/ajax/homeliability/processSummary',
			data: $('#ef-form-application').serialize(),
			success:function(data){
				if(data.errMsgs == null) {
					window.location= contextPath + "/" + lang + "/home-liability-insurance/summary";
					return true;
				}else {
					$('#loading-overlay').modal('hide');
					console.log('processSummary : ' + data.errMsgs);
					return false;
				}
			}
		});
		//alert("implement application logic in here");
	}); 
	
});


//select text function 
function autoSelect(id){
	var sel = window.getSelection(),
    range = document.createRange();
					
	range.setStart($("#"+id)[0].firstChild, 0);
	range.setEnd($("#"+id)[0].firstChild, $("#"+id)[0].firstChild.length);
	sel.removeAllRanges();
	sel.addRange(range);
	$("#copyTipBox").show();


	$("#toBeCopied").off("blur").on("blur",function(){
		$("#copyTipBox").hide();
	});
}

function centerModals($element) {
	var $modals;
	if ($element.length) {
	  $modals = $element;
	} else {
	  $modals = $('.modal-vcenter:visible');
	}
	$modals.each( function(i) {
	  var $clone = $(this).clone().css('display', 'block').appendTo('body');
	  var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	  top = top > 0 ? top : 0;
	  $clone.remove();
	  $(this).find('.modal-content').css("margin-top", top);
	});
}

function onClosed(valueText,inst){
	if(inst == "cancel" && $(this).val() == ""){
		$(this).parent().removeClass("is-dirty");
	}else{
		$(this).parent().addClass("is-dirty");

		try{
			$("#ef-form-application")
			.bootstrapValidator('updateStatus', $(this).attr("name"), 'NOT_VALIDATED')
			.bootstrapValidator('validateField', $(this).attr("name"));
		}catch(err){
		}
		
	}
	return true;
}

function shadowCopy(from,to){
	to.val(from.val());
	if($.trim(from.val()) == ""){
		to.parent().removeClass("is-dirty");
	}else{
		to.parent().addClass("is-dirty");
	}
}
