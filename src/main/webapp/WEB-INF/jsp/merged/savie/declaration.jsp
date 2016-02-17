<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="declaration-page">
			<!-- HEADER -->
			<%@include file="includes/header-block.jsp" %>
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
							<li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Applicaton &amp; payment</button></li>
							<li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; declaration</button></li>
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
							<h3 id="">Summary &amp; declaration</h3>
						 </div>
						 <p id="step-of">3 of 6</p>
					  </div>
				   </div>
				</div>
			</div>
			<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
				<div class="step-indicator-container clearfix">
					   <ul class="common-step-indicator six-steps nav nav-pills">
						 <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
						 <li><a href="#" class="active"><span class="step-no">3</span></a></li>
						 <li><a href="#"><span class="step-no">4</span></a></li>
						 <li><a href="#"><span class="step-no">5</span></a></li>
						 <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
					</ul>
					<div class="step-line"></div>
				</div>
			</div>
			<div class="container-fluid fwd-full-container headerStick">
				<div class="fwd-container-limit clearfix sidebar">
					<div class="declaration-content-wrapper">
						<form>
							<p class="title">Declaration &amp; autorization</p>
							
							<div class="cstm-panel">
								<p><b>Declaration - Foreign Account Tax Compliance Act</b></p>
								<hr>
								<div class="form-group checkbox-wrapper">
									<input type="checkbox" id="hasReadAndAcceptFATC" name="hasReadAndAcceptFATC">
									<label for="hasReadAndAcceptFATC"></label>
									<p>I declare, agree and acknowledge that:</p>
								</div>
								<p id="chkFATCErMsg" class="err-msg hidden">Please read and accept the Foreign Account Tax Compliance Act statement before submitting the application.</p>
								<nav>
									<ol type="i">
										<li><p>FWD Life Insurance Company (Bermuda) Limited (“FWD”) and/or its affiliates are obliged to comply with all laws, regulations, orders, guidelines and codes, including the applicable requirements under the Foreign Account Tax Compliance Act or agreements with any public, judicial, taxation, governmental and/or other regulatory authorities, including the Internal Revenue Service of the United States of America (the “Authorities” and each an “Authority” ) in various jurisdictions as promulgated and amended from time to time (the “Applicable Requirements”).</p></li>
										<li><p>I am not and not acting for and on behalf of, a United States person, being a U.S. citizen, U.S. resident for U.S. federal income tax purposes or U.S. Resident Alien (i.e. a so-called U.S. green card holder) and I will notify FWD in writing within 30 days if there is any change of details provided to FWD in this application, in particular, my nationality, tax status or tax residency changes and will provide</p></li>
									</ol>
								</nav>
							</div>
							
							<div class="cstm-panel">
								<p><b>Declaration - Foreign Account Tax Compliance Act</b></p>
								<hr>
								<div class="form-group checkbox-wrapper">
									<input type="checkbox" id="hasReadAndAcceptFATC2" name="hasReadAndAcceptFATC2">
									<label for="hasReadAndAcceptFATC2"></label>
									<p>I declare, agree and acknowledge that:</p>
								</div>
								<p id="chkFATC2ErMsg" class="err-msg hidden">Please read and accept the Foreign Account Tax Compliance Act statement before submitting the application.</p>
								<nav>
									<ol type="i">
										<li><p>FWD Life Insurance Company (Bermuda) Limited (“FWD”) and/or its affiliates are obliged to comply with all laws, regulations, orders, guidelines and codes, including the applicable requirements under the Foreign Account Tax Compliance Act or agreements with any public, judicial, taxation, governmental and/or other regulatory authorities, including the Internal Revenue Service of the United States of America (the “Authorities” and each an “Authority” ) in various jurisdictions as promulgated and amended from time to time (the “Applicable Requirements”).</p></li>
										<li><p>I am not and not acting for and on behalf of, a United States person, being a U.S. citizen, U.S. resident for U.S. federal income tax purposes or U.S. Resident Alien (i.e. a so-called U.S. green card holder) and I will notify FWD in writing within 30 days if there is any change of details provided to FWD in this application, in particular, my nationality, tax status or tax residency changes and will provide</p></li>
									</ol>
								</nav>
							</div>
							
							<div class="cstm-panel">
								<p class="desktop-inline"><b>Declaration - </b></p>
								<p class="desktop-inline"><b>Personal Information Collection Statement</b></p>
								<hr>
								<div class="form-group checkbox-wrapper clearfix">
									<input type="checkbox" id="hasReadAndAcceptPICS" name="hasReadAndAcceptPICS">
									<label for="hasReadAndAcceptPICS"></label>
									<p class="desktop-left">I have read and I understand and accept this</p>
									<p class="personal-info-link-parent desktop-left"><a data-toggle="modal" data-target=".modal-fatca-declaration">Personal Information Collection Statement.</a></p>
								</div>
								<p id="chkPICSErMsg" class="err-msg hidden">Please read and accept the Personal Information Collection statement before submitting the application.</p>
							</div>
							
							<div class="cstm-panel">
								<p><b>Policy replacement declarations</b></p>
								<hr>
								<div class="row">
									<div class="col-xs-12">
										<p>Have you, in the past 12 months, replaced any or a substantial part of your existing life insurance policy upon this application?</p>
										<div class="radio-group clearfix">
										   <div class="radio-button-group">
											  <div class="clearfix desktop-align left">
												 <div class="pull-left radio-holder">
													<input type="radio" id="haveReplacedNo" name="haveReplaced" value="No" checked="checked" class="radio-no">
													<label for="haveReplacedNo"></label>
												 </div>
												 <div class="pull-left desc">No</div>
											  </div>
											  <div class="clearfix below desktop-align">
												 <div class="pull-left radio-holder">
													<input type="radio" id="haveReplacedYes" name="haveReplaced" value="Yes" class="radio-yes">
													<label for="haveReplacedYes"></label>
												 </div>
												 <div class="pull-left desc">Yes</div>
											  </div>
										   </div>
										</div>
									</div>
									<div class="col-xs-12">
										<p>Do you, in the next 12 months, intend to replace any or a substantial part of your existing life insurance policy upon this application?</p>
										<div class="radio-group clearfix">
										   <div class="radio-button-group clearfix">
											  <div class="clearfix desktop-align left">
												 <div class="pull-left radio-holder">
													<input type="radio" id="intentToReplacedNo" name="intentToReplaced" value="No" checked="checked" class="radio-no">
													<label for="intentToReplacedNo"></label>
												 </div>
												 <div class="pull-left desc">No</div>
											  </div>
											  <div class="clearfix below desktop-align">
												 <div class="pull-left radio-holder">
													<input type="radio" id="intentToReplacedYes" name="intentToReplaced" value="Yes" class="radio-yes">
													<label for="intentToReplacedYes"></label>
												 </div>
												 <div class="pull-left desc">Yes</div>
											  </div>
										   </div>
										</div>
									</div>
								</div>
								
								<div class="replacement-declarations">
									<p><b>I realize if I answer "No" to both questions above but indeed,</b></p>
									<p>I hereby authorize the Insurer of the new life insurance policy to give the Insurance Agents Registration Board, the Hong Kong Confederation of Insurance Brokers, the Professional Insurance Brokers Association Limited, the Insurance Authority (“IA”), the Hong Kong Federation of Insurers, the insurer(s) of the life insurance policy(ies) that is/are being or has/have been replaced (if applicable)or other parties, as required for proper administration/implementation/ execution of the Code of Practice for Life Insurance Replacement and the “Minimum Requirements” for insurance brokers as specified by the IA under the Insurance Companies Ordinance, a copy of this “Replacement Declaration” and any related records or information.</p>
									<p>i. this application has replaced any or a substantial part of my existing life insurance policy(ies) in the past 12 months; or ii. my current intention is to replace any or a substantial part of my existing life insurance policy(ies) within the next 12 months by this application, I may jeopardize my future right of redress if I find later that I have been disadvantaged because of such replacement. </p>
								</div>
							</div>
							
							<div class="cstm-panel">
								<p class="desktop-inline"><b>Declaration - </b></p>
								<p class="desktop-inline"><b>Cancellation Right and Refund of Premium(s)</b></p>
								<hr>
								<div class="form-group checkbox-wrapper">
									<input type="checkbox" id="hasReadAndAcceptCancellation" name="hasReadAndAcceptCancellation">
									<label for="hasReadAndAcceptCancellation"></label>
									<p>I understand that I have the right to cancel and obtain a refund of any premium(s) paid less any market value adjustments by giving written notice. Such notice must be signed by me and received directly by FWD Life insurance Company (Bermuda) Limited at 1/F., FWD Financial Centre, 308 Des Voeux Road Central, Hong Kong within 21 days after the delivery of the policy or issue of a Notice to the policyholder or the policyholders representative, whichever is the earlier.</p>
								</div>
								<p id="chkCancellationErMsg" class="err-msg hidden" style="margin-bottom: 15px;">Please read and accept the Cancellation Right and Refund of Premium statement before submitting the application.</p>
								<p><b>Residency Declaration</b></p>
								<p>Will you or do you intend to live or work outside Hong Kong or home country over 183 days in the coming 12  months?</p>
								<div class="radio-group clearfix">
								   <div class="radio-button-group">
									  <div class="clearfix desktop-align left">
										 <div class="pull-left radio-holder">
											<input type="radio" id="intentToLiveOutsideNo" name="intentToLiveOutside" value="No" checked="checked" class="radio-no">
											<label for="intentToLiveOutsideNo"></label>
										 </div>
										 <div class="pull-left desc">No</div>
									  </div>
									  <div class="clearfix below desktop-align">
										 <div class="pull-left radio-holder">
											<input type="radio" id="intentToLiveOutsideYes" name="intentToLiveOutside" value="Yes" class="radio-yes">
											<label for="intentToLiveOutsideYes"></label>
										 </div>
										 <div class="pull-left desc">Yes</div>
									  </div>
								   </div>
								</div>
							</div>
							
							<div class="cstm-panel">
								<p><b>Application</b></p>
								<hr>
								<div class="form-group checkbox-wrapper">
									<input type="checkbox" id="hasReadAndAgreeApplication" name="hasReadAndAgreeApplication">
									<label for="hasReadAndAgreeApplication"></label>
									<p>I hereby DECLARE and AGREE that:</p>
								</div>
								<p id="chkApplicationErMsg" class="err-msg hidden">Please read and accept the Declaration, Terms & Conditions before submitting the application.</p>
								<nav>
									<ol type="i">
										<li><p>I am in Hong Kong at the time of making this application and the answers to all the above questions are complete, true and accurate and are given to the best of my knowledge and belief;</p></li>
										<li><p>I have the duty to immediately inform the Company and correct the answers to the above questions if they have become incomplete, untrue and inaccurate subsequently before any policy is issued;</p></li>
										<li><p>Any payment made in connection with this application does not guarantee immediate approval of the coverage applied for. The insurance coverage applied for shall only take effect when the relevant policy has been issued and the initial premium paid (including any additional initial premium payable due to revisions of the policy terms and conditions);</p></li>
									</ol>
								</nav>
							</div>
							
							<div class="cstm-panel">
								<p class="with-margin-bottom">If you do NOT wish FWD General Insurance Company Litmited to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below to exercise</p>
								<div class="form-group checkbox-wrapper checkbox-gray">
									<input type="checkbox" id="chkboxDoNotSendMarketingInfo" name="chkboxDoNotSendMarketingInfo">
									<label for="chkboxDoNotSendMarketingInfo"></label>
									<p>Please do not send direct marketing information to me.</p>
								</div>
								<div class="form-group checkbox-wrapper checkbox-gray">
									<input type="checkbox" id="chkboxDoNotProvidePersonalData" name="chkboxDoNotProvidePersonalData">
									<label for="chkboxDoNotProvidePersonalData"></label>
									<p>Please do not provide my personal data to other persons or companies for their use in direct marketing.</p>
								</div>
							</div>
							
							<div class="recommendation-note visible-xs visible-sm">
								<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
								We recommend using a desktop PC for a better signatory experience.
							</div>
								
							<center>
								<button type="button" class="btn savie-common-btn btn-proceed">Proceed to signature</button>
								<a href="#" class="save-link">Save and continue later</a>
							</center>
						</form>
					</div>
				</div>
			</div>
			
			<!-- MODAL -->
			<button type="button" class="btn hidden" id="btn-show-modal" data-toggle="modal" data-target="#yes-radio-popup"></button>
			
			<div class="modal fade" id="yes-radio-popup" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close" data-modal="yes-radio-modal"><span aria-hidden="true">×</span></button>
			     	<p class="text-center">Please contact our customer service hotline <span class="hotline">3123 3123</span> for assistance.</p>
			    </div>
			  </div>
			</div>
			
			<!-- Modal for Personal Information Collection Statement -->
			<div class="modal fade modal-fatca-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-fatca-declaration">
				<div class="modal-content common-welcome-modal" id="modal-content-fatca">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-fatca" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p>Foreign Account Tax Compliance Act </p>
					 </div>
					 <div class="modal-body" id="modal-body-fatca">
						<ol>
							  <li>FWD Life Insurance Company (Bermuda) Limited ("FWD") and/or its affiliates are obliged 
							  to comply with all laws, regulations, orders, guidelines and codes, including the applicable 
							  requirements under the Foreign Account Tax Compliance Act or agreements with any public, judicial,
							  taxation, governmental and/or other regulatory authorities, including the Internal Revenue Service of 
							  the United States of America (the "Authorities" and each an "Authority" ) in various jurisdictions as
							  promulgated and amended from time to time (the "Applicable Requirements").</li>
							  <li>I am not and not acting for and on behalf of, a United States person, being a U.S. citizen, U.S. 
							  resident for U.S. federal income tax purposes or U.S. Resident Alien (i.e. a so-called U.S. green card holder) 
							  and I will notify FWD in writing within 30 days if there is any change of details provided to FWD in this 
							  application, in particular, my nationality, tax status or tax residency changes and will provide any further 
							  information or document requested by FWD.</li>
							  <li>FWD may disclose my particulars or any information to any Authority (within or outside Hong Kong) 
							  in connection or adherence with the Applicable Requirements. I also agree to provide FWD with assistance as 
							  may be necessary to enable FWD to comply with its obligations under all Applicable Requirements.</li>
							  <li id="fourth-li">FWD may withhold payment of any amount due to myself under my policy(ies) if I have failed to provide 
							  any up-to-date or complete information or documents to FWD in compliance with the Applicable Requirements and/or pay 
							  the same to any relevant Authority on my behalf as the relevant Authority may require. I also agree that the 
							  Company reserves the right and shall be entitled to terminate my policy(ies) and return to me the cash value 
							  (if any) calculated pursuant to the provisions of such policy(ies). </li>
							</ol>
					 </div>
				 </div>
			  </div>
			</div>
			
			<!--<div class="fwd-savie-wrapper">-->
			
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
			
			var $radio_yes_elem;
			var $radio_no_elem;
			
			$(document).ready(function() {
				$(".radio-yes").click(function(){
					$radio_yes_elem = $(this);
					$radio_no_elem = $(this).parent().parent().siblings('.left').find('.radio-no');
					$('#btn-show-modal').click();
				});
				
				$('.close').click(function() {
					if($(this).attr("data-modal") == "yes-radio-modal") {
						updateRadioStatus();
					}
				});
				
				$('.modal').on('click', function() {
					if($(this).attr("id") == "yes-radio-popup") {						
						updateRadioStatus();
					}
				});
				
				function updateRadioStatus() {
					$radio_yes_elem.prop("checked", false);
					$radio_no_elem.prop("checked", true);
				}
				
				$('.btn-proceed').click(function() {
					var isPassed = false;
					
					// validation
					isPassed = validateChkboxField('hasReadAndAcceptFATC', 'chkFATCErMsg');
					isPassed = validateChkboxField('hasReadAndAcceptFATC2', 'chkFATC2ErMsg');
					isPassed = validateChkboxField('hasReadAndAcceptPICS', 'chkPICSErMsg');
					isPassed = validateChkboxField('hasReadAndAcceptCancellation', 'chkCancellationErMsg');
					isPassed = validateChkboxField('hasReadAndAgreeApplication', 'chkApplicationErMsg');
					
					if(! isPassed) {
						return false;
					}
				});
				
				function validateChkboxField(chkboxId, errMsgId) {
					if(!$('#' + chkboxId).is(':checked')) {
						$('#' + errMsgId).removeClass('hidden');
						return false;
					} else {
						$('#' + errMsgId).addClass('hidden');
						return true;
					}
				}
			});
		</script>
	</body>
</html>