<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<script src="resources/js/validation.js">
</script>

<script>
	function resetPassword() {

		var validateFormVal = checkpassword();
		alert(validateFormVal);
		if (validateFormVal == true) {

			$
					.ajax({
						type : 'POST',
						url : 'SaveNewPassword',
						data : $('#resetNewPasswordForm input').serialize(),
						success : function(data) {
							/* success-message */

							/* if (data == 'success') {
								$('#success-message').show();
								$('#success-message').html(
										"User succesfully Register");
								setTimeout(function() {
									window.location.pathname = "FWDHKPH1A/";
								}, 3000);
							} else if (data == 'errorMessage') {
								$('#joinus-err-msg').show();
								$('#joinus-err-msg')
										.html(
												"User with same Email Address already Register");

							}

							else {
								$('#joinus-err-msg').show();
								$('#joinus-err-msg').html(data);
							} */
							
							
						},
						error : function(xhr, status, error) {

						}
					});

		}
	}
</script>
<body class="homepage">

	<!--/#main-Content-->


	<section id="contact-page">
		<div class="container">
			<div class="row">
				<form action="SaveNewPassword" name="resetNewPasswordForm"
					id="resetNewPasswordForm">
					<ol class="breadcrumb pad-none">
						<li><a href="#">Home</a></li>
						<li class="active">Forgot User Name !</li>
					</ol>

					<div id="forgotpassword-err-msg" class="alert alert-danger"
						role="alert" style="display: none;">
						<P id="error-password">
						<P id="error-confirm-password">
						
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
						
					</div>

					<div class="col-sm-7 border-right">
						<table class="table activation-form">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">User Details</h3></td>
											<input type="hidden" name="emailId" value=<%=request.getAttribute("emailId")%>>
								</tr>


								<tr>
									<td valign="middle" class="pad-none"><label
										for="inputEmail3" class="control-label">Password</label></td>
									<td class="pad-none"><input type="password"
										name="Password" class="form-control" id="passsword"
										placeholder="Password"></td>
									<td class="width1">
									<!-- <a href="#" data-toggle="tooltip"
										data-placement="bottom"
										title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id ">
											<img src="resources/images/ic.png">
									</a> --></td>

								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="inputEmail3" class="control-label">Confirm
											password</label></td>
									<td class="pad-none"><input type="password"
										name="RePassword" class="form-control" id="confirmPassword"
										placeholder="Password"></td>
								</tr>
								<tr></tr>
							</tbody>
						</table>

						<button onclick="resetPassword()"
							class="bdr-curve-none btn btn-primary btn-lg ">Submit</button>
					</div>


					<br>

				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->

		</div>
	</section>