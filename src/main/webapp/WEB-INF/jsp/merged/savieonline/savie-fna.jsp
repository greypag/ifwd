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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/locale.js"></script>
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
							<h2>Financial Needs Analysis</h2>
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
									<div class="fna-radio-btn" data-val="0"><span>Male</span></div>
									<div class="fna-radio-btn" data-val="1"><span>Female</span></div>
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
							<a href="javascript:void(0);" class="fna-btn fna-btn-step1-start disabled">Let's get started</a>
						</div>
					</div>
					
				</div>
			</div>
			<div class="step2">
				<div class="cont clearfix">
					
					
					<div class="step2-input-gp mob-view">

						<div class="fna-row">
							<div class="lbl">Date of Birth<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="round-box date frm-fna-dob" data-mirror-fld="frm-fna-dob-mob" data-frm-fld="dob">
									<span class="txt_dob">${saviePlanDetails.dob1 }</span>
										 <span class="input-group-addon"></span>
										<input type="hidden" class="datepicker form-control "value="${saviePlanDetails.dob2 }" readonly>

								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl">Marital Status<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="fna-radio-gp frm-fna-marital-status" data-mirror-fld="frm-fna-marital-status-mob" data-frm-fld="marital_status">
									<div class="fna-radio-btn" data-val="0"><span>Single</span></div>
									<div class="fna-radio-btn" data-val="1"><span>Married</span></div>
									<div class="fna-radio-btn" data-val="2"><span>Divorced</span></div>
									<div class="fna-radio-btn" data-val="3"><span>Widowed</span></div>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl">No of dependents<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="fna-radio-gp frm-fna-dependents" data-mirror-fld="frm-fna-dependents-mob" data-frm-fld="dependents">
									<div class="fna-radio-btn" data-val="0"><span>Nil</span></div>
									<div class="fna-radio-btn" data-val="1"><span>1-3</span></div>
									<div class="fna-radio-btn" data-val="2"><span>4-6</span></div>
									<div class="fna-radio-btn" data-val="3"><span>7 or above</span></div>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl">Education Level<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-education" data-mirror-fld="frm-fna-education-mob" data-frm-fld="education">
										<option value="">Please select</option>
										<option value="0">Primary or below</option>
										<option value="1">Secondary / Matriculation</option>
										<option value="2">Vocational Training / Technical Institute /Business Institue</option>
										<option value="3">Post-secondary / University or above</option>
									</select>
								</div>
							</div>
						</div>
						<div class="fna-row">
							<div class="lbl">Employment Status<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-employment-status" data-mirror-fld="frm-fna-employment-status-mob" data-frm-fld="employment_status">
										<option value="">Please select</option>
									</select>
								</div>

							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl">Nature of business<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-nob" data-mirror-fld="frm-fna-nob-mob" data-frm-fld="nature_of_business">
										<option value="">Please select</option>
									</select>
								</div>
								
							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl">Occupation<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
								<div class="styled-select">
									<select class="frm-fna-occupation" data-mirror-fld="frm-fna-occupation-mob" data-frm-fld="occupation">
										<option value="">Please select</option>
									</select>
								</div>
							</div>
						</div>
						<div class="fna-row hide">
							<div class="lbl">Please specify<span class="fna-error-msg text-red"></span></div>
							<div class="fld">
									<input type="text" class="frm-fna-occupation-others round-box" data-frm-fld="occupation_others" onkeypress="return alphaOnly(event);">
							</div>
						</div>

						<div class="hidden-lg hidden-md clearfix mob-btn-gp">
							<!-- <a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a> -->
							<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled">Next</a>
						</div>
						<div class="hidden-sm hidden-xs clearfix desktop-btn-gp">
							<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step2-next disabled">Next</a>
						</div>

					</div>

					<div class="mob-view mob-hide">
						<div class="hidden-sm hidden-xs">
							<div id="matrix" class="frame img-wrapper">
								<div class="self"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/matrix_m1.png"></div>
								<div class="dependents"><img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/spacer.png"></div>
							</div>
						</div>
						<h3>Hi,<span class="dp-gender">Mr.</span> <span class="dp-name">Chan</span></h3>
						<div class="hidden-lg hidden-md">
							<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/matrix_m1.png" class="img-martix-mob">
						</div>

						<div class="hidden-lg hidden-md clearfix mob-btn-gp">
							<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
							<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step2-next">Next</a>
						</div>
					</div>
				</div>
			</div>
			<div class="step-flow-wrapper">
				<div class="step-flow">
					<div class="hidden-sm hidden-xs desktop-btn-gp">
						<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-finish reverse-color disabled">Save and Proceed to Product Recommendation</a>
						<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next reverse-color disabled">Next</a>
						<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back reverse-color">Back</a>
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
										<h4 class="clearfix">What are your objectives of buying our product? <span>(tick one or more) </span> </h4>
									</div>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp frm-fna-q1" data-mirror-fld="frm-fna-q1-mob" data-frm-fld="q1">
										<li class="fna-checkbox-btn" data-val="0">Financial protection against adversities<br><span>(e.g. death, accident, disability etc)</span></li>
										<li class="fna-checkbox-btn" data-val="1">Preparation for health care needs<br><span>(e.g. critical illness, hospitalization etc)</span></li>
										<li class="fna-checkbox-btn" data-val="2">Providing regular income in the future<br><span>(e.g. retirement income etc)</span></li>
										<li class="fna-checkbox-btn" data-val="3">Saving up for the future<br><span>(e.g. child education, retirement etc)</span></li>
										<li class="fna-checkbox-btn" data-val="4">Investment</li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="5">Others</li>
									</ul>
									<hr>
									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled">Next</a>
									</div>
								</div>

								<div class="q2 mob-hide mob-view">
									<div class="q-head">
										<h4 class="clearfix">What type(s) of insurance products you are looking for to meet your objectives above? <span>(tick one or more)</span></h4>
									</div>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp frm-fna-q2" data-mirror-fld="frm-fna-q2-mob" data-frm-fld="q2">
										<li class="fna-checkbox-btn" data-val="0">Pure insurance product <br><span>-without any savings or investment element <br>(e.g. term insurance)</span></li>
										<li class="fna-checkbox-btn" data-val="1">Insurance product with savings element <br><span>-with savings but without investment element<br>(e.g. non-participating policy)</span></li>
										<li class="fna-checkbox-btn" data-val="2">Insurance product with investment element<br><span>-Investment decisions and risks borne by insurer<br>(e.g. participating policy, universal life insurance)</span></li>
										<li class="fna-checkbox-btn" data-val="3">Insurance product with investment element<br><span>-Investment decisions and risks borne by policyholder<br>(e.g. Investment-Linked Assurance Schemes)</span></li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="4">Others</li>
									</ul>

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step3-mob-img2.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled">Next</a>
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
									<h4>What is your target benefit / protection period for insurance policy and/or investment plan? <span>(tick one)</span></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<div class="fna-radio-gp frm-fna-q3" data-mirror-fld="frm-fna-q3-mob" data-frm-fld="q3">
										<div class="fna-radio-btn" data-val="0"><span>&lt; 1 year</span></div>
										<div class="fna-radio-btn" data-val="1"><span>1-5 years</span></div>
										<div class="fna-radio-btn" data-val="2"><span>6-10 years</span></div>
										<div class="fna-radio-btn" data-val="3"><span>11-20 years</span></div>
										<div class="fna-radio-btn" data-val="4"><span>&gt; 20 years</span></div>
										<div class="fna-radio-btn" data-val="5"><span>Whole of life</span></div>
									</div>
								</div>

								<div class="q4">
									<h4>Your ability to pay premiums:<br>Is the source of income regular?</h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<div class="fna-radio-gp frm-fna-q4" data-mirror-fld="frm-fna-q4-mob" data-frm-fld="q4">
										<div class="fna-radio-btn" data-val="0"><span>Yes</span></div>
										<div class="fna-radio-btn" data-val="1"><span>No</span></div>
									</div>
								</div>

								
								<div class="hidden-lg hidden-md">
									<div class="img-mob-wrapper">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step4-mob-img1.jpg">
									</div>
								</div>
								

								<div class="hidden-lg hidden-md clearfix mob-btn-gp">
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled">Next</a>
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
										<h4>What is your average monthly income from<br>all sources in the past 2 years? <span>(tick one or more)</span></h4>
										<div class="fna-error-box">
											<span class="fna-error-msg text-red"></span>
										</div>
										<p>Speciﬁc amount:<br>Not less than HK$ <input type="text" class="frm-fna-q4a-others" onkeypress=" return isNumeric(event);" maxlength="6" data-mirror-fld="frm-fna-others-mob" data-frm-fld="q4_a_others" data-type="int"> per month<br>or In the following range:</p>

										<ul class="fna-radio-gp-indv clearfix frm-fna-q4a" data-mirror-fld="frm-fna-q4a-mob" data-frm-fld="q4_a">
											<li class="fna-radio-btn" data-val="0">less than HK$10,000</li>
											<li class="fna-radio-btn" data-val="1">HK$10,000 - $19,999</li>
											<li class="fna-radio-btn" data-val="2">HK$20,000 - HK$49,999</li>
											<li class="fna-radio-btn" data-val="3">HK$50,000 - HK$100,000</li>
											<li class="fna-radio-btn" data-val="4">over HK$100,000</li>
										</ul>

										<div class="hidden-lg hidden-md">
											<div class="img-mob-wrapper">
												<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-mob-img1.jpg">
											</div>
										</div>
										

										<div class="hidden-lg hidden-md clearfix mob-btn-gp">
											<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
											<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled">Next</a>
										</div>

								</div>

								<div class="q4b mob-view mob-hide">

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step5-mob-img2.jpg">
										</div>
									</div>

									<h4>What is your approximate current accumulative<br>amount of liquid assets?  <span>Please specify type(s) and total amount</span></h4>
									<div class="fna-error-box">
										<span class="err_q4b1 fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp no-line clearfix frm-fna-q4b" data-mirror-fld="frm-fna-q4b-mob" data-frm-fld="q4_b">
										<li class="fna-checkbox-btn" data-val="0">Cash</li>
										<li class="fna-checkbox-btn" data-val="1">Money market accounts</li>
										<li class="fna-checkbox-btn" data-val="2">Money in bank accounts</li>
										<li class="fna-checkbox-btn" data-val="3">Actively traded stocks</li>
										<li class="fna-checkbox-btn" data-val="4">Bonds and mutual funds</li>
										<li class="fna-checkbox-btn" data-val="5">US Treasury bills</li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="6">Others</li>
									</ul>
									<div class="fna-error-box">
										<span class="err_q4b2 fna-error-msg text-red"></span>
									</div>
									Amount: HK$ <input type="text" class="frm-fna-q4b-amount" onkeypress=" return isNumeric(event);" maxlength="9" data-mirror-fld="frm-fna-q4b-amount-mob" data-frm-fld="q4_b_amount" data-type="int">
									<p class="note">Note: Liquid assets are assets which may be easily turned into cash.<br>Real estate, coin collection and artwork are not considered to be liquid assets.</p>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled">Next</a>
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
									<h4><span class="q-num">4c</span>What is your average monthly expenses<br>including but not limited to living expenses,<br>household expenses, including dependent’s<br>expenses mortgage payment and regular<br>payment in the past 2 years?</h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									Total Expenses not less than <br class="mob-ignore">
									HK$<input type="text" class="frm-fna-q4c" data-mirror-fld="frm-fna-q4c-mob" data-frm-fld="q4_c" data-type="int" onkeypress=" return isNumeric(event);" maxlength="9" > per month

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step6-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled">Next</a>
									</div>


								</div>
								<div class="q4d mob-view mob-hide">
									<h4><span class="q-num">4d</span><span class="q-sub-num">i:</span>What is your total liabilities and estimated<br>ﬁnal expenses including but not limited to<br>the outstanding mortgage loan,<br>loans/debts, estate duties, funeral and<br>associated expenses and emergency fund? </h4>
									<div class="fna-error-box">
										<span class="err_q4d1 fna-error-msg text-red"></span>
									</div>
									<p>Total not less than HK$<input type="text" class="frm-fna-q4d-1" data-mirror-fld="frm-fna-q4d-1-mob" data-frm-fld="q4_d_1" data-type="int" onkeypress=" return isNumeric(event);" maxlength="9"></p>

									<h4><span class="q-sub-num">ii:</span>What is your total financial targets including<br>but not limited to the education fund for<br>yourself or dependents and estimated marr<br>-iage expenses?</h4>
									<div class="fna-error-box">
										<span class="err_q4d2 fna-error-msg text-red"></span>
									</div>
									<p>Total not less than HK$<input type="text" class="frm-fna-q4d-2" data-mirror-fld="frm-fna-q4d-2-mob" data-frm-fld="q4_d_2" data-type="int" onkeypress=" return isNumeric(event);" maxlength="9"></p>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled">Next</a>
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
										<h4><span class="q-num">4e</span>For how long are you able and willing to contribute to an insurance policy and/or investment plan?<span>(tick one)</span></h4>
										<div class="fna-error-box">
											<span class="fna-error-msg text-red"></span>
										</div>
										<div class="fna-radio-gp frm-fna-q4e" data-mirror-fld="frm-fna-q4e-mob" data-frm-fld="q4_e">
											<div class="fna-radio-btn" data-val="0"><span>&lt; 1 year</span></div>
											<div class="fna-radio-btn" data-val="1"><span>1-5 years</span></div>
											<div class="fna-radio-btn" data-val="2"><span>6-10 years</span></div>
											<div class="fna-radio-btn" data-val="3"><span>11-20 years</span></div>
											<div class="fna-radio-btn" data-val="4"><span>&gt; 20 years</span></div>
											<div class="fna-radio-btn" data-val="5"><span>Whole of life</span></div>
										</div>
									</div>

									<div class="hidden-lg hidden-md">
										<div class="img-mob-wrapper clearfix">
											<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step7-mob-img1.jpg">
										</div>
									</div>

									<div class="hidden-lg hidden-md clearfix mob-btn-gp">
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next-inside disabled">Next</a>
									</div>
								</div>
								<div class="q4f mob-view mob-hide">
									<div class="inner-cont">
										<h4><span class="q-num">4f</span>Approximately what percentage of your disposable income would you be able to use to pay your monthly<br>premium for the entire term of the insurance policy / investment plan in (4e) above? <span>(tick one)</span></h4>
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
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back-inside">Back</a>
										<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-next disabled">Next</a>
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
									<h4><span class="q-num">4g</span>In considering your ability to make payments,<br>what are your sources of funds? <span>(tick one or more)</span></h4>
									<div class="fna-error-box">
										<span class="fna-error-msg text-red"></span>
									</div>
									<ul class="fna-checkbox-gp no-line frm-fna-q4g" data-mirror-fld="frm-fna-q4g-mob" data-frm-fld="q4_g">
										<li class="fna-checkbox-btn" data-val="0">Salary</li>
										<li class="fna-checkbox-btn" data-val="1">Income</li>
										<li class="fna-checkbox-btn" data-val="2">Savings</li>
										<li class="fna-checkbox-btn" data-val="3">Investment</li>
										<li class="fna-checkbox-btn fna-cb-others" data-val="4">Others</li>
									</ul>
								</div>

								<div class="hidden-lg hidden-md">
									<div class="img-mob-wrapper clearfix">
										<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/step8-mob-img1.jpg">
									</div>
								</div>

								<div class="hidden-lg hidden-md clearfix mob-btn-gp">
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-barrow fna-btn-step-back">Back</a>
									<a href="javascript:void(0);" class="fna-btn-basic fna-btn-arrow fna-btn-step-finish disabled">Save and Proceed to <br>Product Recommendation</a>
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
						<h4>Sorry, you cannot proceed further on the Financial Needs Analysis</h4>
						<div class="d-cont"><p>Please call our Customer Service Hotline 3123 3123 to specify your needs with our Customer Service in order to give you more accurate product recommendations.</p></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!--   Main Content End -->
