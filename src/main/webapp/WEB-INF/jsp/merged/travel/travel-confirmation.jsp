<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!--/#main-Content-->
<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /> </a > <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#"><fmt:message key="travel.breadcrumb1.item5" bundle="${msg}" /> </a> </li>
          <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="travel.breadcrumb1.item6" bundle="${msg}" /></li>
        </ol>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2><fmt:message key="travel.confirmation.jumbo" bundle="${msg}" /></h2>
            </div>
            <br>
            <div id="tr-wizard" class="shop-tracking-status">
        <div class="order-status has-four">
              <div class="order-status-timeline-new">
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
          </div>
        <div class="image-order-status image-order-status-new active img-circle first"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
          <div class="icon">1</div>
        </div>
        
        <div class="image-order-status image-order-status-intransit  img-circle second"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
          <div class="icon">2</div>
        </div>
        <div class="image-order-status image-order-status-delivered  img-circle third"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
          <div class="icon">3</div>
        </div>
        <div class="image-order-status image-order-status-completed  img-circle act fourth"> <span class="status color3 lst-status"><fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
          <div class="icon">4</div>
        </div>
      </div>
</div>
          </div>
        </div>

        
      <c:if test="${not empty errormsg}"><br><div id="confirm-error-msg" class="alert alert-danger hide"
                        role="alert">${errormsg}</div><br></c:if>
        
        <div class="container pad-none bdr">
          <div class="col-sm-12 gray-bg1" >

      <h3>
        <fmt:message key="travel.confirmation.msg.part1" bundle="${msg}" />
        <fmt:message key="travel.confirmation.msg.part2" bundle="${msg}" />
        <fmt:message key="travel.confirmation.msg.part3" bundle="${msg}" />
        <fmt:message key="travel.confirmation.msg.part4" bundle="${msg}" /><br/>
        <fmt:message key="travel.confirmation.msg.part5" bundle="${msg}" />
        ${emailAddress}
        <fmt:message key="travel.confirmation.msg.part6" bundle="${msg}" /></h3>
            
            <h4><fmt:message key="travel.confirmation.policyNo" bundle="${msg}" /><span> ${policyNo}</span></h4>
            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
            <h5><fmt:message key="travel.confirmation.referalCode.member" bundle="${msg}" /><span><%=session.getAttribute("myTravelReferralCode")%></span></h5>

            <div class="h4-3-b margin-left"><fmt:message key="travel.confirmation.referalCode.desc1" bundle="${msg}" /><!-- <span class="orange-star">*</span> --></div>
            </div>
              <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
              <img src="<%=request.getContextPath()%>/resources/images/agoda.png" alt="" class="img-responsive">  
              </div>
               <div class="clearfix"></div><br><br>

         <div class="h4-2 margin-left"><fmt:message key="travel.confirmation.referalCode.desc2.member" bundle="${msg}" /></div>
         
         <div class="col-md-7 col-sm-12 col-xs-12 pad-none">
         <div class=" wht-bg1 text-center" id="toBeCopied"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance?promo=<%=session.getAttribute("myTravelReferralCode")%></div>
              </div>
              <div class="col-md-5 col-sm-12 col-xs-12 pad-none"> 
              
                <div class="copy-link pull-left" id="d_clip_button" title="" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute"><fmt:message key="travel.referral.copy" bundle="${msg}" /></div>
<%--                   <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/	<%=request.getContextPath()%>/" data-title="iFWD"></div> --%>
                  <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance/sharing/" data-title="iFWD"></div>
                
                
                </div>
                
                <div class="clearfix"></div>
                <br>
              <div class="col-lg-12 col-md-12 travel-b">
              <div class="declaration-content1"> <b><fmt:message key="travel.referral.disclaimer" bundle="${msg}" /></b>
                <p>
                    <fmt:message key="travel.referral.disclaimer.section1.header" bundle="${msg}" /><br/>
                    <fmt:message key="travel.referral.disclaimer.section1.desc1" bundle="${msg}" /><br>
                    <fmt:message key="travel.referral.disclaimer.section1.desc2" bundle="${msg}" /><br>
                  	<fmt:message key="travel.referral.disclaimer.section2.header" bundle="${msg}" /><br>
                    <fmt:message key="travel.referral.disclaimer.section2.desc1" bundle="${msg}" /><br>
          			<fmt:message key="travel.referral.disclaimer.section3.desc.part1" bundle="${msg}" />
          			<a href="<fmt:message key="referral.tnc.link" bundle="${msg}" />" class="sub-link">
          				<fmt:message key="travel.referral.disclaimer.section3.desc.part2" bundle="${msg}" />
          			</a>
          			<fmt:message key="travel.referral.disclaimer.section3.desc.part3" bundle="${msg}" />
                </p></div>
              </div>
        
          </div>
          <div class="clearfix"></div>
        </div>
        <div class="spacer2"></div>
        <div class="container pad-none hidden-xs hidden-sm travel-homecare">
          <div class="row-fluid">
            <div class="center " style="visibility: visible;">
              <h4 class="center-h2"><fmt:message key="travel.confirmation.heading" bundle="${msg}" /></h4><br><br>
             <div class="col-md-3 col-lg-3 text-left pad-none"> <img src="<%=request.getContextPath()%>/resources/images/home7.png" alt=""> </div>
             <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
          <div>
            <div class="h2-32"><strong><fmt:message key="travel.confirmation.subheading" bundle="${msg}" /></strong></div>
            <br>

            <p class="h4-5"><fmt:message key="travel.confirmation.subheading.desc" bundle="${msg}" /></p><br>
        	<a href="<%=request.getContextPath()%>/${language}/home-insurance" class="border-radius btn btn-primary  get-btn" >
        	<fmt:message key="travel.confirmation.getQuote" bundle="${msg}" /></a>
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
