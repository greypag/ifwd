<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
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




<script>

var promoCodePlaceholder="<fmt:message key="home.sidebar.summary.promocode.placeholder" bundle="${msg}" />";

//bmg inline variable
var promoCodeInsertFlag = true;
//bmg inline variable

perventRedirect=true;

function checkPromoCodePlaceholder(){
	if ($("#referralCode").val()==promoCodePlaceholder) {
        $("#referralCode").val('');
    }
}

	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("promoCode").value;
	
		if (promoCode.trim() == "" || promoCode==promoCodePlaceholder) {
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			$('#inputPromo').addClass('invalid-field');
			flag = false;
		} else {
			$('#inputPromo').removeClass('invalid-field');
			flag = true;
		}
	
		return flag;
	}
	function applyHomePromoCode() {
		if(promoCodeInsertFlag){
            promoCodeInsertFlag = false;
            
			$("#errPromoCode").html("");
			
			if(chkPromoCode()) {
				$('#loading-overlay').modal({
	                backdrop: 'static',
	                keyboard: false
	            })
				$.ajax({
					type : 'POST',
					url : '<%=request.getContextPath()%>/applyHomePromoCode',
					data : $('#frmHomeCarePlan input').serialize(),
					success : function(data) {
						$('#loading-overlay').modal('hide');
	                    promoCodeInsertFlag = true;
		
						var json = JSON.parse(data);
		
						setValue(json);
					}
		
				});
			} else {
				promoCodeInsertFlag = true;
			}
		}
	}

	function setValue(result) {
		if(result['errMsgs'] !== null){
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notValid.message"));
            $('#inputPromo').addClass('invalid-field');
        }else{
            $("#errPromoCode").html("");
            $('#inputPromo').removeClass('invalid-field');
            
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
		<div id="cn" class="container">
			<div class="row">
                <form:form name="frmHomeCarePlan" id="frmHomeCarePlan" action="${pageContext.request.contextPath}/${language}/home-insurance/user-details" method="post" onsubmit="return checkPromoCodePlaceholder();" modelAttribute="planQuoteDetails">
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="home.breadcrumb1.item2" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="home.breadcrumb1.item3" bundle="${msg}" /></li>
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
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status"><fmt:message key="home.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status"><fmt:message key="home.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle fourth">
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
				<div id="quote-wrap" class="container pad-none bdr">
					<div class="col-lg-8 col-xs-12 col-sm-12 col-md-8 pad-none">
					   <div class="workingholiday-plan-margin form-wrap">
					
						<h2 class="h2-3-choose hidden-sm hidden-xs">
							<!-- Choose a plan -->
						</h2>


						<div class="col-lg-12 col-md-12 plan-box4 double-dot">
							<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
								<h2> <fmt:message key="home.quote.plan" bundle="${msg}" />
								<!--  ${planQuote.getPlanCode() } -->
								</h2>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
								<div class="h4">
									<fmt:message key="workingholiday.dollar" bundle="${msg}" />
									<div class="flightcare-hk totalPrice"><%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%></div>
									<span class="del actualPrice"><del><% if(Double.parseDouble(planQuote.getDiscountAmount()) < 0){ %><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%><% } %></del></span>			
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
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><a href="#" data-target="#details-popup-1" data-toggle="modal"><i class="fa fa-plus"></i> <fmt:message key="home.quote.highlight.heading" bundle="${msg}" /> </a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
											    <div class="modal-dialog modal-lg">
											        <div class="modal-content plan-modal">
											            <a class="close" aria-label="Close" data-dismiss="modal">
											            <span aria-hidden="true" style="font-size:30px;">×</span>
											            </a>
											            <div class="fwdpanel-heading">
											                <h4 class="fwdpanel-title h4-4-full "><fmt:message key="home.quote.highlight.heading" bundle="${msg}" /></h4>
											            </div>
											            <div class="fwdpanel-body">
											               <p><fmt:message key="home.quote.highlight.desc1" bundle="${msg}" /></p>
											               <p><fmt:message key="home.quote.highlight.desc2" bundle="${msg}" /></p>
											               <p><fmt:message key="home.quote.highlight.desc3" bundle="${msg}" /></p>
											               <br>
											               <p><fmt:message key="home.quote.highlight.desc4" bundle="${msg}" /></p>
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
                                                    <span><a href="#" data-target="#details-popup-2" data-toggle="modal"><i
                                                            class="fa fa-plus"></i> <fmt:message key="home.quote.summary.heading" bundle="${msg}" /> </a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
											    <div class="modal-dialog modal-lg">
											        <div class="modal-content plan-modal">
											            <a class="close" aria-label="Close" data-dismiss="modal">
											            <span aria-hidden="true" style="font-size:30px;">×</span>
											            </a>
											            <div class="fwdpanel-heading">
											                <h4 class="fwdpanel-title h4-4-full"><fmt:message key="home.quote.summary.heading" bundle="${msg}" /></h4>
											            </div>
											            <div class="fwdpanel-body">
                                                            <h4 class="h4-2">
                                                                <strong> <fmt:message key="home.quote.summary.subheading1" bundle="${msg}" /> </strong>
                                                            </h4>
                                                            <p><fmt:message key="home.quote.summary.subheading1.desc1" bundle="${msg}" /></p>
                                                            <br>
                                                            <p><fmt:message key="home.quote.summary.subheading1.desc2" bundle="${msg}" /></p>
                                                            <br>
                                                            <table id="homecarePremium" class="table table-bordred">
                                                                <tbody>
                                                                    <tr style="background-color: #f68a1d;">
                                                                        <td><strong style="color: #fff;"><fmt:message key="home.quote.summary.table.header1" bundle="${msg}" /></strong></td>
                                                                        <td><strong style="color: #fff;"><fmt:message key="home.quote.summary.table.header2" bundle="${msg}" /></strong></td>
                                                                        <td><strong style="color: #fff;"><fmt:message key="home.quote.summary.table.header3" bundle="${msg}" /></strong></td>
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
                                                                                <fmt:message key="home.quote.summary.table.row3.col2.desc6" bundle="${msg}" />
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
											    </div>
											</div>
                                        </div>
                                        <!-- / Summary of Coverage -->


                                        <!--   Major Exclusions  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><a href="#" data-target="#details-popup-3" data-toggle="modal"><i
                                                            class="fa fa-plus"></i> <fmt:message key="home.quote.fullDetails.priceTable" bundle="${msg}" /></a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
											    <div class="modal-dialog modal-lg">
											        <div class="modal-content plan-modal">
											            <a class="close" aria-label="Close" data-dismiss="modal">
											            <span aria-hidden="true" style="font-size:30px;">×</span>
											            </a>
											            <div class="fwdpanel-heading">
											                <h4 class="fwdpanel-title h4-4-full "><fmt:message key="home.quote.fullDetails.priceTable" bundle="${msg}" /></h4>
											                <h5>
											                	<fmt:message key="home.quote.fullDetails.priceTable.desc" bundle="${msg}" />
											                </h5>
											            </div>
											            <div class="fwdpanel-body">
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
											    </div>
											</div>
                                        </div>
                                        <!-- /  Major Exclusions -->

                                        <!--   Age limit  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><a href="#" data-target="#details-popup-4" data-toggle="modal"><i
                                                            class="fa fa-plus"></i> <fmt:message key="home.quote.exclusion.heading" bundle="${msg}" /> </a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
											    <div class="modal-dialog modal-lg">
											        <div class="modal-content plan-modal">
											            <a class="close" aria-label="Close" data-dismiss="modal">
											            <span aria-hidden="true" style="font-size:30px;">×</span>
											            </a>
											            <div class="fwdpanel-heading">
											                <h4 class="fwdpanel-title h4-4-full "><fmt:message key="home.quote.exclusion.heading" bundle="${msg}" /></h4>
											            </div>
											            <div class="fwdpanel-body">
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
											    </div>
											</div>
                                        </div>
                                        <!-- / Age limit -->
                                        <!--   Premium table (HK$)  -->
                                        <div class="fwdpanel fwdpanel-primary">
                                            <div class="fwdpanel-heading">
                                                <h4 class="fwdpanel-title h4-4-full">
                                                    <span><a href="#" data-target="#details-popup-5" data-toggle="modal"><i
                                                            class="fa fa-plus"></i> <fmt:message key="home.quote.excess.heading" bundle="${msg}" /> </a> </span>
                                                </h4>
                                            </div>
                                            <div class="modal fade details-popup" id="details-popup-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
											    <div class="modal-dialog modal-lg">
											        <div class="modal-content plan-modal">
											            <a class="close" aria-label="Close" data-dismiss="modal">
											            <span aria-hidden="true" style="font-size:30px;">×</span>
											            </a>
											            <div class="fwdpanel-heading">
											                <h4 class="fwdpanel-title h4-4-full "><fmt:message key="home.quote.excess.heading" bundle="${msg}" /></h4>
											            </div>
											            <div class="fwdpanel-body">
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
											    </div>
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
					</div>
					
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="col-md-12 hidden-sm hidden-xs pad-none">
                            <div class="wd2">
								<div class="pull-left" style="width:150px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="home.sidebar.summary.product" bundle="${msg}" />
									</h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" class="pad-none"><fmt:message key="home.sidebar.summary.desc" bundle="${msg}" /></h4>
								</div>
								<div class="pull-right" style="padding-top: 45px;">
									<div class="text-right h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
									   <div class="hk" style="font-size: 18px;">
                                            <fmt:message key="workingholiday.dollar" bundle="${msg}" />
                                            <div style="font-weight: bold;font-size: 28px;" class="flightcare-hk"><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%></div>
                                        </div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
						</div>
						<div class="clearfix"></div>
							<div class="form-container" style="padding: 0px !important;">
						     <div style="width: 80%;margin-left: 10%;">
								<h3 style="padding-left:0px;font-size: 24px;"><fmt:message key="home.sidebar.summary.planType" bundle="${msg}" /></h3>
								<div>
									<p style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="home.sidebar.summary.planType.desc" bundle="${msg}" /></p>
								</div>
								</div>
                            </div>
                            <div id="promo-code-body" class="col-xs-12 pad-none">
                                <div style="width: 80%;margin-left: 10%;">
	                            <h3 style="font-size:18px;"><fmt:message key="home.sidebar.summary.promocode" bundle="${msg}" /></h3>
	                            <span class="text-grey" id="loadingPromo" style="display:none;"><fmt:message key="loading.text" bundle="${msg}" /></span>
	                            <span class="text-red" id="errPromoCode"></span>
	                            <div id="promo-wrap" class="form-group">
	                                <div class="input-group" id="inputPromo" style="display:inital;width:100%;">
	                                    <input type="text" id="promoCode" name="referralCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:75%;" onfocus="placeholderOnFocus(this,'<fmt:message key="home.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="home.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" value="<fmt:message key="home.sidebar.summary.promocode.placeholder" bundle="${msg}" />">
	                                    <a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:20%;" onclick="applyHomePromoCode()"><fmt:message key="home.action.apply" bundle="${msg}" /></a>
	                                </div>
	                            </div>
	                            <div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
	                                <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><fmt:message key="home.sidebar.summary.promocode.help" bundle="${msg}" /></i></a>
	                            </div>
	                            </div>
							</div>
							<div class="col-md-12 hidden-sm hidden-xs pad-none">
                               <div style="width: 80%;margin-left: 10%;">
									<h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.sidebar.summary.subtotal" bundle="${msg}" /></h3>
									<h3 id="subtotal" class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(planQuote.getGrossPremium()))%></h3>
		
									<h3 class="h4-1-orange-b col-lg-6 col-md-6 marg-t" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.sidebar.summary.discount" bundle="${msg}" /></h3>
									<h3 id="discountAmt" class="h4-1-orange-b col-lg-6 col-md-6 text-right marg-t" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(planQuote.getDiscountAmount()))%></h3>
								    <div class="clearfix"></div>
								</div>
							     <div class="orange-bdr"></div>
							     <div style="width: 80%;margin-left: 10%;">
									<h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.sidebar.summary.amountDue" bundle="${msg}" /></h3>
									<h3 id="amountdue" class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%></h3>
                                    <div class="clearfix"></div>
                                </div>
                               </div>
							<input type="hidden" name="planCode" id="planCode"
								value="${planQuote.planCode}">
							<input type="hidden" name="grossPremium" id="grossPremium"
								value="${planQuote.grossPremium}">
							<input type="hidden" name="discountAmount" id="discountAmount"
								value="${planQuote.discountAmount}">
							<input type="hidden" name="totalDue" id="totalDue"
								value="${planQuote.totalDue}">

							<input type="hidden" name="referralCode" id="referralCode"
								value="${planQuote.referralCode}">
							<input type="hidden" name="referralName" id="referralName"
								value="${planQuote.referralName}">

							<input type="hidden" name="answer1" value="${answer1}">
							<input type="hidden" name="answer2" value="${answer2}">

							
                            <!-- 
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left hidden-sm hidden-xs">
								<a href="<%=request.getContextPath()%>/${language}/home-insurance"
									class="bdr-curve btn btn-primary bck-btn"><fmt:message key="home.action.back" bundle="${msg}" /></a>
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pull-right full-width-button">
								<button type="submit" class="bdr-curve btn btn-primary btn-next">
									<fmt:message key="home.action.next" bundle="${msg}" />
								</button>
							</div> -->
							
							
							<div class="col-xs-12 hidden-sm hidden-xs pad-none">
		                          <div style="width: 80%;margin-left: 10%;">
		                            <div class="top35 pull-left pad-none" style="width:47%">
		                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
		                            </div>
		                            <div class="top35 pull-right pad-none" style="width:47%">
		                                <c:choose>
	<c:when test="${language=='en'}">
	<button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step1','<%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%>','','Regis_Home_Step1 EN','USD');"><fmt:message key="home.action.next" bundle="${msg}" />
</button>
	</c:when>
<c:otherwise>
	<button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step1','<%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%>','','Regis_Home_Step1 ZH','USD');"><fmt:message key="home.action.next" bundle="${msg}" /></button>
</c:otherwise>
</c:choose>


		                                
		                            </div>
		                            
		                            
		                            
		                            
		                            
		                            <div class="clearfix"></div>
		                            <br> <span class="text-red" id="errDue"></span> <br>
		                        </div>
		                    </div>
							

							<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 workingholiday-plan-disclaimer">
					<fmt:message key="home.main.other.disclaimer.part1" bundle="${msg}" />
					<a class="sub-link" href="${pageContext.request.contextPath}/<fmt:message key="home.provision.link" bundle="${msg}" />" target="_blank">
						<fmt:message key="home.main.other.disclaimer.part2" bundle="${msg}" /></a> 
						<fmt:message key="home.main.other.disclaimer.part5" bundle="${msg}" />
						<a href="<fmt:message key="home.brochure.link" bundle="${msg}" />" target="_blank" class=""> 
						<u><fmt:message key="home.main.other.disclaimer.part6" bundle="${msg}" /></u></a> 
						<fmt:message key="home.main.other.disclaimer.part3" bundle="${msg}" /><br> 
						<fmt:message key="home.main.other.disclaimer.part4" bundle="${msg}" />
				</p>				
				
				<div class="col-xs-12 hidden-md hidden-lg pad-none">
		           <div style="width: 80%;margin-left: 10%; margin-bottom: 40px;">
		                <div class="top35 pull-left pad-none" style="width:47%">
		                    <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
		                </div>
		                <div class="top35 pull-right pad-none" style="width:47%">
		                    <c:choose>
	<c:when test="${language=='en'}">
	<button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step1','<%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%>','','Regis_Home_Step1 EN','USD');"><fmt:message key="home.action.next" bundle="${msg}" />
</button>
	</c:when>
<c:otherwise>
	<button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step1','<%=String.format("%.2f",Double.parseDouble(planQuote.getTotalDue()))%>','','Regis_Home_Step1 ZH','USD');"><fmt:message key="home.action.next" bundle="${msg}" /></button>
</c:otherwise>
</c:choose>

		                </div>
		                <div class="clearfix"></div>
		            </div>
		        </div>
                </form:form>
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
					<div style="overflow: hidden;"><a class="close" aria-label="Close" data-dismiss="modal">
	                     <span aria-hidden="true" style="font-size:30px;">×</span>
	                   </a>
	                </div>
					<form>
					<div class="form-container">
						<h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
						<div class="alert alert-success hide proSuccess"></div>
						<h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /></h4>
						<div class="form-group">
							<input type="email" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
							<input type="hidden" name="planCode" id="planCode" value="HOMECARE">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<%-- <a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a> --%>
								<button type="submit" onclick="return sendEmail()"
															class="bdr-curve btn btn-primary btn-lg wd5">
															<fmt:message key="promotion.get.code.action" bundle="${msg}" />
								</button>
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
	
	<div class="scroll-to-top">
	    <a title="Scroll to top" href="#">
	        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
	    </a>
	</div>

</body>
</html>

<script>
	
</script>