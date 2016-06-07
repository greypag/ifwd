<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareDetailsBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script>
perventRedirect=true;

$(document).ready(function(){
    $('#cardNo1').payment('formatCardNumber');
    $('#cardNo1').keyup(function() {
        var replaceSpace = $(this).val();
        var result = replaceSpace.replace(/\s/g,'');
        $("#cardnumber").val(result);
    });
});
</script>

<section>
	<div id="cn" class="container">
		<div class="row">
			<form name="paymentForm" id="paymentForm" method="post">
				<div class="container ">
					<div
						class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
						<div class="center" style="visibility: visible;">
							<h2>
								<fmt:message key="home.summary.jumbo" bundle="${msg}" />
							</h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-active"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle first">
										<span class="status color3"><fmt:message
												key="home.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status color3"><fmt:message
												key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle act third">
										<span class="status color2"><fmt:message
												key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle fourth">
										<span class="status lst-status"><fmt:message
												key="home.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="home.breadcrumb1.item1"
                                bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.item2"
                                bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.item3"
                                bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.item4"
                                bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i> <fmt:message
                            key="home.breadcrumb1.item5" bundle="${msg}" /></li>
                </ol>
				<div class="container pad-none bdr ur-opt-content gray-bg3">
				    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container">
                       <div class="row summary-row">
                            <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
                                <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin" style="margin-left:0px !important;"><fmt:message key="travel.summary.heading" bundle="${msg}" /></h3>
                            </div>
                            <!--
                            <div class="hidden-xs hidden-sm col-md-2 col-lg-2 pad-none summary-header-margin">
                                <h4 class="h4-trav-full">
                                    <a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details" onclick="perventRedirect=false;" ><fmt:message key="travel.summary.subheading" bundle="${msg}" /></a>
                                </h4>
                            </div>
                             -->
                             <div class="clearfix"></div>
                             </div>
                        </div>
                        <div class="row summary-row">
                            <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                    <div class="margin-15">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h2-1 pad-none"><span class="home-summary-applicant h2-3-existing-fwd-head"><fmt:message key="home.summary.changedetail.desc1" bundle="${msg}" /></span></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.fullName}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc3" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><c:out value="${apphkidandpassport.equals('appPassport')?userDetails.passport:userDetails.hkid}" /></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc4" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.emailAddress}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.changedetail.desc5" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.mobileNo}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc1" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${createdPolicy.referenceNo}<input type="hidden" name="referenceNo" value="${createdPolicy.referenceNo}"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="home.summary.plansummary.desc3" bundle="${msg}" /><br/><h4 class="h4-4-full"></h4></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc5.part1" bundle="${msg}" /><br/><fmt:message key="home.summary.plansummary.desc5.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                                <c:if test="${homeCareDetails.applicantRoom != ''}">
	                                                Room/Flat ${homeCareDetails.applicantRoom},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.applicantFloor != ''}">
	                                                Floor ${homeCareDetails.applicantFloor},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.applicantBlock != ''}">
	                                                Block ${homeCareDetails.applicantBlock},
	                                            </c:if>

	                                            <c:if test="${homeCareDetails.applicantBuilding != ''}">
	                                                ${homeCareDetails.applicantBuilding},
	                                            </c:if>
	                                            <br/>
	                                            <c:if test="${homeCareDetails.applicantEstate != ''}">
	                                                ${homeCareDetails.applicantEstate},
	                                            </c:if>
	                                            <c:choose>
		                                            <c:when test="${homeCareDetails.applicantStreetNo != '' && homeCareDetails.applicantStreetName !=''}">
		                                                ${homeCareDetails.applicantStreetNo} ${homeCareDetails.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${homeCareDetails.applicantStreetNo == '' && homeCareDetails.applicantStreetName !=''}">
		                                                ${homeCareDetails.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${homeCareDetails.applicantStreetNo != '' && homeCareDetails.applicantStreetName ==''}">
		                                                ${homeCareDetails.applicantStreetNo},
		                                            </c:when>		                                            
	                                            </c:choose>
	                                            <c:if test="${homeCareDetails.applicantDistrictDesc != ''}">
	                                                ${homeCareDetails.applicantDistrictDesc},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.applicantAreaDesc != ''}">
	                                                ${homeCareDetails.applicantAreaDesc}
	                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc6" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                                <c:if test="${homeCareDetails.aRoom != ''}">
	                                                Room/Flat ${homeCareDetails.aRoom},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.aFloor != ''}">
	                                                Floor ${homeCareDetails.aFloor},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.aBlock != ''}">
	                                                Block ${homeCareDetails.aBlock},
	                                            </c:if>

	                                            <c:if test="${homeCareDetails.aBuilding != ''}">
	                                                ${homeCareDetails.aBuilding},
	                                            </c:if>
	                                            <br/>
	                                            <c:if test="${homeCareDetails.aEstate != ''}">
	                                                ${homeCareDetails.aEstate},
	                                            </c:if>
	                                            <c:choose>
		                                            <c:when test="${homeCareDetails.applicantStreetNo != '' && homeCareDetails.applicantStreetName !=''}">
		                                                ${homeCareDetails.applicantStreetNo} ${homeCareDetails.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${homeCareDetails.applicantStreetNo == '' && homeCareDetails.applicantStreetName !=''}">
		                                                ${homeCareDetails.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${homeCareDetails.applicantStreetNo != '' && homeCareDetails.applicantStreetName ==''}">
		                                                ${homeCareDetails.applicantStreetNo},
		                                            </c:when>		                                            
	                                            </c:choose>
	                                            <c:if test="${homeCareDetails.aDistrictDesc != ''}">
	                                                ${homeCareDetails.aDistrictDesc},
	                                            </c:if>
	                                            <c:if test="${homeCareDetails.aAreaDesc != ''}">
	                                                ${homeCareDetails.aAreaDesc}
	                                            </c:if>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc7.part1" bundle="${msg}" /><br/><fmt:message key="home.summary.plansummary.desc7.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${homeCareDetails.netFloorAreaDesc}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc8" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="home.summary.plansummary.yearly" bundle="${msg}" /></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="home.summary.plansummary.desc9.part1" bundle="${msg}" /><br><fmt:message key="home.summary.plansummary.desc9.part2" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="home.summary.plansummary.from" bundle="${msg}" /> ${effectiveDate } <fmt:message key="home.summary.plansummary.to" bundle="${msg}" /> ${effectiveEndDate}</div>
                                        </div>
                                        <%
                                            HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request.getAttribute("homeCareDetails");
                                        %>
                                        <div class="row summary-row">
	                                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.originalamount" bundle="${msg}" /></div>
	                                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="travel.dollar" bundle="${msg}" /> <%=String.format("%.2f",Double.parseDouble(homeCareDetails.getGrossPremium()))%></div>
	                                    </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="home.summary.plansummary.desc10" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                                <span class="h4-4-orange-b pad-none"><fmt:message key="travel.dollar" bundle="${msg}" /> <%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%></span>
                                            </div>
                                        </div>

	                                </div>
	                                <div class="clearfix"></div>
                                </div>
				            </div>
				            <div class="clearfix"></div>
				            </div>
						</div>



					</div>
					<div class="clearfix"></div>
				</div>
				<input type="hidden" name="merchantId"
					value="${createdPolicy.merchantId}"> <input
					type="hidden" name="amount" value="${totalDue.trim()}"> <input
					type="hidden" name="orderRef"
					value="${confirm.transactionNo}"> <input
					type="hidden" name="currCode"
					value="${createdPolicy.currCode}">
					<input type="hidden" name="remark" value="${referralCode.trim()}">
					<input type="hidden" name="successUrl" value="${path}"> <input
					type="hidden" name="failUrl" value="${failurePath}"> <input
					type="hidden" name="errorUrl" value="${failurePath}"> <input
					type="hidden" name="payType"
					value="${createdPolicy.paymentType}">
					<%
						String payLang = (String)session.getAttribute("language");
						//payLang = payLang.substring(0, 1);
						if (session.getAttribute("language").equals("tc"))
							payLang = "c";
						else
							payLang = "e";

						//System.out.println("getLanguage" + session.getAttribute("language"));
						//System.out.println("payLang" + payLang);
					%>


<%-- 				<input type="hidden" name="lang" value="<%=payLang%>"> <input --%>
				<input type="hidden" name="lang" value="C"> <input
					type="hidden" name="secureHash" value="${confirm.secureHash}">
				<input type="hidden" id="emailAddress" name="emailAddress"
					value="${userDetails.emailAddress}"> <input
					type="hidden" id="transactionDate" name="transactionDate"
					value="${effectiveDate}"> <input type="hidden" id="gateway"
					name="gateway" value="${createdPolicy.paymentGateway}">
				<div class="gray-bg1">
                    <div style="width:80%;margin-left:10%;">
                    <div class="col-xs-12 pad-none">
						<h2 class="from-control" style="padding:0px !important;">
							<fmt:message key="home.summary.pmtdetail.heading" bundle="${msg}" />
						</h2>
						<span id="paymentGatewayErrorMsg" class="text-red">
                            <c:choose>
							   <c:when test="${errormsg=='Invalid Card Verification Number'}">
							       <fmt:message key="common.payment.errormsg" bundle="${msg}" />
							   </c:when>
							   <c:otherwise>
                                   ${errormsg }
                               </c:otherwise>
						   </c:choose>
                       </span>
					</div>








					<div class="col-xs-12 pad-none">
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="home.summary.pmtdetail.desc1" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float" style="display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5">Payment Method</label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <label class="radio-inline">
                                 <input type="radio" name="pMethod" checked="checked" value="VISA" id="chkVisa"> VISA
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="pMethod" value="Master" id="chkMaster"> MasterCard
                                </label>

                                <!-- <input type="radio" name="pMethod" value="Diners">Diners
                                    Club <input type="radio" name="pMethod" value="JCB">JCB
                                    <input type="radio" name="pMethod" value="AMEX">AMEX

                                    -->
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="home.summary.pmtdetail.desc2" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="cardNo1" type="tel" class="input-block-level cardnumber" maxlength="19" data-min="19" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardnumber').val());" autocomplete="off"/>

                                <span id="errcardno" class="error-msg"></span>
                                <input id="cardnumber" name="cardNo" type="hidden" class="input-block-level" maxlength="16" data-min="16" autocomplete="off"/>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="home.summary.pmtdetail.desc3" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <div class="styled-select payment-select" id="inputMonth"><select class="pay-details-select"
                                    id="month" name="epMonth" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
                                        <option value="0"><fmt:message key="home.summary.pmtdetail.desc3.month" bundle="${msg}" /></option>
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
                                </select></div>
                                <span id="errmonth"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <div class="styled-select payment-select" id="inputYear"><select class="pay-details-select" id="year"
                                    name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
                                        <option value="0"><fmt:message key="home.summary.pmtdetail.desc3.year" bundle="${msg}" /></option>
<!--                                        <option value="2015">2015</option> -->
<!--                                        <option value="2016">2016</option> -->
<!--                                        <option value="2017">2017</option> -->
<!--                                        <option value="2018">2018</option> -->
<!--                                        <option value="2019">2019</option> -->
<!--                                        <option value="2020">2020</option> -->

<!--                                        <option value="2021">2021</option> -->
<!--                                        <option value="2022">2022</option> -->
<!--                                        <option value="2023">2023</option> -->
<!--                                        <option value="2024">2024</option> -->
<!--                                        <option value="2025">2025</option> -->


                                    <c:forEach begin="0" end="10" varStatus="loop">
                                        <c:set var="currentYear" value="${year + loop.index}" />
                                        <option value="${currentYear}">${currentYear}</option>
                                    </c:forEach>
                                </select></div>
                                <span id="erryear"
                                    class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="home.summary.pmtdetail.desc4" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="holdername" name="cardHolder" type="text"
                                            class="input-block-level"
                                            onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
                                            onkeypress="return alphaOnly(event);"> <span
                                            id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="home.summary.pmtdetail.desc5" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode"
                                            class="input-block-level" autocomplete="off" maxlength="3"
                                            title=""
                                            onblur="replaceNumeric(this);"
                                            onkeypress="return isNumeric(event);" >
                                <span id="errcode"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>




                    <div class="clearfix"></div>
                    <div class="declaration-content" style="margin:0px !important;">
                        <div class="checkbox" style="padding-left: 24px;">
                            <input id="checkbox3" type="checkbox"> <label
                                for="checkbox3"> <fmt:message key="home.summary.declarations" bundle="${msg}" /></label>
                        </div>
                        <span id="errchk1" class="error-msg"></span>

                        <span id="errchk2" class="error-msg"></span>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-left">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="home.summary.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 pull-left">
<!--                                 <a id="button_confirm" onclick="perventRedirect=false;confirmHomeCarePayment('paymentForm', 'gateway', 'paymentForm');" -->
<%--                                     class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" /></a> --%>


								<c:choose>
	<c:when test="${language=='en'}">
<a id="button_confirm" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 EN','USD');confirmHomeCarePayment('paymentForm', 'gateway', 'paymentForm');"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" /></a>
</c:when>
       <c:otherwise>
       <a id="button_confirm" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 ZH','USD');confirmHomeCarePayment('paymentForm', 'gateway', 'paymentForm');"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" /></a>
</c:otherwise>
</c:choose>



                            </div>
                        </div>
                            <div class="clearfix"></div>
                        </div>



                        <hr class="summary-hr"/>



                        <div id="paydoller-wrap" class="declaration-content" style="margin:0px !important;">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="home.action.paydollar" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="home.action.visa" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="home.action.master" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div class="clearfix"></div>
                        </div>
                        <br/>
                        <br/>

























					<!--

					<table class="travel-tb">
						<tbody>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message
											key="home.summary.pmtdetail.desc1" bundle="${msg}" /></label></td>
								<td class="col-lg-8" colspan="2"><div class="controls">
										<div>
											<img
												src="<%=request.getContextPath()%>/resources/images/payment.png"
												alt="">
										</div>
									</div></td>
							</tr>

							<tr style="display: none;">

								<td class="col-lg-4 ht1"><label class="control-label h4-5">Payment
										Method</label></td>
								<td><input type="radio" name="pMethod" id="chkVisa"
									value="VISA">VISA <input type="radio" name="pMethod"
									value="Master" id="chkMaster">MasterCard </!-- <input type="radio" name="pMethod" value="Diners">Diners
									Club <input type="radio" name="pMethod" value="JCB">JCB
									<input type="radio" name="pMethod" value="AMEX">AMEX --/></td>
							</tr>

							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label h4-5"><fmt:message
											key="home.summary.pmtdetail.desc2" bundle="${msg}" /></label></td>
								<td colspan="2"><div class="controls">
										<!-- <input id="cardnumber" name="cardnumber" type="text"
											class="input-block-level" maxlength="16" min="16" title=""
											onkeyup="validatecardnumber(this.value)"
											onBlur="chkMinLength(this.value);"
											onkeypress="return isNumeric(event)"> -->
										<!-- <input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title="" placeholder="Credit card number"
											onkeyup="validatecardnumber(this.value)" onkeypress="return isNumeric(event)"
											onBlur="chkValidCreditCard(this, 'errcardno');"
											 /> -\->
										<input id="cardnumber" name="cardNo" type="text"
											class="input-block-level" maxlength="16" data-min="16"
											title=""
											onkeyup="" onkeypress="return isNumeric(event)"
											onBlur="validatecardnumber(this.value)" /> <span
											id="errcardno" class="error-msg"></span>

									</div></td>
							</tr>



							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc3" bundle="${msg}" /></label></td>
								<td><div class="styled-select payment-select"><select class="pay-details-select" id="month"
									name="epMonth">
										<option value="0"><fmt:message key="home.summary.pmtdetail.desc3.month" bundle="${msg}" /></option>
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
								</select></div></td>
								<td><div class="styled-select payment-select"><select class="pay-details-select" id="year"
									name="epYear">
										<option VALUE=""><fmt:message
												key="home.summary.pmtdetail.desc3.year" bundle="${msg}" /></option>
										<!-\- 										<option VALUE="2015">2015</option> -\->
										<!-\- 										<option VALUE="2016">2016</option> -\->
										<!-\- 										<option VALUE="2017">2017</option> -\->
										<!-\- 										<option VALUE="2018">2018</option> -\->
										<!-\- 										<option VALUE="2019">2019</option> -\->
										<!-\- 										<option VALUE="2020">2020</option> -\->

										<!-\- 										<option VALUE="2021">2021</option> -\->
										<!-\- 										<option VALUE="2022">2022</option> -\->
										<!-\- 										<option VALUE="2023">2023</option> -\->
										<!-\- 										<option VALUE="2024">2024</option> -\->
										<!-\- 										<option VALUE="2025">2025</option> -\->




										<c:forEach begin="0" end="10" varStatus="loop">
											<c:set var="currentYear" value="${year + loop.index}" />
											<option value="${currentYear}">${currentYear}</option>
										</c:forEach>
								</select></div></td>

							</tr>
							<tr>
								<td></td>
								<td><span id="errmonth" class="error-msg"></span></td>
								<td><span id="erryear" class="error-msg"></span></td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc4" bundle="${msg}" /></label></td>
								<td colspan="2">
									<div class="controls">
										<input id="holdername" type="text" name="cardHolder"
											class="input-block-level" title=""
											onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
											onkeypress="return alphaOnly(event);"> <span
											id="errname" class="error-msg"></span>
									</div>
								</td>
							</tr>
							<tr class="control-group">
								<td class="col-lg-4 ht1"><label class="control-label  h4-5"><fmt:message
											key="home.summary.pmtdetail.desc5" bundle="${msg}" /></label></td>
								<td><div class="controls">
										<input id="seccode" name="securityCode" type="password"
											class="input-block-level" autocomplete="off" maxlength="3"
											title=""
											onblur="replaceAlphaNumeric(this);"
											onkeypress="return isAlphaNumeric(event);">

									</div></td>
								<td><img
									src="<%=request.getContextPath()%>/resources/images/icon-card.png"
									alt=""></td>
							</tr>
							<tr>
								<td></td>
								<td><span id="errcode" class="error-msg"></span></td>
								<td></td>
							</tr>


							<tr class="control-group">
								<td></td>
								<td colspan="2">
									<!-\-<a class="sub-link" href="#"><fmt:message key="home.summary.pmtdetail.desc6" bundle="${msg}" /></a>-\->
								</td>
							</tr>




						</tbody>

					</table>
					<div class="clearfix"></div>
					<div class="declaration-content margin-left-small">
						<div class="checkbox">
							<input id="checkbox3" type="checkbox"> <label
								for="checkbox3"> <fmt:message
									key="home.summary.declarations" bundle="${msg}" />
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk1" class="error-msg"></span>
						<!-\- <div class="checkbox">
							<input id="checkbox2" type="checkbox"> <label
								for="checkbox2"> I/We have read and understand the<a
								href="https://home.fwd.com.hk/gidoc/policyprovisions/Easy_HomeCare_JacketLatest.pdf"
								target="_blank" class="sub-link"> policy coverage</a> and <a href="#" class="sub-link">terms and conditions.</a>
							</label>
							<div class="clearfix"></div>
						</div>
						<span id="errchk2" class="error-msg"></span>-\->
						<div class="clearfix"></div>

						<!-\- old buttons
						<div class="hidden-sm hidden-xs pad-none">
							<a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details"
								class="bdr-curve btn btn-primary bck-btn2"><fmt:message
								key="home.summary.action.back" bundle="${msg}" /> </a>
							<input type="submit" class="bdr-curve btn btn-primary nxt-btn margin-left"
								value="<fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" />">
						</div>
						-\->
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	                            <!-\- <a href="<%=request.getContextPath()%>/${language}/home-insurance/user-details" class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;">
	                                <fmt:message key="home.summary.action.back" bundle="${msg}" />
	                            </a> -\->

	                            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="home.summary.action.back" bundle="${msg}" /> </a>
	                        </div>
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
	                            <a onclick="perventRedirect=false; confirmHomeCarePayment('paymentForm', 'gateway', 'paymentForm');"
	                                class="bdr-curve btn btn-primary nxt-btn"><fmt:message key="home.summary.action.confirmPayment" bundle="${msg}" /></a>
	                        </div>
                        </div>



						<!-\-


						<br> <br>
						<div class="pad-none hidden-md hidden-lg">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<a href="" onclick="BackMe()"
									class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">Back
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">


								<input type="submit"
									class="bdr-curve btn btn-primary btn-next text-center"
									value="Pay Now">
							</div>


							<div class="clearfix"></div>

						</div>
						 -\->
						<!-\- <br>
                            <img src="<%=request.getContextPath()%>/resources/images/icon-paydollar.png" alt="">
                        <br>-\->
                        <br/>
                        <!-\- <div style="overflow: hidden;">
                          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 row pull-left">
                              <img src="<%=request.getContextPath()%>/resources/images/icon-paydollar.png" alt="">
                            </div>
                            <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11 pull-left" style="padding-left: 15px;line-height: 45px;">
                              <fmt:message key="travel.action.paydollar" bundle="${msg}" />
                            </div>
                        </div>-\->


                        <hr class="summary-hr"/>
                        <div id="paydoller-wrap" class="declaration-content margin-left-small float">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.paydollar" bundle="${msg}" />
                            </div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.visa" bundle="${msg}" />
                            </div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-left">
                             <fmt:message key="travel.action.master" bundle="${msg}" />
                            </div>
                          </div>
                        </div>

					</div>
					 -->







                    </div>
				</div>
			</form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/end Main Content-->

<div id="PaymentingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img
        style="width: 300px; height: 300px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
</div>


<script>
 // moved to fwd.js -- re-added by Sneh( cannot find in fwd.js)
 var pay = false;
 	function confirmPayment(form) {
 		if (payValid() && !pay) {
 			$('#PaymentingDiv').show();
 	        $("#button_confirm").hide();
 			pay = true;

 			var geteWayUrl = $('#gateway').val();
 			console.log($("#paymentForm").serialize());
 			$.ajax({
 				type : "POST",
 				url : "<%=request.getContextPath()%>/processHomeCarePayment",
				data : $("#paymentForm").serialize(),
				async : false,
				success : function(data) {
					$("#PaymentingDiv").hide();
                    $("#button_confirm").show();
					if (data == 'success') {
						form.action = geteWayUrl;
						$('#PaymentingDiv').hide();
					} else {
						console.log(data);
						$("#button_confirm").show();
						$('#paymentErrorPopup').modal('show');
					}
				}
			});
		}else{
			$('#PaymentingDiv').hide();
			$("#button_confirm").show();
		}

	}

 	var enablePayment=true;

 	var clicked = false;
 	function confirmHomeCarePayment(form, gatewayUrlId, paymentFormId) {
 		if(enablePayment){
            enablePayment=false;
            $("#PaymentingDiv").show();
	 		if (payValid() && clicked === false) {
	 			clicked = true;

	 			var gatewayUrlId = '#' + gatewayUrlId;
	 			var paymentFormId = '#' + paymentFormId;
	 			var method = "<%=request.getContextPath()%>/processHomeCarePayment";

	 			var geteWayUrl = $(gatewayUrlId).val();
	 			console.log($(paymentFormId).serialize());
	 			$.ajax({
	 						type : "POST",
	 						url : method,
	 						data : $(paymentFormId).serialize(),
	 						async : false,
	 						success : function(data) {
	 							clicked = false;
                                //$("#PaymentingDiv").hide();
	 							if (data == 'success') {
	 								setTimeout(function(){
                                        $("#"+form).attr('action', geteWayUrl);
                                        $("#"+form).submit();
                                    }, 3000);
	                            } else {
	                            	console.log(data);
	                            	$("#PaymentingDiv").hide();
                                    enablePayment=true;
	                                $('#paymentErrorPopup').modal('show');
	                                return false;
	                            }

	 						}
	 					});
	 			return true;
	 		}else{
	            $("#PaymentingDiv").hide();
	            enablePayment=true;
	            return false;
	        }

 		}
 	}




	function BackMe() {
		window.history.back();
	}
</script>
