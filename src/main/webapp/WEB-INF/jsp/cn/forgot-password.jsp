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

	<!--Main Content-->
	<section>
		<div id="cn" class="container mob-pad">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a></li>
					<li class="active"><i class="fa fa-caret-right"></i> 忘記密碼</li>
				</ol>
				<h2 class="page-title">忘記密碼</h2>
				<div
					style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
					id="ajax-loading">
					<img
						style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%;"
						src="resources/images/ajax-loader.gif">
				</div>
				<div class="col-lg-7 col-md-7 col-xs-12 col-sm-12 margin-left">
					<form name="forgotPasswordForm" id="forgotPasswordForm"
						action="forgotPassword" method="post"
						commandName="forgotUserPassword">
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
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<table class="table forgot-form">
									<tbody>
										<tr>
											<td colspan="2" class="pad-none"><h3
													class="black-bold pad-none">用戶資料</h3></td>
										</tr>
										<tr>
											<td class="pad-none"><label class="control-label">手機號碼</label></td>
											<td class="pad-none"><input type="text" name="mobileNo"
												class="form-control" id="mobileNo" placeholder="手機號碼"
												onkeypress="return isNumeric(event)"
												onblur="replaceNumeric(this);"> <span
												id="errorEmptyMob" class="hide1"> <label
													class="text-red">請以數字輸入 聯絡電話 </label>
											</span> <span class="hide" id="errorInvalidMob"> <label
													class="text-red">聯絡電話需為８位數字，請重新輸入</label>
											</span></td>
										</tr>
										<tr>
											<td class="pad-none"><label class="control-label">電郵地址
											</label></td>

											<td class="pad-none"><input type="email"
												name="emailAddress" class="form-control" id="emailAddress"
												placeholder="電郵地址"> <span id="errorEmptyEmailId"
												class="hide1"> <label class="text-red">請輸入電郵地址</label>
											</span> <span id="errorInvalidEmailId" class="hide1"> <label
													class="text-red">請輸入正確/有效的 電郵地址</label>
											</span></td>

										</tr>
										<tr>
											<td class="pad-none"><label class="control-label">用戶名稱
											</label></td>
											<td class="pad-none"><input type="text" name="userName"
												class="form-control" id="userName" placeholder="用戶名稱">
												<span id="errorEmptyUName" class="hide1"> <label
													class="text-red">請輸入使用者名稱</label>
											</span> <span id="errorInvalidUName" class="hide1"> <label
													class="text-red">请输入有效的用户名</label>
											</span></td>

										</tr>
										<tr></tr>
										<tr>
											<td colspan="2">
												<!-- <button type="button" onclick="forgotPassword()"
												class="bdr-curve-none btn btn-primary btn-lg ">Submit</button> -->

												<button type="button" onclick="forgotUserPassword()"
													class="bdr-curve-none btn btn-primary btn-lg ">提交</button>

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