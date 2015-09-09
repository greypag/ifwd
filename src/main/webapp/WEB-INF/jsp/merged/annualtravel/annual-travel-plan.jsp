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
	function chkDueAmount(form,formId) {	
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
		var result = false;
		var formId = '#' + formId;
		$.ajax({
			type : "POST",
			url : '<%=request.getContextPath()%>/ajax/annualTravel/prepareTravelInsuranceUserDetails',
			data : $(formId).serialize(),
			async : false,
			success : function(data) {
				if (data == 'success') {
					form.action = '${pageContext.request.contextPath}/${language}/annual-travel-insurance/user-details';
					result = true;
				} else {
					$(".errDue").html("api is Wrong");
					result = false;
				}
			}
		});
		if(!flag){
	        $('#loading-overlay').modal('hide');
	    }
		return flag&&result;
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
	        	$.ajax({
	                type : 'POST',
	                url : '<%=request.getContextPath()%>/ajax/annualTravel/applyTravelPromoCode/apply',
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
            
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/ajax/annualTravel/updateTravelQuote/update',
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
	  }
%>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition hidden-lg hidden-md"></div></div>
        <div class="product_header_path_item active"><fmt:message key="annual.title.planoption" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.application" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.payment" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.confirmation" bundle="${msg}" /></div>
    </div>
</section>

<section>
	<div id="cn" class="container">
		<div class="row">
			<form:form name="frmTravelPlan" id="frmTravelPlan" action='' method="post" modelAttribute="travelQuote" onsubmit="return chkDueAmount(this,'frmTravelPlan');" >
				<ol class="breadcrumb pad-none">
					<li><a href="<%=request.getContextPath()%>/${language}/home"><fmt:message key="annual.title.home" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="<%=request.getContextPath()%>/${language}/travel-insurance"><fmt:message key="annual.title.travelcare" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-caret-right"></i><fmt:message key="annual.title.youroptions" bundle="${msg}" /></li>
				</ol>
				<div id="quote-wrap" class="container pad-none bdr gray-bg3">
					<div class="col-lg-8 col-xs-12 col-sm-12 col-md-8 pad-none white-bg1">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose hidden-sm hidden-xs"><fmt:message key="annual.quote.choose" bundle="${msg}" /></h2>
						
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
						<div class="col-lg-12 col-md-12 plan-box3 travelproductbox annual_travelproductbox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getDiscountAmount()[i]%>','<%=travelQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none">								
								<h2>
									PLAN <%=travelQuote.getPlanName()[i]%>
								</h2>
								<h4 class="product_plan_box_description">TravelCare Single Travel provides you with conprehensive travel protection <span class="product_plan_box_description_orange">up to HK$1,000,000 nedical premium cover</span> for leisure and business tips</h4>
							</div>
							<div class="partition"></div>
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
								<h4 class="product_plan_box_title_right">
								    Annual Premium
								</h4>
				                <h2 class="product_plan_box_price_right">
									HK$ <span class="totalPrice<%=travelQuote.getPlanName()[i]%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=travelQuote.getGrossPremium()[i]%>" />.00</span>
									<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
								</h2>
								<div class="del actualPriceA product_plan_box_del hide">HK$ <del>240.00</del></div>
								<div class="product_plan_box_select_button_container"><div class="product_plan_box_select_button">Select</div></div>
							</div>
							<div class="clearfix"></div>
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
					    	}
						%>
						
						<div class="clearfix"></div>
						
						<!--Full Coverage-->
						<div class="fwdpanel product_plan_panel_container">
						    <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Product Highlights
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p>TravelCare provides you with comprehensive travel protection for leisure and business trips. Medical Expenses, Worldwide Emergency Services, Hospital Cash Allowance, Personal Accident, Major Burns, Personal Money, Baggage, Personal Liability, Travel Delay, Cancellation and Curtailment of Trip are all included. For details, please refer to the section of "Coverage" below.</p>
                                        <br>
                                        <p>
                                            <ul class="bullets">
                                                <li>
                                                    No excess for all benefits
                                                </li>
                                                <li>
                                                    24-hour Worldwide Emergency Assistance Services
                                                </li>
                                                <li>
                                                    Cover for leisure and amateur sports activities including winter sports, bungee jumping, hiking, rock climbing, horse riding, scuba diving and other water sports
                                                </li>
                                                <li>
                                                    Cover for personal accident and medical related claims caused by an act of terrorism
                                                </li>
                                                <li>
                                                    Premium is calculated on a daily basis according to the exact length of your trip
                                                </li>
                                                <li>
                                                    Unlimited number of children for Individual & Children or Family Plan
                                                </li>
                                                <li>
                                                    Free automatic extension up to 10 days in case of an unavoidable delay of the stipulated itinerary
                                                </li>
                                            </ul>
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Summary of Coverage
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="fwdpanel-heading product_plan_inner_panel">
	                                <h4 class="fwdpanel-title h4-4-full">
	                                    Medical Expenses
	                                    <i class="fa fa-plus pull-right"></i>
	                                </h4>
	                            </div>
	                            <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
	                               <div class="row product_plan_panel_inner_content_row">
	                                    <div class="col-xs-12">
	                                        <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                </div>
	                            </div>
	                            <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Hospital or Quarantine Cash Allowance
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a) Overseas Hospital - HK$500 for each complete day in hospital to meet Insured Person's extra expenses.</td>
                                                   <td>$10,000</td>
                                                   <td>$5,000</td>
                                               </tr>
                                               <tr>
                                                   <td>b) Compulsory Quarantine - HK$500 for each complete day during the journey or 7 days upon return to Hong Kong.</td>
                                                   <td>$10,000</td>
                                                   <td>$5,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Worldwide Emergency Assistance Service
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a) Emergency Medical Evacuation and Repatriation - to the nearest facility capable of providing adequate medical care and to repatriate back to Hong Kong if the physician determines that it is necessary.</td>
                                                   <td>Fully Covered</td>
                                                   <td>Fully Covered</td>
                                               </tr>
                                               <tr>
                                                   <td>b) Guarantee of Hospital Admission Deposits - for hospital admittance fees on behalf of the Insured Person.</td>
                                                   <td>$40,000</td>
                                                   <td>$40,000</td>
                                               </tr>
                                               <tr>
                                                   <td>c) Additional Costs of Accommodation - for an Insured Person's family member or travelling companion when such costs arise from hospitalization or delay due to a serious medical condition of the Insured Person.</td>
                                                   <td>$40,000</td>
                                                   <td>$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td>d) Compassionate Visit and Hotel Accommodation - up to 2 immediate family members, includes travelling cost to join the Insured Person who is confined in hospital for more than 3 days or dies abroad.</td>
                                                   <td>$40,000</td>
                                                   <td>$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td>e) Return of Minor Children - reasonable additional accommodation and travelling expenses for the return of unattended Insured Person's children (aged below 18) to Hong Kong.</td>
                                                   <td>$40,000</td>
                                                   <td>$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td>f) Repatriation of Mortal Remains - transportation charges for repatriation of the mortal remains to Hong Kong.</td>
                                                   <td>$40,000</td>
                                                   <td>$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td>g) Unexpected Return in the Event of the Death of a Close Relative - return economy class airfare for unexpected return to Hong Kong following the death of a close relative.</td>
                                                   <td>$40,000</td>
                                                   <td>$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td>h) Other Assistance - including telephone medical advice, emergency travel service assistance or legal referral etc.</td>
                                                   <td>included</td>
                                                   <td>included</td>
                                               </tr>
                                               <tr>
                                                   <td>Worldwide Emergency Assistance Service is arranged by International SOS (HK) Limited.</td>
                                                   <td></td>
                                                   <td></td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               <tr>
                                                   <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                   <td>$1,000,000</td>
                                                   <td>$500,000</td>
                                               </tr>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Major Exclusions
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <ol class="">
                                            <li>War (whether declared or not), civil war, act of foreign enemies, rebellion, military or usurped power.</li>
                                            <li>Nuclear hazards.</li>
                                            <li>Acts of Terrorism (except the Personal Accident, Medical Cover, Worldwide Emergency Services, Travel Delay, Cancellation Charges and Trip Curtailment covered by TravelCare).</li>
                                            <li>Pre-existing condition, congenital and hereditary condition.</li>
                                            <li>Suicide, attempted suicide or intentional self-inflicted bodily injuries, insanity, abortion, miscarriage, assigned complications, pregnancy, child-birth, venereal diseases, the use of alcohol or drugs other than those prescribed by a qualified registered physician, dental treatment (unless resulting from accidental bodily injury to sound and natural teeth).</li>
                                            <li>Racing (other than on foot) or any sports or games in a professional capacity or where the Insured Person would or could earn income or remuneration from engaging in such sport.</li>
                                            <li>Any activities in the air unless an insured person is (i) travelling as a fare paying passenger in a licensed aircraft operated by a recognised airline, or (ii) participating in such activity where the maneuver or navigation of such activity is managed and controlled by another licensed person and the provider of such activity must be authorised by the relevant local authority.</li>
                                            <li>Losses not reported within 24 hours to the authorities (such as airlines, police) and failure to provide the report certified by the relevant authorities.</li>
                                            <li>Pager, Mobile Phone, handheld portable telecommunication equipment, computer equipment (except Lap Top Computer).</li>
                                            <li>Personal liabilities arising from use or operation of vehicles, aircraft, watercraft, willful, malicious or unlawful acts.</li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Age Limit
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;height: auto;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p>A minimum age of 6 weeks to a maximum of 85 years. Children under 18 years of age must be accompanied by at least one adult who is also insured under the same policy.<br/>
                                            (This summary gives only an outline of the insurance cover. Please refer to the Insurance Policy for the precise terms and conditions.)
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Premium table (HK$)
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <h4 class="h4-2">
                                            <strong>Single Trip Premium Table (HK$)</strong>
                                        </h4>
                                        <table id="Premium" class="table table-bordred">
                                            <tbody>
                                                <tr>
                                                    <td rowspan="2"><strong>No. of Day(s)</strong></td>
                                                    <td colspan="2"><strong>Individual</strong></td>
                                                    <td colspan="2"><strong>Individual & Children</strong></td>
                                                    <td colspan="2"><strong>Family</strong></td>
                                                </tr>
                                                <tr>
                                                    <td width="101"><strong>Plan A</strong></td>
                                                    <td width="86"><strong>Plan B</strong></td>
                                                    <td width="84"><strong>Plan A</strong></td>
                                                    <td width="81"><strong>Plan B</strong></td>
                                                    <td width="93"><strong>Plan A</strong></td>
                                                    <td width="88"><strong>Plan B</strong></td>
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
                                                    <td>Each additional day<br> up to 180 days
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
                                            <strong>Notes: </strong>
                                        </h4>
                                        <p>Individual - refers to the Insured Person aged between 18 and 85 <br/>
                                            Children - refers to dependent & unmarried children who is/are 6 weeks to 17 years of age travelling with the Insured Person during the entire journey <br/>
                                            Individual & Children - refers to Insured Person and his/her children defined above with no limit on number of children <br/>
                                            Family - refers to the Insured Person and his/her spouse and children as defined above with no limit on number of children
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
						</div>
						<div style="margin-bottom:20px;">
						      <h4 class="h4-4 product_landing_download_button pull-left">
		                            <i class="fa fa-download"></i> <a
		                                href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf"
		                                target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" />   </a>
		                        </h4>
		                        <h4 class="h4-4 product_landing_download_button pull-left">
		                            <i class="fa fa-download"></i> <a
		                                href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf"
		                                target="_blank"><fmt:message key="annual.common.policyprovisions" bundle="${msg}" />   </a>
		                        </h4>
		                        <div class="clearfix"></div>
						</div>
						</div>
					</div>

					<div
						class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left" style="width:150px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="annual.quote.care" bundle="${msg}" /></h2>
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"><fmt:message key="annual.quote.care.annualtravel" bundle="${msg}" /></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">
									
										
								</div>
								<div class="pull-right" style="padding-top: 80px;">
									<div class="text-left pad-right1 h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;text-align: right;">
											<fmt:message key="annual.common.dollar" bundle="${msg}" />
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
								 <h3><fmt:message key="annual.quote.care.starting" bundle="${msg}" />  
	                            </h3>
	                            <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                                  <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" value="${corrTravelQuote.trLeavingDate}" readonly>
                                </div>
								<h3><fmt:message key="annual.quote.care.ending" bundle="${msg}" /> 
                                </h3>
                              <div class="input-group date"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
                                <input type="text" name="trBackDate" class="datepicker form-control" value="${corrTravelQuote.trBackDate}" readonly>
                              </div>
								<div>
								    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
	                                    <h3><fmt:message key="annual.quote.care.numberoftraveller" bundle="${msg}" /></h3>
	                                </div>
	                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
	                                    <h3 style="text-align: right;font-weight: normal;">
		                                    <c:if test="${travelQuoteBean.totalPersonalTraveller!=0}">${travelQuoteBean.totalPersonalTraveller} <fmt:message key="annual.quote.care.traveller" bundle="${msg}" /></c:if>
	                                    </h3>
	                                </div>
	                                <div class="clearfix"></div>
								</div>
								
								
								<span class="text-grey" id="loadingUpdate" style="display:none;"><fmt:message key="annual.quote.care.updating" bundle="${msg}" /></span>
								
                      
                      <input type="hidden" name="totalPersonalTraveller" id="txtTravellersInline" data-min="1" data-max="15" value="${corrTravelQuote.totalPersonalTraveller}"/>
                      <input type="hidden" name="familyPlan" id="family_desk_count" value="${corrTravelQuote.totalFamilyTravellers}">
                                 <input type="hidden" name="totalAdultTraveller" id="txtAdultsInline" data-min="1" data-max="2" value="${corrTravelQuote.totalAdultTraveller}"/>
                                 <input type="hidden" name="totalChildTraveller" id="txtChildInline" data-min="1" data-max="15" value="${corrTravelQuote.totalChildTraveller}"/>
                                 <input type="hidden" name="totalOtherTraveller" id="txtOtherInline" data-min="0" data-max="15" value="${corrTravelQuote.totalOtherTraveller}"/>
								
					<div id="show-traveller" class="form-group likeDatePicker bcg-trans" style="display:none;">
            					<div class="input-group wd2 datepicker form-control" style="width:100% !important;margin: 0px !important;"> 
								 Traveller(s) : 1    
						</div>
					</div>
								</div>
							</div>
							<div class="orange-bdr"></div>
						</div>
						<div id="promo-code-body" class="hide-html col-xs-12 pad-none">
						  <div style="width: 80%;margin-left: 10%;">
							<h3 style="font-size:18px;"><fmt:message key="annual.quote.care.promotioncode" bundle="${msg}" /></h3>
							<span class="text-grey" id="loadingPromo" style="display:none;"><fmt:message key="annual.quote.care.updating" bundle="${msg}" /></span>
							<span class="text-red" id="errPromoCode"></span>
							<div id="promo-wrap" class="form-group">
								<div class="input-group" id="inputPromo" style="display:inital;width:100%;">
									<input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:75%;" onfocus="placeholderOnFocus(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" value="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />">
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:20%;" onclick="applyTravelPromoCode()"><fmt:message key="travel.action.apply" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
					            <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><fmt:message key="annual.quote.care.getpromotioncode" bundle="${msg}" /></i></a>
							</div>
							</div>
						</div>
						<div class="col-md-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.subtotal" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;"></h3>
							<input type="hidden" name="subTotal" id="subTotal" value="540">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.discount" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="discountAmt" style="padding-right: 0px;font-size: 18px;">-</h3>
							<input type="hidden" name="selectedDiscountAmt"id="selectedDiscountAmt" value="">
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div style="width:80%;margin-left:10%">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.amountdue" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="amountdue" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedAmountDue" id="selectedAmountDue" value="">
							<input type="hidden" name="selectPlanPremium" id="selectPlanPremium" value="">
						  </div>
						</div>
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="top35 pull-right pad-none" style="width:47%">
	                            <c:choose>
		                            <c:when test="${language=='en'}">
		                                <button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;$('#loading-overlay').modal({backdrop: 'static',keyboard: false});">
		                                    <fmt:message key="annual.button.next" bundle="${msg}" /></button>
		                            </c:when>
		                            <c:otherwise>
		                                <button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;$('#loading-overlay').modal({backdrop: 'static',keyboard: false});">
		                                    <fmt:message key="annual.button.next" bundle="${msg}" /></button>
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
			value="<%=travelQuote.getPlanSelected()%>">
		<p class="padding1 workingholiday-plan-disclaimer">
			<fmt:message key="annual.quote.bottom1" bundle="${msg}" />
				<br>
				<fmt:message key="annual.quote.bottom2" bundle="${msg}" />
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
                                
                                <button type="submit" onclick="return sendEmail()"
                                    class="bdr-curve btn btn-primary btn-lg wd5">
                                    <fmt:message key="promotion.get.code.action" bundle="${msg}" />
                                </button>
                            </div>
                            <div class="col-md-2">
                                <br>
                            </div>
                            <div class="col-lg-4 col-md-4">
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
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/annualTravel/sendEmail/send",
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