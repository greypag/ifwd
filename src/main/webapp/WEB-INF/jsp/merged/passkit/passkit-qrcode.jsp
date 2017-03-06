<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>二维码</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>

    <script>
    $(document).ready(function(){
    		$("input[type=submit]").click(function(e){
    			e.preventDefault();
    			$("#qrcode_div").empty().append("<img id='qrImg' />");
    			$("#qrImg").attr("src", "<%=basePath%>api/QRCode/createQRCodeImage?url="+$("input[type=text][name=url]").val());
    		});
    	});
    </script>
  </head>
  
  <body>
    <form>
    	网址<input type="text" name="url" />
    	<input type="submit" value="生成二维码" />
    	<div id="qrcode_div"></div>
    </form>
  </body>
</html>
