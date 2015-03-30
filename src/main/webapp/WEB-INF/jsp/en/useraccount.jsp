<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%@page import="com.ifwd.fwdhk.model.PurchaseHistory"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member account details | FWD Hong Kong</title>
</head>

<!--Tooltip-->
<script src="js/jquery.min.js"></script>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<!--END-tooltip-->

<!-- Google
Tag Manager -->
<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTMK7TX8B"
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
	})(window, document, 'script', 'dataLayer', 'GTMK7TX8B');
</script>

<!--END -Google Code for SEO-->


<script>
	function updateUserAccount() {
		$.ajax({
			type : 'POST',
			url : 'updateUserAccount',
			data : $('#userAcccountForm input').serialize(),
			success : function(data) {
				/* success-message */
				if (data == 'success') {
					$('#success-message').show();
					$('#success-message').html(
							"User details succesfully updated");
				}
			},
			error : function(xhr, status, error) {
			}
		});
	}
</script>
<body class="homepage">
	<section id="contact-page">
	<div class="container ">
		<div class="row">
			<ol class="breadcrumb pad-none">
				<li><a href="#">Home</a></li>
				<li class="active"><i class="fa fa-caret-right"></i> FWD Member Account</li>
			</ol>
			<h2 class="page-title">FWD Member Account</h2>
			<!-- <div class="status alert alert-success" style="display: none"></div>-->
			<div class="wd2 bdr">

				<div class="col-lg-4 pad-none gry-bg">
					<nav class="nav-sidebar">
					<ul class="nav tabs">
						<li class="active"><a href="#tab1" data-toggle="tab">Member Details</a></li>
						<li class=""><a href="#tab2" data-toggle="tab">Purchase
								History</a></li>
						<li class=""><a href="#tab3" data-toggle="tab">Promotion
								Code</a></li>
					</ul>
					</nav>
				</div>

				<div class="col-sm-8 pull-right" style="display: none;">
					<form:form modelAttribute="userDetails" name="userAcccountForm"
						id="userAcccountForm">
						<table class="table acc-form">
							<tbody>
								<tr>
									<td colspan="2" class="pad-none"><h2
											class="black-bold pad-none">Member Details</h2></td>
								</tr>
								<tr>
									<td valign="middle" class="col-sm-4 pad-none"><label
										for="fullName" class="control-label">Full name</label></td>
									<td class="pad-none"><input type="text"
										class="form-control" id="fullName" name="fullName"
										value="${userDetails.getFullName() }" placeholder="Full name"></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label for="mobileNo"
										class="control-label">Mobile no</label></td>
									<td class="pad-none"><input type="text"
										class="form-control" id="mobileNo" name="mobileNo"
										value="${userDetails.getMobileNo() }"
										placeholder="Mobile number"></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="emailAddress" class="control-label">Email address</label></td>
									<td class="pad-none"><input type="email"
										class="form-control" id="emailAdderss" name="emailAddress"
										value="${userDetails.getEmailAddress() }"
										placeholder="Email address"></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label for="userName"
										class="control-label">Username</label></td>
									<td class="pad-none"><input type="text"
										value="${userDetails.getUserName() }" class="form-control"
										id="userName" placeholder="Username" name="userName"></td>
									<td class="width1"><a href="#" data-toggle="tooltip"
										data-placement="bottom"
										title="Username must be between 6 and 50 characters. ">
											<img src="resources/images/ic.png">
									</a></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label for="password"
										class="control-label">Password</label></td>
									<td class="pad-none"><input type="password"
										name="password" id="password" class="form-control"
										id="inputEmail3" placeholder="Password"></td>
									<td class="width1"><a href="#" data-toggle="tooltip"
										data-placement="bottom"
										title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases). ">
											<img src="resources/images/ic.png">
									</a></td>
								</tr>
								<tr>
									<td valign="middle" class="pad-none"><label
										for="confirmPassword" class="control-label">Confirm
											password</label></td>
									<td class="pad-none"><input type="password"
										class="form-control" id="confirmPassword"
										name="confirmPassword" placeholder="Confirm Password"></td>
								</tr>
							</tbody>
						</table>


						<h4 class="h4-2 padding5">Declaration</h4>
						<br>
						<div class="declaration-content1">
							<div class="checkbox">
								<input id="checkbox1" type="checkbox"> <label
									for="checkbox1">I have read and understood the above <a
									href="#" class="sub-link-underline">Terms and Conditions</a>
									and "Personal Information Collection Statement" and agree to be
									bound by the same.
								</label>
							</div>
							<div class="checkbox">
								<input id="checkbox2" type="checkbox"> <label
									for="checkbox2"> If you do NOT wish The Company to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below to exercise </label>
							</div>



						</div>

						<input type="button"
							class="bdr-curve-none btn btn-primary btn-lg "
							value="Update User Account" onclick="updateUserAccount()"
							tabindex="11" />
						<BR>
						<BR>

					</form:form>


				</div>

				<!-- tab content -->
				<div class="tab-content col-lg-8">
					<div class="tab-pane text-style active padding3" id="tab1">
						<form:form name="userAcccountForm" id="userAcccountForm"
							modelAttribute="userDetails">
							<table class="table acc-form">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h2
												class="black-bold pad-none">Member Details</h2></td>
									</tr>
									<tr>
										<td valign="middle" class="col-sm-4 pad-none "><label
											for="inputEmail3" class="control-label h4-4-b">Full
												name</label></td>
										<td class="pad-none"><input type="text"
											class="form-control" id="fullName" name="fullName"
											disabled="disabled" value="${userDetails.getFullName() }"
											placeholder="Full name"></td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Mobile
												no</label></td>
										<td class="pad-none"><input type="text"
											class="form-control" id="mobileNo" name="mobileNo"
											value="${userDetails.getMobileNo() }" disabled="disabled"
											placeholder="Mobile Number"></td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Email
												address</label></td>
										<td class="pad-none"><input type="email"
											class="form-control" id="emailAdderss" name="emailAddress"
											value="${userDetails.getEmailAddress() }" disabled="disabled"
											placeholder="Email address"></td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Username</label></td>
										<td class="pad-none"><input type="text"
											disabled="disabled" value="${userDetails.getUserName() }"
											class="form-control" id="userName" placeholder="Username"
											name="userName"> <!-- <a href="#" data-toggle="tooltip" data-placement="bottom" 
   title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="resources/images/ic.png"> </a> --></td>
									</tr>
									<!-- <tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Password</label></td>
										<td class="pad-none"><input type="password"
											name="password" id="password" class="form-control"
											id="inputEmail3" placeholder="Password"> <a href="#" data-toggle="tooltip" data-placement="bottom" 
   title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="resources/images/ic.png"> </a></td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Confirm
												password</label></td>
										<td class="pad-none"><input type="password"
											class="form-control" id="confirmPassword"
											name="confirmPassword" placeholder="Confirm Password"></td> -->
									</tr>
								</tbody>
							</table>
							<!-- <h4 class="h4-2 padding5">Declaration</h4>
							<br>

							<div class="declaration-content1">
								<div class="checkbox">
									<input id="checkbox1" type="checkbox"> <label
										for="checkbox1 " class="h4-3">I have read and
										understood the above <a href="#" class="sub-link">Terms
											and Conditions</a> and "Personal Information Collection
										Statement" and agree to be bound by the same.
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox2" type="checkbox"> <label
										for="checkbox2" class="h4-3"> If you do NOT wish FWD
										Life Insurance Company (Bermuda) Limited to use Your Personal
										Data in direct marketing or provide Your Personal Data to
										other persons or companies for their use in direct marketing.
										Please tick the appropriate box(es) below to excercise your
										opt-out right. Please do not send direct marketing information
										to me. </label>
								</div>
							</div>
							<button type="button"
								class="bdr-curve-none btn btn-primary btn-lg"
								value="Update User Account" onclick="updateUserAccount()"
								tabindex="11">Update Account</button> -->
						</form:form>
					</div>


					<div class="tab-pane text-style pad-none" id="tab2">

						<%
							ArrayList al = (ArrayList) request.getAttribute("al");
							Iterator itr = al.iterator();
							while (itr.hasNext()) {
								PurchaseHistory purchaseHistory = (PurchaseHistory) itr.next();
						%>
						<table class="table purchase-history marg-left">
							<tbody>
								<tr>
									<td class="pad-none"><h2 class="black-bold ">Purchase
											History</h2></td>
									<td colspan="2" class="pad-none pull-left">
										<!-- <button
											type="button" class="btn btn-default claim-form">Download
											Claim Form</button> -->
									</td>

								</tr>

								<tr>
									<td class="pad-none"><span class="h2-claim">TravelCare
											Insurance </span></td>
									<td class="pad-none sub-link">
										<!-- <a href="#">View Policy</a> -->
									</td>
								</tr>
								<tr>
									<td class="pad-none h4-5">Reference number : <%
										out.print(purchaseHistory.getPolicyNumber());
									%></td>
									<td class="pad-none sub-link"><a href="#"> <!--  Download
											Policy -->
									</a></td>
								</tr>
								<tr>
									<td class="pad-none h4-5">Date of purchase : <%
										out.print(purchaseHistory.getSubmissionDate());
									%><br></td>
									<td class="pad-none sub-link">
										<!-- <a href="#"> Claim
											Procedure</a> -->
									</td>
								</tr>

							</tbody>
						</table>
						<%-- <%
						out.print(purchaseHistory.getAmount());
						out.print(purchaseHistory.getPlanCode());						
						
						%>	 --%>
						<br> <br>

						<%
							}
						%>

					</div>
					<div class="tab-pane text-style padding3 " id="tab3">
						<table class="table purchase-history  ">
							<tbody>
								<tr>
									<td class="pad-none"><h2 class="black-bold ">Share</h2></td>
								</tr>
								<tr>
									<td><p>
											Your unique promotion code is:<span class="h2-1">
												${userDetails.getReferralCode()}</span><br> Share with your
											friends and get discounts from our partners!
										</p> <img src="resources/images/agoda.png" alt=""
										class="text-center col-xs-offset-3" /></td>
								</tr>
								<tr>
									<td><h3 class="h4-3-b">Share your promotion code now
											to earn discounts and rewards</h3></td>
								</tr>
								<tr>

									<td class=" gry-bg1 text-center">
										<%-- <a
										class="padding6 h4-5-b " href="">${userDetails.getReferralLink()}</a>
										<input type="hidden" value="${userDetails.getReferralLink()}"
										name="box-content" id="box-content"> --%>
									</td>

								</tr>
								<tr>
									<td class="pad-none" colspan="2">
										<!-- <input type="button"
										id="copy" name="copy" onclick="copy();"
										class="copy-link pull-left" value="Copy Link" /> --> <a
										href="#">
											<div class="fb1 pull-left">
												<i class="fa fa-facebook fa-2x"></i>
											</div>
									</a> <a href="#">
											<div class="twi1 pull-left">
												<i class="fa fa-twitter fa-2x"></i>
											</div>
									</a> <a href="#">
											<div class="gplus1 pull-left">
												<i class="fa fa-google-plus fa-2x"></i>
											</div>
									</a>
										<div class="col-lg-4 text-center line-hei ">
											<h4 class="sub-link-underline">Other sharing options</h4>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="declaration-content1">
							<b><span class="orange-star">*</span> Terms & Conditions of
								Referral Offer</b>
							<p>
								Referral offers only applicable when one or more of your
								referrals successfully purchase a TravelCare travel Insurance
								policy with FWD.<br> Details of the promotion code to
								redeem your partner offer will be provided in your confirmation
								email.
							</p>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

		</div>
		<!--/.row-->
	</div>

	<!--/.container--> </section>
	<script type="text/javascript">
		function copy() {

			//create client
			var clip = new ZeroClipboard.Client();
			//event
			clip.addEventListener('mousedown', function() {
				clip.setText(document.getElementById('box-content').value);
			});
			clip.addEventListener('complete', function(client, text) {
				alert('copied: ' + text);
			});
			//glue it to the button
			clip.glue('copy');
		}
	</script>

</body>
</html>