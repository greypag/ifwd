<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>FWD</title>
<script src="resources/js/fwd.js">
	
</script>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<script>
	function activateUserAccount() {

		var validateFormVal = validateJoinUsForm();
		$('#ajax-loading').show();
		if (validateFormVal == true) {

			$
					.ajax({
						type : 'POST',
						url : 'joinus',
						data : $('#joinus_form form').serialize(),
						async : false,
						success : function(data) {
							$('#ajax-loading').hide();
							/* success-message */
							if (data == 'success') {
								$('#success-message').show();
								$('#joinus-err-msg').hide();
								window.location.hash = '#success-message';
								$('#success-message').html(
										"User succesfully Register");
								setTimeout(function() {
									window.location.href = "indexPage";
								}, 3000);

							} else if (data == 'fail') {
								$('#joinus-err-msg').show();
								window.location.hash = '#joinus-err-msg';
								$('#joinus-err-msg')
										.html(
												"Please check provided information is valid");

							} else {
								window.location.hash = '#joinus-err-msg';
								$('#joinus-err-msg').show();
								$('#joinus-err-msg').html(data);
							}
						},
						error : function(xhr, status, error) {

						}
					});
		}
		return false;
	}
</script>
</head>

<body>



	<!--GTM-->
	<!-- Google Tag Manager -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
	</script>
	<!-- End Google Tag Manager-->
	<!--End GTM-->

	<!--   Main Content-->
	<section>
		<div class="container mob-pad">
			<div class="row" id="joinus_form">
				<form:form modelAttribute="userDetails" class="form-horizontal"
					name="joinus_form" role="form">
					<ol class="breadcrumb pad-none">
						<li><a href="#">Home</a></li>
						<li class="active"><i class="fa fa-caret-right"></i> FWD
							Member Account Activation</li>
					</ol>
					<!-- desktop Title-->
					<h2 class="page-title">FWD Member Account Activation</h2>
					<div id="joinus-err-msg" class="alert alert-danger" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 border-right">
						<table class="table activation-form">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">Member Details</h3></td>
								</tr>
								<tr>
									<td class="col-sm-4 col-xs-4 pad-none"><label
										for="txtFullName" class="join-us-label"> Full name<br>
											<small>(As appears on HKID Card/Passport)</small>
									</label></td>
									<td class="pad-none"><input type="text"
										class="form-control btm-pad-10" name="fullName"
										id="txtFullName" placeholder="Full name"
										onblur="replaceAlpha(this);"
										onkeypress="return alphaOnly(event);" maxlength="100">
										<span id="errorEmptyName" style="display: none"> <label
											class="text-red">Please enter Full Name and please
												enter in English</label>
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtMobileNo"
										class="control-label">Mobile no</label></td>
									<td class="pad-none"><input type="text" name="mobileNo"
										class="form-control" id="txtMobileNo"
										placeholder="Mobile Number"
										onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8"> <span
										id="errorEmptyMob" style="display: none"> <label
											class="text-red">Please enter your Mobile No.</label>
									</span> <span id="errorInvalidMob" style="display: none"> <label
											class="text-red">Please enter an 8-digit Mobile No.</label>
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtEmailId"
										class="join-us-label"> Email Address<br> <small>(Insurance
												certificate will be sent to this email address)</small>
									</label></td>
									<td class="pad-none"><input type="email"
										name="EmailAddress" class="form-control btm-pad-10"
										id="txtEmailId" placeholder="Email address" maxlength="50">
										<span id="errorEmptyEmailId" style="display: none"> <label
											class="text-red">Please enter your Email Address.</label>
									</span> <span id="errorInvalidEmailId" style="display: none"> <label
											class="text-red">Please enter a valid Email Address.</label>
									</span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtUserName"
										class="control-label">Username</label> <a href="#"
										class="pull-right tool-tip hidden-lg hidden-md top-pad-10"
										data-toggle="tooltip" data-placement="bottom"
										title="Username should contain at least 6 characters"> <img
											src="images/ic.png" alt="">
									</a></td>
									<td class="pad-none">

										<div class="pull-left acc-tool-input-div">
											<input type="text" class="form-control acc-tool-input"
												name="userName" id="txtUserName1" placeholder="Username">
										</div>
										<div class="pull-left acc-tool-tip-div top-pad-10">

											<a href="#" class="pull-right tool-tip hidden-sm hidden-xs"
												data-toggle="tooltip" data-placement="bottom"
												title="Username must be between 6 and 50 characters."><img
												src="images/ic.png" alt=""></a>
										</div> <span id="errorEmptyUName" style="display: none"> <label
											class="text-red">Please enter your Username.</label>
									</span> <span id="errorInvalidUName" style="display: none"> <label
											class="text-red">Username must be between 6 and 50
												characters.</label>
									</span>

									</td>
								</tr>
								<tr>
									<td class="pad-none"><label class="control-label">Password</label>
										<a href="#"
										class="pull-right tool-tip hidden-lg hidden-md top-pad-10"
										data-toggle="tooltip" data-placement="bottom"
										title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases)"><img
											src="images/ic.png" alt=""></a></td>
									<td class="pad-none">
										<div class="pull-left acc-tool-input-div">
											<input type="password" name="password"
												class="form-control acc-tool-input" id="txtPass1"
												placeholder="Password">
										</div>
										<div class="pull-left acc-tool-tip-div top-pad-10">
											<a href="#" class="pull-right tool-tip hidden-sm hidden-xs"
												data-toggle="tooltip" data-placement="bottom"
												title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases)"><img
												src="images/ic.png" alt=""></a>

										</div> <span id="errorEmptyPass" style="display: none"> <label
											class="text-red">Please enter your Password.</label>
									</span> <span id="errorValidPass" style="display: none"> <label
											class="text-red">Password must be at least 8
												characters and alphanumeric (both upper AND lower cases).</label>
									</span>
									</td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtConfPass"
										class="control-label">Confirm password</label></td>
									<td class="pad-none"><input type="password"
										name="confirmPassword" class="form-control" id="txtConfPass"
										placeholder="Confirm Password"> <span
										id="errorEmptyConfPass" style="display: none"> <label
											class="text-red">Please Confirm Password.</label>
									</span> <span id="errorJoinUsPassword" style="display: none"> <label
											class="text-red">Passwords you entered do not match.
												Please enter the same Password in both fields.</label>
									</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
						<div>
							<img src="resources/images/user.jpg" alt="" />
						</div>
						<h2 class="h2-1 fwd-acc">
							Why create a<br> member account?
						</h2>
						<h4 class="h4-1">To enjoy year-round promotions and referral
							benefits.</h4>
					</div>
					<div class="clearfix"></div>
					<h4 class="h4-2 padding4 ">Declaration</h4>
					<br>
					<div class="declaration-content ">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox"> <label
								for="checkbox1"> I/we hereby declare that:- <br> i.
								<span class="margin-left-2"></span> the particulars and
								statements given above are, to the best of my/our knowledge and
								belief, true and complete; <br> ii. <span
								class="margin-left-2"></span> to the best of my/our knowledge
								and belief no Insured Person is travelling contrary to the
								advice of any medical practitioner or for the purpose of
								obtaining medical treatment and that I/we understands that
								treatment of any pre-existing, recurring or congenital medical
								conditions are not insured. I am/We are not aware of any
								condition cause or circumstance that may necessitate the
								cancellation or curtailment of the journey as planned; and <br>
								iii. <span class="margin-left-2"></span>this application shall
								be the basis of the contract between me and FWD. <br> iv.<span
								class="margin-left-2"></span> I declare that this Proposal Form
								is applied and signed at HKSAR, in case of fraud or factual
								misrepresentation, the cover for me or for the Insured Person(s)
								may be invalidated.


							</label>
						</div>
						<span id="chk1" style="display: none"> <label
							class="text-red">Please read and accept the Declaration,
								Terms & Conditions before submitting the application.</label>
						</span>
						<div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2"> I/We have read and understood <a
								href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
								target="_blank" class="sub-link"> Personal Information
									Collection Statement</a> and agree to be bound by the same. <br>
								<br> If you do NOT wish The Company to use Your Personal
								Data in direct marketing or provide Your Personal Data to other
								persons or companies for their use in direct marketing, please
								tick the appropriate box(es) below to exercise
							</label>
						</div>
						<span id="chk2" style="display: none"> <label
							class="text-red">Please read and accept the Personal
								Information Collection Statement before submitting the
								application.</label>
						</span>
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> Please do not send direct marketing
								information to me.<br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4" type="checkbox"> <label
								for="checkbox4"> Please do not provide my personal data
								to other persons or companies for their use in direct marketing.
								<br> <br>
							</label>
						</div>
					</div>

					<div class="container btm-pad-10">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-lg-3 col-md-3">
								<button
									class="bdr-curve btn btn-primary btn-lg btn-block act-btn"
									onclick="return activateUserAccount();">Activate</button>
							</div>
						</div>
					</div>

				</form:form>
			</div>
		</div>
		<!--/.container-->
	</section>


</body>