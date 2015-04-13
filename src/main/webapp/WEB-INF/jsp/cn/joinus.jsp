<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>成為會員 | 富衛香港</title>
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
		if (validateFormVal == true) {
			$.ajax({
						type : 'POST',
						url : 'joinus',
						data : $('#joinus_form form').serialize(),
						async : false,
						success : function(data) {
							
							if (data == 'success') {
								
								$('#success-message').show();
								$('#joinus-err-msg').hide();
								window.location.hash = '#success-message';
								$('#success-message').html("User succesfully Register"); 
// 								setTimeout(function() {document.joinus_form.action= "useraccount";								
// 								}, 3000);
								window.location.href = 'getAccByUsernaneAndPassword';
// 								setTimeout(function() {window.location.href = '/getAccByUsernaneAndPassword';;								
// 								}, 3000);
								
								
							} else {
								alert("fail");
								$('#joinus-err-msg').show();
								alert("fail");
								window.location.hash = '#joinus-err-msg';
								$('#joinus-err-msg').html("Please check provided information is valid");

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
<body class="homepage">

	<!--   Main Content-->
	<section id="contact-page">
		<div class="container mob-pad" id="joinus_form">
			<div class="row">
				<form:form modelAttribute="userDetails" class="form-horizontal" name="joinus_form" role="form">
					<ol class="breadcrumb pad-none">
						<li><a href="#">主頁</a></li>
						<li class="active"><i class="fa fa-caret-right"></i> 啟動富衛會員帳戶
						</li>
					</ol>
					<!-- desktop Title-->
					<h2 class="page-title">啟動富衛會員帳戶</h2>
					<!-- Mobile Title-->
					<!--<div class="center hidden-lg hidden-md">
							<h2 class="page-title">FWD Account Activation</h2>
							</div>-->
					<div id="joinus-err-msg" class="alert alert-danger" role="alert"
						style="display: none;">
						<P id="error1">
					</div>
					<div id="success-message" class="alert alert-success" role="alert"
						style="display: none;">
						<P id="error1">
					</div>

					<div
						class="col-lg-7 col-md-7 col-sm-12 col-xs-12 border-right margin-left">
						<div
							style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1000"
							id="ajax-loading">
							<img
								style="width: 100px; height: 100px; position: absolute; top: 40%; left: 40%"
								src="resources/images/ajax-loader.gif">
						</div>
						<table class="table activation-form vert-middle padding4 registration">
							<tbody>
								<tr>
									<td colspan="3"><h3
											class="black-bold">會員資料</h3></td>
								</tr>
								<tr>
									<td class="col-sm-3 col-lg-4 col-xs-4"><label for="txtFullName"
										class="join-us-label">英文全名<br>
											<small>(與香港身份證號碼/ 護照號碼相同)</small></label></td>
									<td><input type="text"
										class="form-control" id="txtFullName" name="fullName"
										value="${userDetails.getFullName() }" placeholder="英文全名"
										onblur="replaceAlpha(this);"
										onkeypress="    return alphaOnly(event);" maxlength="100">
										<span id="errorEmptyName" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtMobileNo"
										class="join-us-label">手機號碼 </label></td>
									<td><input type="text"
										class="form-control" id="txtMobileNo"
										value="${userDetails.getMobileNo() }" name="mobileNo"
										placeholder="手機號碼" onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8"> <span
										id="errorEmptyMob" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtEmailId"
										class="join-us-label">電郵地址<br> <small>(保險證書將發送到 此電郵地址)</small>
									</label></td>
									<td><input type="email"
										class="form-control" id="txtEmailId"
										value="${userDetails.getEmailAddress() }" placeholder="電郵地址"
										name="EmailAddress" maxlength="50"> <span
										id="errorEmptyEmailId" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtUserName"
										class="join-us-label">登入名稱</label> <a href="#"
										class="pull-right tool-tip show-inline-xs"
										data-toggle="tooltip" data-placement="bottom"
										title="用戶名稱必須是6至50個字元"><img src="resources/images/ic.png"
											alt=""></a></td>
									<td>
										
											<input type="text" class="form-control "
												id="txtUserName1" value="${userDetails.getUserName() }"
												placeholder="登入名稱" name="userName">

										
											
										 <span id="errorEmptyUName" class="text-red"></span>
									</td>
									<td><a href="#"
												class="tool-tip show-inline-md"
												data-toggle="tooltip" data-placement="bottom"
												title="用戶名稱必須是6至50個字元"><img src="resources/images/ic.png"
												alt=""></a></td>
								</tr>


								<tr>
									<td><label class="join-us-label">密碼
									</label> <a href="#"
										class="pull-right tool-tip show-inline-xs"
										data-toggle="tooltip" data-placement="bottom"
										title="密碼字元至少8位數，必須包含字母（大楷及小楷﹚及數字"> <img
											src="resources/images/ic.png" alt=""></a></td>
									<td>
											<input type="password" class="form-control"
												id="txtPass1" placeholder="密碼" name="password">

										 <span id="errorJoinUsPassword" class="text-red"></span>
									</td>
									<td>
										<a href="#"
												class="tool-tip show-inline-md"
												data-toggle="tooltip" data-placement="bottom"
												title="密碼字元至少8位數，必須包含字母（大楷及小楷﹚及數字"><img
												src="resources/images/ic.png" alt=""></a>
									</td>
								</tr>

								<tr>
									<td><label for="txtConfPass"
										class="join-us-label">確認密碼 </label></td>
									<td><input type="password"
										name="confirmPassword" class="form-control" id="txtConfPass"
										placeholder="確認密碼"> <span
										id="errorEmptyConfPass" class="text-red"></span></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
						<div>
							<img src="resources/images/user.jpg" alt="" />
						</div>
						<h2 class="h2-1 fwd-acc">為何要建立會員帳戶？</h2>
						<h4 class="h4-1">享受全年不同優惠及推薦計劃獎賞。</h4>
					</div>

					<div class="clearfix"></div>
					<h4 class="h4-2 padding3 declaration-head">聲明</h4>
					<br>
					<div class="declaration-content">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox"> <label
								for="checkbox1"> 本人已參閱及明白"<a
								href="http://fwd.com.hk/zh-HK/home/pdo.html" class="sub-link">收集個人資料聲明</a>"，並同意接受其約束。
								
								<hr />
								若閣下不希望本公司使用閣下的個人資料，或將閣下的個人資料提供予其他人士或公司作直接促銷用途，請剔以下有關方格，藉以行使閣下不同意此項安排的權利。 
							</label>
						</div>
						<span id="chk2" style="display: none"> <label
							class="text-red">遞交申請表前，請閱讀及接受收集個人資料聲明</label>
						</span>
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3">請不要將直接促銷資料發給本人。 <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4" type="checkbox"> <label
								for="checkbox4">請不要將本人的個人資料提供予其他人士或公司作其直接促銷用途。 <br>
								<br>
							</label>
						</div>
					</div>
					<div class="container btm-pad-10">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-lg-3 col-md-3">
	
	 <button class="bdr-curve btn btn-primary btn-lg btn-block act-btn" onclick="return activateUserAccountJoinUs();"> 啟動  </button>
							</div>
						</div>
					</div>
					<!--/.row-->

				</form:form>
			</div>
		</div>
		<!--/.container-->
	</section>

</body>
y>
