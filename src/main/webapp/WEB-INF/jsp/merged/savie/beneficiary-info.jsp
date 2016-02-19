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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="beneficiary-name-others-page">
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
				<!-- BENEFICIARY INFO BLOCK -->
				<div id="so-beneficiary-info-section" class="headerStick">
					<div class="container-fluid fwd-full-container" id="container-beneficiary">
						<div id="fwd-container-beneficiary" class="fwd-container-limit clearfix sidebar personal-info-widget page-application et-application-page">
							<h4 class="so-h4">Beneficiary info</h4>
							<form id="beneficiary-info-form[0]" class="beneficiary-form-content" method="post" action="">
								<div class="radio-group clearfix">
								   <div class="radio-button-group">
									  <div class="clearfix desktop-align left">
										 <div class="pull-left radio-holder">
											<input type="radio" id="own-estate-id" name="beneficiary-info" checked /> <label for="own-estate-id"></label>
										 </div>
										 <div class="pull-left desc">
											Own estate
										 </div>
									  </div>
									  <div class="clearfix below desktop-align">
										 <div class="pull-left radio-holder">
											<input type="radio" id="name-others-id" name="beneficiary-info" /> <label for="name-others-id"></label>
										 </div>
										 <div class="pull-left desc">
											Name others
										 </div>
									  </div>
								   </div>
								</div>
								<div id="beneficiary-contents" class="col-md-4 col-lg-4 col-sm-12 col-xs-12 hidden">
									<div class="clearfix add-on-header default-head-h5" id="beneficiary-header[0]">
										<div class="pull-left">
											<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 1)</span>
											</h5>
										</div>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[0]" name="beneficiaryLastName[0]" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[0]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[0]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[0]" name="beneficiaryFirstName[0]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[0]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[0]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[0]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[0]" name="beneficiaryChineseName[0]" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[0]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[0]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[0]" id="beneficiaryHkidPassport[0]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-0">
											<input type="text" id="beneficiaryHkid[0]" name="beneficiaryHkid[0]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[0]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-0">
											<input type="text" id="beneficiaryPassport[0]" name="beneficiaryPassport[0]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[0]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[0]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[0]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[0]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficiaryGender[0]" id="beneficiaryGender[0]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male">MALE</option>
														<option value="female">FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[0]" name="beneficiaryRelationship[0]">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<option value="father">FATHER</option>
														<option value="mother">MOTHER</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[0]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[0]" name="beneficiaryEntitlement[0]" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" value="" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[0]">Entitlement (%)</label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[0]"></span>
									 </div>		                
								</div>
							</form>
							<!-- Second Beneficiary -->
							<div id="add-beneficiary-1" class="text-center add-on-beneficiary col-md-4 col-lg-4 col-sm-12 col-xs-12 hidden">
								<div class="add-beneficiary" id="beneficiary1">
									<button id="add-beneficiary-btn-1" value="1" class="circle" type="button">
										<img src="assets/images/savie-2016/orange-plus.png" />
									</button>
									<div class="add-beneficiary-text">
										<h5>Add beneficiary</h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[1]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 2)</span>
										</h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[1]"><i class="fa fa-minus-circle"></i>Remove Beneficiary</button>
									</div>
								</div>
								<form id="beneficiary-info-form[1]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[1]" name="beneficiaryLastName[1]" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[1]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[1]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[1]" name="beneficiaryFirstName[1]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[1]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[1]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[1]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[1]" name="beneficiaryChineseName[1]" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[1]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[1]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[1]" id="beneficiaryHkidPassport[1]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-1">
											<input type="text" id="beneficiaryHkid[1]" name="beneficiaryHkid[1]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[1]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-1">
											<input type="text" id="beneficiaryPassport[1]" name="beneficiaryPassport[1]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[1]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[1]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[1]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[1]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficiaryGender[1]" id="beneficiaryGender[1]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male">MALE</option>
														<option value="female">FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[1]" name="beneficiaryRelationship[1]">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<option value="father">FATHER</option>
														<option value="mother">MOTHER</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[1]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[1]" name="beneficiaryEntitlement[1]" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" value="" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[1]">Entitlement (%)</label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[1]"></span>
									 </div>
								</form>
							</div>
							<!-- Third Beneficiary -->
							<div id="add-beneficiary-2" class="text-center add-on-beneficiary col-md-4 col-lg-4 col-sm-12 col-xs-12 last-row hidden">
								<div class="add-beneficiary" id="beneficiary2">
									<button id="add-beneficiary-btn-2" value="2" class="circle" type="button">
										<img src="assets/images/savie-2016/orange-plus.png" />
									</button>
									<div class="add-beneficiary-text">
										<h5>Add beneficiary</h5>
									</div>
								</div>
								<div class="clearfix add-on-header hidden" id="beneficiary-header[2]">
									<div class="pull-left">
										<h5 class="beneficiary-h5 hidden-lg hidden-md">Beneficiary <span class="beneficiary-span">(Person 3)</span>
										</h5>
									</div>
									<div class="pull-right">
										<button type="button" class="remove-bnfry-btn" id="remove-beneficiary[2]"><i class="fa fa-minus-circle"></i>Remove Beneficiary</button>
									</div>
								</div>
								<form id="beneficiary-info-form[2]" class="beneficiary-form-content hidden" method="post" action="">
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryLastName[2]" name="beneficiaryLastName[2]" class="form-control gray-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryLastName[2]">Last name (same as HKID)</label>
										</div>
										<span class="error-msg" id="beneficiaryLastErMsg[2]"></span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryFirstName[2]" name="beneficiaryFirstName[2]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" maxlength="25" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryFirstName[2]">First name (same as HKID)</label>
										</div>
										<input type="text" autocomplete="off" id="beneficiaryFullName[2]" hidden />
										<span class="error-msg" id="beneficiaryFirstErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupNameErMsg[2]">Duplicate english name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryChineseName[2]" name="beneficiaryChineseName[2]" class="form-control gray-textbox form-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryChineseName[2]">Name in Chinese (optional)</label>
										</div>
										<span class="error-msg" id="beneficiaryChineseNameErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupChineseErMsg[2]">Duplicate chinese name</span>
									</div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
											   <div class="selectDiv">
												  <label class="mdl-textfield__label cstm-dropdown-label">HKID / Passport</label>
												  <span class="icon-chevron-thin-down orange-caret"></span>
												  <select class="form-control gray-dropdown" name="beneficiaryHkidPassport[2]" id="beneficiaryHkidPassport[2]">
													 <option value="" selected="selected" disabled="disabled">HKID / Passport</option>
													 <option value="hkid">HKID</option>
													 <option value="passport">Passport</option>
												  </select>
											   </div>
											   <span class="error-msg" id="beneficiaryHkidPassportErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									<div class="form-group has-error beneficiary-info-row">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield" id="hkid-inputfield-2">
											<input type="text" id="beneficiaryHkid[2]" name="beneficiaryHkid[2]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryHkid[2]">HKID / Passport no.</label>
										</div>
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield hidden" id="passport-inputfield-2">
											<input type="text" id="beneficiaryPassport[2]" name="beneficiaryPassport[2]" class="form-control gray-textbox form-textbox mdl-textfield__input so-mdl-textfield-input" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryPassport[2]">HKID / Passport no.</label>
										</div>
										<span class="error-msg" id="beneficiaryHkidPassErMsg[2]"></span>
										<span class="dup-error-msg hidden" id="beneficiaryDupHkidErMsg[2]">Duplicate beneficiaries HKID</span>
										<span class="dup-error-msg hidden" id="beneficiaryDupPassportErMsg[2]">Duplicate beneficiaries Passport</span>
									</div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Gender</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown" name="beneficiaryGender[2]" id="beneficiaryGender[2]">
														<option value="" selected="selected" disabled="disabled">Gender</option>
														<option value="male">MALE</option>
														<option value="female">FEMALE</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryGenderErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row">
										<div class="clearfix">
											<div class="left-desktop text-box">
												<div class="selectDiv">
													<label class="mdl-textfield__label cstm-dropdown-label">Relationship with you</label>
													<span class="icon-chevron-thin-down orange-caret"></span>
													<select class="form-control gray-dropdown"  id="beneficiaryRelationship[2]" name="beneficiaryRelationship[2]">
														<option value="" selected="selected" disabled="disabled">Relationship with you</option>
														<option value="father">FATHER</option>
														<option value="mother">MOTHER</option>
													</select>
												</div>
												<span class="error-msg" id="beneficiaryRelationErMsg[2]"></span>
											</div>
										 </div>
									 </div>
									 <div class="form-group has-error beneficiary-info-row entitle">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label so-mdl-textfield">
											<input type="text" id="beneficiaryEntitlement[2]" name="beneficiaryEntitlement[2]" class="form-control gray-textbox percentage mdl-textfield__input so-mdl-textfield-input" value="" />
											<label class="mdl-textfield__label so-mdl-textfield-label" for="beneficiaryEntitlement[2]">Entitlement (%)</label>
										</div>
										<span class="error-msg" id="beneficiaryEntitlementErMsg[2]"></span>
									 </div>
								</form>
							</div>
						</div>
						<div class="fwd-container-limitpersonal-info-widget page-application et-application-page clearfix" id="beneficiary-note">
							<p>You may change the Beneficiary of this Policy by filing a written request at any time and as many times as you wish, 
							however, for the first time you make the change, you are required to make the change request in person at one of our 
							Customer Service Centers. </p>
							<div id="beneficiary-btn">
								<button type="submit" class="btn beneficiary-btn-next savie-common-btn" id="beneficiary-next-btn">Next</button>
								<button type="button" class="btn beneficiary-btn-back hidden savie-common-btn">Back to application summary</button>
								<a href="#" class="span-save-continue">
									<span>Save and continue later</span>
								</a>
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
			$(document).ready(function() {
				var language = "en";
				
				soFirstBFormValidation();
				
				$('.selectDiv').removeClass('is-not-active');
			});
		</script>
		
	</body>
</html>