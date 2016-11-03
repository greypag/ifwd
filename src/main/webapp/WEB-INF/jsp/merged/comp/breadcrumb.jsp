<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ResourceBundle"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/breadcrumb.css">

<% 
	String[] breadcrumbItems = request.getParameter("breadcrumbItems").replace(" ", "").split(",");
	int breadcrumbActive = Integer.parseInt(request.getParameter("breadcrumbActive"));
	Boolean breadcrumbBold = Boolean.parseBoolean(request.getParameter("breadcrumbBold"));
	String lang = ((String)session.getAttribute("uiLocale")).substring(0, 2);
%>

<%!

	public String createBreadcrumb(String[] bcList, int breadcrumbActive, Boolean breadcrumbBold, String lang){

		String output = "";
		
		Boolean isActive = false;
		Boolean isLast = false;
		Boolean isBold = breadcrumbBold;
		String itemCls = "";
		String dividerCls = "";

		String template_item = "<li class=\"%s\">%s</li>";
		String template_divider = "<li class=\"%s\"><i class=\"fa fa-angle-right\"></i></li>";

		String path_to_resources[]= new String[3];
		if(lang.equalsIgnoreCase("EN")){
			path_to_resources[0] = "messages_en_US";
			path_to_resources[1] = "provie_en_US";
			path_to_resources[2] = "wealthree_en_US";
		} else {
			path_to_resources[0] = "messages_zh_HK";
			path_to_resources[1] = "provie_zh_HK";
			path_to_resources[2] = "wealthree_zh_HK";
		}

		ResourceBundle resource = ResourceBundle.getBundle(path_to_resources[0]);
		ResourceBundle resource_provie = ResourceBundle.getBundle(path_to_resources[1]);
		ResourceBundle resource_wealthree = ResourceBundle.getBundle(path_to_resources[2]);
	
		for( int i=0; i<bcList.length; i++ ){

			isActive = (breadcrumbActive==i)?true:false;
			isLast = (i==bcList.length-1)?true:false;

			if( isActive ){
				itemCls = "breadcrumb__item breadcrumb__item--active";
				dividerCls = "breadcrumb__divider breadcrumb__divider--active";
			}else {
				itemCls = "breadcrumb__item";
				dividerCls = "breadcrumb__divider";
			}

			if ( isLast && isBold ){
				itemCls += " breadcrumb__item--last";
				dividerCls += "breadcrumb__divider--last";
			}
			
			//render divider
			if( i!=0 ){
				output += String.format(template_divider, dividerCls);
			}
			//render breadcrumb item
			//output += String.format(template_item, itemCls, bcList.get(i));
			String translated_str = "";
			if(resource.containsKey(bcList[i])){			
				translated_str = resource.getString(bcList[i]);	
			} else if(resource_provie.containsKey(bcList[i])){			
				translated_str = resource_provie.getString(bcList[i]);
			} else if(resource_wealthree.containsKey(bcList[i])){			
				translated_str = resource_wealthree.getString(bcList[i]);
			}
			output += String.format(template_item, itemCls, translated_str);
		}

		return output;
	}
%>


<div class="comp breadcrumb">
	<ul class="breadcrumb__list breadcrumb__list--none">
		<%= createBreadcrumb(breadcrumbItems, breadcrumbActive, breadcrumbBold, lang) %>
	</ul>
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
