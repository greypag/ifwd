<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
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
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
   
   
</script>-->



<!--VWO-->
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 95373, settings_tolerance = 2000, library_tolerance = 2500, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<script>
	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("referralCode").value;
	
		if (promoCode.trim() == "") {
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			flag = false;
		} else
			flag = true;
	
		return flag;
	}
	function applyHomePromoCode() {
		
		$("#errPromoCode").html("");
		
		if(chkPromoCode())
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/applyHomePromoCode',
			data : $('#frmHomeCarePlan input').serialize(),
			success : function(data) {

				var json = JSON.parse(data);

				//console.log("json " + json);
				setValue(json);
			}

		});
	}

	function setValue(result) {
		if(result['errMsgs'] !== null){
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
		}else{
			var totalDue = parseInt(result["priceInfo"].totalDue);
			$("#subtotal").html(parseFloat(result["priceInfo"].grossPremium).toFixed(2));
			$("#discountAmt").html(parseFloat(result["priceInfo"].discountAmount).toFixed(2));
			$("#discountAmount").val(parseFloat(result["priceInfo"].discountAmount).toFixed(2));
			
			$("#amountdue").html(parseFloat(result["priceInfo"].totalDue).toFixed(2));
			$("#totalDue").val(parseFloat(result["priceInfo"].totalDue).toFixed(2));
			
			$('.totalPrice').html(parseFloat(result["priceInfo"].totalDue).toFixed(2));
			$('.actualPrice del').html(parseFloat(result["priceInfo"].grossPremium).toFixed(2));
		}
	}
	
	function sendEmail() {
		$('.proSuccess').addClass('hide');
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					
					if (data == 'success') {
						$('.proSuccess').removeClass('hide').html(getBundle(getBundleLanguage, "system.promotion.success.message"));
					} else {
						
						$('.proSuccess').addClass('hide').html(getBundle(getBundleLanguage, "system.promotion.error.message"))
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
</head>
<body>
	<!--Desktop-header-->


	<!--/#main-Content-->
	<section>
		<div class="container">
			<div class="row">

				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="home.breadcrumb1.item2" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center" style="visibility: visible;">
							<h2><fmt:message key="home.quote.jumbo" bundle="${msg}" /></h2>
						</div>
						<br>
						<div class="col-lg-12 col-md-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status has-four">
									
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div class="order-status-timeline-new">
											<div class="order-status-timeline-completion dots-inactive"></div>
											<div class="order-status-timeline-completion dots-inactive"></div>
											<div class="order-status-timeline-completion dots-inactive"></div>
										</div>
									<div
										class="image-order-status image-order-status-new active img-circle act first">
										<span class="status"><fmt:message key="home.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>

									<div
										class="image-order-status image-order-status-intransit  img-circle disabled second">
										<span class="status"><fmt:message key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled third">
										<span class="status"><fmt:message key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled fourth">
										<span class="status lst-status"><fmt:message key="home.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<%
							HomeQuoteBean planQuote = (HomeQuoteBean) request.getAttribute("planQuote");%>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">
							<!-- Choose a plan -->
						</h2>


						<div class="col-lg-12 col-md-12 plan-box4 double-dot">
							<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
								<h2> <fmt:message key="home.quote.plan" bundle="${msg}" />
								<!--  ${planQuote.getPlanCode() } -->
								</h2>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<br>
								<div class="h4">
									HK$ <br>
									<div class="flightcare-hk totalPrice"><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%></div>
									<span class="hide"><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%></span>
									<span class="del actualPrice"><del></del></span>
								</div>
							</div>
							
							<div class="col-xs-12 hidden-sm hidden-xs">
							<!-- Plan benefits -->
								<!--<div class="fwdpanel">
									<div class="fwdpanel-heading">
										<h4 class="benefits">
											<span>
												<i class="fa fa-plus"></i> 
												<a href="#" class="fwdpanel-minimize uline color-wht">
													<fmt:message key="home.quote.plan.benefits" bundle="${msg}" /> 
												</a>
											</span>
										</h4>
									</div>
	
									<div class="fwdpanel-body" style="display: none;">
										<ul class="color-wht">
											<li><fmt:message key="home.quote.plan.benefits.desc1" bundle="${msg}" /></li>
											<li><fmt:message key="home.quote.plan.benefits.desc2" bundle="${msg}" /></li>
											<li><fmt:message key="home.quote.plan.benefits.desc3" bundle="${msg}" /></li>
											<li><fmt:message key="home.quote.plan.benefits.desc4" bundle="${msg}" /></li>
										</ul>
									</div>
	
									<div class="clearfix"></div>
	
								</div>
								-->
							<!-- / Plan benefits -->
							</div>
							<div class="clearfix"></div>
							<!-- <div><h4 class="uline">+ Plan benefits</h4></div>-->
						</div>

						<!-- Plan benefits -->
						<!--<div class="fwdpanel">
                      <div class="fwdpanel-heading">
                        <h4 class="uline benefits">
                          <span><a href="#" class="fwdpanel-minimize uline"><i class="fa fa-plus"></i> Plan benefits </a> </span>
                        </h4> 
                      </div>
                      <div class="fwdpanel-body" style="display: none;">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                      </div>
                    </div>-->
						<!-- / Plan benefits -->


						<!--Full coverage -->
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> <fmt:message key="home.quote.fullDetails.heading" bundle="${msg}" /> </a> </span>
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
															class="fa fa-plus"></i><fmt:message key="home.quote.highlight.heading" bundle="${msg}" /> </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p><fmt:message key="home.quote.highlight.desc1" bundle="${msg}" /></p>
												<p><fmt:message key="home.quote.highlight.desc2" bundle="${msg}" /></p>
												<p><fmt:message key="home.quote.highlight.desc3" bundle="${msg}" /></p>
												<br>
												<p><fmt:message key="home.quote.highlight.desc4" bundle="${msg}" /></p>
											</div>
										</div>
										<!-- /  Product Highlights -->

										<!--  Summary of Coverage  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i><fmt:message key="home.quote.summary.heading" bundle="${msg}" /> </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<h4 class="h4-2">
													<strong> <fmt:message key="home.quote.summary.subheading1" bundle="${msg}" /> </strong>
												</h4>
												<p><fmt:message key="home.quote.summary.subheading1.desc1" bundle="${msg}" /></p>
												<br>
												<p><fmt:message key="home.quote.summary.subheading1.desc2" bundle="${msg}" /></p>
												<br>
												<table id="homecarePremium" class="table table-bordred">
													<tbody>
														<tr>
															<td><strong><fmt:message key="home.quote.summary.table.header1" bundle="${msg}" /></strong></td>
															<td><strong><fmt:message key="home.quote.summary.table.header2" bundle="${msg}" /></strong></td>
															<td><strong><fmt:message key="home.quote.summary.table.header3" bundle="${msg}" /> Limits<br>(HK$)
															</strong></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row1.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row1.col2.desc1" bundle="${msg}" /><br /> 
																	<fmt:message key="home.quote.summary.table.row1.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row1.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row2.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row2.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row2.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row2.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row3.col1" bundle="${msg}" /><br /> </td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row3.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row3.col2.desc2" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row3.col2.desc3" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row3.col2.desc4" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row3.col2.desc5" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row3.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row4.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row4.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row4.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row4.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row5.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row5.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row5.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row5.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row6.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row6.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row6.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row6.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td rowspan="2"><fmt:message key="home.quote.summary.table.row7.col1" bundle="${msg}" /></td>
															<td>
																<strong><fmt:message key="home.quote.summary.table.row7.col2.desc1" bundle="${msg}" /></strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row7.col3.desc1" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td>
																<strong><fmt:message key="home.quote.summary.table.row7.col2.desc2" bundle="${msg}" /></strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row7.col3.desc2" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row8.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row8.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row8.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row8.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row9.col1" bundle="${msg}" /></td>
															<td>
																<strong>
																	<fmt:message key="home.quote.summary.table.row9.col2.desc1" bundle="${msg}" /><br />
																	<fmt:message key="home.quote.summary.table.row9.col2.desc2" bundle="${msg}" />
																	<fmt:message key="home.quote.summary.table.row9.col2.desc3" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row9.col3" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td rowspan="2"><fmt:message key="home.quote.summary.table.row10.col1" bundle="${msg}" /></td>
															<td rowspan="2">
																<strong>
																	<fmt:message key="home.quote.summary.table.row10.col2.desc1" bundle="${msg}" /><br /> 
																	<fmt:message key="home.quote.summary.table.row10.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row10.col3.desc1" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row10.col3.desc2" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td rowspan="2"><fmt:message key="home.quote.summary.table.row11.col1" bundle="${msg}" /></td>
															<td rowspan="2">
																<strong>
																	<fmt:message key="home.quote.summary.table.row11.col2.desc1" bundle="${msg}" /><br /> 
																	<fmt:message key="home.quote.summary.table.row11.col2.desc2" bundle="${msg}" />
																</strong>
															</td>
															<td><fmt:message key="home.quote.summary.table.row11.col3.desc1" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.summary.table.row11.col3.desc2" bundle="${msg}" /></td>
														</tr>
													</tbody>
												</table>
												<h4 class="h4-2">
													<strong><fmt:message key="home.quote.summary.subheading2" bundle="${msg}" /></strong>
												</h4>
												<p><fmt:message key="home.quote.summary.subheading2.desc1" bundle="${msg}" /></p>
												<p><fmt:message key="home.quote.summary.subheading2.desc2" bundle="${msg}" /></p>
												<p><fmt:message key="home.quote.summary.subheading2.desc3" bundle="${msg}" /></p>
												<p><fmt:message key="home.quote.summary.subheading2.desc4" bundle="${msg}" /></p>

												<p><fmt:message key="home.quote.summary.subheading2.desc5" bundle="${msg}" /></p>




											</div>
										</div>
										<!-- / Summary of Coverage -->


										<!--   Major Exclusions  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i><fmt:message key="home.quote.fullDetails.priceTable" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<table id="homecarePremium" class="table table-bordred">
													<tbody>
														<tr>
															<th><fmt:message key="home.quote.fullDetails.priceTable.single.header1" bundle="${msg}" /></th>
															<th><fmt:message key="home.quote.fullDetails.priceTable.single.header2" bundle="${msg}" /></th>
															<th><fmt:message key="home.quote.fullDetails.priceTable.single.header3" bundle="${msg}" /></th>
															<th><fmt:message key="home.quote.fullDetails.priceTable.single.header4" bundle="${msg}" /></th>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.fullDetails.priceTable.section1" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.coverage1" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.liability1" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.annualP1" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.fullDetails.priceTable.section2" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.coverage2" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.liability2" bundle="${msg}" /></td>
															<td><fmt:message key="home.quote.fullDetails.priceTable.annualP2" bundle="${msg}" /></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!-- /  Major Exclusions -->

										<!--   Age limit  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> <fmt:message key="home.quote.exclusion.heading" bundle="${msg}" /> </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>
													<fmt:message key="home.quote.exclusion.desc1" bundle="${msg}" /><br>
												<ul>
													<li><fmt:message key="home.quote.exclusion.desc2" bundle="${msg}" /></li>
													<li><fmt:message key="home.quote.exclusion.desc3" bundle="${msg}" /></li>
													<li><fmt:message key="home.quote.exclusion.desc4" bundle="${msg}" /></li>
													<li><fmt:message key="home.quote.exclusion.desc5" bundle="${msg}" /></li>
													<li><fmt:message key="home.quote.exclusion.desc6" bundle="${msg}" /></li>

												</ul>


												</p>
											</div>
										</div>
										<!-- / Age limit -->
										<!--   Premium table (HK$)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> <fmt:message key="home.quote.excess.heading" bundle="${msg}" /> </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<!--<h4 class="h4-2">
													<strong><fmt:message key="home.quote.excess.heading" bundle="${msg}" /></strong>
												</h4>-->

												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td colspan="1" rowspan="2"><fmt:message key="home.quote.excess.section1" bundle="${msg}" /></td>
															<td colspan="2" rowspan="1"><fmt:message key="home.quote.excess.section1.desc1" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td colspan="2" rowspan="1"><fmt:message key="home.quote.excess.section1.desc2" bundle="${msg}" /></td>
														</tr>
														<tr>
															<td><fmt:message key="home.quote.excess.section2" bundle="${msg}" /></td>
															<td colspan="2" rowspan="1"><fmt:message key="home.quote.excess.section2.desc" bundle="${msg}" /></td>
														</tr>
													</tbody>
												</table>



											</div>
										</div>
										<!-- / Premium table (HK$) -->


									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>

							<h4 class="h4-4">
								<i class="fa fa-download"></i> 
								<a href="<fmt:message key="home.brochure.link" bundle="${msg}" />" target="_blank">
									<fmt:message key="home.quote.fullDetails.download" bundle="${msg}" />
								</a>
							</h4>
						</div>
						<!--Full coverage end -->




					</div>
					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12 gray-bg pad-none">
						<form:form name="frmHomeCarePlan" id="frmHomeCarePlan"
							action="${pageContext.request.contextPath}/home-insurance/user-details" method="post"
							modelAttribute="planQuoteDetails">
							<div class="wd2 hidden-sm hidden-xs">
								<div class="col-xs-6">
									<h2 class="h2-3-choose pad-none"><fmt:message key="home.sidebar.summary.product" bundle="${msg}" />
									</h2>
									<h4 class="pad-none"><fmt:message key="home.sidebar.summary.desc" bundle="${msg}" /></h4>
								</div>
								<div class="col-xs-6 pull-right">
									<div class="text-left  h2-2 h2">
										<div class="hk1 text-right">HK$</div>
										<div class="hk1 top-mrg-10">
											<div class="flightcare-hk text-right-imp"><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%>
												</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3 class="hidden-sm hidden-xs"><fmt:message key="home.sidebar.summary.planType" bundle="${msg}" /></h3>
								<div class="form-group hidden-sm hidden-xs">
									<p class="h4-5 pad-none"><fmt:message key="home.sidebar.summary.planType.desc" bundle="${msg}" /></p>
								</div>

								<h3 class="col-sm-6 col-xs-6 col-md-12"><fmt:message key="home.sidebar.summary.promocode" bundle="${msg}" /></h3>
								<div class="travel-italic hidden-lg hidden-md col-sm-6 col-xs-6 padding7  text-right" >
									<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i><fmt:message key="home.sidebar.summary.promocode.help" bundle="${msg}" /></i></a>
								</div>
								<div class="clearfix"></div>
								
								<span class="text-red" id="errPromoCode"></span>
								<div class="form-group">
									<div class="input-group">
										<span class="text-red" id="errPromoCode"></span>
										<input type="text" id="referralCode" name="referralCode"
											class="form-control" placeholder="<fmt:message key="home.sidebar.summary.promocode.placeholder" bundle="${msg}" />"> <span
											class="input-group-addon in black-bold"> <span
											class="apply pointer" onclick="applyHomePromoCode()"><fmt:message key="home.action.apply" bundle="${msg}" /></span>
											
										</span>
									</div>
								</div>
								<div class="travel-italic hidden-sm hidden-xs">
									<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i><fmt:message key="home.sidebar.summary.promocode.help" bundle="${msg}" /></i></a>
								</div>
							</div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 hidden-sm hidden-xs"><fmt:message key="home.sidebar.summary.subtotal" bundle="${msg}" /></h3>
							<h3 id="subtotal"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right hidden-sm hidden-xs">
								<%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%>
								</h3>

							<h3 class="h4-1-orange-b col-lg-6 col-md-6 marg-t hidden-sm hidden-xs"><fmt:message key="home.sidebar.summary.discount" bundle="${msg}" />
							</h3>
							<h3 id="discountAmt"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right marg-t hidden-sm hidden-xs"><%=String.format("%.2f",Double.parseDouble(planQuote.getDiscountAmount()))%>
								
							</h3>
							<div class="clearfix"></div>
							<div class="orange-bdr hidden-sm hidden-xs"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 hidden-sm hidden-xs"><fmt:message key="home.sidebar.summary.amountDue" bundle="${msg}" /></h3>
							<h3 id="amountdue"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right hidden-sm hidden-xs"><%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%></h3>

							<input type="hidden" name="planCode" id="planCode"
								value="${planQuote.getPlanCode() }">
							<input type="hidden" name="grossPremium" id="grossPremium"
								value="${planQuote.getGrossPremium()}">
							<input type="hidden" name="discountAmount" id="discountAmount"
								value="${planQuote.getDiscountAmount()}">
							<input type="hidden" name="totalDue" id="totalDue"
								value="${planQuote.getTotalDue()}">

							<input type="hidden" name="referralCode" id="referralCode"
								value="${planQuote.getReferralCode()}">
							<input type="hidden" name="referralName" id="referralName"
								value="${planQuote.getReferralName()}">

							<input type="hidden" name="answer1" value="${answer1}">
							<input type="hidden" name="answer2" value="${answer2}">

							

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left hidden-sm hidden-xs">
								<a href="<%=request.getContextPath()%>/home-insurance"
									class="bdr-curve btn btn-primary bck-btn"><fmt:message key="home.action.back" bundle="${msg}" /></a>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pull-right full-width-button">
								<button type="submit" class="bdr-curve btn btn-primary btn-next"><fmt:message key="home.action.next" bundle="${msg}" /></button>
							</div>

							<div class="clearfix"></div>
							<br>
							<br>
						</form:form>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">
					<fmt:message key="home.quote.other.disclaimer.part1" bundle="${msg}" /> <a
						class="sub-link"
						href="<fmt:message key="home.provision.link" bundle="${msg}" />"
						target="_blank">
						<fmt:message key="home.quote.other.disclaimer.part2" bundle="${msg}" /></a> <fmt:message key="home.quote.other.disclaimer.part3" bundle="${msg}" /><br> 
						<fmt:message key="home.quote.other.disclaimer.part4" bundle="${msg}" />
				</p>

			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--Apply-->

<%-- 	<form:form name="frmHomeCarePlan" id="frmHomeCarePlan"
		action="getYourHomeCareDetails" method="post"
		modelAttribute="planQuoteDetails">
		<div class="hidden-lg hidden-md text-center clearfix">
			<br>
			<div class="col-sm-12 col-xs-12 gray-bg">
			<div class="row">
				<h3 class="col-sm-6 col-xs-6 text-left">Promotion Code</h3>
				<h5 class="col-sm-6 col-xs-6 padding7  text-right">
					<a href="" class="sub-link" data-toggle="modal"
						data-target=".bs-promo-modal-lg"><i>How do I get a
							promotion code?</i></a>
				</h5>
			</div>
				
			<div class="clearfix"></div>
			<div class="row">
				<div class="form-group col-sm-12 col-xs-12">
					<div class="input-group">
						<span class="text-red" id="errPromoCode"></span> <input
							id="referralCode" name="referralCode" type="text"
							class="form-control placeholder-fl" placeholder="eg.FWD789">
						
						<span class="input-group-addon in black-bold"> <span class="apply pointer" onclick="applyHomePromoCode()">APPLY</span>
											<!-- <input type="button" name="Apply" value="APPLY" onclick="applyPromoCode()"> -->
										</span>
						
						
					</div>
				</div>
			</div>
			</div>
		</div>

		<div class="row-fluid hidden-lg hidden-md text-center">
			<div class="">
				<button type="submit"
					class="btn-box bdr-curve btn btn-primary btn-next">
					Next
				</button>
			</div>
				
		</div>
		
	</form:form> --%>

	<!--/end Main Content-->


	<!--Get promotion code popup-->
	<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
					<div class="form-container">
						<h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
						<div class="alert alert-success hide proSuccess"></div>
						<h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /></h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<%-- <a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a> --%>
								<button type="submit" onclick="return sendEmail()"
															class="bdr-curve btn btn-primary btn-lg wd5"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></button>
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

</body>
</html>

<script>
	
</script>