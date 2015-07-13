<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
 <!-- Bootstrap -->
</head>

<body>
<table style="margin-left: auto;margin-right: auto;" border="1">
	<tr>
		<td>dream_name:</td><td><input type="text" id="dream_name" size="20" value="dream_name"/></td>
		<td>dream_level_description:</td><td><input type="text" id="dream_level_description" size="20" value="dream_level_description"/></td>
	</tr>
	<tr>
		<td>dream_budget:</td><td><input type="text" id="dream_budget" size="20" value="100001"/></td>
		<td>current_savings:</td><td><input type="text" id="current_savings" size="20" value="100002"/></td>
	</tr>
	<tr>
		<td>saving_period:</td><td><input type="text" id="saving_period" size="20" value="100003"/></td>
		<td>annual_return_rate:</td><td><input type="text" id="annual_return_rate" size="20" value="100004"/></td>
	</tr>
	<tr>
		<td>month_savings_no_interest:</td><td><input type="text" id="month_savings_no_interest" size="20" value="100005.1"/></td>
		<td>month_savings_with_interest:</td><td><input type="text" id="month_savings_with_interest" size="20" value="100006.2"/></td>
	</tr>
	<tr>
		<td>player_email:</td><td><input type="text" id="player_email" size="20" value="Xiangyan_Chen@vandagroup.com"/></td>
		<td></td><td></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button"  onclick="sendEmail()" value="	sendEmail	"/></td>
		<td colspan="2" align="center"><input type="button"  onclick="sendlead()" value="	sendlead	"/></td>
	</tr>
</table>
<script type="text/javascript">
function sendEmail() {
	var dream_name = $("#dream_name").val();
	var dream_level_description = $("#dream_level_description").val();
	var dream_budget = $("#dream_budget").val();
	var current_savings = $("#current_savings").val();
	var saving_period = $("#saving_period").val();
	var annual_return_rate = $("#annual_return_rate").val();
	var month_savings_no_interest = $("#month_savings_no_interest").val();
	var month_savings_with_interest = $("#month_savings_with_interest").val();
	var player_email = $("#player_email").val();
	$.ajax({     
	    url:'<%=request.getContextPath()%>/ajax/savie/miniCaculator/sendEmail',     
	    type:'post',     
	    data:{    
	    	"dreamName" : dream_name, 
	    	"dreamLevelDescription" : dream_level_description, 
	    	"dreamBudget" : dream_budget, 
	    	"currentSavings" : current_savings, 
	    	"savingPeriod" : saving_period, 
	    	"annualReturnRate" : annual_return_rate, 
	    	"monthSavingsNoInterest" : month_savings_no_interest, 
	    	"monthSavingsWithInterest" : month_savings_with_interest, 
	    	"playerEmail" : player_email    
   		},     
	    //async : false, //默认为true 异步     
	    error:function(){     
	       alert('error');     
	    },     
	    success:function(data){     
	    	alert('OK');       
	    }  
	});
}

function sendlead() {
	$.ajax({     
	    url:'<%=request.getContextPath()%>/ajax/savie/interestedGather/get',     
	    type:'post',     
	    data:{    
	    	"email": "natssssdsshaniel.kw.cheung2@fwd.com",
	        "answer1": "",
	        "step": "1"    
   		},     
	    //async : false, //默认为true 异步     
	    error:function(){     
	       alert('error');     
	    },     
	    success:function(data){     
	    	alert('OK');       
	    }  
	});
}
</script>
</body>
</html>