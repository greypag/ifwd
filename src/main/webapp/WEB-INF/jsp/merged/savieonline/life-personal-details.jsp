<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div style="margin-left: 500px;">
<div id="errorMsg" style="color: red;"></div>
<form id="lifePersonalDetailsForm" action="">
firstname:<input type="text" id="firstname" name="firstname"/><br/>
lastname:<input type="text" id="lastname" name="lastname"/><br/>
chineseName:<input type="text" id="chineseName" name="chineseName"/><br/>
dob:<input type="text" id="dob" name="dob"/><br/>
gender:<input type="text" id="gender" name="gender"/><br/>
hkid:<input type="text" id="hkid" name="hkid"/><br/>
martialStatus:<input type="text" id="martialStatus" name="martialStatus"/><br/>
mobileNumber:<input type="text" id="mobileNumber" name="mobileNumber"/><br/>
emailAddress:<input type="text" id="emailAddress" name="emailAddress"/><br/>
placeOfBirth:<input type="text" id="placeOfBirth" name="placeOfBirth"/><br/>
nationalty:<input type="text" id="nationalty" name="nationalty"/><br/>
permanetAddress1:<input type="text" id="permanetAddress1" name="permanetAddress1"/><br/>
permanetAddress2:<input type="text" id="permanetAddress2" name="permanetAddress2"/><br/>
permanetAddress3:<input type="text" id="permanetAddress3" name="permanetAddress3"/><br/>
permanetAddressDistrict:<input type="text" id="permanetAddressDistrict" name="permanetAddressDistrict"/><br/>
residentialAddress1:<input type="text" id="residentialAddress1" name="residentialAddress1"/><br/>
residentialAddress2:<input type="text" id="residentialAddress2" name="residentialAddress2"/><br/>
residentialAddress3:<input type="text" id="residentialAddress3" name="residentialAddress3"/><br/>
residentialAddressDistrict:<input type="text" id="residentialAddressDistrict" name="residentialAddressDistrict"/><br/>
correspondenceAddress1:<input type="text" id="correspondenceAddress1" name="correspondenceAddress1"/><br/>
correspondenceAddress2:<input type="text" id="correspondenceAddress2" name="correspondenceAddress2"/><br/>
correspondenceAddress3:<input type="text" id="correspondenceAddress3" name="correspondenceAddress3"/><br/>
correspondenceAddressDistrict:<input type="text" id="correspondenceAddressDistrict" name="correspondenceAddressDistrict"/><br/>
<input type="button" id="nextPage" value="nextPage"/><br/>
</form>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savie-online/lifePersonalDetails",
		  data: $("#lifePersonalDetailsForm").serialize(),
		  success : function(data) {
			  if(data != null && data.errorMsg != null && data.errorMsg != ""){
				  $("#errorMsg").html(data.errorMsg);
			  }
			  else{
				  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
			  }
		  }
     });
});
</script>