<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="assets/css/material.min.css"/>
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps employment-info-page" id="unemployed-page">
			<%@include file="includes/header-block.jsp" %>
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
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; payment</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
	                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
	                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
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
	  						<form id="employmentInfoForm" action="" method="post">
	  							<h3>Employment information &amp; education level </h3>
								
								<!-- Employed panel -->
								<div id="employed-panel">
									<div class="col-xs-12 col-md-6" id="left-side">
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="employmentStatus" id="employmentStatus" class="form-control gray-dropdown">
												   <option value="" disabled selected>Employment Status</option>
												   <option value="Self Employed">Self Employed</option>
												   <option value="Unemployed">Unemployed</option>
												   <option value="Housewife">Housewife</option>
												   <option value="Student">Student</option>
												   <option value="Retired">Retired</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="employmentStatusErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="businessNature" id="businessNature" class="form-control gray-dropdown">
												   <option value="" disabled selected>Nature of business</option>
												   <option value="1">Production</option>
												   <option value="2">Community Education</option>				                     
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="businessNatureErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="occupation" id="occupation" class="form-control gray-dropdown occupation">
												   <option value="" disabled selected>Occupation</option>
												   <option value="1">Teacher</option>
												   <option value="2">Fireman</option>
												   <option value="3">Policeman</option>
												   <option value="other">Other</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="occupationErMsg"></span>
										</div>
										<!--<input type="text" name="other-occupation" id="other-occupation" class="gray-textbox hidden" placeholder="Please specify" />-->
										<div class="form-group hidden">
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input "  type="text" id="other-occupation" name="otherOccupation" />
												<label class="mdl-textfield__label so-mdl-textfield-label" for="other-occupation">Please specify</label> 
											</div>
											<span class="error-msg" id="otherOccupationErMsg"></span>
										</div>
									</div>
									<div class="col-xs-12 col-md-6" id="right-side">
										<div class="form-group">
											<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="current-employer">
												<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input"  type="text" id="currentEmployer" name="currentEmployer" />
												<label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Current employer's name</label> 
											</div>
											<span class="error-msg" id="currentEmployerErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="monthlyPersonalIncome" id="monthlyPersonalIncome" class="form-control gray-dropdown">
												   <option value="" disabled selected>Monthly personal income (HK$)</option>
												   <option value="1">HK$10000</option>
												   <option value="2">HK$20000</option>
												   <option value="3">HK$30000</option>
												   <option value="4">HK$40000</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="monthlyPersonalIncomeErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="educationLevel" id="educationLevel" class="form-control gray-dropdown">
												   <option value="" disabled selected>Education level</option>
												   <option value="1">Vocational</option>
												   <option value="2">Bachelor</option>
												   <option value="3">Doctorate</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
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
												<select name="employmentStatus2" id="employmentStatus2" class="form-control gray-dropdown">
												   <option value="" disabled>Employment Status</option>
												   <option value="Self Employed">Self Employed</option>
												   <option value="Unemployed">Unemployed</option>
												   <option value="Housewife">Housewife</option>
												   <option value="Student">Student</option>
												   <option value="Retired">Retired</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="employmentStatusErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="otherIncomeAmount" id="otherIncomeAmount" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Amount of other source of income</option>
												   <option value="1">HK$10000</option>
												   <option value="2">HK$20000</option>
												   <option value="3">HK$30000</option>
												   <option value="4">HK$40000</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="otherIncomeAmountErMsg"></span>
										</div>
									</div>
									<div class="col-xs-12 col-md-6" id="right-side">
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="educationLevel2" id="educationLevel2" class="form-control gray-dropdown">
												   <option value="" disabled="disabled" selected="selected">Education level</option>
												   <option value="1">Bachelor</option>
												   <option value="2">Doctorate</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="educationLevel2ErMsg"></span>
										</div>
										<div class="form-group">
											<div class="selectDiv centreDiv gray-text-bg">
												<select name="liquidAssetsAmount" id="liquidAssetsAmount" class="form-control gray-dropdown">
												   <option value="" disabled selected>Amount of liquid assets (HK$)</option>
												   <option value="1">HK$10000</option>
												   <option value="2">HK$20000</option>
												   <option value="3">HK$30000</option>
												   <option value="4">HK$40000</option>
												</select>
												<img src="assets/images/orange-caret.png" class="orange-caret-bg">
											</div>
											<span class="error-msg" id="liquidAssetsAmountErMsg"></span>
										</div>
									</div>
								</div>
								
	  							<div class="col-xs-12 text-center">
	  								<button class="btn savie-common-btn" id="back-summary-btn">Back to application summary</button> <!-- This button to be displayed when its not the first time for the user to fill in this form -->
	  							</div>	
	  						</form>
	  					</div>
	  				</div>		        	
		        </div>	
	        </div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			$(document).ready(function () {
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
					}
				});
				
				$('#employmentStatus2').on('change', function() {
					if($(this).val() == 'Self Employed') {
						tmpEmploymentStatus = $(this).val();
						$('#employed-panel').removeClass('hidden');
						$('#unemployed-panel').addClass('hidden');
						$('#employmentStatus').val(tmpEmploymentStatus);
					} else {
						$('#employed-panel').addClass('hidden');
						$('#unemployed-panel').removeClass('hidden');
					}
				});
			});
		</script>
	</body>
</html>	
