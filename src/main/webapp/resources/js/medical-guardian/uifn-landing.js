var APIServer = "";
$(document).ready(function(){
	
	$("#pv_claims .dropdown-menu li a").on("click",function(){
		var that = this;
		setTimeout(function (){$(that).parent('li').removeClass('active');}, 300);
	});
		
	function initDatePicker(){	
		var current_date = new Date();
		var month_now = (parseInt((current_date.getMonth()+1), 10) + 100).toString().substr(1);
		var day_now = (parseInt(current_date.getDate(), 10) + 100).toString().substr(1);
		
		var dob_start_date = new Date((new Date()).setYear((new Date()).getFullYear() - 55));
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
	
	/*var test = $("#pv_feature").offset().top;
	$(window).scroll(function(){
		setTimeout(function(){
			if($(window).scrollTop() > test){
			   $('#div-sticky').fadeIn();
			}
			else{
				$('#div-sticky').fadeOut();
			}
			},300);
	});*/
	
	$('#pv_calculator').bind('inview', function (event, visible, topOrBottomOrBoth) {
		  if (visible == true) {
			  //$('#sticky-control').removeClass("active");
			  $('#sticky-control').fadeOut();
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
			  $('#sticky-control').fadeIn();
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
	
});
		



function toggleContactUs(){
	$('#contactUsModal').modal('show');
}

function callAjaxOnChange(){
	if($('.type-of-gender').val()!=null && $('.type-of-habit').val()!=null && $(".mobiscroll-datepicker").val()!=""){
		console.log("AJAX!");
		$('.waitingDiv').fadeIn(200);
		setTimeout(callAjax,500);
	}
}

function callAjax(){
	/*$(".flow_dob").val($("#temp_dob").val());
	$(".flow_referralCode").val($("#temp_referralCode").val());
	$(".flow_gender").val($("#temp_gender").val());
	$(".flow_smoker").val($("#temp_smoker").val());
	$(".flow_plancode").val($("#temp_plancode").val());*/
	
	$(".flow_dob").val($(".mobiscroll-datepicker").val());	
	$(".flow_gender").val($(".type-of-gender").val());
	$(".flow_smoker").val($(".type-of-habit").val()); //non smoker
	$(".flow_referralCode").val($('.promotion_code_input').val());
	
	$.ajax({
		/*beforeSend:function(){
			$('#loadingDiv').fadeIn(000);
	    },*/
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
	    		
	    		
	    		
	    		var nineteen = new Date((new Date()).setYear((new Date()).getFullYear() - 19));	
	    		var fiftyfive = new Date((new Date()).setYear((new Date()).getFullYear() - 55));	
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