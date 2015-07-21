<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="text-center banner-widget container-fluid">
	<div class="fwd-container container-fluid breadcrumbs">
		<ol class="breadcrumb breadcrumbs-product-details breadcrumbs-landing">
			<li><a href="#">Home</a></li>
			<li class="divider"><i class="fa fa-play"></i></li>
			<li><a href="#">Save</a></li>
			<li class="divider last"><i class="fa fa-play"></i></li>
			<li class="active-bc">Savie</li>
		</ol>
	</div>

	<div class="text-content">
		<img src="<%=request.getContextPath()%>/resources/images/savie/teaser-banner-mobile.png"
			title="Savie is always sweeter" alt="Savie is always sweeter"
			class="img-responsive hidden-md hidden-lg teaser-banner-mobile">
		<img src="<%=request.getContextPath()%>/resources/images/savie/teaser-banner.png"
			title="Savie is always sweeter" alt="Savie is always sweeter"
			class="img-responsive hidden-xs hidden-sm teaser-banner-desktop">
	</div>
</div>

<div class="fwd-full-container container-fluid teaser">
	<div class="fwd-container-limit">
		<div class="teaser-banner-text">
			<div class="money-div">
				<img src="<%=request.getContextPath()%>/resources/images/savie/money-logo.png" class="money">
			</div>
			<p class="save-my-way">Save. My way.</p>
			<p class="guaranteed top">Guaranteed 3% annual return for each
				for the first 3 policy years</p>
			<p class="additional top">
				Act now to grab the chance to earn <span class="add">4% </span>annual
				return in the 3rd year! Limited Quota Offer!!
			</p>
			<p class="sign-up">Sign up now and await for our notification!!</p>
		</div>
	</div>
</div>

<div class="sign-up-teaser">
	<p class="sign-up-header">Coming soon...Leave your email address
		with us NOW and be amongst the limited lucky ones to apply for SAVIE
		once it launches.</p>

	<p class="email-notification">Once you receive an email
		notification from</p>
	<p class="email-notification">us and decide to sign up for the
		plan,</p>
	<p class="email-notification">your application will be processed
		immediately</p>

	<form class="sign-up-teaser-form" method="post" id="teaserSignUpForm"
		action="teaser.jsp">
		<div class="form-group">
			<input type="email" placeholder="Enter your email"
				class="form-control email" id="teaserEmail" name="teaserEmail"
				val=""> <span class="error-msg hideSpan"
				id="emailAddrsMessage">This e-mail address is already in use.
				Try another?</span> <span class="error-msg blank hideSpan"
				id="noEmailMessage">Please input email.</span> <input type="number"
				placeholder="Enter your phone no (optional)"
				class="form-control email phone-no" id="teaserPhoneNo"
				name="teaserPhoneNo" maxlength="11" min="1"
				oninput="maxLengthReview(this)"> <span
				class="error-msg hideSpan" id="phoneErrMsg">This phone number
				is invalid. Try another?</span>
		</div>
		<div class="clearfix">
			<div class="pull-left checkbox">
				<input type="checkbox" value="pics" id="pics-check" name="isPics" />
				<label for="pics-check"></label>
			</div>
			<div class="pull-left text">
				I have read, understand and accept this <a href="">Personal
					Information Collection Statement</a>.
			</div>
		</div>

		<div class="clearfix top">
			<div class="pull-left checkbox">
				<input type="checkbox" value="tc" id="tc-check" name="isTc" /> <label
					for="tc-check"></label>
			</div>
			<div class="pull-left text">
				I have read, understand and accept this <a href="">Terms and
					Conditions</a>.
			</div>
		</div>
		<span class="error-msg chk hideSpan" id="checkboxErrorMessage">In
			order to continue, you must agree to the Terms and Conditions.</span>
		<button type="submit" class="btn btn-white btn-sign-up"
			id="teaser-sign-up-btn">Sign up</button>
	</form>
</div>

<div id="flux">
	<div id="landing-three-column"
		class="fwd-container container-fluid three-column-widget">
		<div class="row row-top text-center">
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Save and earn</h2>
					<h3>BIG with ease</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/big-on-savings.png">
					<p>
						SAVIE guarantees earnings of 3% <span>interest in the first
							3 policy years, </span>, allowing you a smart way to plan ahead for
						something big.
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Flexible and free</h2>
					<h3>from charges</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/no-commitment.png">
					<p>
						Enjoy flexibility for when you need it most! You can <span>withdraw
							from your account at no charge</span>, for as many times as you want!
					</p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Make the most</h2>
					<h2 class="out-life">out of life</h2>
					<h3>with extra protection</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/free-additional.png">
					<p>
						Receive Accidental Death Benefit along with your savings, <span>insuring
							100% of your account</span> value up to a maximum of HK$400,000.
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="fwd-container container-fluid">
		<div id="other-benefits" class="row">
			<div class="col-xs-12 col-md-8 pull-right">
				<h2 class="text-center">Other features</h2>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col text-center left-clear">
				<img src="<%=request.getContextPath()%>/resources/images/savie/other-benefits-img.png">
			</div>
			<div class="col-xs-12 col-md-8 fwd-col">
				<ul>
					<li><p>Simple product design with no hidden terms or
							conditions</p></li>
					<li><p>Policyholders can enjoy a "cooling-off period",
							i.e. during the period after the delivery of the policy or
							issurance of welcome letter to the policyholder, he/she has the
							right to cancel the policy and obtain a full refund of the
							insurance premium without any charges.</p></li>
					<li><p>Customers are able to complete the application
							process online. If you have any questions, you can always call
							FWD's 24 hour service hotline or visit one of our 5 customer
							service centres to enjoy premium customer service.</p></li>
					<li><p>Receive 8% Agoda discount offer upon successful
							registration of FWD online membership.</p></li>
				</ul>
			</div>
		</div>
		<!-- Disclaimer and Policy Provisions -->
		<div class="disclaimer-policy">
			<p>The features above are indicative only. Please refer to the
				final Policy Provisions upon product launch</p>
		</div>
	</div>


</div>

<!--<button type="button" class="btn btn-full hidden-md hidden-lg">Read more</button>-->
<a class="btn btn-full hidden-md hidden-lg"
	href="http://blog.fwd.com.hk/en_US/" target="_blank">Read more</a>

<div class="modal fade" role="dialog" aria-labelledby="teaserSurvery"
	id="teaserSurvery">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey">
			<div class="modal-header teaserSurvey">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h2>Thank you</h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered">You have successfully registered your
					email.</p>
				<p class="registered">Can you tell us a little bit more about
					your savings goal so that we can serve you better in future?</p>

				<div class="modal-divider"></div>

				<p class="question">In general, how much do you plan to save if
					you are offered products that can be withdrawn anytime with 3%
					annual interest rate?</p>

				<form class="amount-to-save">
					<div class="teaser-select">
						<span class="icon-chevron-thin-down orange-caret"
							id="dropdown-caret"></span> <select
							class="form-control saveDropdown" name="amountToSave"
							id="amountToSave">
							<option selected disabled value="">- Please select -</option>
							<option value="10,000">10,000</option>
							<option value="50,000">50,000</option>
							<option value="400,000">400,000</option>
						</select>
					</div>
					<button type="submit" class="btn btn-white btn-thank-you"
						id="teaser-mmodal-submit">Submit</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="<%=request.getContextPath()%>/resources/js/savie/fwd-teaser.js"></script>