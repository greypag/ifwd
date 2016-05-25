<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ResourceBundle"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/breadcrumb.css">

<% 
	String[] breadcrumbItems = request.getParameter("breadcrumbItems").replace(" ", "").split(",");
	int breadcrumbActive = Integer.parseInt(request.getParameter("breadcrumbActive"));
	String lang = ((String)session.getAttribute("uiLocale")).substring(0, 2);
%>

<%!

	public String createBreadcrumb(String[] bcList, int breadcrumbActive, String lang){

		String output = "";
		
		Boolean isActive = false;
		Boolean isLast = false;
		String itemCls = "";
		String dividerCls = "";

		String template_item = "<li class=\"%s\">%s</li>";
		String template_divider = "<li class=\"%s\"><i class=\"fa fa-play\"></i></li>";

		String path_to_resources = "";
		if(lang.equalsIgnoreCase("EN")){
			path_to_resources = "messages_en_US";
		} else {
			path_to_resources = "messages_zh_HK";
		}

		ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
	
		for( int i=0; i<bcList.length; i++ ){

			isActive = (breadcrumbActive==i)?true:false;
			isLast = (i==bcList.length-1)?true:false;

			itemCls = (isActive)?"breadcrumb__item breadcrumb__item--active":"breadcrumb__item";
			dividerCls = (isActive)?"breadcrumb__divider breadcrumb__divider--active":"breadcrumb__divider";

			//render divider
			if( i!=0 ){
				output += String.format(template_divider, dividerCls);
			}
			//render breadcrumb item
			//output += String.format(template_item, itemCls, bcList.get(i));
			output += String.format(template_item, itemCls, resource.getString(bcList[i]));
		}

		return output;
	}
%>


<div class="comp breadcrumb">
	<div class="breadcrumb__container">
	   <ul class="breadcrumb__list breadcrumb__list--none">
			<%= createBreadcrumb(breadcrumbItems, breadcrumbActive, lang) %>
	   </ul>
	</div>
</div>

<%--
<div class="fwd-container container-fluid breadcrumbs">
	<div class="breadcrumb-container">
	   <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
	       <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
	       <li class="divider"><i class="fa fa-play"></i></li>
	       <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
	       <li class="divider"><i class="fa fa-play"></i></li>
	       <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
	       <li class="divider last"><i class="fa fa-play"></i></li>
	       <li class="active-bc" id="et-active-bc-menu">Application</li>
	   </ol>
	</div>
</div>
--%>
