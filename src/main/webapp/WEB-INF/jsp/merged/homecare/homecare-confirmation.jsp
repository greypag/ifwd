<%@page import="com.ifwd.fwdhk.model.PlanDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-datetimepicker.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/moment.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap-datetimepicker.min.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<%@page import="com.ifwd.fwdhk.util.Constants"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
  /* Show Different Referral Benefits for Visitor & Member */
  String currUser = session.getAttribute("username").toString().trim();
  Boolean isMember = !(currUser == null || currUser.equals(Constants.DEFAULT_USERNAME));
  String userType = (isMember)?"member":"visitor";

  String key_promocodeLabel = "home.confirmation." + userType + ".promocodeLabel";
  String key_referralCodeDesc = "home.confirmation." + userType + ".referralCodeDesc";

  String key_header1 = "home.referral.benefits." + userType + ".table.header1";
  String key_header2 = "home.referral.benefits." + userType + ".table.header2";
  String key_header3 = "home.referral.benefits." + userType + ".table.header3";
  String key_header4 = "home.referral.benefits." + userType + ".table.header4";

  String key_row1col1 = "home.referral.benefits." + userType + ".table.row1.col1";
  String key_row1col2 = "home.referral.benefits." + userType + ".table.row1.col2";
  String key_row1col3 = "home.referral.benefits." + userType + ".table.row1.col3";
  String key_row1col4 = "home.referral.benefits." + userType + ".table.row1.col4";

  String key_row2col1 = "home.referral.benefits." + userType + ".table.row2.col1";
  String key_row2col2 = "home.referral.benefits." + userType + ".table.row2.col2";
  String key_row2col3 = "home.referral.benefits." + userType + ".table.row2.col3";
  String key_row2col4 = "home.referral.benefits." + userType + ".table.row2.col4";

  String key_row3col1 = "home.referral.benefits." + userType + ".table.row3.col1";
  String key_row3col2 = "home.referral.benefits." + userType + ".table.row3.col2";
  String key_row3col3 = "home.referral.benefits." + userType + ".table.row3.col3";
  String key_row3col4 = "home.referral.benefits." + userType + ".table.row3.col4";

  String key_row4col1 = "home.referral.benefits." + userType + ".table.row4.col1";
  String key_row4col2 = "home.referral.benefits." + userType + ".table.row4.col2";
  String key_row4col3 = "home.referral.benefits." + userType + ".table.row4.col3";
  String key_row4col4 = "home.referral.benefits." + userType + ".table.row4.col4";

  String key_row6col1 = "home.referral.benefits." + userType + ".table.row6.col1";
  String key_row6col2 = "home.referral.benefits." + userType + ".table.row6.col2";
  String key_row6col3 = "home.referral.benefits." + userType + ".table.row6.col3";
  String key_row6col4 = "home.referral.benefits." + userType + ".table.row6.col4";

  String key_disclaimer1 = "home.referral.benefits." + userType + ".disclaimer1";
  String key_disclaimer2Part1 = "home.referral.benefits." + userType + ".disclaimer2.part1";
  String key_disclaimer2Part2 = "home.referral.benefits." + userType + ".disclaimer2.part2";
  String key_disclaimer2Part3 = "home.referral.benefits." + userType + ".disclaimer2.part3";
  String key_disclaimer3Part1 = "home.referral.benefits." + userType + ".disclaimer3.part1";
  String key_disclaimer3Part2 = "home.referral.benefits." + userType + ".disclaimer3.part2";
  String key_disclaimer3Part3 = "home.referral.benefits." + userType + ".disclaimer3.part3";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">



<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>-->




</head>
<body>

	<!--Desktop-header-->
	<!--/#main-Content-->
	<section>
		<div class="container">
			<div class="row">
				<form>
					<div class="container ">
						<div class="col-md-12 shop-tracking-status">
							<div class="center" style="visibility: visible;">
								<h2><fmt:message key="home.confirmation.jumbo" bundle="${msg}" /></h2>
							</div>
							<br>
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status color3"><fmt:message key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle act fourth">
										<span class="status lst-status color3"><fmt:message key="home.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                    <ol class="breadcrumb pad-none">
                        <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                        <li><fmt:message key="home.breadcrumb1.item2" bundle="${msg}" />  <i
                            class="fa fa-caret-right"></i></li>
                        <li><fmt:message key="home.breadcrumb1.item3" bundle="${msg}" /><i
                            class="fa fa-caret-right"></i></li>
                        <li><fmt:message key="home.breadcrumb1.item4" bundle="${msg}" /> <i
                            class="fa fa-caret-right"></i></li>
                        <li><fmt:message key="home.breadcrumb1.item5" bundle="${msg}" /></li>
                        <li class="active "><i class="fa fa-caret-right"></i>
                        <fmt:message key="home.breadcrumb1.item6" bundle="${msg}" />
                        </li>
                    </ol>
					<c:if test="${not empty errormsg}">
						<div id="confirm-error-msg" class="alert alert-danger hide"
							role="alert">${errormsg}</div>
					</c:if>
					<div class="container pad-none bdr" style="margin-top:0px;">
						<div class="col-sm-12 pad-none">
						  <div style="width:80%;margin-left:10%">
							<h3 class="bmg-confirmation-h3">
								<fmt:message key="home.confirmation.msg.part1" bundle="${msg}" />
								<fmt:message key="home.confirmation.msg.part2" bundle="${msg}" />
								<fmt:message key="home.confirmation.msg.part3" bundle="${msg}" />
								<fmt:message key="home.confirmation.msg.part4" bundle="${msg}" />
								<fmt:message key="home.confirmation.msg.part5" bundle="${msg}" />
								<strong>${emailID}</strong>
								<fmt:message key="home.confirmation.msg.part6" bundle="${msg}" />
							</h3>
							<h4 class="bmg-confirmation-h4">
								<strong><fmt:message key="home.confirmation.policyNo" bundle="${msg}" /></strong>
								<span> ${policyNo}</span>
							</h4>
						</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-40">
							 <div style="width:80%;margin-left:10%">
								<h5 class="bmg-confirmation-h5">
									<strong><fmt:message key="<%=key_promocodeLabel%>" bundle="${msg}" /></strong><span> <%=session.getAttribute("myHomeReferralCode")%></span>
								</h5>
								<div class="h4-3-b margin-bottom-10" style="color: #f6871e;">
									<fmt:message key="<%=key_referralCodeDesc%>" bundle="${msg}" />
								</div>
								<!-- Referral Code Table -->
					                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none">
					                <% if (isMember) { %>
					                    <div class="hidden-xs hidden-sm">
						                    <table class="table table-bordred table-type-1 margin-bottom-10" style="width:100% !important;">
						                        <tbody>
						                            <tr>
						                                <td><strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong></td>
						                            </tr>
						                            <tr>
						                                <td rowspan="2" style="text-align: left;">
						                                  <strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong>
						                                </td>
						                                <td><strong><fmt:message key="<%=key_row1col2%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row1col3%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row1col4%>" bundle="${msg}" /></strong></td>
						                            </tr>
						                            <tr>
						                                <td style="text-align: left;"><strong><fmt:message key="<%=key_row2col2%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row2col3%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row2col4%>" bundle="${msg}" /></strong></td>
						                            </tr>
						                            <tr>
						                                <td rowspan="3">
						                                  <strong><fmt:message key="<%=key_row3col1%>" bundle="${msg}" /></strong>
						                                </td>
						                                <td><strong><fmt:message key="<%=key_row3col2%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row3col3%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row3col4%>" bundle="${msg}" /></strong></td>
						                            </tr>
<%-- 						                            <tr>
						                                <td><strong><fmt:message key="<%=key_row4col2%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row4col3%>" bundle="${msg}" /></strong></td>
						                                <td><strong><fmt:message key="<%=key_row4col4%>" bundle="${msg}" /></strong></td>
						                            </tr>
						                            <tr>
                                                        <td><strong><fmt:message key="<%=key_row6col2%>" bundle="${msg}" /></strong></td>
                                                        <td><strong><fmt:message key="<%=key_row6col3%>" bundle="${msg}" /></strong></td>
                                                        <td><strong><fmt:message key="<%=key_row6col4%>" bundle="${msg}" /></strong></td>
                                                    </tr> --%>
						                        </tbody>
						                    </table>
					                    </div>

					                    <div class="hidden-md hidden-lg margin-bottom-10">
					                       <div style="margin-top:15px;margin-bottom:15px;">
						                        <h4 style="color: #f68a1d"><strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong></h4>
	                                            <div style="border: 1px solid #f68a1d;width: 100%;"></div>
	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row1col2%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>

	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row1col3%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>

	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row1col4%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>
	                                            <div style="border: 1px solid #f68a1d;width: 100%;"></div>

	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row2col2%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>

	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row2col3%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>

	                                            <div class="confirmation-table-margin">
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
	                                                </div>
	                                                <div class="col-sm-12 col-xs-12">
	                                                    <fmt:message key="<%=key_row2col4%>" bundle="${msg}" />
	                                                </div>
	                                                <div class="clearfix"></div>
	                                            </div>
	                                            <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                                            </div>

                                            <div style="margin-top:15px;margin-bottom:15px;">
                                                <h4 style="color: #f68a1d"><strong><fmt:message key="<%=key_row3col1%>" bundle="${msg}" /></strong></h4>
                                                <div style="border: 1px solid #f5f5f5;width: 100%;"></div>
                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row3col2%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row3col3%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row3col4%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div style="border: 1px solid #f5f5f5;width: 100%;"></div>

<%--                                                 <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row4col2%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row4col3%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row4col4%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div style="border: 1px solid #f5f5f5;width: 100%;"></div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row6col2%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row6col3%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>

                                                <div class="confirmation-table-margin">
                                                    <div class="col-sm-12 col-xs-12">
                                                        <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                                    </div>
                                                    <div class="col-sm-12 col-xs-12">
                                                        <fmt:message key="<%=key_row6col4%>" bundle="${msg}" />
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                                <div style="border: 1px solid #f5f5f5;width: 100%;"></div> --%>
                                            </div>
                                        </div>

					                    <div class="disclaimer">
					                      <p><fmt:message key="<%=key_disclaimer1%>" bundle="${msg}" /></p>
					                      <p><fmt:message key="<%=key_disclaimer2Part1%>" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="referral.tnc.link" bundle="${msg}" />" class="sub-link" target="_blank"><fmt:message key="<%=key_disclaimer2Part2%>" bundle="${msg}" /></a><fmt:message key="<%=key_disclaimer2Part3%>" bundle="${msg}" /></p>
					                      <%-- <p><fmt:message key="<%=key_disclaimer3Part1%>" bundle="${msg}" /><a href="<fmt:message key="pricerite.eshop.link" bundle="${msg}" />" class="sub-link" target="_blank"><fmt:message key="<%=key_disclaimer3Part2%>" bundle="${msg}" /></a><fmt:message key="<%=key_disclaimer3Part3%>" bundle="${msg}" /></a></p> --%>
					                    </div>
					              <% } else { %>
					                    <div class="hidden-xs hidden-sm">
	                                        <table class="table table-bordred table-type-1 margin-bottom-10" style="width:100% !important;">
	                                            <tbody>
	                                                <tr>
	                                                    <td><strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong></td>
	                                                </tr>
	                                                <tr>
	                                                    <td><strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_row1col2%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_row1col3%>" bundle="${msg}" /></strong></td>
	                                                    <td><strong><fmt:message key="<%=key_row1col4%>" bundle="${msg}" /></strong></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
                                        </div>

				                        <div class="hidden-md hidden-lg margin-bottom-10">
					                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
						                    <div class="confirmation-table-margin">
						                        <div class="col-sm-12 col-xs-12">
						                            <strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong>
						                        </div>
						                        <div class="col-sm-12 col-xs-12">
						                            <fmt:message key="<%=key_row1col1%>" bundle="${msg}" />
						                        </div>
						                        <div class="clearfix"></div>
						                    </div>
						                    <div style="border: 1px solid #f68a1d;width: 100%;"></div>

						                    <div class="confirmation-table-margin">
						                        <div class="col-sm-12 col-xs-12">
						                            <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
						                        </div>
						                        <div class="col-sm-12 col-xs-12">
						                            <fmt:message key="<%=key_row1col2%>" bundle="${msg}" />
						                        </div>
						                        <div class="clearfix"></div>
						                    </div>
						                    <div style="border: 1px solid #f68a1d;width: 100%;"></div>

						                    <div class="confirmation-table-margin">
						                        <div class="col-sm-12 col-xs-12">
						                            <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
						                        </div>
						                        <div class="col-sm-12 col-xs-12">
						                            <fmt:message key="<%=key_row1col3%>" bundle="${msg}" />
						                        </div>
						                        <div class="clearfix"></div>
						                    </div>
						                    <div style="border: 1px solid #f68a1d;width: 100%;"></div>

						                    <div class="confirmation-table-margin">
						                        <div class="col-sm-12 col-xs-12">
						                            <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
						                        </div>
						                        <div class="col-sm-12 col-xs-12">
						                            <fmt:message key="<%=key_row1col4%>" bundle="${msg}" />
						                        </div>
						                        <div class="clearfix"></div>
						                    </div>
						                    <div style="border: 1px solid #f68a1d;width: 100%;"></div>
					                    </div>
					              <% } %>
					              </div>
					            </div>
					            <!-- END Referral Code Table -->
							</div>

              <!-- 20160530 -->
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-40">
                <hr>
              </div>

              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-40">
              <div class="col-sm-12 pad-none">
  						  <div style="width:80%;margin-left:10%">
  							<h3 class="bmg-confirmation-h3"><fmt:message key="home.confirmation.Your.application.is.part1" bundle="${msg}" /></h3>
                </div>
              </div>

              <div class="col-sm-12 pad-none">
  						  <div style="width:80%;margin-left:10%">
              <div class="agent-container hc-confimation-vulnerable-customer-form">
                <form action="" method="POST" class="form-horizontal" id="hc-confimation-vulnerable-customer-form">
                   <div class="form-group">
                    <%-- Hidden field 1: policy id
                    Hidden field 2: Applicant ‘Last name’
                    Hidden field 3: Applicant ‘Given name’
                    Hidden field 4: Insurance product name
                    Hidden field 5: timestamp of the submission --%>
                      <input type="hidden" name="userDetails.policyNo" value="${userDetails.policyNo }" />
                      <input type="hidden" name="userDetails.lastName" value="${userDetails.lastName }" />
                      <input type="hidden" name="userDetails.firstName" value="${userDetails.firstName }" />
                      <input type="hidden" name="userDetails.insuranceProductName" value="${userDetails.insuranceProductName }" />
                      <input type="hidden" name="userDetails.timestamp" value="<fmt:formatDate type="both" value="${now}" />" />
                      <%-- <pre>${userDetails.policyNo }</pre> --%>
                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-6">
                        <div class='input-group date' id='datetimepicker10'>
                           <input type='text' class="form-control" id="hc-confimation-vulnerable-customer-date" placeholder="<fmt:message key='home.confirmation.date' bundle='${msg}' />"/>
                           <span class="input-group-addon" style="border: 0; border-radius: 0;">
                               <span class="glyphicon glyphicon-chevron-down">
                               </span>
                           </span>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('#datetimepicker10').datetimepicker({
                                    viewMode: 'years',
                                    format: 'DD-MM-YYYY'
                                });
                            });
                        </script>
                        <span class="err-msg" id="hc-ays-datepicker-message"></span>
                      </div>
                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-6 hc-vulnerable-customer-preferred-time hc-confimation-vulnerable-customer-form">
                        <div class='input-group date' id='datetimepicker3'>
                            <input type='text' class="form-control" name="preferred-time" id="hc-confimation-vulnerable-customer-time" autocomplete="off"  placeholder="<fmt:message key='home.confirmation.time' bundle='${msg}' />"/>
                            <span class="input-group-addon" style="border: 0; border-radius: 0;">
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </span>
                        </div>
                        <script type="text/javascript">
                            $(function () {
                                $('#datetimepicker3').datetimepicker({
                                    format: 'LT'
                                });
                            });
                        </script>
                        <span id="errPromoEmail" class="text-red"></span>
                      </div>

                      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 hc-submit">
                         <button type="button" value="Submit" class="btn" id="hc-confirmation-submit-vulnerable-customer"><fmt:message key="home.confirmation.Submit" bundle="${msg}" /></button>
                      </div>
                   </div>
                </form>
              </div>
              </div>
              </div>
            <script>
            //about preferredDay
            // $(document).on('change', '#hc-confimation-vulnerable-customer-date', function(e) {
            //    if($('#hc-confimation-vulnerable-customer-date').val()!="") {
            //       $('#hc-confimation-vulnerable-customer-form')
            //       .data('bootstrapValidator')
            //       .updateStatus('hc-select-plan-date','VALID');
            //    }
            // });
            // $(document).on('change', '#hc-confimation-vulnerable-customer-tim', function(e) {
            //    if($('#hc-confimation-vulnerable-customer-tim').val()!="") {
            //       $('#hc-confimation-vulnerable-customer-form')
            //       .data('bootstrapValidator')
            //       .updateStatus('hc-select-plan-time','VALID');
            //    }
            // });
            // //ABout yourself validation
            // $('#hc-confimation-vulnerable-customer-form').bootstrapValidator({
            //    excluded: [],
            //    fields: {
            //       "hc-select-plan-date": {
            //          container: '#hc-ays-datepicker-message',
            //          validators: {
            //             notEmpty: {
            //                message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.Date.of.birth" bundle="${msg}" />'
            //             },
            //             callback: {
            //                message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.Date.of.birth" bundle="${msg}" />',
            //                callback: function(value, validator) {
            //                   return value !== document.getElementById('hc-confimation-vulnerable-customer-date').getAttribute('placeholder');
            //                }
            //             }
            //          }
            //       }
            //    }
            // }).on('success.form.bv', function(e) {
            //    e.preventDefault();
            //    var $form = $(this);
            //
            //    var $planOption = $('#hc-plan-option-section');
            //
            //    $('#hc-btn-ay-self').removeClass('hc-pad-bot-50');
            //    $('#hc-about-yoursel-section').removeAttr('style');
            //    $planOption.removeClass('hide-element');
            //
            //    if(getWidth()>=992){
            //       $('.hc-collapse-link[aria-expanded="true"]').parent()
            //          .next()
            //          .find('.hc-panel-body')
            //          .jScrollPane({showArrows: true});
            //    }
            //
            //    $('body, html').animate({
            //       scrollTop: ($planOption.offset().top - stickyHeight) + 'px'
            //    }, 500);
            //
            // });
            </script>
          </div>
          </div>
          <!-- 20160530 -->


							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none gray-bg1" style="padding-bottom:10px;">
						     <div style="width:80%;margin-left:10%; margin-top:20px; margin-bottom:20px;">
								<div class="fwd_partner_title"><fmt:message key="fwd.partners" bundle="${msg}" /></div>
								<div class="col-lg-12 col-md-12 hidden-xs hidden-sm">
						            <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class=" " style="margin-right:15px;">
				                </div>
				                <div class="clearfix"></div>
				                <div class="col-sm-12 col-xs-12 hidden-lg hidden-md" style="text-align:center;">
                                    <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class=" " style="margin-bottom:20px;"><br/>
				                </div>
				                <div class="clearfix"></div>
								<div class="h4-2 margin-left">
	                            <fmt:message key="home.confirmation.sharenow" bundle="${msg}" />
	                            </div>
								<div class="col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class=" wht-bg1 text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/home-insurance?promo=<%=session.getAttribute("myHomeReferralCode")%></div>
                                    <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs"><fmt:message key="link.copy.desktop" bundle="${msg}" /></span><span class="boxMessage hidden-md hidden-lg"><fmt:message key="link.copy.mobile" bundle="${msg}" /></span> <span class="boxDownArrow"></span> </div>
                                </div>
                                <div class="col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <!-- <div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute"><fmt:message key="home.confirmation.copy" bundle="${msg}" /></div>-->

                                    <div class="copy-link pull-left" onclick="autoSelect('toBeCopied');"><fmt:message key="home.confirmation.copy" bundle="${msg}" /></div>

                                    <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/home-insurance/sharing/" data-title="iFWD"></div>
                                </div>
				                <div class="clearfix"></div>
				                </div>
							</div>

							<!--

							<div class="clearfix"></div>
							<br>
							<div class="h4-2 margin-left">
							<fmt:message key="home.confirmation.sharenow" bundle="${msg}" />
							</div>

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					         	<div class="col-lg-6 col-md-6 col-sm-7 col-xs-12 pad-none">
					         		<div class=" wht-bg1 text-center referral-url"><a class=" h4-5-b " id="toBeCopied" href="" target="_blank"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/home-insurance?promo=<%=session.getAttribute("myHomeReferralCode")%></a></div>
					            </div>
					            <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12 pad-none">
						        	<div class="copy-link pull-left" id="d_clip_button" title="Copy Link" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute"><fmt:message key="home.confirmation.copy" bundle="${msg}" /></div>
						        	<!-/- <button type="button" id="d_clip_button" class="my_clip_button" title="Click me to copy to clipboard." data-clipboard-target="fe_text" data-clipboard-text="Default clipboard text from attribute">Copy To Clipboard...</button> -/->
					                <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/home-insurance/sharing/" data-title="iFWD"></div>
					           	</div>
					         </div>

							<div class="clearfix"></div>
							<br>
							<div class="col-lg-12 col-md-12 travel-b">
								<!-/-
								<div class="declaration-content1">
									<b><span class="orange-star">*</span><fmt:message key="home.confirmation.referral.heading" bundle="${msg}" /></b>
									<p class="margin-none">
										<fmt:message key="home.confirmation.referral.desc1" bundle="${msg}" />  <br>
										<fmt:message key="home.confirmation.referral.desc2" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc3" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc4" bundle="${msg}" /> <br>
										<fmt:message key="home.confirmation.referral.desc5" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="referral.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.confirmation.referral.desc6" bundle="${msg}" /></a> <fmt:message key="home.confirmation.referral.desc7" bundle="${msg}" />
									</p>
									<br>
								</div>
								-/->
							</div>

							 -->



						</div>
						<div class="clearfix"></div>
					</div>


					<div class="container pad-none hidden-xs hidden-sm travel-homecare" style="margin-top:30px;">
			            <div class="row-fluid">
			              <div class="center " style="visibility: visible;">
			                <div class="col-md-3 col-lg-3 text-left pad-none">
			                  <img src="<%=request.getContextPath()%>/resources/images/t-care.png" alt=""> </div>
			                <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
			                  <div>
			                    <h4 class="center-h2"><fmt:message key="home.confirmation.other.heading" bundle="${msg}" /></h4>
			                    <div class="h2-32" style="margin-top:30px;">
			                      <strong><fmt:message key="home.confirmation.other.subheading" bundle="${msg}" /></strong>
			                    </div>
			                    <br>
			                    <p class="h4-5"><fmt:message key="home.confirmation.other.desc" bundle="${msg}" /></p><br>
			                    <a href="<%=request.getContextPath()%>/${language}/travel-insurance" class="border-radius btn btn-primary  get-btn" >
			                    <fmt:message key="home.confirmation.other.quote" bundle="${msg}" /></a>
			                  </div>
			                </div>
			              </div>
			            </div>
			          </div>
				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->
<script type=text/javascript>
   var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
   document.write('<scr'+'ipt src="', hostProtocol+
   '://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
</script>
<script type=text/javascript>
   var params = new Array();
   params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
   params[1]='type=Registration_Home';
   params[2]='val=${dueAmount}';
   params[3]='orderId=${transNo}';
   if ('${language}'==='en'){
	   params[4]='promoCode=Regis_Home EN_Sc';
   } else {
	   params[4]='promoCode=Regis_Home ZH_Sc';
   }
   params[5]='valueCurrency=USD';
   params[6]='GCID='; //For Live Tracking only
   params[7]='kw='; //For Live Tracking only
   params[8]='product='; //For Live Tracking only
   k_trackevent(params,'5198');
</script>

<noscript>
	<c:choose>
		<c:when test="${language=='en'}">
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Home&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Home EN_Sc&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
   		</c:when>
   		<c:otherwise>
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Home ZH_Sc&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
   		</c:otherwise>
   </c:choose>
</noscript>
<script>
$(document).ready(function() {
	ga('create', 'UA-60032236-1', 'auto');
	ga('require', 'ecommerce');
	ga('ecommerce:addTransaction', {
	  'id': '${transNo}', // Transaction ID. Required.
	  'revenue': '${dueAmount}', // Grand Total.
	  'affiliation': 'Protect', // Insurance type, e.g. Life
	   'currency': 'HKD'
	  });
	ga('ecommerce:addItem', {
	      'id': '${transNo}', // Transaction ID. Required
	      'name': 'Easy HomeCare', // Product name. Required
	      'category': 'Household', // Category or variation
	      'price': '${dueAmount}', // Unit price
	      'quantity': '1',
	      'currency': 'HKD'
	    });
	ga('ecommerce:send');
});

</script>


</body>

</html>
