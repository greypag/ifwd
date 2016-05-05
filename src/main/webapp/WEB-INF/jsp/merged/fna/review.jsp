<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
</script>

<!-- Main Content Start -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/onlinesavieFNA/select2.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/onlinesavieFNA/onlinesavieFNAReview.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/select2.js"></script>
<jsp:include page="/resources/js/onlinesavieFNA/locale.jsp" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/review.js"></script>
<section id="FNAReview">
	<div class="breadcrumb-container">
		<div class="container">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="breadcrumb.savie.product" bundle="${msg}" /></a></li>

					<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="label.fna" bundle="${msg}" /></li>
				</ol>
			</div>
		</div>
	</div>
	<form id="frmReview" name="frmReview" action="" method="post">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 lead-in">
				<p><fmt:message key="fna.info.review.and.update.fna" bundle="${msg}" /></p>
				<p><span><fmt:message key="fna.info.last.updated" bundle="${msg}" /> <span id="lastupdate">${savieFna.last_update }</span></span></p>
			</div>
		</div>
	</div>

	<div id="personal_info" class="container review-box display">
		<div class="row question">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 num">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 title"><p><fmt:message key="label.personal.info" bundle="${msg}" /></p></div>
			<!-- <a class="btn_edit" href="javascript:void(0);" rel=">Edit</a> -->
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline"><fmt:message key="label.name" bundle="${msg}" /></span><span class="content" id="name">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline"><fmt:message key="label.gender" bundle="${msg}" /></span><span class="content" id="gender">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline"><fmt:message key="label.dob" bundle="${msg}" /></span><span class="content" id="dob">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.martial.status" bundle="${msg}" /></span>
				<span class="displayMode marital_status content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="marital_status" name="marital_status" class="form-control select-label">
							<option value="0"><fmt:message key="option.martial.status.single" bundle="${msg}" /></option>
							<option value="1"><fmt:message key="option.martial.status.married" bundle="${msg}" /></option>
							<option value="2"><fmt:message key="option.martial.status.divorced" bundle="${msg}" /></option>
							<option value="3"><fmt:message key="option.martial.status.widowed" bundle="${msg}" /></option>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.no.of.dependents" bundle="${msg}" /></span>
				<span class="displayMode dependents content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="dependents" name="dependents" class="form-control select-label">
							<option value="0"><fmt:message key="option.no.of.dependents.nil" bundle="${msg}" /></option>
							<option value="1"><fmt:message key="option.no.of.dependents.1to3" bundle="${msg}" /></option>
							<option value="2"><fmt:message key="option.no.of.dependents.4to6" bundle="${msg}" /></option>
							<option value="3"><fmt:message key="option.no.of.dependents.7orabove" bundle="${msg}" /></option>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.education.level" bundle="${msg}" /></span>
				<span class="displayMode education content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="education" name="education" class="form-control select-label">
							<c:set var="level_id" value="0" scope="page" />
							<c:if test="${language == 'en'}">
								<c:forEach var="list" items="${etEducationLevelEN}">
									<enhance:out escapeXml="false">
									    <option value="${level_id}">${list.itemDesc }</option>
									</enhance:out>
									<c:set var="level_id" value="${level_id + 1}" scope="page" />
								</c:forEach>
							</c:if>
							<c:if test="${language == 'tc'}">
								<c:forEach var="list" items="${etEducationLevelCN}">
									<enhance:out escapeXml="false">
									    <option value="${level_id}">${list.itemDesc }</option>
									</enhance:out>
									<c:set var="level_id" value="${level_id + 1}" scope="page" />
								</c:forEach>
							</c:if>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.employment.status" bundle="${msg}" /></span>
				<span class="displayMode status content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="status" name="status" class="form-control select-label"></select>
					</div>
				</span>
			</div>
		</div>
		<div class="row NatureRow">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.nature.of.business" bundle="${msg}" /></span>
				<span class="displayMode nature content">&nbsp;</span>
				<span class="editMode content">
					<select id="nature" name="nature" class=""></select>
				</span>
			</div>
		</div>
		<div class="row OccupationRow">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline"><fmt:message key="label.occupation" bundle="${msg}" /></span>
				<span class="displayMode occupation content">&nbsp;</span>
				<span class="editMode content">
					<select id="occupation" name="occupation" class=""></select>
					<p class="occupation_others">Please specify: <input type="text" autocomplete="off" id="occupation_others" name="occupation_others" value="" maxlength="100"/></p>
				</span>
			</div>
		</div>

		<div id="cn" class="btn-action">
			<p class="error">&nbsp;</p>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel" rel="personal_info"><fmt:message key="button.cancel" bundle="${msg}" /></a>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok" rel="personal_info"><fmt:message key="button.fna.ok" bundle="${msg}" /></a>
		</div>
		<a class="bdr-curve btn btn-primary bck-btn btn_edit" href="javascript:void(0);" rel="personal_info" ><fmt:message key="button.edit" bundle="${msg}" /></a>
	</div>

	<div id="question-list"></div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-clear"> 
			<a href="javascript:void(0);" onclick="showFnaPopupClear();"><fmt:message key="fna.link.clearandleave" bundle="${msg}" /> <i class="fa fa-caret-right"></i></a>
			</div>
		</div>
		<div class="center row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<input type="button" id="btn_save" name="save" value="<fmt:message key="button.save.process" bundle="${msg}" />" class="bdr-curve btn btn-primary btn-lg btn-color-ylw" >
			</div>
		</div>
	</div>
	</form>

	<div style="display:none;">
		<div id="template_qu" class="container review-box display">
			<div class="question row">
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 right num"><p>&nbsp;</p></div>
				<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 title"><p>&nbsp;</p></div>
			</div>
			<div class="option row"></div>
			<div id="cn" class="btn-action">
				<p class="error">&nbsp;</p>
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel"><fmt:message key="button.cancel" bundle="${msg}" /></a>
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok"><fmt:message key="button.fna.ok" bundle="${msg}" /></a>
			</div>
			<a class="bdr-curve btn btn-primary bck-btn btn_edit" href="javascript:void(0);" rel=""><fmt:message key="button.edit" bundle="${msg}" /></a>
		</div>

		<div id="template_op" class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>

			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-10">
				<div class="wrapper">
					<div class="checkbox">
						<input type="checkbox" id="q0-c0" name="q0-c0" value="yes">
						<label for="q0-c0">&nbsp;</label>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal modal-vcenter fade bs-example-modal-lg fna-popup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupConfirm">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="fna-popup-cont">
					
					<div class="modal-body">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<h4><fmt:message key="popup.fna.attention.title" bundle="${msg}" /></h4>
						<div class="cont">
							<p><fmt:message key="popup.fna.attention.desc1" bundle="${msg}" /></p>
							<p><fmt:message key="popup.fna.attention.desc2" bundle="${msg}" /></p>
							<p><fmt:message key="popup.fna.attention.desc3" bundle="${msg}" /></p>
						</div>
						<div class="btn-clear-gp">
						<a href="javascript:void(0);" class="btn-yes" id="btn_save_confirm"><fmt:message key="popup.fna.attention.button1" bundle="${msg}" /></a><a href="javascript:void(0);" onclick="hidefna.();" class="btn-no"><fmt:message key="popup.fna.attention.button2" bundle="${msg}" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal modal-vcenter fade bs-example-modal-lg fna-popup-clear" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupClear">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						
						<div class="modal-body">
							<a class="close" aria-label="Close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</a>
							<h4><fmt:message key="fna.popup.clear.title" bundle="${msg}" /></h4>
							<div class="cont"><p><fmt:message key="fna.popup.clear.description" bundle="${msg}" /></p></div>
							<div class="btn-clear-gp">
							<a href="javascript:void(0);" onclick="clearFna();" class="btn-clear-confirm"><fmt:message key="button.confirm" bundle="${msg}" /></a><a href="javascript:void(0);" onclick="hideFnaPopupClear();" class="btn-clear-cancel"><fmt:message key="button.cancel" bundle="${msg}" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	
	<div class="modal modal-vcenter fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupEnquiry">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<div class="modal-body">
							<h4><fmt:message key="fna.popup.other.title" bundle="${msg}" /></h4>
							<div class="d-cont">
								<p><fmt:message key="fna.popup.other.desc" bundle="${msg}" /></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--#End# Template for dynamic content-->
	</div>
</section>
<!-- Main Content End -->