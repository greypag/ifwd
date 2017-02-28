var APIServer = "";
$(document).ready(function(){
	
	$("#pv_claims .dropdown-menu li a").on("click",function(){
		var that = this;
		setTimeout(function (){$(that).parent('li').removeClass('active');}, 300);
	});
	function qs(key) {
	    key = key.replace(/[*+?^$.\[\]{}()|\\\/]/g, "\\$&"); // escape RegEx meta chars
	    var match = location.search.match(new RegExp("[?&]"+key+"=([^&]+)(&|$)"));
	    return match && decodeURIComponent(match[1].replace(/\+/g, " "));
	}
	function initData(){
		if (qs('gender') != null && qs('smoke') != null && qs('dob') != null ){
			console.log('gender,smoke,dob not null');
			$('.type-of-gender').val(qs('gender'));
			$('.type-of-habit').val(qs('smoke'));
			$('.mobiscroll-datepicker').val(qs('dob'));
			$('#plan-dob-datepicker-for-mobile').text(qs('dob'));
			
		}
		$('.promotion_code_input').val(qs('referralCode'));
		callAjaxOnChange();
	}
	initData();
	
		
	function initDatePicker(){	
		var current_date = new Date();
		var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
		var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);
		
		var dob_start_date = new Date((new Date()).setYear((new Date()).getFullYear() - 70));
		var dob_end_date = new Date((new Date()).setYear((new Date()).getFullYear() - 18));
		//var dob_end_date = new Date((new Date()).setYear((new Date()).getFullYear() - 1));		
		$('.mobiscroll-datepicker').mobiscroll().calendar({
			controls: ['date'],
			minDate:dob_start_date,
		 	maxDate:dob_end_date,
		 	showLabel: true,
		 	focusTrap:false,
		 	dateOrder: 'yymmdd',
	    	dateFormat: 'yyyy-mm-dd',
	        theme: "mobiscroll",     // Specify theme like: theme: 'ios' or omit setting to use default 
	        mode: "scroller",       // Specify scroller mode like: mode: 'mixed' or omit setting to use default 
	        display: "bubble", // Specify display mode like: display: 'bottom' or omit setting to use default 
	        onClosed:onClosed,
	        lang: language  == "en" ? "en_fwd" : "zh_fwd"
		});
		$('.mobiscroll-datepicker').css("cursor","default");
		//$('#plan-dob-datepicker').val(day_now +'-'+ month_now +'-'+ (current_date.getFullYear()-18));
		var eighteen = new Date((new Date()).setYear((new Date()).getFullYear() - 18));		
		//$('.mobiscroll-datepicker').mobiscroll("setVal",eighteen,true);
	}
	initDatePicker();
	
	$("#quoteModal").on("shown.bs.modal",function(){
		initDatePicker();
		//console.log(1);
	});
	
	$('.type-of-gender').on('change', function() {
		$('.type-of-gender').val($(this).val());
		callAjaxOnChange();
	});
	$('.type-of-habit').on('change', function() {
		$('.type-of-habit').val($(this).val());
		callAjaxOnChange();
	});
	$('.mobiscroll-datepicker').on('change', function() {
		$('.mobiscroll-datepicker').val($(this).val());
		$('.mobiscroll-datepicker').text($(this).val());
		callAjaxOnChange();
		
	});
	$('.btn_input_code').hide();
	$('.promotion_code_input').on('input', function() {
		var code = $(this).parent().find('.promotion_code_input').val();
		$('.promotion_code_input').val(code);
		if ($('.promotion_code_input').val().length > 0 ){
			$('.btn_input_code').fadeIn(200);
		}
		else{
			$('.btn_input_code').fadeOut(200);
		}
	});
	
	$('.btn_input_code').on('click', function() {
		var code = $(this).parent().find('.promotion_code_input').val();
		$('.promotion_code_input').val(code);
		callAjaxOnChange();
	});
	$('#btn_quote').on('click', function() {
		var code = $(this).parent().find('.promotion_code_input').val();
		$('.promotion_code_input').val(code);
		callAjaxOnChange();
		$('#quoteModal').modal('hide')
	});
	
	
	
	
	$('#pv_calculator').bind('inview', function (event, visible, topOrBottomOrBoth) {
		  if (visible == true) {
			  //$('#sticky-control').removeClass("active");
			  $('#sticky-control').hide();
			  console.log("yes");
		    if (topOrBottomOrBoth == 'top') {
		      // top part of element is visible
		    } else if (topOrBottomOrBoth == 'bottom') {
		      // bottom part of element is visible
		    } else {
		      // whole part of element is visible
		    }
		  } else {
			  //$('#div-sticky').addClass("active");
			  $('#sticky-control').show();
			  console.log("no");
		  }
		});
	$(window).trigger('checkInView');
	
	$('.pd-sf-sale-illustration-sample-panel').on('shown.bs.collapse', function(){
		$(this).find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
		}).on('hidden.bs.collapse', function(){
		$(this).find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
	});
	$('#pv_claims .btn-group').on('click',function(){
		if ($(this).hasClass('open')){
			$(this).find(".glyphicon").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
			console.log("up");
			}		
		else{
			$(this).find(".glyphicon").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
			console.log("down");
		}
	});
	
	$("#appointmentRegisterFullName").keyup(function(e) {
		  var regex = /^[a-zA-Z ]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^a-zA-Z ]+/, '');
		});
	$("#appointmentRegisterMobileNo").keyup(function(e) {
		  var regex = /^[0-9]+$/;
		  if (regex.test(this.value) !== true)
		    this.value = this.value.replace(/[^0-9]+/, '');
		});
	
	bsvFormRegister($('#form-appointment-register'));
	
});
		


function toggleContactUs(){
	$('#contactUsModal').modal('show');
}
function checkAge(){
	if ($(".mobiscroll-datepicker").val()==""){
	    return false;
	}
	var Dobs = new Array()
	Dobs = $(".mobiscroll-datepicker").val().split("-");
	var Dobs1 = new Date(Dobs[0],Dobs[1]-1 ,Dobs[2], 0, 0, 0, 0);
	console.log("dob :" + Dobs1);
	var DobDate = new Date(Dobs1);
	console.log("DobDate : " + DobDate);
	var today = new Date();
	console.log("today :" + today);
	var difference = Math.abs(today - DobDate);
	console.log("difference1 : " + difference);
	difference = Math.floor((difference + 1000 * 3600 * 24) / (1000 * 3600 * 24 * 365.25)); 
	console.log("difference2 : " + difference);
	if (difference > 55 && difference < 71 || difference == 18){
		return true;
	}
	else{
		return false;
	}
}
function callAjaxOnChange(){
	if($('.type-of-gender').val()!=null && $('.type-of-habit').val()!=null && $(".mobiscroll-datepicker").val()!=""){
		var boolean = checkAge();
		if (boolean){
			$('#contactUsModal').modal('show');
			$('.btn_apply').attr('disabled',true);
		}
		else{
			$('.btn_apply').attr('disabled',false);
			console.log("AJAX!");
			$('.waitingDiv').fadeIn(200);
			setTimeout(callAjax,500);
		}
	}
	else{
		$('.btn_apply').attr('disabled',true);
	}
}

function callAjax(){
	$(".flow_dob").val($(".mobiscroll-datepicker").val());	
	$(".flow_gender").val($(".type-of-gender").val());
	$(".flow_smoker").val($(".type-of-habit").val()); 
	$(".flow_referralCode").val($('.promotion_code_input').val());
	
	$.ajax({
		beforeSend:function(){
	    },
		url:APIServer + context + "/api/medicalguardian/getPremium",
		contentType : 'application/json',
		type:"post",
		dataType: "json",
		data: JSON.stringify({
			dob:$(".flow_dob").val(),
			gender:$(".flow_gender").val(),
			smoker:$(".flow_smoker").val(),
			referralCode:$(".flow_referralCode").val()
		}),
		async:false,
		cache:false,
		error:function(xhr, textStatus, errorThrown){

			$(".result_txt").text(errorThrown);
			$(".resultPan").removeClass("hide");
			
	    },
	    success:function(response){
	    	if(response){
	    		$(".result_txt").text(JSON.stringify(response));
	    		var premium =JSON.stringify(response);
	    		
	    		console.log($(".flow_dob").val(),$(".flow_gender").val(),$(".flow_smoker").val(),$(".flow_referralCode").val());
	    		
	    		$('.premium_price').text("HK$" + response.plans[0].totalDue);
	    		/*session.setAttribute("getPremium", premium);*/

	    	}
	    	
	    	$(".resultPan").removeClass("hide");
	    	
	    },
	    complete:function(){
	    	$('.waitingDiv').fadeOut(200);
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