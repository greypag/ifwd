/*** This part may need move to JSP??? ***/
var typeId = "SAVIE_OFFLINE";
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
			planDetails					: APIServer + context + "/api/provie/planDetails"
		}
};

var isLogged = false;
var userName = "";
var IMG_DIR = context + "/resources/images";

// 18 year ago date
var dob_end_date = new Date();
dob_end_date.setFullYear(dob_end_date.getFullYear()-18);

// 70 year ago date
var dob_start_date = new Date();
dob_start_date.setFullYear(dob_start_date.getFullYear()-66);
dob_start_date.setDate(dob_start_date.getDate()+1);

$(document).ready(function(){

	//Select Plan
	if($(".provie-plan-select").length > 0){
		
		var current_date = new Date();
		var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
		var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);
		/* $('#sales-illu-dob').attr('placeholder',day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18)); */
		
		
		; // minus the date


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
		$('#plan-dob-datepicker').css("cursor","default");
		//$('#plan-dob-datepicker').val(day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));
		var eighteen = new Date((new Date()).setYear((new Date()).getFullYear() - 18));		
		$('#plan-dob-datepicker').mobiscroll("setVal",eighteen,true);
		
		
		
		

		$("#type-of-extra-rider").change(function(e){

			var cls = $(e.currentTarget).find("option:selected").data("cls");
			
			$(".er-color-swap").each(function(){
				$(this).removeClass("p50 p100 p500");
				$(this).addClass(cls);
			});
			
			$("#extra-desc-desktop p, #extra-desc p").removeClass("active");
			$("#extra-desc-desktop").find("." + cls).addClass("active");
			$("#extra-desc").find("." + cls).addClass("active");
		});

		$("#type-of-extra-rider").trigger("change");


		$("#after-5-years-container").on("shown.bs.collapse",function(){
        	$(window).resize();
        });
		
		$('.rate-buttons button').click(function(){
			$('.rate-buttons button').removeClass('active');
			$("#after-5-years .rate-table, #after-5-years .tbl-rate-mobile").hide();
			$(this).addClass('active');
			var val = $(this).data("val");
			$("#rate-table-" + val).show();
    		$("#rate-table-"+ val+"-mob").show();
    		$(window).resize();
    		
		});
		
		$("#type-of-payment").change(function(){
			var paymentMethod = $("#type-of-payment option:selected").data("val").split("-");
			var currency = paymentMethod[1];
			
			$(".currency_switcher").each(function(){
				$(this).find("span").removeClass('active');
				$(this).find("span."+currency).addClass("active");
			});
			
			//Change slider and dropdown
			var sliderObj = {
					min: affordabilityMin,
					max: affordabilityPremium,
					value:100000,
					step:1000
			};
			var monthly = 1000;
			if(currency == "USD"){
				sliderObj = {
						min: affordabilityMinUSD,
						max: affordabilityPremiumUSD,
						value:10000,
						step:500
					};
				monthly = 125;
			}
			$('.amount-slider').slider(sliderObj);
			$('.amount-slider').slider("setValue",sliderObj.value);
			$("#range").text(commaSeparateNumber(sliderObj.value));
			
			$("#min-value").text(commaSeparateNumber(sliderObj.min));
			$("#max-value").text(commaSeparateNumber(sliderObj.max));
			
			
			$("#plan-amount").empty();
			for(var i = 0; i < 20; i++){
				var option = $("<option/>");
				option.val(monthly * (i+1));
				option.text(commaSeparateNumber(monthly * (i+1)));
				$("#plan-amount").append(option);
			}
			
			
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
			    		
			    		//Dummy data
			    		//response = {"planCode":"Provie-SP","currency":"HKD","rider":"PA","plans":[{"premiumYear":1,"rate":1,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":2,"rate":1.1,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":3,"rate":1.2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":4,"rate":1.3,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":5,"rate":1.4,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}],"creditRates":[{"rate":0,"plans":[{"premiumYear":10,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]},{"rate":1,"plans":[{"premiumYear":10,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]},{"rate":2,"plans":[{"premiumYear":10,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]}]};
			    		//Normal Table
			    		$("table.tbl_desktop tbody").empty();
			    		$("table.tbl_mob tbody").empty();
			    		$("table.tbl_mob_header tbody").empty();
			    		
			    		//console.log(response.plans);
			    		for(var i = 0; i <response.plans.length; i++){
			    			var plan = response.plans[i];
			    			
			    			
			    			
			    			renderRateTable(
			    					$("table.tbl_desktop tbody"),
			    					$("table.tbl_mob_header tbody"),
			    					$("table.tbl_mob tbody"),
			    					plan,
			    					(i % 2 == 0)
			    			);
			    		}
			    		
			    		//Rate Table
			    		
			    		if(!response.creditRates){
			    			
			    			response.creditRates = [{"rate":0,"plans":[{"premiumYear":10,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]},{"rate":1,"plans":[{"premiumYear":10,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":0,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]},{"rate":2,"plans":[{"premiumYear":10,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":15,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000},{"premiumYear":100,"rate":2,"accountValue":10001,"deathBenefit":10002,"riderValue":10003,"totalPaid":10000}]	}];
			    		}
			    		if(response.creditRates){
				    		for (var k = 0; k < 3; k++){
				    			
				    			var tbDesktop = $("#rate-table-"+k+" .table tbody");
				    			var tbMobHead = $("#rate-table-"+k+"-mob .sticky-header tbody");
				    			var tbMobBody = $("#rate-table-"+k+"-mob .overflow-body tbody");
				    			
				    			tbDesktop.empty();
				    			tbMobHead.empty();
				    			tbMobBody.empty();
					    		
					    		for(var i = 0; i < response.creditRates[k].plans.length; i++){
					    			var plan = response.creditRates[k].plans[i];
					    			
					    			renderRateTable(
					    					tbDesktop,
					    					tbMobHead,
					    					tbMobBody,
					    					plan,
			    							(i % 2 == 0)
					    			);
					    		}
					    		
					    		
				    		}
				    		
				    		$($('.rate-buttons button').get(1)).trigger("click");
			    		}
			    		
			    		
			    		
			    		
			    	}
			    	
			    },
			    complete:function(){
			    	$("#loading-overlay").modal("hide");
			    }
			});
			
		});
		
		$("#plan-calculate-btn").trigger("click");
		$("#type-of-payment").trigger("change");
		
		
		
	}

	//Appointment
	if($(".provie-plan-appointment").length > 0){
		
		
		

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
					error:function(){
						alert("something error");
				    },
				    success:function(response){
				    	if(response){
				    		$("#preferred-time").empty();
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
					    			//dates.push(new Date(from[0],from[1] -1, from[2].substr(0,2)));
					    			dates.push(new Date(from[2],from[1] -1, from[0]));
					    		}
					    		//dates.push(new Date(2016,8,1));
					    		changeAppointmentDate('#app-date',dates);
					    		$('#app-date').mobiscroll('setVal',dates[0],true);
					    		
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
			data:{type:typeId,language:UILANGUAGE  == "en" ? "EN" : "ZH"},
			cache:false,
			async:false,
			error:function(){
				alert("unable to load API : "+ fwdApi.url.getAvailableCentre);
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
			url:fwdApi.url.appointment + "/" + referenceNum,
			type:"get",
			contentType: "application/json",
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