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
<form   style="margin-right: auto;margin-left: auto;padding-left:15px;padding-right:15px" id="form1" name="form1" action="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow }"  method="post">
 <input type="radio" name="upload" checked="checked" value="1" onclick="changFormAction('${nextPageFlow }')">Upload now 
 <input type="radio" name="upload" style="margin-left: 20px" value="2" onclick="changFormAction('${nextPageFlow2 }')">Upload later
 <!-- <input type="radio" name="upload" style="margin-left: 20px" value="3">Give at stor -->
 <br/>
 <input type="checkbox" name="permanent" style="margin-left: 0px" value="1">I'am Hong kong permanent resident
  <br/>
  <input type="submit" value="submit">
 </form>
<script type="text/javascript">
function changFormAction(v) {
	var language = "${language}";
	var url = "<%=request.getContextPath()%>/"+language+"/savings-insurance/"+v;
	$("#form1").attr("action",url);
}

var dictDefaultMessage ="将文件拖拽至此区域进行上传（或点击此区域）";
//$("#dropzone").click(function(){
//	 $("#dropzone").html("<div class=\"dz-default dz-message\"><span>" + dictDefaultMessage + "</span></div>");
//	});

var signatureWidth = "${signatureWidth}";
var signatureHeight = "${signatureHeight}";
var applicationFileSize = "${applicationFileSize}";
var flag = true;
 $("#dropzone").dropzone({
    paramName: 'file',
    url: '<%=request.getContextPath()%>/ajax/savie/savie-image/post',
    dictDefaultMessage: dictDefaultMessage,
   // acceptedFiles: 'image/*',
    parallelUploads: 1,
    maxFilesize: applicationFileSize/1000,
    maxFiles: 1,
    headers:{
    	"step": "1"
    },  
    resize: function(file) {
        if(file.type.indexOf("image") == 0 && (file.width > signatureWidth || file.height > signatureHeight) ){
        	flag = false;
        }
        var info, srcRatio, trgRatio;
        info = {
          srcX: 0,
          srcY: 0,
          srcWidth: file.width,
          srcHeight: file.height
        };
        srcRatio = file.width / file.height;
        info.optWidth = this.options.thumbnailWidth;
        info.optHeight = this.options.thumbnailHeight;
        if ((info.optWidth == null) && (info.optHeight == null)) {
          info.optWidth = info.srcWidth;
          info.optHeight = info.srcHeight;
        } else if (info.optWidth == null) {
          info.optWidth = srcRatio * info.optHeight;
        } else if (info.optHeight == null) {
          info.optHeight = (1 / srcRatio) * info.optWidth;
        }
        trgRatio = info.optWidth / info.optHeight;
        if (file.height < info.optHeight || file.width < info.optWidth) {
          info.trgHeight = info.srcHeight;
          info.trgWidth = info.srcWidth;
        } else {
          if (srcRatio > trgRatio) {
            info.srcHeight = file.height;
            info.srcWidth = info.srcHeight * trgRatio;
          } else {
            info.srcWidth = file.width;
            info.srcHeight = info.srcWidth / trgRatio;
          }
        }
        info.srcX = (file.width - info.srcWidth) / 2;
        info.srcY = (file.height - info.srcHeight) / 2;
        return info;
      },
    accept: function(file, done) {
    	setTimeout(function() {
    		return done();
    		if(flag){
        		return done();
    		}else{
            	console.log("上传图片长度过长或宽度过宽");
            	flag = true;
    			$("#dropzone").html("<div class=\"dz-default dz-message\"><span>" + dictDefaultMessage + "</span></div>");
    		}
		}, 100);
    }, 
    init: function() {},
    removedfile: function(file) {
    	},
    success: function(file, data) {
    	if( data == "{\"errMsgs\":[\"The picture is not legitimate\"]}"){  
    		//console.log("上传图片长度过长或宽度过宽");
        	$("#dropzone").html("<div class=\"dz-default dz-message\"><span>" + dictDefaultMessage + "</span></div>");
    	}
    	console.log(data);
    }
}); 
</script>
</body>
</html>