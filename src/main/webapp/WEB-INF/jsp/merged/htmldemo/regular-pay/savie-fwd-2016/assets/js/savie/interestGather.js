
function sendStep1Email() {
	var teaserEmail = $("#teaserEmail").val();
	var teaserPhoneNo = $("#teaserPhoneNo").val();
	sendlead(teaserEmail,teaserPhoneNo,"","1");
}

function sendStep2Email() {
	var teaserEmail = $("#teaserEmail").val();
	var answer1 = $("#amountToSave").val();
	sendlead(teaserEmail,"",answer1,"2");
}

function sendMessagesEmail(email,message,attachment) {
	$.ajax({     
	    url:context+'/ajax/savie/messages/email',     
	    type:'post',     
	    data:{    
	    	"to": email,
	    	"message":message,
	        "attachment":attachment  
   		},     
	    error:function(){       
	    },     
	    success:function(data){  
	    	if(data.errMsgs != null){
		    	console.log(data.errMsgs); 
	    	}      
	    }  
	});
}

function sendlead(email,mobileNo,answer1,step) {
	$.ajax({     
	    url: context+'/ajax/savie/interestGather/post',     
	    type:'post',     
	    data:{    
	    	"email": email,
	    	"mobileNo":mobileNo,
	        "answer1": answer1,
	        "step": step    
   		},        
	    error:function(){
	    },     
	    success:function(data){ 
	    	if(data.errMsgs == null ){
	    		if(step == '1'){
	    			var message = "<h1>Thank you for registering your email address at Savie Insurance Plan's website</h1>";
	    			var attachment = "";
	    			sendMessagesEmail(email,message,attachment);
	    		}
	    	}else{
		    	console.log(data.errMsgs);  
	    	}     
	    }  
	});
}

