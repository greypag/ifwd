<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%@page import="java.text.DecimalFormat"%>

<script>
var promoData = '';

var promoCodeInsertFlag = true;

	function getuserDetails() {


	}

	function submitPlan(){
        $('#loading-overlay').modal({backdrop: 'static',keyboard: false});

        setTimeout(function(){
            if(prepareWorkingHolidayUserDetails(document.getElementById('frmWorkingHolidayPlan'),'frmWorkingHolidayPlan')){
                $("#frmWorkingHolidayPlan").submit();
            }else{
                $('#loading-overlay').modal('hide');
            }
        }, 500);
    }

	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("promoCode").value.trim();
		var promoCodePlaceholder = "<fmt:message key="workingholiday.sidebar.summary.promocode.placeholder" bundle="${msg}" />";
		if (promoCode == "" || promoCode == promoCodePlaceholder) {
			$("#loadingPromo").hide();
			promoCodeInsertFlag = true;
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			$('#inputPromo').addClass('invalid-field');
			flag = false;
		} else {
			if ( promoCode == promoCodePlaceholder ) {
				$("#loadingPromo").hide();
				promoCodeInsertFlag = true;
				$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
				$('#inputPromo').addClass('invalid-field');
				flag = false;
			} else  {
				$('#inputPromo').removeClass('invalid-field');
				$("#errPromoCode").html("");
				flag = true;
			}
		}
		return flag;
	}
	function chkDueAmount() {
		var flag = false;
		var amount = document.getElementById("amountdue").innerHTML;

		if (amount == "0") {
			document.getElementById("errDue").innerHTML = "<fmt:message key="workingholiday.plan.empty" bundle="${msg}" />";
			document.getElementById("errDueMobile").innerHTML = "<fmt:message key="workingholiday.plan.empty" bundle="${msg}" />";
			flag = false;
			console.log("hihi3");
		} else
			flag = true;

		return flag;
	}
	function applyWorkingHolidayPromoCode() {
		if(promoCodeInsertFlag){
            promoCodeInsertFlag = false;

			$("#errPromoCode").html("");

			if(chkPromoCode()){
				$('#loading-overlay').modal({
	                backdrop: 'static',
	                keyboard: false
	            })
	            console.log($('#frmWorkingHolidayPlan input').serialize());
	            $.ajax({
	                type : 'POST',
	                url : '<%=request.getContextPath()%>/applyWorkingHolidayPromoCode',
	                data : $('#frmWorkingHolidayPlan input').serialize(),
	                success : function(data) {
	                	$('#loading-overlay').modal('hide');
                        promoCodeInsertFlag = true;

	                    var json = JSON.parse(data);
	                    promoData = json;
	                    setValue(json);
	                }

	            });
			} else {
				promoCodeInsertFlag = true;
			}

		}
	}

	function setValue(result) {

		var selValue = document.getElementById("inputseletedplanname").value;
		if(result['errMsgs'] !== null){
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
			$('#inputPromo').addClass('invalid-field');
		}else{
			$("#errPromoCode").html("");
			$('#inputPromo').removeClass('invalid-field');

			if (selValue == "B") {
				//var totalDue = parseInt(result["priceInfoA"].totalDue);

				$("#subtotal").html(format(parseFloat(result["priceInfoB"].grossPremium)));
				$("#discountAmt").html(format(parseFloat(result["priceInfoB"].discountAmount)));
				$('#selectedDiscountAmt').val(format(parseFloat(result["priceInfoB"].discountAmount)));
				$('#txtDiscountAmount').val(format(parseFloat(result["priceInfoB"].discountAmount)));
				$("#amountdue").html(format(parseFloat(result["priceInfoB"].totalDue)));
				$('#selectedAmountDue').val(format(parseFloat(result["priceInfoB"].totalDue)));
				$('#selectPlanPremium').val(format(parseFloat(result["priceInfoB"].grossPremium)));


			} else {
				//var totalDue = parseFloat(result["priceInfoB"].totalDue).toFixed(2);
				$("#subtotal").html(format(parseFloat(result["priceInfoA"].grossPremium)));
				$("#discountAmt").html(format(parseFloat(result["priceInfoA"].discountAmount)));
				$('#selectedDiscountAmt').val(format(parseFloat(result["priceInfoA"].discountAmount)));
				$('#txtDiscountAmount').val(format(parseFloat(result["priceInfoA"].discountAmount)));
				$("#amountdue").html(format(parseFloat(result["priceInfoA"].totalDue)));
				$('#selectedAmountDue').val(format(parseFloat(result["priceInfoA"].totalDue)));
				$('#selectPlanPremium').val(format(parseFloat(result["priceInfoA"].grossPremium)));

			}
			$('.totalPriceA').html(format(parseFloat(result["priceInfoA"].totalDue)));
			$('.actualPriceA del').html(format(parseFloat(result["priceInfoA"].grossPremium)));
			$('.totalPriceB').html(format(parseFloat(result["priceInfoB"].totalDue)));
			$('.actualPriceB del').html(format(parseFloat(result["priceInfoB"].grossPremium)));
		}
	}


	function prepareWorkingHolidayUserDetails(form,formId){
		var result = false;
		var formId = '#' + formId;
		var method = "<%=request.getContextPath()%>/wh-details";
		if(chkDueAmount()){
			console.log($(formId).serialize());
			$.ajax({
				type : "POST",
				url : method,
				data : $(formId).serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						form.action = "<%=request.getContextPath()%>/${language}/working-holiday-insurance/user-details";
						result = true;
					} else {
						console.log(data);
						result = false;
						console.log("hihi");
					}
				}
			});

		}else{
			result = false;
			console.log("hihi2");
		}

		return result;
	}

</script>
<style>
.workingholidaybox:hover {
	background-color: #f68a1d;
	-webkit-transition: background-color 500ms linear;
	-moz-transition: background-color 500ms linear;
	-o-transition: background-color 500ms linear;
	-ms-transition: background-color 500ms linear;
	transition: background-color 500ms linear;
}
</style>
<!--/#main-Content-->
<% String cp = request.getContextPath(); %>
<section>
	<div id="cn" class="container">
		<div class="row">
			<form:form name="frmWorkingHolidayPlan" id="frmWorkingHolidayPlan" method="post" modelAttribute="workingholidayQuote" onsubmit="return prepareWorkingHolidayUserDetails(this,'frmWorkingHolidayPlan');" >
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated" style="visibility: visible;">
							<h2 class="workingholiday-plan-jumbo-header"><fmt:message key="workingholiday.quote.jumbo" bundle="${msg}" /></h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									<div class="order-status-timeline-new">
								<!--
										There can be n '.order-status-timeline-completion'
										dots-inactive and dots-active color the dots -->
										<div class="order-status-timeline-completion dots-inactive"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle act first">
										<span class="status"><fmt:message key="workingholiday.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status"><fmt:message key="workingholiday.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status"><fmt:message key="workingholiday.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle fourth">
										<span class="status lst-status"><fmt:message key="workingholiday.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="workingholiday.breadcrumb1.item1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="workingholiday.breadcrumb1.item2" bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="workingholiday.breadcrumb1.item3" bundle="${msg}" /></li>
                </ol>
				<div class="container pad-none bdr gray-bg3">
					<div class="col-lg-8 col-md-8 col-xs-12 col-sm-12 pad-none white-bg1">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose hidden-sm hidden-xs"><fmt:message key="workingholiday.quote.choose" bundle="${msg}" /></h2>
						<%
							QuoteDetails workingholidayQuote = (QuoteDetails) request.getAttribute("quoteDetails");

					    	if (workingholidayQuote != null)
						 	{
					    	 	session.setAttribute("tq", workingholidayQuote);
						 	}

								if (workingholidayQuote.getPlanName().length > 0) {
									for (int i = 0; i < workingholidayQuote.getPlanName().length; i++) {
						%>
						<div class="col-lg-12 col-md-12 plan-box3 workingholidaybox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=workingholidayQuote.getPlanName()[i]%>','<%=workingholidayQuote.getDiscountAmount()[i]%>','<%=workingholidayQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-7 col-xs-7 pad-none">
								<h2>
									<fmt:message key="workingholiday.quote.plan" bundle="${msg}" /> <%=workingholidayQuote.getPlanName()[i]%>
									<br> <%if (workingholidayQuote.getPlanName()[i].equals("A"))
									{%>  <fmt:message key="workingholiday.quote.plan1.type" bundle="${msg}" /><br> HK$ 1,000,000 <fmt:message key="workingholiday.quote.plan1.medical" bundle="${msg}" />
								<%}	else{ %>
										<fmt:message key="workingholiday.quote.plan2.type" bundle="${msg}" /><br> HK$	500,000 <fmt:message key="workingholiday.quote.plan2.medical" bundle="${msg}" />
									<%} %>

								</h2>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-5 col-xs-5">

								<h3><fmt:message key="workingholiday.dollar" bundle="${msg}" /></h3>
								<%
										DecimalFormat df = new DecimalFormat("#,###,###,##0.00");
										if (Double.parseDouble(workingholidayQuote.getDiscountAmount()[i]) == 0) {
									%>
									<h6>
									<span id="grossPremium"<%=i%> class="totalPrice<%=workingholidayQuote.getPlanName()[i]%>"><%=df.format(Double.parseDouble(workingholidayQuote.getGrossPremium()[i]))%></span>
									<span class="hide"><%=workingholidayQuote.getGrossPremium()[i]%></span>
								</h6>
								<span class="del actualPrice<%=workingholidayQuote.getPlanName()[i]%>"><del></del></span>
									<%
										} else {
									%>
									<h6>
									<span id="grossPremium"<%=i%> class="totalPrice<%=workingholidayQuote.getPlanName()[i]%>"><%=df.format(Double.parseDouble(workingholidayQuote.getToalDue()[i]))%></span>
									<span class="hide"><%=workingholidayQuote.getGrossPremium()[i]%></span>
								</h6>
								<span class="del actualPrice<%=workingholidayQuote.getPlanName()[i]%>"><del><%=df.format(Double.parseDouble(workingholidayQuote.getGrossPremium()[i]))%></del></span>
									<%
										}
									%>








							</div>
							<div class="clearfix"></div>
							<!-- Plan benefits -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class=" benefits">
									<%
										String planBenefitKey = "workingholiday.quote.plan" + (i+1)+ ".benefits";
										String planBenefitDesc1Key = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc1";
										String planBenefitDesc2Key = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc2";
										String planBenefitDesc3Key = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc3";
										String planBenefitDesc4Key = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc4";
										String planBenefitDesc1PriceKey = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc1.price";
										String planBenefitDesc2PriceKey = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc2.price";
										String planBenefitDesc3PriceKey = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc3.price";
										String planBenefitDesc4PriceKey = "workingholiday.quote.plan" + (i+1)+ ".benefits.desc4.price";
									%>
										<span><a href="#" class="fwdpanel-minimize uline text-black"><i class="fa fa-plus"></i> <fmt:message key="<%=planBenefitKey%>" bundle="${msg}" /></a> </span>
									</h4>
								</div>
								<div class="fwdpanel-body" style="display: none;">
										<div class="col-xs-11 col-xs-offset-1">
										<div class="row">
											<div class="col-lg-8 col-md-8 col-xs-7 pad-none">
													<i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="<%=planBenefitDesc1Key%>" bundle="${msg}" /></div>
											<div class="col-lg-4 col-md-4 col-xs-5">
												<fmt:message key="<%=planBenefitDesc1PriceKey%>" bundle="${msg}" />
											</div>
										</div>
										<div class="row">
											<div class="col-lg-8 col-md-8 col-xs-7 pad-none">
											<i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="<%=planBenefitDesc2Key%>" bundle="${msg}" />
											</div>
											<div class="col-lg-4 col-md-4 col-xs-5">
												<fmt:message key="<%=planBenefitDesc2PriceKey%>" bundle="${msg}" />
											</div>
										</div>

										<div class="row">
											<div class="col-lg-8 col-md-8 col-xs-7 pad-none">
											<i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="<%=planBenefitDesc3Key%>" bundle="${msg}" /> </div>
											<div class="col-lg-4 col-md-4 col-xs-5">
												<fmt:message key="<%=planBenefitDesc3PriceKey%>" bundle="${msg}" />
											</div>
										</div>
										<div class="row">
											<div class="col-lg-8 col-md-8 col-xs-7 pad-none">
											<i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="<%=planBenefitDesc4Key%>" bundle="${msg}" /></div>
											<div class="col-lg-4 col-md-4 col-xs-5">
												<fmt:message key="<%=planBenefitDesc4PriceKey%>" bundle="${msg}" />
											</div>
											</div>
										</div>
								</div>



								<div class="clearfix"></div>
							</div>
							<!-- / Plan benefits -->
						</div>

						<input type="hidden" name="txtTotalDue"
							value="${quoteDetails.toalDue[i]}"> <input
							type="hidden" name="txtGrossPremium"
							value="${quoteDetails.grossPremium[i]}"> <input
							type="hidden" name="txtDiscountAmount" id="txtDiscountAmount"
							value="${quoteDetails.discountAmount[i]}"> <input
							type="hidden" name="referralCode"
							value="${quoteDetails.referralCode}"> <input
							type="hidden" name="referralName"
							value="${quoteDetails.referralName}">
						<%
							}
						%>
						<%
							}
						%>
						<div class="clearfix"></div>
						<!--Full Coverage-->
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i class="fa fa-plus"></i> <fmt:message key="workingholiday.quote.fullDetails.heading" bundle="${msg}" /></a> </span>
								</h4>
							</div>







							<div class="fwdpanel-body" style="display: none;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!--  Product Highlights  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full ">
                                                    <span><i
                                                            class="fa fa-plus"></i> <a href="#"data-target="#details-popup-1" data-toggle="modal"><fmt:message key="workingholiday.quote.fullDetails.keyFeature1" bundle="${msg}" /></a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="workingholiday.quote.fullDetails.keyFeature1" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
                                                            <p><fmt:message key="workingholiday.quote.fullDetails.keyFeature1.subheading" bundle="${msg}" /></p>
                                                            <br>
                                                            <p>
                                                                <ul class="text-justify">
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc1" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc2" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc3" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc4" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc5" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc6" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
                                                                        <fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc7" bundle="${msg}" />
                                                                    </li>
                                                                    <li>
																		<fmt:message key="workingholiday.quote.fullDetails.keyFeature1.desc8" bundle="${msg}" />
																	</li>
                                                                </ul>
                                                            </p>

                                                        </div>
                                                    </div>
                                                 </div>
                                            </div>

                                        </div>
                                        <!-- /  Product Highlights -->
                                        <!--  Summary of Coverage  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><i
                                                            class="fa fa-plus"></i> <a href="#" data-target="#details-popup-2" data-toggle="modal"><fmt:message key="workingholiday.quote.fullDetails.keyFeature2" bundle="${msg}" /></a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="workingholiday.quote.fullDetails.keyFeature2" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body" >
                                                            <table id="summary" class="table table-bordred">
                                                                <tbody>
																	<tr>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.header1" bundle="${msg}" /></td>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.header2" bundle="${msg}" /></td>
																		<td colspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.header3" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.header3.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.header3.col2" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row1.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row1.col2.desc1" bundle="${msg}" /> <br/><br/>
																			<fmt:message key="workingholiday.quote.fullDetails.table.row1.col2.desc2" bundle="${msg}" />
																		</td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row1.col3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row1.col4" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td rowspan="8"><fmt:message key="workingholiday.quote.fullDetails.table.row2.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc1" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc2" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc3" bundle="${msg}" /></td>
																	</tr>

																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc4" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc4" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc4" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc5" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc5" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc5" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc6" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc6" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc6" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc7" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc7" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc7" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col2.desc8" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col3.desc8" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row2.col4.desc8" bundle="${msg}" /></td>
																	</tr>

																	<tr>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.row3.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col2.desc1.subheading" bundle="${msg}" /><br/>
																			<fmt:message key="workingholiday.quote.fullDetails.table.row3.col2.desc1.content" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col3.desc1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col4.desc1" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col2.desc2.subheading" bundle="${msg}" /><br/>
																			<fmt:message key="workingholiday.quote.fullDetails.table.row3.col2.desc2.content" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col3.desc2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row3.col4.desc2" bundle="${msg}" /></td>
																	</tr>

																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row4.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row4.col2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row4.col3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row4.col4" bundle="${msg}" /></td>
																	</tr>

																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row5.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row5.col2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row5.col3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row5.col4" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row6.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row6.col2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row6.col3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row6.col4" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.row7.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row7.col2.desc1" bundle="${msg}" /></td>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.row7.col3" bundle="${msg}" /></td>
																		<td rowspan="2"><fmt:message key="workingholiday.quote.fullDetails.table.row7.col4" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row7.col2.desc2" bundle="${msg}" /></td>
																	</tr>
																	<tr>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row8.col1" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row8.col2" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row8.col3" bundle="${msg}" /></td>
																		<td><fmt:message key="workingholiday.quote.fullDetails.table.row8.col4" bundle="${msg}" /></td>
																	</tr>
																</tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>

                                        </div>
                                        <!-- / Summary of Coverage -->
                                        <!--   Major Exclusions  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><i
                                                            class="fa fa-plus"></i> <a href="#" data-target="#details-popup-3" data-toggle="modal"><fmt:message key="workingholiday.quote.fullDetails.majorExclusion" bundle="${msg}" /></a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="workingholiday.quote.fullDetails.majorExclusion" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
                                                            <ol class="text-justify">
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc1" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc2" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc3" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc4" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc5" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc6" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc7" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc8" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc9" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc10" bundle="${msg}" /></li>
                                                                <li><fmt:message key="workingholiday.quote.fullDetails.majorExclusion.desc11" bundle="${msg}" /></li>
                                                            </ol>
                                                        </div>
                                                    </div>
                                                </div>
                                             </div>

                                        </div>
                                        <!-- /  Major Exclusions -->

                                        <!--   Premium table (���)  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><i
                                                            class="fa fa-plus"></i> <a href="#" data-target="#details-popup-5" data-toggle="modal"><fmt:message key="workingholiday.quote.fullDetails.priceTable" bundle="${msg}" /></a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="workingholiday.quote.fullDetails.priceTable" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
                                                            <table id="Premium" class="table table-bordred">
                                                                <tbody>
																	<tr>
																		<td rowspan="3"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.single.header1" bundle="${msg}" /></strong></td>
																		<td colspan="2"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.single.header2" bundle="${msg}" /></strong></td>
																	</tr>
																	<tr>
																		<td width="101"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></strong></td>
																		<td width="86"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></strong></td>
																	</tr>
																	<tr>
																		<td width="101" style="background-color: #fff;color: #333"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.single.price1" bundle="${msg}" /></strong></td>
																		<td width="86"><strong><fmt:message key="workingholiday.quote.fullDetails.priceTable.single.price2" bundle="${msg}" /></strong></td>
																	</tr>
																</tbody>
                                                            </table>

                                                        </div>
                                                    </div>
                                                </div>
                                             </div>

                                        </div>
                                        <!-- / Premium table (���) -->
                                    </div>
                                    <!-- / col-md-12 -->
                                </div>
                                <!-- /row -->
                            </div>











							<h4 class="h4-4">
								<i class="fa fa-download"></i> <a
									href="<fmt:message key="workingholiday.brochure.link" bundle="${msg}" />"
									target="_blank"><fmt:message key="workingholiday.quote.fullDetails.download" bundle="${msg}" /></a>
							</h4>
						</div>
				      </div>
					</div>

					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="col-md-12 hidden-sm hidden-xs pad-none">
							<div class="wd2">
								<div class="pull-left" style="width:150px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="workingholiday.sidebar.summary.product" bundle="${msg}" /></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">


								</div>
								<div class="pull-right" style="padding-top: 45px;">
									<div class="text-right h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;">
											<fmt:message key="workingholiday.dollar" bundle="${msg}" />
											<div style="font-weight: bold;font-size: 28px;" class="flightcare-hk" id="plansummary">0</div>
											<input type="hidden" name="txtgrossPremiumAmt" id="txtgrossPremiumAmt" value="">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>

							<!--  //removed the leaving day and return day  -->
						</div>
						<div id="promo-code-body" class="hide-html col-xs-12 pad-none holiday-code-wrapper">
						  <div style="width: 80%;margin-left: 10%;">
								<h3 style="font-size:18px;"><fmt:message key="workingholiday.sidebar.summary.promocode" bundle="${msg}" /></h3>

								<span class="text-red" id="errPromoCode"></span>


								<div id="promo-wrap" class="form-group">
	                                <div class="input-group" id="inputPromo" style="display:inital;width:100%;padding-left: 20px;padding-right: 20px;">
	                                    <input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onfocus="placeholderOnFocus(this,'<fmt:message key="workingholiday.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="workingholiday.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" value="<fmt:message key="workingholiday.sidebar.summary.promocode.placeholder" bundle="${msg}" />">
	                                    <a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onclick="applyWorkingHolidayPromoCode()"><fmt:message key="workingholiday.action.apply" bundle="${msg}" /></a>
	                                </div>
	                            </div>

								<!-- this is new
								<div class="form-group">
									<div class="input-group">
										<input type="text" id="promoCode" name="promoCode"
											class="form-control" placeholder="<fmt:message key="workingholiday.sidebar.summary.promocode.placeholder" bundle="${msg}" />">

										<span style="font-weight: bold; font-size:20px;" class="pointer" onclick="applyworkingholidayPromoCode()">
		                                  <span><fmt:message key="workingholiday.action.apply" bundle="${msg}" /></span>
		                                </span>
									</div>

								</div>
								-->


								<%-- <div class="working-italic workingholiday-getpromocode" style="font-size:14px;">
									<a href="" class="sub-link" data-toggle="modal"
											data-target=".bs-promo-modal-lg"><i><fmt:message key="workingholiday.sidebar.summary.promocode.help" bundle="${msg}" /></i></a>
								</div> --%>
							</div>
					   </div>
                        <div class="col-md-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="workingholiday.sidebar.summary.subtotal" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;"></h3>
							<input type="hidden" name="subTotal" id="subTotal" value="">
							<h3 class="topten h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="workingholiday.sidebar.summary.discount" bundle="${msg}" /></h3>
							<h3 class="topten h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="discountAmt" style="padding-right: 0px;font-size: 18px;">-</h3>
							<input type="hidden" name="selectedDiscountAmt" id="selectedDiscountAmt" value="">
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div style="width:80%;margin-left:10%">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="workingholiday.sidebar.summary.amountDue" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="amountdue" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedAmountDue" id="selectedAmountDue" value="">
							<input type="hidden" name="selectPlanPremium" id="selectPlanPremium" value="">
							<div class="clearfix"></div>
							</div>
                       </div>
                        <div class="col-xs-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<div class="top35 pull-left pad-none" style="width:47%">
								<a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"
									class="bdr-curve btn btn-primary bck-btn"><fmt:message key="workingholiday.action.back" bundle="${msg}" /> </a>
							</div>
							<div class="top35 pull-right pad-none" style="width:47%" >
<c:choose>
	<c:when test="${language=='en'}">
		<button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="submitPlan();javascript:kenshoo_conv('Registration_Step1','<%=workingholidayQuote.getToalDue()%>','','Regis_Working_Holiday_Step1 EN','USD');">
	</c:when>
	<c:otherwise>
		<button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="submitPlan();javascript:kenshoo_conv('Registration_Step1','<%=workingholidayQuote.getToalDue()%>','','Regis_Working_Holiday_Step1 ZH','USD');">
	</c:otherwise>
</c:choose>
				<fmt:message key="workingholiday.action.next" bundle="${msg}" /></button>
</div>



							<div class="clearfix"></div>
							<br> <span class="text-red" id="errDue"></span> <br>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
		</div>
		<input type="hidden" name="planSelected" id="planSeelcted"
			value="${quoteDetails.planSelected}">
		<p class="padding1 workingholiday-plan-disclaimer">
			<fmt:message key="workingholiday.main.other.disclaimer.part1" bundle="${msg}" />
				<a class="sub-link"
				href="https://home.fwd.com.hk/gidoc/policyprovisions/Working_HolidayCare_JacketLatest.pdf"
				target="_blank"><fmt:message key="workingholiday.main.other.disclaimer.part2" bundle="${msg}" /></a>
				<fmt:message key="workingholiday.main.other.disclaimer.part3" bundle="${msg}" /><fmt:message key="workingholiday.main.other.disclaimer.part4" bundle="${msg}" />
		</p>

		<div class="col-xs-12 hidden-md hidden-lg pad-none">
           <div style="width: 80%;margin-left: 10%;">
                <div class="top35 pull-left pad-none" style="width:47%">
                    <a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance"
                        class="bdr-curve btn btn-primary bck-btn"><fmt:message key="workingholiday.action.back" bundle="${msg}" /> </a>
                </div>
                <div class="top35 pull-right pad-none" style="width:47%" >
<c:choose>
	<c:when test="${language=='en'}">
		<button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="submitPlan();javascript:kenshoo_conv('Registration_Step1','<%=workingholidayQuote.getToalDue()%>','','Regis_Working_Holiday_Step1 EN','USD');">
	</c:when>
	<c:otherwise>
		<button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="submitPlan();javascript:kenshoo_conv('Registration_Step1','<%=workingholidayQuote.getToalDue()%>','','Regis_Working_Holiday_Step1 ZH','USD');">
	</c:otherwise>
</c:choose>
				<fmt:message key="workingholiday.action.next" bundle="${msg}" /></button>
</div>

                <div class="clearfix"></div>
                <br> <span class="text-red" id="errDueMobile"></span> <br>
            </div>
        </div>

		</form:form>

	</div>
	<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
  <div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
					<div class="form-container">
						<h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
						<div class="alert alert-success hide proSuccess"></div>
						<h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /></h4>
						<div class="form-group">
							<input type="email" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p><fmt:message key="promotion.get.code.disclaimer" bundle="${msg}" /></p>
							</div>
						</div>
					</div>
				</form>
				</div>


			</div>
		</div>
</div>
<!--/ Get promotion code popup-->

<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>

<!--/end Main Content-->
<script>
	$(document).ready(function() {
		$('#amountdue').html('0');
		$('#subtotal').html('0');
		$('#plansummary').html('0');
		$('#discountAmt').html('0');


		$(".workingholidaybox").animate({
			"background-color" : "#000"
		}, 3000);


		$("#anchor-lang").click(function(){
			var selValue = document.getElementById("inputseletedplanname").value;
		});

		<c:if test="${selectedPlan!=null}">
	    	$('#box${selectedPlan}').click();
		</c:if>
		<c:if test="${referralCode!=null}">
	    	document.getElementById("promoCode").value = '${referralCode}';
	    	applyWorkingHolidayPromoCode();
    	</c:if>
	});
	function changeColorAndPrice(id, planName, discountAmt, totalDue) {
		$("#promo-code-body").fadeIn();
		document.getElementById("errDue").innerHTML = "";
		document.getElementById("errDueMobile").innerHTML = "";

		var selected_div;
		var idArray = [];

		$('.workingholidaybox').each(function() {
			idArray.push(this.id);
		});

		var index = idArray.indexOf(id);
		if (index > -1) {
			idArray.splice(index, 1);
			for (var i = 0; i < idArray.length; i++) {
				$('#' + idArray).removeClass("plan-box5");
				$('#' + idArray).addClass("plan-box3");
			}
		}

		var selected_price = $('#' + id).find('.hide').text();//$('#' + id).find('h6').text();
		selected_price = parseFloat(selected_price).toFixed(2);

		$('#amountdue').html(format(parseFloat(totalDue)));


		/*   $('#selectedAmountDue').value=selected_price; */
		$('#subtotal').html(format(parseFloat(selected_price)));
		$('#plansummary').html(format(parseFloat(selected_price)));
		$('#seletedplanname').html('<fmt:message key="workingholiday.summary.plan" bundle="${msg}" />'+' '+ planName + ' ' + '<fmt:message key="workingholiday.summary" bundle="${msg}"/>');
		$('#inputseletedplanname').val(planName);
		$('#selectPlanPremium').val(format(parseFloat(selected_price)));

		$('#' + id).addClass("plan-box5");

		$('#discountAmt').html(format(parseFloat(discountAmt)));

		document.getElementById("selectedAmountDue").value = format(parseFloat(totalDue.trim()));
		document.getElementById("selectedDiscountAmt").value = format(parseFloat(discountAmt.trim()));
		$('#txtDiscountAmount').val(format(parseFloat(discountAmt.trim())));
		document.getElementById("txtgrossPremiumAmt").value = format(parseFloat(selected_price.trim()));

		if(promoData !== '')
			setValue(promoData);

	}

	function format (num) {
	    return (num.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}


	function sendEmail() {
		$('.proSuccess').addClass('hide');
		if (get_promo_val()) {
			console.log($("#sendmailofpromocode form").serialize());
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
						$('.proSuccess').removeClass('hide').html(getBundle(getBundleLanguage, "system.promotion.success.message"));
					} else {
						console.log(data);
						$('.proSuccess').addClass('hide').html(getBundle(getBundleLanguage, "system.promotion.error.message"))
					}
				},
				error : function() {
				}
			});
		}
		return false;
	}


</script>
