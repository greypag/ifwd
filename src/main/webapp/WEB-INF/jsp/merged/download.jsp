<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function download(Url){
		alert(Url);
		window.open(Url, null, "toolbar=0,location=no,directories=0,status=0, scrollbars=yes,resizable=1,top=0,left=0");
	}
</script>
</head>
<body>
	<a href="javascript:download('<%=request.getContextPath()%>/download?fileName=<%=session.getAttribute("PDFNAME")%>&reportType=<%=session.getAttribute("reportType")%>');">download</a>
</body>
</html>