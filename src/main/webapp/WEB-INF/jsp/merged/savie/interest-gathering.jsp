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
			<!--<p class="save-my-way">Save. My way.</p>
			<p class="guaranteed top">Guaranteed 3% annual return for each
				for the first 3 policy years</p>
			<p class="additional top">
				Act now to grab the chance to earn <span class="add">4% </span>annual
				return in the 3rd year! Limited Quota Offer!!
			</p>
			<p class="sign-up">Sign up now and await for our notification!!</p>-->
			<p class="additional top">Act now to grab the chance to enjoy guaranteed annual crediting rate: </p>
			<ul class="crediting-rate-list">
				<li><img src="<%=request.getContextPath()%>/resources/images/savie/bullet.png" class="img-responsive" />1st policy year 3%</li>
				<li><img src="<%=request.getContextPath()%>/resources/images/savie/bullet.png" class="img-responsive" />2nd policy year 3%</li>
				<li><img src="<%=request.getContextPath()%>/resources/images/savie/bullet.png" class="img-responsive" />3rd policy year 4%</li>
			</ul>
			<p class="additional top">Limited Quota Offer, Sign up now and await our notification!</p>
			<p class="additional top">For Limited Quota Offer, each Hong Kong ID card holder can apply for one Savie Insurance Plan policy with lump sum payment between HK$30,000 and HK$400,000.</p>
		</div>
	</div>
</div>

<div class="sign-up-teaser">
	<p class="sign-up-header">Coming soon in September...<br />Leave your email address with us NOW and be amongst the lucky ones to get priority access to Savie once it launches.</p>

	<p class="email-notification">Once you receive an email notification</p>
	<p class="email-notification">from us you can get the process started</p>
	<p class="email-notification">immediately!</p>

	<form class="sign-up-teaser-form" method="post" id="teaserSignUpForm"
		action="teaser.jsp">
		<div class="form-group">
			<input type="email" placeholder="Please enter your email address" class="form-control email" id="teaserEmail" name="teaserEmail" val=""> 
			<span class="error-msg hideSpan" id="emailAddrsMessage">&nbsp;</span>
			<input type="tel" placeholder="(Optional) Enter your telephone no." class="form-control email phone-no" id="teaserPhoneNo" name="teaserPhoneNo" maxlength="11" min="1" oninput="maxLengthReview(this)"> 
			<span class="error-msg hideSpan" id="phoneErrMsg">&nbsp;</span>
		</div>
		<div class="clearfix">
			<div class="pull-left checkbox">
				<input type="checkbox" value="pics" id="pics-check" name="isPics" />
				<label for="pics-check"></label>
			</div>
			<div class="pull-left text">  I have read, understood and accepted the <a href="">Personal Information Collection Statement</a>. </div>
		</div>

		<div class="clearfix top">
			<div class="pull-left checkbox">
				<input type="checkbox" value="tc" id="tc-check" name="isTc" /> <label
					for="tc-check"></label>
			</div>
			<div class="pull-left text">
				I have read, understood and accepted these <a href="">Terms and
					Conditions</a>.
			</div>
		</div>
		<span class="error-msg chk hideSpan" id="checkboxErrorMessage">&nbsp;</span>
		<button type="submit" class="btn btn-white btn-sign-up" id="teaser-sign-up-btn">Sign up</button>
	</form>
</div>

<div id="flux">
	<div id="landing-three-column"
		class="fwd-container container-fluid three-column-widget">
		<div class="row row-top text-center">
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Save and earn</h2>
					<h3>with Ease</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/big-on-savings.png">
					<p> Savie provides <span>guaranteed annual crediting rate 3% for first 2 policy years </span>and <span>guaranteed annual crediting rate 4% for the 3rd policy years,</span> allowing you a smart way to plan ahead for something BIG.</p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Flexible and Free</h2>
					<h3>from Charges</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/no-commitment.png">
					<p> Enjoy flexibility when you need it most - <span>you can withdraw from your Savie account at NO charge!</span></p>
				</div>
			</div>
			<div class="col-xs-12 col-md-4 fwd-col">
				<div class="col-content">
					<h2>Make the Most</h2>
					<h2 class="out-life">Out of Life</h2>
					<h3>with Extra Protection</h3>
					<img src="<%=request.getContextPath()%>/resources/images/savie/free-additional-2.png">
					<p>Receive death benefit at 105% of your account value*. On top of that, Savie also provides an accidental death benefit equivalent to 100% of your account value*, until age 70 and up to a maximum amount of HK$400,000.</p>
					<p class="info-asterisk">*The accumulation of total premium paid plus interests<p>
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
				<img src="<%=request.getContextPath()%>/resources/images/savie/other-benefits-2-img.png">
			</div>
			<div class="col-xs-12 col-md-8 fwd-col">
				<ul>
					<li><p>Simple product design with no fees and charges, you can understand easily.</p></li>
					<li><p>After first 3 policy years, you can choose to get all your account value back by terminating the policy or stay with us to earn annual crediting rates determined by FWD at that moment.</p></li>
					<li><p>If you have any questions, you can always call FWD's 24-hour service hotline or visit one of our 5 customer service centres to enjoy premium customer service.</p></li>
					<li><p>Receive 8% Agoda discount offer upon successful registration of FWD online membership.</p></li>
				</ul>
			</div>
		</div>
		<!-- Disclaimer and Policy Provisions -->
		<div class="disclaimer-policy">
			<p>The features above are indicative only. Please refer to <a href="">Product Brochure</a> and <a href="">Product Provisions</a> for more details.</p>
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
				<h2>Thank you for your interest</h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered">You have successfully registered your email address.</p>
				<p class="registered">Tell us a little bit more about your savings goal so that we can serve you better in the future!</p>

				<div class="modal-divider"></div>

				<p class="question">In general, how much do you plan to save if you are offered a saving plan that can be withdrawn anytime with guaranteed annual crediting rate at 3% or above?</p>

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