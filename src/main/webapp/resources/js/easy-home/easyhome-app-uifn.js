var contextPath = context;
var lang = UILANGUAGE;
var nextPage = nextPage;
function showBubble(){
	if($("#donotWishDirectMarketing").prop('checked') || $("#donotDisclose").prop("checked")) {
		$(".checkboxBubble").fadeIn();
	}else{
		$(".checkboxBubble").fadeOut();
	}
}
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
	 
	 $(".mdl-textfield").each(function(){
		 
		 var p = $(this);
		 $(this).find("input").on('blur',function(e){
			 if($.trim($(e.currentTarget).val()) == ""){
				 $(e.currentTarget).val("");
				 p.removeClass("is-dirty");
			 }
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
	 	
	 	setInterval(function(){
	 		$(".app-selectplan-tab-body > .col-xs-3 .tabs-left").height($(".app-selectplan-tab-body > .col-xs-9").height());
	 	},500);
	 	
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


		$('#dob').mobiscroll().calendar({
			controls: ['date'],
			minDate:dob_start_date,
			maxDate:dob_end_date,
			showLabel: true,
			dateOrder: 'ddmmyy',	
        	dateFormat: 'dd-mm-yyyy',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed,
	        lang: UILANGUAGE  == "en" ? "en_fwd" : "zh_fwd"
		});
		
		//60 Days (today+59days)	
		var sixtyDays = new Date();
		sixtyDays.setDate(sixtyDays.getDate()+59);

		 $('#effectdate').mobiscroll().calendar({
			controls: ['date'],
		 	minDate:new Date(),
		 	maxDate:sixtyDays,
		 	showLabel: true,
		 	dateOrder: 'ddmmyy',
        	dateFormat: 'dd-mm-yyyy',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed,
	        lang: UILANGUAGE  == "en" ? "en_fwd" : "zh_fwd"
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
		 $("#hkId").on("keypress",function(e){
			 return hkidOnkeypress(e);
		 });
		 $("#hkID").on("keyup",function(e){
		 	$(e.currentTarget).val($(e.currentTarget).val().toUpperCase());
		 });
		$("#donotWishDirectMarketing, #donotDisclose").change(function() {
			if($(this).prop('checked')) {
				$(this).val('true');
			} else {
				$(this).val('false');
			}
			showBubble();
		});	
		 $("#ef-form-application").bootstrapValidator({
			fields:{
				applicantName:{
					container:'#applicantNameErrMsg',
					validators: {
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.full.name.empty")
							//message:getBundle(getBundleLanguage, "applicant.creditcard.name.notNull.message")
						},
						callback:{
							message:getBundle(getBundleLanguage, "form.full.name.invalid"),
							callback:function(){
								if($.trim($("#applicantName").val()) == ""){
									return true;
								}else{
									return application.common.validate($("#applicantName").val().replace(/ /g,''),"Alphabet");
								}
								
							}
						}
					}
				},
				dob:{
					container:'#dobErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.dob.empty")
						}
					}
				},
				apphkidandpassport:{
					container:'#apphkidandpassportErrMsg',
					validators:{
						notEmpty:{
							message:'Please select'
						},
						callback:{
							message:'',
							callback:function(){
								$("#ef-form-application").bootstrapValidator('validateField', 'hkId');
								return true;
							}
						}
					}
				},
				hkId:{
					container:'#hkIdErrMsg',
					validators:{
						callback:{
							message:'',
							callback:function(){
								var errElm = $("#hkId").parents(".form-group").find("small[data-bv-validator='callback']");
								
								if($("#apphkidandpassport").val() == "" || $("#apphkidandpassport").val() == null){									
									return true;
								}else{
									var isEmpty = $.trim($("#hkId").val()) == "";
									var val = $.trim($("#hkId").val());
									

									if($("#apphkidandpassport").val() == "appHkid"){
										var isValidHKID = IsHKID(val);

										if(isEmpty){
											errElm.text(getBundle(getBundleLanguage, "form.hkid.empty"));
											return false;
										}else if(!isValidHKID){
											errElm.text(getBundle(getBundleLanguage, "form.hkid.invalid"));
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
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.mobile.empty")
						},
						callback:{
							message:getBundle(getBundleLanguage, "form.mobile.invalid"),
							callback:function(a,b){

								
								var isValidMobile = application.common.validate($("#inputMobileNo").val(),"Mobileno");
								
								if(isValidMobile || $.trim($("#inputMobileNo").val()) == ""){
									return true;	
								}else{
									return false;
								}
							}
						}
					}
				},
				emailAddress:{
					container:'#emailAddressErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.email.empty")
						},
						emailAddress: {
                           message: getBundle(getBundleLanguage, "form.email.invalid")
                        }/*,
                        callback:{
                        	message:'',
                        	callback:function(){
                        		$("#ef-form-application").bootstrapValidator('updateStatus', 'mobileNo', 'NOT_VALIDATED').bootstrapValidator('validateField', "mobileNo")
                        		return true;
                        	}
                        }*/
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
                        	message:getBundle(getBundleLanguage, "form.building.estate.empty"),
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
                        	message:getBundle(getBundleLanguage, "form.building.estate.empty"),
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
							message:getBundle(getBundleLanguage, "form.address.district.empty")
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
							message:getBundle(getBundleLanguage, "form.address.area.empty")
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
                        	message:getBundle(getBundleLanguage, "form.building.estate.empty"),
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
                        	message:getBundle(getBundleLanguage, "form.building.estate.empty"),
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
							message:getBundle(getBundleLanguage, "form.address.district.empty"),
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
							message:getBundle(getBundleLanguage, "form.address.area.empty"),
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
							message:getBundle(getBundleLanguage, "form.net.floor.area.empty")
						}
					}
				},
				effectiveDate:{
					container:'#effectdateErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.home.effective.date.empty")
						}
					}
				},
				checkbox1:{
					container:'#declarrationErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.declaration.tnc.empty")
						}
					}
				},
				checkbox2:{
					container:'#declarration2ErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.declaration.pics.empty")
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

								if($.trim($("#cUserName").val()) == ""){
									$("#cUserName").parents(".form-group").find("small[data-bv-validator='callback']").text("");
									return true
								}
								
								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";

								if(noAccountInfo){
									return true;
								}else{
									var isValid = isValidUsername($.trim($("#cUserName").val()));
									if(isValid == true){
										/*$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED');*/

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

								if($.trim($("#cPassword").val()) == ""){
									$("#cPassword").parents(".form-group").find("small[data-bv-validator='callback']").text("");
									return true
								}
								
								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
								if(noAccountInfo){
									return true;
								}else{

									var isValid = isValidPassword($.trim($("#cPassword").val()));
									if(isValid == true){
										/*$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'Confirm-Password', 'NOT_VALIDATED');*/
										
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

								if($.trim($("#Confirm-Password").val()) == ""){
									$("#Confirm-Password").parents(".form-group").find("small[data-bv-validator='callback']").text("")
									return true
								}
								
								var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
								if(noAccountInfo){
									return true;
								}else{
									
									var isValid = passMatch($.trim($("#cPassword").val()),$.trim($("#Confirm-Password").val()));
									if(isValid == true){
										/*$("#ef-form-application")
										.bootstrapValidator('updateStatus', 'userName', 'NOT_VALIDATED')
										.bootstrapValidator('updateStatus', 'password', 'NOT_VALIDATED');*/

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
			
			$('#ef-form-application').bootstrapValidator('updateStatus', 'hkId', 'NOT_VALIDATED').bootstrapValidator('validate');
			if($('#ef-form-application').data('bootstrapValidator').isValid()){
				//do something
				$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
				
				
				var noAccountInfo = $.trim($("#cUserName").val()) == "" && $.trim($("#cPassword").val()) == "" && $.trim($("#Confirm-Password").val()) == "";
				if(noAccountInfo) {
					$('#ef-form-application').submit();
				}else {
					if(!validAccountInfo()){
						$('#loading-overlay').modal('hide');
						return false;
					}
					
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
									showSubmitError(getBundle(getBundleLanguage, "member.registration.fail.username.registered"), true);
								} else if (data == 'email address and mobile no. already registered') {
									//$('.error-hide').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
									showSubmitError(getBundle(getBundleLanguage, "member.registration.fail.emailMobile.registered"), true);
								} else {
									//$('.error-hide').html(data);
									showSubmitError(data, true);
								}
								return;
							} 
						},
						error : function(xhr, status, error) {
							$('#loading-overlay').modal('hide');
						}
					});
				}
			}else{
				//inValid
				var errElm = $($(".form-group.has-error").get(0));
				$.scrollTo(errElm, 800,{offset:{top:-50}});
			}
		});
	}


	//Summary Form
	if($("#ef-form-summary").length > 0){
		$('#ccNumber').payment('formatCardNumber');

		$('#ccNumber').keyup(function() {
	        var replaceSpace = $(this).val(); 
	        var result = replaceSpace.replace(/\s/g,'');
	        $("#cardNo").val(result);
	    });
		
		$("#ef-form-summary").bootstrapValidator({
			fields:{
				ccNumber:{
					container:'#ccNumberErrMsg',
					validators:{
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.credit.card.number.empty")
						},
						callback:{
							message:getBundle(getBundleLanguage, "form.credit.card.number.invalid"),
							//message:getBundle(getBundleLanguage, "applicant.creditcard.notValid.message"),
							callback:function(e){
								if($("#ccNumber").data("bv.result.notEmpty") === "INVALID"){
									return true
								}
								//var cardtype = "";
								//$(".cardtype").find("span").removeClass("detected");
								//cardtype = $("#ccNumber").hasClass("visa")?"visa":$("#ccNumber").hasClass("mastercard")?"mastercard":"";
								//if(cardtype != ""){
								//	if($.payment.validateCardNumber($("#ccNumber").val())){
								//		$(".cardtype").find("span."+cardtype).addClass("detected");
								//		if(cardtype == "mastercard"){
								//			$("#pMethod").val("Master");
								//		}else {
								//			$("#pMethod").val("VISA");
								//		}
								//		return true;
								//	}else{
								//		return false;
								//	}									
								//}else{
								//	return false;
								//}

								var cc = $('#ccNumber').val();
								if( fwdPayment.isValid(cc) ){
									$(".cardtype").find("span").removeClass("detected");
									$(".cardtype").find("span").removeClass("detected-n");
									if( fwdPayment.isMaster(cc) ){
										$("#pMethod").val("Master");
										$(".cardtype").find("span.mastercard").addClass("detected");
										$(".cardtype").find("span.visa").addClass("detected-n");
									} else {
										$("#pMethod").val("VISA");
										$(".cardtype").find("span.visa").addClass("detected");
										$(".cardtype").find("span.mastercard").addClass("detected-n");
									}
									$(".cardtype").find("span.cardtype-slash").addClass("detected-n");
									return true;
								} else {
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
							message:getBundle(getBundleLanguage, "form.credit.card.name.empty")
						},
						callback:{
							//message:"Name on credit card does not match with the applicant's name. Please try to use another credit card or contact our customer service at 3123 3123 for more details.",
							message:getBundle(getBundleLanguage, "form.payment.cardholder.name.unmatch"),
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
							message:getBundle(getBundleLanguage, "form.credit.card.cvv.empty")
						},
						callback: {
							message: getBundle(getBundleLanguage, "form.credit.card.cvv.invalid"),
							callback: function(value, validator) {
                           		return /^[0-9]{3,4}$/.test(value);
							}
						}
					}
				},
				epMonth:{
					container:'#expMonthErrMsg',
					validators: {
						notEmpty:{
							message:getBundle(getBundleLanguage, "form.credit.card.expiry.month.empty")
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
							message:getBundle(getBundleLanguage, "form.credit.card.expiry.year.empty")
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
							message:getBundle(getBundleLanguage, "form.declaration.payment.empty")
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
					url : contextPath + "/ajax/" + plan + "/submitPolicy",
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
							showSubmitError(data.errMsgs, true);
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
			url:contextPath+'/ajax/' + plan + '/processSummary',
			data: $('#ef-form-application').serialize(),
			success:function(data){
				if(data.errMsgs == null) {
					window.location= contextPath + "/" + lang + "/household-insurance/" + plan + "/summary";
					return true;
				}else {
					$('#loading-overlay').modal('hide');
					console.log('processSummary : ' + data.errMsgs);
					showSubmitError(data.errMsgs, true);
					return false;
				}
			}
		});
		//alert("implement application logic in here");
	}); 
	
});

function validAccountInfo(){
	var result = true;
	var userNameValid = isValidUsername($.trim($("#cUserName").val()));
	var passwordValid = isValidPassword($.trim($("#cPassword").val()));
	var cPasswordValid = passMatch($.trim($("#cPassword").val()),$.trim($("#Confirm-Password").val()));
	if(userNameValid != true) {
		$("#cUserName").parents(".form-group").find("small[data-bv-validator='callback']").text(userNameValid);
		$("#cUserName").parents(".form-group").find("small[data-bv-validator='callback']").css("display","block");
		result = false;
	}
	if(passwordValid != true){
		$("#cPassword").parents(".form-group").find("small[data-bv-validator='callback']").text(passwordValid);
		$("#cPassword").parents(".form-group").find("small[data-bv-validator='callback']").css("display","block");
		result = false;
	}
	if(cPasswordValid != true){
		$("#Confirm-Password").parents(".form-group").find("small[data-bv-validator='callback']").text(cPasswordValid);
		$("#Confirm-Password").parents(".form-group").find("small[data-bv-validator='callback']").css("display","block");
		result = false;
	}
	return result;
}

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


/**
 * Copyright (c) 2007-2015 Ariel Flesler - aflesler<a>gmail<d>com | http://flesler.blogspot.com
 * Licensed under MIT
 * @author Ariel Flesler
 * @version 2.1.2
 */
;(function(f){"use strict";"function"===typeof define&&define.amd?define(["jquery"],f):"undefined"!==typeof module&&module.exports?module.exports=f(require("jquery")):f(jQuery)})(function($){"use strict";function n(a){return!a.nodeName||-1!==$.inArray(a.nodeName.toLowerCase(),["iframe","#document","html","body"])}function h(a){return $.isFunction(a)||$.isPlainObject(a)?a:{top:a,left:a}}var p=$.scrollTo=function(a,d,b){return $(window).scrollTo(a,d,b)};p.defaults={axis:"xy",duration:0,limit:!0};$.fn.scrollTo=function(a,d,b){"object"=== typeof d&&(b=d,d=0);"function"===typeof b&&(b={onAfter:b});"max"===a&&(a=9E9);b=$.extend({},p.defaults,b);d=d||b.duration;var u=b.queue&&1<b.axis.length;u&&(d/=2);b.offset=h(b.offset);b.over=h(b.over);return this.each(function(){function k(a){var k=$.extend({},b,{queue:!0,duration:d,complete:a&&function(){a.call(q,e,b)}});r.animate(f,k)}if(null!==a){var l=n(this),q=l?this.contentWindow||window:this,r=$(q),e=a,f={},t;switch(typeof e){case "number":case "string":if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(e)){e= h(e);break}e=l?$(e):$(e,q);case "object":if(e.length===0)return;if(e.is||e.style)t=(e=$(e)).offset()}var v=$.isFunction(b.offset)&&b.offset(q,e)||b.offset;$.each(b.axis.split(""),function(a,c){var d="x"===c?"Left":"Top",m=d.toLowerCase(),g="scroll"+d,h=r[g](),n=p.max(q,c);t?(f[g]=t[m]+(l?0:h-r.offset()[m]),b.margin&&(f[g]-=parseInt(e.css("margin"+d),10)||0,f[g]-=parseInt(e.css("border"+d+"Width"),10)||0),f[g]+=v[m]||0,b.over[m]&&(f[g]+=e["x"===c?"width":"height"]()*b.over[m])):(d=e[m],f[g]=d.slice&& "%"===d.slice(-1)?parseFloat(d)/100*n:d);b.limit&&/^\d+$/.test(f[g])&&(f[g]=0>=f[g]?0:Math.min(f[g],n));!a&&1<b.axis.length&&(h===f[g]?f={}:u&&(k(b.onAfterFirst),f={}))});k(b.onAfter)}})};p.max=function(a,d){var b="x"===d?"Width":"Height",h="scroll"+b;if(!n(a))return a[h]-$(a)[b.toLowerCase()]();var b="client"+b,k=a.ownerDocument||a.document,l=k.documentElement,k=k.body;return Math.max(l[h],k[h])-Math.min(l[b],k[b])};$.Tween.propHooks.scrollLeft=$.Tween.propHooks.scrollTop={get:function(a){return $(a.elem)[a.prop]()}, set:function(a){var d=this.get(a);if(a.options.interrupt&&a._last&&a._last!==d)return $(a.elem).stop();var b=Math.round(a.now);d!==b&&($(a.elem)[a.prop](b),a._last=this.get(a))}};return p});
