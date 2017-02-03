<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script>

var lang = '${language}';

var ReviewPageLocale = {	
	'data':{
		"edit":"<fmt:message key="button.edit" bundle="${msg}" />",
		"gender":[
			"<fmt:message key="label.male" bundle="${msg}" />",
			"<fmt:message key="label.female" bundle="${msg}" />"
		],
		"marital_status":[
			"<fmt:message key="option.martial.status.single" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.married" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.divorced" bundle="${msg}" />",
			"<fmt:message key="option.martial.status.widowed" bundle="${msg}" />"
		],
		"dependents":[
			"<fmt:message key="option.no.of.dependents.nil" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.1to3" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.4to6" bundle="${msg}" />", 
			"<fmt:message key="option.no.of.dependents.7orabove" bundle="${msg}" />"
		],
		"education": [
		<c:if test="${language == 'en'}">
			<c:forEach var="educationItem" items="${etEducationLevelEN}">"${educationItem.itemDesc}",</c:forEach>
		</c:if>
		<c:if test="${language == 'tc'}">
			<c:forEach var="educationItem" items="${etEducationLevelCN}">"${educationItem.itemDesc}",</c:forEach>
		</c:if>
		],
		"occupation_others_empty":"<fmt:message key="error.fna.occupation.empty" bundle="${msg}" />",
		"select":"<fmt:message key="option.fna.select" bundle="${msg}" />",
		"select_empty":"<fmt:message key="error.fna.occupation.empty" bundle="${msg}" />",
		"q1_empty":"<fmt:message key="error.fna.choose.multiple" bundle="${msg}" />",
		"q1_others":"<fmt:message key="error.fna.objective.empty" bundle="${msg}" />",
		"q2_empty":"<fmt:message key="error.fna.choose.multiple" bundle="${msg}" />",
		"q3_empty":"<fmt:message key="error.fna.choose.one" bundle="${msg}" />",
		"q4_a_empty":"<fmt:message key="error.fna.choose.one" bundle="${msg}" />",
		"q4_a_others":"<fmt:message key="error.fna.specific.amount.empty" bundle="${msg}" />",
		"q4_b_empty":"<fmt:message key="error.fna.choose.multiple" bundle="${msg}" />",
		"q4_b_others":"<fmt:message key="error.fna.liquid.assets.empty" bundle="${msg}" />",
		"q4_b_amount":"<fmt:message key="error.fna.total.amount.empty" bundle="${msg}" />",
		"number":"<fmt:message key="error.fna.invalid.amount.empty" bundle="${msg}" />",
		"q4_e_empty":"<fmt:message key="error.fna.choose.one" bundle="${msg}" />",
		"q4_f_empty":"<fmt:message key="error.fna.choose.one" bundle="${msg}" />",
		"q4_g_empty":"<fmt:message key="error.fna.choose.one" bundle="${msg}" />",
		"q4_g_others":"<fmt:message key="error.fna.other.source.funds.empty" bundle="${msg}" />"
	}
}


var FNAQuestion ={
	"data":[{
		  "id": "q1",
		  "num": "1",
		  "title": "<fmt:message key="fna.question.q1" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q1.option1" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option1example" bundle="${msg}" />"
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q1.option2" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option2example" bundle="${msg}" />"
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q1.option3" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option3example" bundle="${msg}" />"
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q1.option4" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q1.option4example" bundle="${msg}" />"
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q1.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		  	"id": 5,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q2",
		  "num": "2",
		  "title": "<fmt:message key="fna.question.q2" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q2.option1" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option1remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option1example" bundle="${msg}" />"
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q2.option2" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option2remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option2example" bundle="${msg}" />"
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q2.option3" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option3remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option3example" bundle="${msg}" />"
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q2.option4" bundle="${msg}" />",
		    "caption": "-<fmt:message key="fna.question.q2.option4remark" bundle="${msg}" /> <fmt:message key="fna.question.q2.option4example" bundle="${msg}" />"
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}, {
		  "id": "q3",
		  "num": "3",
		  "title": "<fmt:message key="fna.question.q3" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q3.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q3.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q3.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q3.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q3.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q3.option6" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4",
		  "num": "4",
		  "title": "<fmt:message key="fna.question.q4" bundle="${msg}" />",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="label.yes" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="label.no" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_a",
		  "num": "4a",
		  "title": "<fmt:message key="fna.question.q4a" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4a.amount" bundle="${msg}" /> <br><fmt:message key="fna.question.q4a.lessthan" bundle="${msg}" /> {0} <fmt:message key="fna.question.q4a.month" bundle="${msg}" /> <br><br><fmt:message key="fna.question.q4a.range" bundle="${msg}" />",
		    "caption": "",
		    "other": "q4_a_others"
		  }, {
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4a.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4a.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4a.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4a.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4a.option5" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_b",
		  "num": "4b",
		  "title": "<fmt:message key="fna.question.q4b" bundle="${msg}" />  <span><fmt:message key="fna.question.q4b.specify" bundle="${msg}" /></span><br><br><fmt:message key="fna.question.q4b.type" bundle="${msg}" />",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4b.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4b.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4b.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4b.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4b.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4b.option6" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 6,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }, {
		    "id": 7,
		    "title": "<fmt:message key="fna.question.q4b.amount" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> {0} <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" />",
		    "caption": " <fmt:message key="fna.question.q4b.note" bundle="${msg}" />",
		    "other": "q4_b_amount"
		  }]
		}, {
		  "id": "q4_c",
		  "num": "4c",
		  "title": "<fmt:message key="fna.question.q4c" bundle="${msg}" />",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4c.totallessthen" bundle="${msg}" />",
		    "caption": "<fmt:message key="fna.question.q4c.month" bundle="${msg}" /> {0} <fmt:message key="fna.question.q4c.hkd" bundle="${msg}" />",
		    "other":"q4_c_others"
		  }]
		}, {
		  "id": "q4_d_1",
		  "num": "4d (i)",
		  "title": "<fmt:message key="fna.question.q4di" bundle="${msg}" /> ",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4di.lessthan" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> {0} <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" />",
		    "caption": "",
		    "other":"q4_d_1_others"
		  }]
		}, {
		  "id": "q4_d_2",
		  "num": "4d (ii)",
		  "title": "<fmt:message key="fna.question.q4dii" bundle="${msg}" /> ",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4dii.leanthan" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> {0} <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" />",
		    "caption": "",
		    "other":"q4_d_2_others"
		  }]
		}, {
		  "id": "q4_e",
		  "num": "4e",
		  "title": "<fmt:message key="fna.question.q4e" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4e.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4e.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4e.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4e.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4e.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4e.option6" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_f",
		  "num": "4f",
		  "title": "<fmt:message key="fna.question.q4f" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4f.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4f.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4f.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4f.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.q4f.option5" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 5,
		    "title": "<fmt:message key="fna.question.q4f.option6" bundle="${msg}" />",
		    "caption": ""
		  }]
		}, {
		  "id": "q4_g",
		  "num": "4g",
		  "title": "<fmt:message key="fna.question.q4g" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span>",
		  "option": [{
		    "id": 0,
		    "title": "<fmt:message key="fna.question.q4g.option1" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 1,
		    "title": "<fmt:message key="fna.question.q4g.option2" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 2,
		    "title": "<fmt:message key="fna.question.q4g.option3" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 3,
		    "title": "<fmt:message key="fna.question.q4g.option4" bundle="${msg}" />",
		    "caption": ""
		  }, {
		    "id": 4,
		    "title": "<fmt:message key="fna.question.others" bundle="${msg}" />",
		    "caption": "",
		    "popup": true
		  }]
		}]
}

var Status = {'data': []};
var statusObj = {};
<c:if test="${language == 'en'}">
	<c:forEach var="statusItem" items="${employmentStatusEN}">
		statusObj = {};
		statusObj['name'] = '${statusItem.itemDesc}';
		statusObj['id'] = '${statusItem.itemCode}';
		statusObj['disable'] = false;
		Status.data.push(statusObj);
	</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
	<c:forEach var="statusItem" items="${employmentStatusCN}">
		statusObj = {};
		statusObj['name'] = '${statusItem.itemDesc}';
		statusObj['id'] = '${statusItem.itemCode}';
		statusObj['disable'] = false;
		Status.data.push(statusObj);
	</c:forEach>
</c:if>

var Occupation = {"data": []};
var occObj = {};
<c:if test="${language == 'en'}">
	<c:forEach var="nobItem" items="${natureOfBusinessEN}">
		occObj = {};
		occObj['id'] = '${nobItem.itemCode}';
		occObj['nob'] = '${nobItem.itemDesc}';
		occObj['position'] = [];
		<c:forEach var="occItem" items="${nob_occListEN[nobItem.itemCode]}">occObj['position'].push({'id':'${occItem.itemCode}', 'name':'${occItem.itemDesc}'});</c:forEach>
		Occupation.data.push(occObj);
	</c:forEach>
</c:if>
<c:if test="${language == 'tc'}">
	<c:forEach var="nobItem" items="${natureOfBusinessCN}">
		occObj = {};
		occObj['id'] = '${nobItem.itemCode}';
		occObj['nob'] = '${nobItem.itemDesc}';
		occObj['position'] = [];
		<c:forEach var="occItem" items="${nob_occListCN[nobItem.itemCode]}">occObj['position'].push({'id':'${occItem.itemCode}', 'name':'${occItem.itemDesc}'});</c:forEach>
		Occupation.data.push(occObj);
	</c:forEach>
</c:if>



</script>