<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<body class="homepage">

	<!--/#main-Content-->
	<script src="resources/js/validation.js"></script>
	<script>
		function getForgotUserName() {
			var validationFormVal = forgotUserName();
			if (validationFormVal == true) {
				$('#forgotusername-err-msg').hide();
				$('#ajax-loading').show();
				$
						.ajax({
							type : 'POST',
							url : 'forgotUser',
							data : $('#forgotUserNameForm input').serialize(),
							success : function(data) {

								$('#ajax-loading').hide();
								if (data == 'fail') {
									$('#success-message')
											.html(
													'Provided User Account Details Does Not Exist');
									$('#success-message').show();
									$('#user-details-main').hide();
									$('#hide-field').hide();
								} else if (data.indexOf('~~~') > -1) {
									$('#success-message').html(
											data.slice(5, 68));
									$('#success-message').show();
									$('#user-details-main').hide();
									$('#hide-field').hide();
								} else {
									$('#success-message').html(
											'Your Username is ' + data);
									$('#success-message').show();
								}

							},
							error : function(xhr, status, error) {
								$('#ajax-loading').hide();
							}
						});
			}
		}
	</script>





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

				<form name="forgotUserNameForm" id="forgotUserNameForm"
					action="forgotUserNameFields" method="post"
					commandName="forgotUserName">

					<ol class="breadcrumb pad-none">
						<li><a href="#">Home</a></li>
						<li class="active">Forgot User Name !</li>
					</ol>
					<div id="hide-field"></div>

					<div id="forgotusername-err-msg" class="alert alert-danger"
						role="alert" style="display: none;">
						<P id="error-mobile-no">
						<P id="error-email-id">
					</div>

					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div class="col-md-7 border-right" id="user-details-main">
						<table class="table vert-middle joinus">
							<tbody>
								<tr>
									<td colspan="2"><h3
											class="black-bold pad-none">User Details</h3></td>
								</tr>
								<tr>
									<td><label
										for="inputEmail3" class="join-us-label">Mobile No</label></td>
									<td><input type="text" name="mobileNo"
										class="form-control" id="mobileNo" placeholder="Mobile No."><span
										id="errorEmptyMob" style="display: none"><label class="text-red">Please enter your Mobile No.</label></span>
										 <span id="errorInvalidMob" style="display: none">
										<label	 class="text-red">Please enter an 8-digit Mobile No.</label></span>

										</td>
								</tr>
								<tr>
									<td><label
										for="inputEmail3" class="join-us-label">Email address</label></td>
									<td><input type="email"
										name="emailAddress" class="form-control" id="emailAddress"
										placeholder="Email"><span id="errorEmptyEmailId"
										style="display: none"><label  class="text-red"> Please enter your Email Address.</label></span>
										 <span id="errorInvalidEmailId"
										style="display: none"><label class="text-red">	   Please enter a valid Email Address.</label></span></td>
								</tr>


								<tr></tr>
								<tr>
									<td colspan="2">
										<button type="button" onclick="getForgotUserName()"
											class="bdr-curve-none btn btn-primary btn-lg ">Submit</button>
									</td>
								</tr>
							</tbody>
						</table>




					</div>
					<div id="success-message"></div>

					<br>

				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->


		</div>
	</section>