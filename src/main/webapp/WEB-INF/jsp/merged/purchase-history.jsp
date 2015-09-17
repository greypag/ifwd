<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%@page import="com.ifwd.fwdhk.model.PurchaseHistory"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member account details | FWD Hong Kong</title>
</head>
<body class="homepage">
	<div class="container ">
		<div class="row">
			<ol class="breadcrumb pad-none">
				<li><a href="#"><fmt:message key="menu.home" bundle="${msg}" /></a></li>
				<li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="menu.member.account" bundle="${msg}" /></li>
			</ol>
			<h2 class="page-title"><fmt:message key="member.account.title" bundle="${msg}" /></h2>
	     </div>
	     <table>
	       <tr>
	          <td>
	              <table width="1000px" align="center" border="1">
	                <tr>
			           <td colspan="4">Purchase history</td>
			        </tr>
			        <tr>
			           <td>Plan name</td>
			           <td>Policy no.</td>
			           <td>Day start</td>
			           <td>Day end</td>
			        </tr>
			        <c:choose>  
					   <c:when test="${purchaseHistory.policies.size() > 0}">
					      <c:forEach var="list" items="${purchaseHistory.policies}">
					        <tr>
					           <td>${list.planCode }</td>
					           <td>${list.policyNumber }</td>
					           <td>${list.commencementDate }</td>
					           <td>${list.expiryDate }</td>
					        </tr>
				          </c:forEach>
					   </c:when>  
					   <c:otherwise>
					        <tr>
					           <td colspan="4">0 record found/沒有紀錄</td>
					        </tr>
					   </c:otherwise>  
					</c:choose> 
			     </table>
	          </td>
	       </tr>
	       <tr>
	          <td>
	              <table width="1000px" align="center" border="1">
			        <tr>
			           <td>Plan name</td>
			           <td>Reference no.</td>
			           <td>Status</td>
			           <td>Account value*</td>
			        </tr>
			        <c:choose>  
					   <c:when test="${accountBalance.accountBalances.size() > 0}">
					      <c:forEach var="list" items="${accountBalance.accountBalances}">
					        <tr>
					           <td>${list.planCode }</td>
					           <td>${list.policyNo }</td>
					           <td>${list.status }</td>
					           <td>${list.accountBalance }</td>
					        </tr>
				          </c:forEach>
					   </c:when>  
					   <c:otherwise>
					        <tr>
					           <td colspan="4">0 record found/沒有紀錄</td>
					        </tr>
					   </c:otherwise>  
					</c:choose> 
			     </table>
	          </td>
	       </tr>
	     </table>
	</div>
</body>
</html>