<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.summary .panel-body .detail-row>div span{
	
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
@media ( max-width : 768px) {
	.col-sm-6{
		width:50% !important;
	}
}
@media ( min-width : 768px) {
	
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
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
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
						<div class="col-xs-12 col-sm-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message key="motor.summary.getquote.carmake"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carmake"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.getquote.ccvalue"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="carcc"></span>
								</div>
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.getquote.estimatevalue"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carvalue"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.getquote.claimdiscount"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="cardiscount"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6">
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
						<div class="col-xs-12 col-sm-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.cardetail.chassisno" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carchasis"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.cardetails.regdoc"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="carmodeldocument"></span>
								</div>
								<div class="col-xs-6 text-left odd carbankmortgageField">
									<span><fmt:message key="motor.summary.cardetails.other"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd carbankmortgageField">
									<span class="carotherbankmortgage"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.cardetails.ccvalue" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="carcubic"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span class=" carbankmortgageField"><fmt:message
											key="motor.summary.cardetails.mortgage" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even">
									<span class="carbankmortgage carbankmortgageField"></span>
								</div>
								<div class="col-xs-6 text-left odd hidden-xs carbankmortgageField"></div>
								<div class="col-xs-6 text-right odd hidden-xs carbankmortgageField"></div>
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
						<div class="col-xs-12 col-sm-6">
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
								<div class="col-xs-6 text-left even">
									<span><fmt:message
											key="motor.summary.applicantdetail.address"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right even"
									style="height: 120px; text-align: justify;">
									<span class="address"></span>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6">
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
						<div class="col-xs-12 col-sm-6 driver-detail" id="driver1">
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
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver1occupation"></span>
								</div>
								<div class="col-xs-6 text-left even">
									<span><fmt:message key="motor.summary.driverdetail.dob"
											bundle="${motorMsg}" />h</span>
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
						<div class="col-xs-12 col-sm-6 driver-detail" id="driver2">
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
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver2occupation"></span>
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
						<div class="col-xs-12 col-sm-6 driver-detail" id="driver3">
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
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver3occupation"></span>
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
						<div class="col-xs-12 col-sm-6 driver-detail" id="driver4">
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
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver4occupation"></span>
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
						<div class="col-xs-12 col-sm-6 driver-detail" id="driver5">
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
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.driverdetail.occpuation"
											bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="driver5occupation"></span>
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
						<div class="col-xs-12 col-sm-6">
							<div class="row detail-row">
								<div class="col-xs-6 text-left odd">
									<span><fmt:message
											key="motor.summary.noclaimdis.prevname" bundle="${motorMsg}" /></span>
								</div>
								<div class="col-xs-6 text-right odd">
									<span class="nameofprevinsurance"></span>
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
						<div class="col-xs-12 col-sm-6">
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
									<span class="price"></span>
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
							<div class="col-xs-6 paa-box"">
								<span>Comprehensive Insurance</span>
							</div>
							<div class="col-xs-6 text-right paa-box"">
								<fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="paa"></span>
							</div>
							<div class="col-xs-12 paa-box"">
								<br>
							</div>
							<div class="col-xs-6 cia-box"">
								<span>Comprehensive Insurance</span>
							</div>
							<div class="col-xs-6 text-right cia-box"">
								<fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="cia"></span>
							</div>
							<div class="col-xs-12 cia-box"">
								<br>
							</div>
							<div class="col-xs-6">
								<span><fmt:message key="motor.summary.plan.subtitle"
										bundle="${motorMsg}" /></span>
							</div>
							<div class="col-xs-6 text-right">
								<fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /><span class="subprice"></span>
                   			</div>
							<div class="col-xs-6" style="display:none">
								<span><fmt:message key="motor.summary.plan.discounts"
										bundle="${motorMsg}" /></span>
							</div>
							<div class="col-xs-6 text-right" style="display:none">
								<span>300.00</span>
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
									<fmt:message key="motor.label.currency.front"
										bundle="${motorMsg}" />
									<fmt:message key="motor.label.currency.behind"
										bundle="${motorMsg}" />
									<span class="amountDue"></span>
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
											<div class="col-xs-4 col-sm-2 text-left">
												<span><fmt:message
														key="motor.summary.payment.methodtitle"
														bundle="${motorMsg}" /></span>
											</div>
											<div class="col-xs-8 col-sm-10 text-left">
												<span> <img
													src="/fwdhk/resources/images/motor/master_logo.jpg" alt="" /> <img
													src="/fwdhk/resources/images/motor/visa_logo.jpg" alt="" />
												</span>
											</div>
											<div class="col-xs-12 col-sm-6 text-left">
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<div class="help-block-wrap">
															<input id="holdername" name="cardHolder" type="text"
																class="form-control mdl-textfield__input"
																onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
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
											<div class="col-xs-6 col-sm-3 text-left">
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
											<div class="col-xs-6 col-sm-3 text-left"
												style="margin-top: 5px;">
												<label></label> <select class="form-control" name="epYear"
													id="year"
													onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
													<option value="" disabled selected hidden><fmt:message
															key="motor.summary.payment.year" bundle="${motorMsg}" /></option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
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
											<div class="col-xs-6 col-sm-3 text-left">
												<label></label>
												<div class="form-group">
													<div
														class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
														<div class="help-block-wrap" style="margin-top: 5px;">
															<!--<input type="text" name="securityCode" maxlength="100" class="form-control mdl-textfield__input" id="fullName" required>-->
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
													</div>
												</div>
											</div>
											<div class="col-xs-6 col-sm-3 text-left">
												<span> <img
													src="/fwdhk/resources/images/motor/Payment_secruity_code.jpg" alt="" />
												</span>
											</div>
										</div>
									</div>
									<div class="col-xs-12" style="margin-top: 10px;">
										<div class="custom-checkbox">
											<div class="checkbox">
												<div class="form-group">
													<div class="help-block-wrap">
														<input id="checkbox3" type="checkbox" required> <label
															class="text-left"><small> <fmt:message
																	key="motor.summary.payment.tnc" bundle="${motorMsg}" /></small>
														</label>
														<div class="help-block with-errors text-left"></div>
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

	<!-- testing -->
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

													<!-- 忘記使用者名 -->
													<div class="text-left">
														<a class="heading-h6 btn-sub-pan-trigger"
															href="#sub-pan-forgot-username"><fmt:message
																key="motor.summary.member.username.forget"
																bundle="${motorMsg}" /></a>
													</div>
													<span class="text-left error-msg userNameErrMsg"></span>
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

													<div class="text-left">
														<!--忘記密碼 -->
														<a class="heading-h6 btn-sub-pan-trigger"
															href="#sub-pan-forgot-pwd"><fmt:message
																key="motor.summary.member.password.forget"
																bundle="${motorMsg}" /></a>
													</div>
													<span class="error-msg passwordErrMsg"></span>
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
											</div>
										</form>
									</div>
									<div class="sub-pan" id="sub-pan-forgot-username"
										style="height: 205px;">
										<form name="form-motor-forgot-username"
											id="form-motor-forgot-username" method="post">
											<!-- 電話 inout -->
											<div class="col-xs-12">
												<div class="panel-heading">
													<h4 class="panel-title">
														Forgot Username<a href="#sub-pan-login"
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
													<span class="error-msg mobileNoErrMsg"></span>

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
													<span class="error-msg emailAddressErrMsg"></span>
												</div>
											</div>
											<div class="col-xs-12">
												<div class="form-group">
													<div class="login-button-group forgot-group text-center">
														<button type="button"
															class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
															id="btn-motor-forgot-username">
															<fmt:message key="motor.button.submit"
																bundle="${motorMsg}" />
														</button>
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
													<h4 class="panel-title">
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
													<span class="error-msg mobileNoErrMsg"></span>
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
													<span class="error-msg emailAddressErrMsg"></span>
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
													<span class="error-msg userNameErrMsg"></span>
												</div>
											</div>
											<div class="col-xs-12">
												<div class="login-button-group forgot-group text-center">
													<button type="button"
														class="cta-confirm cta-font cta-orange cta-padding-40 btn-submit"
														id="btn-motor-forgot-pwd">
														<fmt:message key="motor.button.submit"
															bundle="${motorMsg}" />
													</button>
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
												<span class="error-msg FullNameErrMsg"></span>
											</div>
											<div class="form-group">
												<div
													class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
													<!-- <input type="tel" name="mobileNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" id="motorRegisterMobileNo" data-keyblock-num="true">
										<label class="mdl-textfield__label" for="motorRegisterMobileNo">Mobile no.</label>
										-->
													<input type="tel" name="mobileNo"
														class="form-control check-emp-forgotuserpassoword login-input gray-textbox mdl-textfield__input"
														id="motorForgotPwdMobileNo" data-keyblock-num="true">
													<label class="mdl-textfield__label"
														for="mobileNo-forgotpassowrd"><fmt:message
															key="motor.summary.member.mobile" bundle="${motorMsg}" /></label>
												</div>
												<span class="error-msg mobileNoErrMsg"></span>
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
												<span class="error-msg EmailAddressErrMsg"></span>
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
												<span class="error-msg userNameErrMsg"></span>
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
												<span class="error-msg passwordErrMsg"></span>
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
												<span class="error-msg confirmPasswordErrMsg"></span>
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
													<span class="error-msg checkbox1ErrMsg"></span>
												</div>
												<hr>
												<p>
													<fmt:message key="motor.summary.member.tnc.dm"
														bundle="${motorMsg}" />
												</p>
												<div class="checkbox">
													<input id="checkbox3" name="checkbox3" type="checkbox"><label
														for="checkbox3"><fmt:message
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
								style="white-space: initial;">Confirmation</button>
							<br />
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
	src="<%=request.getContextPath()%>/resources/js/motor/register-form.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/motor/custom-datepicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>
<script type="text/javascript">
//var quote = jQuery.parseJSON('{"policyId":"26336399","refNumber":"QFVPE16-001548","applicant":{"ncb":"40","occupation":"A1","driveMoreThanTwo":true,"validAgeGroup":true,"contactNo":"28515450","correspondenceAddress":{"block":"cc","building":"ddd","district":"鴨脷洲","estate":"ee","flat":"aa","floor":"bb","hkKlNt":"香港","streetName":null,"streetNo":null},"dateOfBirth":"23-11-1991","email":"kevin.chan@isobar.com","hkid":"a1234563","name":"chan chan chan"},"carDetail":{"estimatedValue":200000,"makeCode":"BMW","engineCapacity":"2599","model":"120I","yearOfManufacture":"2016","bankMortgage":true,"bankMortgageName":"ACB FINANCE LIMITED","chassisNumber":"1HGCM82633A004352","modelDesc":"MODELZ"},"driver":[{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"a1234567","name":"chan chan chan","occupation":"銀行/金融/保險/投資","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"b1234567","name":"bb bb bb","occupation":"會計","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"c1234567","name":"ccc ccc ccc","occupation":"廣告","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"d1234567","name":"dd dd  ddd","occupation":"演藝娛樂界 (例如：演藝人員/化妝師/髪型師等等)","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"e1234567","name":"ee ee ee","occupation":"航空業","validAgeGroup":"true"}],"planCode":"Third","compPlan":null,"personalAccident":false,"thirdPartyPropertyDamage":false,"policyStartDate":"23-11-2016","nameOfPreviousInusrancer":"axa","regNoofPreviousPolicy":"11233588","expDateOfPreviousInsurance":"27-05-2016","previousPolicyNo":"P122345","motorCareDeclaration":[{"declarationAns":true,"declarationNo":"q1"},{"declarationAns":true,"declarationNo":"q2"},{"declarationAns":true,"declarationNo":"q3"}],"psNoDM":"true","psNoProvidePersonalData":"true","psPICS":"true"}');

var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?request.getParameter("data").replace("&quot;", "\""):"{}"%>');
function BackMe() {
	
	/*if(getUrlParameter("edit")=="yes")
		window.location="/fwdhk/en/motor-insurance/rider-options?edit=yes";
	else
		window.location="/fwdhk/en/motor-insurance/rider-options";*/
	//window.history.back();
	 var $form = $("<form id='quote-form' />");
    	 $form.attr("action", "declarations?back=yes");
     $form.attr("method", "post");
     var $quote = $("<input type='hidden' name='data' />");
     $quote.attr("value", JSON.stringify(quote));
     $form.append($quote);
     $("body").append($form);
     $('#quote-form').submit();
}	

	var ApiPayment = new Array();
	var enablePayment = true;
	var clicked = false;
	$(document)
			.ready(
					function() {
						
						$("#headingOne").on("click",function(){
							$("#collapseTwo").removeClass();
							$("#collapseTwo").addClass("panel-collapse collapse");
						});
						$("#headingTwo").on("click",function(){
							$("#collapseOne").removeClass();
							$("#collapseOne").addClass("panel-collapse collapse");
						});
						
						
						
						$.ajax({
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
							});

						$('.edit_quote')
								.on(
										'click',
										function(event) {
											var $form = $("<form id='quote-form' />");
											$form
													.attr("action",
															"get-quote?plan=third&edit=yes");
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

						if (getUrlParameter("paymentGatewayFlag") == "1"
								&& getUrlParameter("refNum") != null) {
							var summary = {
								"refNumber" : getUrlParameter("refNum"),
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
											$("#payment-errors").html(
													"Payment failed");
										},
										error : function(error) {
								
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
						$(".carcubic").html(quote.carDetail.engineCapacity);
						$(".carmodeldocument").html(quote.carDetail.modelDesc);
							
					
						if(quote.carDetail.bankMortgageName==null)
							$(".carbankmortgageField").hide();
						
						//applicant detail
						$(".fullname").html(quote.applicant.name);
						$(".contactno").html(quote.applicant.contactNo);
						$(".birth").html(quote.applicant.dateOfBirth);
						$(".email").html(quote.applicant.email);
						$(".hkid").html(quote.applicant.hkid);
						$(".policystart").html(quote.policyStartDate);
						var address = quote.applicant.correspondenceAddress.flat
								+ ", "
								+ quote.applicant.correspondenceAddress.floor
								+ ", "
								+ quote.applicant.correspondenceAddress.block
								+ ", "
								+ quote.applicant.correspondenceAddress.building
								+ ", "
								+ quote.applicant.correspondenceAddress.streetName
								+ ", "
								+ quote.applicant.correspondenceAddress.streetNo
								+ ", "
								+ quote.applicant.correspondenceAddress.estate
								+ ", "
								+ quote.applicant.correspondenceAddress.district
								+ ", "
								+ quote.applicant.correspondenceAddress.hkKlNt;
						$(".address").html(address);
						$(".policyend").html(quote.applicant.modelDesc);

						//drivers
						$(".driver1fullname").html(quote.driver[0].name);
						
						$(".driver1birth").html(quote.driver[0].dateOfBirth);
						$(".driver1hkid").html(quote.driver[0].hkid);

						  $.ajax({
				                url: context + '/api/iMotor/list/bankMortgages',
				                type: 'GET',
				                dataType: 'json',
				                error: function() {
				                        callback();
				                    },
				                    success: function(res) {

				                        $.each(res, function(i, item) {
								
											if(item.code == quote.carDetail.bankMortgageName)
												$(".carbankmortgage").html(item.desc);
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
									$(".driver" + (i + 1) + "hkid").html(
											quote.driver[i].hkid);
									cur_item++;
								});

						for (var i = quote.driver.length + 1; i < 6; i++) {
							$("#driver" + i).hide();
						}

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

						$.ajax({
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
							},
							error : function(error) {

							}
						});
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
							var selectedPaymentType = $(
									"input:radio[name=paymentGroup]:checked")
									.val();
							clicked = false;
							console.log(enablePayment);

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
							if (payValid(selectedPaymentType)
									&& clicked === false
									&& selectedPaymentType == "cc") {

								clicked = true;
								$("#PaymentingDiv").show();
								
								//quote.policyId 
								//quote.refNumber
								//var quote_policyId = {"policyId":quote.policyId,"refNumber":quote.refNumber};
								
								//check payment
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
											alert(geteWayUrl);
											$("#" + form).attr('action',
													geteWayUrl);
											$("#" + form).submit();
										}, 5000);
									},
									error : function(error) {
										console.dir(error);
										alert("error");
										$("#loading-overlay").modal("hide");
										return false;
									}
								});

							} else {
								$("#PaymentingDiv").hide();
								enablePayment = true;
								return false;
							}
						}
					});
</script>