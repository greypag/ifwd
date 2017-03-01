<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="context" value="<%=request.getContextPath()%>"/>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<c:set var="langLink" value="${language == 'tc' ? 'zh-HK' : 'en-US'}" />
<c:set var="captchaLang" value="${language == 'tc' ? 'zh-TW' : 'en'}" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
</script>
<%!
      boolean isSaleActiveClass = true;
      boolean isEservicesActiveClass = false;
    %>         
<div class="fwd-savie-wrapper">
      <div class="container-fluid fwd-full-container">
                <div class="application-page-header et-header-browse">
          <div class="et-back-arrow hidden-xs hidden-sm">
            <a href="#" class="et-back-arrow-link">
              <span class="icon-arrow-left2 arrow-left"></span>
            </a>
            </div>
          <div class="row reset-margin hidden-xs hidden-sm">
                      <div class="col-md-4 reset-padding">
                          <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="plan-detail" data-et-section-target="et-select-plan-section"><fmt:message key="stepindicator.plan_details" bundle="${msg}" /></button>
                      </div>
                      <div class="col-md-4 reset-padding">
                          <button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="make-appointment" data-et-section-target="et-application-section"><fmt:message key="stepindicator.appointment" bundle="${msg}" /></button>
                      </div>
                      <div class="col-md-4 reset-padding">
                          <button type="button" class="et-header-info-btn et-bind-btn-header active" id="confirmation" data-et-section-target="et-dec-sign-section"><fmt:message key="stepindicator.confirmation" bundle="${msg}" /></button>
                      </div>
                  </div>

          <div class="et-mobile-header-info hidden-md hidden-lg">
            <div class="clearfix">
              <div class="et-back-arrow">
                <a href="#" class="et-back-arrow-link">
                  <span class="icon-arrow-left2 arrow-left"></span>
                </a>
              </div>
              <div class="et-header-tex">
                <h3 id="et-active-section-label"><fmt:message key="section.header.confirmation" bundle="${msg}" /></h3>
              </div>
            </div>
          </div>
        </div>
      </div>
        
      <div class="application-flux thank-you">
        <div class="container-fluid fwd-container thank-you-container">
          <div class="fwd-container hidden-xs hidden-sm clearfix">
            <div class="breadcrumbs pull-left">
              <ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
                <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
                <li class="divider"><i class="fa fa-play"></i></li>
                <li><a href="#"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></a></li>
                <li class="divider last"><i class="fa fa-play"></i></li>
                <li class="active-bc"><fmt:message key="breadcrumb.savie.confirmation" bundle="${msg}" /></li>
              </ol>
            </div>
          </div>
          <h1><fmt:message key="saviee.appointment.h1" bundle="${msg}" /><!--<br class="visible-xs" /><fmt:message key="savie.confirmation.offline.signing.up" bundle="${msg}" />--></h1>       
          <div class="details-container details-full" id="printable-area">
            <div class="row">
              <div class="col-xs-12">
                <h2 class="bring-things"><fmt:message key="oceanpark.confirmation.please.bring" bundle="${msg}" /></h2>
                <div class="row offline-procedure-row">
                  <div class="col-xs-12 col-md-4">
                    <div class="offline-procedure text-center">
                      <span class="step">1</span>
                      <p><fmt:message key="saviee.appointment.doucmenttobring1" bundle="${msg}" /></p>
                      <p class="small-text"><fmt:message key="savie.confirmation.offline.A.passport" bundle="${msg}" /></p>
                      <div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-1.jpg" class="img-responsive" /></div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-md-4">
                    <div class="offline-procedure text-center">
                      <span class="step">2</span>
                        <p>
                            <fmt:message key="saviee.appointment.doucmenttobring2" bundle="${msg}" />
                            <a href="<%=request.getContextPath()%>/<fmt:message key="link.address.proof" bundle="${msg}" />" target="_blank"><fmt:message key="savie.confirmation.offline.A.address.link.text" bundle="${msg}" /></a>
                            <fmt:message key="savie.confirmation.offline.A.address.part2" bundle="${msg}" />
                        </p>
                      <div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-2.jpg" class="img-responsive" /></div>
                    </div>
                  </div>
                  <div class="col-xs-12 col-md-4">
                    <div class="offline-procedure procedure-3 text-center">
                      <span class="step">3</span>
                      <p><fmt:message key="saviee.appointment.doucmenttobring3" bundle="${msg}" /></p>
                                            <p class="step3-2"><fmt:message key="oceanpark.confirmation.or.settle" bundle="${msg}" /></p>
                                            <div class="icon"><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-3-mob.png" class="img-responsive hidden-md hidden-lg" /><img src="<%=request.getContextPath()%>/resources/images/savie/o2o-landing/offline-procedure-3.png" class="img-responsive hidden-xs hidden-sm" /></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xs-12">
                                <div class="oceanpark-foot-message">
                                    <p><fmt:message key="oceanpark.confirmation.foot.part1" bundle="${msg}" /> <b><fmt:message key="oceanpark.confirmation.foot.part2" bundle="${msg}" /></b> <fmt:message key="oceanpark.confirmation.foot.part3" bundle="${msg}" /></p>
                </div>
              </div>
                            <div class="col-xs-12">
                            <h2 class="h2-orange"><fmt:message key="saviee.appointment.nexstep.title" bundle="${msg}" /></h2>
                                <div class="whats-next">
                                    <p><fmt:message key="saviee.appointment.nextstep.1" bundle="${msg}" /></p>
                                    <p><fmt:message key="saviee.appointment.nextstep.2" bundle="${msg}" /></p>
                                    <p><fmt:message key="saviee.appointment.nextstep.3" bundle="${msg}" /></p>
                                    <p><fmt:message key="saviee.appointment.nextstep.4" bundle="${msg}" /></p>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="detail">
                                    <h2 class="h2-orange"><fmt:message key="saviee.appointment.appointmentdescription.title" bundle="${msg}" /></h2>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription1" bundle="${msg}" /></label>
                                        <span class="pull-left">${preferred_date }</span>
                                    </div>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription2" bundle="${msg}" /></label>
                                        <span class="pull-left">${preferred_time }</span>
                                    </div>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription3" bundle="${msg}" /></label>
                                        <span class="pull-left">${centreDetails.serviceCentreName }</span>
                                    </div>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription4" bundle="${msg}" /></label>
                                        <span class="pull-left">${centreDetails.address }</span>
                                    </div>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription5" bundle="${msg}" /></label>
                                        <span class="pull-left">${applicationNumber }</span>
                                    </div>
                                    <div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription6" bundle="${msg}" /></label>
                                        <span class="pull-left">${centreDetails.phone }</span>
                                    </div>
                                    <!--<div class="appointment-detail clearfix">
                                        <label class="pull-left"><fmt:message key="saviee.appointment.appointmentdescription6" bundle="${msg}" /></label>
                                        <span class="pull-left">${centreDetails.operationHours }</span>
                                    </div>-->
                                    <div class="appointment-detail clearfix print hidden-xs hidden-sm">
                                        <div class="print-image-holder">
                                            <img src="<%=request.getContextPath()%>/resources/images/savie/print-logo.png" alt="Print" class="">
                                            <p onclick="window.print()"><fmt:message key="savie.confirmation.offline.Print" bundle="${msg}" /></p>
                                        </div>
                                    </div>
                                    <!--<div class="appointment-back-home pull-left pad-none">
                                        <a class="bdr-curve btn btn-primary bck-btn" href="<%=request.getContextPath()%>/${language}/savings-insurance"><fmt:message key="cta.back.to.home" bundle="${msg}" /></a>
                                    </div>-->
                                    <div class="text-center">
                                      <button class="btn next confirm-appointment" type="button" id="btn-back-to-home"><fmt:message key="cta.back.to.home" bundle="${msg}" /></button>
                                    </div>                                
                                    <div class = "share-container text-center" >        
                                      <!--<p><fmt:message key="savie.confirmation.offline.Follow.us" bundle="${msg}" /></p>     
                                      < div class = "clearfix" >        
                                      <a href="#"> <i class="fa fa-facebook"></i></a>   
                                      <a href="#"> <i class="fa fa-twitter"></i></a>    
                                      <a href="#"> <i class="fa fa-google-plus"> </i></a>
                                      </div>--> 
                                    </div>
                                </div>
                            </div>
            </div>
          </div>
        </div>
      </div>
            <!-- BACK TO TOP -->
            <a href="#" id="gotop" class="go-top go-top-default"><img src="<%=request.getContextPath()%>/resources/images/savie/back-to-top.png"></a>
      
      <!-- FOOTER -->
    </div>
    
    <!-- JS INCLUDES -->
    
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrap-datepicker.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jasny-bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie/bootstrap-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie/jquery.touchSwipe.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/bootstrapValidator.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/fwd-validation.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/placeholders.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/savie/date.format.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/jquery.timepicker.min.js"></script>
    
    <script type="text/javascript">
      $(function() {
        $('#print-this-page').click(function(){
          w=window.open();
          w.document.write($('#printable-area').html());
          w.print();
          w.close();
        });
        
        $('#btn-back-to-home').on('click', function(e) {
                window.onbeforeunload=null;
                window.location.href= '<%=request.getContextPath()%>/${language}/savings-insurance';
        });

      });
    </script>