<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.AnnualTravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<%
AnnualTravelQuoteBean sessTravelQuoteBean = (AnnualTravelQuoteBean) session.getAttribute("corrAnnualTravelQuote");
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
var personalTraveller = parseInt("${corrAnnualTravelQuote.totalPersonalTraveller}");
// family
var promoData = '';

//bmg inline variable
var promoCodeInsertFlag = true;
var updateQuoteFlag = true;
var tempPersonalTraveller = personalTraveller;

var tempTotalTraveller=personalTraveller;
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
		<%-- if(updateQuoteFlag){
			$('#loading-overlay').modal({
			    backdrop: 'static',
			    keyboard: false
			})
			updateQuoteFlag = false;
			
			$('#lblCountDesk').html(tempTotalTraveller);
			$("#totalPersonalTraveller").val(tempPersonalTraveller);
			
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
					
					//$("#totalTravellingDays").val(json.totalDays);
					//$("#totalTravellingDaysSpan").html(json.totalDays);
				}
			});
		} --%>
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
	    if("${corrAnnualTravelQuote.planSelected}".toLowerCase() == "family"){
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
			<form:form name="frmTravelPlan" id="frmTravelPlan" action='' method="post" modelAttribute="annualTravelQuote" onsubmit="return chkDueAmount(this,'frmTravelPlan');" >
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
							AnnualTravelQuoteBean travelQuoteBean = (AnnualTravelQuoteBean)request.getAttribute("annualTravelQuote"); 
							
					    	if (travelQuote != null)
						 	{
					    		if(travelQuote.getPlanSelected().equalsIgnoreCase("personal"))
					    		{
					    			//travelQuoteBean.setTotalOtherTraveller(0);
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
								<div class="product_plan_box_price_container col-lg-12 col-md-12 col-sm-6 col-xs-6 pad-none">
									<h4 class="product_plan_box_title_right">
									    Annual Premium
									</h4>
					                <h2 class="product_plan_box_price_right">
										HK$ <span class="totalPrice<%=travelQuote.getPlanName()[i]%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=travelQuote.getGrossPremium()[i]%>" />.00</span>
										<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
									</h2>
									<div class="del actualPriceA product_plan_box_del hide">HK$ <del>240.00</del></div>
								</div>
								<div class="product_plan_box_select_button_container col-lg-12 col-md-12 col-sm-6 col-xs-6 pad-none"><div class="product_plan_box_select_button">Select</div></div>
								<div class="clearfix"></div>
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
						
						<div class="col-xs-12 hidden-md hidden-lg pad-none" style="margin-top: 50px;">
				          <c:choose>
	                          <c:when test="${language=='en'}">
	                              <button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;submitPlan();">
	                                  <fmt:message key="annual.button.next" bundle="${msg}" /></button>
	                          </c:when>
	                          <c:otherwise>
	                              <button type="submit" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;submitPlan();">
	                                  <fmt:message key="annual.button.next" bundle="${msg}" /></button>
	                          </c:otherwise>
                          </c:choose>
				          <span class="text-red errDue"></span>
				        </div>
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
	                                            <thead>
	                                              <tr>
	                                                  <th>Benefits</th>
	                                                  <th>Plan A</th>
	                                                  <th>Plan B</th>
	                                              </tr>
	                                              </thead>
	                                              <tbody>
	                                              <tr>
                                                      <td data-title="Benefits">a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).</td>
                                                      <td data-title="Plan A">$1,000,000</td>
                                                      <td data-title="Plan B">$500,000</td>
                                                  </tr>
	                                              </tbody>
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
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">a) Overseas Hospital - HK$500 for each complete day in hospital to meet Insured Person's extra expenses.</td>
                                                   <td data-title="Plan A">$10,000</td>
                                                   <td data-title="Plan B">$5,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Compulsory Quarantine - HK$500 for each complete day during the journey or 7 days upon return to Hong Kong.</td>
                                                   <td data-title="Plan A">$10,000</td>
                                                   <td data-title="Plan B">$5,000</td>
                                               </tr>
                                               </tbody>
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
                                               <thead>
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">a) Emergency Medical Evacuation and Repatriation - to the nearest facility capable of providing adequate medical care and to repatriate back to Hong Kong if the physician determines that it is necessary.</td>
                                                   <td data-title="Plan A">Fully Covered</td>
                                                   <td data-title="Plan B">Fully Covered</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Guarantee of Hospital Admission Deposits - for hospital admittance fees on behalf of the Insured Person.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$40,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">c) Additional Costs of Accommodation - for an Insured Person's family member or travelling companion when such costs arise from hospitalization or delay due to a serious medical condition of the Insured Person.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">d) Compassionate Visit and Hotel Accommodation - up to 2 immediate family members, includes travelling cost to join the Insured Person who is confined in hospital for more than 3 days or dies abroad.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">e) Return of Minor Children - reasonable additional accommodation and travelling expenses for the return of unattended Insured Person's children (aged below 18) to Hong Kong.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">f) Repatriation of Mortal Remains - transportation charges for repatriation of the mortal remains to Hong Kong.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">g) Unexpected Return in the Event of the Death of a Close Relative - return economy class airfare for unexpected return to Hong Kong following the death of a close relative.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">h) Other Assistance - including telephone medical advice, emergency travel service assistance or legal referral etc.</td>
                                                   <td data-title="Plan A">included</td>
                                                   <td data-title="Plan B">included</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">Worldwide Emergency Assistance Service is arranged by International SOS (HK) Limited.</td>
                                                   <td></td>
                                                   <td></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Personal Accident
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Accidental death/permanent total disablement/total and permanent loss of sight in one or both eyes/loss by severance or permanent and total loss of use of one or more limbs. (Death benefit for children under 18 years old and for person over 70 years old shall not exceed HK$300,000.) </td>
                                                   <td data-title="Plan A">$1,200,000</td>
                                                   <td data-title="Plan B">$600,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">Major Burns<br/>Suffering of Third Degree Burns with burnt areas equal to or greater than 5% of head or 10% of total body surface area.</td>
                                                   <td data-title="Plan A">$200,000</td>
                                                   <td data-title="Plan B">$100,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">Credit Card Protection<br/>In the event of accidental death of the Insured Person during the journey, the outstanding balance of the Insured Person's credit card as at the date of accident will be covered.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Baggage
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Loss, physical breakage of damage directly resulting from accident, theft, burglary, or mishandling by carriers to the Insured Person’s baggage or personal property carry-on. The limit for each item, pair or set shall be HK$3,000.</td>
                                                   <td data-title="Plan A">$20,000</td>
                                                   <td data-title="Plan B">$3,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Baggage Delay
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Emergency purchases of essential items of toiletries and clothing and the additional travelling cost to get back the baggage consequent upon temporary deprivation of baggage for at least 6 hours from the time of arrival at destination abroad due to delay or misdirection in delivery.</td>
                                                   <td data-title="Plan A">$1,500</td>
                                                   <td data-title="Plan B">$500</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Personal Money
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Loss of cash, banknotes and travellers cheque arising from theft, burglary or robbery.</td>
                                                   <td data-title="Plan A">$3,000</td>
                                                   <td data-title="Plan B">$2,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Loss of Travel Document
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Cost of obtaining replacement air tickets, travel expenses and accommodation incurred to obtain such replacement arising from theft, burglary, robbery and accidental loss (Reimbursement is limited to HK$2,000 per day for Plan A or HK$1,000 per day for Plan B).</td>
                                                   <td data-title="Plan A">$20,000</td>
                                                   <td data-title="Plan B">$5,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Travel Delay
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">a) Additional Travel Cost<br/>Public transportation expenses necessarily incurred as a direct consequence of airline or other public transportation is being delayed due to serious weather condition, industrial action, hijack, mechanical derangement, but only if the Insured Person has to re-route the trip as the result of the cancellation of the transportation previously confirmed.</td>
                                                   <td data-title="Plan A">$10,000</td>
                                                   <td data-title="Plan B">$2,500</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Cash Allowance<br/>If the Insured Person needs to pay additional travelling cost in the event of travel delay, the Insured Person will be indemnified at HK$300 for each full 6-hour period delay.</td>
                                                   <td data-title="Plan A">$2,500</td>
                                                   <td data-title="Plan B">$600</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Select either a or b for compensation only.)</td>
                                                   <td></td>
                                                   <td></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Cancellation Charge
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Reimbursement of irrecoverable prepaid tour costs and airfares in the event of death, serious sickness or injury of the Insured Person, immediate family members, travel companion or close business partner of the Insured Person, witness summons, jury service, compulsory quarantine of the Insured Person, natural disaster or unanticipated outbreak of epidemic diseases/industrial action, riot/civil commotion at the destination within 7 days before departure date, serious damage to the Insured Person’s principal home in Hong Kong arising from fire or flooding within 10 days from the departure date or Black Outbound Travel Alert for the destination is in effect 7 days before the departure date.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">$5,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Curtailment of Trip
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Reimbursement of irrecoverable prepaid tour costs and airfares in the event of death, serious sickness or injury of the Insured Person, immediate family members, travel companion or close business partner of the Insured Person, witness summons, jury service, compulsory quarantine of the Insured Person, natural disaster or unanticipated outbreak of epidemic diseases/industrial action, riot/civil commotion at the destination within 7 days before departure date, serious damage to the Insured Person’s principal home in Hong Kong arising from fire or flooding within 10 days from the departure date or Black Outbound Travel Alert for the destination is in effect 7 days before the departure date.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">$5,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Loss of Home Contents
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">The loss of or damage to the contents or personal effects of the Insured Person’s principal home as a result of burglary accompanied by forcible and violent entry to or exit from the premise whilst the home is unoccupied during the period of travel.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">$10,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Personal Liability
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">Indemnity against third party legal liability arising from a result of accidental injury. Loss or damage to third party’s property during the Period of Insurance. (This benefit does not apply to liability arising from the use or hire of motor vehicle.)</td>
                                                   <td data-title="Plan A">$3,000,000</td>
                                                   <td data-title="Plan B">$1,500,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Rental Vehicle Excess
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">If the Insured Person hires a rental vehicle during the journey and is involved in a car accident, or the vehicle is damaged or stolen, the claims excess in the motor insurance policy purchased by the Insured Person will be reimbursed.</td>
                                                   <td data-title="Plan A">$5,000</td>
                                                   <td data-title="Plan B">$3,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Golfer "Hole-in-One"
                                        <i class="fa fa-plus pull-right"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead> 
                                               <tr>
                                                   <th>Benefits</th>
                                                   <th>Plan A</th>
                                                   <th>Plan B</th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="Benefits">If the Insured Person achieve a "hole-in-one" at any recognized golf course.</td>
                                                   <td data-title="Plan A">$3,000</td>
                                                   <td data-title="Plan B">$1,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    Important Notes
                                    <i class="fa fa-chevron-down pull-right"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p>
                                            For the Insured Person<br/>
                                            <ul class="bullets">
                                                <li>Citizenship of the Insured Person MUST holding a valid HKID during the Period of Insurance.</li>
                                                <li>Age limit for persons(s) insured under this Policy shall be from a minimum age of 18 years up to a maximum age of 70 years. </li>
                                                <li>This policy excluded any accidents whilst engaging in sports or games in a professional capacity or where an Insured Person would or could earn income or remuneration from engaging in such sport or game; racing (other than on foot). </li>
                                                <li>This policy do not cover the Insured Person being a crew member or an operator of any air carrier; accident whilst engaging in any kind of manual labour work; engaging in offshore activities including commercial diving, oil rigging, mining or aerial photography; handling of explosives, performing as an actor/actress, being a site worker, tour guide or tour escort; or armed force services. </li>
                                            </ul>
                                        </p>
                                        <p>
                                            About the Journey<br/>
                                            <ul class="bullets">
                                                <li>Each Journey commences when the Insured Person completes the immigration departure clearance procedure from Hong Kong and ends when the Insured Person completes the immigration arrival clearance procedure for returning to Hong Kong after such Journey </li>
                                                <li>Duration of Journeys taken by the Insured Person within the Period of Insurance and for a period of no longer than 90 consecutive days each will be covered under this Policy. </li>
                                            </ul>
                                        </p>
                                        <p>
                                            General Remind<br/>
                                            <ul class="bullets">
                                                <li>In the event that an Insured Person is covered by more than one policy issued by the Company for the same journey, benefit will be based on the policy which provides the greatest amount of benefit. </li>
                                                <li>This policy may cancel provided that no claim has been made. In this event, the policyholder will be entitled to a partial refund of the premium paid, following a deduction according to a pro-rata refund of premium paid and subject to a minimum premium of HK$500 per policy.</li>
                                            </ul>
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
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
                                        <p>
                                            A minimum age of 18 years to a maximum of 70 years.<br/><br/>(This summary gives only an outline of the insurance cover. Please refer to the Insurance Policy for the precise terms and conditions.)
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
                                  <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" value="${corrAnnualTravelQuote.trLeavingDate}" readonly>
                                </div>
								<h3><fmt:message key="annual.quote.care.ending" bundle="${msg}" /> 
                                </h3>
                              <div class="input-group date"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="calendar"></span></span>
                                <input type="text" name="trBackDate" class="datepicker form-control" value="${corrAnnualTravelQuote.trBackDate}" readonly>
                              </div>
								<div>
								    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
	                                    <h3><fmt:message key="annual.quote.care.numberoftraveller" bundle="${msg}" /></h3>
	                                </div>
	                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
	                                    <h3 style="text-align: right;font-weight: normal;">
		                                    <c:if test="${annualTravelQuoteBean.totalPersonalTraveller!=0}">${annualTravelQuoteBean.totalPersonalTraveller} <fmt:message key="annual.quote.care.traveller" bundle="${msg}" /></c:if>
	                                    </h3>
	                                </div>
	                                <div class="clearfix"></div>
								</div>
								
								
								<span class="text-grey" id="loadingUpdate" style="display:none;"><fmt:message key="annual.quote.care.updating" bundle="${msg}" /></span>
								
                      
                      <input type="hidden" name="totalPersonalTraveller" id="txtTravellersInline" data-min="1" data-max="15" value="${corrAnnualTravelQuote.totalPersonalTraveller}"/>
								
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