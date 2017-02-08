var APIServer = "";
$(document).ready(function(){
	
	$("#btn-applyNow").on("click",function(){
		
		$(".flow_dob").val($("#temp_dob").val());
		$(".flow_referralCode").val($("#temp_referralCode").val());
		$(".flow_gender").val($("#temp_gender").val());
		$(".flow_smoker").val($("#temp_smoker").val());
				
		$.ajax({
/*		    beforeSend:function(){
		    	$("#loading-overlay").modal("show");
		    },*/
			url:APIServer + context + "/api/medicalguardian/getPremium",
			contentType : 'application/json',
			type:"post",
			dataType: "json",
			data: JSON.stringify({
				dob:$("#temp_dob").val(),
				dobdmy:$("#temp_dob_dmy").val(),
				gender:$("#temp_gender").val(),
				smoker:$("#temp_smoker").val(),
				referralCode:$("#temp_referralCode").val()
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
		    	}
		    	
		    	$(".resultPan").removeClass("hide");
		    	
		    }/*,
		    complete:function(){
		    	$("#loading-overlay").modal("hide");
		    }*/
		});
	});
});