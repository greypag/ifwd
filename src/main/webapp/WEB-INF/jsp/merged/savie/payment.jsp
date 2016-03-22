<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
<%!
	boolean isSaleActiveClass = false;
	boolean isEservicesActiveClass = false;
%>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="payment-page">
	<!-- HEADER -->
	<div class="fwd-container container-fluid breadcrumbs">
		<div class="breadcrumb-container">
            <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /></a></li>
               <li class="divider last"><i class="fa fa-play"></i></i></li>
               <li class="active-bc" id="et-active-bc-menu"><fmt:message key="breadcrumb.savie.selectplan" bundle="${msg}" /></li>
            </ol>
         </div>
    </div>
    <!-- STEPS -->
	<div class="container-fluid fwd-full-container browse-holder">
		<div class="application-page-header et-header-browse">
		   <div class="browse-container">
			  <div class="row reset-margin hidden-xs hidden-sm">
				 <ul class="common-steps-list six-steps nav nav-pills">
					<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span><fmt:message key="stepindicator.savie.confirmation" bundle="${msg}" /></button></li>
				 </ul>
			 </div>
		   </div>  
		   <div class="et-mobile-header-info hidden-md hidden-lg">
			  <div class="clearfix">
				 <div class="et-back-arrow">
					<a href="#" class="back-arrow-link">
					   <span class="icon-arrow-left2 arrow-left"></span>
					</a>
				 </div>
				 <div class="et-header-tex">
					<h3 id=""><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></h3>
				 </div>
				 <p id="step-of">2 of 6</p>
			  </div>
		   </div>
		</div>
	</div>
	<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
		<div class="step-indicator-container clearfix">
			<ul class="common-step-indicator six-steps nav nav-pills">
				 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li><a href="#" class="active"><span class="step-no">2</span></a></li>
				 <li><a href="#"><span class="step-no">3</span></a></li>
				 <li><a href="#"><span class="step-no">4</span></a></li>
				 <li><a href="#"><span class="step-no">5</span></a></li>
				 <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
			</ul>
			<div class="step-line"></div>
		</div>
	</div>
	<div class="container-fluid fwd-full-container headerStick">
		<!--<div class="fwd-container-limit clearfix sidebar page-application">-->
		<div class="fwd-container-limit clearfix sidebar">
			<div class="payment-content-wrapper">
				<p class="panel-title"><fmt:message key="label.payment.title" bundle="${msg}" /></p>						
				
				<div class="radio-group clearfix">
				   <div class="radio-button-group">
					  <div class="clearfix desktop-align left cstm-md-col">
						 <div class="pull-left radio-holder">
							<input type="radio" id="payment-debit" name="payment" value="true" checked="checked"> <label for="payment-debit"></label>
						 </div>
						 <div class="text-bold pull-left desc">
								<fmt:message key="option.direct.debit" bundle="${msg}" />
						 </div>
					  </div>
					  <div class="clearfix below desktop-align">
						 <div class="pull-left radio-holder">
							<input type="radio" id="payment-later" name="payment" value="false"> <label for="payment-later"></label>
						 </div>
						 <div class="text-bold pull-left desc">
								<fmt:message key="option.pay.later" bundle="${msg}" />
						 </div>
					  </div>
				   </div>
				</div>
				<div id="errorMsg" style="color: red;"></div>
				
				<form action="" id="paymentForm" method="post">
					<div id="direct-debit-panel">
						<p class="payment-policy-wrapper"><fmt:message key="label.payment.period.tnc" bundle="${msg}" /></p>
						<div class="row">
							<div class="col-xs-12 col-md-6">
								<div class="info-wrapper">
									<p class="info-label"><fmt:message key="placeholder.total.amount" bundle="${msg}" /></p>
									<p class="info-value">
									   HK$ ${saviePlanDetails.insuredAmount1 }
									   <input type="hidden" name="paymentAmount" value="${saviePlanDetails.insuredAmount }">
									</p>
								</div>
								<div class="info-wrapper">
									<p class="info-label"><fmt:message key="placeholder.direct.debit" bundle="${msg}" /></p>
									<p class="info-value">
										<fmt:message key="placeholder.direct.debit.copy" bundle="${msg}" />
									   <input type="hidden" name="paymentMethod" value="Direct Debit">
									</p>
								</div>
								<div class="info-wrapper">
									<p class="info-label"><fmt:message key="placeholder.name" bundle="${msg}" /></p>
									<p class="info-value">
									   ${userDetails.fullName }
									   <input type="hidden" name="accountHolderName" value="${userDetails.fullName }">
									</p>
								</div>
							</div>
							
							<%-- <div class="col-xs-12 col-md-6">
								<div class="form-group">
									<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="paymentAmount" name="paymentAmount" value="${saviePlanDetails.insuredAmount }">
										<label class="mdl-textfield__label" for="paymentAmount">Amount</label>
									</div>
									<span class="error-msg" id="paymentAmountErMsg"></span>
								</div>
								<!-- <div class="form-group">
									<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="paymentMethod" name="paymentMethod" value="Direct debit">
										<label class="mdl-textfield__label" for="paymentMethod">Payment Method</label>
									</div>
									<span class="error-msg" id="paymentMethodErMsg"></span>
								</div> -->
								<div class="form-group">
									<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="accountHolderName" name="accountHolderName" value="${userDetails.fullName }">
										<label class="mdl-textfield__label" for="accountHolderName">Bank account holder name</label>
									</div>
									<span class="error-msg" id="accountHolderNameErMsg"></span>
								</div>
							</div> --%>
							
							<div class="col-xs-12 col-md-6">
								<div class="payment-select-wrapper">
									<p class="bank-info-select-label"><fmt:message key="placeholder.bank.name" bundle="${msg}" /></p>
								   <div class="selectDiv centreDiv gray-text-bg">
										<select name="bankCode" id="bank_code" onchange="getBranchCode(this.value,'${language }');" class="form-control gray-dropdown">
											<option selected disabled value=""><fmt:message key="placeholder.bank.name" bundle="${msg}" /></option>
											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${bankCodeEN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.bankCode == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${bankCodeCN}">
												    <c:set var="code" value="${list.itemCode }-${list.itemDesc }"/>
													<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifePayment.bankCode == code}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
									 </div>
									 <span class="error-msg" id="bankCodeErMsg"></span>
								</div>
								<div class="form-group">
									<div class="so-mdl-textfield mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
										<input class="mdl-textfield__input so-mdl-textfield-input" type="text" id="bankAccountNo" name="accountNumber" maxlength="9" value="${lifePayment.accountNumber }">
										<label class="mdl-textfield__label" for="bankAccountNo"><fmt:message key="placeholder.account.no" bundle="${msg}" /></label>
									</div>
									<span class="error-msg" id="bankAccountNoErMsg"></span>
								</div>
								<div class="form-group">
									<div class="selectDiv centreDiv gray-text-bg">
										<label class="mdl-textfield__label cstm-dropdown-label"><fmt:message key="placeholder.branch.name" bundle="${msg}" /></label>
										<select name="branchCode" id="bank_name" class="form-control gray-dropdown">
											<option selected disabled value=""><fmt:message key="placeholder.branch.name" bundle="${msg}" /></option>
											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${branchCodeEN}">
													<option value="${list.itemCode }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${branchCodeCN}">
													<option value="${list.itemCode }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
									</div>
									<span class="error-msg" id="branchNameErMsg"></span>
								</div>
								
								<%-- <div class="form-group">
									<div class="selectDiv centreDiv gray-text-bg">
										<label class="mdl-textfield__label cstm-dropdown-label">Branch name (code)</label>
										<select name="branchCode" id="bank_name" class="form-control gray-dropdown">
											<option selected disabled value="">Branch name (code)</option>
											<c:if test="${language == 'en'}">
												<c:forEach var="list" items="${branchCodeEN}">
													<option value="${list.itemCode }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
											<c:if test="${language == 'tc'}">
												<c:forEach var="list" items="${branchCodeCN}">
													<option value="${list.itemCode }" <c:if test="${lifePayment.branchCode == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
												</c:forEach>
											</c:if>
										</select>
										<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
									</div>
									<span class="error-msg" id="branchNameErMsg"></span>
								</div> --%>
							</div>
						</div>
						<div class="form-group payment-policy-wrapper" id="has-err">
							<input type="checkbox" id="payment_confirm_authorize" name="payment_confirm_authorize">
							<label for="payment_confirm_authorize"></label>
							<p class="policy-text"><fmt:message key="decleration.policy.owner" bundle="${msg}" /></p>
						</div>
						<span id="chkPolicyErMsg" class="error-msg hidden"><fmt:message key="error.payment.tick.box" bundle="${msg}" /></span>
					</div>
				</form>	
				<!-- merge with pay later -->
				<form action="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}" id="payLaterForm" method="post">
					<div id="pay-later-page" class="hidden">
						<div class="make-an-appointment clearfix">
							<div class="col-xs-12 col-md-6" id="left-side-form">
								<h5><fmt:message key="label.service.centre.title" bundle="${msg}" /></h5>
								<p class="confirm-call"><fmt:message key="label.appointment" bundle="${msg}" /></p>
								<div class="form-group">
									<div class="payment-select-wrapper">
										<p class="bank-info-select-label"><fmt:message key="Placeholder.centre" bundle="${msg}" /></p>
										<div class="selectDiv centreDiv gray-text-bg">
											<select name="centre" id="centre" class="form-control gray-dropdown">
												<!--<option value="" disabled="disabled" selected="selected">Customer Service Centre</option>-->
												<!-- <option value="1" selected="selected">Tsim Sha Tsui</option>
												<option value="2">Quarry Bay</option>
												<option value="3">Sheung Wan</option>
												<option value="4">Kwun Tong</option>
												<option value="5">Shatin</option> -->
												<c:choose>
											        <c:when test="${serviceCentre.serviceCentres.size() > 0}">
											            <c:forEach var="list" items="${serviceCentre.serviceCentres}">
	                                                           <option value="${list.serviceCentreCode }" <c:if test="${list.serviceCentreCode == csCenter }">selected="selected"</c:if>>${list.serviceCentreName }</option>
	                                                       </c:forEach>
											        </c:when>
											        <c:otherwise>
													    <option value="" ></option>
													</c:otherwise>
											    </c:choose>
											</select>
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<span class="error-msg" id="customerServiceCentreErMsg"></span>
								</div>
								
								<div class="centre-info visible-xs visible-sm" id="centre-info">
								
									<a class="address-link" href="#"><fmt:message key="label.view.map" bundle="${msg}" /></a>
								</div>
								
								<div class="form-group">
									<div class="payment-select-wrapper so-mdl-textfield">
										<p class="bank-info-select-label"><fmt:message key="Placeholder.date" bundle="${msg}" /></p>
										<div id="date" class="selectDiv preferred-date gray-text-bg">
											<!-- <input type="text" class="date preferred-date form-control gray-dropdown" name="preferredDate" id="preferredDate" value=""> -->
											
											<%
											Map results = (Map)request.getAttribute("datesMap");
											Map defaultDate = (Map)request.getAttribute("defaultDate");
											Map.Entry<String, List> entry; 
											Iterator i;
											Boolean result = results.size() > 0; 
											if(result) {
												i = results.entrySet().iterator();
												while(i.hasNext()){
													entry=(Map.Entry<String, List>)i.next();
											%>
											<input type="text" class="date preferred-date form-control gray-dropdown" id="preferred-date-<%=entry.getKey()%>" value="<%=defaultDate.get(entry.getKey()) %>" readonly="readonly" style="display:none;" >
											<%
												}
											}else {
											%>
											<input type="text" class="date preferred-date form-control gray-dropdown" id="full-date" value="" readonly="readonly">
											<%
											}
											%>
											<input type="hidden" name="preferred-date" id="preferred-date" value="${perferredDate }">
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<span class="error-msg" id="preferredDateErMsg"></span>
								</div>
								
								<div class="form-group">
									<div class="payment-select-wrapper so-mdl-textfield">
										<p class="bank-info-select-label"><fmt:message key="Placeholder.time" bundle="${msg}" /></p>
										<div class="selectDiv timeslot gray-text-bg">
											<!-- <input type="text" class="form-control gray-dropdown" name="preferred-time" id="preferred-time" value=""> -->
											
											<!-- <select name="preferred-time" id="preferred-time" onclick="putTimeSession();" class="form-control gray-dropdown"> -->
											<select name="preferred-time" id="preferred-time" class="form-control gray-dropdown">
	                                               <option value=""></option>
	                                           </select>
											<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
										</div>
									</div>
									<span class="error-msg" id="preferredTimeErMsg"></span>
								</div>
							</div>
							<div class="col-xs-12 col-md-6" id="right-side-form">
								<div class="centre-info visible-md visible-lg" id="centre-info">
									<a class="address-link" href="#"><fmt:message key="label.view.map" bundle="${msg}" /></a>
								</div>
							</div>
						</div>
					</div>
				</form>
				
				<center>
						<button type="button" id="btn-next" class="text-bold btn btn-payment" onclick="goNext();"><fmt:message key="button.Next" bundle="${msg}" /></button>
						<br /><a href="#" class="save-link" id="payment-save-and-con"><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></a>
					<button type="button" id="btn-back" class="text-bold btn btn-payment hidden" onclick="goNext();"><fmt:message key="button.back.summary" bundle="${msg}" /></button>
				</center>
				
			</div>
		</div>
	</div>
	<!-- FOOTER -->
</div>

<!-- Save and continue modal -->
<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content save-con-modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title1" bundle="${msg}" /></h4>
		<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy1" bundle="${msg}" /></p>
		<div class="save-con-btns clearfix">
			<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
			<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
		</div>
	</div>
  </div>
</div>

<!-- Save and continue batch 5 modal -->
<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content save-con-modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center welcome-msg"><fmt:message key="label.savie.save.continue.title2" bundle="${msg}" /></h4>
		<p class="text-center description-msg"><fmt:message key="label.savie.save.continue.copy2" bundle="${msg}" /></p>
		<div class="save-con-btns text-center clearfix">
			<button class="btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
			<button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
		</div>
	</div>
  </div>
</div>

<!-- Application saved modal -->
<div class="modal fade common-welcome-modal modal-app-save" id="application-saved-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog" id="modal-save-app">
	<div class="modal-content modal-content-appsave common-welcome-modal">	
		 <div class="modal-header" id="modal-header-appsave">
		 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<p class="text-center"><fmt:message key="label.saved.application.title" bundle="${msg}" /></p>
		 </div>
		 <div class="modal-body" id="moda-body-appsave">
			<p class="text-center"><fmt:message key="label.saved.application.copy" bundle="${msg}" /></p>
			<div class="btn-appsave">
				<button href="#" class="center-block btn savie-common-btn" id="btn-app-save"><fmt:message key="button.backtohome" bundle="${msg}" /></button>
			</div>
		 </div>
	 </div>
  </div>
</div>

<!--Modal in Customer Service Centre-->
<div class="modal fade" role="dialog" aria-labelledby="fullyBooked" id="fullyBooked">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
				<h2><fmt:message key="savie.customerServiceCentre.fullyBookmodalheader" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="savie.customerServiceCentre.fullyBookmodalbody" bundle="${msg}" /></p>
				
				<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
				<button type="button" class="btn btn-orange" id="fullyBooked-button"><fmt:message key="savie.customerServiceCentre.fullyBookmodalbtnTxt" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->	
</div><!-- /.modal -->

<!--Modal in Customer Service Centre (access code had been used)-->
<div class="modal fade" role="dialog" aria-labelledby="accessCodeUsed" id="accessCodeUsed">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<h2><fmt:message key="savie.customerServiceCentre.accessCodeUsedheader" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="savie.customerServiceCentre.accessCodeUsedbody" bundle="${msg}" /></p>
				<button type="button" class="btn btn-orange" id="back-to-home-btn"><fmt:message key="savie.customerServiceCentre.accessCodeUsedbtnTxt" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->	
</div><!-- /.modal -->

<!--Modal in Customer Service Centre-->
<div class="modal fade" role="dialog" aria-labelledby="perferredTimeIsNull" id="perferredTimeIsNull">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
				<h2><fmt:message key="savie.customerServiceCentre.perferredTimeIsNull" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="savie.customerServiceCentre.perferredTimeIsNullContext" bundle="${msg}" /></p>
				
				<!--<button type="button" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
				<button type="button" class="btn btn-orange" id="perferredTimeIsNull-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->	
</div><!-- /.modal -->

<!--Modal in Customer Service Centre (Reservation Invalid)-->
<div class="modal fade" role="dialog" aria-labelledby="reservationInvalid" id="reservationInvalid">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<h2><fmt:message key="savie.customerServiceCentre.reservationInvalid" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="savie.customerServiceCentre.reservationInvalid.body" bundle="${msg}" /></p>
				<button type="button" class="btn btn-orange" id="reservationInvalid-btn"><fmt:message key="savie.customerServiceCentre.modalPickAnotherCenter" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->	
</div><!-- /.modal -->
<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
	var getpath = "<%=request.getContextPath()%>";
	
	var startDate= new Date((new Date()).getTime() + 3*24*60*60*1000);
	var endDate= new Date((new Date()).getTime() + 24*24*60*60*1000);
	var sFullDate= new Date();
	var eFullDate= new Date((new Date()).getTime() - 24*60*60*1000);

	$('#fullyBooked-button').click(function(){
		$('#fullyBooked').modal('hide');
	});
	$('#perferredTimeIsNull-btn').click(function(){
		$('#perferredTimeIsNull').modal('hide');
	});
	$('#reservationInvalid-btn').click(function(){
		$('#reservationInvalid').modal('hide');
	});
	$('#back-to-home-btn').click(function(){
		window.location.href= context + "/" + language + "/savings-insurance";
	});
	
	$(document).ready(function() {	
		paymentFormValidation();
		
		//init next button text
		if('${backSummary}'=="Y"){
			var htmlObj = document.getElementById('btn-next');
			htmlObj.innerHTML = 'Back to application summary';
		}

		
		/* var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		var perferredTime = $("#preferred-time").val();
		if(csCenter == "" && perferredDate == "" && perferredTime == "") {
			$('#fullyBooked').modal('show');
		} */
		<%
		if(!result) {
		%>
		$('#full-date').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: sFullDate,
			endDate: eFullDate,
			autoclose: true,
		}).on('changeDate', function (ev) {
		});
		<%
		}
		%>
		<%
		results = (Map)request.getAttribute("datesMap");
		if(results != null) {
			i = results.entrySet().iterator();         
			while(i.hasNext()){
				entry=(Map.Entry<String, List>)i.next();
		%>
		var data<%=entry.getKey()%>='<%=entry.getValue()%>';
		$('#preferred-date-<%=entry.getKey()%>').datepicker({
		 	format: "dd-mm-yyyy",
			container: "#date",
			startDate: startDate,
			endDate: endDate,
			autoclose: true,
			beforeShowDay:function(Date){
			    var curr_date = Date.toJSON().substring(0,10);
			    if (data<%=entry.getKey()%>.indexOf(curr_date)>-1){
			    	return false;        
			    }
			}
		}).on('changeDate', function (ev) {
			if(ev.date != null){
				$("#preferred-date-mirror").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
				$("#preferred-date").val($("#preferred-date-<%=entry.getKey()%>").val().trim());
			}
			else{
				$('#preferred-date').datepicker('update', $("#preferred-date-mirror").val().trim());
			}
			if($("#centre").val().trim() != "" && $("#preferred-date-<%=entry.getKey()%>").val().trim() != ""){
				getTimeSlot('${perferredTime }');
			}
			else{
				$('#perferredTimeIsNull').modal('show');				
				$("#preferred-time").empty();
				$("#preferred-time").prepend("<option value=''></option>");
			}
		});
		<%
			}
		}
		%>
		$("#preferred-date-${csCenter}").show();
		var serviceCentreCode = '${csCenter }';
		setCentre(serviceCentreCode);
		
		if($("#centre").val().trim() != "" && $("#preferred-date-" + serviceCentreCode).val() != ""){
			getTimeSlot('${perferredTime }');
		}
		$('#centre').on('change', function() {
			var centre = $('#centre option:selected').val();
			togglePreferred('preferred-date-'+ centre)
			if($("#centre").val().trim() != "" && $("#preferred-date-"+ centre).val().trim() != ""){
				$("#preferred-date").val($("#preferred-date-"+ centre).val());
				getTimeSlot('${perferredTime }');
			}
		});
		
		
		
		var dummy = true;
		if('${backSummary}' == 'Y'){
			dummy = false;
		}
		// dummy condition for displaying the back / next button
		if(dummy) {
			// hide the back button and display the Next button
			$('#btn-next, .save-link').removeClass('hidden');
			$('#btn-back').addClass('hidden');
		} else {
			// display the back button and hide the Next button
			$('#btn-next, .save-link').addClass('hidden');
			$('#btn-back').removeClass('hidden');
		}
		
		$('.save-exit-btn1').click(function() {
			$('#save-and-continue-modal').modal('hide');
		});
        
        $('#keep-going-btn').click(function() {
			$('#save-and-continue-batch5-modal').modal('hide');
		});
		
		// application saved modal will show after clicking 'Save and exit' button 
		// no full fill type = 1
		$('.save-exit-btn2').click(function() {
			$("#errorMsg").html("");
			$.ajax({
				  type : "POST",
				  async:false, 
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePaymentSaveforLater",
				  data: $("#paymentForm").serialize()+"&type="+1,
				  success : function(data) {
					  if(data != null && data.errorMsg != null && data.errorMsg != ""){
						  $('#save-and-continue-modal').modal('hide');
						  show_stack_bar_top(data.errorMsg);
					  }
					  else{
						  $('#save-and-continue-modal').modal('hide');
						  $('#application-saved-modal').modal('show');
						  sendEmailForSaveLater("plan-details-sp?type=3");
					  }
				  }
		     });
		});
		//full fill type = 2
		$('#save-exit-btn').click(function() {
			$("#errorMsg").html("");
			$.ajax({
				  type : "POST",
				  async:false, 
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePaymentSaveforLater",
				  data: $("#paymentForm").serialize()+"&type="+2,
				  success : function(data) {
					  if(data != null && data.errorMsg != null && data.errorMsg != ""){
						  $('#save-and-continue-batch5-modal').modal('hide');
						  show_stack_bar_top(data.errorMsg);
					  }
					  else{
						  $('#save-and-continue-batch5-modal').modal('hide');
						  $('#application-saved-modal').modal('show');
						  sendEmailForSaveLater("plan-details-sp?type=3");
					  }
				  }
		     });
		});
		
		$('#btn-app-save').click(function() {
			window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
		});
		
		$("input[type='radio']").on('click', function() {
			if($('#payment-debit:checked').length > 0 ) {
				$('#pay-later-page').addClass('hidden');
				$('#direct-debit-panel').removeClass('hidden');
				$('.save-link').removeClass('hidden');
			} else {
				$('#direct-debit-panel').addClass('hidden');
				$('.save-link').addClass('hidden');
				$('#pay-later-page').removeClass('hidden');
				
				if($("#full-date").length > 0){
					$('#fullyBooked').modal('show');
				}
			}
		});
		
		$('span.icon-chevron-thin-down.orange-caret').on('click', function() {
			var selectId = $(this).attr('data-selectId');
			open($('#' + selectId));
		});
		
		$('#payment-save-and-con').on('click', function (e) {
			var isChecked = true;
			isChecked &= validateChkbox('payment_confirm_authorize', 'chkPolicyErMsg');
			
			$('#paymentForm').bootstrapValidator('validate');
            if($('#paymentForm').data('bootstrapValidator').isValid() && isChecked) {
				$('#save-and-continue-batch5-modal').modal('show');
            }
            else {
				$('#save-and-continue-modal').modal('show');
            }
        });
		
		$('.form-control.gray-dropdown').focus(function() {
			$(this).parent('.selectDiv').siblings('.bank-info-select-label').attr('style', 'color: #ff8200;');
			$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-focused');
			$(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
		}).on('blur', function () {
			$(this).parent('.selectDiv').siblings('.bank-info-select-label').removeAttr('style');
			$(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-focused');
			$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-not-active');
			 if($(this).val() == '') {
			   $(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
			}
		});
						
		
				
		// set fields whether editable or not
		setInputReadonly('paymentAmount', true);
		setInputReadonly('paymentMethod', true);
		setInputReadonly('accountHolderName', true);
		// -------				
		
		paymentFormValidation();
	   $('#preferredDate').on('changeDate show', function(e) {
			$(this).parent('.selectDiv').parent('.so-mdl-textfield').addClass('is-not-active');
			 if($(this).val() == '') {
			   $(this).parent('.selectDiv').parent('.so-mdl-textfield').removeClass('is-not-active');
			}
			
					/* $('#payLaterForm')
				.data('bootstrapValidator')
				.updateStatus('preferredDate', 'NOT_VALIDATED', null)
						.validateField('preferredDate'); */
	   });
	   
	   $('#preferred-time').on('change', function() {
				   /* $('#payLaterForm')
				.data('bootstrapValidator')
				.updateStatus('preferred-time', 'NOT_VALIDATED', null)
						.validateField('preferred-time'); */
	   });
	   
	   $('.policy-text').on('click', function() {
		   $('#payment_confirm_authorize').click();
	   });
	   
		// only numbers can be inputted
	   $('#bankAccountNo').keypress(function(e) {
		   if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //return false if not digit
				return false;
		    }
	   });
	});
	
	// Payment form validation
	function paymentFormValidation() {
		$('#paymentForm').bootstrapValidator({
			//excluded: [':disabled', ':hidden', ':not(:visible)'],
			excluded: [':disabled', '.readonly-field'],
			fields: {
				/* paymentAmount: {
					container: '#paymentAmountErMsg',
					selector: '#paymentAmount',
					validators: {
					  notEmpty: {
				 		message: '<fmt:message key="error.payment.amount.empty" bundle="${msg}" />'
					  },
					  regexp: {
						regexp: /^[1-9]\d*(\.\d+)?$/,
						message: "Amount is invalid."
					  }
					}
				},
				paymentMethod: {
					container: '#paymentMethodErMsg',
					selector: '#paymentMethod',
					validators: {
					  notEmpty: {
					  	message: '<fmt:message key="error.payment.method.empty" bundle="${msg}" />'
					  }
					}
				},
				accountHolderName: {
					container: '#accountHolderNameErMsg',
					selector: '#accountHolderName',
					validators: {
					  notEmpty: {
					  	message: '<fmt:message key="error.payment.bank.acc.holder.name.empty" bundle="${msg}" />'
					  }
					}
				}, */
				'bankCode': {
					container: '#bankCodeErMsg',
					validators: {
						  notEmpty: {
							 message: '<fmt:message key="error.payment.bank.name.empty" bundle="${msg}" />'
						  }
					}
				},
				'accountNumber': {
				   container: '#bankAccountNoErMsg',
				   validators: {
					  notEmpty: {
					  	message: '<fmt:message key="error.payment.account.no.empty" bundle="${msg}" />'
					  },
					   regexp: {
						  regexp: /^[0-9]*$/,
						  message: "Bank account number is invalid."
					   }
				   }
				},
				'branchCode': {
					container: '#branchNameErMsg',
					validators: {
					  notEmpty: {
					  	message: '<fmt:message key="error.payment.branch.name.empty" bundle="${msg}" />'
					  }
					}
				}/* ,
				tmpCustomerServiceCentre: {
					  	message: '<fmt:message key="error.date.empty" bundle="${msg}" />'
					  	message: '<fmt:message key="error.time.empty" bundle="${msg}" />'
					  }
				   }
				} */
			}
		}).on('success.form.bv', function(e) {
				e.preventDefault();
		}).on('error.form.bv', function(e) {
		});
	}
	
	function open(elem) {
		if (document.createEvent) {
			var e = document.createEvent("MouseEvents");
			e.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
			elem[0].dispatchEvent(e);
		} else if (element.fireEvent) {
			elem[0].fireEvent("onmousedown");
		}
	}
	
	// related to pay later
	$(window).bind('scroll', function() {
		stickHeaderBrowse();
	 });

	 /* $('#preferred-time').timepicker({
		appendTo: '.timeslot',
		timeFormat: 'H:i',
	 }); */
	 $('#preferredDate').datepicker({
		format: "mm-dd-yyyy",
		//format: 'yy-mm-dd',
		container: "#date",
		startDate: new Date(),
		autoclose: true
	 });
   
	 $('#centre').on('change', function() {
         var centre = $('#centre option:selected').val();
         setCentre(centre);
     });
	 
	 $('.selectDiv').find('span').remove();
	 console.log($('.ui-select > #centre-button > span').text());
	 $('#centre-button > span').remove();
	 applicationCentre();
	 function applicationCentre() {
		if(getWidth()>=992) {
		   var inner_centre_html = $('#inline-centre').html();

			<%--  var img1 = "<%=request.getContextPath()%>/resources/images/savie-2016/timshatsui.jpg";
			 var img2 = "<%=request.getContextPath()%>/resources/images/savie-2016/quarry_bay.jpg";
			 var img3 = "<%=request.getContextPath()%>/resources/images/savie-2016/sheung_wan.jpg";
			 var img4 = "<%=request.getContextPath()%>/resources/images/savie-2016/kwuntong.jpg";
			 var img5 = "<%=request.getContextPath()%>/resources/images/savie-2016/shatin.jpg";
			 var getpath = "<%=request.getContextPath()%>";
			 var addr1 = "G/F, Fontaine Building, 18 Mody Road, Tsim Sha Tsui";
			 var addr2 = "13/F, Devon House, Taikoo Place, 979 King’s Road, Quarry Bay";
			 var addr3 = "1/F, FWD Financial Centre, 308 Des Voeux Road Central, Sheung Wan";
			 var addr4 = "Office E, 12/F, Legend Tower, No.7 Shing Yip Street, Kwun Tong";
			 var addr5 = "Unit 1720 -21, Level 17, Tower II, Grand Central Plaza, Shatin"; --%>

		}
		else {
		   var inner_centre_html = $('#right-centre').html();

		   $('#inline-centre').append(inner_centre_html).removeClass('hidden');
		   $('#right-centre').html('');
		}
	 }
	 
	 function getBranchCode(value,language) {
			$.get('<%=request.getContextPath()%>/ajax/savings-insurance/getBranchCode',
			{ 
				value : value,
				language : language
			},
			function(data) {
				$("#bank_name").empty();
				if(data != null){
					for(var i = 0; i < data.length; i++) {
						$("#bank_name").append("<option value='"+data[i].itemCode+"'>"+data[i].itemDesc+"</option>");
					}
				}
			})
			.fail(function(data) {
			});
		}
	 
	 function goNext(){
			if($('input[name="payment"]:checked ').val() == "false"){
				var csCenter = $("#centre").val();
				var perferredDate = $("#preferred-date").val();
				var perferredTime = $("#preferred-time").val();
				if(csCenter == "" && perferredDate == "" && perferredTime == "") {
					$('#fullyBooked').modal('show');
				}else if(perferredTime == null || perferredTime.trim() == ""){
					$('#perferredTimeIsNull').modal('show');
				}else{
					$.ajax({     
					    url:context+'/ajax/savings-insurance/upsertAppointment',     
					    type:'post',     
					    data:{    
					    	"csCenter": csCenter,
					        "perferredDate":perferredDate,
					        "perferredTime":perferredTime,
					        "type":"1"
				   		},     
					    error:function(){       
					    },     
					    success:function(data){
					    	if(data.errMsgs == null){
						    	$("#payLaterForm").submit();
					    	}else if(data.errMsgs == "Access code has already been used"){
					    		$('#accessCodeUsed').modal('show');
					    		console.log(data.errMsgs);
					    	}else if(data.errMsgs == "Reservation is invalid"){
					    		$('#reservationInvalid').modal('show');
					    		console.log(data.errMsgs);
					    	}
					    }  
					});
				}
			}
			else{
				$('#paymentForm').bootstrapValidator('validate');
				var isChecked = true;
				isChecked &= validateChkbox('payment_confirm_authorize', 'chkPolicyErMsg');
				
            if($('#paymentForm').data('bootstrapValidator').isValid() && isChecked) {
            	$("#errorMsg").html("");
					$.ajax({
						  type : "POST",
						  async:false, 
						  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifePayment",
						  data: $("#paymentForm").serialize(),
						  success : function(data) {
							  if(data != null && data.errorMsg != null && data.errorMsg != ""){
								  show_stack_bar_top(data.errorMsg);
							  }
							  else{
								  if('${backSummary}'=="Y"){
									  window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/application-summary';
								  }
								  else{
									  window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
								  }
							  }
						  }
				   });
            }
			}
		}
	
	 function validateChkbox(chkboxId, errMsgId) {
		if(!$('#' + chkboxId).is(':checked')) {
			$('#' + errMsgId).removeClass('hidden');
			$('#has-err').attr('style', 'margin-bottom:0;');
			$('#chkPolicyErMsg').attr('style', 'margin-bottom:35px;');
			return false;
		} else {
			$('#' + errMsgId).addClass('hidden');
			$('#has-err').attr('style', 'margin-bottom:35px;');
			$('#chkPolicyErMsg').attr('style', 'margin-bottom:0;');
			return true;
		}
	}
	
	function togglePreferred(id) {
		$(".form-group .preferred-date .date").hide();
		$("#"+ id).show();
	}
	
	function setCentre(centre){
		<%
        ServiceCentreResponse serviceCentre = (ServiceCentreResponse)request.getAttribute("serviceCentre");
        if(serviceCentre.getServiceCentres().size() > 0) {
            for(ServiceCentreResult entity : serviceCentre.getServiceCentres()) {
        %>
        if(centre == '<%=entity.getServiceCentreCode() %>') {
           $('.centre-info').html("<img src=\"<%=request.getContextPath()%>/resources/images/savie/<%=entity.getPhoto() %>\" class=\"img-centre img-responsive\" /><h4><fmt:message key="label.address" bundle="${msg}" /></h4><p class=\"centre-address\"><%=entity.getAddress() %></p><a target=\"_blank\" class=\"viewmap-link\" href=\"<%=entity.getMap() %>\"><fmt:message key="label.view.map" bundle="${msg}" /></a>");
        }
        <%
            }
        }
        %>
	}
</script>
