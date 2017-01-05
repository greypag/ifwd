/*** This part may need move to JSP??? ***/
var typeId = "WEATHREE_OFFLINE";
var language="EN";
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
		}
};

var isLogged = false;
var userName = "";
var IMG_DIR = context + "/resources/images";

var allCentreObj = {};
//var planCode = "<%= (String) request.getParameter('planCode')%>";


// 18 year ago date
var dob_end_date = new Date();
dob_end_date.setFullYear(dob_end_date.getFullYear()-18);

// 60 year ago date
var dob_start_date = new Date();
dob_start_date.setFullYear(dob_start_date.getFullYear()-60);
dob_start_date.setDate(dob_start_date.getDate()+1);

$(document).ready(function(){

	//Appointment
	if($(".provie-plan-appointment").length > 0){
		
		$('input[type=checkbox]').val('false');

		$('#app-date').mobiscroll().calendar({
			controls: ['calendar'],
		 	minDate:new Date(),
		 	//showLabel: true,
		 	layout: 'liquid',
		 	dateOrder: 'ddmmyy',
        	dateFormat: 'dd-mm-yyyy',
        	invalid: ["w0","w1","w2","w3","w4","w5","w6"],
        	defaultValue: null,
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        //mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
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
					error:function(xhr, textStatus, errorThrown){

						if(xhr.status == 404){
							$('#perferredTimeIsNull').modal('show')
							pickAnotherCentre
						} else if(xhr.status == 500){
							console.log('System error.');
						} else {
							console.log("unable to load API : "+ fwdApi.url.findAvailableTimeByCentre);
						}
						$("#loading-overlay").modal("hide");
				    },
				    success:function(response){
				    	if(response){
				    		$("#preferred-time option").remove();
				    		console.log("response",response);
				    		if(response.length > 0){
				    			for(var i in response){
					    			var d = response[i];
					    			var option = $("<option/>");
					    			option.data(d);
					    			option.val(d.timeSlot);
					    			option.text(d.timeSlot);
					    			
					    			$("#preferred-time").append(option);
					    		}
				    			$("#preferred-time").val($("#preferred-time option:first").val());
				    		}else{
				    			 $("#preferedTimeIsNull").modal("show");
				    		}
				    		$("#loading-overlay").modal("hide");
				    	}
				    	
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
	        },
	        lang: UILANGUAGE  == "EN" ? "en_fwd" : "zh_fwd"
		});


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



		$("#checkbox3, #checkbox4").change(function() {
			if($(this).prop('checked')) {
				$(this).val('true');
			} else {
				$(this).val('false');
			}
			showBubble();
		});


		$('[data-toggle="popover"]').popover();

		bsvFormLogin($("#form-appointment-login"));
		bsvFormForgotUsername($('#form-appointment-forgot-username'));
		bsvFormForgotPwd($('#form-appointment-forgot-pwd'));
		bsvFormRegister($('#form-appointment-register'));

		$("#btn-appointment-confirm").on('click', function(){
			var isValid = true;
			var confirmationJsp="/savings-insurance/wealthree-confirmation-appointment-sp?referenceNum="
			var appType = 'WTHREE-SP';
			var paymentType=planCode.split("-")[1];
			//alert(confirmationJsp);
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
					planCode: appType,
					userName:userName,
					appointmentType:typeId
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
					error:function(xhr, textStatus, errorThrown){

						var _err_msg = '';
						if(errorThrown){
							_err_msg = errorThrown;
						}

						if(xhr.status == 400){
							$(".generalErrMsg").html($("<small/>").text(_err_msg));
							console.log('Invalid appointment type.');
						} else if(xhr.status == 417){
							$('#moreThan2Tries').modal('show');
							console.log('The number of appointments must be less than 2.');
						} else if(xhr.status == 406){
							$('#accessCodeUsed').modal('show');
							console.log('Access code has already been used.');
						} else if(xhr.status == 409){
							$('#reservationInvalid').modal('show');
							console.log('Reservation is invalid.');
						} else if(xhr.status == 500){
							$(".generalErrMsg").html($("<small/>").text(_err_msg));
							console.log('System error.');
						} else {
							$(".generalErrMsg").html($("<small/>").text(_err_msg));
							console.log("unable to load API : "+ fwdApi.url.appointment);
						}
						$("#loading-overlay").modal("hide");
				    },
				    success:function(response){
				    	
				    	if(response){
				    		window.location.href= context + "/" + UILANGUAGE.toLowerCase() + confirmationJsp + response.referenceNum;
				    		$("#loading-overlay").modal("hide");
				    	}
				    },
				    complete:function(){
				    	$("#loading-overlay").modal("hide");
				    }
				});
			}
		});

		$("#pick-another-centre-btn").on("click",function(){
			$("#pickAnotherCentre").modal("hide");
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
				
				$("#preferred-time option").remove();
				$("#preferred-time").val("");
    			
				changeAppointmentDate('#app-date',[]);
				// $('#app-date').mobiscroll('setVal',"",true);
				
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
					error:function(xhr, textStatus, errorThrown){

						if(xhr.status == 404){
							$("#preferedTimeIsNull").modal("show");
						} else if(xhr.status == 500){
							console.log('System error.');
						} else {
							console.log("unable to load API : "+ fwdApi.url.findAvailableDateByCentre);
						}
						$("#loading-overlay").modal("hide");
				    },
				    success:function(response){
				    	
				    	//$("#preferedTimeIsNull").modal("show");
				    	if(response){
				    		
				    		if(response.length > 0){
				    			var dates = [];
				    			var firstDate = response[0].date;

				    			$("#preferred-time option").remove();

					    		for(var i in response){
					    			var d = response[i];
					    			var from = d.date.split("-");
					    			//dates.push(new Date(from[0],from[1] -1, from[2].substr(0,2)));
					    			dates.push(new Date(from[2],from[1] -1, from[0]));
					    			
					    			if(firstDate == d.date){
					    				var option = $("<option/>");
					    				option.text(d.timeSlot);
					    				option.val(d.timeSlot);
					    				
					    				if($("#preferred-time option").length == 0){
					    					option.prop("selected");
					    				}
					    				$("#preferred-time").append(option);
					    			}
					    		}
					    		$("#preferred-time").val($("#preferred-time option:first").val());
					    		//dates.push(new Date(2016,8,1));
					    		changeAppointmentDate('#app-date',dates);
					    		$('#app-date').mobiscroll('setVal',dates[0],true);

					    		
				    		}else{
				    			$("#preferedTimeIsNull").modal("show");
								changeAppointmentDate_dateEmpty('#app-date');
				    		}
				    		$("#loading-overlay").modal("hide");
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
			cache:false,
			async:false,
		    error:function (xhr, textStatus, errorThrown){

		        if(xhr.status == 404){		        
		        	$(".before-login").show();
		        } else {
		        	$(".before-login").show();
		        }
		    },
		    success:function(response){
		    	if(response){
		    		
		    		if(response.userName == '*DIRECTGI'){
		    			$(".before-login").show();
		    			return false;	
		    		}

		    		isLogged = true;
		    		
		    		$(".after-login").find(".fld-val").text(response.fullName);
		    		userName = response.userName;
		    		$(".after-login").show();
		    		$("#btn-appointment-confirm").show();
		    	}
		    	
		    }
		});
		
		
		//Get Available Centre
		//alert(UILANGUAGE);
		$.ajax({
			beforeSend:function(){
				$("#loading-overlay").modal("show");
			},
			url:fwdApi.url.getAvailableCentre,
			type:"get",
			contentType: "application/json",
			data:{type:typeId,language:UILANGUAGE  == "EN" ? "EN" : "ZH"},
			cache:false,
			async:false,
			error:function(xhr, textStatus, errorThrown){

				if(xhr.status == 400){
					console.log('Invalid appointment type.');
				} else if(xhr.status == 500){
					console.log('System error.');
				} else {
					console.log("unable to load API : "+ fwdApi.url.getAvailableCentre);	
				}
				$("#loading-overlay").modal("hide");
		    },
		    success:function(response){
		    	
		    	if(response){
		    		console.log(response);
		    		$("#centre").empty();
		    		/*var o0 = $("<option/>");
		    		o0.text("Option0");
		    		o0.data({abc:1});
		    		$("#centre").append(o0);*/
		    		
		    		if(response.length > 0){
		    			for(var i in response){
			    			var centre = response[i];
			    			//console.log(centre);
			    			var option = $("<option/>");
			    			option.text(centre.serviceCentreName);
			    			option.val(centre.serviceCentreCode);
			    			option.data(centre);
			    			$("#centre").append(option);
			    			
			    		}
			    		
			    		//$("#centre").change();
			    		checkAllServiceCenterAvailable();
		    		}else{
		    			$("#fullyBooked").modal('show');
		    		}
		    	}

		    	//$("#loading-overlay").modal("hide");
		    },
		    complete:function(){
		    	//$("#loading-overlay").modal("hide");
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
			url:fwdApi.url.appointment + "/" + referenceNum,
			type:"get",
			contentType: "application/json",
			cache:false,
			async:false,
			error:function(xhr, textStatus, errorThrown){
				
				var resp = $.parseJSON(xhr.responseText);

				$(".before-login").show();
		    },
		    success:function(response){
		    	if(response){
		    		$(".appointment-date").text(response.preferredDate);
		    		$(".appointment-time").text(response.preferredTime);
		    		//$(".branch-address").text(response.centreCode);
		    		//$(".branch-address").text(getServiceCenterName(response.centreCode));
		    		getServiceCenterName(response.centreCode);
		    		console.log(response);
		    	}
		    	
		    }
		});
		
		
	}
});

function checkAllServiceCenterAvailable(){
	allCentreObj.ttl = $("#centre option").length;
	allCentreObj.current = 0;

	checkServiceCenterAvailable();



}

function checkServiceCenterAvailable(){

	var d = $($("#centre option").get(allCentreObj.current)).data();

	 	$.ajax({
			
			url:fwdApi.url.findAvailableDateByCentre,
			type:"get",
			contentType: "application/json",
			data:{type:typeId,centreCode:d.serviceCentreCode,date:""},
			cache:false,
			async:false,
			error:function(xhr, textStatus, errorThrown){

				allCentreObj.current++;

				if(allCentreObj.current == allCentreObj.ttl){
		    		
		    	}

		    },
		    success:function(response){

		    	allCentreObj.current++;
		    	var haveSlot = false;



		    	if(response){
		    		if(response.length > 0){
		    			//Select it
		    			haveSlot = true;
		    		}
		    	}


				if(allCentreObj.current == allCentreObj.ttl){
					$("#loading-overlay").modal("hide");
		    		if(haveSlot){
		    			//Select it
		    			$('#centre option').eq(allCentreObj.current - 1).prop('selected', true);
		    			$('#centre').change();

		    		}else{
		    			$("#fullyBooked").modal('show');
		    		}
		    	}else{
		    		if(haveSlot){
		    			$("#loading-overlay").modal("hide");
		    			//Select it
		    			$('#centre option').eq(allCentreObj.current - 1).prop('selected', true);
		    			$('#centre').change();

		    		}else{
		    			//Check Next
		    			checkServiceCenterAvailable();
		    		}
		    	}		    	
		    }
	});
}
//Get Service Center Name - begin
function getServiceCenterName(SelCenterCode){
	//Get Availabe Service Center
	//alert('Param_SelCenterCode='+SelCenterCode);
	//var SelCenterName="";
	$.ajax({
		url:fwdApi.url.getAvailableCentre,
		type:"get",
		contentType: "application/json",
		data:{type:typeId,language:UILANGUAGE  == "EN" ? "EN" : "ZH"},
		cache:false,
		async:false,
		error:function(xhr, textStatus, errorThrown){

			if(xhr.status == 400){
				console.log('Invalid appointment type.');
			} else if(xhr.status == 500){
				console.log('System error.');
			} else {
				console.log("unable to load API : "+ fwdApi.url.getAvailableCentre);	
			}
	    },
	    success:function(response){
	    	if(response){
	    		//console.log(response);
	    		//$("#centre").empty();
	    		if(response.length > 0){
	    			for(var i in response){
		    			if (SelCenterCode==response[i].serviceCentreCode){
		    				//alert('data_centercode=' + response[i].serviceCentreCode);
		    				//SelCenterName = response[i].serviceCentreName;
		    				//alert('data_centerName=' + response[i].serviceCentreName);
		    				//alert(response[i].address);
		    				$(".branch-name").text(response[i].serviceCentreName);
		    				$(".branch-address").text(response[i].address);
		    				break;
		    			}
		    		}
	    		}else{
	    			$(".branch-name").text('');
	    			$(".branch-address").text('');
	    		}
	    	}
	    }
	});
 //   return SelCenterName;
}
//Get Service Center Name - end

function bsvFormLogin(form){
	//Bind Event
	form.find("input[name='userName']").on("keypress",function(evt){
		validationUsername(evt);
	});

	form.find(".js-btn-submit").on("click",function(){
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
			    		$("#btn-appointment-confirm").show();

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

	form.find(".js-btn-submit").on("click",function(){
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

	form.find(".js-btn-submit").on("click",function(){
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
				error:function(xhr, textStatus, errorThrown){

					var resp = $.parseJSON(xhr.responseText);

					$(".forgotPwdPanErrMsg").append($("<small/>").text(resp.message));	
					$("#loading-overlay").modal("hide");
			    },
			    success:function(response){
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

	form.find(".js-btn-submit").on("click",function(){
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
			    		$("#btn-appointment-confirm").show();

			    		//$("#loading-overlay").modal("hide");
			    		
			    		//window.location.reload();
			    		
			    		//Simulate Login
			    		$("#appointmentloginUsername").val($("#appointmentRegisterUserName").val());
						$("#appointmentloginPassword").val($("#appointmentRegisterPassword").val());
						$("#btn-appointment-login").trigger("click");
			    		
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

	var obj = {
		valid:dates,
		readonly:false,
		onBeforeClose: function (valueText, btn, inst) {}
	}
	if(dates.length > 0){
		obj.minDate = dates[0]
	}

	inst.option(obj);
}

function changeAppointmentDate_dateEmpty(elm){
	var inst = $(elm).mobiscroll('getInst');
	inst.clear();
	inst.option({
		readonly:true,
		valid:[new Date()],
		minDate:new Date(),
		onBeforeClose: function (valueText, btn, inst) {
			if(btn == 'set'){
				return false;
			}
		}
	});

}

function showBubble(){
	if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
		$(".checkboxBubble").fadeIn();
	}else{
		$(".checkboxBubble").fadeOut();
	}
}

function renderRateTable(tbDesktop,tbMobHead,tbMobBody,plan,odd){
	var dt = $("#template .tbl_desktop").clone();
	var mob_head = $("#template .tbl_mob_header").clone();
	var mob = $("#template .tbl_mob").clone();
	
	if(odd){
		dt.addClass("pinkish-shade");
		mob_head.addClass("pinkish-shade");
		mob.addClass("pinkish-shade");
	}
	
	dt.find(".premiumYear").text(plan.premiumYear);
	mob_head.find(".premiumYear").text(plan.premiumYear);
	
	if(plan.premiumYear == 100){
		var age100 = UILANGUAGE == "EN" ? "At Age " + plan.premiumYear : "至" + plan.premiumYear+ "歲";
		dt.find(".premiumYear").text(age100);
		mob_head.find(".premiumYear").text(age100);
	}
	
	dt.find(".rate").text(plan.rate);
	mob.find(".rate").text(plan.rate);
	
	dt.find(".totalPaid").text(commaSeparateNumber(plan.totalPaid));
	mob.find(".totalPaid").text(commaSeparateNumber(plan.totalPaid));
	
	dt.find(".accountValue").text(commaSeparateNumber(plan.accountValue));
	mob.find(".accountValue").text(commaSeparateNumber(plan.accountValue));
	
	dt.find(".deathBenefit").text(commaSeparateNumber(plan.deathBenefit));
	mob.find(".deathBenefit").text(commaSeparateNumber(plan.deathBenefit));
	
	dt.find(".riderValue").text(commaSeparateNumber(plan.riderValue));
	mob.find(".riderValue").text(commaSeparateNumber(plan.riderValue));
	
	
	tbDesktop.append(dt);
	tbMobHead.append(mob_head);
	tbMobBody.append(mob);
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

function commaSeparateNumber(val){
    while (/(\d+)(\d{3})/.test(val.toString())){
      val = val.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2');
    }
    return val;
}

function getRiderName(riderType){
	switch(riderType){
		case 'p50':
		case 'CANCER_BENEFIT': return option_rider_cancer;
		case 'p100':
		case 'TERM_LIFE_BENEFIT': return option_rider_term;
		case 'p500':
		case 'ACCIDENTIAL_DEATH_BENEFIT': return option_rider_adb;
		default: return '';
	}
	return '';
}