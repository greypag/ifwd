/*** This part may need move to JSP??? ***/
var language = "EN";
var typeId = "SAVIE_OFFLINE";
var APIServer = "";
var fwdApi = {
		url:{
			getAvailableCentre			: APIServer + context + "/api/appointment/centre",
			findAvailableDateByCentre	: APIServer + context + "/api/appointment/timeSlotEntity",
			findAvailableTimeByCentre 	: APIServer + context + "/api/appointment/timeSlotEntity",
			appointment					: APIServer + context + "/api/appointment",
			session						: APIServer + context + "/api/member/session",
			login						: APIServer + context + "/api/member/login",
			member						: APIServer + context + "/api/member",
			forgotPassword				: APIServer + context + "/api/member/forgotPassword",
			retrieveUserName			: APIServer + context + "/api/member/retrieveUserName",
			planDetails					: APIServer + context + "/api/provie/planDetails"
		}
};

var isLogged = false;
var userName = "";
var IMG_DIR = context + "/resources/images";

$(document).ready(function(){

	//Select Plan
	if($(".provie-plan-select").length > 0){

		$('#plan-dob-datepicker').mobiscroll().calendar({
			controls: ['date'],
		 	maxDate:new Date(),
		 	showLabel: true,
		 	dateOrder: 'ddmmyy',
        	dateFormat: 'dd-mm-yyyy',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed,
	        lang: UILANGUAGE  == "en" ? "en_fwd" : "zh_fwd"
		});

		$("#type-of-extra-rider").change(function(e){

			var cls = $(e.currentTarget).find("option:selected").data("cls");
			console.log(cls);
			$(".er-color-swap").each(function(){
				$(this).removeClass("p50 p100 p500");
				$(this).addClass(cls);
			});
		});

		$("#type-of-extra-rider").trigger("change");


		$("#after-5-years-container").on("shown.bs.collapse",function(){
        	$(window).resize();
        });
		
		
		$("#plan-calculate-btn").click(function(){
			if($('#promoCode').val()!='' && $('#promoCodeErrorMsg').hasClass('hidden')){
				$('#promoCodeErrorMsg').removeClass('hidden');
			}else if ($('#promoCode').val()!='' && !$('#promoCodeErrorMsg').hasClass('hidden')){
				//do nothing
			}else{
				$('#promoCodeErrorMsg').addClass('hidden');
			}
			
			
			var paymentMethod = $("#type-of-payment option:selected").data("val").split("-"); 
			$.ajax({
			    beforeSend:function(){
			    	$("#loading-overlay").modal("show");
			    },
				url:fwdApi.url.planDetails,
				type:"get",
				data:{
					premium: (paymentMethod[0] == "rp") ? $("#amount-slide-holder input").val() : $("#plan-amount").val(),
					planCode:paymentMethod[0],
					currency:paymentMethod[1],
					dob:$("#plan-dob-datepicker").val(),
					rider:$("#type-of-extra-rider").val()
				},	
				cache:false,
				async:false,
				error:function(){
					console.log("expected error");
			    },
			    success:function(response){
			    	if(response){
			    		
			    		$("table.tbl_desktop tbody").empty();
			    		$("table.tbl_mob tbody").empty();
			    		$("table.tbl_mob_header tbody").empty();
			    		
			    		console.log(response.plans);
			    		for(var i = 0; i <response.plans.length; i++){
			    			var plan = response.plans[i];
			    			console.log(plan);
			    			var dt = $("#template .tbl_desktop").clone();
			    			var mob_head = $("#template .tbl_mob_header").clone();
			    			var mob = $("#template .tbl_mob").clone();
			    			
			    			dt.find(".premiumYear").text(plan.premiumYear);
			    			mob_head.find(".premiumYear").text(plan.premiumYear);
			    			
			    			dt.find(".rate").text(plan.rate);
			    			mob.find(".rate").text(plan.rate);
			    			
			    			dt.find(".totalPaid").text(plan.totalPaid);
			    			mob.find(".totalPaid").text(plan.totalPaid);
			    			
			    			dt.find(".accountValue").text(plan.accountValue);
			    			mob.find(".accountValue").text(plan.accountValue);
			    			
			    			dt.find(".deathBenefit").text(plan.deathBenefit);
			    			mob.find(".deathBenefit").text(plan.deathBenefit);
			    			
			    			dt.find(".riderValue").text(plan.riderValue);
			    			mob.find(".riderValue").text(plan.riderValue);
			    			
			    			console.log(dt);
			    			
			    			$("table.tbl_desktop tbody").append(dt);
			    			$("table.tbl_mob_header tbody").append(mob_head);
			    			$("table.tbl_mob tbody").append(mob);
			    		}
			    	}
			    	
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
			
		});
		
		

		
	}

	//Appointment
	if($(".provie-plan-appointment").length > 0){
		
		
		

		$('#app-date').mobiscroll().calendar({
			controls: ['date'],
		 	minDate:new Date(),
		 	showLabel: true,
		 	dateOrder: 'ddmmyy',
        	dateFormat: 'dd-mm-yyyy',
        	invalid:["w0","w1","w2","w3","w4","w5","w6"],
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onSelect:function(d){

	        	$.ajax({
				    beforeSend:function(){
				    	$("#loading-overlay").modal("show");
				    },
					url:fwdApi.url.findAvailableTimeByCentre,
					type:"get",
					data:{
						type:typeId,
						date:d,
						centreCode:$("#centre").val()
					},	
					cache:false,
					async:false,
					error:function(){
						alert("something error");
				    },
				    success:function(response){
				    	if(response){
				    		$("#preferred-time").empty();
				    		
				    		if(response.length > 0){
				    			for(var i in response){
					    			var d = response[i];
					    			var option = $("<option/>");
					    			option.data(d);
					    			option.val(d.timeSlot);
					    			option.text(d.timeSlot);
					    			
					    			$("#preferred-time").append(option);
					    		}
				    		}else{
				    			 $("#preferedTimeIsNull").modal("show");
				    		}
				    		
				    	}
				    	
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
	        },
	        lang: UILANGUAGE  == "en" ? "en_fwd" : "zh_fwd"
		});


		$(".btn-sub-pan-trigger").click(function(e){
			e.preventDefault();
			$(e.currentTarget).parents(".panel-body").find(".sub-pan").removeClass("show");
			$($(e.currentTarget).attr("href")).addClass("show");
		});

		$(".btn-close-sub").click(function(e){
			e.preventDefault();
			$("#sub-pan-login").addClass("show");
		});



		$("#checkbox3, #checkbox4").change(function() {
			showBubble();
		});


		$('[data-toggle="popover"]').popover();

		bsvFormLogin($("#form-appointment-login"));
		bsvFormForgotUsername($('#form-appointment-forgot-username'));
		bsvFormForgotPwd($('#form-appointment-forgot-pwd'));
		bsvFormRegister($('#form-appointment-register'));

		$("#btn-appointment-confirm").on('click', function(){
			var isValid = true;
			$(".centreErrMsg, .app-dateErrMsg, .preferred-timeErrMsg, .generalErrMsg").empty();
			if($("#centre").val() == ""){
				isValid = false;
				$(".centreErrMsg").append($("<small/>").text("Please select customer service centre"));
			}

			if($("#app-date").val() == ""){
				isValid = false;
				$(".app-dateErrMsg").append($("<small/>").text("Please select preferred date"));	
			}

			if($("#preferred-time").val() == ""){
				isValid = false;
				$(".preferred-timeErrMsg").append($("<small/>").text("Please select preferred time"));	
			}

			if(!isLogged){
				isValid = false;
				$(".generalErrMsg").append($("<small/>").text("Please select log in / register "));	
				
			}

			if(isValid){
				var postData = {
					preferredDate:$("#app-date").val(),
					preferredTime:$("#preferred-time").val(),
					centreCode:$("#centre").val(),
					planCode:"PROVIE-SP",
					userName:userName,
					type:typeId
				}
				$.ajax({
					beforeSend:function(){
						$("#loading-overlay").modal("show");
					},
					url:fwdApi.url.appointment,
					type:"post",
					contentType: "application/json",
					data:JSON.stringify(postData),
					cache:false,
					async:false,
					error:function(response){
						console.log(response);
						if(response.responseJSON){
							$(".generalErrMsg").append($("<small/>").text(response.responseJSON.message));
						}
						
				    },
				    success:function(response){
				    	
				    	if(response){
				    		window.location.href= context + "/" + language + "/savings-insurance/provie/confirmation-appointment-sp?referenceNum=" + response.referenceNum;
				    	}
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
			}
		});

		//Bind on Change function
		$("#centre").change(function(e){
			var s = $(e.currentTarget);
			
			var d;
			s.find("option:selected").each(function(){
				d = $(this).data();
			});
			
			//Switch Image/ Address etc.
			if(d){
				$(".img-centre").attr("src", IMG_DIR + '/csc/' + d.photo);
				
				$(".centre-address").text(d.address);
				$(".viewmap-link").attr("href",d.map);
				
				
				$.ajax({
					beforeSend:function(){
						$("#loading-overlay").modal("show");
					},
					url:fwdApi.url.findAvailableDateByCentre,
					type:"get",
					contentType: "application/json",
					data:{type:typeId,centreCode:d.serviceCentreCode,date:""},
					cache:false,
					async:false,
					error:function(){
						alert("something error");
				    },
				    success:function(response){
				    	$("#preferedTimeIsNull").modal("show");
				    	if(response){
				    		
				    		if(response.length > 0){
				    			var dates = [];
					    		for(var i in response){
					    			var d = response[i];
					    			var from = d.date.split("-");
					    			dates.push(new Date(from[2],from[1] -1, from[0]));
					    		}
					    		//dates.push(new Date(2016,8,1));
					    		changeAppointmentDate('#app-date',dates);
				    		}else{
				    			 $("#preferedTimeIsNull").modal("show");
				    		}
				    		
				    	}
				    	
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
			}
			
		});
		
		//Check UserLogin
			
		$.ajax({
			url:fwdApi.url.session,
			type:"get",
			contentType: "application/json",
			data:{typeId:typeId,language:language},
			cache:false,
			async:false,
			error:function(){
				$(".before-login").show();
		    },
		    success:function(response){
		    	if(response){
		    		isLogged = true;
		    		
		    		$(".after-login").find(".fld-val").text(response.fullName);
		    		userName = response.userName;
		    		$(".after-login").show();
		    		$("#btn-appointment-confirm").show();
		    	}
		    	
		    }
		});
		
		

		
		//Get Available Centre
		$.ajax({
			beforeSend:function(){
				$("#loading-overlay").modal("show");
			},
			url:fwdApi.url.getAvailableCentre,
			type:"get",
			contentType: "application/json",
			data:{type:typeId,language:language},
			cache:false,
			async:false,
			error:function(){
				alert("something error");
		    },
		    success:function(response){
		    	
		    	if(response){
		    		$("#centre").empty();
		    		/*var o0 = $("<option/>");
		    		o0.text("Option0");
		    		o0.data({abc:1});
		    		$("#centre").append(o0);*/
		    		
		    		if(response.length > 0){
		    			for(var i in response){
			    			var centre = response[i];
			    			console.log(centre);
			    			var option = $("<option/>");
			    			option.text(centre.serviceCentreName);
			    			option.val(centre.serviceCentreCode);
			    			option.data(centre);
			    			$("#centre").append(option);
			    			
			    		}
			    		
			    		$("#centre").change();
		    		}else{
		    			$("#fullyBooked").modal('show');
		    		}
		    		
		    		
		    	}
		    },
		    complete:function(){
		    	$("#loading-overlay").modal("hide");
		    }
		});
	}
	
	//Confirmation Page
	if($("#appointment-confirmation-page").length > 0){
		var referenceNum;
		try{
			referenceNum = getParameterByName("referenceNum");
		}catch(e){}
		$(".policy-number").text(referenceNum);
		
		$.ajax({
			url:fwdApi.url.appointment,
			type:"get",
			contentType: "application/json",
			data:{referenceNum:referenceNum},
			cache:false,
			async:false,
			error:function(){
				$(".before-login").show();
		    },
		    success:function(response){
		    	if(response){
		    		console.log(response);
		    	}
		    	
		    }
		});
		
		
	}
});



function bsvFormLogin(form){
	//Bind Event
	form.find("input[name='userName']").on("keypress",function(evt){
		validationUsername(evt);
	});

	form.find(".btn-submit").on("click",function(){
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			
			//Save Login Username
			userName = $("#appointmentloginUsername").val();

			var postData = {
				userName:$("#appointmentloginUsername").val(),
				password:$("#appointmentloginPassword").val()
			}
			$.ajax({
				beforeSend:function(){
					$("#loading-overlay").modal("show");
				},
				url:fwdApi.url.login,
				type:"post",
				contentType: "application/json",
				data:JSON.stringify(postData),
				cache:false,
				async:false,
				error:function(response){
					$(".loginPanErrMsg").append($("<small/>").text(response.responseJSON.message));	
			    },
			    success:function(response){
			    	if(response){

			    		isLogged = true;
		    		
			    		$(".after-login").find(".fld-val").text(response.fullName);
			    		//userName = response.userName;
			    		$(".before-login").hide();
			    		$(".after-login").show();	
			    		$("#btn-appointment-confirm").show();

			    	}
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
		
	});

	form.bootstrapValidator({
		fields:{
			userName:{
				container:'.userNameErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;

							var elm = form.find("input[name='userName']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");
							
							var isValidUname = isValidUsername(val);
							console.log(isValidUname);
							if(isValidUname != true){
								errMsg.text(isValidUname);
								isValid = false;
							}

							return isValid;
						}
					}
				}
			},

			password:{
				container:'.passwordErrMsg',
				validators:{
					notEmpty:{
						message:getBundle(getBundleLanguage, "form.credit.card.number.empty")
					}
				}
			}
		}
	});
}

function bsvFormForgotUsername(form){

	form.find(".btn-submit").on("click",function(){
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			var postData = {
				email:$("#appointmentForgotUsernameEmailAddress").val(),
				mobileNum:$("#appointmentForgotUsernameMobileNo").val()
			}
			$.ajax({
				beforeSend:function(){
					$("#loading-overlay").modal("show");
				},
				url:fwdApi.url.retrieveUserName,
				type:"get",
				contentType: "application/json",
				data:postData,
				cache:false,
				async:false,
				error:function(response){
					$(".forgotUsernamePanErrMsg").append($("<small/>").text(response.responseJSON.message));	
			    },
			    success:function(response){
			    	if(response){		    		
			    		$(".forgotUsernamePanErrMsg").append($("<small/>").text("Please check your email"));	
			    	}
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
		
	});

	form.find("input[name='mobileNo']").on("keypress",function(evt){
		return isNumeric(evt);
	});

	form.find("input[name='emailAddress']").on("keypress",function(evt){
		return validationEmail(evt);
	});



	form.bootstrapValidator({
		fields:{
			mobileNo:{
				container:'.mobileNoErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;
							
							var elm = form.find("input[name='mobileNo']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (mobile_pattern.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			},

			emailAddress:{
				container:'.emailAddressErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='emailAddress']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (emailreg.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			}
		}
	});
}

function bsvFormForgotPwd(form){

	form.find("input[name='mobileNo']").on("keypress",function(evt){
		return isNumeric(evt);
	});

	form.find("input[name='emailAddress']").on("keypress",function(evt){
		return validationEmail(evt);
	});

	form.find("input[name='userName']").on("keypress",function(evt){
		return validationUsername(evt);
	});

	form.find(".btn-submit").on("click",function(){
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			var postData = {
				email:$("#appointmentForgotPwdEmailAddress").val(),
				mobileNum:$("#appointmentForgotPwdMobileNo").val(),
				userName:$("#appointmentForgotPwdUsername").val()
			}
			$.ajax({
				beforeSend:function(){
					$("#loading-overlay").modal("show");
				},
				url:fwdApi.url.forgotPassword,
				type:"get",
				contentType: "application/json",
				data:postData,
				cache:false,
				async:false,
				error:function(response){
					$(".forgotPwdPanErrMsg").append($("<small/>").text(response.responseJSON.message));	
			    },
			    success:function(response){
			    	if(response){		    		
			    		$(".forgotPwdPanErrMsg").append($("<small/>").text("Please check your email"));	
			    	}
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
		
	});

	form.bootstrapValidator({
		fields:{
			mobileNo:{
				container:'.mobileNoErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;
							
							var elm = form.find("input[name='mobileNo']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (mobile_pattern.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			},

			emailAddress:{
				container:'.emailAddressErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;
							
							var elm = form.find("input[name='emailAddress']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (emailreg.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			},

			userName:{
				container:'.userNameErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='userName']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (isAccountNumeric(val)) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								} else if (!plan_user.test(val)) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								} else if(val.length < 6 || val.length > 50) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			}
		}
	});
}

function bsvFormRegister(form){

	form.find(".btn-submit").on("click",function(){
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			var postData = {
				confirmPassword:$("#appointmentRegisterConfPass").val(),
				email:$("#appointmentRegisterEmailAddress").val(),
				fullName:$("#appointmentRegisterFullName").val(),
				mobileNo:$("#appointmentRegisterMobileNo").val(),
				optOut1:$("#checkbox3").val(),
				optOut2:$("#checkbox4").val(),
				password:$("#appointmentRegisterPassword").val(),
				userName:$("#appointmentRegisterUserName").val()
			}
			$.ajax({
				beforeSend:function(){
					$("#loading-overlay").modal("show");
				},
				url:fwdApi.url.member,
				type:"post",
				contentType: "application/json",
				data:JSON.stringify(postData),
				cache:false,
				async:false,
				error:function(response){
					$(".regPanErrMsg").append($("<small/>").text(response.responseJSON.message));	
			    },
			    success:function(response){
			    	if(response){

			    		isLogged = true;
		    			console.log(response);
			    		$(".after-login").find(".fld-val").text(response.fullName);
			    		userName = response.userName;
			    		$(".before-login").hide();
			    		$(".after-login").show();
			    		$("#btn-appointment-confirm").show();

			    	}
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
		}
		
	});

	form.find("input[name='EmailAddress']").on("keypress",function(evt){
		return validationEmail(evt);
	});

	form.find("input[name='userName']").on("keypress",function(evt){
		return validationUsername(evt);
	});

	form.bootstrapValidator({
		fields:{
			fullName:{
				container: ".FullNameErrMsg",
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;
							
							var elm = form.find("input[name='fullName']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");
							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid =  false;
							}

							return isValid;
						}
					}
				}
			},

			mobileNo:{
				container:'.mobileNoErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){

							var isValid = true;
							
							var elm = form.find("input[name='mobileNo']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid =  false;
							}else{
								if (mobile_pattern.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.invalid"));
									isValid =  false;
								}
							}

							return isValid;
						}
					}
				}
			},

			EmailAddress:{
				container:'.EmailAddressErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='EmailAddress']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (emailreg.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			},

			userName:{
				container:'.userNameErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='userName']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								if (isAccountNumeric(val)) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								} else if (!plan_user.test(val)) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								} else if(val.length < 6 || val.length > 50) {
									errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
									isValid = false;
								}
							}

							return isValid;
						}
					}
				}
			},

			password:{
				container:'.passwordErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='password']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								var isValidPwd = isValidPassword(val);

								if(isValidPwd != true){
									errMsg.text(isValidPwd);
									return false;
								}

							}

							return isValid;
						}
					}
				}
			},

			confirmPassword:{
				container:'.confirmPasswordErrMsg',
				validators:{
					callback:{
						message:'',
						callback:function(){
							var isValid = true;
							
							var elm = form.find("input[name='confirmPassword']");
							var val = $.trim(elm.val());
							var errMsg = elm.parents(".form-group").find("small[data-bv-validator='callback']");

							if(val == ""){
								errMsg.text(getBundle(getBundleLanguage, "form.credit.card.number.empty"));
								isValid = false;
							}else{
								var isValidConfirmPwd = passMatch($.trim(form.find("input[name='password']").val()),val);

								if(isValidConfirmPwd != true){
									errMsg.text(isValidConfirmPwd);
									return false;
								}

							}

							return isValid;
						}
					}
				}
			},

			checkbox1:{
				container:'.checkbox1ErrMsg',
				validators:{
					notEmpty:{
						message:getBundle(getBundleLanguage, "form.credit.card.number.empty")
					}
				}
			}
		}
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

function changeAppointmentDate(elm,dates){
	var inst = $(elm).mobiscroll('getInst');
	inst.clear();
	inst.option({
		valid:dates,
		minDate:dates[0]
	});

}

function showBubble(){
	if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
		$(".checkboxBubble").fadeIn();
	}else{
		$(".checkboxBubble").fadeOut();
	}
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}