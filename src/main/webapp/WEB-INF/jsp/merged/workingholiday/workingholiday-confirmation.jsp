<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.ifwd.fwdhk.util.Constants"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
  /* Show Different Referral Benefits for Visitor & Member */
  String currUser = session.getAttribute("username").toString().trim();
  Boolean isMember = !(currUser == null || currUser.equals(Constants.DEFAULT_USERNAME));
  String userType = (isMember)?"member":"visitor";

  String key_promocodeLabel = "workingholiday.confirmation." + userType + ".promocodeLabel";
  String key_referralCodeDesc = "workingholiday.confirmation." + userType + ".referralCodeDesc";

  String key_header1 = "workingholiday.referral.benefits." + userType + ".table.header1";
  String key_header2 = "workingholiday.referral.benefits." + userType + ".table.header2";
  String key_header3 = "workingholiday.referral.benefits." + userType + ".table.header3";
  String key_header4 = "workingholiday.referral.benefits." + userType + ".table.header4";

  String key_row1col1 = "workingholiday.referral.benefits." + userType + ".table.row1.col1";
  String key_row1col2 = "workingholiday.referral.benefits." + userType + ".table.row1.col2";
  String key_row1col3 = "workingholiday.referral.benefits." + userType + ".table.row1.col3";
  String key_row1col4 = "workingholiday.referral.benefits." + userType + ".table.row1.col4";

  String key_row2col1 = "workingholiday.referral.benefits." + userType + ".table.row2.col1";
  String key_row2col2 = "workingholiday.referral.benefits." + userType + ".table.row2.col2";
  String key_row2col3 = "workingholiday.referral.benefits." + userType + ".table.row2.col3";
  String key_row2col4 = "workingholiday.referral.benefits." + userType + ".table.row2.col4";

  String key_row3col1 = "workingholiday.referral.benefits." + userType + ".table.row3.col1";
  String key_row3col2 = "workingholiday.referral.benefits." + userType + ".table.row3.col2";
  String key_row3col3 = "workingholiday.referral.benefits." + userType + ".table.row3.col3";
  String key_row3col4 = "workingholiday.referral.benefits." + userType + ".table.row3.col4";

  String key_row4col1 = "workingholiday.referral.benefits." + userType + ".table.row4.col1";
  String key_row4col2 = "workingholiday.referral.benefits." + userType + ".table.row4.col2";
  String key_row4col3 = "workingholiday.referral.benefits." + userType + ".table.row4.col3";
  String key_row4col4 = "workingholiday.referral.benefits." + userType + ".table.row4.col4";
  
  String key_row6col1 = "workingholiday.referral.benefits." + userType + ".table.row6.col1";
  String key_row6col2 = "workingholiday.referral.benefits." + userType + ".table.row6.col2";
  String key_row6col3 = "workingholiday.referral.benefits." + userType + ".table.row6.col3";
  String key_row6col4 = "workingholiday.referral.benefits." + userType + ".table.row6.col4";

  String key_disclaimer1 = "workingholiday.referral.benefits." + userType + ".disclaimer1";
  String key_disclaimer2Part1 = "workingholiday.referral.benefits." + userType + ".disclaimer2.part1";
  String key_disclaimer2Part2 = "workingholiday.referral.benefits." + userType + ".disclaimer2.part2";
  String key_disclaimer2Part3 = "workingholiday.referral.benefits." + userType + ".disclaimer2.part3";
%>
<!--/#main-Content-->
<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2><fmt:message key="workingholiday.confirmation.jumbo" bundle="${msg}" /></h2>
            </div>
            <br>
            <div id="tr-wizard" class="shop-tracking-status">
        <div class="order-status has-four">
              <div class="order-status-timeline-new">
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
          </div>
        <div class="image-order-status image-order-status-new active img-circle first"> <span class="status color3"><fmt:message key="workingholiday.breadcrumb2.item1" bundle="${msg}" /></span>
          <div class="icon">1</div>
        </div>
        
        <div class="image-order-status image-order-status-intransit  img-circle second"> <span class="status color3"><fmt:message key="workingholiday.breadcrumb2.item2" bundle="${msg}" /></span>
          <div class="icon">2</div>
        </div>
        <div class="image-order-status image-order-status-delivered  img-circle third"> <span class="status color3"><fmt:message key="workingholiday.breadcrumb2.item3" bundle="${msg}" /></span>
          <div class="icon">3</div>
        </div>
        <div class="image-order-status image-order-status-completed  img-circle act fourth"> <span class="status color3 lst-status"><fmt:message key="workingholiday.breadcrumb2.item4" bundle="${msg}" /></span>
          <div class="icon">4</div>
        </div>
      </div>
</div>
          </div>
        </div>
        <ol class="breadcrumb pad-none">
          <li><fmt:message key="workingholiday.breadcrumb1.item1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
          <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
          <li><fmt:message key="workingholiday.breadcrumb1.item2" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
          <!--<li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item3" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item4" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#"><fmt:message key="workingholiday.breadcrumb1.item5" bundle="${msg}" /> </a> </li>-->
          <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="workingholiday.breadcrumb1.item6" bundle="${msg}" /></li>
        </ol>
        
      <c:if test="${not empty errormsg}"><br><div id="confirm-error-msg" class="alert alert-danger hide"
                        role="alert">${errormsg}</div><br></c:if>
        
        <div class="container pad-none bdr" style="margin-top:0px;">
          <div class="col-sm-12 pad-none" >
            <div style="width:80%;margin-left:10%">
              <h3 class="bmg-confirmation-h3">
                <fmt:message key="workingholiday.confirmation.msg.part1" bundle="${msg}" />
                <fmt:message key="workingholiday.confirmation.msg.part2" bundle="${msg}" />
                <fmt:message key="workingholiday.confirmation.msg.part3" bundle="${msg}" />
                <fmt:message key="workingholiday.confirmation.msg.part4" bundle="${msg}" />
                <fmt:message key="workingholiday.confirmation.msg.part5" bundle="${msg}" />
                <strong><%=session.getAttribute("emailAddress")%></strong>
                <fmt:message key="workingholiday.confirmation.msg.part6" bundle="${msg}" />
              </h3>
              <h4 class="bmg-confirmation-h4"><strong><fmt:message key="workingholiday.confirmation.policyNo" bundle="${msg}" /></strong><span> ${referenceNo}</span></h4>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-10">
                <div style="width:80%;margin-left:10%">
              
              <!--Promo Code  -->
              <!-- END Promo Code Table -->


              <!--Referral Code Table -->
              <!-- END Referral Code Table -->

                </div>
              </div>
            
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none gray-bg1" style="padding-bottom:10px;">
                <div style="width:80%;margin-left:10%; margin-top:20px; margin-bottom:20px;">
                <!--Partnership Logo-->
                <!--END Partnership Logo-->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-20">
                  <div class="col-md-7 col-sm-12 col-xs-12 pad-none">
                      <div class=" wht-bg1 text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/working-holiday-insurance</div>
                      <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage"><fmt:message key="link.copy.desktop" bundle="${msg}" /></span> <span class="boxDownArrow"></span> </div>
                  </div>
                  <div class="col-md-5 col-sm-12 col-xs-12 pad-none"> 
                      <!-- <div class="copy-link pull-left" id="d_clip_button" title="" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">
                          <fmt:message key="workingholiday.referral.copy" bundle="${msg}" />
                      </div> -->
                      
                      <div class="copy-link pull-left" onclick="autoSelect('toBeCopied');">
                          <fmt:message key="workingholiday.referral.copy" bundle="${msg}" />
                      </div>
                      
      <%--                   <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/  <%=request.getContextPath()%>/" data-title="iFWD"></div> --%>
                      <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/working-holiday-insurance/sharing/" data-title="iFWD"></div>
                  </div>
                </div>
                
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>

          <div class="container pad-none hidden-xs hidden-sm travel-homecare" style="margin-top:30px;">
            <div class="row-fluid">
              <div class="center " style="visibility: visible;">
                <div class="col-md-3 col-lg-3 text-left pad-none">
                  <img src="<%=request.getContextPath()%>/resources/images/home7.png" alt=""> </div>
                <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
                  <div>
                    <h4 class="center-h2"><fmt:message key="workingholiday.confirmation.heading" bundle="${msg}" /></h4>                  
                    <div class="h2-32" style="margin-top:30px;">
                      <strong><fmt:message key="workingholiday.confirmation.subheading" bundle="${msg}" /></strong>
                    </div>
                    <br>
                    <p class="h4-5"><fmt:message key="workingholiday.confirmation.subheading.desc" bundle="${msg}" /></p><br>
                    <a href="<%=request.getContextPath()%>/${language}/home-insurance" class="border-radius btn btn-primary  get-btn" >
                    <fmt:message key="workingholiday.confirmation.getQuote" bundle="${msg}" /></a>
                  </div>
                </div>
              </div>  
            </div>
          </div>

        </div>
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container-->
</section>

<!--/end- Main Content-->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<script type=text/javascript>
   var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
   document.write('<scr'+'ipt src="', hostProtocol+
   '://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
</script>
<script type=text/javascript>
   var params = new Array();
   params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
   params[1]='type=Registration_Working_Holiday';
   params[2]='val=${dueAmount}';
   params[3]='orderId=${transNo}';
   if ('${language}'==='en'){
	   params[4]='promoCode=Regis_Working_Holiday EN_Sc';
   } else {
	   params[4]='promoCode=Regis_Working_Holiday ZH_Sc';   
   }
   params[5]='valueCurrency=USD';
   params[6]='GCID='; //For Live Tracking only
   params[7]='kw='; //For Live Tracking only
   params[8]='product='; //For Live Tracking only
   k_trackevent(params,'5198');
</script>

<noscript>
	<c:choose>
		<c:when test="${language=='en'}">
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Working_Holiday&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Working_Holiday EN_Sc&valueCurrency=HKD&GCID=&kw=&product=" width="1" height="1">
   		</c:when>
   		<c:otherwise>
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Working_Holiday&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Working_Holiday ZH_Sc&valueCurrency=HKD&GCID=&kw=&product=" width="1" height="1">
   		</c:otherwise>
   	</c:choose>
</noscript>

<script>
$(document).ready(function() {
	ga('create', 'UA-60032236-1', 'auto');
	ga('require', 'ecommerce');
	ga('ecommerce:addTransaction', {
	  'id': '${transNo}', // Transaction ID. Required.
	  'revenue': '${dueAmount}', // Grand Total.
	  'affiliation': 'Working Holiday' // Insurance type, e.g. Life

	  });
	ga('ecommerce:addItem', {
	      'id': '${transNo}', // Transaction ID. Required
	      'name': 'Working HolidayCare', // Product name. Required
	      'category': 'Travel', // Category or variation
	      'price': '${dueAmount}', // Unit price
	      'quantity': '1',
	      'currency': 'HKD'
	    });
	ga('ecommerce:send');
});

</script>
