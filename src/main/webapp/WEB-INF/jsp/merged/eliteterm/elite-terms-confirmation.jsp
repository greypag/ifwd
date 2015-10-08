<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css">
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper" id= "etConfirm">


			<div class="fwd-container container-fluid breadcrumbs hidden-xs hidden-sm">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
                  <li><a href="#">Home</a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Protection </a></li>
                  <li class="divider"><i class="fa fa-play"></i></li>
                  <li><a href="#">Elite term </a></li>
                  <li class="divider last"><i class="fa fa-play"></i></li>
                  <li class="active-bc" id="et-active-bc-menu">Confirmation</li>
               </ol>
            </div>

			<!--Elite Terms Header Info Widget-->

			<div class="container-fluid fwd-full-container">
				<div class="application-page-header et-header-browse">
					<div class="clearfix reset-margin hidden-xs hidden-sm">
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="select-plan" data-et-section-target="et-select-plan-section">Select plan</button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="application" data-et-section-target="et-application-section" >Application</button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header no-hover" id="payment" data-et-section-target="et-dec-sign-section">Payment</button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn no-hover" id="summary" data-toggle="modal" data-target="#summary-modal">Upload document</button>
						</div>
						<div class="reset-padding">
							<button type="button" class="et-header-info-btn et-bind-btn-header active no-hover" id="confirmation" data-et-section-target="et-confirmation-section">Confirmation</button>
						</div>
					</div>
					<div class="et-mobile-header-info hidden-md hidden-lg">
						<div class="clearfix">
							<!--<div class="et-back-arrow">
								<a href="#" class="et-back-arrow-link">
									<span class="icon-arrow-left2 arrow-left"></span>
								</a>
							</div>-->
							<div class="et-header-tex">
								<h3 id="et-active-section-label">Confirmation</h3>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="application-flux">        
				<div class="container-fluid fwd-container thank-you-container">
               
               <p class="et-confimation-du-note">Please be reminded to upload your documents at the eServices page to complete your application.</p>
             
					<h2>Thank you <span class="et-title-break" /> for your purchase!</span></h2>
					
					<div class="details-container">
                  <div class="detail">
                     <h3 class="acknowledge">Acknowledgement</h3>
                     <p>Your application is successfully processed. The confirmation email has been sent to daiman@gmail.com
                     you can review the detail of your application</p>
                  </div>
							
                  <div class="detail">
                     <h3 class="policy">Policy Number: <span class="policy-number">093KG35JH</span></h3>								
                  </div>
					</div>
					
					<div class="agent-container">
						<h2 class= "agent">Please enter your agent's email below<span class="hidden-xs hidden-sm">:</span></h2>
						<p class="agent-desc et-agent-desc">If you already have an insurance agent from FWD currently serving your needs, please provide his/her email address:</p>
						
                  <form action="" method="POST" class="form-horizontal" id="et-confimation-email-form">
                     <div class="form-group">
                        <div class="col-xs-7 col-md-4 col-md-offset-3 et-input-email">
                           <input type="email" name="agent-email" id="agent-email" placeholder="your.agent@fwd.com" />	
                        </div>
                        <div class="col-xs-5 col-md-2 et-submit">
                           <button type="submit" value="Submit" class="btn">Submit</button>
                        </div> 
                     </div>
                  </form>
                  
                  <p class="submitted-info hide-element">You have submitted your agent email.</p>
							
					</div>
					
               <div class="row">
                  <div class="col-xs-12 text-center">
                     <a href="#" title="Back to home" class="btn next et-back-home-btn">Back to home</a>
                  </div>
               </div>
				</div>
			</div>
			
			<!-- FOOTER -->
		</div>
		
		<!-- JS INCLUDES -->
		<script>
         
         $('#et-confimation-email-form').on('submit', function(e){
            e.preventDefault();
            
            var $self = $(this);
            
            $self.next('.submitted-info')
                  .removeClass('hide-element');
            $self.hide();
         });
            
         /*$(document).on('click', '.et-header-info-btn', function(e) {
            e.preventDefault();
            
            var url = 'elite-terms-select-plan.jsp';
            var $self = $(this);
            
            if ($self.attr('id') === 'select-plan') {
               url += '#select-plan';
               window.location.href = url;
            } else if ($self.attr('id') === 'application') {
               url += '#application';
               window.location.href = url;
            }            
         });*/ 
		</script>
