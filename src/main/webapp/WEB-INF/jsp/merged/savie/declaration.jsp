<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
		
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="declaration-page">
		
	<!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">

	    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
		<c:set var="breadcrumbActive" value="0" />

	    <c:if test="${planIndex == 'medical-insurance'}">
	    	<c:set var="breadcrumbItems">
	    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
			</c:set>
	    	<c:set var="breadcrumbActive">4</c:set>
	    </c:if>
	    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
	    	<c:set var="breadcrumbItems">
	    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.cansurance,breadcrumb.item.declaration.payment
			</c:set>
	    	<c:set var="breadcrumbActive">3</c:set>
	    </c:if>
	    <c:if test="${planIndex == 'savings-insurance'}">
	    	<c:set var="breadcrumbItems">
	    		breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.savie,breadcrumb.item.application
	    	</c:set>
	    	<c:set var="breadcrumbActive">3</c:set>
	    </c:if>

	    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
	    	<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
	    	<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

	<!-- StepIndicator Component Start-->

     	<c:set var="stepItems" value="stepindicator.selectplan" /> 
		<c:set var="stepActive" value="0" />

		<c:if test="${planIndex == 'medical-insurance'}">
	    	<c:set var="stepItems">
	    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
			</c:set>
	    	<c:set var="stepActive">1</c:set>
	    </c:if>
	    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
	    	<c:set var="stepItems">
	    		stepindicator.underwriting,stepindicator.application,stepindicator.declaration.payment,stepindicator.upload.document2,stepindicator.confirmation
			</c:set>
	    	<c:set var="stepActive">2</c:set>
	    </c:if>
	    <c:if test="${planIndex == 'savings-insurance'}">
	    	<c:set var="stepItems">
	    		stepindicator.selectplan,stepindicator.application,stepindicator.summary.declaration,stepindicator.sign,stepindicator.upload.document,stepindicator.confirmation
	    	</c:set>
	    	<c:set var="stepActive">2</c:set>
	    </c:if>

	     <!--<div class="container-fluid fwd-full-container browse-holder">-->
	        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
	        	<jsp:param name="stepItems" value="${stepItems}"/>
    			<jsp:param name="stepActive" value="${stepActive}"/>
	    	</jsp:include>
	     <!--</div>-->

	<!-- StepIndicator Component End-->
		
	<div class="container-fluid fwd-full-container">
		<div class="fwd-container-limit clearfix sidebar">
			<div class="declaration-content-wrapper">
				<form id="declarationForm">
					<p class="title"><fmt:message key="label.declaration.authorization.headline" bundle="${msg}" /></p>
					<c:if test="${planIndex == 'savings-insurance'}">
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.dda.title" bundle="${msg}" /></b></p>
						<hr>
						<div class="form-group checkbox-wrapper">
							<input type="checkbox" id="hasReadAndAcceptDDA" name="hasReadAndAcceptDDA" value="true">
							<label for="hasReadAndAcceptDDA"></label>
							<p class="chkboxText"><fmt:message key="label.declaration.dda.agree" bundle="${msg}" /></p>
						</div>
						<p id="chkDDAErMsg" class="err-msg hidden"><fmt:message key="error.dda.not.checked" bundle="${msg}" /></p>
						<nav>
							<ol type="i">
								<fmt:message key="declaration.dda.content" bundle="${msg}" />
							</ol>
						</nav>
						<p style="margin-top: 15px;"><fmt:message key="declaration.dda.note" bundle="${msg}" /></p>
					</div>
					</c:if>
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.fatca" bundle="${msg}" /></b></p>
						<hr>
						<div class="form-group checkbox-wrapper">
							<input type="checkbox" id="hasReadAndAcceptFATC" name="hasReadAndAcceptFATC" value="true">
							<label for="hasReadAndAcceptFATC"></label>
							<p class="chkboxText"><fmt:message key="label.declaration.tnc.agree" bundle="${msg}" /></p>
						</div>
						<p id="chkFATCErMsg" class="err-msg hidden"><fmt:message key="error.fatca.not.checked" bundle="${msg}" /></p>
						<nav>
							<ol type="i">
								<fmt:message key="declaration.tnc.tax" bundle="${msg}" />
							</ol>
						</nav>
					</div>
					<c:if test="${planIndex != 'medical-insurance/cansurance'}">
					<div class="cstm-panel">
						<p><b><fmt:message key="savie.declaration.automatic.exchange" bundle="${msg}" /></b></p>
						<hr>
						<div class="form-group checkbox-wrapper">
							<input type="checkbox" id="hasReadAndAcceptAutoExch" name="hasReadAndAcceptAutoExch" value="true">
							<label for="hasReadAndAcceptAutoExch"></label>
							<p class="chkboxText"><fmt:message key="savie.declaration.automatic.exchange.tnc.agree" bundle="${msg}" /></p>
						</div>
						<p id="chkAutoExchErMsg" class="err-msg hidden"><fmt:message key="savie.declaration.automatic.exchange.error.not.checked" bundle="${msg}" /></p>
						<nav>
							<ol type="i">
								<li><fmt:message key="savie.declaration.automatic.exchange.tnc.statement.01" bundle="${msg}" /></li>
								<li><fmt:message key="savie.declaration.automatic.exchange.tnc.statement.02" bundle="${msg}" /></li>
							</ol>
							<p>* <fmt:message key="savie.declaration.automatic.exchange.tnc.statement.03" bundle="${msg}" /></p>
						</nav>
					</div>
					</c:if>
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.pics" bundle="${msg}" /></b></p>
						<!-- <p class="desktop-inline"><b>Declaration - </b></p>
						<p class="desktop-inline"><b>Personal Information Collection Statement</b></p>-->
						<hr>
						<div class="form-group checkbox-wrapper clearfix">
							<input type="checkbox" id="hasReadAndAcceptPICS" name="hasReadAndAcceptPICS" value="true">
							<label for="hasReadAndAcceptPICS"></label>
							<fmt:message key="declaration.pics.agree" bundle="${msg}" />
						</div>
						<p id="chkPICSErMsg" class="err-msg hidden"><fmt:message key="error.pics.not.checked" bundle="${msg}" /></p>
					</div>
					
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.policyreplacement" bundle="${msg}" /></b></p>
						<hr>
						<div class="row">
							<div class="col-xs-12">
								<p><fmt:message key="declaration.policyreplacement.copy1" bundle="${msg}" /></p>
								<div class="radio-group clearfix">
								   <div class="radio-button-group">
									  <div class="clearfix desktop-align left radio-no-div">
										 <div class="pull-left radio-holder">
											<input type="radio" id="haveReplacedNo" name="haveReplaced" value="false"  class="radio-no">
											<label for="haveReplacedNo"></label>
										 </div>
										 <div class="text-bold pull-left desc"><fmt:message key="option.no" bundle="${msg}" /></div>
									  </div>
									  <div class="clearfix below desktop-align radio-yes-div" data-toggle="modal" data-target="#yes-radio-popup">
										 <div class="pull-left radio-holder">
											<input type="radio" id="haveReplacedYes" name="haveReplaced" value="true" class="radio-yes">
											<label for="haveReplacedYes"></label>
										 </div>
										 <div class="text-bold pull-left desc"><fmt:message key="option.yes" bundle="${msg}" /></div>
									  </div>
									  	<!--div  id="yes-radio-popup" >
											<span class="text-center"><fmt:message key="label.please.call.hotline" bundle="${msg}" /></span>
										</div-->
								   </div>
								</div>
								<p id="chkHaveReplacedErMsg" class="err-msg hidden"><fmt:message key="error.haveReplaced.tnc.not.checked" bundle="${msg}" /></p>
							</div>
							<div class="col-xs-12">
								<p><fmt:message key="declaration.policyreplacement.copy2" bundle="${msg}" /></p>
								<div class="radio-group clearfix">
								   <div class="radio-button-group clearfix">
									  <div class="clearfix desktop-align left radio-no-div">
										 <div class="pull-left radio-holder">
											<input type="radio" id="intentToReplacedNo" name="intentToReplaced" value="false"  class="radio-no">
											<label for="intentToReplacedNo"></label>
										 </div>
										 <div class="text-bold pull-left desc"><fmt:message key="option.no" bundle="${msg}" /></div>
									  </div>
									  <div class="clearfix below desktop-align radio-yes-div" data-toggle="modal" data-target="#yes-radio-popup">
										 <div class="pull-left radio-holder">
											<input type="radio" id="intentToReplacedYes" name="intentToReplaced" value="true" class="radio-yes">
											<label for="intentToReplacedYes"></label>
										 </div>
										 <div class="text-bold pull-left desc"><fmt:message key="option.yes" bundle="${msg}" /></div>
									  </div>
									  	<!--div  id="yes-radio-popup-intent" >
											<span class="text-center"><fmt:message key="label.please.call.hotline" bundle="${msg}" /></span>
										</div-->									  
								   </div>
								</div>
								<p id="chkIntentToReplacedErMsg" class="err-msg hidden"><fmt:message key="error.intentToReplaced.tnc.not.checked" bundle="${msg}" /></p>
							</div>
						</div>
						
						<div class="replacement-declarations">
							<p><b><fmt:message key="label.declaration.policyreplacement.confirm" bundle="${msg}" /></b></p>
							<ol class="list list--lower-roman">
								<li class="list__item"><fmt:message key="declaration.policyreplacement.copy3" bundle="${msg}" /></li>
								<li class="list__item"><fmt:message key="declaration.policyreplacement.copy4" bundle="${msg}" /></li>
							</ol>
							<p><fmt:message key="declaration.policyreplacement.copy5" bundle="${msg}" /></p>
							<div style="margin-top: 20px;">
							  <p><fmt:message key="declaration.policyreplacement.copy6" bundle="${msg}" /></p>
								<ul class="list-unstyled">
									<li><fmt:message key="declaration.policyreplacement.copy7" bundle="${msg}" /></li>
									<li><fmt:message key="declaration.policyreplacement.copy8" bundle="${msg}" /></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.cancellation" bundle="${msg}" /></b></p>
						<!--<p class="desktop-inline"><b>Declaration - </b></p>
						<p class="desktop-inline"><b>Cancellation Right and Refund of Premium(s)</b></p>-->
						<hr>
						<div class="form-group checkbox-wrapper">
							<input type="checkbox" id="hasReadAndAcceptCancellation" name="hasReadAndAcceptCancellation" value="true">
							<label for="hasReadAndAcceptCancellation"></label>
							<p class="chkboxText"><fmt:message key="declaration.cancellation.copy1" bundle="${msg}" /></p>
						</div>
						<p id="chkCancellationErMsg" class="err-msg hidden" style="margin-bottom: 15px;"><fmt:message key="error.cancellation.policy.not.checked" bundle="${msg}" /></p>
					</div>

					<div class="cstm-panel">
						<p><b><fmt:message key="declaration.residency.declaration.title" bundle="${msg}" /></b></p>
						<hr>
						<p><fmt:message key="declaration.residency.declaration.copy" bundle="${msg}" /></p>
						<div class="radio-group clearfix">
						   <div class="radio-button-group">
							  <div class="clearfix desktop-align left radio-no-div">
								 <div class="pull-left radio-holder">
									<input type="radio" id="intentToLiveOutsideNo" name="intentToLiveOutside" value="false"  class="radio-no">
									<label for="intentToLiveOutsideNo"></label>
								 </div>
								 <div class="text-bold pull-left desc"><fmt:message key="option.no" bundle="${msg}" /></div>
							  </div>
							  <div class="clearfix below desktop-align radio-yes-div" data-toggle="modal" data-target="#yes-radio-popup">
								 <div class="pull-left radio-holder">
									<input type="radio" id="intentToLiveOutsideYes" name="intentToLiveOutside" value="true" class="radio-yes">
									<label for="intentToLiveOutsideYes"></label>
								 </div>
								 <div class="text-bold pull-left desc"><fmt:message key="option.yes" bundle="${msg}" /></div>
							  </div>
						   </div>
						</div>
						<p id="chkIntentToLiveOutsideErMsg" class="err-msg hidden"><fmt:message key="error.intentToLiveOutside.tnc.not.checked" bundle="${msg}" /></p>
					</div>
					
					<div class="cstm-panel">
						<p><b><fmt:message key="label.declaration.application" bundle="${msg}" /></b></p>
						<hr>
						<div class="form-group checkbox-wrapper">
							<input type="checkbox" id="hasReadAndAgreeApplication" name="hasReadAndAgreeApplication" value="true">
							<label for="hasReadAndAgreeApplication"></label>
							<p class="chkboxText"><fmt:message key="label.declaration.agree" bundle="${msg}" /></p>
						</div>
						<p id="chkApplicationErMsg" class="err-msg hidden"><fmt:message key="error.application.tnc.not.checked" bundle="${msg}" /></p>
						<nav>
							<ol type="i">
								<fmt:message key="declaration.application.copy1" bundle="${msg}" />
							</ol>
						</nav>
					</div>
					
					<div class="cstm-panel">
						<p class="with-margin-bottom"><fmt:message key="declaration.directmarketing.life.summary" bundle="${msg}" /></p>
						<div class="form-group checkbox-wrapper checkbox-gray">
							<input type="checkbox" id="chkboxDoNotSendMarketingInfo" name="chkboxDoNotSendMarketingInfo" value="true">
							<label for="chkboxDoNotSendMarketingInfo"></label>
							<p class="chkboxText"><fmt:message key="label.directmarketing.copy1" bundle="${msg}" /></p>
						</div>
						<div class="form-group checkbox-wrapper checkbox-gray">
							<input type="checkbox" id="chkboxDoNotProvidePersonalData" name="chkboxDoNotProvidePersonalData" value="true">
							<label for="chkboxDoNotProvidePersonalData"></label>
							<p class="chkboxText"><fmt:message key="label.directmarketing.copy2" bundle="${msg}" /></p>
						</div>
					</div>
					
					<div class="recommendation-note visible-xs visible-sm">
						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						<fmt:message key="note.mobile.recommend" bundle="${msg}" />
					</div>
					
					<div id="errorMsg" style="color: red;"></div>
						
					<center>
						<button type="button" class="text-bold btn savie-common-btn btn-proceed"><fmt:message key="button.proceed.to.signature" bundle="${msg}" /></button>
						<c:if test="${plan == 'savings-insurance'}">
						   <a href="javascript:void(0);" class="save-link"><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></a>
						</c:if>
					</center>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Modal for yes radio button -->
		<div class="modal fade" id="yes-radio-popup" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" data-modal="yes-radio-modal"><span aria-hidden="true">×</span></button>
					<!--p class="text-center">Please contact our customer hotline <span class="hotline">3123 3123</span> for assistance.</p-->
					<p class="text-center"><fmt:message key="label.please.call.hotline" bundle="${msg}" /></p>
				</div>
			</div>
		</div>
	
	<!-- Modal for Foreign Account Tax Compliance Act -->
	<div class="modal fade modal-fatca-declaration" id="modal-fatca-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog" id="dialog-fatca-declaration">
		<div class="modal-content common-welcome-modal" id="modal-content-fatca">	
			 <div class="modal-header">
			 	<button type="button" class="close" id="close-fatca" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<p><fmt:message key="label.declaration.fatca" bundle="${msg}" /></p>
			 </div>
			 <div class="modal-body" id="modal-body-fatca">
				<ol>
					<li><fmt:message key="declaration.tnc.fatca" bundle="${msg}" /></li>
					<li id="fourth-li"><fmt:message key="declaration.tnc.disclose.to.authority" bundle="${msg}" /></li>
				</ol>
			 </div>
		 </div>
	  </div>
	</div>
	
	<!-- Modal for Personal Information Collection Statement -->
	<div class="modal fade" id="modal-pics-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog" id="dialog-pics-declaration">
		<div class="modal-content common-welcome-modal" id="modal-content-pics">	
			 <div class="modal-header">
			 	<button type="button" class="close" id="close-pics" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<p><fmt:message key="label.savie.pics" bundle="${msg}" /></p>
			 </div>
			 <div class="modal-body" id="modal-body-pics">
				<ol>
					<fmt:message key="info.savie.pics.copy" bundle="${msg}" />
				</ol>
				<div id="pics-copy-final"><fmt:message key="info.savie.pics.copy.final" bundle="${msg}" /></div>
			 </div>
		 </div>
	  </div>
	</div>
	
	<!-- Save and continue modal -->
<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content save-con-modal-content">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-bold text-center welcome-msg"><fmt:message key="label.savie.save.continue.title1" bundle="${msg}" /></h4>
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
		<h4 class="text-bold text-center welcome-msg"><fmt:message key="label.savie.save.continue.title2" bundle="${msg}" /></h4>
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
	
	<!--<div class="fwd-savie-wrapper">-->
<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img style="width: 300px; height: 300px;"
        src="<%=request.getContextPath()%>/resources/images/loading.gif">
</div>	
	<!-- FOOTER -->
</div>
		
<!-- JS INCLUDES -->
<script type="text/javascript">
	var language = "en";
	
	var $radio_yes_elem;
	var $radio_no_elem;
	
	$(document).ready(function() {
		/*
		$("#haveReplacedYes").click(function(){
			// these variables will be used when closing yes-radio-popup
 			$radio_yes_elem = $(this); 
 			$radio_no_elem = $(this).parent().parent().siblings('.left').find('.radio-no');
//			$('#yes-radio-popup').css("display","block");
		});
		
		$("#intentToReplacedYes").click(function(){
 			$radio_yes_elem = $(this); 
 			$radio_no_elem = $(this).parent().parent().siblings('.left').find('.radio-no');
//			$('#yes-radio-popup-intent').css("display","block");
		});
		
		$("#intentToLiveOutsideYes").click(function(){
 			$radio_yes_elem = $(this); 
 			$radio_no_elem = $(this).parent().parent().siblings('.left').find('.radio-no');
		});
		*/
		$('.radio-yes-div').click(function(){
 			$radio_yes_elem = $(this).find('input:radio'); 
 			$radio_no_elem = $radio_yes_elem.parent().parent().siblings('.left').find('.radio-no');
		});

		
		$('.close').click(function() {
			if($(this).attr("data-modal") == "yes-radio-modal") {
				updateRadioStatus();
			}
		});
		
		$('.modal').on('click', function() {
			if($(this).attr("id") == "yes-radio-popup") {
				updateRadioStatus();
			}
		});
		
		
		// set back checked to No radio button
		function updateRadioStatus() {
			$radio_yes_elem.prop("checked", false);
			$radio_no_elem.prop("checked", false);
		}
		
		$('.btn-proceed').click(function() {
			var isPassed = true;
			var hasDDA = ${planIndex == 'savings-insurance' ? true : false};
			
			// validation
			if( hasDDA ){
				isPassed &= validateChkboxField('hasReadAndAcceptDDA', 'chkDDAErMsg');
			}
			isPassed &= validateChkboxField('hasReadAndAcceptFATC', 'chkFATCErMsg');
			//isPassed &= validateChkboxField('hasReadAndAcceptAutoExch', 'chkAutoExchErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptPICS', 'chkPICSErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptCancellation', 'chkCancellationErMsg');
			isPassed &= validateChkboxField('hasReadAndAgreeApplication', 'chkApplicationErMsg');

			isPassed &= validateChkboxField('haveReplacedNo', 'chkHaveReplacedErMsg');
			isPassed &= validateChkboxField('intentToReplacedNo', 'chkIntentToReplacedErMsg');
			isPassed &= validateChkboxField('intentToLiveOutsideNo', 'chkIntentToLiveOutsideErMsg');
			//console.log(isPassed &= validateChkboxField('hasReadAndAcceptDDA', 'chkDDAErMsg'));
			//isPassed &= validateChkboxField('haveReplacedNo', 'chkHaveReplacedErMsg');		
			//isPassed &= validateChkboxField('intentToReplacedNo', 'chkIntentToReplacedErMsg');		
			//isPassed &= validateChkboxField('intentToLiveOutsideNo', 'chkIntentToLiveOutsideErMsg');		
			//console.log(isPassed &= validateChkboxField('hasReadAndAcceptDDA', 'chkDDAErMsg'));
			if(! isPassed) {
				return false;
			}else {
	        	$('.btn-proceed').attr({"disabled":"disabled"});
		        $('#loadingDiv').toggle();
		        $('body').addClass('modal-open');	
	        	$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeDeclaration",
					  data: $("#declarationForm").serialize(),
 					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $('.btn-proceed').removeAttr("disabled");
							  show_stack_bar_top(data.errorMsg);
						  }
						  else{
							  if('${plan }' == 'savings-insurance'){
								  $.ajax({     
									    url:'<%=request.getContextPath()%>/ajax/savings-insurance/createLifePolicy',     
									    type:'get',     
									    error:function(){
									    	$('.btn-proceed').removeAttr("disabled");
	                                        $('#loadingDiv').toggle();
	                                        $('body').removeClass('modal-open');								           
									    },     
									    success:function(data){
									    	if(data != null && data.successMsg !=null){
									    		window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
									    	}
									    	else{
									    		$('.btn-proceed').removeAttr("disabled");
									    	}
									    }  
								  });
							  }
						      else{
						          window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
						      }
						  }
					  }
			     });
			}
		});
		
		$('.save-link').on('click', function (e) {
            var isPassed = true;
			
			// validation
			isPassed &= validateChkboxField('hasReadAndAcceptDDA', 'chkDDAErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptFATC', 'chkFATCErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptAutoExch', 'chkAutoExchErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptPICS', 'chkPICSErMsg');
			isPassed &= validateChkboxField('hasReadAndAcceptCancellation', 'chkCancellationErMsg');
			isPassed &= validateChkboxField('hasReadAndAgreeApplication', 'chkApplicationErMsg');			
            if(isPassed) {
				$('#save-and-continue-batch5-modal').modal('show');
            }
            else {
				$('#save-and-continue-modal').modal('show');
            }
        });
		
		$('.save-exit-btn1').click(function() {
			$('#save-and-continue-modal').modal('hide');
		});
        
        $('#keep-going-btn').click(function() {
			$('#save-and-continue-batch5-modal').modal('hide');
		});
//		$('#haveReplacedNo').click(function(){
//			$('#yes-radio-popup').css("display","none");
//		});
		
//		$('#intentToReplacedNo').click(function(){
//			$('#yes-radio-popup-intent').css("display","none");
//		});
        
		// application saved modal will show after clicking 'Save and exit' button 
		// no full fill type = 1
		$('.save-exit-btn2').click(function() {
			$("#errorMsg").html("");
			$.ajax({
				  type : "POST",
				  async:false, 
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeDeclarationSaveforLater",
				  data: $("#declarationForm").serialize()+"&type="+1,
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
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/lifeDeclarationSaveforLater",
				  data: $("#declarationForm").serialize()+"&type="+1,
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
		
		function validateChkboxField(chkboxId, errMsgId) {
			if(!$('#' + chkboxId).is(':checked')) {
				$('#' + errMsgId).removeClass('hidden');
				return false;
			} else {
				$('#' + errMsgId).addClass('hidden');
				return true;
			}
		}
		
		$('.chkboxText').on('click', function() {
			$(this).siblings('input[type=checkbox]').click();
		});
		
		//$('.personal-info-link-parent + p').on('click', function() {
			//$('#hasReadAndAcceptPICS').click();
		//});
		
//		$('#yes-radio-popup').css("display","none");
//		$('#yes-radio-popup-intent').css("display","none");
		
		$('.radio-no-div, .radio-yes-div').on('click', function() {
			$radio_group_parent = $(this).parent();
			$radio_group_parent.find('input:radio').prop('checked', false);
			$(this).find('input:radio').prop('checked', true);
		});
	});
</script>
