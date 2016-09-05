/*** This part may need move to JSP??? ***/
var language = "EN";
var typeId = "SAVIE_OFFLINE";
var fwdApi = {
		url:{
			getAvailableCentre			:"http://localhost:7000/fwdhk/api/appointment/centre",
			findAvailableDateByCentre	:"http://localhost:7000/fwdhk/api/appointment/timeSlotEntity",
			findAvailableTimeByCentre 	:"http://localhost:7000/fwdhk/api/appointment/timeSlotEntity",
			appointment					:"http://localhost:7000/fwdhk/api/appointment",
			session						:"http://localhost:7000/fwdhk/api/member/session",
			login						:"http://localhost:7000/fwdhk/api/member/login",
			member						:"http://localhost:7000/fwdhk/api/member",
			forgotPassword				:"http://localhost:7000/fwdhk/api/member/forgotPassword",
			retrieveUserName			:"http://localhost:7000/fwdhk/api/member/retrieveUserName"
		}
};

var isLogged = false;
var userName = "";
var IMG_DIR = context + "/resources/images";

$(document).ready(function(){

	//Select Plan
	if($(".provie-plan-select").length > 0){

		$('#plan-dob-date').mobiscroll().calendar({
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

			var cls = $(e.currentTarget).val();
			$(".er-color-swap").each(function(){
				$(this).removeClass("p50 p100 p500");
				$(this).addClass(cls);
			});
		});

		$("#type-of-extra-rider").trigger("change");


		$("#after-5-years-container").on("shown.bs.collapse",function(){
        	$(window).resize();
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
				    		for(var i in response){
				    			var d = response[i];
				    			var option = $("<option/>");
				    			option.data(d);
				    			option.val(d.timeSlot);
				    			option.text(d.timeSlot);
				    			
				    			$("#preferred-time").append(option);
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
				    		console.log(response);
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
					data:{type:typeId,centreCode:d.serviceCentreCode,date:"15-07-2016"},
					cache:false,
					async:false,
					error:function(){
						alert("something error");
				    },
				    success:function(response){
				    	if(response){
				    		var dates = [];
				    		for(var i in response){
				    			var d = response[i];
				    			var from = d.date.split("-");
				    			dates.push(new Date(from[2],from[1] -1, from[0]));
				    		}
				    		//dates.push(new Date(2016,8,1));
				    		changeAppointmentDate('#app-date',dates);
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
		    	}
		    },
		    complete:function(){
		    	$("#loading-overlay").modal("hide");
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
			    		userName = response.userName;
			    		$(".before-login").hide();
			    		$(".after-login").show();	

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