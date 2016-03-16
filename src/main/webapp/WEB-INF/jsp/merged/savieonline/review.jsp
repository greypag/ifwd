<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/locale.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/review.js"></script>
<section id="FNAReview">
	<div class="breadcrumb-container">
		<div class="container">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Save</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Savie</a></li>
					<li class="active "><i class="fa fa-caret-right"></i>Financial Needs Analysis</li>
				</ol>
			</div>
		</div>
	</div>
	<form id="frmReview" name="frmReview" action="" method="post">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 lead-in">
				<p>Review and update your Financial Needs Analysis selection to match your current needs</p>
				<p><span>Last updated on <span id="lastupdate">${savieFna.last_update }</span></span></p>
			</div>
		</div>
	</div>

	<div id="personal_info" class="container review-box display">
		<div class="row question">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 num">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 title"><p>Personal Information</p></div>
			<!-- <a class="btn_edit" href="javascript:void(0);" rel="">Edit</a> -->
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Name</span><span class="content" id="name">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Gender</span><span class="content" id="gender">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11"><span class="headline">Date of Birth</span><span class="content" id="dob">&nbsp;</span></div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Marital Status</span>
				<span class="displayMode marital_status content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="marital_status" name="marital_status" class="form-control select-label">
							<option value="0">Single</option>
							<option value="1">Married</option>
							<option value="2">Divorced</option>
							<option value="3">Widowed</option>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">No. of dependents</span>
				<span class="displayMode dependents content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="dependents" name="dependents" class="form-control select-label">
							<option value="0">Nil</option>
							<option value="1">1-3</option>
							<option value="2">4-5</option>
							<option value="3">7 or above</option>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Education Level</span>
				<span class="displayMode education content">&nbsp;</span>
				<span class="editMode content">
					<div class="styled-select">
						<select id="education" name="education" class="form-control select-label">
							<option value="0">Primary or below</option>
							<option value="1">Secondary / Matriculation</option>
							<option value="2">Vocational Training / Technical Institute / Business Institute</option>
							<option value="3">Post-secondary / University or above</option>
						</select>
					</div>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Employment Status</span>
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
				<span class="headline">Nature of Business</span>
				<span class="displayMode nature content">&nbsp;</span>
				<span class="editMode content">
					<select id="nature" name="nature" class=""></select>
				</span>
			</div>
		</div>
		<div class="row OccupationRow">
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">&nbsp;</div>
			<div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
				<span class="headline">Occupation</span>
				<span class="displayMode occupation content">&nbsp;</span>
				<span class="editMode content">
					<select id="occupation" name="occupation" class=""></select>
					<p class="occupation_others">Please specify: <input type="text" id="occupation_others" name="occupation_others" value="" maxlength="100"/></p>
				</span>
			</div>
		</div>

		<div id="cn" class="btn-action">
			<p class="error">&nbsp;</p>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel" rel="personal_info">CANCEL</a>
			<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok" rel="personal_info">OK</a>
		</div>
		<a class="bdr-curve btn btn-primary bck-btn btn_edit" href="javascript:void(0);" rel="personal_info" >Edit</a>
	</div>

	<div id="question-list"></div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-clear"> 
			<a href="javascript:void(0);" onclick="showFnaPopupClear();">Clear Record and Leave <i class="fa fa-caret-right"></i></a>
			</div>
		</div>
		<div class="center row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<input type="button" id="btn_save" name="save" value="Save and Proceed to Product Recommendation" class="bdr-curve btn btn-primary btn-lg btn-color-ylw" >
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
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary bck-btn btn_cancel">CANCEL</a>
				<a href="javascript:void(0);" class="bdr-curve btn btn-primary nxt-btn btn_ok">OK</a>
			</div>
			<a class="bdr-curve btn btn-primary bck-btn btn_edit" href="javascript:void(0);" rel="">Edit</a>
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
	
	<div class="modal modal-vcenter fade bs-example-modal-lg fna-popup-clear" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						
						<div class="modal-body">
							<a class="close" aria-label="Close" data-dismiss="modal">
								<span aria-hidden="true" style="font-size:30px;">×</span>
							</a>
							<h4>Do you mean ...</h4>
							<div class="cont">You want to delete the FNA data (which include the answer and recommended product info). Please confirm and we will bring you back to Savings Insurance page.</div>
							<div class="btn-clear-gp">
							<a href="javascript:void(0);" onclick="clearFna();">Confirm</a><a href="javascript:void(0);" onclick="hideFnaPopupClear();">Cancel</a>
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
							<h4>Sorry, you cannot proceed further on the Financial Needs Analysis</h4>
							<div class="d-cont">
								<p>Please call our Customer Service Hotline 3123 3123 to specify your needs with our Customer Service in order to give you more accurate product recommendations.</p>
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