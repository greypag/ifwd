var APIServer = "";
var fwdApi = {
		url:{
			session						: APIServer + context + "/api/member/session",
			login						: APIServer + context + "/api/member/login",
			member						: APIServer + context + "/api/member",
			forgotPassword				: APIServer + context + "/api/member/forgotPassword",
			retrieveUserName			: APIServer + context + "/api/member/retrieveUserName",
		}
};

$(document).ready(function(){
	
	bsvFormLogin($("#form-motor-login"));
	bsvFormForgotUsername($('#form-motor-forgot-username'));
	bsvFormForgotPwd($('#form-motor-forgot-pwd'));
	bsvFormRegister($('#form-motor-register'));
	
	
	
	 $('#sendDriverDetail').on('click', function(e){
        e.preventDefault();
        $('#motor_registerForm').validator('validate');
    });
	
    $('#mortgageBank').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#mortgageBank-selectized').data('required-error', $('#mortgageBank').data('required-error'));
            $.ajax({
                url: '/api/iMotor/carDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('.occupation').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('.occupation').find('input[type="text"]').data('required-error', $('.occupation').data('required-error'));
            $.ajax({
                url: '/api/iMotor/driverDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('#district').selectize({
        valueField: '',
        labelField: '',
        searchField: '',
        create: false,
        preload: true,
        load: function(query, callback) {
            $('#district-selectized').data('required-error', $('#district').data('required-error'));
            $.ajax({
                url: '/api/iMotor/carDetails', //change to get api
                type: 'GET',
                dataType: 'json',
                data: {
                    model: query,
                },
                error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res);
                    }
            });
        }
    });
    $('#area').selectize({
        preload: true,
        load: function(query, callback) {
            $('#area-selectized').data('required-error', $('#area').data('required-error'));
        }
    });
    $('[name="bankMortgage"]').bootstrapSwitch({
        onText: '',
        offText: '',
		inverse: true,
        onSwitchChange: function(e, state){
            if(state)
                $('.mortgageBank').removeClass('hidden');
            else
				$('.mortgageBank').addClass('hidden');
               
        }
    });
    var totalDriver = $('.added-driver').length;
    var current = 0;
    $('#addDriver').on('click', function(e){
        e.preventDefault();
		$('#motor_registerForm #sendDriverDetail').addClass('disabled');
        if(current < totalDriver){
            $('.added-driver').eq(current).removeClass('hidden');
			$('.added-driver').eq(current).find('input').prop('required',true);
			$('.added-driver').eq(current).find('select').prop('required',true);
			$('#motor_registerForm').validator('update'); 
            if(current > 0){
                $('.added-driver').eq(current-1).find('.removeDriver').addClass('hidden');
            }
            current += 1;
            if (current == totalDriver) {
                $(this).addClass('hidden');
            }
        }
        // console.log(current);
    });
    $('.removeDriver').on('click', function(e){
        e.preventDefault();
        $(this).parents('.added-driver').find('input').prop('required',false);
		$(this).parents('.added-driver').find('select').prop('required',false);
        $(this).parents('.added-driver').find('input').val('');
        $(this).parents('.added-driver').find('input:checkbox').removeAttr('checked');
        $(this).parents('.added-driver').find('option').removeAttr('selected');
        $(this).parents('.added-driver').addClass('hidden');
        $(this).parents('.added-driver').prev().find('.removeDriver').removeClass('hidden');
		$('#motor_registerForm').validator('validate');
        if(current == totalDriver){
            $('#addDriver').removeClass('hidden');
        }
        current -= 1;
    });
    $('#sendDriverDetail').on('click', function(e){
        e.preventDefault();
    });
    	
    $('#closeUserName').on('click', function(e){
    $('#forgotUserNamePopup').addClass('hidden');
    });
    $('#closeUserPass').on('click', function(e){
    $('#forgotUserPassPopup').addClass('hidden');
    $('.loginPanel').css({'height':'auto'});
    });
    $('#forgotUserName').on('click', function(e){
         e.preventDefault();
    $('#forgotUserNamePopup').removeClass('hidden');
    });
    $('#link-forgotPassword').on('click', function(e){
         e.preventDefault();
    $('#forgotUserPassPopup').removeClass('hidden');
    $('.loginPanel').css({'height':'400'});
    
    });
 //member part
	function bsvFormLogin(form){
	//Bind Event
	form.find("input[name='userName']").on("keypress",function(evt){
		validationUsername(evt);
	});

	form.find(".btn-submit").on("click",function(){
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			
			//Save Login Username
			userName = $("#motorloginUsername").val();

			var postData = {
				userName:$("#motorloginUsername").val(),
				password:$("#motorloginPassword").val()
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
				error:function(xhr, textStatus, errorThrown){

					var resp = $.parseJSON(xhr.responseText);

					if(xhr.status == 400){
						$(".loginPanErrMsg").html($("<small/>").text(resp.message));	
					} else if(xhr.status == 401){
						$(".loginPanErrMsg").html($("<small/>").text(resp.message));	
					} else if(xhr.status == 500){
						$(".loginPanErrMsg").html($("<small/>").text(resp.message));	
					} else {
						console.log("unable to load API : "+ fwdApi.url.login);
					}
					$("#loading-overlay").modal("hide");
			    },
			    success:function(response){
			    	if(response){

			    		isLogged = true;
		    		
			    		$(".after-login").find(".fld-val").text(response.fullName);
			    		//userName = response.userName;
			    		$(".before-login").hide();
			    		$(".after-login").show();	
			    		$("#btn-motor-confirm").show();

			    		$("#loading-overlay").modal("hide");
			    		window.location.reload();
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
						message:getBundle(getBundleLanguage, "member.password.notNull.message")
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
					email:$("#motorForgotUsernameEmailAddress").val(),
					mobileNum:$("#motorForgotUsernameMobileNo").val()
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
					error:function(xhr, textStatus, errorThrown){

						var resp = $.parseJSON(xhr.responseText);

						$(".forgotUsernamePanErrMsg").append($("<small/>").text(resp.message));	
					},
					success:function(response){
						if(response){
							$(".your_username_box").removeClass("hide");
							$("#your_username").text(getBundle(getBundleLanguage, "member.login.forgotUserName.success") + " " + response.userName);
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
									errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notNull.message"));
									isValid = false;
								}else{
									if (mobile_pattern.test(val) == false) {
										errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notValidLength.message"));
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
									errMsg.text(getBundle(getBundleLanguage, "member.email.notNull.message"));
									isValid = false;
								}else{
									if (emailreg.test(val) == false) {
										errMsg.text(getBundle(getBundleLanguage, "member.email.notValid.message"));
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
		alert("API");
		form.data('bootstrapValidator').validate();
		if(form.data('bootstrapValidator').isValid()){
			var postData = {
				email:$("#motorForgotPwdEmailAddress").val(),
				mobileNum:$("#motorForgotPwdMobileNo").val(),
				userName:$("#motorForgotPwdUsername").val()
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
				error:function(xhr, textStatus, errorThrown){

					var resp = $.parseJSON(xhr.responseText);

					$(".forgotPwdPanErrMsg").append($("<small/>").text(resp.message));	
					$("#loading-overlay").modal("hide");
			    },
			    success:function(response){
					console.dir(response);
			    	if(response){		    		
			    		$(".forgotPwdPanErrMsg").append($("<small/>").text("Please check your email"));	
			    		$("#loading-overlay").modal("hide");
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
								errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notNull.message"));
								isValid = false;
							}else{
								if (mobile_pattern.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notValidLength.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.email.notNull.message"));
								isValid = false;
							}else{
								if (emailreg.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "member.email.notValid.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.username.notNull.message"));
								isValid = false;
							}else{
								if (isAccountNumeric(val)) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.pureNumeric.message"));
									isValid = false;
								} else if (!plan_user.test(val)) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.specialChars.message"));
									isValid = false;
								} else if(val.length < 6 || val.length > 50) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.notValidLength.message"));
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
				confirmPassword:$("#motorRegisterConfPass").val(),
				email:$("#motorRegisterEmailAddress").val(),
				fullName:$("#motorRegisterFullName").val(),
				mobileNo:$("#motorRegisterMobileNo").val(),
				optOut1:$("#checkbox3").val(),
				optOut2:$("#checkbox4").val(),
				password:$("#motorRegisterPassword").val(),
				userName:$("#motorRegisterUserName").val()
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
				error:function(xhr, textStatus, errorThrown){

					var resp = {message:"Unknown Error"};
					$(".regPanErrMsg").text('');
                    if (xhr.status == 406) {
                    	$(".regPanErrMsg").append($("<small/>").text(getBundle(getBundleLanguage, "member.registration.fail.username.registered")));
                    } else if (xhr.status == 409) {
                    	$(".regPanErrMsg").append($("<small/>").text(getBundle(getBundleLanguage, "member.registration.fail.emailMobile.registered")));
                    } else {
    					$(".regPanErrMsg").append($("<small/>").text(resp.message));	
                    }

					$("#loading-overlay").modal("hide");
			    },
			    success:function(response){
			    	if(response){
			    		isLogged = true;
			    		$(".after-login").find(".fld-val").text(response.fullName);
			    		userName = response.userName;
			    		//$(".before-login").hide();
			    		$(".after-login").show();
			    		$("#btn-motor-confirm").show();

			    		//$("#loading-overlay").modal("hide");
			    		
			    		//window.location.reload();
			    		
			    		//Simulate Login
			    		$("#motorloginUsername").val($("#motorRegisterUserName").val());
						$("#motorloginPassword").val($("#motorRegisterPassword").val());
						$("#btn-motor-login").trigger("click");
			    		
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
								errMsg.text(getBundle(getBundleLanguage, "member.name.notNull.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notNull.message"));
								isValid =  false;
							}else{
								if (mobile_pattern.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "member.mobileNo.notValidLength.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.email.notNull.message"));
								isValid = false;
							}else{
								if (emailreg.test(val) == false) {
									errMsg.text(getBundle(getBundleLanguage, "member.email.notValid.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.username.notNull.message"));
								isValid = false;
							}else{
								if (isAccountNumeric(val)) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.pureNumeric.message"));
									isValid = false;
								} else if (!plan_user.test(val)) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.specialChars.message"));
									isValid = false;
								} else if(val.length < 6 || val.length > 50) {
									errMsg.text(getBundle(getBundleLanguage, "member.username.notValidLength.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.password.notNull.message"));
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
								errMsg.text(getBundle(getBundleLanguage, "member.confirmPassword.notNull.message"));
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
						message:getBundle(getBundleLanguage, "member.declaration.tnc.notChecked.message")
					}
				}
			}
		}
	});
}	
	
	$(".btn-sub-pan-trigger").click(function(e){
		e.preventDefault();
		$(e.currentTarget).parents(".panel-body").find(".sub-pan").removeClass("show");
		$($(e.currentTarget).attr("href")).addClass("show");
		//Hide your_username_box
		$(".your_username_box").addClass("hide");
	});

	$(".btn-close-sub").click(function(e){
		e.preventDefault();
		$("#sub-pan-login").addClass("show");
	});
});
