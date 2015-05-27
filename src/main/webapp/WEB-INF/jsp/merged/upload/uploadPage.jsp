<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>upload</title>
</head>
<body>

<%-- <form:form action="<%=request.getContextPath()%>/updatePage" method="post" enctype="multipart/form-data">

    file: <input type="file" name="mFile"/><br>
    <input type="submit">
</form:form> --%>

<form action="${pageContext.request.contextPath}/${language}/upload/saveFile" method="post" enctype="multipart/form-data">

    file: <input type="file" name="mFile"/><br>
    <input type="submit">
</form>

</body>
</html>