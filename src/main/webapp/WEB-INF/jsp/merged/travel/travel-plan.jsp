<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
    TravelQuoteBean sessTravelQuoteBean = (TravelQuoteBean) session.getAttribute("corrTravelQuote");
    if( sessTravelQuoteBean != null ) {
        //System.out.println("------------------------------------------------------------");     
        //System.out.println( "sess Personal: " + sessTravelQuoteBean.getTotalPersonalTraveller() );
        //System.out.println( "sess Adult   : " + sessTravelQuoteBean.getTotalAdultTraveller() );
        //System.out.println( "sess Child   : " + sessTravelQuoteBean.getTotalChildTraveller() );
        //System.out.println( "sess Others  : " + sessTravelQuoteBean.getTotalOtherTraveller() );
        //System.out.println("------------------------------------------------------------");
    }
    else {
        //System.out.println("default session TravelQuote");
    }
%>
<script>
perventRedirect=true;

// personal or family
var traveller;  
// personal
var personalTraveller = parseInt("${corrTravelQuote.totalPersonalTraveller}");
// family
var familyAdult = parseInt("${corrTravelQuote.totalAdultTraveller}");
var familyChild = parseInt("${corrTravelQuote.totalChildTraveller}");
var familyOther = parseInt("${corrTravelQuote.totalOtherTraveller}");  
var familyTraveller = familyAdult+familyChild+familyOther;

var t1 = "${corrTravelQuote.totalAdultTraveller}";
var t2 = "${corrTravelQuote.totalChildTraveller}";
var t3 = "${corrTravelQuote.totalOtherTraveller}";
var promoData = '';

//bmg inline variable
var promoCodeInsertFlag = true;
var updateQuoteFlag = true;
var tempPersonalTraveller = personalTraveller;
var tempAdultTraveller = familyAdult;
var tempChildTraveller = familyChild;
var tempOtherTraveller = familyOther;

var tempTotalTraveller = 0;
if(personalTraveller>familyTraveller){
	tempTotalTraveller=personalTraveller;
}else{
	tempTotalTraveller=familyTraveller;
}
//bmg inline variable

var promoCodePlaceholder="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />";


	function getuserDetails() {

		
	}
	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("promoCode").value;

		if (promoCode.trim() == "" || promoCode==promoCodePlaceholder) {
			$("#loadingPromo").hide();
			promoCodeInsertFlag = true;
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			$('#inputPromo').addClass('invalid-field');
			flag = false;
		} else {
			$('#inputPromo').removeClass('invalid-field');
			flag = true;
		}

		return flag;
	}
	
	function submitPlan(){
		$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
		
		setTimeout(function(){
			if(chkDueAmount()){
				$("#frmTravelPlan").submit();
			}else{
				$('#loading-overlay').modal('hide');
			}
		}, 500);
	}
	
	function chkDueAmount() {		
		$(".errDue").html('');
		var flag = false;
		var amount = document.getElementById("amountdue").innerHTML;

		if (amount == "0") {
			$(".errDue").html("<fmt:message key="travel.plan.empty" bundle="${msg}" />") ;
			flag = false;
		} else {
			if ($("#promoCode").val()==promoCodePlaceholder) {
	            $("#promoCode").val('');
	        }
			flag = true;
		}

		return flag;
	}
	
	function applyTravelPromoCode() {
		if(promoCodeInsertFlag){
			promoCodeInsertFlag = false;
			
			$("#errPromoCode").html("");
	        
	        if(chkPromoCode()){
	        	$('#loading-overlay').modal({
	                backdrop: 'static',
	                keyboard: false
	            })
	            console.log($('#frmTravelPlan input').serialize());
	        	$.ajax({
	                type : 'POST',
	                url : '<%=request.getContextPath()%>/applyTravelPromoCode',
	                data : $('#frmTravelPlan input').serialize(),
	                success : function(data) {
	                	$('#loading-overlay').modal('hide');
	                    promoCodeInsertFlag = true;
	                    var json = JSON.parse(data);
	                    promoData = json;
	                    setValue(json);
	                }

	            });
	        }else{
	        	promoCodeInsertFlag = true;
	        }
		}
	}
	function updateTravelQuote() {
		if(updateQuoteFlag){
			$('#loading-overlay').modal({
			    backdrop: 'static',
			    keyboard: false
			})
			updateQuoteFlag = false;
			
			$('#lblCountDesk').html(tempTotalTraveller);
			$("#totalPersonalTraveller").val(tempPersonalTraveller);
			$("#totalAdultTraveller").val(tempAdultTraveller);
            $("#totalChildTraveller").val(tempChildTraveller);
            $("#totalOtherTraveller").val(tempOtherTraveller);
			
            $('#myFWDropdown').toggleClass('open');
            console.log($('#frmTravelPlan input').serialize());
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/updateTravelQuote',
				data : $('#frmTravelPlan input').serialize(),
				success : function(data) {
					$('#loading-overlay').modal('hide');
					updateQuoteFlag = true;
					
					var json = JSON.parse(data);
					promoData = json;
					setValue(json);
					$("#totalTravellingDays").val(json.totalDays);
					$("#totalTravellingDaysSpan").html(json.totalDays);
				}
			});
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
				
				//$("#subtotal").html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
				$("#subtotal").html(numeral(result["priceInfoB"].grossPremium).format('0,0.00'));
				/*$("#discountAmt").html(parseFloat(result["priceInfoB"].discountAmount).toFixed(2));
                $('#selectedDiscountAmt').val(parseFloat(result["priceInfoB"].discountAmount).toFixed(2));
                $('#txtDiscountAmount').val(parseFloat(result["priceInfoB"].discountAmount).toFixed(2));*/
                $("#discountAmt").html(numeral(result["priceInfoB"].discountAmount).format('0,0.00'));
                $('#selectedDiscountAmt').val(numeral(result["priceInfoB"].discountAmount).format('0,0.00'));
                $('#txtDiscountAmount').val(numeral(result["priceInfoB"].discountAmount).format('0,0.00'));
				//$("#amountdue").html(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				$("#amountdue").html(numeral(result["priceInfoB"].totalDue).format('0,0.00'));
				/*$('#selectedAmountDue').val(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				$('#selectPlanPremium').val(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));*/
				$('#selectedAmountDue').val(numeral(result["priceInfoB"].totalDue).format('0,0.00'));
                $('#selectPlanPremium').val(numeral(result["priceInfoB"].grossPremium).format('0,0.00'));
                $("#plansummary").html(numeral(result["priceInfoB"].grossPremium).format('0,0.00'));
				
			} else if (selValue == "A") {
				//var totalDue = parseFloat(result["priceInfoB"].totalDue).toFixed(2);
				//$("#subtotal").html(parseFloat(result["priceInfoA"].grossPremium).toFixed(2));
				$("#subtotal").html(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));
				/*
				$("#discountAmt").html(parseFloat(result["priceInfoA"].discountAmount).toFixed(2));
				$('#selectedDiscountAmt').val(parseFloat(result["priceInfoA"].discountAmount).toFixed(2));
				$('#txtDiscountAmount').val(parseFloat(result["priceInfoA"].discountAmount).toFixed(2));*/
				$("#discountAmt").html(numeral(result["priceInfoA"].discountAmount).format('0,0.00'));
                $('#selectedDiscountAmt').val(numeral(result["priceInfoA"].discountAmount).format('0,0.00'));
                $('#txtDiscountAmount').val(numeral(result["priceInfoA"].discountAmount).format('0,0.00'));
				//$("#amountdue").html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				$("#amountdue").html(numeral(result["priceInfoA"].totalDue).format('0,0.00'));
				/*$('#selectedAmountDue').val(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				$('#selectPlanPremium').val(parseFloat(result["priceInfoA"].grossPremium).toFixed(2));*/
				$('#selectedAmountDue').val(numeral(result["priceInfoA"].totalDue).format('0,0.00'));
                $('#selectPlanPremium').val(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));
                $("#plansummary").html(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));

			}
			if(result["priceInfoA"].totalDue!=result["priceInfoA"].grossPremium){
				//$('.actualPriceA del').html(parseFloat(result["priceInfoA"].grossPremium).toFixed(2));
				$('.actualPriceA del').html(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));
			}
			/*$('.totalPriceA').html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));*/
			$('.totalPriceA').html(numeral(result["priceInfoA"].totalDue).format('0,0.00'));
			
			if(result["priceInfoB"].totalDue!=result["priceInfoB"].grossPremium){
                //$('.actualPriceB del').html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
				$('.actualPriceB del').html(numeral(result["priceInfoB"].grossPremium).format('0,0.00'));
            }
			//$('.totalPriceB').html(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
			$('.totalPriceB').html(numeral(result["priceInfoB"].totalDue).format('0,0.00'));
		}
	}
	$(document).ready(function() {
	   // update quote area to show headcounts
	    if("${corrTravelQuote.planSelected}".toLowerCase() == "family"){
	        if (familyTraveller > 0){
	            $('#family_plan_desk_spinner').show();
	            $('#family_plan_btm_spinner').show();
	            $('#family_plan_mob_spinner').show();
	        }
	        traveller = familyTraveller;
	     }else{
	       traveller = personalTraveller;
	     }
	});
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
<%  
	String cp = request.getContextPath(); 
	//System.out.println("travel-plan.jsp");
	
	String PersonalPlanChecked = "";
	  String FamilyPlanChecked = "";
	  String personalSpinnerStyle = "";
	  String familySpinnerStyle = "style='display:none'";
	  if( sessTravelQuoteBean != null ) {
	      //System.out.println(sessTravelQuoteBean.getPlanSelected());
	        if(sessTravelQuoteBean.getPlanSelected().equalsIgnoreCase("personal")){
	          PersonalPlanChecked = "checked";
	        }
	        else if(sessTravelQuoteBean.getPlanSelected().equalsIgnoreCase("family")){
	          
	          FamilyPlanChecked = "checked";
	          personalSpinnerStyle = "style='display:none'";
	          familySpinnerStyle = "";
	        } 
	        //System.out.println(familySpinnerStyle);
	        //System.out.println(personalSpinnerStyle);
	  }
%>
<section>
	<div id="cn" class="container">
		<div class="row">
			<form:form name="frmTravelPlan" id="frmTravelPlan" action="${pageContext.request.contextPath}/${language}/travel-insurance/user-details" method="post" modelAttribute="travelQuote" onsubmit="return chkDueAmount();" >
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2><fmt:message key="travel.quote.jumbo" bundle="${msg}" /></h2>
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
										<span class="status"><fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle second">
										<span class="status"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle third">
										<span class="status"><fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle fourth">
										<span class="status lst-status"><fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="quote-wrap" class="container pad-none bdr">
					<div class="col-lg-8 col-xs-12 col-sm-12 col-md-8 pad-none">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose hidden-sm hidden-xs"><fmt:message key="travel.quote.choose" bundle="${msg}" /></h2>
						<%
							QuoteDetails travelQuote = (QuoteDetails) request.getAttribute("quoteDetails");
						
							TravelQuoteBean travelQuoteBean = (TravelQuoteBean)request.getAttribute("travelQuote"); 
							
					    	if (travelQuote != null)
						 	{
					    		if(travelQuote.getPlanSelected().equalsIgnoreCase("personal"))
					    		{
					    			travelQuoteBean.setTotalOtherTraveller(0);
					    		}
					    	 	session.setAttribute("tq", travelQuote);
						 	}
					    	else 
					    	{
					    		//System.out.println("travel-plan.jsp travelQuote is null!!!");
					    	}
						
					    	if (travelQuote != null)
						 	{
								if (travelQuote.getPlanName().length > 0) {
									for (int i = 0; i < travelQuote.getPlanName().length; i++) {
						%>
						<div class="col-lg-12 col-md-12 plan-box3 travelproductbox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getDiscountAmount()[i]%>','<%=travelQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-7 col-xs-5 pad-none">								
								<h2>
									<fmt:message key="travel.quote.plan" bundle="${msg}" /> <%=travelQuote.getPlanName()[i]%>									
									<br> <%if (travelQuote.getPlanName()[i].equals("A"))
									{%>  <fmt:message key="travel.quote.plan1.type" bundle="${msg}" /><br> HK$ 1,000,000 <fmt:message key="travel.quote.plan1.medical" bundle="${msg}" />
								<%}	else{ %>
										<fmt:message key="travel.quote.plan2.type" bundle="${msg}" /><br> HK$	500,000 <fmt:message key="travel.quote.plan2.medical" bundle="${msg}" />
									<%} %>
									
								</h2>	
							</div>
							<div class="col-lg-4 col-md-4 col-sm-5 col-xs-7">
								
								<h3><fmt:message key="travel.dollar" bundle="${msg}" /></h3>
								<%
										if (Double.parseDouble(travelQuote.getDiscountAmount()[i]) == 0) {
									%>
									<h6>
									<!-- <span id="grossPremium"<%=i%> class="totalPrice<%=travelQuote.getPlanName()[i]%>"><%=String.format("%.2f",Double.parseDouble(travelQuote.getGrossPremium()[i]))%></span> -->
									<span id="grossPremium"<%=i%> class="totalPrice<%=travelQuote.getPlanName()[i]%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=travelQuote.getGrossPremium()[i]%>" />.00</span>
									<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
								</h6>
								<span class="del actualPrice<%=travelQuote.getPlanName()[i]%>"><del></del></span>
									<%
										} else {
									%>
									<h6>
									<span id="grossPremium"<%=i%> class="totalPrice<%=travelQuote.getPlanName()[i]%>"><%=String.format("%.2f",Double.parseDouble(travelQuote.getToalDue()[i]))%></span>
									<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
								</h6>
								<span class="del actualPrice<%=travelQuote.getPlanName()[i]%>"><del><%=String.format("%.2f",Double.parseDouble(travelQuote.getGrossPremium()[i]))%></del></span>
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
										String planBenefitKey = "travel.quote.plan" + (i+1)+ ".benefits";
										String planBenefitDesc1Key = "travel.quote.plan" + (i+1)+ ".benefits.desc1";
										String planBenefitDesc2Key = "travel.quote.plan" + (i+1)+ ".benefits.desc2";
										String planBenefitDesc3Key = "travel.quote.plan" + (i+1)+ ".benefits.desc3";
										String planBenefitDesc4Key = "travel.quote.plan" + (i+1)+ ".benefits.desc4";
										String planBenefitDesc1PriceKey = "travel.quote.plan" + (i+1)+ ".benefits.desc1.price";
										String planBenefitDesc2PriceKey = "travel.quote.plan" + (i+1)+ ".benefits.desc2.price";
										String planBenefitDesc3PriceKey = "travel.quote.plan" + (i+1)+ ".benefits.desc3.price";
										String planBenefitDesc4PriceKey = "travel.quote.plan" + (i+1)+ ".benefits.desc4.price";
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

						<input type="hidden" name="txtTotalDue" id="txtTotalDue<%=i%>"
							value="<%=travelQuote.getToalDue()[i]%>"> <input
							type="hidden" name="txtGrossPremium" id="txtGrossPremium<%=i%>"
							value="<%=travelQuote.getGrossPremium()[i]%>"> <input
							type="hidden" name="txtDiscountAmount" id="txtDiscountAmount<%=i%>"
							value="<%=travelQuote.getDiscountAmount()[i]%>"> <input
							type="hidden" name="referralCode" id="referralCode<%=i%>"
							value="<%=travelQuote.getReferralCode()%>"> <input
							type="hidden" name="referralName" id="referralName<%=i%>"
							value="<%=travelQuote.getReferralName()%>">
						<%
							}
						%>
						<%
							}
						 	}
					    	else 
					    	{
					    		//System.out.println("travel-plan.jsp travelQuote is null!!!");
					    	}
						%>
						<div class="clearfix"></div>
						<!--Full Coverage-->
						
						<div class="annual_travel_tips hidden-xs hidden-sm">
						  <table>
						      <tr>
						          <td><img src="<%=request.getContextPath()%>/resources/images/annual_travel/i-icon.png" alt=""></td>
						          <td><fmt:message key="travel.quote.upsell" bundle="${msg}" /></td>
						      </tr>
						  </table>
                        </div>
						
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span>
									<a href="#" class="fwdpanel-minimize">
									   <i class="fa fa-plus"></i> <fmt:message key="travel.quote.fullDetails.heading" bundle="${msg}" /></span>
									</a>		
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
															class="fa fa-plus"></i> <a href="#"data-target="#details-popup-1" data-toggle="modal"><fmt:message key="travel.quote.fullDetails.keyFeature1" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
				                                <div class="modal-dialog modal-lg">
				                                    <div class="modal-content plan-modal">
				                                        <a class="close" aria-label="Close" data-dismiss="modal">
				                                        <span aria-hidden="true" style="font-size:30px;">×</span>
				                                        </a>
				                                        <div class="fwdpanel-heading">
				                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="travel.quote.fullDetails.keyFeature1" bundle="${msg}" /></h4>
				                                        </div>
				                                        <div class="fwdpanel-body">
			                                                <p><fmt:message key="travel.quote.fullDetails.keyFeature1.subheading" bundle="${msg}" /></p>
			                                                <br>
			                                                <p>
			                                                    <ul class="text-justify">
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc1" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc2" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc3" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc4" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc5" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc6" bundle="${msg}" />
			                                                        </li>
			                                                        <li>
			                                                            <fmt:message key="travel.quote.fullDetails.keyFeature1.desc7" bundle="${msg}" />
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
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-2" data-toggle="modal"><fmt:message key="travel.quote.fullDetails.keyFeature2" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="travel.quote.fullDetails.keyFeature2" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body" >
			                                                <table id="summary" class="table table-bordred">
			                                                    <tbody>
			                                                        <tr>
			                                                            <td rowspan="2"><fmt:message key="travel.quote.fullDetails.table.header1" bundle="${msg}" /></td>
			                                                            <td rowspan="2"><fmt:message key="travel.quote.fullDetails.table.header2" bundle="${msg}" /></td>
			                                                            <td colspan="2"><fmt:message key="travel.quote.fullDetails.table.header3" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.header3.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.header3.col2" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row1.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row1.col2.desc1" bundle="${msg}" /> <br/><br/>
			                                                                <fmt:message key="travel.quote.fullDetails.table.row1.col2.desc2" bundle="${msg}" />
			                                                            </td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row1.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row1.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="2"><fmt:message key="travel.quote.fullDetails.table.row2.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col2.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col3.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col4.desc1" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col2.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col3.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row2.col4.desc2" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="9"><fmt:message key="travel.quote.fullDetails.table.row3.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc1" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc2" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc3" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc4" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc4" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc5" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc5" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc5" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc6" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc6" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc6" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc7" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc7" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc7" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc8" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc8" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc8" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col2.desc9" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col3.desc9" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row3.col4.desc9" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="3"><fmt:message key="travel.quote.fullDetails.table.row4.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col2.desc1.subheading" bundle="${msg}" /><br/>
			                                                                <fmt:message key="travel.quote.fullDetails.table.row4.col2.desc1.content" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col3.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col4.desc1" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col2.desc2.subheading" bundle="${msg}" /><br/>
			                                                                <fmt:message key="travel.quote.fullDetails.table.row4.col2.desc2.content" bundle="${msg}" />
			                                                            </td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col3.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col4.desc2" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col2.desc3.subheading" bundle="${msg}" /><br/> 
			                                                                <fmt:message key="travel.quote.fullDetails.table.row4.col2.desc3.content" bundle="${msg}" />
			                                                            </td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col3.desc3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row4.col4.desc3" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row5.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row5.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row5.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row5.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row6.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row6.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row6.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row6.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row7.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row7.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row7.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row7.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row8.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row8.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row8.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row8.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="3"><fmt:message key="travel.quote.fullDetails.table.row9.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col2.desc1.subheading" bundle="${msg}" /><br/>
			                                                                <fmt:message key="travel.quote.fullDetails.table.row9.col2.desc1.content" bundle="${msg}" />
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col3.desc1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col4.desc1" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col2.desc2.subheading" bundle="${msg}" /><br/>
			                                                                <fmt:message key="travel.quote.fullDetails.table.row9.col2.desc2.content" bundle="${msg}" />
			                                                            </td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col3.desc2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col4.desc2" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col2.desc3.subheading" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col3.desc3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row9.col4.desc3" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row10.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row10.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row10.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row10.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row11.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row11.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row11.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row11.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row12.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row12.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row12.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row12.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row13.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row13.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row13.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row13.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row14.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row14.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row14.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row14.col4" bundle="${msg}" /></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row15.col1" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row15.col2" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row15.col3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.table.row15.col4" bundle="${msg}" /></td>
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
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-3" data-toggle="modal"><fmt:message key="travel.quote.fullDetails.majorExclusion" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="travel.quote.fullDetails.majorExclusion" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
			                                                <ol class="text-justify">
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc1" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc2" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc3" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc4" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc5" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc6" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc7" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc8" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc9" bundle="${msg}" /></li>
			                                                    <li><fmt:message key="travel.quote.fullDetails.majorExclusion.desc10" bundle="${msg}" /></li>
			                                                </ol>
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
													<span><i
															class="fa fa-plus"></i>  <a href="#" data-target="#details-popup-4" data-toggle="modal"><fmt:message key="travel.quote.fullDetails.ageLimit" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-body">
	                                                        <div class="fwdpanel-heading">
	                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="travel.quote.fullDetails.ageLimit" bundle="${msg}" /></h4>
	                                                        </div>
			                                                <p><fmt:message key="travel.quote.fullDetails.ageLimit.desc1" bundle="${msg}" /><br/>
			                                                    <fmt:message key="travel.quote.fullDetails.ageLimit.desc2" bundle="${msg}" />
			                                                </p>
			                                            </div>
                                                    </div>
                                                </div>
                                             </div>
											
										</div>
										<!-- / Age limit -->
										<!--   Premium table (���)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full">
													<span><i
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-5" data-toggle="modal"><fmt:message key="travel.quote.fullDetails.priceTable" bundle="${msg}" /></a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full "><fmt:message key="travel.quote.fullDetails.priceTable" bundle="${msg}" /></h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
			                                                <h4 class="h4-2">
			                                                    <strong><fmt:message key="travel.quote.fullDetails.priceTable.single.heading" bundle="${msg}" /></strong>
			                                                </h4>
			                                                <table id="Premium" class="table table-bordred">
			                                                    <tbody>
			                                                        <tr>
			                                                            <td rowspan="2"><strong><fmt:message key="travel.quote.fullDetails.priceTable.single.header1" bundle="${msg}" /></strong></td>
			                                                            <td colspan="2"><strong><fmt:message key="travel.quote.fullDetails.priceTable.single.header2" bundle="${msg}" /></strong></td>
			                                                            <td colspan="2"><strong><fmt:message key="travel.quote.fullDetails.priceTable.single.header3" bundle="${msg}" /></strong></td>
			                                                            <td colspan="2"><strong><fmt:message key="travel.quote.fullDetails.priceTable.single.header4" bundle="${msg}" /></strong></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td width="101"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></strong></td>
			                                                            <td width="86"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></strong></td>
			                                                            <td width="84"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></strong></td>
			                                                            <td width="81"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></strong></td>
			                                                            <td width="93"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></strong></td>
			                                                            <td width="88"><strong><fmt:message key="travel.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></strong></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td style="background-color: #fff;color: #333">1</td>
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
			                                                            <td><fmt:message key="travel.quote.fullDetails.priceTable.dayLimit" bundle="${msg}" />
			                                                            <td>20</td>
			                                                            <td>12</td>
			                                                            <td>35</td>
			                                                            <td>21</td>
			                                                            <td>50</td>
			                                                            <td>30</td>
			                                                        </tr>
			                                                    </tbody>
			                                                </table>
			                                                <!--<h4 class="h4-2">
			                                                    <strong><fmt:message key="travel.quote.fullDetails.priceTable.annual.heading" bundle="${msg}" /></strong>
			                                                </h4>
			                                                <table id="annual" class="table table-bordred">
			                                                    <tbody>
			                                                        <tr>
			                                                            <td width="208" rowspan="4"><strong><fmt:message key="travel.quote.fullDetails.priceTable.annual.header1" bundle="${msg}" /></strong></td>
			                                                            <td colspan="2" rowspan="2"><fmt:message key="travel.quote.fullDetails.priceTable.annual.header2" bundle="${msg}" /></td>
			                                                            <td width="108"><fmt:message key="travel.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></td>
			                                                            <td width="36">1,800</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></td>
			                                                            <td>1,300</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td colspan="2" rowspan="2"><fmt:message key="travel.quote.fullDetails.priceTable.annual.header3" bundle="${msg}" /></td>
			                                                            <td><fmt:message key="travel.quote.fullDetails.priceTable.plan1" bundle="${msg}" /></td>
			                                                            <td>3,600</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td><fmt:message key="travel.quote.fullDetails.priceTable.plan2" bundle="${msg}" /></td>
			                                                            <td>2,600</td>
			                                                        </tr>
			                                                    </tbody>
			                                                </table>
			                                                <br>-->
			                                                <h4 class="h4-2">
			                                                    <strong><fmt:message key="travel.quote.fullDetails.priceTable.remark" bundle="${msg}" /></strong>
			                                                </h4>
			                                                <p><fmt:message key="travel.quote.fullDetails.priceTable.remark.desc1" bundle="${msg}" /><br/>
			                                                    <fmt:message key="travel.quote.fullDetails.priceTable.remark.desc2" bundle="${msg}" /><br/>
			                                                    <fmt:message key="travel.quote.fullDetails.priceTable.remark.desc3" bundle="${msg}" /><br/>
			                                                    <fmt:message key="travel.quote.fullDetails.priceTable.remark.desc4" bundle="${msg}" />
			                                                </p>
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
									href="<fmt:message key="travel.brochure.link" bundle="${msg}" />"
									target="_blank"><fmt:message key="travel.quote.fullDetails.download" bundle="${msg}" /></a>
							</h4>
						</div>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left" style="width:150px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="travel.sidebar.summary.product" bundle="${msg}" /></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">
									
										
								</div>
								<div class="pull-right" style="padding-top: 45px;">
									<div class="text-left pad-right1 h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;">
											<fmt:message key="travel.dollar" bundle="${msg}" />
											<div style="font-weight: bold;font-size: 28px;" class="flightcare-hk" id="plansummary">0</div>
											<input type="hidden" name="txtgrossPremiumAmt"
												id="txtgrossPremiumAmt" value="">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
							<div class="form-container" style="padding: 0px !important;">
							     <div style="width: 80%;margin-left: 10%;">
								 <h3><fmt:message key="travel.sidebar.summary.option1" bundle="${msg}" /> 
	                            </h3>
	                            <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                                  <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" value="${corrTravelQuote.trLeavingDate}" readonly>
                                </div>
								<h3><fmt:message key="travel.sidebar.summary.option2" bundle="${msg}" />
                                </h3>
                              <div class="input-group date"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
                                <input type="text" name="trBackDate" class="datepicker form-control" value="${corrTravelQuote.trBackDate}" readonly>
                              </div>
                              
								<!-- return date end  -->
								<!-- traveller start -->
								<div id="numOfDays">
                                    <fmt:message key="flight.quote.summary.option4" bundle="${msg}" /> <span id="totalTravellingDaysSpan"> ${travelQuoteBean.totalTravellingDays} <input
                                        type="hidden" name="totalTravellingDays"
                                        id="totalTravellingDays"
                                        value="${travelQuoteBean.totalTravellingDays}">
                                    </span>
                                    <fmt:message key="flight.quote.summary.option5" bundle="${msg}" />
                                </div>
								<!-- traveller end -->
								
								<h3><fmt:message key="travel.sidebar.summary.option3" bundle="${msg}" />
								
								<!-- <span class="span2 uline">
                                <a id="inline-change-3" class="inline-change"><fmt:message key="flight.details.summary.change" bundle="${msg}" /></a></span> -->
                                
								</h3>
								
								<span class="text-grey" id="loadingUpdate" style="display:none;"><fmt:message key="loading.text" bundle="${msg}" /></span>
                      
                      <input type="hidden" name="totalPersonalTraveller" id="txtTravellersInline" data-min="1" data-max="15" value="${corrTravelQuote.totalPersonalTraveller}"/>
                      <input type="hidden" name="familyPlan" id="family_desk_count" value="${corrTravelQuote.totalFamilyTravellers}">
                                 <input type="hidden" name="totalAdultTraveller" id="txtAdultsInline" data-min="1" data-max="2" value="${corrTravelQuote.totalAdultTraveller}"/>
                                 <input type="hidden" name="totalChildTraveller" id="txtChildInline" data-min="1" data-max="15" value="${corrTravelQuote.totalChildTraveller}"/>
                                 <input type="hidden" name="totalOtherTraveller" id="txtOtherInline" data-min="0" data-max="15" value="${corrTravelQuote.totalOtherTraveller}"/>
								
					<div id="show-traveller" class="form-group likeDatePicker bcg-trans">
            					<div class="input-group wd2 datepicker form-control" style="width:100% !important;margin: 0px !important;"> 
						<%	
							if (travelQuote == null)
					 			travelQuote = (QuoteDetails) session.getAttribute("tq");
						
							if (travelQuote != null && travelQuote.getPlanSelected().equals("personal"))
							{ 
						%>
								<c:if test="${travelQuoteBean.totalPersonalTraveller!=0}"> <fmt:message key="travel.sidebar.summary.label.personal" bundle="${msg}" /> : ${travelQuoteBean.totalPersonalTraveller}    </c:if>
						<% } 
						   else 
						   {
						%>
								<c:if test="${travelQuoteBean.totalAdultTraveller!=0}"> <fmt:message key="travel.sidebar.summary.label.family.parent" bundle="${msg}" /> : ${travelQuoteBean.totalAdultTraveller}  <br></c:if>
								<c:if test="${travelQuoteBean.totalChildTraveller!=0}"> <fmt:message key="travel.sidebar.summary.label.family.child" bundle="${msg}" /> : ${travelQuoteBean.totalChildTraveller} <br></c:if>
								<c:if test="${travelQuoteBean.totalOtherTraveller!=0}"> <fmt:message key="travel.sidebar.summary.label.family.others" bundle="${msg}" /> : ${travelQuoteBean.totalOtherTraveller} <br></c:if>
						<% }
						%>
						</div>
					</div>
								</div>
							</div>
							<div class="orange-bdr"></div>
						</div>
						<div id="promo-code-body" class="hide-html col-xs-12 pad-none">
						  <div style="width: 80%;margin-left: 10%;">
							<h3 style="font-size:18px;"><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
							<span class="text-grey" id="loadingPromo" style="display:none;"><fmt:message key="loading.text" bundle="${msg}" /></span>
							<span class="text-red" id="errPromoCode"></span>
							<div id="promo-wrap" class="form-group">
								<div class="input-group" id="inputPromo" style="display:inital;width:100%;padding-left: 20px;padding-right: 20px;">
									<input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onfocus="placeholderOnFocus(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" value="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />">
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onclick="applyTravelPromoCode()"><fmt:message key="travel.action.apply" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
					            <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><fmt:message key="travel.sidebar.summary.promocode.help" bundle="${msg}" /></i></a>
							</div>
							</div>
						</div>
						<div class="col-md-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.subtotal" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;"></h3>
							<input type="hidden" name="subTotal" id="subTotal" value="540">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.discount" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="discountAmt" style="padding-right: 0px;font-size: 18px;">-</h3>
							<input type="hidden" name="selectedDiscountAmt"id="selectedDiscountAmt" value="">
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div style="width:80%;margin-left:10%">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="travel.sidebar.summary.amountDue" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="amountdue" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedAmountDue" id="selectedAmountDue" value="">
							<input type="hidden" name="selectPlanPremium" id="selectPlanPremium" value="">
						  </div>
						</div>
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="top35 pull-right pad-none" style="width:47%">
                                <c:choose>
	                            <c:when test="${language=='en'}">
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:when>
	                            <c:otherwise>
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:otherwise>
                            </c:choose>

                                

                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-12"><span class="text-red errDue"></span></div>
                            <br>
                            <div class="clearfix"></div>
                            <span id="divPersonsDesk"></span>
                            <span id="lblDaysDesk" style="display: none"></span>
                            <div id="quote-wrap" class="clearfix"></div>
                        </div>
                    </div>
				</div>
		</div>
		<input type="hidden" name="planSelected" id="planSeelcted"
			value="${quoteDetails.planSelected}">
		<p class="padding1 workingholiday-plan-disclaimer">
			<fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" />
				<a class="sub-link"
				href="<%=request.getContextPath()%>/<fmt:message key="travel.provision.link" bundle="${msg}" />"
				target="_blank"><fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></a> 
				<fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> 
				<a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> 
					<u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u>
				</a> 
				<fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" />
				<br>
				<fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" />
		</p>
		
		<div class="col-xs-12 hidden-md hidden-lg pad-none">
		   <div style="width: 80%;margin-left: 10%; margin-bottom: 40px;">
		        <div class="top35 pull-left pad-none" style="width:47%">
		            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
		        </div>
		        <div class="top35 pull-right pad-none" style="width:47%">
		            <c:choose>
	                            <c:when test="${language=='en'}">
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:when>
	                            <c:otherwise>
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:otherwise>
                            </c:choose>

		            
           
		        </div>
		        <div class="clearfix"></div>
		        <span class="text-red errDue"></span>
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
                <div style="overflow: hidden;"><a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
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
                            <input type="hidden" name="planCode" id="planCode" value="TRAVELCARE">                         
                        </div>
                        <span id="errPromoEmail" class="text-red"></span> <br>
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <!-- <a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="sendEmail();"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a> -->
                                
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
		

		$(".travelproductbox").animate({
			"background-color" : "#000"
		}, 3000);
		
		 // inline changes for 3 departure date and traveller numbers
        $("#inline-change-1").click(function() {
            $('#dp1').datepicker('show');
        });
        $("#inline-change-2").click(function() {
             $('#dp2').datepicker('show');
        });
        $("#inline-change-3").click(function() {
        	$(this).hide();
            $('#myFWDropdown .dropdown-toggle').toggleClass('disabled');
            $('#myFWDropdown').toggleClass('hide-html');
            $("#show-traveller").hide();
            
        });
	});
	
//	function enterKeyPress(e){

//	    if (e.keyCode == 13) {
//	    	sendEmail();
//	        return false;
//       }
//    }
	function changeColorAndPrice(id,index, planName, discountAmt, totalDue) {
		$("#promo-code-body").fadeIn();
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

		var selected_price = $("#txtGrossPremium"+index).val();//$('#' + id).find('h6').text();
		selected_price = parseFloat(selected_price).toFixed(2);
		
		//$('#amountdue').html(parseFloat(totalDue).toFixed(2));
		$('#amountdue').html(numeral(totalDue).format('0,0.00'));
		
		
		/*   $('#selectedAmountDue').value=selected_price; */
		//$('#subtotal').html(parseFloat(selected_price).toFixed(2));
		$('#subtotal').html(numeral(selected_price).format('0,0.00'));
		//$('#plansummary').html(parseFloat(selected_price).toFixed(2));
		$('#plansummary').html(numeral(selected_price).format('0,0.00'));
		$('#seletedplanname').html('<fmt:message key="travel.summary.plan" bundle="${msg}" />'+planName);
		$('#inputseletedplanname').val(planName);
		$('#selectPlanPremium').val(parseFloat(selected_price).toFixed(2));

		$('#' + id).addClass("plan-box4");

		//$('#discountAmt').html(parseFloat(discountAmt).toFixed(2));
		$('#discountAmt').html(numeral(discountAmt).format('0,0.00'));
		
		document.getElementById("selectedAmountDue").value = parseFloat(totalDue.trim()).toFixed(2);
		document.getElementById("selectedDiscountAmt").value = parseFloat(discountAmt.trim()).toFixed(2);
		//$('#txtDiscountAmount').val(parseFloat(discountAmt.trim()).toFixed(2));
		$('#txtDiscountAmount').val(numeral(discountAmt.trim()).format('0,0.00'));
		document.getElementById("txtgrossPremiumAmt").value = parseFloat(selected_price.trim()).toFixed(2);
		
		if(promoData !== '')
			setValue(promoData);
		
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

	function BackMe() {
		window.history.back();
	}
</script>