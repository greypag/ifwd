<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResponse"%>
<%@page import="com.ifwd.fwdhk.connector.response.savie.ServiceCentreResult"%>
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
<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps headerStick" id="signature-offline">
<!-- HEADER -->
	 <div class="fwd-container container-fluid breadcrumbs">
		<div class="breadcrumb-container">
		   <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
			   <li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a></li>
			   <li class="divider"><i class="fa fa-play"></i></li>
			   <li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /> </a></li>
			   <li class="divider"><i class="fa fa-play"></i></li>
			   <li><a href="#"><fmt:message key="breadcrumb.savie.insurance.plan" bundle="${msg}" /> </a></li>
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
					<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.selectplan" bundle="${msg}" /></button></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.application" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i><fmt:message key="stepindicator.savie.summary.declaration" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">4</span><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></button></li>
					<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
					<li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span><fmt:message key="stepindicator.savie.upload.document" bundle="${msg}" /></button></li>
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
					<h3 id=""><fmt:message key="stepindicator.savie.sign" bundle="${msg}" /></h3>
				 </div>
			  </div>
			  <span id="step-of">4 out of 5</span>
		   </div>
		</div>
	 </div>
	 <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
		<div class="step-indicator-container clearfix">
			<ul class="common-step-indicator six-steps nav nav-pills">
				 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
				 <li><a href="#" class="active"><span class="step-no">4</span></a></li>
				 <li><a href="#"><span class="step-no">5</span></a></li>
				  <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
			</ul>
			<div class="step-line"></div>
		</div>
	</div>
	<div class="container-fluid fwd-full-container  headerStick" id="container-signatureoffline">
		<div class="fwd-container-limit clearfix sidebar" id="fwd-container-signatureoffline">
			<p><fmt:message key="label.savie.sign.title" bundle="${msg}" /></p>
			<div class="form-signatureoffline-info">
				<div class="radio-group clearfix">
					 <div class="radio-button-group">
						  <div class="clearfix">
							 <div class="pull-left radio-holder">
								<input type="radio" id="digi-radio" name="sign-radio" checked /> <label for="digi-radio"></label>
							 </div>
							 <div class="text-bold pull-left desc" id="id-digi-sign">
								<fmt:message key="option.savie.online.sign" bundle="${msg}" />
								 <span><fmt:message key="option.savie.online.sign.copy1" bundle="${msg}" /></span>
							 </div>
						  </div>
						  <div class="clearfix" id="id-offline-signature">
							 <div class="pull-left radio-holder">
								<input type="radio" id="off-radio" name="sign-radio" /> <label for="off-radio"></label>
							 </div>
							 <div class="text-bold pull-left desc" id="id-off-sign">
								<fmt:message key="option.savie.offline.sign" bundle="${msg}" />
								 <span><fmt:message key="option.savie.offline.sign.copy1" bundle="${msg}" /></span>
							 </div>
						  </div>
					</div>
				</div>
			</div>
			<!-- Digital Signature -->
			<form id="table-info" class="clearfix">
				<p class="table-info-p"><fmt:message key="label.savie.reviewsign.title" bundle="${msg}" /></p>
				<table class="table table-bordered table-hover">
					<tbody>
					  <tr>
						<td class="numbers">1</td>
						<td class="adjust-body-content"><fmt:message key="label.fna" bundle="${msg}" /></td>
						<td id="signature-status-1" class="savie-status">
							<button class="btn savie-common-btn btn-table-savie" data-toggle="modal" data-target="#fna-signature-modal"><fmt:message key="button.review.now" bundle="${msg}" /></button>
							<p class="table-desc-p p-status hidden" id="id-review"><fmt:message key="label.review.and.sign" bundle="${msg}" /></p>
						</td>
					  </tr>
					  <tr>
						<td class="numbers">2</td>
						<td  class="adjust-body-content"><fmt:message key="label.salesillustration" bundle="${msg}" /></td>
						<td id="signature-status-2" class="savie-status">
							<p class="table-desc-p pending"><fmt:message key="label.pending.review" bundle="${msg}" /></p>
							<button class="btn savie-common-btn btn-table-savie hidden" data-toggle="modal" data-target="#sales-signature-modal"><fmt:message key="button.review.now" bundle="${msg}" /></button>
							<p class="table-desc-p p-status hidden"><fmt:message key="label.review.and.sign" bundle="${msg}" /></p>
						</td>
					  </tr>
					  <tr>
						<td class="numbers">3</td>
						<td class="adjust-body-content"><fmt:message key="label.savie.review.application" bundle="${msg}" /></td>
						<td id="signature-status-3" class="savie-status">
							<p class="table-desc-p pending"><fmt:message key="label.pending.review" bundle="${msg}" /></p>
							<button class="btn savie-common-btn btn-table-savie hidden" data-toggle="modal" data-target="#policy-signature-modal"><fmt:message key="button.review.now" bundle="${msg}" /></button>
							<p class="table-desc-p p-status hidden"><fmt:message key="label.review.and.sign" bundle="${msg}" /></p>
						</td>
					  </tr>
					</tbody>
				</table>
				<div class="col-xs-12" id="desktop-position-btn">
					  <div class="text-center clearfix">
						<button class="btn savie-common-btn disabled-gray-btn" type="button" id="btn-acctps-sign"><fmt:message key="button.accept.and.sign" bundle="${msg}" /></button>
						<a href="#" id="save-and-con-later" class="span-save-continue" data-toggle="modal" data-target="#save-and-continue-modal">
							<span><fmt:message key="label.save.and.continue.later" bundle="${msg}" /></span>
						</a>
					 </div>
				</div>
			</form>
			<!-- Offline Signature -->
			<form class="form-signatureoffline-info hidden" id="signoff-table" method="post">
				<div id="choose-service-centre">
					<div class="row">
						<h5><fmt:message key="label.service.centre.title" bundle="${msg}" /></h5>
						<div class="col-xs-12 col-md-6" id="left-side-form">
							<div class="selectDiv">
							<p class="bank-info-select-label">Location</p>
							   <span class="icon-chevron-thin-down orange-caret"></span>
							   <select name="centre" id="centre" class="form-control gray-dropdown">
								   <option value="" disabled selected><fmt:message key="option.customer.service.centre" bundle="${msg}" /></option>
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
						   <div class="centre-info visible-xs visible-sm" id="centre-info">
								
						   </div>
						   <div id="date" class="selectDiv preferred-date gray-text-bg">
								<!-- <input type="text" autocomplete="off" class="date preferred-date" name="preferred-date" id="preferred-date" value="Date" readonly=""> -->
								<p class="bank-info-select-label">Date</p>
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
								<input type="text" autocomplete="off" class="date preferred-date form-control gray-dropdown" id="preferred-date-<%=entry.getKey()%>" value="<%=defaultDate.get(entry.getKey()) %>" style="display:none;" >
								<%
									}
								}else {
								%>
								<input type="text" autocomplete="off" class="date preferred-date form-control gray-dropdown" id="full-date" value="">
								<%
								}
								%>
								<input type="hidden" name="preferred-date" id="preferred-date" value="${perferredDate }">
								<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
							</div>
							<div id="time" class="selectDiv timeslot gray-text-bg">
								<!-- <input type="text" autocomplete="off" name="preferred-time" id="preferred-time" value="Time" class="time preferred-time" autocomplete="off"> -->
								<p class="bank-info-select-label">Time</p>
								<select name="preferred-time" id="preferred-time" class="form-control gray-dropdown">
                                    <option value=""></option>
                                </select>
								<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
							</div>
							<p id="confirm-call"><fmt:message key="label.appointment" bundle="${msg}" /></p>
						</div>
						<div class="col-xs-12 col-md-6" id="right-side-form">
							<div class="centre-info visible-md visible-lg" id="centre-info">
								
							 </div>
						</div>
						<div class="col-xs-12" id="desktop-position-btn">
							<div class="text-center clearfix" id="btn-srv-center">
								<button class="btn savie-common-btn" type="button" id="btn-cstmr-srvc-cnter"><fmt:message key="button.Next" bundle="${msg}" /></button>
							 </div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- FOOTER -->
</div>
 <!-- Signature light box -->
 <div id="signature-box-1" class="signature-box modal fade" role="dialog" aria-labelledby="signaturebox" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<div class="modal-content">
			  <div class="modal-header">
				 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				 <p class="text-bold modal-title visible-xs visible-sm"><fmt:message key="label.signature.title" bundle="${msg}" /></p>
			  </div>
			  <div class="modal-body">
				<p class="text-bold modal-title hidden-xs hidden-sm"><fmt:message key="label.signature.title" bundle="${msg}" /></p>
				 <p><fmt:message key="label.please.sign.in.grey.area" bundle="${msg}" /></p>
				 <form action="">
					<div class="signature-parent">
						<div id="signature-1" class="signature-img so-signature"></div>
					</div>
					<div class="clearfix">
						<a id="link-clear-1" class="pull-left link-clear"><fmt:message key="label.clear" bundle="${msg}" /></a>
						<div class="pull-right">
							<div id="correct-signature-1" class="correct-signature hidden">
								<img src="<%=request.getContextPath()%>/resources/images/elite-terms/correct-signature.png" />
								<span><fmt:message key="label.correct.signature" bundle="${msg}" /></span>
							</div>
							<p class="text-right"><fmt:message key="label.sign.in.hk" bundle="${msg}" /></p>
						</div>
					</div>
					<center>
						<button class="text-bold btn savie-common-btn btn-confirm disabled-gray-btn" id="btn-confirm-1"><fmt:message key="button.confirm.button" bundle="${msg}" /></button>
					</center>
				 </form>
			  </div>
		</div>
	</div>
</div>
<!-- FNA light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="fna-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center"><fmt:message key="label.fna" bundle="${msg}" /></h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<c:choose>
		        <c:when test="${fnaFormJpgName != null}">
					<iframe src="<%=request.getContextPath()%>/resources/pdf/${fnaFormJpgName }"  frameborder="0"></iframe>
		        </c:when>
		        <c:otherwise>
					<iframe src="<%=request.getContextPath()%>/resources/pdf/SavieProposalTemplate_${language}.pdf&embedded=true"  frameborder="0"></iframe>
				</c:otherwise>
		    </c:choose>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-1"><fmt:message key="button.review.and.agree" bundle="${msg}" /> (<span id="timer-1">8</span>)</button>
		</div>	
	</div>
  </div>
</div>
<!-- Sales Illustration light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="sales-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center"><fmt:message key="label.salesillustration" bundle="${msg}" /></h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<c:choose>
		        <c:when test="${salesIllustrationJpgName != null}">
					<iframe src="<%=request.getContextPath()%>/resources/pdf/${salesIllustrationJpgName }"  frameborder="0"></iframe>
		        </c:when>
		        <c:otherwise>
					<iframe src="<%=request.getContextPath()%>/resources/pdf/SavieProposalTemplate_${language}.pdf&embedded=true"  frameborder="0"></iframe>
				</c:otherwise>
		    </c:choose>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-2"><fmt:message key="button.review.and.agree" bundle="${msg}" /> (<span id="timer-2">8</span>)</button>
		</div>	
	</div>
  </div>
</div>
<!-- Policy light box -->
<div class="modal fade common-welcome-modal signature-offline-modal" id="policy-signature-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog">
	<div class="modal-content">
		<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
		<h4 class="text-center"><fmt:message key="label.savie.review.application" bundle="${msg}" /></h4>
		<div class="pdf">
			<!--<object id="pdf-object" data="assets/pdf/SavieProposalTemplateEng20150810.pdf" type="application/pdf" width="100%" height="100%" internalinstanceid="10" title="">
				<p>It appears you don't have Adobe Reader or PDF support in this web browser. <a href="assets/pdf/SavieProposalTemplateEng20150810.pdf">Click here to download the PDF</a></p>
			</object>-->
			<c:choose>
		        <c:when test="${applicationFormJpgName != null}">
					<iframe src="<%=request.getContextPath()%>/resources/pdf/${applicationFormJpgName }"  frameborder="0"></iframe>
		        </c:when>
		        <c:otherwise>
					<iframe src="<%=request.getContextPath()%>/resources/pdf/SavieProposalTemplate_${language}.pdf&embedded=true"  frameborder="0"></iframe>
				</c:otherwise>
		    </c:choose>
		</div>
		<div class="text-center">
			<button class="btn savie-common-btn disabled-gray-btn review-btn" id="review-btn-3"><fmt:message key="button.review.and.agree" bundle="${msg}" /> (<span id="timer-3">8</span>)</button>
		</div>	
	</div>
  </div>
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
		<div class="save-con-btns clearfix">
			<center>
				<button class="btn savie-common-btn" id="keep-going-btn"><fmt:message key="button.keep.going" bundle="${msg}" /></button>
				<button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn"><fmt:message key="button.save.and.exit" bundle="${msg}" /></button>
			</center>
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
<div id="loadingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img style="width: 300px; height: 300px;"
        src="<%=request.getContextPath()%>/resources/images/loading.gif">
</div>

<script type="text/javascript">
	var language = "en";
	
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
		/* var csCenter = $("#centre").val();
		var perferredDate = $("#preferred-date").val();
		var perferredTime = $("#preferred-time").val();
		if(csCenter == "" && perferredDate == "" && perferredTime == "") {
			//$('#fullyBooked').modal('show');
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
	});
	function togglePreferred(id) {
		$(".col-xs-12 .preferred-date .date").hide();
		$("#"+ id).show();
	}
	
	// application saved modal will show after clicking 'Save and exit' button 
	$('#digi-radio').click(function () {
		if ($(this).is(':checked')) {
			$('#table-info').removeClass('hidden');
			$('#signoff-table').addClass('hidden');
		}
	});
	$('#off-radio').click(function () {
		if ($(this).is(':checked')) {
			$('#signoff-table').removeClass('hidden');
			$('#table-info').addClass('hidden');
			if($("#full-date").length > 0){
				$('#fullyBooked').modal('show');
			}
		}
	});
	
	$('#preferred-date').datepicker({
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
        //console.log($('.ui-select > #centre-button > span').text());
        $('#centre-button > span').remove();
        applicationCentre();
        function applicationCentre() {
           if(getWidth()>=992) {
              var inner_centre_html = $('#inline-centre').html();

              $('#inline-centre').addClass('hidden');
              $('#right-centre').append(inner_centre_html).removeClass('hidden');
              $('#inline-centre').html('');
           } else {
              var inner_centre_html = $('#right-centre').html();

              $('#inline-centre').append(inner_centre_html).removeClass('hidden');
              $('#right-centre').html('');
           }
        }
	 
	// modal timer configuration
	window.onload = function () {
		var pdfFile = $('#pdf-object').attr('data');
		var success = new PDFObject({ url: pdfFile }).embed();
	};
	var sec1 = 8;
	var sec2 = 8;
	var sec3 = 8;
	$('#fna-signature-modal').on('shown.bs.modal', function () {
		var interval = setInterval(function() {
			sec1 -= 1;
			updateSecond(sec1);
		}, 1000);

		function updateSecond(second) {
			if(second == 0) {
				clearInterval(interval);
				$('#review-btn-1').text('<fmt:message key="button.review.and.agreed" bundle="${msg}" />').removeClass('disabled-gray-btn');
			}
			$('#timer-1').text(second);
		}
	});
	$('#sales-signature-modal').on('shown.bs.modal', function () {
		var interval = setInterval(function() {
			sec2 -= 1;
			updateSecond(sec2);
		}, 1000);

		function updateSecond(second) {
			if(second == 0) {
				clearInterval(interval);
				$('#review-btn-2').text('<fmt:message key="button.review.and.agreed" bundle="${msg}" />').removeClass('disabled-gray-btn');
			}
			$('#timer-2').text(second);
		}
	});
	$('#policy-signature-modal').on('shown.bs.modal', function () {
		var interval = setInterval(function() {
			sec3 -= 1;
			updateSecond(sec3);
		}, 1000);

		function updateSecond(second) {
			if(second == 0) {
				clearInterval(interval);
				$('#review-btn-3').text('<fmt:message key="button.review.and.agreed" bundle="${msg}" />').removeClass('disabled-gray-btn');
			}
			$('#timer-3').text(second);
		}
	});
	 
	 $(document).ready(function() {			
		// Signature box configuration
		var mobile_canvas_height = '254';
		var dsktop_canvas_height = '274';
		var dsktop_canvas_width = '532';
		var $signatureFirstDiv = $('#signature-1');
		var $tmpSignature;
		var mobile_canvas_width = '412';
		var $signStatus1 = $('#signature-status-1');
		var $signStatus2 = $('#signature-status-2');
		var $signStatus3 = $('#signature-status-3');

		// Clearing the signature
		$('#link-clear-1').on('click', function() {
			$signatureFirstDiv.jSignature('reset');
			$('#btn-confirm-1').addClass('disabled-gray-btn');
			$('#correct-signature-1').addClass('hidden');
		});
		initSignature();
		$('#signature-box-1').on('show.bs.modal', function () {
			$tmpSignature = $signatureFirstDiv;
		
			$(window).resize(function(){
				window_width = $(window).width();
				if(window_width > 991) {					
				adjustCanvas(dsktop_canvas_height, dsktop_canvas_width);
			} else {
				adjustCanvas(mobile_canvas_height, mobile_canvas_width);
				}
			});
		});
		
		$signatureFirstDiv.on('change', function(e) {
			$('#correct-signature-1').removeClass('hidden');
			$('#btn-confirm-1').removeClass('disabled-gray-btn');
			$tmpSignature = $signatureFirstDiv;
		});
		
		// Submitting pdfs
		$('#review-btn-1').on('click', function(e) {
			e.preventDefault();
			if($(this).hasClass('disabled-gray-btn') == false) {
				$signStatus1.removeClass('savie-status').addClass('reviewed');
				$signStatus1.find('.pending').addClass('hidden');
				$signStatus1.find('.btn-table-savie').addClass('hidden');
				$signStatus1.find('.p-status').removeClass('hidden');
				$signStatus2.find('.btn-table-savie').removeClass('hidden');
				$signStatus2.find('.pending').addClass('hidden');
				$('#fna-signature-modal').modal('hide');
			}
		});
		$('#review-btn-2').on('click', function(e) {
			e.preventDefault();
			if($(this).hasClass('disabled-gray-btn') == false) {
				$signStatus2.removeClass('savie-status').addClass('reviewed');
				$signStatus2.find('.pending').addClass('hidden');
				$signStatus2.find('.btn-table-savie').addClass('hidden');
				$signStatus2.find('.p-status').removeClass('hidden');
				$signStatus3.find('.btn-table-savie').removeClass('hidden');
				$signStatus3.find('.pending').addClass('hidden');
				$('#sales-signature-modal').modal('hide');
			}
		});
		$('#review-btn-3').on('click', function(e) {
			e.preventDefault();
			if($(this).hasClass('disabled-gray-btn') == false) {
				$signStatus3.removeClass('savie-status').addClass('reviewed');
				$signStatus3.find('.pending').addClass('hidden');
				$signStatus3.find('.btn-table-savie').addClass('hidden');
				$signStatus3.find('.p-status').removeClass('hidden');
				$('#policy-signature-modal').modal('hide');
				$('#btn-acctps-sign').removeClass('disabled-gray-btn');
				$('#save-and-con-later').attr('data-target','#save-and-continue-batch5-modal');
			}
		});
		
		$('#btn-acctps-sign').on('click', function(e) {
			e.preventDefault();
			if($(this).hasClass('disabled-gray-btn') == false) {
				$('#signature-box-1').modal('show');
			}
			
		});
		
		var signatureFileSize = "${signatureFileSize}";
		$('#btn-confirm-1').on('click', function(e) {
			e.preventDefault();
			if($(this).hasClass('disabled-gray-btn') == false) {
				$('#signature-box-1').modal('hide');
				
				if (!$("#signature-1").jSignature('getData', 'native').length) {
			    	//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "error.signature.empty")).css('display', 'block');
			    	alert(getBundle(getBundleLanguage, "error.signature.empty"))
				}
				else{
					$('#btn-confirm-1').attr('disabled',"true");
					var $sigdiv = $("#signature-1");
					var datapair = $sigdiv.jSignature("getData", "image");
					var obj = datapair[1];
					if(datapair[1].length > signatureFileSize*1024 ){
					    //$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "error.signature.size")).css('display', 'block');
					    alert(getBundle(getBundleLanguage, "error.signature.size"));
					    $('#loading-overlay').modal('hide');
	
					}else if($('.correct-signature').hasClass('hide-element')){
						//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "error.signature.empty")).css('display', 'block');
						alert(getBundle(getBundleLanguage, "error.signature.empty"));
						$('#loading-overlay').modal('hide');
					}
					else{
						$.ajax({
					    	url:'<%=request.getContextPath()%>/ajax/savings-insurance/uploadSignature',     
					    	type:'post',     
					    	data:{ "image" : datapair[1] },     
					    	success:function(data){
					    		//loading mask 
					    		$('#loadingDiv').toggle();
								$('body').addClass('modal-open');
					    	    if(data==null || data == ''){
					    	    	//Unknown errors
					    	    	//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
					    	    	alert(getBundle(getBundleLanguage, "system.error.message"))
					    	    	$('#loading-overlay').modal('hide');					   
					    	    } 
					    	    else if( data.errMsgs == 'session expired'){
					    	    	//Timeout errors
					    	    	$('#loading-overlay').modal('hide');
					    	    	$('#timeout-modal').modal('show'); 
					    	    } 
					    	    else if( data.errMsgs != null ){
					    	    	//Other errors
					    	    	//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
					    	    	alert(getBundle(getBundleLanguage, "system.error.message"))
					    	    	$('#loading-overlay').modal('hide');
					    	    } 
					    	    else {
					    	    	// success
					    	    	window.onbeforeunload=null;
					    	    	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
					    	    }
					        },
							error:function(){
								$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
								$('#loading-overlay').modal('hide');
							}
					    });
					}
				}
				
			}
		});
		
		function initSignature() {
			var window_width = $(window).width();
			// canvas width and height for mobile
			var _height = mobile_canvas_height;
			var _width = window_width;
			
			if(window_width > 415 && window_width < 992) {
				_width = '412';
			} else if(window_width > 991) {
				// canvas width and height for desktop
				_height = dsktop_canvas_height;
				_width = dsktop_canvas_width;
			}
			
			$signatureFirstDiv.jSignature({
			   height: _height, 
			   width: _width,
			   lineWidth: 1,
			   'decor-color': 'transparent',
			   'signatureLine': false,
			});
		}
		
		function adjustCanvas(height, width) {
			var datapair = $tmpSignature.jSignature("getData", "base30");
			$('canvas.jSignature').prop({"height": height, "width": width, "lineWidth": 2}).css({'height':height + 'px', 'width': width + 'px'});
			$tmpSignature.jSignature("setData", "data:" + datapair.join(","));
		}
	 });
	 
	 $("#btn-cstmr-srvc-cnter").click(function(){
		 //window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}';
		 
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
				        "type":"3"
			   		},     
				    error:function(){       
				    },     
				    success:function(data){
				    	if(data.errMsgs == null){
				    		$("#signoff-table").attr("action", '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow2}');
					    	$("#signoff-table").submit();
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
	 });
	 
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
	 
	 $('.save-exit-btn1').click(function() {
			$('#save-and-continue-modal').modal('hide');
		});
     
     $('#keep-going-btn').click(function() {
			$('#save-and-continue-batch5-modal').modal('hide');
		});
		
		//full fill type = 2
		$('.save-exit-btn2').click(function() {
			$("#errorMsg").html("");
			$.ajax({
				  type : "POST",
				  async:false, 
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/signatureSaveforLater",
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
				  url : "<%=request.getContextPath()%>/ajax/savings-insurance/signatureSaveforLater",
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
</script>
