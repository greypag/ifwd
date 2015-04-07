<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body class="homepage">



	<script src="resources/js/validation.js"></script>
	<script>
		function forgotUserPassword() {

			if (forgotPassword() == true) {

				$('#ajax-loading').show();
				$
						.ajax({
							type : 'POST',
							url : 'forgotUserPassword',
							data : $('#forgotPasswordForm input').serialize(),
							success : function(data) {

								$('#ajax-loading').hide();
								if (data == 'fail') {
									$('#forgotpassword-err-msg')
											.html(
													'Provided User Account Details Does Not Exist');
									$('#forgotpassword-err-msg').show();
								} else if (data == 'success') {
									$('#success-message')
											.html(
													'Link Sent Successfully On Your Registered Mail ID');
									$('#success-message').show();
								} else {
									$('#success-message').html(
											'Internet Connection Error ');
									$('#success-message').show();
									$('#user-details-main').hide();
								}

							},
							error : function(xhr, status, error) {
								$('#ajax-loading').hide();
							}
						});
			}
		}
	</script>

	<!--/#main-Content-->
	<section id="contact-page">
		<div class="container">
			<div class="row">
				<div
					style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
					id="ajax-loading">
					<img
						style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%;"
						src="resources/images/ajax-loader.gif">
				</div>
				<form name="forgotPasswordForm" id="forgotPasswordForm"
					action="forgotPassword" method="post"
					commandName="forgotUserPassword">

					<ol class="breadcrumb pad-none">
						<li><a href="#">Home</a></li>
						<li class="active">Forgot Password !</li>
					</ol>
					<div id="hide-field"></div>
					<div id="forgotpassword-err-msg" class="alert alert-danger"
						role="alert" style="display: none;">
						<P id="error1">
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<!-- <div class="status alert alert-success" style="display: none"></div>-->
					<div id="user-details-main">
						<div class="col-sm-7 border-right">
							<table class="table activation-form">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h3
												class="black-bold pad-none">User Details</h3></td>
									</tr>

									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label">Mobile no</label></td>
										<td class="pad-none"><input type="text"
											isrequired=required name="mobileNo" class="form-control"
											id="mobileNo" placeholder="Mobile Number"
											onkeypress="return isNumeric(event)"
											onblur="replaceNumeric(this);">
											 <span	id="errorEmptyMob" style="display: none">
												<label  class="text-red">Please enter your Mobile No.</label></span> 
												<spanid="errorInvalidMob" style="display: none">
												<label	class="text-red">Please enter an 8-digit Mobile No.</label>
											</span>
										</td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label">Email address</label></td>
										<td class="pad-none"><input type="email"
											name="emailAddress" class="form-control" id="emailAddress"
											placeholder="Email"> 

												<span id="errorEmptyEmailId"style="display: none">
												  <label  class="text-red">
												 Please enter your Email Address.
												  </label>
												</span>

												<span id="errorInvalidEmailId"
												style="display: none">
												  <label  class="text-red">
												   Please enter a valid Email Address.
												  </label>
												</span>

											</td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label">Username</label></td>
										<td class="pad-none"><input type="text" name="userName"
											class="form-control" id="userName" placeholder="Username">
											<span id="errorEmptyUName" style="display: none"><label	style="color: red">Please enter your Username.</label></span>
											 	<span id="errorInvalidUName" style="display: none">
											 	<label class="text-red"> Username is invalid.</label>
											 </span>
										</td>
										<td class="width1"></td>

									</tr>
									<tr></tr>
									<tr>
										<td colspan="2">
											<!-- <button type="button" onclick="forgotPassword()"
												class="bdr-curve-none btn btn-primary btn-lg ">Submit</button> -->

											<button type="button" onclick="forgotUserPassword()"
												class="bdr-curve-none btn btn-primary btn-lg ">Submit</button>

										</td>
									</tr>
								</tbody>
							</table>



						</div>
					</div>
				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->

		</div>
	</section>