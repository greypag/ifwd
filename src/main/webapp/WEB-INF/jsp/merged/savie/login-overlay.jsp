<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!--<meta name="apple-mobile-web-app-capable" content="yes" />-->
		
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/savie-styles.css">

	</head>
	<body>
		<div>
			<button class="btn btn-orange" data-toggle="modal" data-target="#login-overlay-modal">Login</button>			
		</div>
		
		<div id="login-overlay-modal" class="modal fade" role="dialog" aria-labelledby="loginoverlay" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header visible-xs visible-sm">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
						<h5>Login</h5>
					</div>
					<div class="modal-body clearfix">
						<div class="body-content-left">
							<p class="left-header">Thank you for your interest in this product</p>
							<p class="desc">Let's perform a quick <b>Financial Needs Analysis (FNA)</b> to assess your suitability! You can either log in with your existing FWD account or create one to proceed.</p>
							<img src="assets/images/savie-2016/login-family-img-desktop.png" class="visible-xs visible-sm">
							<img src="assets/images/savie-2016/login-family-img.png" class="hidden-xs hidden-sm">
						</div>
						<div class="body-content-right">
							<button type="button" class="close hidden-xs hidden-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
							<p class="right-header">Log in to FWD</p>
							<div>
								<form id="login-overlay-form" action="">
									<input type="text" class="form-control" placeholder="Username" id="username" name="username">
									<input type="password" class="form-control" placeholder="Password" id="password" name="password">
									<div class="btn-wrapper">
										<button type="submit" class="btn btn-orange savie-common-btn">Login</button>
										<!--<span>Forgot password?</span>-->
										<a href="#" class="forgot-password-link">Forgot password?</a>
									</div>
								</form>
							</div>
							<p class="info">For the purpose of purchasing a specified isurance plan through this webiste ("the Plan"), I hereby consent the transfer of my personal data from FWD eServices to the issuer of the Plan.</p>
							<div class="register-link-wrapper">New Member? <a href="#" class="register-link">Register here</a></div>
						</div>
					</div>
				</div> <!-- /.modal-content -->
			</div> <!-- /.modal-diaolog -->
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
		</script>
	</body>
</html>