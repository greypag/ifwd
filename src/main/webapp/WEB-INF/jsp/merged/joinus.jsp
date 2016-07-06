<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">

<script src="<%=request.getContextPath()%>/resources/js/fwd.js">
	
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
						url : '<%=request.getContextPath()%>/{language}/joinus',
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
 								if(window.top.document.referrer.indexOf("savings-insurance/plan-details-rp")>0){
 									window.location.href = '<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-rp?thankyou=thankyou';
 								}else if(window.top.document.referrer.indexOf("savings-insurance/plan-details-sp")>0){
 									window.location.href = '<%=request.getContextPath()%>/${language}/savings-insurance/plan-details-sp?thankyou=thankyou';
 								}else if(window.top.document.referrer.indexOf("term-life-insurance/select-plan")>0){
 									perventRedirect=false;
 									ga('send', 'event', 'Login', 'Click', 'Login success');
 									window.location.href= "<%=request.getContextPath()%>/${language}/term-life-insurance/select-plan?goApp=yes";
 								}else if("${quarry}" == "FNA"){
 									window.location.href = '<%=request.getContextPath()%>/${language}/FNA/financial-needs-analysis';
 								}else {
 									window.location.href = '<%=request.getContextPath()%>/${language}/account';
 								}
// 								setTimeout(function() {window.location.href = '/getAccByUsernaneAndPassword';;								
// 								}, 3000);
								
							} else if(data == 'discover'){
								window.location.href = '<%=request.getContextPath()%>/${language}/fwdiscover';
							} else {
								
								$('#joinus-err-msg').show();
								
								window.location.hash = '#joinus-err-msg';
                                if (data == 'This username already in use, please try again') {
                                    $('#joinus-err-msg').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
                                } else if (data == 'email address and mobile no. already registered') {
                                    $('#joinus-err-msg').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
                                } else {
                                    $('#joinus-err-msg').html(data);
                                }

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
						<li><fmt:message key="header.menu.home" bundle="${msg}" /></li>
						<li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="header.menu.activate.heading" bundle="${msg}" />
						</li>
					</ol>
					<!-- desktop Title-->
					<h2 class="page-title"><fmt:message key="header.menu.activate.heading" bundle="${msg}" /></h2>
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
								src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
						</div>
						<table class="table activation-form vert-middle padding4 registration">
							<tbody>
								<tr>
									<td colspan="3"><h3
											class="black-bold"><fmt:message key="member.registration.details.header" bundle="${msg}" /></h3></td>
								</tr>
								<tr>
									<td class="col-sm-3 col-lg-4 col-xs-4"><label for="txtFullName"
										class="join-us-label"><fmt:message key="member.registration.details.label.fullName" bundle="${msg}" /><br>
											<small><fmt:message key="member.registration.details.label.fullName.desc" bundle="${msg}" /></small></label></td>
									<td><input type="text"
										class="form-control" id="txtFullName" name="fullName"
										value="${userDetails.getFullName() }" placeholder="<fmt:message key="member.registration.details.label.fullName.placeholder" bundle="${msg}" />"
										onblur="replaceAlpha(this);"
	                                    onfocus="$('#errorEmptyName').html('');$(this).removeClass('invalid-field');"
										onkeypress="    return alphaOnly(event);" maxlength="100">
										<span id="errorEmptyName" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtMobileNo"
										class="join-us-label"><fmt:message key="member.registration.details.label.mobileNo" bundle="${msg}" />  </label></td>
									<td><input type="tel"
										class="form-control" id="txtMobileNo"
										value="${userDetails.getMobileNo() }" name="mobileNo"
										onfocus="$('#errorEmptyMobJoinUs').html('');$(this).removeClass('invalid-field');"
										placeholder="<fmt:message key="member.registration.details.label.mobileNo.placeholder" bundle="${msg}" />" onkeypress="return isNumeric(event)"
										onblur="replaceNumeric(this);" maxlength="8"> <span
										id="errorEmptyMobJoinUs" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtEmailId"
										class="join-us-label"><fmt:message key="member.registration.details.label.emailAddress" bundle="${msg}" /><br> <small><fmt:message key="member.registration.details.label.emailAddress.desc" bundle="${msg}" /></small>
									</label></td>
									<td><input type="email"
										class="form-control" id="txtEmailId"
										value="${userDetails.getEmailAddress() }" placeholder="<fmt:message key="member.registration.details.label.emailAddress.placeholder" bundle="${msg}" />"
                                        onfocus="$('#errorEmptyEmailIdJoinUs').html('');$(this).removeClass('invalid-field');"
										name="EmailAddress" maxlength="50"> <span
										id="errorEmptyEmailIdJoinUs" class="text-red"></span></td>
									<td></td>
								</tr>
								<tr>
									<td><label for="txtUserName"
										class="join-us-label"><fmt:message key="member.registration.details.label.username" bundle="${msg}" /></label></td>
									<td>
										
											<input type="text" class="form-control "
												id="txtUserName1" value="${userDetails.getUserName() }"
                                                onfocus="$('#errorEmptyUNameJoinUs').html('');$(this).removeClass('invalid-field');"
                                                onkeypress="return validationUsername(event);"
												placeholder="<fmt:message key="member.registration.details.label.username.placeholder" bundle="${msg}" />" name="userName">

										
											
										 <span id="errorEmptyUNameJoinUs" class="text-red"></span>
									</td>
									<td><a href="#"
												class="tool-tip show-inline-md"
												data-toggle="tooltip" data-placement="bottom"
												title="<fmt:message key="member.registration.details.label.username.help" bundle="${msg}" />"><img src="<%=request.getContextPath()%>/resources/images/ic.png"
												alt=""></a></td>
								</tr>


								<tr>
									<td><label class="join-us-label"><fmt:message key="member.registration.details.label.password" bundle="${msg}" />
									</label></td>
									<td>
											<input type="password" class="form-control" autocomplete="off"
                                                onfocus="$('#errorJoinUsPassword').html('');$(this).removeClass('invalid-field');"
												id="txtPass1" placeholder="<fmt:message key="member.registration.details.label.password.placeholder" bundle="${msg}" />" name="password">

										 <span id="errorJoinUsPassword" class="text-red"></span>
									</td>
									<td>
										<a href="#"
												class="tool-tip show-inline-md"
												data-toggle="tooltip" data-placement="bottom"
												title="<fmt:message key="member.registration.details.label.password.help" bundle="${msg}" />"><img
												src="<%=request.getContextPath()%>/resources/images/ic.png" alt=""></a>
									</td>
								</tr>

								<tr>
									<td><label for="txtConfPass"
										class="join-us-label"><fmt:message key="member.registration.details.label.confirmPassword" bundle="${msg}" /> </label></td>
									<td><input type="password" autocomplete="off"
										name="confirmPassword" class="form-control" id="txtConfPass"
                                        onfocus="$('#errorEmptyConfPass').html('');$(this).removeClass('invalid-field');"
										placeholder="<fmt:message key="member.registration.details.label.confirmPassword.placeholder" bundle="${msg}" />"> <span
										id="errorEmptyConfPass" class="text-red"></span></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="col-lg-4 col-md-4 hidden-sm hidden-xs">
						<div>
							<img src="<%=request.getContextPath()%>/resources/images/user.jpg" alt="" />
						</div>
						<h2 class="h2-1 fwd-acc"><fmt:message key="reason.item1.title" bundle="${msg}" /></h2>
						<h4 class="h4-1"><fmt:message key="reason.item1.copy" bundle="${msg}" /></h4>
					</div>

					<div class="clearfix"></div>
					<h4 class="h4-2 padding3 declaration-head"><fmt:message key="member.registration.declarations.header" bundle="${msg}" /></h4>
					<br>
					<div class="declaration-content">
						<div class="checkbox">
							<input id="checkbox1" type="checkbox"> <label
								for="checkbox1"> <fmt:message key="member.registration.declarations.PICS.part1" bundle="${msg}" /> <a
								href="<fmt:message key="member.PICS.link" bundle="${msg}" />"  target="_blank" class="sub-link"><fmt:message key="member.registration.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="member.registration.declarations.PICS.part3" bundle="${msg}" />
								<p><span id="errorDeclaration" class="text-red"></span>
								<hr />
								
									
								 <fmt:message key="member.registration.declarations.PDPO" bundle="${msg}" />
							</label>
							
						</div>
						<span id="chk2" style="display: none"> <label
							class="text-red"><fmt:message key="member.registration.declarations.PDPO.error" bundle="${msg}" /></label>
						</span>
						<div class="checkbox">
							<input id="checkbox3" name="checkbox3" type="checkbox"> <label
								for="checkbox3"><fmt:message key="member.registration.declarations.PDPO.option1" bundle="${msg}" /> <br>
							</label>
						</div>
						<div class="checkbox">
							<input id="checkbox4" name="checkbox4" type="checkbox"> <label
								for="checkbox4"><fmt:message key="member.registration.declarations.PDPO.option2" bundle="${msg}" /> <br>
								<br>
							</label>
						</div>
						<div class="checkboxBubble">
                            <fmt:message key="general.declarations.PDPO.warning" bundle="${msg}" />
                        </div>

                        <script type="text/javascript">
                        $("#checkbox1").change(function() {
                            $("#errorDeclaration").html("");
                        });

                        function showBubble(){
                            if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                                $(".checkboxBubble").fadeIn();
                            }else{
                                $(".checkboxBubble").fadeOut();
                            }
                        }
                        
                        $("#checkbox3").change(function() {
                            showBubble();
                        });
                        
                        $("#checkbox4").change(function() {
                            showBubble();
                        });
                        </script>
					</div>
					<div class="container btm-pad-10">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-lg-3 col-md-3">
	
	 <button class="bdr-curve btn btn-primary btn-lg btn-block act-btn" onclick="return activateUserAccountJoinUs();"> <fmt:message key="member.registration.activate" bundle="${msg}" />  </button>
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
