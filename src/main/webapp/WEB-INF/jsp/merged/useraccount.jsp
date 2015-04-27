<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<%@page import="com.ifwd.fwdhk.model.PurchaseHistory"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

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




<script>
	function updateUserAccount() {
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/updateUserAccount',
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
				<li><a href="#"><fmt:message key="menu.home" bundle="${msg}" /></a></li>
				<li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="menu.member.account" bundle="${msg}" /></li>
			</ol>
			<h2 class="page-title"><fmt:message key="member.account.title" bundle="${msg}" /></h2>
			<!-- <div class="status alert alert-success" style="display: none"></div>-->
			<div class="wd2 bdr account-block">

				<div class="col-md-4 pad-none gry-bg clearfix">
					<nav class="nav-sidebar hidden-xs hidden-sm">
						<ul class="nav tabs" id="tab-dropdown">
							<li class="active"><a href="#tab1" data-toggle="tab"><fmt:message key="member.account.tab.details" bundle="${msg}" /></a></li>
							<li class=""><a href="#tab2" data-toggle="tab"><fmt:message key="member.account.tab.purchaseHistory" bundle="${msg}" /></a></li>
							<li class=""><a href="#tab3" data-toggle="tab"><fmt:message key="member.account.tab.promotionCode" bundle="${msg}" /></a></li>
						</ul>
					</nav>
					<div class="btn-group account-dropdown hidden-md hidden-lg clearfix">
					  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					    <span class="button-text"><fmt:message key="member.account.tab.details" bundle="${msg}" /></span> <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu">
					    <li class="active"><a href="#tab1" data-toggle="tab"><fmt:message key="member.account.tab.details" bundle="${msg}" /></a></li>
					    <li><a href="#tab2" data-toggle="tab"><fmt:message key="member.account.tab.purchaseHistory" bundle="${msg}" /></a></li>
					    <li><a href="#tab3" data-toggle="tab"><fmt:message key="member.account.tab.promotionCode" bundle="${msg}" /></a></li>
					  </ul>
					</div>
				</div>
				<div class="col-sm-8 pull-right" style="display: none;">
					<form:form modelAttribute="userDetails" name="userAcccountForm" id="userAcccountForm">
						<table class="table acc-form">
							<tbody>
								<tr>
									<td colspan="2" class=""><h2 class="black-bold pad-none">Member Details</h2></td>
								</tr>
								<tr>
									<td valign="middle" class="col-sm-4 "><label
										for="fullName" class="control-label">Full name</label></td>
									<td class=""><input type="text"
										class="form-control" id="fullName" name="fullName"
										value="${userDetails.getFullName() }" placeholder="Full name" />"></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label for="mobileNo"
										class="control-label">Mobile no</label></td>
									<td class=""><input type="text"
										class="form-control" id="mobileNo" name="mobileNo"
										value="${userDetails.getMobileNo() }"
										placeholder="Mobile number"></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label
										for="emailAddress" class="control-label">Email address</label></td>
									<td class=""><input type="email"
										class="form-control" id="emailAdderss" name="emailAddress"
										value="${userDetails.getEmailAddress() }"
										placeholder="Email address"></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label for="userName"
										class="control-label">Username</label></td>
									<td class=""><input type="text"
										value="${userDetails.getUserName() }" class="form-control"
										id="userName" placeholder="Username" name="userName"></td>
									<td class="width1"><a href="#" data-toggle="tooltip"
										data-placement="bottom"
										title="Username must be between 6 and 50 characters. ">
											<img src="<%=request.getContextPath()%>/resources/images/ic.png">
									</a></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label for="password"
										class="control-label">Password</label></td>
									<td class=""><input type="password" autocomplete="off"
										name="password" id="password" class="form-control"
										id="inputEmail3" placeholder="Password"></td>
									<td class="width1"><a href="#" data-toggle="tooltip"
										data-placement="bottom"
										title="Password must be at least 8 characters and alphanumeric (both upper AND lower cases). ">
											<img src="<%=request.getContextPath()%>/resources/images/ic.png">
									</a></td>
								</tr>
								<tr>
									<td valign="middle" class=""><label
										for="confirmPassword" class="control-label">Confirm
											password</label></td>
									<td class=""><input type="password"
										class="form-control" id="confirmPassword" autocomplete="off"
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
				<div class="tab-content col-md-8">
					<div class="tab-pane text-style active padding3" id="tab1">
						<form:form name="userAcccountForm" id="userAcccountForm" modelAttribute="userDetails">
							<table class="table acc-form">
								<tbody>
									<tr>
										<td colspan="2" class="pad-none"><h2 class="black-bold pad-none"><fmt:message key="member.account.details.header" bundle="${msg}" /></h2></td>
									</tr>
									<tr>
										<td valign="middle" class="col-sm-4 ">
											<label for="inputEmail3" class="control-label h4-4-b"><fmt:message key="member.account.details.label.fullName" bundle="${msg}" /></label></td>
										<td class=""><input type="text"
											class="form-control" id="fullName" name="fullName"
											disabled="disabled" value="${userDetails.getFullName() }"
											placeholder="<fmt:message key="member.account.details.label.fullName" bundle="${msg}" />"></td>
									</tr>
									<tr>
										<td valign="middle" class="">
											<label for="inputEmail3" class="control-label h4-4-b"><fmt:message key="member.account.details.label.mobileNo" bundle="${msg}" /></label></td>
										<td class=""><input type="text"
											class="form-control" id="mobileNo" name="mobileNo"
											value="${userDetails.getMobileNo() }" disabled="disabled"
											placeholder="<fmt:message key="member.account.details.label.mobileNo" bundle="${msg}" />"></td>
									</tr>
									<tr>
										<td valign="middle" class="">
											<label for="inputEmail3" class="control-label h4-4-b"><fmt:message key="member.account.details.label.emailAddress" bundle="${msg}" /></label></td>
										<td class=""><input type="email"
											class="form-control" id="emailAdderss" name="emailAddress"
											value="${userDetails.getEmailAddress() }" disabled="disabled"
											placeholder="<fmt:message key="member.account.details.label.emailAddress" bundle="${msg}" />"></td>
									</tr>
									<tr>
										<td valign="middle" class="">
											<label for="inputEmail3" class="control-label h4-4-b"><fmt:message key="member.account.details.label.Username" bundle="${msg}" /></label></td>
										<td class=""><input type="text"
											disabled="disabled" value="${userDetails.getUserName() }"
											class="form-control" id="userName" placeholder="<fmt:message key="member.account.details.label.Username" bundle="${msg}" />"
											name="userName"> 
											<!-- <a href="#" data-toggle="tooltip" data-placement="bottom" 
   title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="<%=request.getContextPath()%>/resources/images/ic.png"> </a> -->
   										</td>
									</tr>
									<!-- <tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Password</label></td>
										<td class="pad-none"><input type="password"
											name="password" id="password" class="form-control"
											id="inputEmail3" placeholder="Password"> <a href="#" data-toggle="tooltip" data-placement="bottom" 
   title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="<%=request.getContextPath()%>/resources/images/ic.png"> </a></td>
									</tr>
									<tr>
										<td valign="middle" class="pad-none"><label
											for="inputEmail3" class="control-label h4-4-b">Confirm
												password</label></td>
										<td class="pad-none"><input type="password"
											class="form-control" id="confirmPassword"
											name="confirmPassword" placeholder="Confirm Password"></td> 
									</tr>  -->
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
<!-- 								<tr> -->
<!-- 									<td class="pad-none"><h2 class="black-bold ">Purchase History</h2></td> -->
<!-- 									<td colspan="2" class="pad-none pull-left"> -->
										<!-- <button
											type="button" class="btn btn-default claim-form">Download
											Claim Form</button> -->
<!-- 									</td> -->

<!-- 								</tr> -->

								<tr>
									<!-- TODO, get product type from API -->
									<td class="pad-none"><h2 class="black-bold ">TravelCare Insurance</h2></td> <!-- <span class="h2-claim"></span> -->
									<td class="pad-none sub-link">
										<!-- <a href="#">View Policy</a> -->
									</td>
								</tr>
								<tr>
									<td class="pad-none h4-5"><fmt:message key="member.account.purchaseHistory.travelCare.label.referenceNo" bundle="${msg}" />
									<%out.print(purchaseHistory.getPolicyNumber());%></td>
									<td class="pad-none sub-link"><a href="#"> <!--  Download
											Policy -->
									</a></td>
								</tr>
								<tr>
									<td class="pad-none h4-5"><fmt:message key="member.account.purchaseHistory.travelCare.label.datePurchase" bundle="${msg}" /> <%
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
						

						<%
							}
						%>

					</div>
					<div class="tab-pane text-style padding3 " id="tab3">
						<table class="table purchase-history  ">
							<tbody>
								<tr>
									<td class="pad-none"><h2 class="black-bold "><fmt:message key="member.account.promotionCode.share.header" bundle="${msg}" /></h2></td>
								</tr>
								<tr>
									<td><p>
											<fmt:message key="member.account.promotionCode.share.message.header" bundle="${msg}" /><span class="h2-1">
												${userDetails.getReferralCode()}</span><br> <fmt:message key="member.account.promotionCode.share.message.body" bundle="${msg}" />
										</p> <img src="<%=request.getContextPath()%>/resources/images/agoda.png" alt=""
										class="text-center col-xs-offset-3" /></td>
								</tr>
								<tr>
									<td><h3 class="h4-3-b"><fmt:message key="member.account.promotionCode.share.social.message.header" bundle="${msg}" /></h3></td>
								</tr>
								<tr>

									<td class=" gry-bg1 text-center" id="toBeCopied">
										<%-- <a
										class="padding6 h4-5-b " href="">${userDetails.getReferralLink()}</a>
										<input type="hidden" value="${userDetails.getReferralLink()}"
										name="box-content" id="box-content"> --%>
										
										<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/home?promo=<%=session.getAttribute("myReferralCode")%>
										
										
									</td>

								</tr>
								<tr>
									<td class="pad-none" colspan="2">
										<div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied">Copy Link</div>
										<div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/home/sharing/	" data-title="iFWD"></div>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="declaration-content1">
							<b><span class="orange-star">*</span><fmt:message key="member.account.promotionCode.share.termsAndConditions.message.header" bundle="${msg}" /></b>
							<p>
								<fmt:message key="member.account.promotionCode.share.termsAndConditions.message.details" bundle="${msg}" />
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
	<!-- Go to www.addthis.com/dashboard to customize your tools -->
	<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
	<!--End of addthis -->
</body>
</html>