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

<!--   Main Content Start -->	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/onlinesavieFNA/select2.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/onlinesavieFNA/onlinesavieFNAGame.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/select2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/jquery.animateSprite.min.js"></script>
<jsp:include page="/resources/js/onlinesavieFNA/locale.jsp" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/animation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/game.js"></script>
<section>
	<div class="game-fna-wrapper">
		<div class="game-fna ">
			<form>
			<div class="step1">
				<div class="cont clearfix">
					<div>
						<div class="hidden-sm hidden-xs">
							<h2><fmt:message key="label.fna" bundle="${msg}" /></h2>
							<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step1-img1.png" class="img-family">
						</div>
						<div class="hidden-lg hidden-md">
							<div class="gender-img-wrapper clearfix">
								<div class="male-wrapper clearfix">
									<div class="male">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/mob-step1-img1.jpg" class="img-responsive">
									</div>
								</div>
								<div class="female-wrapper clearfix">
									<div class="female">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/mob-step1-img2.jpg" class="img-responsive">
									</div>
								</div>
							</div>
						</div>
						<div class="fna-input-bar clearfix">
							<div class="clearfix">
							<div class="fna-radio-gp-wrapper">
								<div class="fna-radio-gp frm-fna-gender" data-mirror-fld="frm-fna-gender-mob" data-frm-fld="gender">
									<div class="fna-radio-btn" data-val="0"><span><fmt:message key="label.male" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="1"><span><fmt:message key="label.female" bundle="${msg}" /></span></div>
								</div>
								<div class="fna-error-box">
									<span class="fna-error-msg text-red"></span>
								</div>
							</div>
							<div class="hidden-lg hidden-md">
								<label>Name</label>
							</div>
							<input type="text" name="frm-fna-name" value="${userDetails.fullName }" class="frm-fna-name" data-mirror-fld="frm-fna-name-mob" data-frm-fld="name" onkeypress=" return alphaOnly(event);" maxlength="50" readonly>
							</div>
							<a href="#" class="fna-btn fna-btn-step1-start disabled"><fmt:message key="button.lets.get.started" bundle="${msg}" /></a>
						</div>
					</div>
					
				</div>
			</div>
			<div class="step2">
				<div class="cont clearfix">
					
					
					<div class="step2-input-gp mob-view">

						<div class="fna-row">
							<div class="lbl"><fmt:message key="label.dob" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="round-box date frm-fna-dob" data-mirror-fld="frm-fna-dob-mob" data-frm-fld="dob">
									<span class="txt_dob">${saviePlanDetails.dob1 }</span>
										 <span class="input-group-addon"></span>
										<input type="hidden" class="datepicker form-control " value="${saviePlanDetails.dob2 }" readonly>

								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl"><fmt:message key="label.martial.status" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="fna-radio-gp frm-fna-marital-status" data-mirror-fld="frm-fna-marital-status-mob" data-frm-fld="marital_status">
									<div class="fna-radio-btn" data-val="0"><span><fmt:message key="option.martial.status.single" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="1"><span><fmt:message key="option.martial.status.married" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="2"><span><fmt:message key="option.martial.status.divorced" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="3"><span><fmt:message key="option.martial.status.widowed" bundle="${msg}" /></span></div>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl"><fmt:message key="label.no.of.dependents" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="fna-radio-gp frm-fna-dependents" data-mirror-fld="frm-fna-dependents-mob" data-frm-fld="dependents">
									<div class="fna-radio-btn" data-val="0"><span><fmt:message key="option.no.of.dependents.nil" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="1"><span><fmt:message key="option.no.of.dependents.1to3" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="2"><span><fmt:message key="option.no.of.dependents.4to6" bundle="${msg}" /></span></div>
									<div class="fna-radio-btn" data-val="3"><span><fmt:message key="option.no.of.dependents.7orabove" bundle="${msg}" /></span></div>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl"><fmt:message key="label.education.level" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-education" data-mirror-fld="frm-fna-education-mob" data-frm-fld="education">
										<option value=""><fmt:message key="option.please.select" bundle="${msg}" /></option>
										<c:set var="level_id" value="0" scope="page" />
										<c:if test="${language == 'en'}">
											<c:forEach var="list" items="${etEducationLevelEN}">
												<option value="${level_id}">${list.itemDesc }</option>
												<c:set var="level_id" value="${level_id + 1}" scope="page" />
											</c:forEach>
										</c:if>
										<c:if test="${language == 'tc'}">
											<c:forEach var="list" items="${etEducationLevelCN}">
												<option value="${level_id}">${list.itemDesc }</option>
												<c:set var="level_id" value="${level_id + 1}" scope="page" />
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl"><fmt:message key="label.employment.status" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-employment-status" data-mirror-fld="frm-fna-employment-status-mob" data-frm-fld="employment_status">
										<option value=""><fmt:message key="option.please.select" bundle="${msg}" /></option>
									</select>
								</div>

							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl"><fmt:message key="label.nature.of.business" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-nob" data-mirror-fld="frm-fna-nob-mob" data-frm-fld="nature_of_business">
										<option value=""><fmt:message key="option.please.select" bundle="${msg}" /></option>
									</select>
								</div>
								
							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl"><fmt:message key="label.occupation" bundle="${msg}" /><span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-occupation" data-mirror-fld="frm-fna-occupation-mob" data-frm-fld="occupation">
										<option value=""><fmt:message key="option.please.select" bundle="${msg}" /></option>
									</select>
								</div>
							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl">Please specify<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
									<input type="text" class="frm-fna-occupation-others round-box" data-frm-fld="occupation_others" onkeypress="return alphaOnly(event);" tabindex="-1">
							</div>
						</div>

						<div class="hidden-lg hidden-md clearfix mob-btn-gp">
							<!-- <a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a> -->
							<a href="#" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
						</div>
						<div class="hidden-sm hidden-xs clearfix desktop-btn-gp">
							<a href="#" class="fna-btn-basic fna-btn-arrow fna-btn-step2-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
						</div>

					</div>

					<div class="mob-view mob-hide">
						<div class="hidden-sm hidden-xs">
							<div id="matrix" class="frame img-wrapper">
								<div class="self"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/matrix_m1.png"></div>
								<div class="dependents"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/spacer.png"></div>
							</div>
						</div>
						<h3><fmt:message key="label.hi" bundle="${msg}" /> <span class="dp-name">Chan</span></h3>
						<div class="hidden-lg hidden-md">
							<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/matrix_m1.png" class="img-martix-mob">
						</div>

						<div class="hidden-lg hidden-md clearfix mob-btn-gp">
							<a href="#" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside"><fmt:message key="button.back" bundle="${msg}" /></a>
							<a href="#" class="fna-btn-basic fna-btn-arrow fna-btn-step2-next"><fmt:message key="button.next" bundle="${msg}" /></a>
						</div>
					</div>
				</div>
			</div>
			<div class="step-flow-wrapper">
				<div class="step-flow">
					<div class="hidden-sm hidden-xs desktop-btn-gp">
						<a href="#" class="fna-btn-basic fna-btn-arrow fna-btn-step-finish reverse-color disabled"><fmt:message key="button.save.process" bundle="${msg}" /></a>
						<a href="#" class="fna-btn-basic fna-btn-arrow fna-btn-step-next reverse-color disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
						<a href="#" class="fna-btn-basic fna-btn-barrow fna-btn-step-back reverse-color"><fmt:message key="button.back" bundle="${msg}" /></a>
					</div>
					<div class="step-flow-slider clearfix">
						<div class="step3 activeState">
							<div class="cont clearfix">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-indicator1.png" class="step-indicator1">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-indicator2.png" class="step-indicator2">
								</div>
								<div class="q1 mob-view">
									<div class="q-head">
										<h4 class="clearfix"><fmt:message key="fna.question.q1" bundle="${msg}" /><span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span> </h4>
									</div>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp frm-fna-q1" data-mirror-fld="frm-fna-q1-mob" data-frm-fld="q1">
										<li class="fna-checkbox-btn" data-val="0"><fmt:message key="fna.question.q1.option1" bundle="${msg}" /><br><span><fmt:message key="fna.question.q1.option1example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="1"><fmt:message key="fna.question.q1.option2" bundle="${msg}" /><br><span><fmt:message key="fna.question.q1.option2example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="2"><fmt:message key="fna.question.q1.option3" bundle="${msg}" /><br><span><fmt:message key="fna.question.q1.option3example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="3"><fmt:message key="fna.question.q1.option4" bundle="${msg}" /><br><span><fmt:message key="fna.question.q1.option4example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="4"><fmt:message key="fna.question.q1.option5" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="5"><fmt:message key="fna.question.others.details" bundle="${msg}" /></li>
									</ul>
									<hr>
									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>

								<div class="q2 mob-hide mob-view">
									<div class="q-head">
										<h4 class="clearfix"><fmt:message key="fna.question.q2" bundle="${msg}" /><br><span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span></h4>
									</div>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp frm-fna-q2" data-mirror-fld="frm-fna-q2-mob" data-frm-fld="q2">
										<li class="fna-checkbox-btn" data-val="0"><fmt:message key="fna.question.q2.option1" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option1remark" bundle="${msg}" /></span><br><span><fmt:message key="fna.question.q2.option1example" bundle="${msg}" /></span></li>	
										<li class="fna-checkbox-btn" data-val="1"><fmt:message key="fna.question.q2.option2" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option2remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option2example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="2"><fmt:message key="fna.question.q2.option3" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option3remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option3example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn" data-val="3"><fmt:message key="fna.question.q2.option4" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option4remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option4example" bundle="${msg}" /></span></li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="4"><fmt:message key="fna.question.others.details" bundle="${msg}" /></li>
									</ul>

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-mob-img2.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>
								<div class="hidden-sm hidden-xs">
									<div class="img1-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-img1.png">
									</div>
									<div class="img2-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-img3.png">
									</div>
									<div class="img3-wrapper" id="woman">
										<div class="body"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="step4">

							<div class="cont">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-indicator1.png" class="step-indicator1">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-indicator2.png" class="step-indicator2">
								</div>
								<div class="q3">
									<h4><fmt:message key="fna.question.q3" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<div class="fna-radio-gp frm-fna-q3" data-mirror-fld="frm-fna-q3-mob" data-frm-fld="q3">
										<div class="fna-radio-btn" data-val="0"><span><fmt:message key="fna.question.q3.option1" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="1"><span><fmt:message key="fna.question.q3.option2" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="2"><span><fmt:message key="fna.question.q3.option3" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="3"><span><fmt:message key="fna.question.q3.option4" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="4"><span><fmt:message key="fna.question.q3.option5" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="5"><span><fmt:message key="fna.question.q3.option6" bundle="${msg}" /></span></div>
									</div>
								</div>

								<div class="q4">
									<h4><fmt:message key="fna.question.q4" bundle="${msg}" /></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<div class="fna-radio-gp frm-fna-q4" data-mirror-fld="frm-fna-q4-mob" data-frm-fld="q4">
										<div class="fna-radio-btn" data-val="0"><span><fmt:message key="label.yes" bundle="${msg}" /></span></div>
										<div class="fna-radio-btn" data-val="1"><span><fmt:message key="label.no" bundle="${msg}" /></span></div>
									</div>
								</div>

								
								<div class="hidden-lg hidden-md">
									<div class="img-mob-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-mob-img1.jpg">
									</div>
								</div>
								

								<div class="hidden-lg hidden-md clearfix mob-btn-gp">
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
								</div>

								<div class="hidden-sm hidden-xs">
									<div class="img1-wrapper" id="plane" >
										<div class="body"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-img1.png"></div>
									</div>
									<div class="img2-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-img2.png">
									</div>
								</div>

							</div>
						</div>
						<div class="step5">
							<div class="cont">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-indicator1.png" class="step-indicator1">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-indicator2.png" class="step-indicator2">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-indicator3.png" class="step-indicator3">
								</div>
								<div class="q4a mob-view">
										<h4><fmt:message key="fna.question.q4a" bundle="${msg}" /><span> <fmt:message key="fna.question.choose.one" bundle="${msg}" /></span></h4>
										<div class="fna-error-box">
											<span class="fna-error-msg text-red"></span>
										</div>
										<p><fmt:message key="fna.question.q4a.amount" bundle="${msg}" /><br><fmt:message key="fna.question.q4a.lessthan" bundle="${msg}" /> <input type="text" class="frm-fna-q4a-others" onkeypress=" return isNumeric(event);" maxlength="10" data-mirror-fld="frm-fna-others-mob" data-frm-fld="q4_a_others" data-type="int" data-allowzero="true" tabindex="-1"> <fmt:message key="fna.question.q4a.month" bundle="${msg}" /> <div class="sep"></div> <fmt:message key="fna.question.q4a.range" bundle="${msg}" /></p>

										<ul class="fna-radio-gp-indv clearfix frm-fna-q4a" data-mirror-fld="frm-fna-q4a-mob" data-frm-fld="q4_a">
											<li class="fna-radio-btn" data-val="0"><fmt:message key="fna.question.q4a.option1" bundle="${msg}" /></li>
											<li class="fna-radio-btn" data-val="1"><fmt:message key="fna.question.q4a.option2" bundle="${msg}" /></li>
											<li class="fna-radio-btn" data-val="2"><fmt:message key="fna.question.q4a.option3" bundle="${msg}" /></li>
											<li class="fna-radio-btn" data-val="3"><fmt:message key="fna.question.q4a.option4" bundle="${msg}" /></li>
											<li class="fna-radio-btn" data-val="4"><fmt:message key="fna.question.q4a.option5" bundle="${msg}" /></li>
										</ul>

										<div class="hidden-lg hidden-md">
											<div class="img-mob-wrapper">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-mob-img1.jpg">
											</div>
										</div>
										

										<div class="hidden-lg hidden-md clearfix mob-btn-gp">
											<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
											<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
										</div>

								</div>

								<div class="q4b mob-view mob-hide">

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-mob-img2.jpg">
										</div>
									</div>

									<h4><fmt:message key="fna.question.q4b" bundle="${msg}" /> <span><fmt:message key="fna.question.q4b.specify" bundle="${msg}" /></span></h4>
									<div class="fna-error-box">
										<span class="err_q4b1 fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp no-line clearfix frm-fna-q4b" data-mirror-fld="frm-fna-q4b-mob" data-frm-fld="q4_b">
										<li class="fna-checkbox-btn" data-val="0"><fmt:message key="fna.question.q4b.option1" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="1"><fmt:message key="fna.question.q4b.option2" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="2"><fmt:message key="fna.question.q4b.option3" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="3"><fmt:message key="fna.question.q4b.option4" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="4"><fmt:message key="fna.question.q4b.option5" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="5"><fmt:message key="fna.question.q4b.option6" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="6"><fmt:message key="fna.question.others.details" bundle="${msg}" /></li>
									</ul>
									<div class="fna-error-box">
										<span class="err_q4b2 fna-error-msg text-red"></span>
									</div>
									<div class="sep"></div>
									<fmt:message key="fna.question.q4b.amount" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <input type="text" class="frm-fna-q4b-amount" onkeypress=" return isNumeric(event);" maxlength="10" data-mirror-fld="frm-fna-q4b-amount-mob" data-frm-fld="q4_b_amount" data-type="int" data-allowzero="true" tabindex="-1"> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" />
									<p class="note"><fmt:message key="fna.question.q4b.note" bundle="${msg}" /></p>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>
								<div class="hidden-sm hidden-xs">
									<div class="img1-wrapper" id="car" >
										<div class="smoke"></div>
										<div class="shadow"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_car_02.png"></div>
										<div class="body"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_car_01.png"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="step6">
							<div class="cont">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step6-indicator1.png" class="step-indicator1">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step6-indicator2.png" class="step-indicator2">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step6-indicator3.png" class="step-indicator3">
								</div>

								<div class="q4c mob-view">
									<h4><span class="q-num">4c</span><fmt:message key="fna.question.q4c" bundle="${msg}" /></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<fmt:message key="fna.question.q4c.totallessthen" bundle="${msg}" /> <br class="mob-ignore">
									<fmt:message key="fna.question.q4c.month" bundle="${msg}" /> <input type="text" class="frm-fna-q4c" data-mirror-fld="frm-fna-q4c-mob" data-frm-fld="q4_c" data-type="int" data-allowzero="true" onkeypress=" return isNumeric(event);" maxlength="10" tabindex="-1" > <fmt:message key="fna.question.q4c.hkd" bundle="${msg}" />

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step6-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>


								</div>
								<div class="q4d mob-view mob-hide">
									<h4><span class="q-num">4d</span><span class="q-sub-num">i:</span><fmt:message key="fna.question.q4di" bundle="${msg}" /></h4>
									<div class="fna-error-box">
										<span class="err_q4d1 fna-error-msg text-red"></span>
									</div>
									<p><fmt:message key="fna.question.q4di.lessthan" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <input type="text" class="frm-fna-q4d-1" data-mirror-fld="frm-fna-q4d-1-mob" data-frm-fld="q4_d_1" data-type="int" data-allowzero="true" onkeypress=" return isNumeric(event);" maxlength="10" tabindex="-1"> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>

									<h4><span class="q-sub-num">ii:</span><fmt:message key="fna.question.q4dii" bundle="${msg}" /></h4>
									<div class="fna-error-box">
										<span class="err_q4d2 fna-error-msg text-red"></span>
									</div>
									<p><fmt:message key="fna.question.q4dii.leanthan" bundle="${msg}" /> <fmt:message key="label.dollar.hkd.en" bundle="${msg}" /> <input type="text" class="frm-fna-q4d-2" data-mirror-fld="frm-fna-q4d-2-mob" data-frm-fld="q4_d_2" data-type="int" data-allowzero="true" onkeypress=" return isNumeric(event);" maxlength="10" tabindex="-1"> <fmt:message key="label.dollar.hkd.cn" bundle="${msg}" /></p>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>
								<div class="hidden-sm hidden-xs">
									<div class="img1-wrapper" id="girl">
										<div class="shadow"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_girl_jump_02.png"></div>
										<div class="body"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_girl_jump_01.png"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="step7">
							<div class="cont">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step7-indicator1.png" class="step-indicator1">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step7-indicator2.png" class="step-indicator2">
								</div>
								<div class="q4e mob-view">
									<div class="inner-cont">
										<h4><span class="q-num">4e</span><fmt:message key="fna.question.q4e" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span></h4>
										<div class="fna-error-box">
											<span class="fna-error-msg text-red"></span>
										</div>
										<div class="fna-radio-gp frm-fna-q4e" data-mirror-fld="frm-fna-q4e-mob" data-frm-fld="q4_e">
											<div class="fna-radio-btn" data-val="0"><span><fmt:message key="fna.question.q4e.option1" bundle="${msg}" /></span></div>
											<div class="fna-radio-btn" data-val="1"><span><fmt:message key="fna.question.q4e.option2" bundle="${msg}" /></span></div>
											<div class="fna-radio-btn" data-val="2"><span><fmt:message key="fna.question.q4e.option3" bundle="${msg}" /></span></div>
											<div class="fna-radio-btn" data-val="3"><span><fmt:message key="fna.question.q4e.option4" bundle="${msg}" /></span></div>
											<div class="fna-radio-btn" data-val="4"><span><fmt:message key="fna.question.q4e.option5" bundle="${msg}" /></span></div>
											<div class="fna-radio-btn" data-val="5"><span><fmt:message key="fna.question.q4e.option6" bundle="${msg}" /></span></div>
										</div>
									</div>

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step7-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>
								<div class="q4f mob-view mob-hide">
									<div class="inner-cont">
										<h4><span class="q-num">4f</span><fmt:message key="fna.question.q4f" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.one" bundle="${msg}" /></span></h4>
										<div class="fna-error-box">
											<span class="fna-error-msg text-red"></span>
										</div>
										<div class="answer-wrapper">
											<ul class="fna-radio-gp-cb floating no-line clearfix frm-fna-q4f" data-mirror-fld="frm-fna-q4f-mob" data-frm-fld="q4_f">
												<li class="fna-radio-btn rgt a0" data-val="0"><span>&lt;10%</span></li>
												<li class="fna-radio-btn a1" data-val="1"><span>10% - 20%</span></li>
												<li class="fna-radio-btn a2" data-val="2"><span>21% - 30%</span></li>
												<li class="fna-radio-btn a3" data-val="3"><span>31% - 40%</span></li>
												<li class="fna-radio-btn a4" data-val="4"><span>41% - 50%</span></li>
												<li class="fna-radio-btn rgt a5" data-val="5"><span>&gt;50%</span></li>
											</ul>

											<div class="chart-wrapper">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_02.png" class="a5">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_03.png" class="a4">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_04.png" class="a3">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_05.png" class="a2">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_06.png" class="a1">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_07.png" class="a0">
											</div>
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/image_chart_08.png" class="chart-line">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside"><fmt:message key="button.back" bundle="${msg}" /></a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled"><fmt:message key="button.next" bundle="${msg}" /></a>
									</div>
								</div>
							</div>
						</div>
						<div class="step8">
							<div class="cont">
								<div class="hidden-sm hidden-xs">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step8-indicator1.png" class="step-indicator1">
								</div>
								<div class="q4g">
									<h4><span class="q-num">4g</span><fmt:message key="fna.question.q4g" bundle="${msg}" /> <span><fmt:message key="fna.question.choose.multiple" bundle="${msg}" /></span></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp no-line frm-fna-q4g" data-mirror-fld="frm-fna-q4g-mob" data-frm-fld="q4_g">
										<li class="fna-checkbox-btn" data-val="0"><fmt:message key="fna.question.q4g.option1" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="1"><fmt:message key="fna.question.q4g.option2" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="2"><fmt:message key="fna.question.q4g.option3" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn" data-val="3"><fmt:message key="fna.question.q4g.option4" bundle="${msg}" /></li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="4"><fmt:message key="fna.question.others.details" bundle="${msg}" /></li>
									</ul>
								</div>

								<div class="hidden-lg hidden-md">
									<div class="img-mob-wrapper clearfix">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step8-mob-img1.jpg">
									</div>
								</div>

								<div class="hidden-lg hidden-md clearfix mob-btn-gp">
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back"><fmt:message key="button.back" bundle="${msg}" /></a>
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-finish disabled"><fmt:message key="button.save.process" bundle="${msg}" /></a>
								</div>
								<div class="hidden-sm hidden-xs">
									<div class="img1-wrapper" id="family">
										<div class="body"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="last-loading">
				<div class="last-loading-cont">
					<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/loading_pic_02.png" class="img-responsive">
					<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/loading_pic_01.png" class="img-responsive family">
					<p><fmt:message key="fna.info.waiting.result" bundle="${msg}" /></p>

					<div class="bubble-gp">
						<div class="spinner">
							<div class="bounce1"></div>
							<div class="bounce2"></div>
							<div class="bounce3"></div>
						</div>
					</div>
				</div>
				
			</div>
			</form>
		</div>
	</div>

	<div class="modal modal-vcenter fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupContact">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="fna-popup-cont">
					
					<div class="modal-body">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<h4><fmt:message key="fna.popup.other.title" bundle="${msg}" /></h4>
						<div class="d-cont"><p><fmt:message key="fna.popup.other.desc" bundle="${msg}" /></p></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--   Main Content End -->
