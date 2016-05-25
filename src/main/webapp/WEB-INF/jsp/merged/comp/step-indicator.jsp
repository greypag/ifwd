<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ifwd.fwdhk.controller.UserRestURIConstants"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/stepIndicator.css">

<% 
   String contentPath = request.getContextPath();

   String[] stepItems = request.getParameter("stepItems").replace(" ", "").split(",");
   int stepActive = Integer.parseInt(request.getParameter("stepActive"));
   String lang = ((String)session.getAttribute("uiLocale")).substring(0, 2);
%>

<%!
   public String createStepIndicatorDesktop(String contextPath, String[] stepList, int stepActive, String lang){

      String output = "";
      
      Boolean isActive = false;
      Boolean isCompleted = false;
      Boolean isLast = false;
      String numberCls = "";
      String contentCls = "";

      String template_item ="";
      String template_divider = "";
      String template_icon ="<i class=\"fa fa-check\"></i>";

      template_item += "<li class=\"stepIndicator__item pad-none\">";
      template_item += "<button class=\"stepIndicator__step\">";
      template_item += "<span class=\"stepIndicator__number %s\">%s</span>";
      template_item += "<span class=\"stepIndicator__content %s\">%s</span>";
      template_item += "</li>";

      template_divider += "<li class=\"stepIndicator__divider\">";
      template_divider += "<img src=\"" +contextPath+"/resources/images/savie-2016/header-browse-arrow.png\" class=\"browse-arrow\">";
      template_divider += "</li>";

      String path_to_resources = "";
      if(lang.equalsIgnoreCase("EN")){
         path_to_resources = "messages_en_US";
      } else {
         path_to_resources = "messages_zh_HK";
      }

      ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
   
      for( int i=0; i<stepList.length; i++ ){

         isActive = (stepActive==i)?true:false;
         isCompleted = (i<stepActive)?true:false;
         isLast = (i==stepList.length-1)?true:false;

         if( isCompleted ){
            numberCls = "stepIndicator__number--completed";
            contentCls = "stepIndicator__content--completed";
         }else if ( isActive ){
            numberCls = "stepIndicator__number--active";
            contentCls = "stepIndicator__content--active";
         }else {
            numberCls = "";
            contentCls = "";
         }
         
         //render divider
         if( i!=0 ){
            output += String.format(template_divider);
         }
         //render breadcrumb item
         //output += String.format(template_item, itemCls, stepList.get(i));

         output += String.format(template_item, numberCls, (i+1), contentCls, resource.getString(stepList[i]));
      }

      return output;
   }

   public String createStepIndicatorMobile(String contextPath, String[] stepList, int stepActive, String lang){

      String output = "";
      
      Boolean isActive = false;
      Boolean isLast = false;
      String numberCls = "";

      String template_arrow ="";
      String template_content = "";
      String template_stepof = "";

      template_arrow += "<div class=\"stepIndicator__arrow\">";
      template_arrow += "<a href=\"#\"><span class=\"icon-arrow-left2\"></span></a>";
      template_arrow += "</div>";

      template_content += "<div class=\"stepIndicator__content\">%s</div>";

      template_stepof += "<span class=\"stepIndicator__stepof\">%s out of %s</span>";


      String path_to_resources = "";
      if(lang.equalsIgnoreCase("EN")){
         path_to_resources = "messages_en_US";
      } else {
         path_to_resources = "messages_zh_HK";
      }

      ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
   
      
      output += String.format(template_arrow);
      output += String.format(template_content, resource.getString(stepList[stepActive]));
      output += String.format(template_stepof, stepActive+1, stepList.length);

      return output;
   }

   public String createStepIndicatorNumberOnly(String contextPath, String[] stepList, int stepActive, String lang){

      String output = "<ul class=\"stepIndicator__list\">";
      
      Boolean isActive = false;
      Boolean isCompleted = false;
      Boolean isLast = false;
      String itemCls = "";
      String numCls = "";
      String content = "";

      String template_item ="";
      String template_icon ="<i class=\"fa fa-check\"></i>";
      String template_number ="<span>%s</span>";
   
      template_item += "<li class=\"stepIndicator__item %s\">";
      template_item += "<a href=\"#\" class=\"stepIndicator__number %s\">%s</a>";
      template_item += "</li>";

      String path_to_resources = "";
      if(lang.equalsIgnoreCase("EN")){
         path_to_resources = "messages_en_US";
      } else {
         path_to_resources = "messages_zh_HK";
      }

      ResourceBundle resource = ResourceBundle.getBundle(path_to_resources);
   
      for( int i=0; i<stepList.length; i++ ){

         isActive = (stepActive==i)?true:false;
         isCompleted = (i<stepActive)?true:false;
         isLast = (i==stepList.length-1)?true:false;

         if( isCompleted ){
            numCls = "stepIndicator__number--completed";
            content = template_icon;
         } else if( isActive ){
            numCls = "stepIndicator__number--active";
            content = String.format(template_number, i+1);
         } else {
            numCls = "";
            content = String.format(template_number, i+1);
         }
         
         itemCls = (isLast)?"stepIndicator__item--last":"";


         output += String.format(template_item, itemCls, numCls, content);
      }

      output += "</ul>";
      output += "<div class=\"stepIndicator__stepLine\"></div>";

      return output;
   }
%>

<div class="comp stepIndicator stepIndicator--desktop hidden-xs hidden-sm">
   <div class="stepIndicator__container">
      <ul class="stepIndicator__list stepIndicator__list--none">
         <%= createStepIndicatorDesktop(contentPath, stepItems, stepActive, lang) %>
      </ul>
   </div>
  
</div>

<div class="comp stepIndicator stepIndicator--mobile hidden-lg hidden-md js-sticky-bar">
   <div class="stepIndicator__container">
      <%= createStepIndicatorMobile(contentPath, stepItems, stepActive, lang) %>
   </div>
</div>

<div class="comp stepIndicator stepIndicator--numberOnly hidden-lg hidden-md">
   <div class="stepIndicator__container">
      <%= createStepIndicatorNumberOnly(contentPath, stepItems, stepActive, lang) %>
   </div>
</div>


<script>

$(function() {
   $(window).bind('scroll', function() {
      stickToHeader();
   });
});

function stickToHeader() {
   if ($('.js-sticky-bar').length > 0 ) { // check if flux div exists
      
      var stickyTarget = $('.logobox > .navbar-header');
      var stickySource = $('.js-sticky-bar');
      var thresholdHeight = stickySource.height() + $('.breadcrumbs').height(); //min scroll height to trigger sticky behavior

      if ($(window).scrollTop() >= (thresholdHeight)) {
         stickySource.addClass('sticky-bar');
         stickySource.css('top', stickyTarget.height() + 'px');
      } else {
         stickySource.removeClass('sticky-bar');
         stickySource.removeAttr('style');
         stickySource.removeAttr('style');
      }
   }
}

</script>


<%--
<div class="container-fluid fwd-full-container browse-holder">
   <div class="application-page-header et-header-browse">
      <div class="browse-container">
         <div class="row reset-margin hidden-xs hidden-sm">
           <ul class="common-steps-list six-steps nav nav-pills">
               <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">1</span>Select Plan</button></li>
               <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
               <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application, Summary & Declaration</button></li>
               <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
               <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Signature</button></li>
               <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
               <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Payment</button></li>
               <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
               <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document Upload</button></li>
               <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
               <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
            </ul>
        </div>
      </div>  
      <div class="et-mobile-header-info hidden-md hidden-lg">
         <div class="clearfix">
            <div class="et-back-arrow">
               <a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#" class="back-arrow-link">
                  <span class="icon-arrow-left2 arrow-left"></span>
               </a>
            </div>
            <div class="et-header-tex">
               <h3 id="">Signature</h3>
            </div>
         </div>
         <span id="step-of">4 out of 5</span>
      </div>
   </div>
</div>
--%>