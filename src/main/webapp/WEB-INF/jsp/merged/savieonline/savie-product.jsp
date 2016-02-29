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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/uifn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/locale.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/onlinesavieFNA/recommend.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/onlinesavieFNA/onlinesavieFNARecommend.css">
<section>
	<div class="fna-recommend">
		<div class="fna-breadcrumb">
			<div class="container">
				<div class="row">
					<ol class="breadcrumb pad-none hidden-sm hidden-xs">
						<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#">Savie</a></li>
						<li class="active "><i class="fa fa-caret-right"></i>Product Recommendation</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="fna-recommend-container">
			<div class="container">

				<div class="row">
					<div class="col-lg-3 col-sm-12 col-md-3 col-xs-12 fna-col-selection hidden-print">
						<div class="fna-sel-cont">
							<div class="hidden-sm hidden-xs">
								<div class="fna-sel-floating-panel">
									
									<a href="javascript:void(0);" class="fna-btn-analyse btn btn-primary btn-lg">Save All and Analyse Again <i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-btn-cancel btn btn-primary btn-lg">Cancel</a>
								</div>
							</div>
							<h4 class="fna-sel-title">Your FNA Selection
								<div class="hidden-lg hidden-md">
									<a href="javascript:void(0);" class="fna-btn-mob-close"><i class="fa fa-times"></i></a>
								</div>
							</h4>
							<div class="fna-sel-grid q2">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_02.png">Insurance products<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>

								<div class="checkbox-gp">
									<div class="checkbox">
										<input type="checkbox" id="q2_c1" name="q2" value="0" disabled>
										<label for="q2_c1">Pure insurance product<br><span>-without any savings or investment element <br>(e.g. term insurance)</span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c2" name="q2" value="1" disabled>
										<label for="q2_c2">Insurance product with savings element<br><span>-with savings but without investment element<br>(e.g. non-participating policy)</span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c3" name="q2" value="2" disabled>
										<label for="q2_c3">Insurance product with investment element<br><span>-Investment decisions and risks borne by insurer<br>(e.g. participating policy, universal life insurance)</span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c4" name="q2" value="3" disabled>
										<label for="q2_c4">Insurance product with investment element<br><span>-Investment decisions and risks borne by policyholder<br>(e.g. Investment-Linked Assurance Schemes)</span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c5" name="q2" value="4" disabled>
										<label for="q2_c5">Others</label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q1">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_01.png">Objectives<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="checkbox-gp">
									<div class="checkbox">
										<input type="checkbox" id="q1_c1" name="q1" value="0" disabled>
										<label for="q1_c1">Financial protection against adversities</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c2" name="q1" value="1" disabled>
										<label for="q1_c2">Preparation for health care needs</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c3" name="q1" value="2" disabled>
										<label for="q1_c3">Providing regular income in the future</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c4" name="q1" value="3" disabled>
										<label for="q1_c4">Saving up for the future</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c5" name="q1" value="4" disabled>
										<label for="q1_c5">Investment</label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q3">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_03.png">Benefit/ protection period<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="radio-gp">
									<div class="checkbox">
										<input type="checkbox" id="q3_c1" name="q3" value="0" disabled>
										<label for="q3_c1">&lt; 1 year</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c2" name="q3" value="1" disabled>
										<label for="q3_c2">1-5 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c3" name="q3" value="2" disabled>
										<label for="q3_c3">6-10 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c4" name="q3" value="3" disabled>
										<label for="q3_c4">11-20 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c5" name="q3" value="4" disabled>
										<label for="q3_c5">&gt; 20 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c6" name="q3" value="5" disabled>
										<label for="q3_c6">Whole of life</label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q4_e">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_04.png">Contribution period<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="radio-gp">
									<div class="checkbox">
										<input type="checkbox" id="q4e_c1" name="q4e" value="0" disabled>
										<label for="q4e_c1">&lt; 1 year</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c2" name="q4e" value="1" disabled>
										<label for="q4e_c2">1-5 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c3" name="q4e" value="2" disabled>
										<label for="q4e_c3">6-10 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c4" name="q4e" value="3" disabled>
										<label for="q4e_c4">11-20 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c5" name="q4e" value="4" disabled>
										<label for="q4e_c5">&gt; 20 years</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c6" name="q4e" value="5" disabled>
										<label for="q4e_c6">Whole of life</label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q4_a">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_05.png">Your ability to pay premium<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="radio-gp">
									<div class="checkbox">
										<input type="checkbox" id="q4a_c1" name="q4_a" value="0" disabled>
										<label for="q4a_c1">less than HK$10,000</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4a_c2" name="q4_a" value="1" disabled>
										<label for="q4a_c2">HK$10,000 - $19,999</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4a_c3" name="q4_a" value="2" disabled>
										<label for="q4a_c3">HK$20,000 - HK$49,999</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4a_c4" name="q4_a" value="3" disabled>
										<label for="q4a_c4">HK$50,000 - HK$100,000</label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4a_c5" name="q4_a" value="4" disabled>
										<label for="q4a_c5">over HK$100,000</label>
									</div><!-- 
									<div class="checkbox">
										<input type="checkbox" id="q4a_c6" name="q4a" value="yes" disabled>
										<label for="q4a_c6">HK$<input type="text" onkeypress="return isNumeric(event)" value="" readonly></label>
									</div> -->
								</div>
							</div>
							<div class="fna-sel-grid no-line q4_b_amount">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_06.png">Liquid assets<a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>

								<label>
									HK$<input type="text" onkeypress="return isNumeric(event)" value="" readonly>
								</label>
							</div>

						</div>
						<a href="javascript:void(0);" class="btn-clear"><i class="fa fa-caret-left"></i> Clear Record and Leave</a>
						<div class="floating-marker"></div>
						<div class="fna-btn-gp hidden-lg hidden-md row">
							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-mob-cancel">Cancel</a>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-mob-analyse">Analyse Again<i class="fa fa-caret-right"></i></a>
							</div>					
						</div>
						
						<!-- <div class="row hidden-sm hidden-xs">
							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-analyse">Analyse Again<i class="fa fa-caret-right"></i></a>
								
							</div>
						</div> -->
					</div>
					<div  class="col-lg-9 col-sm-12 col-md-9 col-xs-12 fna-col-recommend">
						<div class="amended-overlayer hidden-sm hidden-xs"></div>
						<div class="fna-txt-result hidden-print">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
									<p class="head"><span class="txt_fna_name">${userDetails.fullName }</span>, <br>FWD recommends<span class="txt_products"> <span class="txt_pnum">4</span> products</span> for you</p>
									<p>Based on your answers to the Financial Needs Analysis, below are the insurance options to meet your objective(s) and need(s) for your conditions:</p>
									<div class="hidden-xs">
										<a href="javascript:void(0);" class="fna-btn-discover">Discover now</a>
									</div>
									<a href="<%=request.getContextPath()%>/${language}/savings-insurance/savie-review" class="fna-btn-review">Back to My FNA Review&nbsp;<i class="fa fa-caret-right"></i></a>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 hidden-xs hidden-sm">
									<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/recommend_box_pic_01.png" class="img-responsive">
								</div>
							</div>
						</div>
						<div class="row fna-mobile-header pad-none">
							
							<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-txt-result hidden-lg">
								Based on your answers to the Financial Needs Analysis, below are the insurance options to meet your objective(s) and need(s) for your conditions:
							</div> -->
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-top-btn-gp hidden-print"> 
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-2 col-xs-2 hidden-lg hidden-md pad-none"> 
										<a href="javascript:void(0)" class="fna-btn-filter">Filter</a>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-10 col-xs-10"> 
										<div class="styled-select text-right">
											<span class="sort-txt">Product Sorting:</span>
											<select name="fnaMobSort" class="form-control soflow select-label" id="fnaMobSort">
												<option value="0" selected>Contribution Period - High To Low</option>
												<option value="4">Contribution Period - Low To High</option>
												<option value="1">Min issue age - High To Low</option>
												<option value="5">Min issue age - Low To High</option>
												<option value="2">Max issue age - High To Low</option>
												<option value="6">Max issue age - Low To High</option>
												<option value="3">Protection Period - High To Low</option>
												<option value="7">Protection Period - Low To High</option>
											</select>
											<i class="fa fa-caret-down"></i>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="fna-product-gp-wrapper"></div>
						
						<a href="javascript:void(0);" class="fna-btn-load-products-more hidden-print"><span>Load more products <i class="fa fa-caret-down"></i></span></a>
										
						
					</div>
				</div>
			</div>
		</div>
		<!--#Start# Template for dynamic content-->
		<div class="template">
			<div class="fna-product-gp">
				<h5 class="fna-btn-expand-gp-row"><span class="fna-product-gp-name"></span><a href="javascript:void(0);" class="glyphicon glyphicon-plus fna-btn-expand-gp"></a></h5>

				<div class="expander">
					
					<div class="fna-product-wrapper">
						<!-- Dynamic Content in Here -->
					</div>
				</div>
			</div>

			
			<div class="fna-product">

				<div class="fna-product-head clearfix">
					<div class="fna-product-type">
						<span class="fna-product-name"></span><br>
						<span class="fna-product-type-name"></span>
						<span class="fna-tooltips fna-product-type-tooltips show-inline-md" data-placement="bottom" data-original-title="">i</span>
					</div>
					<div class="fna-product-cfa hidden-print">
						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}?type=2" class="fna-btn-sel-product"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png">Appy Now</a>

						<a href="javascript:void(0);" class="fna-btn-call-details"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon02.png">Call For Details</a>
					</div>
				</div>
				<!-- <div class="product-type-cont hidden-lg hidden-md">
					<span class="fna-product-type-name"></span>
				</div> -->
				<div class="sort-header clearfix withdata">
					<div class="con_prd"></div>
					<div class="prd_age"></div>
					<div class="min_age"></div>
					<div class="max_age"></div>
				</div>

				<div class="fna-product-cont">
					<div class="row fna-btn-show-detail-row hidden-print">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<a href="javascript:void(0);" class="fna-btn-show-detail">
								<span class="fna-txt-show">Show Details <i class="fa fa-caret-down"></i></span>
								<span class="fna-txt-hide">Hide Details <i class="fa fa-caret-up"></i></span>
							</a>
						</div>
					</div>
					<div class="expander">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-product-col-feature">
								<div class="fna-product-obj">
									<h4>Objectives</h4>
									<div class="fna-product-obj-cont"></div>
								</div>
								<div>
									<h4>Key features</h4>
									<div class="fna-product-feature-cont">
										<a href="javascript:void(0);" class="fna-btn-feature-more"><span>Read More<i class="fa fa-caret-down"></i></span></a>
									</div>
									
								</div>
							</div>
						
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-product-col-obj pad-none">
								
								<div class="fna-product-link-details">
									<a href="javascript:void(0);" class="fna-btn-download">Product brochure <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/icon-download.png"></a>
									<a href="javascript:void(0);" class="fna-link-key-risk">Key product risks<i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-link-key-exclusions">Key exclusions<i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-btn-details">Product details<i class="fa fa-caret-right"></i></a>
								</div>

							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 visible-xs hidden-print">
								<div class="fna-product-cfa-mobile">
									<a href="javascript:void(0);" class="fna-btn-sel-product"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png">Appy Now</a>

									<a href="javascript:void(0);" class="fna-btn-call-details"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon02.png">Call For Details</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="fna-other-product">
				<span class="fna-product-type-name"></span><br>
				<p class="subject">This product type meets your FNA objective:</p>
				<p class="desc"></p>
				<p class="no-product-match">However, no products can be recommended since the results of your FNA do not meet the affordability requirement of our products.</p>

			</div>

			<div class="sort-header clearfix fna-product-lv-header">
				<div class="con_prd"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/tab_icon_contribution.png"> Contribution period</div>
				<div class="prd_age"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/tab_icon_benefit.png"> Benefit / protection period up to age</div>
				<div class="min_age">Min issue age <span>(year)</span></div>
				<div class="max_age">Max issue age <span>(year)</span></div>
			</div>

			<!-- <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/icon-tick.png" class="fna-ico-tick"> -->
			<i class="fa fa-check fna-ico-tick"></i>

			<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/product-result-type-icon.png" class="result-type-ico">
		</div>
		<div class="modal modal-vcenter fade bs-example-modal-lg fna-popup-keys" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						
						<div class="modal-body">
							<a class="close" aria-label="Close" data-dismiss="modal">
								<span aria-hidden="true" style="font-size:30px;">×</span>
							</a>
							<h4></h4>
							<div class="d-cont"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal modal-vcenter fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupEnquiry">
			<div class="container-fluid modal-dialog">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<div class="modal-body">
							
							<h4>Customer Services</h4>
							<div class="cont">
								<p>Please call our Customer Service Hotline <span>3123 3123</span> to find out more or leave your contact and let us call you back.</p>
								<input type="hidden" id="productCode">
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputCustomerName" class="field-label">Name</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input type="text" name="fullName" class="form-control full-control textUpper bmg_custom_placeholder" id="FNAinputCustomerName" value="" onkeypress="return alphaOnly(event);" maxlength="50">
										<span id="errFNAinputCustomerName" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputEmail" class="field-label">Email address</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input class="form-control full-control textLower" name="emailAddress" type="email" value="" id="FNAinputEmail" maxlength="50" onblur=""> <span id="errFNAinputEmail" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputMobileNo" class="field-label">Mobile Number</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input name="mobileNo" type="tel" class="form-control full-control" value="" id="FNAinputMobileNo" onkeypress="return isNumeric(event)" maxlength="8"> 
									<span id="errFNAinputMobileNo" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label">Preferred day</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="preferred_date" class="form-control soflow select-label" id="preferred_date">
												<option value="0" selected>Monday - Friday</option>
												<option value="1">Saturday – Sunday</option>
											</select>
										</div>
										<span id="errpreferred_date" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label">Perferred timeslot</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="preferred_time" class="form-control soflow select-label" id="preferred_time">
												<option value="0" selected>Morning (after 9am)</option>
												<option value="1">Afternoon</option>
												<option value="2">Evening (before 9pm)</option>
											</select>
										</div>
										<span id="errpreferred_time" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label">Enquiry Type</label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="enquiry_type" class="form-control soflow select-label" id="enquiry_type">
												<option value="0" selected>Product features</option>
												<option value="1">Application</option>
												<option value="2">Policy services</option>
												<option value="3">Not Specified</option>
											</select>
										</div>
										<span id="errenquiry_type" class="text-red"></span>
									</div>
								</div>
								
								<p class="remark">* This information will not be used as direct marketing.</p>
								<input type="button" onclick="" class="bdr-curve btn btn-primary fna-btn-submit" value="Submit">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--#End# Template for dynamic content-->
	</div>
</section>	
<!--   Main Content End -->
