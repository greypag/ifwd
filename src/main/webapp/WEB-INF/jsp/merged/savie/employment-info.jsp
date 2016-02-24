<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/material.min.css" />
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps employment-info-page" id="unemployed-page">
			<!--BREADCRUMBS-->
			<div class="fwd-container container-fluid breadcrumbs">
	            <div class="breadcrumb-container">
	               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
						<li><a href="#">Home</a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#">Save </a></li>
						<li class="divider"><i class="fa fa-play"></i></li>
						<li><a href="#">Savie </a></li>
						<li class="divider last"><i class="fa fa-play"></i></i></li>
						<li class="active-bc" id="et-active-bc-menu">Application</li>
	               </ol>
	            </div>
	        </div>
	         <!-- STEPS -->
	        <div class="container-fluid fwd-full-container browse-holder">
	            <div class="application-page-header et-header-browse">
	               <div class="browse-container">
	                  <div class="row reset-margin hidden-xs hidden-sm">
	                     <ul class="common-steps-list six-steps nav nav-pills">
	                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; payment</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
	                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
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
	                        <h3 id="">Application &amp; payment</h3>
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
	        <div class="container-fluid fwd-full-container headerStick" id="unemployed-page-body">
	        	<div class="fwd-container-limit clearfix sidebar">
	  				<div id="unemployed-content">
	  					<div class="row">
	  						<form id="employmentInfoForm" action="" method="post" onsubmit="return false">
	  							<h3>Employment information &amp; education level </h3>
								
								<!-- Employed panel -->
								<div id="employed-panel">
									<div class="col-xs-12 col-md-6" id="left-side">
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Employment Status</label>
												<select name="employmentStatus" id="employmentStatus" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Employment Status</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${employmentStatusEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.employmentStatus == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${employmentStatusCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.employmentStatus == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="employmentStatusErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Nature of business</label>
												<select name="natureOfBusiness" id="businessNature" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Nature of business</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${natureOfBusinessEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.natureOfBusiness == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${natureOfBusinessCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.natureOfBusiness == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>				                     
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="businessNatureErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Occupation</label>
												<select name="occupation" id="occupation" class="form-control gray-dropdown occupation">
												   <option value="" disabled="disabled" selected="selected">Occupation</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${occupationEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.occupation == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${occupationCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.occupation == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>	
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="occupationErMsg"></span>
										</div>
										<!--<input type="text" name="other-occupation" id="other-occupation" class="gray-textbox hidden" placeholder="Please specify" />-->
										<div class="form-group hidden">
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" id="other-occupation" name="otherOccupation" />
												<label class="mdl-textfield__label so-mdl-textfield-label" for="other-occupation">Please specify</label> 
											</div>
											<span class="error-msg" id="otherOccupationErMsg"></span>
										</div>
									</div>
									<div class="col-xs-12 col-md-6" id="right-side">
										<div class="form-group">
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" id="currentEmployer" name="employerName" value="${lifeEmploymentInfo.employerName }" />
												<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Current employer's name</label> 
											</div>
											<span class="error-msg" id="currentEmployerErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Monthly personal income (HK$)</label>
												<select name="monthlyPersonalIncome" id="monthlyPersonalIncome" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Monthly personal income (HK$)</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${monthlyPersonalIncomeEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${monthlyPersonalIncomeCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.monthlyPersonalIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>	
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="monthlyPersonalIncomeErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Education level</label>
												<select name="education" id="educationLevel" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Education level</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${etEducationLevelEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.education == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${etEducationLevelCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.education == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>	
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="educationLevelErMsg"></span>
										</div>
									</div>
								</div>
								
								<!-- Unemployed panel -->
								<div id="unemployed-panel" class="hidden">
									<div class="col-xs-12 col-md-6" id="left-side">
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Employment Status</label>
												<select name="employmentStatus2" id="employmentStatus2" class="form-control gray-dropdown">
												   <option value="" disabled="disabled">Employment Status</option>
												   <option value="Self Employed">Self Employed</option>
												   <option value="Unemployed">Unemployed</option>
												   <option value="Housewife">Housewife</option>
												   <option value="Student">Student</option>
												   <option value="Retired">Retired</option>
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="employmentStatusErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Amount of other source of income</label>
												<select name="amountOfOtherSourceOfIncome" id="otherIncomeAmount" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Amount of other source of income</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${etAmountOtherSourceEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${etAmountOtherSourceCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfOtherSourceOfIncome == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>	
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="otherIncomeAmountErMsg"></span>
										</div>
									</div>
									<div class="col-xs-12 col-md-6" id="right-side">
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Education level</label>
												<select name="educationLevel2" id="educationLevel2" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Education level</option>
												   <option value="1">Bachelor</option>
												   <option value="2">Doctorate</option>
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="educationLevel2ErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<label class="mdl-textfield__label cstm-dropdown-label">Amount of liquid assets (HK$)</label>
												<select name="amountOfLiquidAssets" id="liquidAssetsAmount" class="form-control gray-dropdown">
												   <option value="" disabled selected>Amount of liquid assets (HK$)</option>
												   <c:if test="${language == 'en'}">
														<c:forEach var="list" items="${etLiquidAssetEN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>
													<c:if test="${language == 'tc'}">
														<c:forEach var="list" items="${etLiquidAssetCN}">
															<option value="${list.itemCode }-${list.itemDesc }" <c:if test="${lifeEmploymentInfo.amountOfLiquidAssets == list.itemCode}">selected="selected"</c:if>>${list.itemDesc }</option>
														</c:forEach>
													</c:if>	
												</select>
												<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="liquidAssetsAmountErMsg"></span>
										</div>
									</div>
								</div>
	  							<div class="col-xs-12 text-center">
	  								<button type="submit" class="btn savie-common-btn" id="next-btn">Next</button><br />
	  								<button type="button" class="btn savie-common-btn hidden" id="back-summary-btn">Back to application summary</button>
									<a href="#" id="save-cont-link">Save and continue later</a>
								</div>	
	  						</form>
	  					</div>
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
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You may save your application progress up to (previous page). You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6">Keep going</button>
					<button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6">Save and exit</button>
				</div>
			</div>
		  </div>
		</div>
		
		<!-- Save and continue batch 5 modal -->
		<div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
		  <div class="modal-dialog">
			<div class="modal-content save-con-modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
				<h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
				<p class="text-center description-msg">You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
				<div class="save-con-btns clearfix">
					<center><button class="btn savie-common-btn" id="keep-going-btn">Keep going</button><button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn">Save and exit</button></center>
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
						<p class="text-center">Your application has been saved. </p>
				 </div>
				 <div class="modal-body" id="moda-body-appsave">
					<p class="text-center">A saved application email has been sent to you, you may continue the application through 
					the application link embedded in the email or you may retrieve your progress from your eService 
					purchase history. </p>
					<div class="btn-appsave">
						<button href="#" class="center-block btn savie-common-btn" id="btn-app-save">Back to home</button>
					</div>
				 </div>
			 </div>
		  </div>
		</div>
		
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			$(document).ready(function () {
				
				var dummy = true;
				// dummy condition for displaying the back / next button
				if(dummy) {
					// hide the back button and display the Next button
					$('#next-btn, #save-cont-link').removeClass('hidden');
					$('#back-summary-btn').addClass('hidden');
				} else {
					// display the back button and hide the Next button
					$('#next-btn, #save-cont-link').addClass('hidden');
					$('#back-summary-btn').removeClass('hidden');
				}
				
				// application saved modal will show after clicking 'Save and exit' button 
				$('.save-exit-btn2, #save-exit-btn').click(function() {
					$(this).closest('.modal').modal('hide');
					$('#application-saved-modal').modal('show');
				});
				
				// Form validation
				$('#employmentInfoForm').bootstrapValidator({
					excluded: [':disabled', ':hidden', ':not(:visible)'],
					fields: {
						employmentStatus: {
						   container: '#employmentStatusErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select your employment status."
							  }
						   }
						},
						businessNature: {
						   container: '#businessNatureErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select the nature of business."
							  }
						   }
						},
						occupation: {
						   container: '#occupationErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select your occupation."
							  }
						   }
						},
						otherOccupation: {
						   container: '#otherOccupationErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please input your occupation."
							  }
						   }
						},
						currentEmployer: {
						   container: '#currentEmployerErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please input employer's name."
							  }
						   }
						},
						monthlyPersonalIncome: {
						   container: '#monthlyPersonalIncomeErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select monthly personal income."
							  }
						   }
						},
						educationLevel: {
						   container: '#educationLevelErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select your education level."
							  }
						   }
						},
						otherIncomeAmount: {
						   container: '#otherIncomeAmountErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select amount of other source of income."
							  }
						   }
						},
						educationLevel2: {
						   container: '#educationLevel2ErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select your education level."
							  }
						   }
						},
						liquidAssetsAmount: {
						   container: '#liquidAssetsAmountErMsg',
						   validators: {
							  notEmpty: {
								 message: "Please select amount of liquid assets."
							  }
						   }
						}
					}
				}).on('success.form.bv', function(e) {
					e.preventDefault();
				}).on('error.form.bv', function(e) {
				});
				
				$('#save-cont-link').on('click', function (e) {
                    if($('#employmentInfoForm').data('bootstrapValidator').isValid()) {
						$('#save-and-continue-batch5-modal').modal('show');
                    } else {
						$('#save-and-continue-modal').modal('show');
                    }
                });
				
				$('.occupation').on('change', function () {
					if($(this).val() == 'other') {
						$('#other-occupation').parent().parent().removeClass('hidden');
					} else {
						$('#other-occupation').parent().parent().addClass('hidden');
					}
				});
				
				var tmpEmploymentStatus;
				$('#employmentStatus').on('change', function() {
					if($(this).val() == 'Self Employed') {
						$('#employed-panel').removeClass('hidden');
						$('#unemployed-panel').addClass('hidden');
					} else {						
						tmpEmploymentStatus = $(this).val();
						$('#employed-panel').addClass('hidden');
						$('#unemployed-panel').removeClass('hidden');
						$('#employmentStatus2').val(tmpEmploymentStatus);
						$('#employmentStatus2').parent('.selectDiv').addClass('is-not-active');
					}
				});
				
				$('#employmentStatus2').on('change', function() {
					if($(this).val() == 'Self Employed') {
						tmpEmploymentStatus = $(this).val();
						$('#employed-panel').removeClass('hidden');
						$('#unemployed-panel').addClass('hidden');
						$('#employmentStatus').val(tmpEmploymentStatus);
						$('#employmentStatus').parent('.selectDiv').addClass('is-not-active');
					} else {
						$('#employed-panel').addClass('hidden');
						$('#unemployed-panel').removeClass('hidden');
					}
				});
			});
			
			$("#next-btn").click(function(){
				$("#errorMsg").html("");
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savie-online/lifeEmploymentInfo",
					  data: $("#employmentInfoForm").serialize(),
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $("#errorMsg").html(data.errorMsg);
						  }
						  else{
							  if('${backSummary}'=="Y"){
								  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow2}';
							  }
							  else{
								  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
							  }
						  }
					  }
			     });
			});
			
			$("#save-exit-btn").click(function(){
				$("#errorMsg").html("");
				$.ajax({
					  type : "POST",
					  async:false, 
					  url : "<%=request.getContextPath()%>/ajax/savie-online/lifeEmploymentInfoSaveforLater",
					  data: $("#employmentInfoForm").serialize(),
					  success : function(data) {
						  if(data != null && data.errorMsg != null && data.errorMsg != ""){
							  $("#errorMsg").html(data.errorMsg);
						  }
						  else{
							  window.location = '<%=request.getContextPath()%>/${language}/savie-online/${nextPageFlow}';
						  }
					  }
			     });
			});
		</script>
	</body>
</html>	
