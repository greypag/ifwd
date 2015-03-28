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
		
		
		alert(joinus_form);
		var validateFormVal = validateJoinUsForm();
		if (validateFormVal == true) {
			$.ajax({
						type : 'POST',
						url : 'joinus',
						data : $('#joinus_form form').serialize(),
						async : false,
						success : function(data) {
							
							if (data == 'valid') {
								alert("success");
								$('#success-message').show();
								$('#joinus-err-msg').hide();
								window.location.hash = '#success-message';
								$('#success-message').html("User succesfully Register"); 
								setTimeout(function() {document.joinus_form.action= "useraccount";
								
								}, 3000);

							} else if (data == 'false') {
								alert("fail");
								$('#joinus-err-msg').show();
								alert("fail");
								window.location.hash = '#joinus-err-msg';
								$('#joinus-err-msg').html("Please check provided information is valid");

							} else {
								alert("else");
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
<body class="homepage">

	<!--   Main Content-->
	<section id="contact-page">
		<div class="container mob-pad" id="joinus_form">
			<div class="row">
				<form:form modelAttribute="userDetails" class="form-horizontal" name="joinus_form" role="form">
					<ol class="breadcrumb pad-none">
						<li><a href="#">主頁</a></li>
						<li class="active"><i class="fa fa-caret-right"></i> 建立富衛會員帳戶
						</li>
					</ol>
					<!-- desktop Title-->
					<h2 class="page-title">建立富衛會員帳戶</h2>
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
						<table class="table activation-form">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h3
											class="black-bold pad-none">用戶資料</h3></td>
								</tr>
								<tr>
									<td class="col-sm-4  pad-none"><label for="txtFullName"
										class="control-label">個人全名 </label></td>
									<td class="pad-none"><input type="text"
										class="form-control" id="txtFullName" name="fullName"
										value="${userDetails.getFullName() }" placeholder="個人全名"
										onblur="replaceAlpha(this);"
										onkeypress="    return alphaOnly(event);" maxlength="100">
										<span id="errorEmptyName" style="display: none"><label
											class="text-red">請輸入 姓名 和 請以英文輸入</label></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtMobileNo"
										class="control-label">手提電話 </label></td>
									<td class="pad-none"><input type="text"
										class="form-control" id="txtMobileNo"
										value="${userDetails.getMobileNo() }" name="mobileNo"
										placeholder="手提電話" onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8"> <span
										id="errorEmptyMob" style="display: none"><label
											class="text-red">請輸入 聯絡電話</label></span> <span id="errorInvalidMob"
										style="display: none"><label class="text-red">聯絡電話需為８位數字，請重新輸入</label></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtEmailId"
										class="join-us-label">電郵地址<br> <small>(保險證書將發送到此電郵地址)</small>
									</label></td>
									<td class="pad-none"><input type="email"
										class="form-control" id="txtEmailId"
										value="${userDetails.getEmailAddress() }" placeholder="電郵地址"
										name="EmailAddress" maxlength="50"> <span
										id="errorEmptyEmailId" style="display: none"><label
											class="text-red">請輸入電郵地址</label></span> <span
										id="errorInvalidEmailId" style="display: none"><label
											class="text-red">>請輸入正確/有效的 電郵地址</label></span></td>
								</tr>
								<tr>
									<td class="pad-none"><label for="txtUserName"
										class="control-label">登入名稱</label> <a href="#"
										class="pull-right tool-tip hidden-lg hidden-md top-pad-10"
										data-toggle="tooltip" data-placement="bottom"
										title="用戶名稱必須最少有6位數 "><img src="resources/images/ic.png"
											alt=""></a></td>
									<td class="pad-none">
										<div class="pull-left acc-tool-input-div">
											<input type="text" class="form-control acc-tool-input"
												id="txtUserName" value="${userDetails.getUserName() }"
												placeholder="登入名稱" name="userName">
										</div>
										<div class="pull-left acc-tool-tip-div">
											<a href="#"
												class="pull-right tool-tip hidden-sm hidden-xs top-pad-10"
												data-toggle="tooltip" data-placement="bottom"
												title="用戶名稱必須最少有6位數 "><img src="resources/images/ic.png"
												alt=""></a>
										</div> <span id="errorEmptyUName" style="display: none"><label
											class="text-red">請輸入使用者名稱</label></span> <span
										id="errorInvalidUName" style="display: none"><label
											class="text-red">請輸入正確使用者名稱及</label></span>
									</td>
								</tr>


								<tr>
									<td class="pad-none"><label class="control-label">密碼
									</label> <a href="#"
										class="pull-right tool-tip hidden-lg hidden-md top-pad-10"
										data-toggle="tooltip" data-placement="bottom"
										title="密碼字元最少8位數，必須包含字母（大楷及小楷）及數字"> <img
											src="resources/images/ic.png" alt=""></a></td>
									<td class="pad-none">
										<div class="pull-left acc-tool-input-div">
											<input type="password" class="form-control acc-tool-input"
												id="txtPass" placeholder="密碼" name="password">
										</div>
										<div class="pull-left acc-tool-tip-div">
											<a href="#"
												class="pull-right tool-tip hidden-sm hidden-xs top-pad-10"
												data-toggle="tooltip" data-placement="bottom"
												title="密碼字元最少8位數，必須包含字母（大楷及小楷）及數字"><img
												src="resources/images/ic.png" alt=""></a>
										</div> <span id="errorJoinUsPassword"></span>
									</td>
								</tr>

								<tr>
									<td class="pad-none"><label for="txtConfPass"
										class="control-label">確認密碼 </label></td>
									<td class="pad-none"><input type="password"
										name="confirmPassword" class="form-control" id="txtConfPass"
										placeholder="確認密碼
											"> <span
										id="errorEmptyConfPass" style="display: none"> <label
											class="text-red">請輸入確認密碼</label>
									</span> <span id="errorValidConfPass" style="display: none"> <label
											class="text-red">請輸入正確使 稱及密碼</label>
									</span></td>
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
					<h4 class="h4-2 padding3">個人聲明</h4>
					<br>
					<div class="declaration-content">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox"> <label
								for="checkbox1"> 本人（等）在此聲明:- <br> i. <span
								class="margin-left-2"></span>聲明上列資料及本人所知一切據實填報 ; <br> ii. <span
								class="margin-left-2"></span>
								聲明並據實相信各受保人絕不會違反醫生的囑咐或僅為獲醫療而外出旅遊。本人更清楚明白任何現已存在之疾病、現有、不時復發或先天疾病皆不在承保之列。本人保證已對安排而又必須取消或縮短旅程之事絕不知情;及
								<br> iii. <span class="margin-left-2"></span>同意此申請書及聲明將構成本人與富衛之間的合約根據。
							</label>
						</div>
						<span id="chk1" style="display: none"> <label
							class="text-red">遞交申請表前，請閱讀及接受聲明、條款及細則</label>
						</span>
						<div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2">本人已參閱及明白"收集個人資料聲明"， <a
								href="http://fwd.com.hk/en-US/home/pdo.html" class="sub-link">並同意接受其約束。</a>
								<br> <br>
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
	
	 <button class="bdr-curve btn btn-primary btn-lg btn-block act-btn" onclick="return activateUserAccount();"> 建立  </button>
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
