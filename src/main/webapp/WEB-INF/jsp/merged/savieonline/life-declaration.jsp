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
<form id="lifeDeclarationForm" action="">
declaration1:<input type="checkbox" name="declaration1" value="true"/><br/>
declaration2:<input type="checkbox" name="declaration2" value="true"/><br/>
declaration3:<input type="checkbox" name="declaration3" value="true"/><br/>
declaration4:<input type="checkbox" name="declaration4" value="true"/><br/>
declaration5:<input type="checkbox" name="declaration5" value="true"/><br/>
<input type="button" id="nextPage" value="nextPage"/>
<input type="button" id="saveLater" value="saveLater"/>
</form>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$.ajax({     
	    url:'${pageContext.request.contextPath}/ajax/savie-online/createLifePolicy',     
	    type:'get',     
	    error:function(){       
	    },     
	    success:function(data){
	    	if(data != null && data.successMsg !=null){
	    		window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
	    	}
	    }  
	});
});

$("#saveLater").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savie-online/lifeDeclarationSaveforLater",
		  data: $("#lifeDeclarationForm").serialize(),
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