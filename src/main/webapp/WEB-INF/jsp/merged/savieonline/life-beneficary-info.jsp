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
<form id="lifeBeneficaryInfoForm" action="">
isOwnEstate:<input type="radio" id="isOwnEstate1" name="isOwnEstate" value="true"/><input type="radio" id="isOwnEstate2" name="isOwnEstate" value="false"/>
beneficaryFirstName1:<input type="text" id="beneficaryFirstName1" name="beneficaryFirstName1" value="${lifeBeneficaryInfo.beneficaryFirstName1 }"/><br/>
beneficaryLastName1:<input type="text" id="beneficaryLastName1" name="beneficaryLastName1" value="${lifeBeneficaryInfo.beneficaryLastName1 }"/><br/>
beneficaryChineseName1:<input type="text" id="beneficaryChineseName1" name="beneficaryChineseName1" value="${lifeBeneficaryInfo.beneficaryChineseName1 }"/><br/>
beneficaryID1:<input type="text" id="beneficaryID1" name="beneficaryID1" value="${lifeBeneficaryInfo.beneficaryID1 }"/><br/>
beneficaryGender1:<input type="text" id="beneficaryGender1" name="beneficaryGender1" value="${lifeBeneficaryInfo.beneficaryGender1 }"/><br/>
beneficaryRelation1:<input type="text" id="beneficaryRelation1" name="beneficaryRelation1" value="${lifeBeneficaryInfo.beneficaryRelation1 }"/><br/>
beneficaryWeight1:<input type="text" id="beneficaryWeight1" name="beneficaryWeight1" value="${lifeBeneficaryInfo.beneficaryWeight1 }"/><br/>
beneficaryFirstName2:<input type="text" id="beneficaryFirstName2" name="beneficaryFirstName2" value="${lifeBeneficaryInfo.beneficaryFirstName2 }"/><br/>
beneficaryLastName2:<input type="text" id="beneficaryLastName2" name="beneficaryLastName2" value="${lifeBeneficaryInfo.beneficaryLastName2 }"/><br/>
beneficaryChineseName2:<input type="text" id="beneficaryChineseName2" name="beneficaryChineseName2" value="${lifeBeneficaryInfo.beneficaryChineseName2 }"/><br/>
beneficaryID2:<input type="text" id="beneficaryID2" name="beneficaryID2" value="${lifeBeneficaryInfo.beneficaryID2 }"/><br/>
beneficaryGender2:<input type="text" id="beneficaryGender2" name="beneficaryGender2" value="${lifeBeneficaryInfo.beneficaryGender2 }"/><br/>
beneficaryRelation2:<input type="text" id="beneficaryRelation2" name="beneficaryRelation2" value="${lifeBeneficaryInfo.beneficaryRelation2 }"/><br/>
beneficaryWeight2:<input type="text" id="beneficaryWeight2" name="beneficaryWeight2" value="${lifeBeneficaryInfo.beneficaryWeight2 }"/><br/>
beneficaryFirstName3:<input type="text" id="beneficaryFirstName3" name="beneficaryFirstName3" value="${lifeBeneficaryInfo.beneficaryFirstName3 }"/><br/>
beneficaryLastName3:<input type="text" id="beneficaryLastName3" name="beneficaryLastName3" value="${lifeBeneficaryInfo.beneficaryLastName3 }"/><br/>
beneficaryChineseName3:<input type="text" id="beneficaryChineseName3" name="beneficaryChineseName3" value="${lifeBeneficaryInfo.beneficaryChineseName3 }"/><br/>
beneficaryID3:<input type="text" id="beneficaryID3" name="beneficaryID3" value="${lifeBeneficaryInfo.beneficaryID3 }"/><br/>
beneficaryGender3:<input type="text" id="beneficaryGender3" name="beneficaryGender3" value="${lifeBeneficaryInfo.beneficaryGender3 }"/><br/>
beneficaryRelation3:<input type="text" id="beneficaryRelation3" name="beneficaryRelation3" value="${lifeBeneficaryInfo.beneficaryRelation3 }"/><br/>
beneficaryWeight3:<input type="text" id="beneficaryWeight3" name="beneficaryWeight3" value="${lifeBeneficaryInfo.beneficaryWeight3 }"/><br/>
<input type="button" id="nextPage" value="nextPage"/><br/>
<a href="#" class="et-app-sum-edit et-app-edit">save and continue later</a>
</form>
</div>
<script type="text/javascript">
$("#nextPage").click(function(){
	$("#errorMsg").html("");
	$.ajax({
		  type : "POST",
		  async:false, 
		  url : "<%=request.getContextPath()%>/ajax/savie-online/lifeBeneficaryInfo",
		  data: $("#lifeBeneficaryInfoForm").serialize(),
		  success : function(data) {
			  if(data != null && data.errorMsg != null && data.errorMsg != ""){
				  $("#errorMsg").html(data.errorMsg);
			  }
			  else{
				  if('${backSummary}'=="Y"){
					  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow2}';
				  }
				  else{
					  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
				  }
			  }
		  }
     });
});
</script>