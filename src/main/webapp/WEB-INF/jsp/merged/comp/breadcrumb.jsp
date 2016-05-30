<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/comp/breadcrumb.css">

<% 
	String planIndex = request.getParameter("planIndex");
	String pageIndex = request.getParameter("pageIndex");
	int activeBreadcrumb = 0;
	//String lang = ((String) request.getAttribute("language")).toUpperCase();
	String lang = ((String)session.getAttribute("uiLocale")).substring(0, 2);

	ArrayList<String> breadcrumb = new ArrayList<String>();

	switch(planIndex){
		case "easy_health":
			breadcrumb.add("breadcrumb.item.home");
			breadcrumb.add("breadcrumb.item.protect");
			breadcrumb.add("breadcrumb.item.health");
			breadcrumb.add("breadcrumb.item.easyhealth");
			breadcrumb.add("breadcrumb.item.application");

			switch(pageIndex){
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH:
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PLAN_OPTION: activeBreadcrumb = 3; break;
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_UNDERWRITING:
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_SIGNATURE:
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_PAYMENT:
				case UserRestURIConstants.PAGE_PROPERTIES_EASYHEALTH_CONFIRMATION: activeBreadcrumb = 4; break;
				default: activeBreadcrumb = 3; break;
			}
			break;
		case "savie_online":
			breadcrumb.add("breadcrumb.item.home");
			breadcrumb.add("breadcrumb.item.save");
			breadcrumb.add("breadcrumb.item.savie");
			breadcrumb.add("breadcrumb.item.application");

			switch(pageIndex){
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LANDING: 
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SINGLE_PREMIUM:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_REGULAR_PREMIUM:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PLANDETAILS:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_FNA: 
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PRODUCT:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_REVIEW: activeBreadcrumb = 2; break;
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SALES_ILLUSTRATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_FATCA:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PERSONAL_DETAILS:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_EMPLOYMENT_INFO:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_BENEFICARY_INFO:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_PAYMENT:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_POLICY_SUMMARY:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DECLARATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_SIGNATURE:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_LIFE_DOCUMENT_UPLOAD:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_CONFIRMATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_UPLOAD_LATER_CONFIRMATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SIGN_OFFLINE_CONFIRMATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_PAY_LATER_CONFIRMATION:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_SP:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_CONFIRMATION_APPOINTMENT_RP:
				case UserRestURIConstants.PAGE_PROPERTIES_SAVIEONLINE_SERVICE_CENTER: activeBreadcrumb = 3; break;
				default: activeBreadcrumb = 2; break;
			}

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
		if(lang.equalsIgnoreCase("EN")){
			path_to_resources = "messages_en_US";
		} else {
			path_to_resources = "messages_zh_HK";
		}

		ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
	
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
			//output += String.format(template_item, itemCls, bcList.get(i));
			output += String.format(template_item, itemCls, resource.getString(bcList.get(i)));
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
