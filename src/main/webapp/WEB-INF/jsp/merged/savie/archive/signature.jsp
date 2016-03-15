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
<script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jsignature/flashcanvas.js"></script>

<div id="signature" style="width: 400px;border: 1px red solid;"></div>
<input type="button" value="submit" onclick="putImage()">
<input type="button" value="reset" onclick="reset()">


<br /><br />
<div style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px">And finally,your signature here</div>
 <form   style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px" id="form1" name="form1" action="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow }"  method="post">
 <input type="radio" name="signature" checked="checked" value="1" onclick="changFormAction('${nextPageFlow }')">Digital signature 
 <input type="radio" name="signature" style="margin-left: 20px" value="2" onclick="changFormAction('${nextPageFlow2 }')">Offline signature<br/>
 <input type="submit" value="Proceed">
 </form>
<script>
	function changFormAction(v) {
		var language = "${language}";
		var url = "<%=request.getContextPath()%>/"+language+"/savings-insurance/"+v;
		$("#form1").attr("action",url);
	}
	
	var $sigdiv = $("#signature")	;
    $(document).ready(function() {
    	$sigdiv.jSignature(); // 初始化jSignature插件.
    	// after some doodling...
    	//$sigdiv.jSignature("reset"); //重置画布，可以进行重新作画.
    })
    function reset() {
    	$sigdiv.jSignature("reset") ;
	}
    
    var signatureFileSize = "${signatureFileSize}";
    function putImage() {
    	var $sigdiv = $("#signature");
    	var datapair = $sigdiv.jSignature("getData", "image");
    	var obj = datapair[1];
    	if(datapair[1].length > signatureFileSize*1024 ){
        	console.log("签名数据过大");
    	}else{
    		$.ajax({     
        	    url:'<%=request.getContextPath()%>/ajax/savie/savie-save-signature/post',     
        	    type:'post',     
        	    data:{    
        	    	"image" : datapair[1] 
           		},     
        	    //async : false, //默认为true 异步     
        	    error:function(){     
        	    	console.log('error');     
        	    },     
        	    success:function(data){     
        	    	console.log("signature success");   
        	    }  
        	});
    	}
    	
	}
</script>
</body>
</html>