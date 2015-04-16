<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var promoData = '';
	function getuserDetails() {

		//alert($('#frmTravelPlan input').serialize());
		/*     document.frmTravelPlan.action = "getYourDetails"; */
	}
	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("promoCode").value;

		if (promoCode.trim() == "") {
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function chkDueAmount() {
		var flag = false;
		var amount = document.getElementById("amountdue").innerHTML;

		if (amount == "0") {
			document.getElementById("errDue").innerHTML = "請至少選擇一個計劃";
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function applyPromoCode() {
		
		$("#errPromoCode").html("");
		
		if(chkPromoCode())
		$.ajax({
			type : 'POST',
			url : 'applyPromoCode',
			data : $('#frmTravelPlan input').serialize(),
			success : function(data) {
				
				var json = JSON.parse(data);
				promoData = json;
				setValue(json);
			}

		});
	}

	function setValue(result) {

		var selValue = document.getElementById("inputseletedplanname").value;
		if(result['errMsgs'] !== null){
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
		}else{
			$("#errPromoCode").html("");
			
			if (selValue == "Plan A") {
				//var totalDue = parseInt(result["priceInfoA"].totalDue);
				
				$("#subtotal").html(parseFloat(result["priceInfoA"].grossPremium).toFixed(2));
				$("#discountAmt").html(parseFloat(result["priceInfoA"].discountAmount).toFixed(2));
				$("#amountdue").html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				$('#selectedAmountDue').val(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				
			} else {
				//var totalDue = parseFloat(result["priceInfoB"].totalDue).toFixed(2);
				$("#subtotal").html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
				$("#discountAmt").html(parseFloat(result["priceInfoB"].discountAmount).toFixed(2));
				$("#amountdue").html(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				$('#selectedAmountDue').val(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				
			}
		}
	}
</script>
<style>
.travelproductbox:hover {
	background-color: #616163;
	-webkit-transition: background-color 500ms linear;
	-moz-transition: background-color 500ms linear;
	-o-transition: background-color 500ms linear;
	-ms-transition: background-color 500ms linear;
	transition: background-color 500ms linear;
}
</style>
<!--/#main-Content-->
<section>
	<div id="cn" class="container">
		<div class="row">
			<form:form name="frmTravelPlan" id="frmTravelPlan"
				action="getYourDetails" method="post" modelAttribute="travelQuote"
				onsubmit="return chkDueAmount();">
				<ol class="breadcrumb pad-none">
					<li><a href="#">##travel.breadcrumb1.item1@@</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">##travel.breadcrumb1.item2@@</a></li>
					<li class="active "><i class="fa fa-caret-right"></i> ##travel.breadcrumb1.item3@@</li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>##travel.quote.jumbo@@</h2>
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
										<span class="status">##travel.breadcrumb2.item1@@</span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle disabled second">
										<span class="status">##travel.breadcrumb2.item2@@</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled third">
										<span class="status">##travel.breadcrumb2.item3@@</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status">##travel.breadcrumb2.item4@@</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">##travel.quote.choose@@</h2>
						<%
							QuoteDetails travelQuote = (QuoteDetails) request
										.getAttribute("quoteDetails");
								if (travelQuote.getPlanName().length > 0) {
									for (int i = 0; i < travelQuote.getPlanName().length; i++) {
						%>
						<div class="col-lg-12 col-md-12 plan-box3 travelproductbox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getDiscountAmount()[i]%>','<%=travelQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 pad-none">
								<%-- <h2><%=travelQuote.getPlanName()[i]%><br> ##<br>
									HK$1,000,000 ##travel.quote.plan1.medical@@
								</h2> --%>
								
								<h2>
									<%=travelQuote.getPlanName()[i]%>
									<%-- <input type="text" name="txtPlanName<%=i %>" values="<%=travelQuote.getPlanName()[i] %>"> --%>
									<br> <%if (travelQuote.getPlanName()[i].equals("Plan A"))
									{%>  ##travel.quote.plan1.type@@<br> HK$ 1,000,000 ##travel.quote.plan1.medical@@
								<%}	else{ %>
								##travel.quote.plan2.type@@<br> HK$	500,000 ##travel.quote.plan2.medical@@
									<%} %>
									
								</h2>	
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<br>
								<h3>##travel.dollar = HK$@@</h3>
								<h6>
									<span id="grossPremium"><%=travelQuote.getGrossPremium()[i]%></span>
								</h6>
							</div>
							<div class="clearfix"></div>
							<!-- Plan benefits -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class="uline benefits">
										<span><a href="#"
											class="fwdpanel-minimize uline text-black"><i
												class="fa fa-plus"></i>##travel.quote.plan1.benefits@@</a> </span>
									</h4>
								</div>
								<!-- <div class="fwdpanel-body" style="display: none;">
									<p class="color-wht">
										<i class="fa fa-plus"></i> ##travel.quote.plan1.benefits.desc1@@<br> <i
											class="fa fa-plus"></i> ##travel.quote.plan1.benefits.desc2@@ <br> <i
											class="fa fa-plus"></i> ##travel.quote.plan1.benefits.desc3@@ <br> <i
											class="fa fa-plus"></i> ##travel.quote.plan1.benefits.desc4@@ <br>
									</p>
								</div> -->
								
								<div class="fwdpanel-body" style="display: none;">
									<!-- <p class="color-wht"> -->
										<table class="col-xs-12">
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
													<i class="fa fa-plus"></i> ##travel.quote.plan2.benefits.desc1@@ </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$10,000</td>
										</tr>
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> ##travel.quote.plan2.benefits.desc2@@
											</td><td class="col-lg-4 col-md-4 col-sm-6 col-xs-6"> </td>
										</tr> 
										
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> ##travel.quote.plan2.benefits.desc3@@ </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$5,000 </td>
										</tr>
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> ##travel.quote.plan2.benefits.desc4@@ </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$3,000 </td>
											</tr>
										</table>
										<!--<i class="fa fa-plus"></i> ##travel.quote.fullDetails.heading@@ <br>-->
									<!-- </p> -->
								</div>
								
								
								
								<div class="clearfix"></div>
							</div>
							<!-- / Plan benefits -->
						</div>

						<input type="hidden" name="txtTotalDue"
							value="<%=travelQuote.getToalDue()[i]%>"> <input
							type="hidden" name="txtGrossPremium"
							value="<%=travelQuote.getGrossPremium()[i]%>"> <input
							type="hidden" name="txtDiscountAmount" id="txtDiscountAmount[i]"
							value="<%=travelQuote.getDiscountAmount()[i]%>"> <input
							type="hidden" name="referralCode"
							value="<%=travelQuote.getReferralCode()%>"> <input
							type="hidden" name="referralName"
							value="<%=travelQuote.getReferralName()%>">
						<%
							}
						%>
						<%
							}
						%>

						<!--Full Coverage-->
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> ##travel.quote.fullDetails.heading@@ </a> </span>
								</h4>
							</div>
							<div class="fwdpanel-body" style="display: none;">
								<div class="row">
									<div class="col-md-12">
										<!--  Product Highlights  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> ##travel.quote.fullDetails.keyFeature1@@ </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>##travel.quote.fullDetails.keyFeature1.subheading@@</p>
												<br>
												<p>
													##travel.quote.fullDetails.keyFeature1.desc1@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc2@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc3@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc4@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc5@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc6@@ <br>
													##travel.quote.fullDetails.keyFeature1.desc7@@ <br>
												</p>

											</div>
										</div>
										<!-- /  Product Highlights -->
										<!--  Summary of Coverage  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> ##travel.quote.fullDetails.keyFeature2@@ </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<table id="summary" class="table table-bordred">
													<tbody>
														<tr>
															<td rowspan="2">##travel.quote.fullDetails.table.header1@@</td>
															<td rowspan="2">##travel.quote.fullDetails.table.header2@@</td>
															<td colspan="2">##travel.quote.fullDetails.table.header3@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.header3.col1@@</td>
															<td>##travel.quote.fullDetails.table.header3.col2@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row1.col1@@</td>
															<td>
																##travel.quote.fullDetails.table.row1.col2.desc1@@
																<br>
																<br>
																##travel.quote.fullDetails.table.row1.col2.desc2@@
															</td>
															<td>##travel.quote.fullDetails.table.row1.col3@@</td>
															<td>##travel.quote.fullDetails.table.row1.col4@@</td>
														</tr>
														<tr>
															<td rowspan="2">##travel.quote.fullDetails.table.row2.col1@@</td>
															<td>##travel.quote.fullDetails.table.row2.col2.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row2.col3.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row2.col4.desc1@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row2.col2.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row2.col3.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row2.col4.desc2@@</td>
														</tr>
														<tr>
															<td rowspan="9">##travel.quote.fullDetails.table.row3.col1@@</td>
															<td>##travel.quote.fullDetails.table.row3.col2.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc1@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc2@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc3@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc3@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc3@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc4@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc4@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc5@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc5@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc5@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc6@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc6@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc6@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc7@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc7@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc7@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc8@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc8@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc8@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row3.col2.desc9@@</td>
															<td>##travel.quote.fullDetails.table.row3.col3.desc9@@</td>
															<td>##travel.quote.fullDetails.table.row3.col4.desc9@@</td>
														</tr>
														<tr>
															<td rowspan="3">##travel.quote.fullDetails.table.row4.col1@@</td>
															<td>
																##travel.quote.fullDetails.table.row4.col2.desc1.subheading@@<br>
															 	##travel.quote.fullDetails.table.row4.col2.desc1.content@@
															 </td>
															<td>##travel.quote.fullDetails.table.row4.col3.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row4.col4.desc1@@</td>
														</tr>
														<tr>
															<td>
																##travel.quote.fullDetails.table.row4.col2.desc1.subheading@@<br>
																##travel.quote.fullDetails.table.row4.col2.desc1.content@@
															</td>
															<td>##travel.quote.fullDetails.table.row4.col3.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row4.col4.desc2@@</td>
														</tr>
														<tr>
															<td>
																##travel.quote.fullDetails.table.row4.col2.desc1.subheading@@<br>
																##travel.quote.fullDetails.table.row4.col2.desc1.content@@
															</td>
															<td>##travel.quote.fullDetails.table.row4.col3.desc3@@</td>
															<td>##travel.quote.fullDetails.table.row4.col4.desc3@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row5.col1@@</td>
															<td>##travel.quote.fullDetails.table.row5.col2@@</td>
															<td>##travel.quote.fullDetails.table.row5.col3@@</td>
															<td>##travel.quote.fullDetails.table.row5.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row6.col1@@</td>
															<td>##travel.quote.fullDetails.table.row6.col2@@</td>
															<td>##travel.quote.fullDetails.table.row6.col3@@</td>
															<td>##travel.quote.fullDetails.table.row6.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row7.col1@@</td>
															<td>##travel.quote.fullDetails.table.row7.col2@@</td>
															<td>##travel.quote.fullDetails.table.row7.col3@@</td>
															<td>##travel.quote.fullDetails.table.row7.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row8.col1@@</td>
															<td>##travel.quote.fullDetails.table.row8.col2@@</td>
															<td>##travel.quote.fullDetails.table.row8.col3@@</td>
															<td>##travel.quote.fullDetails.table.row8.col4@@</td>
														</tr>
														<tr>
															<td rowspan="3">##travel.quote.fullDetails.table.row9.col1@@</td>
															<td>
																##travel.quote.fullDetails.table.row9.col2.desc1.subheading@@<br>
																##travel.quote.fullDetails.table.row9.col2.desc1.content@@
															</td>
															<td>##travel.quote.fullDetails.table.row9.col3.desc1@@</td>
															<td>##travel.quote.fullDetails.table.row9.col4.desc1@@0</td>
														</tr>
														<tr>
															<td>
																##travel.quote.fullDetails.table.row9.col2.desc2.subheading@@<br>
																##travel.quote.fullDetails.table.row9.col2.desc2.content@@
															</td>
															<td>##travel.quote.fullDetails.table.row9.col3.desc2@@</td>
															<td>##travel.quote.fullDetails.table.row9.col4.desc2@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row9.col2.desc3.subheading@@</td>
															<td>##travel.quote.fullDetails.table.row9.col3.desc3@@</td>
															<td>##travel.quote.fullDetails.table.row9.col4.desc3@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row10.col1@@</td>
															<td>##travel.quote.fullDetails.table.row10.col2@@</td>
															<td>##travel.quote.fullDetails.table.row12.col3@@</td>
															<td>##travel.quote.fullDetails.table.row12.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row11.col1@@</td>
															<td>##travel.quote.fullDetails.table.row11.col2@@</td>
															<td>##travel.quote.fullDetails.table.row11.col3@@</td>
															<td>##travel.quote.fullDetails.table.row11.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row12.col1@@</td>
															<td>##travel.quote.fullDetails.table.row12.col2@@</td>
															<td>##travel.quote.fullDetails.table.row12.col3@@</td>
															<td>##travel.quote.fullDetails.table.row12.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row13.col1@@</td>
															<td>##travel.quote.fullDetails.table.row13.col2@@</td>
															<td>##travel.quote.fullDetails.table.row13.col3@@</td>
															<td>##travel.quote.fullDetails.table.row13.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row14.col1@@</td>
															<td>##travel.quote.fullDetails.table.row14.col2@@</td>
															<td>##travel.quote.fullDetails.table.row14.col3@@</td>
															<td>##travel.quote.fullDetails.table.row14.col4@@</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.table.row15.col1@@</td>
															<td>##travel.quote.fullDetails.table.row15.col2@@</td>
															<td>##travel.quote.fullDetails.table.row15.col3@@</td>
															<td>##travel.quote.fullDetails.table.row15.col4@@</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- / Summary of Coverage -->
										<!--   Major Exclusions  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> ##travel.quote.fullDetails.majorExclusion@@ </a></span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<ol class="text-justify">
													<li>##travel.quote.fullDetails.majorExclusion.desc1@@</li>


													<li>##travel.quote.fullDetails.majorExclusion.desc2@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc3@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc4@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc5@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc6@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc7@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc8@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc9@@</li>

													<li>##travel.quote.fullDetails.majorExclusion.desc10@@</li>
												</ol>
											</div>
										</div>
										<!-- /  Major Exclusions -->
										<!--   Age limit  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> ##travel.quote.fullDetails.ageLimit@@ </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>
													##travel.quote.fullDetails.ageLimit.desc1@@<br>
													##travel.quote.fullDetails.ageLimit.desc2@@
												</p>
											</div>
										</div>
										<!-- / Age limit -->
										<!--   Premium table (港幣)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> ##travel.quote.fullDetails.priceTable@@ </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body">
												<h4 class="h4-2">
													<strong>##travel.quote.fullDetails.priceTable.single.heading@@</strong>
												</h4>
												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td rowspan="2"><strong>##travel.quote.fullDetails.priceTable.single.header1@@</strong></td>
															<td colspan="2"><strong>##travel.quote.fullDetails.priceTable.single.header2@@</strong></td>
															<td colspan="2"><strong>##travel.quote.fullDetails.priceTable.single.header3@@</strong></td>
															<td colspan="2"><strong>##travel.quote.fullDetails.priceTable.single.header4@@</strong></td>
														</tr>
														<tr>
															<td width="101"><strong>##travel.quote.fullDetails.priceTable.plan1@@</strong></td>
															<td width="86"><strong>##travel.quote.fullDetails.priceTable.plan2@@</strong></td>
															<td width="84"><strong>##travel.quote.fullDetails.priceTable.plan1@@</strong></td>
															<td width="81"><strong>##travel.quote.fullDetails.priceTable.plan2@@</strong></td>
															<td width="93"><strong>##travel.quote.fullDetails.priceTable.plan1@@</strong></td>
															<td width="88"><strong>##travel.quote.fullDetails.priceTable.plan2@@</strong></td>
														</tr>
														<tr>
															<td>1</td>
															<td>120</td>
															<td>95</td>
															<td>210</td>
															<td>166</td>
															<td>300</td>
															<td>238</td>
														</tr>
														<tr>
															<td>2</td>
															<td>130</td>
															<td>105</td>
															<td>228</td>
															<td>184</td>
															<td>325</td>
															<td>263</td>
														</tr>
														<tr>
															<td>3</td>
															<td>145</td>
															<td>115</td>
															<td>254</td>
															<td>201</td>
															<td>363</td>
															<td>288</td>
														</tr>
														<tr>
															<td>4</td>
															<td>180</td>
															<td>135</td>
															<td>315</td>
															<td>236</td>
															<td>450</td>
															<td>338</td>
														</tr>
														<tr>
															<td>5</td>
															<td>215</td>
															<td>155</td>
															<td>376</td>
															<td>271</td>
															<td>538</td>
															<td>388</td>
														</tr>
														<tr>
															<td>6</td>
															<td>250</td>
															<td>175</td>
															<td>438</td>
															<td>306</td>
															<td>625</td>
															<td>438</td>
														</tr>
														<tr>
															<td>7</td>
															<td>270</td>
															<td>188</td>
															<td>473</td>
															<td>329</td>
															<td>675</td>
															<td>470</td>
														</tr>
														<tr>
															<td>8</td>
															<td>290</td>
															<td>200</td>
															<td>508</td>
															<td>350</td>
															<td>725</td>
															<td>500</td>
														</tr>
														<tr>
															<td>9</td>
															<td>305</td>
															<td>212</td>
															<td>534</td>
															<td>371</td>
															<td>763</td>
															<td>530</td>
														</tr>
														<tr>
															<td>10</td>
															<td>320</td>
															<td>225</td>
															<td>560</td>
															<td>394</td>
															<td>800</td>
															<td>563</td>
														</tr>
														<tr>
															<td>11</td>
															<td>345</td>
															<td>237</td>
															<td>604</td>
															<td>415</td>
															<td>863</td>
															<td>593</td>
														</tr>
														<tr>
															<td>12</td>
															<td>370</td>
															<td>249</td>
															<td>648</td>
															<td>436</td>
															<td>925</td>
															<td>623</td>
														</tr>
														<tr>
															<td>13</td>
															<td>390</td>
															<td>261</td>
															<td>683</td>
															<td>457</td>
															<td>975</td>
															<td>653</td>
														</tr>
														<tr>
															<td>14</td>
															<td>410</td>
															<td>273</td>
															<td>718</td>
															<td>478</td>
															<td>1025</td>
															<td>683</td>
														</tr>
														<tr>
															<td>15</td>
															<td>435</td>
															<td>285</td>
															<td>761</td>
															<td>499</td>
															<td>1088</td>
															<td>713</td>
														</tr>
														<tr>
															<td>16</td>
															<td>470</td>
															<td>297</td>
															<td>823</td>
															<td>520</td>
															<td>1175</td>
															<td>743</td>
														</tr>
														<tr>
															<td>17</td>
															<td>495</td>
															<td>309</td>
															<td>866</td>
															<td>541</td>
															<td>1238</td>
															<td>773</td>
														</tr>
														<tr>
															<td>18</td>
															<td>515</td>
															<td>321</td>
															<td>901</td>
															<td>562</td>
															<td>1288</td>
															<td>803</td>
														</tr>
														<tr>
															<td>19</td>
															<td>535</td>
															<td>333</td>
															<td>936</td>
															<td>583</td>
															<td>1338</td>
															<td>833</td>
														</tr>
														<tr>
															<td>20</td>
															<td>555</td>
															<td>345</td>
															<td>971</td>
															<td>604</td>
															<td>1388</td>
															<td>863</td>
														</tr>
														<tr>
															<td>21</td>
															<td>575</td>
															<td>357</td>
															<td>1006</td>
															<td>625</td>
															<td>1438</td>
															<td>893</td>
														</tr>
														<tr>
															<td>22</td>
															<td>595</td>
															<td>369</td>
															<td>1041</td>
															<td>646</td>
															<td>1488</td>
															<td>923</td>
														</tr>
														<tr>
															<td>23</td>
															<td>615</td>
															<td>381</td>
															<td>1076</td>
															<td>667</td>
															<td>1538</td>
															<td>953</td>
														</tr>
														<tr>
															<td>24</td>
															<td>635</td>
															<td>393</td>
															<td>1111</td>
															<td>688</td>
															<td>1588</td>
															<td>983</td>
														</tr>
														<tr>
															<td>25</td>
															<td>655</td>
															<td>405</td>
															<td>1146</td>
															<td>709</td>
															<td>1638</td>
															<td>1013</td>
														</tr>
														<tr>
															<td>26</td>
															<td>675</td>
															<td>417</td>
															<td>1181</td>
															<td>730</td>
															<td>1688</td>
															<td>1043</td>
														</tr>
														<tr>
															<td>27</td>
															<td>695</td>
															<td>429</td>
															<td>1216</td>
															<td>751</td>
															<td>1738</td>
															<td>1073</td>
														</tr>
														<tr>
															<td>28</td>
															<td>715</td>
															<td>441</td>
															<td>1251</td>
															<td>772</td>
															<td>1788</td>
															<td>1103</td>
														</tr>
														<tr>
															<td>29</td>
															<td>735</td>
															<td>453</td>
															<td>1286</td>
															<td>793</td>
															<td>1838</td>
															<td>1133</td>
														</tr>
														<tr>
															<td>30</td>
															<td>755</td>
															<td>465</td>
															<td>1321</td>
															<td>814</td>
															<td>1888</td>
															<td>1163</td>
														</tr>
														<tr>
															<td>31</td>
															<td>775</td>
															<td>477</td>
															<td>1356</td>
															<td>835</td>
															<td>1938</td>
															<td>1193</td>
														</tr>
														<tr>
															<td>Each additional day<br> up to 180 days
															</td>
															<td>20</td>
															<td>12</td>
															<td>35</td>
															<td>21</td>
															<td>50</td>
															<td>30</td>
														</tr>
													</tbody>
												</table>
												<h4 class="h4-2">
													<strong>##travel.quote.fullDetails.priceTable.annual.heading@@</strong>
												</h4>
												<table id="annual" class="table table-bordred">
													<tbody>
														<tr>
															<td width="208" rowspan="4"><strong>##travel.quote.fullDetails.priceTable.annual.header1@@</strong></td>
															<td colspan="2" rowspan="2">##travel.quote.fullDetails.priceTable.annual.header2@@</td>
															<td width="108">##travel.quote.fullDetails.priceTable.plan1@@</td>
															<td width="36">1,800</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.priceTable.plan2@@</td>
															<td>1,300</td>
														</tr>
														<tr>
															<td colspan="2" rowspan="2">##travel.quote.fullDetails.priceTable.annual.header3@@</td>
															<td>##travel.quote.fullDetails.priceTable.plan1@@</td>
															<td>3,600</td>
														</tr>
														<tr>
															<td>##travel.quote.fullDetails.priceTable.plan2@@</td>
															<td>2,600</td>
														</tr>
													</tbody>
												</table>
												<br>
												<h4 class="h4-2">
													<strong>##travel.quote.fullDetails.priceTable.remark@@</strong>
												</h4>
												<p>
													##travel.quote.fullDetails.priceTable.remark.desc1@@<br>
													##travel.quote.fullDetails.priceTable.remark.desc2@@<br>
													##travel.quote.fullDetails.priceTable.remark.desc3@@<br>
													##travel.quote.fullDetails.priceTable.remark.desc4@@<br>
												</p>
											</div>
										</div>
										<!-- / Premium table (港幣) -->
									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>
							<h4 class="h4-4">
								<a
									href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf"
									target="_blank"><i class="fa fa-download"></i>##travel.quote.fullDetails.download@@</a>
							</h4>
						</div>
					</div>

					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="col-xs-12 hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">##travel.sidebar.summary.product@@</h2>
									<h4 id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">
									
										
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											##travel.dollar@@
											<div class="flightcare-hk" id="plansummary">0</div>
											<input type="hidden" name="txtgrossPremiumAmt"
												id="txtgrossPremiumAmt" value="">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3>##travel.sidebar.summary.option1@@</h3>
								<div class="form-group">
									<div class="input-group wd2">
										<input name="trLeavingDate" type="text"
											class="datepicker form-control"
											value="${travelQuoteBean.getTrLeavingDate() }" readonly>
									</div>
								</div>
								<h3>##travel.sidebar.summary.option2@@</h3>
	
								<div class="form-group">
									<div class="input-group wd2">
										<input name="trBackDate" type="text"
											class="datepicker form-control"
											value="${travelQuoteBean.getTrBackDate() }" readonly>
									</div>
								</div>
								<h3>##travel.sidebar.summary.option3@@</h3>
								<div class="form-group likeDatePicker bcg-trans">
	              					<div class="input-group wd2 datepicker form-control" > 
									<%	if (travelQuote.getPlanSelected() != null && travelQuote.getPlanSelected().equals("personal"))
										{ 
									%>
											<c:if test="${travelQuoteBean.getTotalPersonalTraveller()!=0}">   ${travelQuoteBean.getTotalPersonalTraveller()} 旅客   </c:if>
									<% } 
									   else 
									   {
									%>
											<c:if test="${travelQuoteBean.getTotalAdultTraveller()!=0}">    ${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()} 父母 <br></c:if>
											<c:if test="${travelQuoteBean.getTotalChildTraveller()!=0}">    ${travelQuoteBean.getTotalChildTraveller()} 孩子 <br></c:if>
											<c:if test="${travelQuoteBean.getTotalOtherTraveller()!=0}">    ${travelQuoteBean.getTotalOtherTraveller()} 其他 <br></c:if>
									<% }
									%>
									</div>
								</div>
								<input type="hidden" name="totalAdultTraveller"
									id="totalAdultTraveller"
									value="${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()}">
								<input type="hidden" name="totalChildTraveller"
									id="totalChildTraveller"
									value="${travelQuoteBean.getTotalChildTraveller()}"> <input
									type="hidden" name="totalOtherTraveller"
									id="totalOtherTraveller"
									value="${travelQuoteBean.getTotalOtherTraveller()}">
								<%-- <input type="hidden" name="totalOtherTraveller" id="totalOtherTraveller" value="${travelQuoteBean.getTotalPersonalTraveller()}"> --%>
								<h3>
									合共 <span> ${travelQuoteBean.getTotalTravellingDays()} <input
										type="hidden" name="totalTravellingDays"
										id="totalTravellingDays"
										value="${travelQuoteBean.getTotalTravellingDays()}"> 天
									</span>
								</h3>
							</div>
						</div>
						<div class="col-xs-12">
							<h3>##travel.sidebar.summary.option4@@</h3>
						
							<span class="text-red" id="errPromoCode"></span>
							<div class="form-group">
								<div class="input-group">
									<input type="text" id="promoCode" name="promoCode"
										class="form-control" placeholder="eg.FWD789"> 
										<span
										class="input-group-addon in black-bold pointer"
										onclick="applyPromoCode()">
										<span>##travel.action.apply@@</span>
										</span>
								</div>
							</div>
							<div class="travel-italic">
								<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i>##travel.sidebar.summary.promocode.help@@</i></a>
							</div>
						
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">##travel.sidebar.summary.subtotal@@</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="subtotal"></h3>
						<input type="hidden" name="subTotal" id="subTotal" value="540">
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">##travel.sidebar.summary.discount@@</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="discountAmt">-</h3>
						<input type="hidden" name="selectedDiscountAmt"
							id="selectedDiscountAmt" value="">
						<div class="clearfix"></div>
						<div class="orange-bdr"></div>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">##travel.sidebar.summary.amountDue@@</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="amountdue">0</h3>
						<input type="hidden" name="selectedAmountDue"
							id="selectedAmountDue" value="">
							</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="/FWDHKPH1A/travel"
								class="bdr-curve btn btn-primary bck-btn">##travel.action.back@@ </a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
							<button type="submit" class="bdr-curve btn btn-primary btn-next">
								##travel.action.next@@ </a>
						</div>
						<div class="clearfix"></div>
						<br> <span class="text-red" id="errDue"></span> <br>
					</div>
					<div class="clearfix"></div>
				</div>
		</div>
		<input type="hidden" name="planSelected" id="planSeelcted"
			value="<%=travelQuote.getPlanSelected()%>">
		<p class="padding1 hidden-sm hidden-xs">
			##travel.main.other.disclaimer.part1@@
			<a class="sub-link" href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank">
				##travel.main.other.disclaimer.part2@@
			</a>
			##travel.main.other.disclaimer.part3@@
			##travel.main.other.disclaimer.part4@@
		</p>

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
						<h2>##promotion.get.code@@</h2>
						<h4>##promotion.get.code.email@@</h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">##promotion.get.code.action@@</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>##promotion.get.code.disclaimer@@</p>
							</div>
						</div>
					</div>
				</form>
				</div>
				
				
			</div>
		</div>
</div>
<!--/ Get promotion code popup--> 

<!--/end Main Content-->
<script>
	$(document).ready(function() {
		$('#amountdue').html('0');
		$('#subtotal').html('0');
		$('#plansummary').html('0');
		$('#discountAmt').html('0');

		$(".travelproductbox").animate({
			"background-color" : "#000"
		}, 3000);
	});
	function changeColorAndPrice(id, planName, discountAmt, totalDue) {
		var selected_div;
		var idArray = [];

		$('.travelproductbox').each(function() {
			idArray.push(this.id);
		});

		var index = idArray.indexOf(id);
		if (index > -1) {
			idArray.splice(index, 1);
			for (var i = 0; i < idArray.length; i++) {
				$('#' + idArray).removeClass("plan-box4");
				$('#' + idArray).addClass("plan-box3");
			}
		}

		var selected_price = $('#' + id).find('h6').text();
		selected_price = parseInt(selected_price).toFixed(2);
		
		$('#amountdue').html(parseInt(totalDue).toFixed(2));
		
		
		/*   $('#selectedAmountDue').value=selected_price; */
		$('#subtotal').html(selected_price);
		$('#plansummary').html(selected_price);
		$('#seletedplanname').html(planName);
		$('#inputseletedplanname').val(planName);

		$('#' + id).addClass("plan-box4");

		$('#discountAmt').html(parseInt(discountAmt).toFixed(2));
		
		document.getElementById("selectedAmountDue").value = totalDue.trim();
		
		document.getElementById("selectedDiscountAmt").value = discountAmt
				.trim();
		document.getElementById("txtgrossPremiumAmt").value = selected_price
				.trim();
		
		if(promoData !== '')
			setValue(promoData);
		
	}

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					alert(data);
					if (data == 'success') {
					} else {
					}
				},
				error : function() {
				}
			});
		}
		return false;
	}

	function BackMe() {
		window.history.back();
	}
</script>