<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Become our member | FWD Hong Kong</title>
	<script src="resources/js/fwd.js">

	</script>
	<script>
		$(function() {
			$("[data-toggle='tooltip']").tooltip();
		});
	</script>
	<script>
		function activateUserAccountJoinUs() {

			var validateFormVal = activateUserAccount();
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
							window.location.href = 'getAccByUsernaneAndPassword';

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
					<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 border-right margin-left">
						<table class="table activation-form vert-middle padding4 registration">
							<tbody>
								<tr>
									<td colspan="3"><h3
										class="black-bold pad-none">Member Details</h3></td>
									</tr>
									<tr>
										<td class=""><label
											for="txtFullName" class="join-us-label"> Full name<br>
											<small>(as appears on HKID Card/Passport)</small>
										</label></td>
										<td ><input type="text"
											class="form-control" name="fullName"
											id="txtFullName" placeholder="Full name"
											onblur="replaceAlpha(this);"
											onkeypress="return alphaOnly(event);" maxlength="100">
											<span id="errorEmptyName" class="text-red"></span></td>
										<td></td>

										</tr>
										<tr>
											<td class="">
											<label for="txtMobileNo"
												 class="join-us-label">Mobile no</label></td>
												<td ><input type="text" name="mobileNo"
													class="form-control" id="txtMobileNo"
													placeholder="Mobile number"
													onkeypress="return isNumeric(event)" onblur="replaceNumeric(this);" maxlength="8"> 
													<span id="errorEmptyMob" class="text-red"></span></td>
											<td></td>




										</tr>
										<tr>
											<td><label for="txtEmailId"
												class="join-us-label"> Email Address<br> <small>(Insurance
												certificate will<br> be sent to this email address)</small>
											</label></td>
											<td><input type="text"
												name="EmailAddress" class="form-control"
												id="txtEmailId" placeholder="Email address" maxlength="50">
												<span id="errorEmptyEmailId" class="text-red"></span></td>

											<td></td>


										</tr>
										<tr>
											<td class="">
											<label for="txtUserName"
												class="join-us-label">Username</label> <a href="#"
												class="pull-right tool-tip show-inline-xs"
												data-toggle="tooltip" data-placement="bottom"
												title="resources"> <img
												src="resources/images/ic.png" alt="">
											</a></td>
											<td>

												
													<input type="text" class="form-control"
													name="userName" id="txtUserName1" placeholder="Username">
												
												 <span id="errorEmptyUName" class="text-red"></span>
											

											


									</td>
									<td><a href="#" class="tool-tip show-inline-md"
													data-toggle="tooltip" data-placement="bottom"
													title="Username must be between 6 and 50 characters."><img
													src="resources/images/ic.png" alt=""></a></td>
								</tr>
								<tr>
									<td><label class="join-us-label">Password</label>
										<a href="#"
										class="pull-right tool-tip show-inline-xs"
										data-toggle="tooltip" data-placement="bottom"
										title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases)."><img
										src="resources/images/ic.png" alt=""></a></td>
										<td>
											
												<input type="password" name="password"
												class="form-control" id="txtPass1"
												placeholder="Password">
											
											 <span id="errorJoinUsPassword" class="text-red"></span>





								</td>
								<td>
								<a href="#" class="tool-tip show-inline-md"
												data-toggle="tooltip" data-placement="bottom"
												title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases)."><img
												src="resources/images/ic.png" alt=""></a>
												</td>
							</tr>
							<tr>
								<td><label for="txtConfPass"
									class="join-us-label">Confirm password</label></td>
									<td><input type="password"
										name="confirmPassword" class="form-control" id="txtConfPass"
										placeholder="Confirm Password"> <span
										id="errorEmptyConfPass" class="text-red"></span></td>




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
					<h4 class="h4-2 padding4 declaration-head">Declaration</h4>
					
					<div class="declaration-content ">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox"> <label
							for="checkbox1"> I have read and understood  <a
						href="https://home.fwd.com.hk/giphw/FWD_Resources/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf"
						target="_blank" class="sub-link"> Personal Information Collection Statement</a> and agree to be bound by the same. 
						<hr />
						If you do NOT wish The Company to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below to exercise.
					</label>
				</div>

				<span id="chk2" class="text-red">
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
				onclick="return activateUserAccountJoinUs();">Activate</button>
			</div>
		</div>
	</div>

</form:form>
</div>
</div>
<!--/.container-->
</section>


</body>