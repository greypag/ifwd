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
		indexJsonPath = "/fwdhk/resources/json/en/jsontest.min.json";
	}else{
		indexJsonPath = "/fwdhk/resources/json/tc/jsontest.min.json";
	}
}
	

URL url = new URL("http://"+request.getServerName()+":"+request.getServerPort()+indexJsonPath);
BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
JSONObject rootObj = (JSONObject) jsonParser.parse(br);
long columnCount = (long) rootObj.get("groupCount");
JSONArray categories = (JSONArray) rootObj.get("categories");
System.out.println(columnCount);
for(long i=1; i<=columnCount; i++){
	System.out.println(i);
}
//ArrayList category = (JSONArray) rootObj.get("category");
//System.out.print(category.toString());
//JsonArray products = parser.parse(br).getAsJsonObject();

FaqUtil faqUtil = new FaqUtil("http://"+request.getServerName()+":"+request.getServerPort()+"/fwdhk/resources/json/faq-savie.json", "data");
ArrayList<String> faqTopicsArr = faqUtil.getFAQTopic();
//FaqUtil faqIndexUtil = new FaqUtil("http://"+request.getServerName()+":"+request.getServerPort()+"/fwdhk/resources/json/jsontest.min.json", "products");
//ArrayList<JSONObject> faqIndexArr = faqIndexUtil.getFAQIndex();


/*for (int i=0; i < products.size(); i++) {
	JsonObject product = products.get(i).getAsJsonObject();
	System.out.println(product.get("name").toString());
}*/
//System.out.println(rootObj.has("products"));
%>
<section id="contact-page">
	<% for(long count=1; count<=columnCount; count++){ %>
		<div class="col-md-4">
			<% for(int count2=0; count2<categories.size(); count2++){ %>
				
				<% 
					JSONObject category = (JSONObject)categories.get(count2);
					if((long)category.get("group")==count){
				%>
					<div class="category-group">
						<h2 class="category-title"><%=(String)category.get("name") %></h2>
						<% 
							JSONArray products = (JSONArray)category.get("products");
							for(int count3=0; count3<products.size(); count3++){
								JSONObject product = (JSONObject)products.get(count3);
						%>
						<div>
							<a href="<%=request.getContextPath()%>/${language}/faq/<%=(String)product.get("link") %>"><%=(String)product.get("name") %></a>	
						</div>		
						<% } %>						
					</div>						
				<% } %>
			<% } %>
		</div>
	<% } %>
</seciton>
<%-- <section id="contact-page">
	<div class="test">
	<% for (int i=0; i < faqIndexArr.size(); i++) { 
		JSONObject faqIndex = (JSONObject)faqIndexArr.get(i);
		int index_group = (int)Integer.parseInt(faqIndex.get("Group").toString());
		String index_link = faqIndex.get("Link").toString();
		String index_name = faqIndex.get("Name").toString();

	%>
		<% if(index_group==1){ %>
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/${language}/<%=index_link%>"><%=index_name%></a>
			</div>
		<% }else if (index_group==2){ %>
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/${language}/<%=index_link%>"><%=index_name%></a>
			</div>
		<% }else if (index_group==3){ %>
			<div class="col-md-4">
				<a href="<%=request.getContextPath()%>/${language}/<%=index_link%>"><%=index_name%></a>
			</div>
		<% } %>
	<% } %>
	</div>
</seciton> --%>
<section>
	<div>&nbsp;</div>
</section>
<section id="faq_topic_menu">
	<div class="faq_topic_menu">
	<% for (int i=0; i < faqTopicsArr.size(); i++) { 
		String topic = (String) faqTopicsArr.get(i);
	%>
			<div class="col-md-12">
				<a href="<%=request.getContextPath()%>/${language}/<%=topic%>"><%=topic%></a>
			</div>
	<% } %>
	</div>
</seciton>