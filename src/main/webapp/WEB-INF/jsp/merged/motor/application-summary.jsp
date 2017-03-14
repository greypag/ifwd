<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>


<!--Body-->



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css"
	type="text/css">
<style type="text/css" media="all">
.registerPanel .panel-heading {
	padding-top: 20px;
	padding-bottom: 20px;
}

.closeForm {
	position: absolute;
	z-index: 9;
	right: 20px;
	top: 0;
	cursor: pointer;
}

#forgotUserPassPopup .panel-body, #forgotUserNamePopup .panel-body {
	padding-top: 0 !important;
}

#forgotUserPassPopup, #forgotUserNamePopup {
	background-color: #f2f2f2;
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
}

#forgetPassform h3, #forgetuserform h3 {
	margin-top: 0;
	margin-bottom: 40px;
}

.memberLogin .loginPanel {
	position: relative;
}

.memberLogin .loginPanel>div {
	padding-bottom: 40px;
}

.memberLogin .loginPanel>div:first-of-type {
	padding-top: 0px;
	padding-bottom: 20px;
}

.summary .odd {
	background-color: #f2f2f2;
}

.summary .panel-body .detail-row>div {
	height: 70px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	word-wrap: break-word; 
}


.summary, .summary .panel-heading {
	background-color: #fff;
	position: relative;
}

.summary .panel-heading .edit-detail {
	position: absolute;
	right: 20px;
	top: 20px;
}

.summary .panel-heading .edit-detail a {
	text-decoration: underline;
}

.summary .panel-heading>.panel-title {
	color: #ff8200;
	margin-bottom: 0;
}

.summary .panel-body {
	padding: 0 15px;
	border: solid 1px #ccc;
	border-top-width: 3px;
}

.center .landing_h2 {
	color: #575757 !important;
}

.summary .driver-detail {
	border-bottom: solid 1px #ccc;
}

.summary .driver-detail .title {
	font-weight: bold;
	color: #ff8200;
}

.finalPremium {
	background-color: #fff;
	border: solid 1px #ccc;
	border-radius: 0;
}

.finalPremium .panel-heading {
	padding-top: 40px;
	background-color: #fff;
}

.finalPremium .panel-body {
	padding-bottom: 40px;
}

.finalPremium-title {
	font-family: Calibri, sans-serif !important;
	font-weight: 100;
	margin: 0;
}

.motor-summary .container:last-of-type {
	margin-bottom: 50px;
}

.payment-detail .panel-body .detail-row select {
	font-size: 16px;
}
	.summary .panel-body .detail-row .overflowfix.white{
	background-color: #fff;
	}
	

@media ( max-width : 768px) {
	.col-sm-6{
		/*width:50% !important;*/
	}
	.summary .panel-body .detail-row .overflowfix{
	background-color: #f2f2f2;
	height: auto;
	min-height: 70px;
	}

	.summary .panel-body .detail-row .overflowfix .row > div{
	height: 100%;
	padding-top: 15px;
	padding-bottom: 15px;
    }
}
@media ( max-width : 640px) {
	.month-row,.year-row,.seccode-row{width:100% !important;}

}
@media ( min-width : 640px) {
	.seccode-row{width:50% !important;}
}
@media ( min-width : 768px) {
		.summary .panel-body .detail-row .overflowfix{
	border-right: solid 1px #ccc;
	}
			.summary .panel-body .detail-row .overflowfix.right{
	border-right: none;
	}
	.summary .panel-body .detail-row .overflowfix{
	background-color: #f2f2f2;
	  height: auto;
	  min-height: 93px;
}

.summary .panel-body .detail-row .overflowfix .row> div{
    height: auto;
    display: flex;
    padding-top: 15px;
    padding-bottom: 15px;
    flex-direction: column;
    justify-content: center;
    word-wrap: break-word;
}

	.payment-detail .panel-body .detail-row>div {
		height: 100px;
	}
	.payment-detail .panel-body .detail-row>div span {
		display: table-cell;
		height: 100px;
		vertical-align: middle;
	}
	.finalPremium .panel-heading>.row>div, .finalPremium .panel-body>.row>div
		{
		padding-left: 40px;
		padding-right: 40px;
	}
	.summary .panel-body .detail-row>div {
		padding-left: 40px;
		padding-right: 40px;
		min-height:93px;
	}
	.summary .panel-body .row>div:nth-of-type(odd)>.detail-row>.text-right {
		border-right: solid 1px #ccc;
	}
}
</style>
<section id="" class="motor-summary motor-signup-form">
	<!-- Breadcrumb Component Start-->
	<div class="container container-fluid container--breadcrumb">
		<c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.application.summary
        </c:set>
		<c:set var="breadcrumbActive">3</c:set>

		<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			<jsp:param name="breadcrumbItems" value="${breadcrumbItems}" />
			<jsp:param name="breadcrumbActive" value="${breadcrumbActive}" />
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

	<div class="container">
		<div class="center wow fadeInDown animated">
			<!--desktop-->
			<h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs">
				<fmt:message key="motor.summary.page.heading" bundle="${motorMsg}" />
			</h1>
			<!--end-desktop-->
			<!--Mobile-->
			<h1 class="landing_h2 hidden-lg hidden-md motor-ttl">
				<fmt:message key="motor.summary.page.heading" bundle="${motorMsg}" />
			</h1>
			<!--end mobile-->
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default summary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.getquote.title"
							bundle="${motorMsg}" />
					</h2>
					<span class="edit-detail"> <span class="edit_quote"
						style="cursor: pointer"><fmt:message key="motor.label.edit"
								bundle="${motorMsg}" /></span>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.getquote.carmake"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carmake"></span>
								</div>
								<div class="col-xs-6 text-left even  elect">
									<span><fmt:message
											key="motor.summary.getquote.estimatevalue"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even elect">
									<span class="carvalue"></span>
								</div>
								<div class="col-xs-6 text-left odd elect">
									<span><fmt:message
											key="motor.summary.getquote.claimdiscount"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd elect">
									<span class="cardiscount"></span>
								</div>
								<div class="col-xs-6 text-left even non-elect">
									<span><fmt:message key="motor.summary.getquote.ccvalue"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even non-elect">
									<span class="carcc"></span>
								</div>
								<div class="col-xs-6 text-left odd  non-elect">
									<span><fmt:message
											key="motor.summary.getquote.estimatevalue"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd non-elect">
									<span class="carvalue"></span>
								</div>
								<div class="col-xs-6 text-left even non-elect">
									<span><fmt:message
											key="motor.summary.getquote.claimdiscount"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even non-elect">
									<span class="cardiscount"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.getquote.model"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carmodel"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.getquote.madeyear"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="carmade"></span>
								</div>
								<div class="col-xs-12 overflowfix right">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.getquote.occupation" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="useroccupation"></span>
								</div>
								</div>
								
								
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default summary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.cardetail.title"
							bundle="${motorMsg}" />
					</h2>
					<span class="edit-detail"> <span class="edit_cardetail"
						style="cursor: pointer"><fmt:message key="motor.label.edit"
								bundle="${motorMsg}" /></span>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.cardetail.chassisno" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carchasis" style="margin: 10px 0px 10px 0px;"></span>
								</div>
								
								<div class="col-xs-6 text-left even non-elect">
									<span><fmt:message key="motor.summary.cardetails.regdoc"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even non-elect">
									<span class="carmodeldocument"></span>
								</div>
								<div class="col-xs-6 text-left even carbankmortgageBox elect">
									<span class=" carbankmortgageNormal"><fmt:message
											key="motor.summary.cardetails.mortgage" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even carbankmortgageBox elect">
									<span class="carbankmortgage carbankmortgageField"></span>
								</div>
								<div class="col-xs-6 text-left odd hidden-xs carbankmortgageBox" style="display:none"></div>
								<div class="col-xs-6 text-right odd hidden-xs carbankmortgageBox" style="display:none"></div>
								
								<div class="col-xs-6 text-left odd carbankmortgageBox carcubic-box" style="display:none">
									<span class="carbankmortgageOther"><fmt:message key="motor.summary.cardetails.other"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd carbankmortgageBox carcubic-box" style="display:none">
									<span class="carotherbankmortgage"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								
								<div class="col-xs-6 text-left odd elect">
									<span><fmt:message key="motor.summary.cardetails.regdoc"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd elect">
									<span class="carmodeldocument"></span>
								</div>
								
								<div class="col-xs-6 text-left odd non-elect">
									<span class="carcubic-title"><fmt:message
											key="motor.summary.cardetails.ccvalue" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd non-elect">
									<span class="carcubic"></span>
								</div>
									<div class="col-xs-12 overflowfix white carbankmortgageBox">
								<div class="row">
								<div class="col-xs-6 text-left even carbankmortgageBox non-elect">
									<span class=" carbankmortgageNormal"><fmt:message
											key="motor.summary.cardetails.mortgage" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even non-elect carbankmortgageBox">
									<span class="carbankmortgage carbankmortgageField"></span>
								</div>
								</div>
								</div>
								
								<!--  <div class="col-xs-6 text-left odd hidden-xs carbankmortgageBox non-elect" style="display:none"></div>
								<div class="col-xs-6 text-right odd hidden-xs carbankmortgageBox non-elect" style="display:none"></div>
								-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default summary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.applicantdetail.title"
							bundle="${motorMsg}" />
					</h2>
					<span class="edit-detail"> <span class="edit_driverdetail"
						style="cursor: pointer"><fmt:message key="motor.label.edit"
								bundle="${motorMsg}" /></span>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.applicantdetail.fullname"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="fullname"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.applicantdetail.dob" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.applicantdetail.hkid" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="hkid"></span>
								</div>
								
								<div class="col-xs-12 overflowfix white">
								<div class="row">
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.applicantdetail.address"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="address"></span>
								</div>
								
								</div>
								</div>
								
								
								
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.applicantdetail.mobile"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="contactno"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.applicantdetail.email"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="email"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.applicantdetail.policystart"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="policystart"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.applicantdetail.policyend"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="policyend"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default summary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.driverdetail.title"
							bundle="${motorMsg}" />
					</h2>
					<span class="edit-detail"> <span class="edit_policydetail"
						style="cursor: pointer"><fmt:message key="motor.label.edit"
								bundle="${motorMsg}" /></span>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 driver-detail" id="driver1">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span class="title"><fmt:message
											key="motor.summary.driverdetail.subtitle1"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd"></div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.name"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver1fullname"></span>
								</div>
								
								<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver1occupation"></span>
								</div>
								</div>
								</div>
								
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver1birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.driverdetail.hkid"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver1hkid"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 driver-detail" id="driver2">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span class="title"><fmt:message
											key="motor.summary.driverdetail.subtitle2"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd"></div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.name"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver2fullname"></span>
								</div>
									<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver2occupation"></span>
								</div>
								</div>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver2birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.driverdetail.hkid"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver2hkid"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 driver-detail" id="driver3">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span class="title"><fmt:message
											key="motor.summary.driverdetail.subtitle3"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd"></div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.name"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver3fullname"></span>
								</div>
								
									<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver3occupation"></span>
								</div>
								</div>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver3birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.driverdetail.hkid"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver3hkid"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 driver-detail" id="driver4">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span class="title"><fmt:message
											key="motor.summary.driverdetail.subtitle4"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd"></div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.name"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver4fullname"></span>
								</div>
									<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver4occupation"></span>
								</div>
								</div>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver4birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.driverdetail.hkid"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver4hkid"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 driver-detail" id="driver5">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span class="title">Diver 5</span>
								</div>
								<div class="col-xs-6 text-right odd"></div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.name"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver5fullname"></span>
								</div>
								
								<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver5occupation"></span>
								</div>
								</div>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="driver5birth"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.driverdetail.hkid"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver5hkid"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default summary">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.noclaimdis.title"
							bundle="${motorMsg}" />
					</h2>
					<span class="edit-detail"> <span class="edit_noclaim"
						style="cursor: pointer"><fmt:message key="motor.label.edit"
								bundle="${motorMsg}" /></span>
					</span>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								
								<div class="col-xs-12 overflowfix">
								<div class="row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.noclaimdis.prevname" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd" >
									<span class="nameofprevinsurance" ></span>
								</div>
								</div>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.noclaimdis.regpreno" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="regofdocument"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.noclaimdis.regpreexpiry"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="previnsuranceexpirydate"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.noclaimdis.regprepolicyno"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="previouspolicyno"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-default finalPremium">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-6">
								<h3 class="finalPremium-title">
									<fmt:message key="motor.summary.final.premium"
										bundle="${motorMsg}" />
								</h3>
							</div>
							<div class="col-xs-6 text-right">
								<h3 class="finalPremium-title">
									<fmt:message key="motor.label.currency.front"
										bundle="${motorMsg}" />
									<span id="yourQuotePrice"></span>
									<fmt:message key="motor.label.currency.behind"
										bundle="${motorMsg}" />
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 ">
						<div class="row">
							<div class="col-xs-12">
								<br>
							</div>
							<div class="col-xs-12">
								<strong><fmt:message key="motor.summary.plan.type"
										bundle="${motorMsg}" /></strong>
							</div>
							
							<div class="col-xs-6">
                            <span class="ci" id="yourQuoteTitle"></span>
                        	</div>
                        	<div class="col-xs-12">
                            <br/>
                       		</div>
							<div class="col-xs-12 summary__addOn hidden">
                            <strong><fmt:message key="motor.label.addontable" bundle="${motorMsg}" /></strong> 
                        </div>
                        <div class="col-xs-6 summary__addOn1 hidden">
                           
                                <span id="addOn1Title"><fmt:message key="motor.quickquote.addon.1.title" bundle="${motorMsg}" /></span>
                           </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="paa"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                          <div class="clearfix"></div>
                        <div class="col-xs-6 summary__addOn2 hidden">                          
                                <span id="addOn2Title"><fmt:message key="motor.quickquote.addon.2.title" bundle="${motorMsg}" /></span>
                            </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="cia"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                        <div class="col-xs-12">
                            <br/>
                       	</div>
                        <div class="col-xs-6 summary__subtotal hidden">
                           
                                <span id="subtitleTitle"><fmt:message key="motor.quickquote.summary.subtotal.title" bundle="${motorMsg}" /></span>
                           </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="subtotalAmount"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
                          <div class="clearfix"></div>
                        <div class="col-xs-6 summary__Discounts hidden">                          
                                <span id="discountsTitle"><fmt:message key="motor.quickquote.summary.discounts.title" bundle="${motorMsg}" /></span>
                            </div>
                            <div class="col-xs-6 text-right hidden">
                            <strong>
                                <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
                                <span id="discountsAmount"></span>
                                <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
                            </strong>
                        </div>
							<div class="col-xs-12">
								<hr>
							</div>
							<div class="col-xs-6 orange">
								<strong><fmt:message key="motor.summary.plan.amountdue"
										bundle="${motorMsg}" />:</strong>
							</div>
							<div class="col-xs-6 text-right">
								<h2 class="finalPremium-title orange">
									 <fmt:message key="motor.label.currency.front" bundle="${motorMsg}" />
		                             <span id="yourQuoteAmmount"></span>
		                             <fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" />
								</h2>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="center">
			<div class="panel panel-default payment-detail">
				<div class="panel-heading">
					<h2 class="panel-title">
						<fmt:message key="motor.summary.payment.detail"
							bundle="${motorMsg}" />
					</h2>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-10 col-sm-offset-1">
							<div class="row">
								<form action="" method="post" class="no-claim" id="no-claim"
									data-toggle="validator">
									<input type="hidden" name="merchantId" value=""> <input
										type="hidden" name="amount" value=""> <input
										type="hidden" name="remark" value=""> <input
										type="hidden" name="orderRef" value=""> <input
										type="hidden" name="currCode" value=""> <input
										type="hidden" name="successUrl" value=""> <input
										type="hidden" name="failUrl" value=""> <input
										type="hidden" name="errorUrl" value=""> <input
										type="hidden" name="payType" value=""> <input
										type="hidden" id="referenceNo" name="referenceNo" value="">
									<%
				                        String payLang = (String) session.getAttribute("language");
				                        //payLang = payLang.substring(0, 1);
				
				                        payLang = "C";
				
				                        //if (payLang.equals("t"))
				
				                    %>
									<input type="hidden" name="lang" value="C"> <input
										type="hidden" name="secureHash" value=""> <input
										type="hidden" id="emailAddress" name="emailAddress" value="">
									<input type="hidden" id="gateway" name="gateway" value="">

									<input type="hidden" id="appId" name="appId" value="" /> <input
										type="hidden" id="merTradeNo" name="merTradeNo" value="" /> <input
										type="hidden" id="payload" name="payload" value="" /> <input
										type="hidden" id="paymentType" name="paymentType" value="" />
									<input type="hidden" id="sign" name="sign" value="" /> <input
										type="radio" id="visaMaster" class="paymentType__btn"
										name="paymentGroup" value="cc" checked style="display: none">


									<input type="radio" name="pMethod" checked="checked"
										value="VISA" id="chkVisa" style="display: none"> <input
										type="radio" name="pMethod" value="Master" id="chkMaster"
										style="display: none">


									<div class="col-xs-12">
										<div class="row detail-row">
											<div class="col-xs-4 col-sm-2 text-left" style="padding-right: 0;">
												<span><fmt:message
														key="motor.summary.payment.methodtitle"
														bundle="${motorMsg}" /></span>
											</div>
											<div class="col-xs-8 col-sm-10 text-left" style="padding-left: 0;margin-bottom:10px;">
												<span> <img
													src="<%=request.getContextPath()%>/resources/images/motor/master_logo.jpg" alt="" width="70" /> <img
													src="<%=request.getContextPath()%>/resources/images/motor/visa_logo.jpg" alt="" width="70" />
												</span>
											</div>
											<div class="col-xs-12 col-sm-6 text-left">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<div class="help-block-wrap">
															<input id="holdername" name="cardHolder" type="text"
																class="form-control mdl-textfield__input"
																onblur="replaceAlpha(this); chkNotNullCreditCareNameEx2(this, 'errname');"
																onkeypress="return alphaOnly(event);"> <span
																id="errname" class="error-msg" style="height: 0px"></span>
															<!-- <input type="text" name="cardName" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>-->
															<label class="mdl-textfield__label"><fmt:message
																	key="motor.summary.payment.creditname"
																	bundle="${motorMsg}" /></label>
															<div class="help-block with-errors"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-6 text-left">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<div class="help-block-wrap">
															<input id="cardNo1" type="tel"
																class="form-control mdl-textfield__input cardnumber"
																maxlength="19" data-min="19"
																onkeypress="return isNumeric(event);"
																onblur="validatecardnumber($('#cardnumber').val());" />
															<span id="errcardno" class="error-msg"
																style="height: 0px"></span> <input id="cardnumber"
																name="cardNo" type="hidden" class="input-block-level"
																maxlength="16" data-min="16" />
															<!-- <input type="text" name="cardNo" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>-->
															<label class="mdl-textfield__label"><fmt:message
																	key="motor.summary.payment.creditno"
																	bundle="${motorMsg}" /></label>
															<div class="help-block with-errors"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-3 text-left month-row">
												<label><fmt:message
														key="motor.summary.payment.expirydate"
														bundle="${motorMsg}" /></label> <select class="form-control"
													name="epMonth" id="month"
													onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
													<option value="" disabled selected hidden><fmt:message
															key="motor.summary.payment.month" bundle="${motorMsg}" /></option>
													<option value="1">01</option>
													<option value="2">02</option>
													<option value="3">03</option>
													<option value="4">04</option>
													<option value="5">05</option>
													<option value="6">06</option>
													<option value="7">07</option>
													<option value="8">08</option>
													<option value="9">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select> <span id="errmonth" class="error-msg" style="height: 0px"></span>
											</div>
											<div class="col-xs-6 col-sm-3 text-left year-row"
												style="margin-top: 5px;">
												<label></label> <select class="form-control" name="epYear"
													id="year"
													onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
													<option value="" disabled selected hidden><fmt:message
															key="motor.summary.payment.year" bundle="${motorMsg}" /></option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
													<option value="2020">2020</option>
													<option value="2021">2021</option>
													<option value="2022">2022</option>
													<option value="2023">2023</option>
													<option value="2024">2024</option>
													<option value="2025">2025</option>
													<!--<c:forEach begin="0" end="10" varStatus="loop">
				                                        <c:set var="currentYear" value="${year + loop.index}" />
				                                        <option value="${currentYear}">${currentYear}</option>
				                                    </c:forEach>-->
												</select> <span id="erryear" class="error-msg" style="height: 0px"></span>
											</div>
											<div class="col-xs-6 col-sm-3 text-left seccode-row">
												<label></label>
												<div class="form-group">
													<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<div class="help-block-wrap" style="margin-top: 5px;display: inline-block;width:50%">
															<input id="seccode" type="password" name="securityCode"
																class="form-control mdl-textfield__input"
																autocomplete="off" maxlength="3" title=""
																onblur="replaceNumeric(this);"
																onkeypress="return isNumeric(event);"> <span
																id="errcode" class="error-msg" style="height: 0px"></span>
															<label class="mdl-textfield__label"><fmt:message
																	key="motor.summary.payment.securecode"
																	bundle="${motorMsg}" /></label>
															<div class="help-block with-errors"></div>
														</div>
														<div style="display: inline-block;margin-left:10px;" class="sec-mobdesk"><img src="<%=request.getContextPath()%>/resources/images/motor/Payment_secruity_code.jpg" alt=""></div>
													
												</div>
											</div>
											<div class="col-xs-6 col-sm-3 text-left" style="display:none">
												<span> <img
													src="<%=request.getContextPath()%>/resources/images/motor/Payment_secruity_code.jpg" alt="" />
												</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12" style="margin-top: 10px;text-align:left">
									
									<label><fmt:message key="motor.summary.merchant.statement.line1" bundle="${motorMsg}" /></label><br/>
									<label><fmt:message key="motor.summary.merchant.statement.line2" bundle="${motorMsg}" /></label><br/>
									<label><fmt:message key="motor.summary.merchant.statement.line3" bundle="${motorMsg}" /></label><br/>
									</div>
									<div class="col-xs-12" style="margin-top: 10px; padding-left: 40px;text-align:left">
										<div class="custom-checkbox">
											<div class="checkbox">
												<div class="form-group">
													<div class="help-block-wrap">
														<input id="checkbox3" type="checkbox" data-required-error='<fmt:message key="motor.error.msg.payment.readandaccept" bundle="${motorMsg}" />' required> <label
															class="text-left"><small> <fmt:message
																	key="motor.summary.payment.tnc" bundle="${motorMsg}" /></small>
														</label>
														<div class="help-block with-errors checkbox3 error-msg hide"><fmt:message key="motor.error.msg.payment.readandaccept" bundle="${motorMsg}" /></div>
													</div>
												</div>

											</div>
										</div>
									</div>
									<div class="login-error-wrapper">
										<div id="payment-errors" class="color-red heading-h5"
											role="alert"></div>
									</div>
									<br /> <br />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<style>
	.motor-signup-form .memberLogin .registerPanel .mdl-textfield {
	    height: 61px !important;
	    text-align: left;
	}
	</style>
	<!-- testing -->
	<%--
	<div class="container before-login">
		<div class="center">
			<div class="panel panel-default memberLogin" id="accordion">
				<div class="panel-heading">
					<h2 class="panel-title">
				</div>
				<div class="panel-body" style="background-color: #f2f2f2">
					<div class="plan-accordion">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default loginPanel">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse" href="#collapseOne"
											aria-controls="collapseOne" aria-expanded="true"> <fmt:message
												key="motor.summary.member.loginsubtitle"
												bundle="${motorMsg}" /> <i class="fa fa-caret-down"
											aria-hidden="true"></i>
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="sub-pan show" id="sub-pan-login">
										<form name="form-motor-login" id="form-motor-login"
											method="post" style="">
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<!--使用者名 -->
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="text" name="userName"
															class="form-control check-emp login-input mdl-textfield__input"
															id="motorloginUsername"> <label
															class="mdl-textfield__label" for="motorloginUsername"><fmt:message
																key="motor.summary.member.username" bundle="${motorMsg}" /></label>

													</div>
													<span class="text-left error-msg userNameErrMsg" style="text-align:left"></span>
												
													<!-- 忘記使用者名 -->
													<div class="text-left">
														<a class="heading-h6 btn-sub-pan-trigger"
															href="#sub-pan-forgot-username"><fmt:message
																key="motor.summary.member.username.forget"
																bundle="${motorMsg}" /></a>
													</div>
													</div>
											</div>
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="password" name="password"
															class="form-control check-emp-forgotusername login-input mdl-textfield__input"
															autocomplete="off" id="motorloginPassword"> <label
															class="mdl-textfield__label" for="motorloginPassword"><fmt:message
																key="motor.summary.member.password" bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg passwordErrMsg" style="text-align:left"></span>
												
													<div class="text-left">
														<!--忘記密碼 -->
														<a class="heading-h6 btn-sub-pan-trigger"
															href="#sub-pan-forgot-pwd"><fmt:message
																key="motor.summary.member.password.forget"
																bundle="${motorMsg}" /></a>
													</div>
													</div>
											</div>

											<div class="login-button-group text-center">
												<!-- <button type="button"
													class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
													id="btn-motor-login">
													<fmt:message key="motor.summary.member.logincta"
														bundle="${motorMsg}" />
												</button>-->
												<a style="width:250px;padding: 10px 2px !important;" class="bdr-curve btn btn-primary btn-submit"id="btn-motor-login"><fmt:message key="motor.summary.member.logincta"
																bundle="${motorMsg}" /> </a>
												<div class="login-error-wrapper">
													<div id="login-err-msg" class="color-red heading-h5"
														role="alert"></div>
												</div>
												<span class="error-msg regPanErrMsg"></span>
											</div>
										</form>
									</div>
									<div class="sub-pan" id="sub-pan-forgot-username"
										style="height: 220px;">
										<form name="form-motor-forgot-username"
											id="form-motor-forgot-username" method="post">
											<!-- 電話 inout -->
											<div class="col-xs-12">
												<div class="panel-heading">
													<h4 class="panel-title" style="color:#ff8200">
														<fmt:message
																key="motor.summary.member.username.forget"
																bundle="${motorMsg}" /><a href="#sub-pan-login"
															class="btn-sub-pan-trigger"><i
															class="glyphicon glyphicon-remove"></i></a>
													</h4>
												</div>
												<div class="alert alert-success your_username_box hide">
													<span id="your_username"></span>
												</div>
											</div>
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="tel" name="mobileNo"
															class="form-control gray-textbox check-emp-forgotusername login-input mdl-textfield__input"
															id="motorForgotUsernameMobileNo"> <label
															class="mdl-textfield__label"
															for="motorForgotUsernameMobileNo"><fmt:message
																key="motor.summary.member.forgot.mobile"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg mobileNoErrMsg" style="text-align:left"></span>

												</div>
											</div>
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="email" name="emailAddress"
															class="form-control gray-textbox mdl-textfield__input check-emp-forgotusername login-input"
															id="motorForgotUsernameEmailAddress"> <label
															class="mdl-textfield__label"
															for="motorForgotUsernameEmailAddress"><fmt:message
																key="motor.summary.member.forgot.email"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg emailAddressErrMsg" style="text-align:left"></span>
												</div>
											</div>
											<div class="col-xs-12">
												<div class="form-group">
													<div class="login-button-group forgot-group text-center">
														<a style="width:250px;padding: 10px 2px !important;" class="bdr-curve btn btn-primary btn-submit"id="btn-motor-forgot-username"><fmt:message key="motor.button.submit"
																bundle="${motorMsg}" /> </a>
														<!-- <button type="button"
															class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
															id="btn-motor-forgot-username">
															<fmt:message key="motor.button.submit"
																bundle="${motorMsg}" />
														</button>-->
													</div>
												</div>
											</div>
										</form>

									</div>
									<div class="sub-pan" id="sub-pan-forgot-pwd"
										style="height: 300px;">
										<form name="form-motor-forgot-pwd" id="form-motor-forgot-pwd"
											method="post">
											<div class="col-xs-12">
												<div class="panel-heading">
													<h4 class="panel-title" style="color:#ff8200">
														<fmt:message
															key="motor.summary.member.forgotpasword.title"
															bundle="${motorMsg}" />
														<a href="#sub-pan-login" class="btn-sub-pan-trigger"><i
															class="glyphicon glyphicon-remove"></i></a>
													</h4>
												</div>
											</div>
											<!-- 電話 input -->
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="tel" name="mobileNo"
															class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
															id="motorForgotPwdMobileNo"> <label
															class="mdl-textfield__label"
															for="mobileNo-forgotpassowrd"><fmt:message
																key="motor.summary.member.forgot.mobile"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg mobileNoErrMsg" style="text-align:left"></span>
												</div>
											</div>
											<!-- 電郵 input-->
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="email" name="emailAddress"
															class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
															id="motorForgotPwdEmailAddress"> <label
															class="mdl-textfield__label"
															for="motorForgotPwdEmailAddress"><fmt:message
																key="motor.summary.member.forgot.email"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg emailAddressErrMsg" style="text-align:left"></span>
												</div>
											</div>
											<!-- 使用者input -->
											<div class="col-xs-12 col-sm-6">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<input type="text" name="userName"
															class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
															id="motorForgotPwdUsername"> <label
															class="mdl-textfield__label" for="userName"><fmt:message
																key="motor.summary.member.forgot.username"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg userNameErrMsg" style="text-align:left"></span>
												</div>
											</div>
											<div class="col-xs-12">
												<div class="login-button-group forgot-group text-center">
												<a style="width:250px;padding: 10px 2px !important;" class="bdr-curve btn btn-primary btn-submit"id="btn-motor-forgot-pwd"><fmt:message key="motor.button.submit"
																bundle="${motorMsg}" /> </a>
													<!-- <button type="button"
														class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
														id="btn-motor-forgot-pwd">
														<fmt:message key="motor.button.submit"
															bundle="${motorMsg}" />
													</button>-->
													<br/><br/>
													<span class="error-msg forgotPwdPanErrMsg" style="text-align:center"></span>
												
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="panel panel-default registerPanel">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											href="#collapseTwo" aria-controls="collapseTwo"> <fmt:message
												key="motor.summary.member.regsubtitle" bundle="${motorMsg}" />
											<i class="fa fa-caret-down" aria-hidden="true"></i>
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<form name="form-motor-register" id="form-motor-register"
											method="post">
											<div class="form-group">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<input type="text" name="fullName"
														class="form-control gray-textbox check-emp login-input mdl-textfield__input"
														id="motorRegisterFullName"
														data-keyblock-alphabet-space="true" autocomplete="off"
														maxlength="100"> <label
														class="mdl-textfield__label" for="motorRegisterFullName"><fmt:message
															key="motor.summary.member.fullname" bundle="${motorMsg}" />
														<span class="small-txt"><fmt:message
																key="motor.summary.member.fullname.remark"
																bundle="${motorMsg}" /></span></label>
												</div>
												<span class="error-msg FullNameErrMsg" style="text-align:left"></span>
											</div>
											<div class="form-group">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<!-- <input type="tel" name="mobileNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="motorRegisterMobileNo" data-keyblock-num="true">
										<label class="mdl-textfield__label" for="motorRegisterMobileNo">Mobile no.</label>
										-->
													<input type="tel" name="mobileNo"
														class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
														id="motorRegisterMobileNo" data-keyblock-num="true">
													<label class="mdl-textfield__label"
														for="motorRegisterMobileNo"><fmt:message
															key="motor.summary.member.mobile" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg mobileNoErrMsg" style="text-align:left"></span>
											</div>
											<div class="form-group" data-toggle="popover"
												data-placement="top" data-trigger="focus"
												data-content="Insurance certificate will be sent to this email address">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<input type="text" name="EmailAddress"
														class="form-control gray-textbox check-emp login-input mdl-textfield__input"
														id="motorRegisterEmailAddress"> <label
														class="mdl-textfield__label"
														for="motorRegisterEmailAddress"><fmt:message
															key="motor.summary.member.email" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg EmailAddressErrMsg" style="text-align:left"></span>
											</div>
											<div class="form-group">
												<!--使用者名 -->
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<input type="text" name="userName"
														class="form-control gray-textbox check-emp login-input mdl-textfield__input"
														id="motorRegisterUserName"> <label
														class="mdl-textfield__label" for="motorRegisterUserName"><fmt:message
															key="motor.summary.member.username" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg userNameErrMsg" style="text-align:left"></span>
											</div>
											<div class="form-group">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<input type="password" name="password"
														class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input"
														autocomplete="off" id="motorRegisterPassword"> <label
														class="mdl-textfield__label" for="motorRegisterPassword"><fmt:message
															key="motor.summary.member.password" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg passwordErrMsg" style="text-align:left"></span>
											</div>
											<div class="form-group">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<input type="password" name="confirmPassword"
														class="form-control check-emp-forgotusername login-input gray-textbox mdl-textfield__input"
														autocomplete="off" id="motorRegisterConfPass"> <label
														class="mdl-textfield__label" for="motorRegisterConfPass"><fmt:message
															key="motor.summary.member.confirmpw" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg confirmPasswordErrMsg" style="text-align:left"></span>
											</div>
											<div class="declaration">
												<h4>
													<fmt:message key="motor.summary.member.declaration.title"
														bundle="${motorMsg}" />
													:
												</h4>
												<div class="form-group">
													<div class="checkbox">
														<input id="checkbox1" name="checkbox1" type="checkbox"
															class=""><label for="checkbox1"><fmt:message
																key="motor.summary.member.tnc1.1" bundle="${motorMsg}" /><a
															href="<fmt:message key="motor.summary.member.tnc1.link" bundle="${motorMsg}" />"
															target="blank"><fmt:message
																	key="motor.summary.member.tnc1.2" bundle="${motorMsg}" /></a>
														<fmt:message key="motor.summary.member.tnc1.3"
																bundle="${motorMsg}" /></label>
													</div>
													<span class="error-msg checkbox1ErrMsg" style="text-align:left"></span>
												</div>
												<hr>
												<p>
													<fmt:message key="motor.summary.member.tnc.dm"
														bundle="${motorMsg}" />
												</p>
												<div class="checkbox">
													<input id="checkbox-opt1" name="checkbox-opt1" type="checkbox"><label
														for="checkbox-opt1"><fmt:message
															key="motor.summary.member.tnc2" bundle="${motorMsg}" /></label>
												</div>
												<div class="checkbox">
													<input id="checkbox4" name="checkbox4" type="checkbox"><label
														for="checkbox4"><fmt:message
															key="motor.summary.member.tnc3" bundle="${motorMsg}" /></label>
												</div>
											</div>
											<div class="login-button-group text-center">
											<!-- 	<button type="button"
													class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
													id="btn-motor-register">
													<fmt:message key="motor.summary.member.regcta"
														bundle="${motorMsg}" />
												</button>-->
												<a style="width:250px;padding: 10px 2px !important;" class="bdr-curve btn btn-primary btn-submit"id="btn-motor-register"><fmt:message key="motor.summary.member.regcta"
																bundle="${motorMsg}" /> </a>
												<div class="login-error-wrapper">
													<div id="login-err-msg" class="color-red heading-h5"
														role="alert"></div>
												</div>
												<br/>
												<span class="error-msg regPanErrMsg"></span>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	--%>
	<!-- testing -->
	<div class="container">
		<div class="col-xs-12">
			<div class="row">
				<div class="text-center col-sm-6 col-sm-offset-3">
					<div class="row">
						<div class="text-center col-xs-6">
							<br /> <a class="bdr-curve btn btn-primary nxt-btn"
								onclick="perventRedirect=false;BackMe();"><fmt:message
									key="motor.button.back" bundle="${motorMsg}" /> </a> <br />
						</div>
						<div class="text-center col-xs-6">
							<br />
							<!-- <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="Next" />-->
							<button id="button_confirm"
								class="bdr-curve btn btn-primary nxt-btn"
								style="white-space: initial;"><fmt:message
									key="motor.button.confirmation" bundle="${motorMsg}" /> </button>
							<br />
						</div>
						<div class="clearfix"></div>
						<div class="text-center has-error hide" id="system-error">
						<br/>
						<span class="help-block"><fmt:message key="motor.error.msg.serversystem.error" bundle="${motorMsg}" /></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<div id="PaymentingDiv" class="waitingDiv"
	style="display: none; margin-left: auto; margin-right: auto;">
	<img style="width: 300px; height: 300px;"
		src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
</div>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/bootstrap-switch.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript" charset="utf-8" 
	src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>
<script type="text/javascript">

var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

if(typeof quote.policyId == "undefined" && getUrlParameter("refNum")==null)
	window.location="<%=request.getContextPath()%>/en/motor-insurance/";
	
function BackMe() {
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "declarations?back=yes");
     $form.attr("method", "post");
     var $quote = $("<input type='hidden' name='data' />");
     $quote.attr("value", JSON.stringify(quote));
     $form.append($quote);
     $("body").append($form);
     $('#quote-form').submit();
}	
$(window).load(function(){
    $('body').backDetect(function(){
    	 BackMe();
    	 return false;
    });
});
	var ApiPayment = new Array();
	var enablePayment = true;
	var clicked = false;
	var motorlanguage=UILANGUAGE;
	if(motorlanguage == "TC")
		motorlanguage = "ZH";
	var chin = $('body').hasClass('chin'),
	enErr = {
			404: 'Invalid information (code: 404)',
			411: 'Your payment is being processed',
			413: 'The Premium is settled.',
			422: 'Invalid information (code: 422)',
			504: 'Invalid information (code: 504)',
		},
		cnErr ={
			404: '資料不正確(編號：404)',
			411: '您的款項正被處理中',               
			413: '已繳付保金。',  
			422: '資料不正確(編號：422)',
			504: '資料不正確(編號：504)',               
		};
	$.fn.capitalise1 = function() {
	    return this.each(function() {
	        var $this = $(this),
	            text = $this.text(),
	            tokens = text.split(",").filter(function(t) {return t != ""; }),
	            res = [],
	            i,
	            len,
	            component;
	        for (i = 0, len = tokens.length; i < len; i++) {
	            component = tokens[i];
	            res.push(component.substring(0, 1).toUpperCase());
	            res.push(component.substring(1));
	            res.push(","); // put space back in
	        }
	        $this.text(res.join(""));
	    });
	};
	$.fn.capitalise2 = function() {
	    return this.each(function() {
	        var $this = $(this),
	            text = $this.text(),
	            tokens = text.split(" ").filter(function(t) {return t != ""; }),
	            res = [],
	            i,
	            len,
	            component;
	        for (i = 0, len = tokens.length; i < len; i++) {
	            component = tokens[i];
	            res.push(component.substring(0, 1).toUpperCase());
	            res.push(component.substring(1));
	            res.push(" "); // put space back in
	        }
	        $this.text(res.join(""));
	    });
	};
	$(document)
			.ready(
					function() {
						$(".non-elect").css({"display":"none"});
						
						$('#loading-overlay').modal("show");
						$("#headingOne").on("click",function(){
							$("#collapseTwo").removeClass();
							$("#collapseTwo").addClass("panel-collapse collapse");
						});
						$("#headingTwo").on("click",function(){
							$("#collapseOne").removeClass();
							$("#collapseOne").addClass("panel-collapse collapse");
						});
						
						var getUrlParameter = function getUrlParameter(sParam) {
							var sPageURL = decodeURIComponent(window.location.search
									.substring(1)), sURLVariables = sPageURL
									.split('&'), sParameterName, i;
							//this loop only for the payment return with = handler
							for (i = 0; i < sURLVariables.length; i++) {

								sParameterName = sURLVariables[i].split('=');

								if (sParameterName[0] === sParam) {
									if (sParameterName[0] == "refNum") {
										var combined_refNum = sParameterName[1];
										var temp = "";
										for (j = i + 1; j < sParameterName.length; j++) {
											if (sParameterName[j] != "")
												temp = "=" + sParameterName[j];
											if (sParameterName[j] == "")
												temp = "=";
											combined_refNum += temp;
										}
										return sParameterName[1] === undefined ? true
												: combined_refNum;
									} else
										return sParameterName[1] === undefined ? true
												: sParameterName[1];
								}
							}
						};
						
						if (getUrlParameter("paymentGatewayFlag") == null)
						{
							var planType = (quote.planCode=='Third')?'third':quote.compPlan.toLowerCase();
						     $.when(getMotorQuotePrice(planType, quote)).then(function(){
								
								            totalDue = parseFloat(motorPrice[planType].amountDueAmount);
								            addOnPaQuote = parseFloat(motorPrice[planType].addOnPaAmt);
								            addOnTppdQuote = parseFloat(motorPrice[planType].addOnTppdAmt);
								            if($('body').hasClass('chin')){
												if(quote.planCode=="Comp"){
												 if(quote.compPlan=="Gold")
												 $('#yourQuoteTitle').html('綜合保險(金)');
												else
												 $('#yourQuoteTitle').html('綜合保險(銀)');
												}
												else
												$('#yourQuoteTitle').html('第三者保險');
												}
												else{
												if(quote.planCode=="Comp"){
												 if(quote.compPlan=="Gold")
												 $('#yourQuoteTitle').html('Comprehensive Gold');
												else
												 $('#yourQuoteTitle').html('Comprehensive Silver');
												}
												else
												$('#yourQuoteTitle').html('Third Party');
												}
								            $('#addOnPaAmt').html(formatCurrency(addOnPaQuote));
								            $('#addOnTppdAmt').html(formatCurrency(addOnTppdQuote));
								         
								            if(quote.personalAccident == true)
								            {
								            	$('.summary__addOn1').removeClass('hidden');
								            	$('.summary__addOn').removeClass('hidden');
								             	$('#paa').html(formatCurrency(addOnPaQuote));
								            }
								            	
								            if(quote.thirdPartyPropertyDamage == true)
								            {	
								            	$('.summary__addOn2').removeClass('hidden');
								            	$('.summary__addOn').removeClass('hidden');
								            	$('#cia').html(formatCurrency(addOnTppdQuote));
								            }
								         	updateTotalDue(totalDue);
								         	$(".yourQuoteAmmount").html ($("#yourQuoteAmmount").html());
								         	$('#loading-overlay').modal("hide");
						     });
						}
						/*$.ajax({
							  type: "POST",
							  data: JSON.stringify(quote),
							  dataType: "json",
						      contentType : "application/json",
						      cache: false,
						      async: false,
						      url:context + "/api/iMotor/quote",
							  success: function(data){
								  $('.amountDue').html(formatCurrency(data.amountDueAmount));
								  $('.price').html(formatCurrency(data.amountDueAmount));
								  $('.subprice').html(formatCurrency(data.subTotalAmount));
								
								  if(data.personalAccident ==true)
								  	$('.paa').html(formatCurrency(data.personalAccidentAmount));
								  else
									$('.paa-box').hide();	 
								  if(data.thirdPartyPropertyDamage ==true)
								  	$('.cia').html(formatCurrency(data.compInsuranceAmount));
								  else
									  $('.cia-box').hide();	
							  },error: function(error) {
								
							  }
							});*/

						$('.edit_quote')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form.attr("action","get-quote?plan="+quote.planCode+"&edit=yes");
											$form.attr("method", "post");
											var $quote = $("<input type='hidden' name='data' />");
											$quote.attr("value", JSON
													.stringify(quote));
											$form.append($quote);
											$("body").append($form);
											$('#quote-form').submit();
										});

						$('.edit_cardetail')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form.attr("action",
													"car-details?edit=yes");
											$form.attr("method", "post");
											var $quote = $("<input type='hidden' name='data' />");
											$quote.attr("value", JSON
													.stringify(quote));
											$form.append($quote);
											$("body").append($form);
											$('#quote-form').submit();
										});

						$('.edit_driverdetail')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form.attr("action",
													"drivers-details?edit=yes");
											$form.attr("method", "post");
											var $quote = $("<input type='hidden' name='data' />");
											$quote.attr("value", JSON
													.stringify(quote));
											$form.append($quote);
											$("body").append($form);
											$('#quote-form').submit();
										});

						$('.edit_policydetail')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form.attr("action",
													"policy-details?edit=yes");
											$form.attr("method", "post");
											var $quote = $("<input type='hidden' name='data' />");
											$quote.attr("value", JSON
													.stringify(quote));
											$form.append($quote);
											$("body").append($form);
											$('#quote-form').submit();
										});

						$('.edit_noclaim')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form.attr("action",
													"policy-details?edit=yes");
											$form.attr("method", "post");
											var $quote = $("<input type='hidden' name='data' />");
											$quote.attr("value", JSON
													.stringify(quote));
											$form.append($quote);
											$("body").append($form);
											$('#quote-form').submit();
										});

					

						if (getUrlParameter("paymentGatewayFlag") == "1"
								&& getUrlParameter("refNum") != null) {
							var summary = {
								"token" : getUrlParameter("refNum"),
							};
							$
									.ajax({
										type : "POST",
										data : JSON.stringify(summary),
										dataType : "json",
										contentType : "application/json",
										cache : false,
										async : false,
										url : context
												+ "/api/iMotor/policy/payment/summary?paymentGatewayFlag=1",
										success : function(data) {
											console.dir(data);
											quote = data;
											console.dir(quote);
											var planType = (quote.planCode=='Third')?'third':quote.compPlan.toLowerCase();
										     $.when(getMotorQuotePrice(planType, quote)).then(function(){
												
												            totalDue = parseFloat(motorPrice[planType].amountDueAmount);
												            addOnPaQuote = parseFloat(motorPrice[planType].addOnPaAmt);
												            addOnTppdQuote = parseFloat(motorPrice[planType].addOnTppdAmt);
												            if($('body').hasClass('chin')){
																if(quote.planCode=="Comp"){
																 if(quote.compPlan=="Gold")
																 $('#yourQuoteTitle').html('綜合保險(金)');
																else
																 $('#yourQuoteTitle').html('綜合保險(銀)');
																}
																else
																$('#yourQuoteTitle').html('第三者保險');
																}
																else{
																if(quote.planCode=="Comp"){
																 if(quote.compPlan=="Gold")
																 $('#yourQuoteTitle').html('Comprehensive Gold');
																else
																 $('#yourQuoteTitle').html('Comprehensive Silver');
																}
																else
																$('#yourQuoteTitle').html('Third Party');
																}
												            $('#addOnPaAmt').html(formatCurrency(addOnPaQuote));
												            $('#addOnTppdAmt').html(formatCurrency(addOnTppdQuote));
												         
												            if(quote.personalAccident == true)
												            {
												            	$('.summary__addOn1').removeClass('hidden');
												            	$('.summary__addOn').removeClass('hidden');
												             	$('#paa').html(formatCurrency(addOnPaQuote));
												            }
												            	
												            if(quote.thirdPartyPropertyDamage == true)
												            {	
												            	$('.summary__addOn2').removeClass('hidden');
												            	$('.summary__addOn').removeClass('hidden');
												            	$('#cia').html(formatCurrency(addOnTppdQuote));
												            }
												         	updateTotalDue(totalDue);
												         	$(".yourQuoteAmmount").html ($("#yourQuoteAmmount").html());
												         
										     });
											$("#payment-errors").html("Payment failed");
											$('#loading-overlay').modal("hide");
										},
										error : function(error) {
											$("#payment-errors").html(getBundle(getBundleLanguage, "member.registration.duplicated_payment.error"));
										}
									});
						}
						//quote
						console.dir(quote);
						$(".carmake").html(quote.carDetail.makeCode);
						$(".carmodel").html(quote.carDetail.model);
						$(".carcc").html(quote.carDetail.engineCapacity);
						$(".carmade").html(quote.carDetail.yearOfManufacture);
						$(".carvalue").html(quote.carDetail.estimatedValue);
						
						$(".cardiscount").html(quote.applicant.ncb + "%");

						//car details
						$(".carchasis").html(quote.carDetail.chassisNumber);
						/*if(quote.carDetail.makeCode == "Tesla")
						{	
							$(".carcubic-box").hide();
							$(".carcubic-title").html($(".carbankmortgageOther").html())
							$(".carcubic").html($(".carotherbankmortgage").val())
						}else*/
							$(".carcubic").html(quote.carDetail.engineCapacity);
						$(".carmodeldocument").html(quote.carDetail.modelDesc);
							
					
					
						
						//applicant detail
						$(".fullname").html(quote.applicant.name);
						$("input[name=fullName]").val(quote.applicant.name);
						$(".contactno").html(quote.applicant.contactNo);
						$("input[name=mobileNo]").val(quote.applicant.contactNo);
						$(".birth").html(quote.applicant.dateOfBirth);
						$(".email").html(quote.applicant.email);
						$("input[name=EmailAddress]").val(quote.applicant.email);
						var hkid = quote.applicant.hkid; 
						$(".hkid").html(hkid.toString().toUpperCase());
						$(".policystart").html(quote.policyStartDate);
						$(".policyend").html(quote.policyEndDate);
						$(".policyend").html(quote.applicant.modelDesc);

						//drivers
						$(".driver1fullname").html(quote.driver[0].name);
						
						$(".driver1birth").html(quote.driver[0].dateOfBirth);
						hkid = quote.driver[0].hkid; 
						$(".driver1hkid").html(hkid.toString().toUpperCase());

						
						  $.ajax({
				                url: context + '/api/iMotor/list/bankMortgages',
				                type: 'GET',
				                dataType: 'json',
				                error: function() {
				                        callback();
				                    },
				                    success: function(res) {
										var checked=false;
				                        $.each(res, function(i, item) {
								
											if(item.desc == quote.carDetail.bankMortgageName)
											{	$(".carbankmortgage").html(item.desc);checked=true;}
										});
										if(checked==false)
										{	$(".carbankmortgageNormal").html($(".carbankmortgageOther").html());
											$(".carbankmortgage").html(quote.carDetail.bankMortgageName)}
				                    }
				            });
					
						  
						$.ajax({
			                url: context + '/api/iMotor/list/districts',
			                type: 'GET',
			                dataType: 'json',
			                error: function() {
			                       
			                    },
			                    success: function(res) {

			                    	$.each(res, function(i, item) {
										
											if(item.desc == quote.applicant.correspondenceAddress.district )
											{
												
												if(motorlanguage == item.lang)
												{
						
													/*if(item.remark == "NEW TERRITORIES")
														item.remark = "新界";
													else if(item.remark == "HONG KONG")
														item.remark = "香港";
													else if(item.remark == "KOWLOON")
														item.remark = "九龍";
													*/
													if(item.remark == "新界")
														item.remark = "New Territories";
													else if(item.remark == "香港")
														item.remark = "Hong Kong";
													else if(item.remark == "九龍")
														item.remark = "Kowloon";
													
													//item.desc = item.desc;
												}	
												
												var desc = item.desc;
												var remark = item.remark;
												var address="";
												if(quote.applicant.correspondenceAddress.flat !="")
													address = "Flat "+quote.applicant.correspondenceAddress.flat +","
												
												if(quote.applicant.correspondenceAddress.floor !="")
													address += "Floor "+quote.applicant.correspondenceAddress.floor +","
													
												if(quote.applicant.correspondenceAddress.block !="")
													address += "Block "+quote.applicant.correspondenceAddress.block +","
														
												if(quote.applicant.correspondenceAddress.building !="")
													address += quote.applicant.correspondenceAddress.building +","
												
												if(quote.applicant.correspondenceAddress.estate !="")
														address +=quote.applicant.correspondenceAddress.estate +","	
												
												if(quote.applicant.correspondenceAddress.streetNo !="")
															address += quote.applicant.correspondenceAddress.streetNo +","		
														
												if(quote.applicant.correspondenceAddress.streetName !="")
													address += quote.applicant.correspondenceAddress.streetName +","

												address += desc.toString().toLowerCase()
												+ ","
												+ remark.toString().toLowerCase();
												$(".address").html(address);
												$(".address").capitalise1().capitalise2();
												var add =$(".address").html();
												$(".address").html(add.substring(0, add.length-2));
												return false;
											}
										
									});
			                    	
			                    }
						});
						$.ajax({
			                url: context + '/api/iMotor/list/occupations/v2',
			                type: 'GET',
			                dataType: 'json',
			                error: function() {
			                        callback();
			                    },
			                    success: function(res) {
									console.dir(res);
									var newres= new Array();
			                    	var total = res.length;
			                    	$.each(res, function(i, item) {
			                    		if(item.lang==motorlanguage) 
			                    		newres.push(res[i]);
			                    	});
									console.dir(newres);
					                       
									$.each(newres, function(i, item) {
											if(item.code == quote.applicant.occupation)
												$(".useroccupation").html(item.desc);
									
											if(item.code == quote.driver[0].occupation)
												$(".driver1occupation").html(item.desc);
											
											if(quote.driver.length>1)
											if(item.code == quote.driver[1].occupation)
												$(".driver2occupation").html(item.desc);
											
											if(quote.driver.length>2)
											if(item.code == quote.driver[2].occupation)
												$(".driver3occupation").html(item.desc);
											
											if(quote.driver.length>3)
											if(item.code == quote.driver[3].occupation)
												$(".driver4occupation").html(item.desc);
											
											if(quote.driver.length>4)
											if(item.code == quote.driver[0].occupation)
												$(".driver5occupation").html(item.desc);
									});
			                    }
			            });
						
						
						var cur_item = 1;

						$(quote.driver).each(
								function(i, item) {
									$(".driver" + (i + 1) + "fullname").html(
											quote.driver[i].name);
									$(".driver" + (i + 1) + "birth").html(
											quote.driver[i].dateOfBirth);
									var hkid =quote.driver[i].hkid; 
									$(".driver" + (i + 1) + "hkid").html(
											hkid.toString().toUpperCase());
									cur_item++;
								});

						for (var i = quote.driver.length + 1; i < 6; i++) {
							$("#driver" + i).hide();
						}
						
						var eCarApi = context + '/api/iMotor/carDetails/' + quote.carDetail.makeCode + "/supplement" + "?carModel=" + quote.carDetail.model; 
		            	$.ajax({
		            		  url: eCarApi,
		            		  contentType: "application/json",
		            		  type: 'GET',
		            		  dataType: "json",
		            		  success: function(data) {
		            	            if(data.electricCar){ //true
		            	            	$(".elect").css({"display":"flex"});
		            	            	$(".non-elect").css({"display":"none"});
		            	            }else
		            	            {
		            	            	$(".elect").css({"display":"none"});
		            	            	$(".non-elect").css({"display":"flex"});
		            	            }
		            	            if(quote.carDetail.bankMortgage == false)
		      						  $(".carbankmortgageBox").hide();
		            	        	if(quote.carDetail.bankMortgageName==null)
		    							$(".carbankmortgageBox").hide();
		            		  }
		            	});
		          	  	
						//no claim discount
						$.ajax({
			                url: context + '/api/iMotor/list/insurers',
			                type: 'GET',
			                dataType: 'json',
			                error: function() {
			                        callback();
			                    },
			                    success: function(res) {
			                          			       			                     
			                            $.each(res, function(i, item) {
											
											if(item.code == quote.nameOfPreviousInusrancer)
												$(".nameofprevinsurance").html(item.desc);
										});			    							
			                    }
			            });
						
						$(".regofdocument").html(quote.regNoofPreviousPolicy);
						$(".previnsuranceexpirydate").html(
								quote.expDateOfPreviousInsurance);
						$(".previouspolicyno").html(quote.previousPolicyNo);

						/*$.ajax({
							type : "POST",
							data : JSON.stringify(quote),
							dataType : "json",
							contentType : "application/json",
							cache : false,
							async : false,
							url : context + "/api/iMotor/quote",
							success : function(data) {
								console.dir(data);
								$('.price').html(
										formatCurrency(data.amountDueAmount));
								$('#loading-overlay').modal("hide");
							},
							error : function(error) {

							}
						});*/
						//Check UserLogin
						$.ajax({
							url : fwdApi.url.session,
							type : "get",
							contentType : "application/json",
							cache : false,
							async : false,
							error : function(xhr, textStatus, errorThrown) {

								if (xhr.status == 404) {
									$(".before-login").show();
								} else {
									$(".before-login").show();
								}
							},
							success : function(response) {
								if (response) {
									if (response.userName == '*DIRECTGI') {
										$(".before-login").show();
										return false;
									} else
										$(".before-login").hide();
								}
							}
						});

						$('#cardNo1').payment('formatCardNumber');
						$('#cardNo1').keyup(function() {
							var replaceSpace = $(this).val();
							var result = replaceSpace.replace(/\s/g, '');
							$("#cardnumber").val(result);
						});
						$(".paymentType__btn").on("click", function() {
							switchPayment($(this));
						});
						$("#button_confirm").on("click", function(e) {
							
							confrimPayment('no-claim', 'gateway', 'no-claim');
						});

						function confrimPayment(form, gatewayUrlId,
								paymentFormId) {
							
							/*if($("#checkbox-agree").val()!="true")
							{	$(".checkbox-agree").removeClass('hide');
								return false;
							}
							else
								$(".checkbox-agree").addClass('hide');
							*/
							var selectedPaymentType = $(
									"input:radio[name=paymentGroup]:checked")
									.val();
							clicked = false;
							console.log(enablePayment);
							
							if(!payValid(selectedPaymentType))
							{
								if($("#checkbox3").val()!="true")
								{	
									$(".checkbox3").removeClass('hide');
									return false;
								}
								else
									$(".checkbox3").addClass('hide');								
							}
							
							if (payValid(selectedPaymentType) && enablePayment) {
								console.log("enablePayment");
								enablePayment = false;
								var gatewayUrlId = '#' + gatewayUrlId;
								var paymentFormId = '#' + paymentFormId;
								payment(form, gatewayUrlId, paymentFormId);
							}
						}
						function payment(form, gatewayUrlId, paymentFormId) {
							var selectedPaymentType = $(
									"input:radio[name=paymentGroup]:checked")
									.val();
							clicked = false;
							if (payValid(selectedPaymentType) && clicked === false
									&& selectedPaymentType == "cc") {

								clicked = true;
								$("#PaymentingDiv").show();
								
								//quote.policyId 
								//quote.refNumber
								//var quote_policyId = {"policyId":quote.policyId,"refNumber":quote.refNumber};
								
								//check payment
								$("#system-error").addClass("hide");
								$.ajax({
									type : "POST",
									data : JSON.stringify(quote),
									dataType : "json",
									contentType : "application/json",
									cache : false,
									async : false,
									url : context
											+ "/api/iMotor/policy/payment",
									success : function(data) {
										console.dir(data);
										$('input[name="merchantId"]').attr(
												"value", data.merchantId);
										$('input[name="amount"]').attr("value",
												data.amount);
										$('input[name="remark"]').attr("value",
												data.remark);
										$('input[name="orderRef"]').attr(
												"value", data.orderRef);
										$('input[name="currCode"]').attr(
												"value", data.currCode);
										$('input[name="successUrl"]').attr(
												"value", data.successUrl);
										$('input[name="failUrl"]').attr(
												"value", data.failUrl);
										$('input[name="errorUrl"]').attr(
												"value", data.errorUrl);
										$('input[name="payType"]').attr(
												"value", data.payType);
										$('input[name="referenceNo"]').attr(
												"value", data.referenceNo);
										$('input[name="lang"]').attr("value",
												data.lang);
										$('input[name="secureHash"]').attr(
												"value", data.secureHash);
										$('input[name="emailAddress"]').attr(
												"value", data.emailAddress);
										$('input[name="gateway"]').attr(
												"value", data.gateway);
										$('input[name="merchantId"]').attr(
												"value", data.merchantId);
										$('input[name="appId"]').attr("value",
												data.appId);
										$('input[name="merTradeNo"]').attr(
												"value", data.merTradeNo);
										$('input[name="payload"]').attr(
												"value", data.payload);
										$('input[name="paymentType"]').attr(
												"value", data.paymentType);
										$('input[name="sign"]').attr("value",
												data.sign);
										$('input[name="errorMsg"]').attr(
												"value", data.errorMsg);
										var geteWayUrl = data.gateway;
										setTimeout(function() {
											console.dir($("#" + form)
													.serialize());
											
											$("#" + form).attr('action',
													geteWayUrl);
											$("#" + form).submit();
										}, 5000);
									},
									error : function(xhr, textStatus, errorThrown) {
									  	 $('#reason').attr('value', xhr.status);
									 	$("#PaymentingDiv").hide();
									  	 if(chin)
							            		$("#system-error").find('.help-block').html(cnErr[xhr.status]);
							             	 else
										  		$("#system-error").find('.help-block').html(enErr[xhr.status]);
							            	 $("#system-error").removeClass("hide");
									
										return false;
									}
								});

							} else {
								$("#PaymentingDiv").hide();
								enablePayment = true;
								return false;
							}
						}
						function updateTotalDue(amt){
					        $('#yourQuotePrice').html(formatCurrency(amt));
					        $('#yourQuoteAmmount').html(formatCurrency(amt));
					    }
					});
</script>
