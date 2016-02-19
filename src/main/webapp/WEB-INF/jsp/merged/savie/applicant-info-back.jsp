<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link rel="stylesheet" href="assets/css/savie/material.min.css" />
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="applicant-info-page">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
			
			<div id="savie-online">
				<!-- BREADCRUMBS -->
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
							 <p id="step-of">2 out of 6</p>
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
				 <!-- APPLICANT INFO BLOCK -->
				 <div id="so-application-info-section" class="headerStick">
                  <div class="container-fluid fwd-container">
                     <div id="personal-info" class="personal-info-widget page-application et-application-page">
                        <h4 class="so-h4">Applicant info / insured person Info</h4>
                        <form id="soInsuredInfoForm" method="post" class="form-horizontal" action="" onsubmit="return false">
                           <div class="row margin">
                              <div class="col-sm-12 col-md-6 left">
								<div class="clearfix form-group has-error">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="firstName" name="firstName" type="text" value="" autocomplete="off" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="firstName">Given Name</label>
									</div>
									<span class="error-msg" id="firstNameErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="lastName" name="lastName" type="text" value="" autocomplete="off" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="lastName">Last Name</label>
									</div>
									<span class="error-msg" id="lastNameErMsg"></span>
								</div>
                                 <div class="clearfix">
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
										<input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="chineseName" name="chineseName" type="text" value="" autocomplete="off" />
										<label class="mdl-textfield__label so-mdl-textfield-label" for="chineseName">Name in Chinese</label>
									</div>
									<span class="error-msg" id="chineseNameErMsg"></span>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="gender" id="gender">
                                             <option selected disabled value="">Gender</option>
                                             <option value="male">MALE</option>
                                             <option value="female">FEMALE</option>
                                          </select>
                                       </div>
									   <span class="error-msg" id="genderErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="hkId" name="hkId" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="hkId">HKID</label>
                                    </div>
									<span class="error-msg" id="hkidErMsg"></span>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="placeOfBirth" id="placeOfBirth">
                                             <option selected disabled value="">Place of birth</option>
                                             <option value="US">US</option>
                                             <option value="Hongkong">HONGKONG</option>	
                                          </select>
                                       </div>
									   <span class="error-msg" id="placeOfBirthErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="nationality" id="nationality">
                                             <option selected disabled value="">Nationality</option>
                                             <option value="US">US</option>
                                             <option value="Hongkong">HONGKONG</option>	
                                          </select>
                                       </div>
									   <span class="error-msg" id="nationalityErMsg"></span>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group dob-content">
                                    <div class="left-desktop text-box et-date-info">
										<div class="selectDiv">
											<span class="icon-chevron-thin-down orange-caret"></span>
											<input type="text" class="form-control gray-textbox" name="so-calendar-dob" id="so-calendar-dob" placeholder="Date of birth" readonly />
										</div>
										<span class="error-msg" id="so-calendar-dob-msg"></span>
                                    </div>
                                 </div>								 
                              </div>
                              <div class="col-sm-12 col-md-6 right">
								<div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <div class="clearfix form-group">
                                          <div class="residential-num">
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="residentialNo" name="residentialNo" type="text" maxlength="8" oninput="maxLengthCheck(this)" max="99999999" min ="1" />
											 <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialNo">Residential tel no. (eg. 1234-5678)</label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="resTelNoErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <div class="clearfix form-group">
                                          <div class="mobile-num">
                                             <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="mobileNo" name="mobileNo" type="text" maxlength="8" oninput="maxLengthCheck(this)" max="99999999" min ="1" />
											 <label class="mdl-textfield__label so-mdl-textfield-label" for="mobileNo">Mobile no. (eg. +85-1234-5678)</label>
                                          </div>
                                       </div>
                                    </div>
									<span class="error-msg" id="mobileNoErMsg"></span>
                                 </div>
                                 <div class="clearfix  form-group has-error">
                                    <div class="left-desktop text-box">
                                       <div class="selectDiv">
                                          <span class="icon-chevron-thin-down orange-caret"></span>
                                          <select class="form-control gray-dropdown" name="maritalStatus"  id="maritalStatus">
                                             <option selected disabled value="">Marital status</option>
                                             <option value="single">SINGLE</option>
                                             <option value="married">MARRIED</option>
                                          </select>
                                       </div>
									   <span class="error-msg" id="maritalStatErMsg"></span>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" id="emailAddress" name="emailAddress" type="email" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="emailAddress">Email address</label>
                                    </div>
									<span class="error-msg" id="emailErMsg"></span>
                                 </div>
                                 <div class="clearfix form-group has-error">
									<span class="warning-note">Permanent address (No P.O. Box address allowed)</span>
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="permanentAddress1" name="permanentAddress1" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress1">Line 1</label>
									</div>
									<span class="error-msg" id="permanentAddErMsg"></span>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential res-additional hidden" id="permanentAddress2" name="permanentAddress2" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress2">Line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield res-textfield-hidden">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential res-additional hidden" id="permanentAddress3" name="permanentAddress3" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="permanentAddress3">Line 3</label>
                                    </div>
                                 </div>
								 <div class="clearfix">
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="None" id="diffToPermanent" name="diffToPermanent" onclick="return correspondenceCheckbox();" />
                                                <label for="diffToPermanent"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span class="checkbox-text">My residential address is different to my permanent address</span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="clearfix form-group has-error hidden" id="diffToPermanentShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress1" name="residentialAddress1" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress1">Residential address line 1</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress2" name="residentialAddress2" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress2">Residential address line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="residentialAddress3" name="residentialAddress3" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="residentialAddress3">Residential address line 3</label>
                                    </div>
                                 </div>
								 <div class="clearfix">
                                    <div class="left-desktop check-box">
                                       <div class="checkbox-section">
                                          <div class="clearfix">
                                             <div class="pull-left left-checkbox">
                                                <input type="checkbox" value="None" id="diffToResidential" name="diffToResidential" onclick="return correspondenceCheckbox();" />
                                                <label for="diffToResidential"></label>
                                             </div>
                                             <div class="pull-left right-checkbox">
                                                <span class="checkbox-text">My correspondence address is different to my residential address</span>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
								 <div class="clearfix form-group has-error hidden" id="diffToResidentialShow">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress1" name="correspondenceAddress1" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress1">Correspondence address line 1</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress2" name="correspondenceAddress2" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress2">Correspondence address line 2</label>
									</div>
									<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
                                       <input class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input residential" id="correspondenceAddress3" name="correspondenceAddress3" type="text" />
									   <label class="mdl-textfield__label so-mdl-textfield-label" for="correspondenceAddress3">Correspondence address line 3</label>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="next-btn">
                              <button type="button" class="btn beneficiary-btn-back savie-common-btn">Back to application summary</button>
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
			var language = "en";
			
			$(document).ready(function() {
			    soFormValidation();
		    });
		</script>
	</body>
</html>