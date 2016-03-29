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

function goLandingPage(){
	window.location = '<%=request.getContextPath()%>/${language}/savings-insurance';
}

var fnaq1 = '${savieFna.q1 }';
var fnaq2 = '${savieFna.q2 }';
var fnaq4e = '${savieFna.q4_e }';
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
						<li><a href="#"><fmt:message key="breadcrumb.home" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="breadcrumb.savie.category" bundle="${msg}" /></a></li>
						<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="breadcrumb.production.recommendation" bundle="${msg}" /></li>
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
									
									<a href="javascript:void(0);" class="fna-btn-analyse btn btn-primary btn-lg"><fmt:message key="fna.button.saveagain" bundle="${msg}" /> <i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-btn-cancel btn btn-primary btn-lg"><fmt:message key="button.cancel" bundle="${msg}" /></a>
								</div>
							</div>
							<h4 class="fna-sel-title"><fmt:message key="fna.label.fna.selection" bundle="${msg}" />
								<div class="hidden-lg hidden-md">
									<a href="javascript:void(0);" class="fna-btn-mob-close"><i class="fa fa-times"></i></a>
								</div>
							</h4>
							<div class="fna-sel-grid q1">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_01.png"><fmt:message key="fna.label.objectives" bundle="${msg}" /><a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="checkbox-gp">
									<div class="checkbox">
										<input type="checkbox" id="q1_c1" name="q1" value="0" disabled>
										<label for="q1_c1"><fmt:message key="fna.question.q1.option1" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c2" name="q1" value="1" disabled>
										<label for="q1_c2"><fmt:message key="fna.question.q1.option2" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c3" name="q1" value="2" disabled>
										<label for="q1_c3"><fmt:message key="fna.question.q1.option3" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c4" name="q1" value="3" disabled>
										<label for="q1_c4"><fmt:message key="fna.question.q1.option4" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q1_c5" name="q1" value="4" disabled>
										<label for="q1_c5"><fmt:message key="fna.question.q1.option5" bundle="${msg}" /></label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q2">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_02.png"><fmt:message key="fna.label.insurance.products" bundle="${msg}" /><a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>

								<div class="checkbox-gp">
									<div class="checkbox">
										<input type="checkbox" id="q2_c1" name="q2" value="0" disabled>
										<label for="q2_c1"><fmt:message key="fna.question.q2.option1" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option1remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option1example" bundle="${msg}" /></span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c2" name="q2" value="1" disabled>
										<label for="q2_c2"><fmt:message key="fna.question.q2.option2" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option2remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option2example" bundle="${msg}" /></span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c3" name="q2" value="2" disabled>
										<label for="q2_c3"><fmt:message key="fna.question.q2.option3" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option3remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option3example" bundle="${msg}" /></span></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q2_c4" name="q2" value="3" disabled>
										<label for="q2_c4"><fmt:message key="fna.question.q2.option4" bundle="${msg}" /><br><span>-<fmt:message key="fna.question.q2.option4remark" bundle="${msg}" /><br><fmt:message key="fna.question.q2.option4example" bundle="${msg}" /></span></label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q3">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_03.png"><fmt:message key="fna.label.benefit" bundle="${msg}" /><a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="radio-gp">
									<div class="checkbox">
										<input type="checkbox" id="q3_c1" name="q3" value="0" disabled>
										<label for="q3_c1"><fmt:message key="fna.question.q3.option1" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c2" name="q3" value="1" disabled>
										<label for="q3_c2"><fmt:message key="fna.question.q3.option2" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c3" name="q3" value="2" disabled>
										<label for="q3_c3"><fmt:message key="fna.question.q3.option3" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c4" name="q3" value="3" disabled>
										<label for="q3_c4"><fmt:message key="fna.question.q3.option4" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c5" name="q3" value="4" disabled>
										<label for="q3_c5"><fmt:message key="fna.question.q3.option5" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q3_c6" name="q3" value="5" disabled>
										<label for="q3_c6"><fmt:message key="fna.question.q3.option6" bundle="${msg}" /></label>
									</div>
								</div>
							</div>
							<div class="fna-sel-grid q4_e">
								<h5 class="clearfix"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/selection_icon_04.png"><fmt:message key="fna.label.contributionperiod" bundle="${msg}" /><a href="javascript:void(0);" class="glyphicon glyphicon-plus btn-plus fna-btn-sel-expand"></a> </h5>
								<div class="radio-gp">
									<div class="checkbox">
										<input type="checkbox" id="q4e_c1" name="q4e" value="0" disabled>
										<label for="q4e_c1"><fmt:message key="fna.question.q4e.option1" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c2" name="q4e" value="1" disabled>
										<label for="q4e_c2"><fmt:message key="fna.question.q4e.option2" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c3" name="q4e" value="2" disabled>
										<label for="q4e_c3"><fmt:message key="fna.question.q4e.option3" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c4" name="q4e" value="3" disabled>
										<label for="q4e_c4"><fmt:message key="fna.question.q4e.option4" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c5" name="q4e" value="4" disabled>
										<label for="q4e_c5"><fmt:message key="fna.question.q4e.option5" bundle="${msg}" /></label>
									</div>
									<div class="checkbox">
										<input type="checkbox" id="q4e_c6" name="q4e" value="5" disabled>
										<label for="q4e_c6"><fmt:message key="fna.question.q4e.option6" bundle="${msg}" /></label>
									</div>
								</div>
							</div>

						</div>
						<div class="floating-marker"></div>
						<div class="fna-btn-gp hidden-lg hidden-md row">
							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-mob-cancel"><fmt:message key="button.cancel" bundle="${msg}" /></a>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-mob-analyse"><fmt:message key="fna.button.analyse" bundle="${msg}" /><i class="fa fa-caret-right"></i></a>
							</div>					
						</div>
						
						<!-- <div class="row hidden-sm hidden-xs">
							<div class="col-lg-12 col-md-12 col-sm-6 col-xs-6">
								<a href="javascript:void(0);" class="fna-btn-analyse"><fmt:message key="fna.button.analyse" bundle="${msg}" /><i class="fa fa-caret-right"></i></a>
								
							</div>
						</div> -->
					</div>
					<div  class="col-lg-9 col-sm-12 col-md-9 col-xs-12 fna-col-recommend">
						<div class="amended-overlayer hidden-sm hidden-xs"></div>
						<div class="fna-txt-result hidden-print">
							<div class="row">
								<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
									<p class="head"><span class="txt_fna_name">${userDetails.fullName }</span>,</p>

									<div class="haveProducts">
										<p class="head"><fmt:message key="fna.label.headline.part1" bundle="${msg}" /><span class="txt_products"> <span class="txt_pnum"></span> <fmt:message key="fna.label.headline.part2" bundle="${msg}" /></span> <fmt:message key="fna.label.headline.part3" bundle="${msg}" /></p>
										
										<p class="onlyOneProduct"></p>
										<p class="hasManyProduct"><fmt:message key="fna.label.result.description" bundle="${msg}" /></p>
										
									</div>
									<div class="noProducts">
										<p><fmt:message key="fna.label.noproduct" bundle="${msg}" /></p>
									</div>
									<div class="onlyIlas">
										<p><fmt:message key="fna.label.onlyIlas" bundle="${msg}" /></p>
									</div>
									<a href="<%=request.getContextPath()%>/${language}/FNA/review" class="fna-btn-review"><fmt:message key="fna.button.back2review" bundle="${msg}" />&nbsp;<i class="fa fa-caret-right"></i></a>
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
									<div class="col-lg-12 col-md-12 col-sm-4 col-xs-12 hidden-lg hidden-md pad-none"> 
										<a href="javascript:void(0)" class="fna-btn-filter"><fmt:message key="fna.label.fna.selection" bundle="${msg}" /></a>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-8 col-xs-12 pad-none fna-sorting"> 
										<span class="sort-txt"><fmt:message key="fna.label.productsort" bundle="${msg}" /></span>
										<div class="styled-select text-right">
											
											<select name="fnaMobSort" class="form-control soflow select-label" id="fnaMobSort">
												<option value="0" selected><fmt:message key="fna.option.productsort.option1" bundle="${msg}" /></option>
												<option value="4"><fmt:message key="fna.option.productsort.option2" bundle="${msg}" /></option>
												<option value="1"><fmt:message key="fna.option.productsort.option3" bundle="${msg}" /></option>
												<option value="5"><fmt:message key="fna.option.productsort.option4" bundle="${msg}" /></option>
												<option value="2"><fmt:message key="fna.option.productsort.option5" bundle="${msg}" /></option>
												<option value="6"><fmt:message key="fna.option.productsort.option6" bundle="${msg}" /></option>
												<option value="3"><fmt:message key="fna.option.productsort.option7" bundle="${msg}" /></option>
												<option value="7"><fmt:message key="fna.option.productsort.option8" bundle="${msg}" /></option>
											</select>
											
											<i class="fa fa-caret-down"></i>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="fna-product-gp-wrapper"></div>


						
						<a href="javascript:void(0);" class="fna-btn-load-products-more hidden-print"><span><fmt:message key="fna.link.moreproduct" bundle="${msg}" /> <i class="fa fa-caret-down"></i></span></a>

						<div class="noAvailableProduct noAvailableProduct_type1"></div>
						<div class="noAvailableProduct noAvailableProduct_type2"></div>
						<div class="only1KSTSProduct"></div>

						<div class="text-right">
							<a href="javascript:void(0);" class="fna-btn-clear"><fmt:message key="fna.link.clearandleave" bundle="${msg}" /> <i class="fa fa-caret-right"></i></a>
						</div>
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
						<span class="fna-tooltips fna-product-type-tooltips show-inline-md" data-placement="bottom" data-original-title="***">i</span>
					</div>
					<div class="fna-product-cfa hidden-print">
						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}?type=2" class="fna-btn-sel-product KSTS"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.applynow" bundle="${msg}" /></a>
						<a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp" class="fna-btn-sel-product KSTR"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.makeappointment" bundle="${msg}" /></a>
						<a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="fna-btn-sel-product UTLS"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.applynow" bundle="${msg}" /></a>
						<a href="javascript:void(0);" class="fna-btn-call-details"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon02.png"><fmt:message key="fna.button.callfordetails" bundle="${msg}" /></a>
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
								<span class="fna-txt-show"><fmt:message key="fna.link.showdetails" bundle="${msg}" /> <i class="fa fa-caret-down"></i></span>
								<span class="fna-txt-hide"><fmt:message key="fna.link.hidedetails" bundle="${msg}" /> <i class="fa fa-caret-up"></i></span>
							</a>
						</div>
					</div>
					<div class="expander">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-product-col-feature">
								<div class="fna-product-obj">
									<h4><fmt:message key="fna.label.objectives" bundle="${msg}" /></h4>
									<div class="fna-product-obj-cont"></div>
								</div>
								<div>
									<h4><fmt:message key="fna.label.keyfeatures" bundle="${msg}" /></h4>
									<div class="fna-product-feature-cont">
										<a href="javascript:void(0);" class="fna-btn-feature-more"><span><fmt:message key="fna.label.readmore" bundle="${msg}" /><i class="fa fa-caret-down"></i></span></a>
									</div>
									
								</div>
							</div>
						
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fna-product-col-obj pad-none">
								
								<div class="fna-product-link-details">
									<a href="javascript:void(0);" class="fna-btn-download" target="_blank"><fmt:message key="fna.link.download.prochure" bundle="${msg}" /> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/icon-download.png"></a>
									<a href="javascript:void(0);" class="fna-link-key-risk"><fmt:message key="fna.link.keyrisk" bundle="${msg}" /><i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-link-key-exclusions"><fmt:message key="fna.link.keyexclusion" bundle="${msg}" /><i class="fa fa-caret-right"></i></a>
									<a href="javascript:void(0);" class="fna-btn-details" target="_blank"><fmt:message key="fna.link.prodict.details" bundle="${msg}" /><i class="fa fa-caret-right"></i></a>
								</div>

							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 visible-xs hidden-print">
								<div class="fna-product-cfa-mobile">
									<a href="<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}?type=2" class="fna-btn-sel-product KSTS"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.applynow" bundle="${msg}" /></a>
									<a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp" class="fna-btn-sel-product KSTR"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.makeappointment" bundle="${msg}" /></a>
									<a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="fna-btn-sel-product UTLS"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon01.png"><fmt:message key="fna.button.applynow" bundle="${msg}" /></a>
									<a href="javascript:void(0);" class="fna-btn-call-details"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/iFWD_icon02.png"><fmt:message key="fna.button.callfordetails" bundle="${msg}" /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="fna-other-product-header">
				<p class="no-product-match"><fmt:message key="fna.text.product.otherstype.description" bundle="${msg}" /></p>
			</div>

			<div class="fna-other-product">
				<span class="fna-product-type-name"></span><br>
				<p class="desc"></p>

			</div>

			<div class="sort-header clearfix fna-product-lv-header">
				<div class="con_prd"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/tab_icon_contribution.png"> <fmt:message key="fna.label.contributionperiod" bundle="${msg}" /></div>
				<div class="prd_age"> <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/tab_icon_benefit.png"> <fmt:message key="fna.label.benefit" bundle="${msg}" /></div>
				<div class="min_age"><fmt:message key="fna.label.minage" bundle="${msg}" /></div>
				<div class="max_age"><fmt:message key="fna.label.maxage" bundle="${msg}" /></div>
			</div>

			<!-- <img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/icon-tick.png" class="fna-ico-tick"> -->
			<i class="fa fa-check fna-ico-tick"></i>

			<img src="<%=request.getContextPath()%>/resources/images/onlinesavieFNA/product-result-type-icon.png" class="result-type-ico">

			<p class="txt_onlyOneProduct"><fmt:message key="fna.text.only1product" bundle="${msg}" /></p>

			<p class="txt_noAvailableProduct_type1"><fmt:message key="fna.text.noavailableproduct.type1" bundle="${msg}" /></p>
			<p class="txt_noAvailableProduct_type2"><fmt:message key="fna.text.noavailableproduct.type2" bundle="${msg}" /></p>
			<p class="txt_q2_0"><fmt:message key="fna.text.q2.array0" bundle="${msg}" /></p>
			<p class="txt_q2_1"><fmt:message key="fna.text.q2.array1" bundle="${msg}" /></p>
			<p class="txt_q2_2"><fmt:message key="fna.text.q2.array2" bundle="${msg}" /></p>
			<p class="txt_q2_3"><fmt:message key="fna.text.q2.array3" bundle="${msg}" /></p>
			
			<p class="txt_q4e_0"><fmt:message key="fna.question.q4e.option1" bundle="${msg}" /></p>
			<p class="txt_q4e_1"><fmt:message key="fna.question.q4e.option2" bundle="${msg}" /></p>
			<p class="txt_q4e_2"><fmt:message key="fna.question.q4e.option3" bundle="${msg}" /></p>
			<p class="txt_q4e_3"><fmt:message key="fna.question.q4e.option4" bundle="${msg}" /></p>
			<p class="txt_q4e_4"><fmt:message key="fna.question.q4e.option5" bundle="${msg}" /></p>
			<p class="txt_q4e_5"><fmt:message key="fna.question.q4e.option6" bundle="${msg}" /></p>

			<p class="txt_obj_0"><fmt:message key="fna.text.objectives.array0" bundle="${msg}" /></p>
			<p class="txt_obj_1"><fmt:message key="fna.text.objectives.array1" bundle="${msg}" /></p>
			<p class="txt_obj_2"><fmt:message key="fna.text.objectives.array2" bundle="${msg}" /></p>
			<p class="txt_obj_3"><fmt:message key="fna.text.objectives.array3" bundle="${msg}" /></p>
			<p class="txt_obj_4"><fmt:message key="fna.text.objectives.array4" bundle="${msg}" /></p>

			<p class="txt_sep"><fmt:message key="fna.text.separater" bundle="${msg}" /></p>

			<p class="txt_ilas"><fmt:message key="fna.text.ilas.desc" bundle="${msg}" /></p>
			<div class="txt_ilas_obj" style="display:none;">
				<div class="fna-product-obj">
					<h4 style="font-size: 16px; font-weight: bold; margin-bottom: 5px;"><fmt:message key="fna.label.objectives" bundle="${msg}" /></h4>
					<div class="fna-product-obj-cont">
						<ul style="padding:0;">
							<li style="position: relative; list-style: none;">
								<i class="fa fa-check" style="margin-right: 5px;"></i>
								<fmt:message key="fna.text.ilas.objective1" bundle="${msg}" />
							</li>
							<li style="position: relative; list-style: none;">
								<i class="fa fa-check" style="margin-right: 5px;"></i>
								<fmt:message key="fna.text.ilas.objective2" bundle="${msg}" />
							</li>
						</ul>
					</div>
				</div>
			</div>

			<p class="txt_ilas_only1"><fmt:message key="fna.text.ilas.desc.only1" bundle="${msg}" /></p>
			<p class="txt_ksts_only1"><fmt:message key="fna.text.noavailableproduct.1year" bundle="${msg}" /></p>

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
	    <div class="modal modal-vcenter fade bs-example-modal-lg fna-popup-clear" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="fnaPopupClear">
			<div class="modal-dialog modal-lg">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						
						<div class="modal-body">
							<a class="close" aria-label="Close" data-dismiss="modal">
								<span aria-hidden="true" style="font-size:30px;">×</span>
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
			<div class="container-fluid modal-dialog">
				<div class="modal-content plan-modal">
					<div class="fna-popup-cont">
						<a class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" style="font-size:30px;">×</span>
						</a>
						<div class="modal-body">
							
							<h4><fmt:message key="label.customer.service" bundle="${msg}" /></h4>
							<div class="cont">
								<p><fmt:message key="popup.callus.info.please.call.part1" bundle="${msg}" /></p>
								<input type="hidden" id="productCode" value="SAVIE-SP"><input type="hidden" id="channel" value="SAVIE">
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputCustomerName" class="field-label"><fmt:message key="label.name" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input type="text" autocomplete="off" name="fullName" class="form-control full-control textUpper bmg_custom_placeholder" id="FNAinputCustomerName" value="" onkeypress="return alphaOnly(event);" maxlength="50">
										<span id="errFNAinputCustomerName" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputEmail" class="field-label"><fmt:message key="label.email" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input class="form-control full-control textLower" name="emailAddress" type="email" value="" id="FNAinputEmail" maxlength="50" onblue=""> <span id="errFNAinputEmail" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label for="FNAinputMobileNo" class="field-label"><fmt:message key="label.mobile" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<input name="mobileNo" type="tel" class="form-control full-control" value="" id="FNAinputMobileNo" onkeypress="return isNumeric(event)" maxlength="8"> 
									<span id="errFNAinputMobileNo" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label"><fmt:message key="label.preferred.day" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="preferred_date" class="form-control soflow select-label" id="preferred_date">
												<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etCsContactPreferredDayEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etCsContactPreferredDayCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>
										</div>
										<span id="errpreferred_date" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label"><fmt:message key="label.preferred.timeslot" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="preferred_time" class="form-control soflow select-label" id="preferred_time">
												<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etCsContactPreferredTimeSlotEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etCsContactPreferredTimeSlotCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>
										</div>
										<span id="errpreferred_time" class="text-red"></span>
									</div>
								</div>
								<div class="form-group float">
									<div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
										<label class="field-label"><fmt:message key="label.enquire.type" bundle="${msg}" /></label>
									</div>
									<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
										<div class="styled-select">
											<select name="enquiry_type" class="form-control soflow select-label" id="enquiry_type">
												<c:if test="${language == 'en'}">
													<c:forEach var="list" items="${etEnquiryTypeEN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
												<c:if test="${language == 'tc'}">
													<c:forEach var="list" items="${etEnquiryTypeCN}">
														<enhance:out escapeXml="false">
														    <option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
														</enhance:out>
													</c:forEach>
												</c:if>
											</select>
										</div>
										<span id="errenquiry_type" class="text-red"></span>
									</div>
								</div>
								
								<p class="remark"><fmt:message key="popup.callus.info.not.direct.marketing" bundle="${msg}" /></p>
								<input type="button" class="bdr-curve btn btn-primary fna-btn-submit" value="<fmt:message key="button.submit" bundle="${msg}" />">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- back landing modal -->
		<div class="modal fade common-welcome-modal modal-app-save" id="back-landing-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog" id="modal-save-app">
			<div class="modal-content modal-content-appsave common-welcome-modal">	
				 <div class="modal-header" id="modal-header-appsave">
				 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p class="text-center"><fmt:message key="label.saved.application.title" bundle="${msg}" /></p>
				 </div>
				 <div class="modal-body" id="moda-body-appsave">
					<p class="text-center"><fmt:message key="label.saved.application.copy" bundle="${msg}" /></p>
					<div class="btn-appsave">
						<button href="#" class="center-block btn savie-common-btn" id="btn-back" onclick="goLandingPage()"><fmt:message key="button.backtohome" bundle="${msg}" /></button>
					</div>
				 </div>
			 </div>
		  </div>
		</div>

		<!--#End# Template for dynamic content-->
	</div>
</section>	
<!--   Main Content End -->
