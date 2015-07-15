<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
 <!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/dropzonejs/basic.css" rel="stylesheet">  
<link href="<%=request.getContextPath()%>/resources/dropzonejs/dropzone.css" rel="stylesheet"> 
</head>
<script src="<%=request.getContextPath()%>/resources/dropzonejs/dropzone-amd-module.js"></script>
<body>
 <form id="dropzone" method="post"enctype="multipart/form-data" class="dropzone">

</form>

<br /><br />
<div style="left: auto;right: auto;">Upload you documents.</div>
<form   style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px" id="form1" name="form1" action="<%=request.getContextPath()%>/${language}/${nextPageFlow }"  method="post">
 <input type="radio" name="upload" value="1">Upload now 
 <input type="radio" name="upload" style="margin-left: 20px" value="2">Upload later
 <input type="radio" name="upload" style="margin-left: 20px" value="3">Give at stor
 <br/>
 <input type="checkbox" name="permanent" style="margin-left: 0px" value="1">I'am Hong kong permanent resident
  <br/>
  <input type="submit" value="submit">
 </form>
<script type="text/javascript">
var dictDefaultMessage ="将文件拖拽至此区域进行上传（或点击此区域）";
$("#dropzone").click(function(){
	 $("#dropzone").html("<div class=\"dz-default dz-message\"><span>" + dictDefaultMessage + "</span></div>");
	});
	
$("#dropzone").dropzone({
    paramName: 'file',
    url: '<%=request.getContextPath()%>/ajax/savie/savie-image/post.html',
    dictDefaultMessage: dictDefaultMessage,
    acceptedFiles: 'image/*',
    parallelUploads: 1,
    maxFilesize: 1,
    maxFiles: 1,
    init: function() {},
    success: function(file, data) {
    	
    }
});
</script>
</body>
</html>