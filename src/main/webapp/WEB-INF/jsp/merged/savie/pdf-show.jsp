<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
</head>
<body>
<div align="center">
<input type="button" value="${pdfName }→OK" onclick="acceptPdf('${pdfName}','${requestNo}')"/><br/>
<iframe src="<%=request.getContextPath()%>/resources/pdf/${pdfName }" width="800" height="1200" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes">
</iframe>
</div>
</body>
</html>