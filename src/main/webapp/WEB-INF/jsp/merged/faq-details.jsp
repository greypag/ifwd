<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.Iterator"%>

<%@page import="com.ifwd.fwdhk.util.FaqUtil"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
JSONParser jsonParser = new JSONParser();
//String filePath = new File("").getAbsolutePath();
//Object rootObj = parser.parse(new FileReader("C:/wamp/www/ifwd_git/src/main/webapp/resources/json/jsontest.json"));
//Object rootObj = parser.parse(new FileReader("http://localhost:8080/fwdhk/resources/json/jsontest.json"));
String language = session.getAttribute("language").toString();
String indexJsonPath = "";
if(language!=null){
	if(language=="en"){
		indexJsonPath = "/fwdhk/resources/json/en/faq-"+request.getAttribute("faqProduct")+".json";
	}else{
		indexJsonPath = "/fwdhk/resources/json/tc/faq-"+request.getAttribute("faqProduct")+".json";
	}
}
	

//URL url = new URL("http://"+request.getServerName()+":"+request.getServerPort()+indexJsonPath);
//BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
//JSONObject rootObj = (JSONObject) jsonParser.parse(br);
//long columnCount = (long) rootObj.get("groupCount");
//JSONArray categories = (JSONArray) rootObj.get("categories");
//System.out.println(columnCount);
//for(long i=1; i<=columnCount; i++){
//	System.out.println(i);
//}
//ArrayList category = (JSONArray) rootObj.get("category");
//System.out.print(category.toString());
//JsonArray products = parser.parse(br).getAsJsonObject();

FaqUtil faqUtil = new FaqUtil();
JSONObject faqProductObj = faqUtil.getJsonObject("http://"+request.getServerName()+":"+request.getServerPort()+indexJsonPath);

JSONObject faqTopicWidget = (JSONObject) faqProductObj.get("category_widget");

JSONArray topicList = (JSONArray) faqTopicWidget.get("list");

for(int i=0; i<topicList.size(); i++){
	System.out.println(topicList.get(i).toString());
}

System.out.println(topicList.toString());

JSONArray faqIndexCategory = (JSONArray) faqProductObj.get("categories");


/*for (int i=0; i < products.size(); i++) {
	JsonObject product = products.get(i).getAsJsonObject();
	System.out.println(product.get("name").toString());
}*/
//System.out.println(rootObj.has("products"));
%>
<section id="contact-page">
	<!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            header.menu.home,header.menu.faq
        </c:set>
        <c:set var="breadcrumbActive">1</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->

	<div class="container faq-container containerdd">
		<div>Product = ${faqProduct}</div>
		<div>Language = ${language}</div>
	</div>

	<div class="container faq-container">
	    <div class="input-group">
	     	<input id="search-input" type="text" class="form-control<% if(language=="tc"){ %> chinese-input<% } %>" placeholder="Search for...">
	    </div>
	    
		<div class="category-list col-md-3">
			<div class="category-title"><fmt:message key="faq.catlist.label" bundle="${msg}" /></div>
			<% for(int i=0; i<topicList.size(); i++){ %>
				<a class="category-item" data-link="category<%=i+1 %>"><%=topicList.get(i).toString() %></a>
			<% } %>
		</div>
		<div class="faq-wrapper col-md-9">
			<div class="product-title"><%=faqProductObj.get("product") %></div>
			<% for(int i=0; i<topicList.size(); i++){ %>
				<div id="category<%=i+1 %>" class="faq-group">
					<div class="faq-group__title"><%=topicList.get(i).toString() %></div>
					<%
						JSONArray questions = (JSONArray) faqProductObj.get("questions");
						for(int i2=0; i2<questions.size(); i2++){
							JSONObject question = (JSONObject)questions.get(i2);
					%>
						<% if(topicList.get(i).toString().equals(question.get("category").toString())){ %>
							<div class="faq-group__question">
									<a href="#question<%=question.get("id").toString() %>"><%=question.get("question_title").toString() %></a>
							</div>
						<% } %>				
					<% } %>					
					<%
						JSONArray questionsAnswer = (JSONArray) faqProductObj.get("questions");
						for(int i2=0; i2<questionsAnswer.size(); i2++){
							JSONObject question = (JSONObject)questionsAnswer.get(i2);
					%>
						<% if(topicList.get(i).toString().equals(question.get("category").toString())){ %>
							<div id="question<%=i2+1 %>" class="faq-group__answer">
								<%=question.get("question_title").toString() %>
								<%=question.get("question_answer").toString() %>
							</div>
						<% } %>
					<% } %>
				</div>
			<% } %>
		</div>		
	</div>
</seciton>
<script>
	var jsonPath = "<%=request.getContextPath()%>/resources/json/${language}/faq-<%=request.getAttribute("faqProduct")%>.json";
</script>
