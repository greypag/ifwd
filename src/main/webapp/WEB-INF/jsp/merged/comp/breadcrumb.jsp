<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ResourceBundle"%>

<% 
	String productName = request.getParameter("productName");
	int activeBreadcrumb = Integer.parseInt(request.getParameter("activeBreadcrumb"));
	//String lang = ((String) request.getAttribute("language")).toUpperCase();
	String lang = "ZH";

	ArrayList<String> breadcrumb = new ArrayList<String>();
	switch(productName){
		case "easyHealth":
			breadcrumb.add("breadcrumb.home");
			breadcrumb.add("breadcrumb.savie.category");
			breadcrumb.add("breadcrumb.savie.product");
			breadcrumb.add("breadcrumb.savie.plan_details");
			breadcrumb.add("breadcrumb.savie.appointment");
			breadcrumb.add("breadcrumb.savie.confirmation");
			break;
		case "savie-online":
			breadcrumb.add("breadcrumb.home");
			breadcrumb.add("breadcrumb.savie.category");
			breadcrumb.add("breadcrumb.savie.product");
			breadcrumb.add("breadcrumb.savie.plan_details");
			breadcrumb.add("breadcrumb.savie.appointment");
			breadcrumb.add("breadcrumb.savie.confirmation");
			break;
		default:
			break;
	}
%>

<%!
	public String createBreadcrumb(ArrayList<String> bcList, int activeBreadcrumb, String lang){

		String output = "";
		
		Boolean isActive = false;
		Boolean isLast = false;
		String itemCls = "";
		String dividerCls = "";

		String template_item = "<li class=\"%s\">%s</li>";
		String template_divider = "<li class=\"%s\"><i class=\"fa fa-play\"></i></li>";

		String path_to_resources = "";
		if( lang =="EN" ){
			path_to_resources = "resources/messages_en_US";
		} else {
			path_to_resources = "resources/messages_zh_HK";
		}

		//ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
	
		for( int i=0; i<bcList.size(); i++ ){

			isActive = (activeBreadcrumb==i)?true:false;
			isLast = (i==bcList.size()-1)?true:false;

			itemCls = (isActive)?"breadcrumb__item breadcrumb__item--active":"breadcrumb__item";
			dividerCls = (isActive)?"breadcrumb__divider breadcrumb__divider--active":"breadcrumb__divider";

			//render divider
			if( i!=0 ){
				output += String.format(template_divider, dividerCls);
			}
			//render breadcrumb item
			output += String.format(template_item, itemCls, bcList.get(i));
			//output += String.format(template_item, itemCls, resource.getString(bcList.get(i)));
		}

		return output;
	}
%>


<div class="comp breadcrumb">
	<div class="breadcrumb-container">
	   <ul class="breadcrumb__list breadcrumb__list--none">
	       <%= createBreadcrumb(breadcrumb, activeBreadcrumb, lang) %>
	   </ul>
	</div>
</div>

<!--
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
-->
