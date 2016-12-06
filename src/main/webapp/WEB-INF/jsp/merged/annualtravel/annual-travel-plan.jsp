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
var familyAdult = parseInt("${corrAnnualTravelQuote.totalAdultTraveller}");
var familyChild = parseInt("${corrAnnualTravelQuote.totalChildTraveller}");
var familyTraveller = familyAdult+familyChild;
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
    var promoCode = document.getElementById("promoCode").value.trim();
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

	function submitPlan(){
		$('#loading-overlay').modal({backdrop: 'static',keyboard: false});

		setTimeout(function(){
			if(chkDueAmount($("#frmTravelPlan"),"frmTravelPlan")  && chkClubMember()){
				$("#frmTravelPlan").submit();
			}else{
				$('#loading-overlay').modal('hide');
			}
		}, 500);
	}


    function chkClubMember() {
        $(".errDue").html('');
        var flag = true;
        var the_club_member_check_box = document.getElementById("the-club-member-toggle").checked;
        var the_club_membership_no = document.getElementById("theClubMembershipNo").value;
        if (the_club_member_check_box) {
            if (the_club_membership_no == "<fmt:message key="club.membership.number" bundle="${msg}" />" || the_club_membership_no == "" || /^\s*$/.test(the_club_membership_no)) {
                $("#errClubMemberID").html("<fmt:message key="club.member.empty" bundle="${msg}" />") ;
                document.getElementById("theClubMembershipNo").focus();
                $("#theClubMembershipNo").addClass("invalid-field");

                flag = false;
            }else if (the_club_membership_no != ""){
                if(/^8/.test(the_club_membership_no) == false){
                    $("#errClubMemberID").html("<fmt:message key="club.member.firstdigit" bundle="${msg}" />") ;
                    document.getElementById("theClubMembershipNo").focus();
                    $("#theClubMembershipNo").addClass("invalid-field");
                    flag = false;
                }else if(/^[0-9]{10}$/.test(the_club_membership_no) == false){
                    $("#errClubMemberID").html("<fmt:message key="club.member.digitchk" bundle="${msg}" />") ;
                    document.getElementById("theClubMembershipNo").focus();
                    $("#theClubMembershipNo").addClass("invalid-field");
                    flag = false;
                }
            }
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
		console.log($(formId).serialize());
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
					console.log(data);
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
	            console.log($('#frmTravelPlan input').serialize());
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
				$('#actualPriceA').removeClass('hide');
				$('.actualPriceA del').html(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));
			}
			/*$('.totalPriceA').html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));*/
			$('.totalPriceA').html(numeral(result["priceInfoA"].totalDue).format('0,0.00'));

			if(result["priceInfoB"].totalDue!=result["priceInfoB"].grossPremium){
                //$('.actualPriceB del').html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
                $('#actualPriceB').removeClass('hide');
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
					<li><fmt:message key="annual.title.home" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
					<li><fmt:message key="annual.title.travelcare" bundle="${msg}" /></li>
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
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none" style="margin-bottom: 20px;">
								<h2>
									<fmt:message key="travel.summary.plan" bundle="${msg}" /> <%=travelQuote.getPlanName()[i]%>
								</h2>
								<%if(i==0) { %>
								<h4 class="product_plan_box_description"><fmt:message key="annual.quote.productplan0" bundle="${msg}" /></h4>
								<%}else if(i==1) { %>
								<h4 class="product_plan_box_description"><fmt:message key="annual.quote.productplan1" bundle="${msg}" /></h4>
								<%} %>
							</div>
							<div class="partition"></div>
							<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
								<div class="product_plan_box_price_container col-lg-12 col-md-12 col-sm-6 col-xs-6 pad-none">
									<h4 class="product_plan_box_title_right">
									    <fmt:message key="annual.quote.annualpremium" bundle="${msg}" />
									</h4>
					                <%
										if (Double.parseDouble(travelQuote.getDiscountAmount()[i]) == 0) {
									%>
					                <h2 class="product_plan_box_price_right">
										<fmt:message key="annual.quote.dollar" bundle="${msg}" /> <span class="totalPrice<%=travelQuote.getPlanName()[i]%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=travelQuote.getGrossPremium()[i]%>" pattern="0.00" /></span>
										<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
									</h2>
									<div id="actualPrice<%=travelQuote.getPlanName()[i]%>" class="del actualPrice<%=travelQuote.getPlanName()[i]%> product_plan_box_del hide"><del>0</del></div>
									<%
										} else {
									%>
									<h2 class="product_plan_box_price_right">
										<fmt:message key="annual.quote.dollar" bundle="${msg}" /> <span class="totalPrice<%=travelQuote.getPlanName()[i]%>"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=travelQuote.getToalDue()[i]%>" pattern="0.00" /></span>
										<span class="hide"><%=travelQuote.getGrossPremium()[i]%></span>
									</h2>
									<div id="actualPrice<%=travelQuote.getPlanName()[i]%>" class="del actualPrice<%=travelQuote.getPlanName()[i]%> product_plan_box_del"><del><%=String.format("%.2f",Double.parseDouble(travelQuote.getGrossPremium()[i]))%></del></div>
									<%
										}
									%>
								</div>
								<div class="product_plan_box_select_button_container col-lg-12 col-md-12 col-sm-6 col-xs-6 pad-none"><div class="product_plan_box_select_button"><fmt:message key="annual.common.select" bundle="${msg}" /></div></div>
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
						</div>

						<input type="hidden" name="txtTotalDue" id="txtTotalDue<%=i%>"
							value="<c:out value="<%=travelQuote.getToalDue()[i]%>"/>"> <input
                            type="hidden" name="txtGrossPremium" id="txtGrossPremium<%=i%>"
                            value="<c:out value="<%=travelQuote.getGrossPremium()[i]%>"/>"> <input
                            type="hidden" name="txtDiscountAmount" id="txtDiscountAmount<%=i%>"
                            value="<c:out value="<%=travelQuote.getDiscountAmount()[i]%>"/>"> <input
                            type="hidden" name="referralCode" id="referralCode<%=i%>"
                            value="<c:out value="<%=travelQuote.getReferralCode()%>"/>"> <input
                            type="hidden" name="referralName" id="referralName<%=i%>"
                            value="<c:out value="<%=travelQuote.getReferralName()%>"/>">
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
                        <div class="top35 pull-left pad-none hidden-md hidden-lg" style="width:47%">
                            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                        </div>
						<div class="top35 pull-right pad-none hidden-md hidden-lg" style="width:47%">
				          <c:choose>
	                          <c:when test="${language=='en'}">
	                              <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;submitPlan();">
	                                  <fmt:message key="annual.button.next" bundle="${msg}" /></button>
	                          </c:when>
	                          <c:otherwise>
	                              <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;submitPlan();">
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
                                    <fmt:message key="annual.quote.producthighlights" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p><fmt:message key="annual.quote.producthighlights.content" bundle="${msg}" /></p>
                                        <br>
                                        <p>
                                            <ul class="bullets">
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content1" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content2" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content3" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content4" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content5" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content6" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="annual.quote.producthighlights.content7" bundle="${msg}" />
                                                </li>
                                            </ul>
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="annual.quote.summaryofcoverage" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="fwdpanel-heading product_plan_inner_panel">
	                                <h4 class="fwdpanel-title h4-4-full">
	                                    <fmt:message key="annual.quote.summaryofcoverage.medicalexpenses" bundle="${msg}" />
	                                    <i class="fa fa-plus"></i>
	                                </h4>
	                            </div>
	                            <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
	                               <div class="row product_plan_panel_inner_content_row">
	                                    <div class="col-xs-12">
	                                        <table>
	                                            <thead>
	                                              <tr>
	                                                  <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                                  <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                                  <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
	                                              </tr>
	                                              </thead>
	                                              <tbody>
	                                              <tr>
                                                      <td class="word-break" data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.medicalexpenses.benefits" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.medicalexpenses.plana" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.medicalexpenses.planb" bundle="${msg}" /></td>
                                                  </tr>
	                                              </tbody>
	                                           </table>
	                                    </div>
	                                    <div class="clearfix"></div>
	                                </div>
	                            </div>
	                            <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.hospital" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                               	   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.benefits2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.plana2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.hospital.planb2" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.worldwide" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb3" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb4" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb5" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits6" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana6" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb6" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits7" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana7" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb7" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits8" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.plana8" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.planb8" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.worldwide.benefits9" bundle="${msg}" /></td>
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
                                        <fmt:message key="annual.quote.summaryofcoverage.personalaccident" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.benefits2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.plana2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.planb2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.benefits3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.plana3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalaccident.planb3" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.baggage" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggage.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggage.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggage.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.baggagedelay" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggagedelay.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggagedelay.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.baggagedelay.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.personalmoney" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalmoney.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalmoney.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalmoney.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.traveldocument" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldocument.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldocument.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldocument.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.traveldelay" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.benefits2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.plana2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.planb2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.traveldelay.benefits3" bundle="${msg}" /></td>
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
                                        <fmt:message key="annual.quote.summaryofcoverage.cancellationcharge" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.cancellationcharge.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.cancellationcharge.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.cancellationcharge.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.curtailmentoftrip" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.curtailmentoftrip.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.curtailmentoftrip.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.curtailmentoftrip.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.lossofhomecontents" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.lossofhomecontents.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.lossofhomecontents.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.lossofhomecontents.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.personalliability" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalliability.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalliability.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.personalliability.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.rentalvehicleexcess" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.rentalvehicleexcess.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.rentalvehicleexcess.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.rentalvehicleexcess.planb1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="annual.quote.summaryofcoverage.golfer" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" /></th>
	                                               <th><fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.benefits" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.golfer.benefits1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.plana" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.golfer.plana1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="annual.quote.summaryofcoverage.planb" bundle="${msg}" />"><fmt:message key="annual.quote.summaryofcoverage.golfer.planb1" bundle="${msg}" /></td>
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
                                    <fmt:message key="annual.quote.importantnotes" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p>
                                            <fmt:message key="annual.quote.importantnotes.content1" bundle="${msg}" /><br/>
                                            <ul class="bullets">
                                                <li><fmt:message key="annual.quote.importantnotes.content2" bundle="${msg}" /></li>
                                                <li><fmt:message key="annual.quote.importantnotes.content3" bundle="${msg}" /></li>
                                                <li><fmt:message key="annual.quote.importantnotes.content4" bundle="${msg}" /></li>
                                            </ul>
                                        </p>
                                        <p>
                                            <fmt:message key="annual.quote.importantnotes.content5" bundle="${msg}" /><br/>
                                            <ul class="bullets">
                                                <li><fmt:message key="annual.quote.importantnotes.content6" bundle="${msg}" /></li>
                                                <li><fmt:message key="annual.quote.importantnotes.content7" bundle="${msg}" /></li>
                                            </ul>
                                        </p>
                                        <p>
                                            <fmt:message key="annual.quote.importantnotes.content8" bundle="${msg}" /><br/>
                                            <ul class="bullets">
                                                <li><fmt:message key="annual.quote.importantnotes.content9" bundle="${msg}" /></li>
                                                <li><fmt:message key="annual.quote.importantnotes.content10" bundle="${msg}" /></li>
                                            </ul>
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="annual.quote.majorexclusions" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <ol class="">
                                            <li><fmt:message key="annual.quote.majorexclusions.content1" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content2" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content3" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content4" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content5" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content6" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content7" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content8" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content9" bundle="${msg}" /></li>
                                            <li><fmt:message key="annual.quote.majorexclusions.content10" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="annual.quote.agelimit" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;height: auto;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p>
                                            <fmt:message key="annual.quote.agelimit.content1" bundle="${msg}" /><br/><br/><fmt:message key="annual.quote.agelimit.content2" bundle="${msg}" />
                                        </p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
						</div>
						<div style="margin-bottom:20px;">
						      <h4 class="h4-4 product_landing_download_button pull-left">
		                            <i class="fa fa-download"></i> <a
		                                href="<fmt:message key="annualtravel.brochure.link" bundle="${msg}" />"
		                                target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" />   </a>
		                        </h4>
		                        <h4 class="h4-4 product_landing_download_button pull-left">
		                            <i class="fa fa-download"></i> <a
		                                href="https://home.fwd.com.hk/gidoc/policyprovisions/Travelcare_Annual_JacketLatest.pdf"
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
								<div class="pull-left" style="width:145px;">
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="annual.quote.care" bundle="${msg}" /></h2>
									<h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"><fmt:message key="annual.quote.care.annualtravel" bundle="${msg}" /></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">


								</div>
								<div class="pull-right" style="padding-top: 80px;">
									<div class="text-left h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
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
		                                    <c:if test="${annualTravelQuoteBean.totalAdultTraveller!=0}">${annualTravelQuoteBean.totalAdultTraveller} <fmt:message key="annual.quote.care.adult" bundle="${msg}" /><br></c:if>
								            <c:if test="${annualTravelQuoteBean.totalChildTraveller!=0}">${annualTravelQuoteBean.totalChildTraveller} <fmt:message key="annual.quote.care.child" bundle="${msg}" /><br></c:if>
	                                    </h3>
	                                </div>
	                                <div class="clearfix"></div>
								</div>


								<span class="text-grey" id="loadingUpdate" style="display:none;"><fmt:message key="annual.quote.care.updating" bundle="${msg}" /></span>


                    <input type="hidden" name="totalPersonalTraveller" id="txtTravellersInline" data-min="1" data-max="15" value="${corrAnnualTravelQuote.totalPersonalTraveller}"/>
					<input type="hidden" name="totalAdultTraveller" id="txtAdultsInline" data-min="1" data-max="1" value="${corrAnnualTravelQuote.totalAdultTraveller}"/>
                    <input type="hidden" name="totalOtherTraveller" id="txtOtherInline" data-min="1" data-max="13" value="${corrAnnualTravelQuote.totalChildTraveller}"/>



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
								<div class="input-group" id="inputPromo" style="display:inital;width:100%;padding-left: 20px;padding-right: 20px;">
									<input type="text" id="promoCode" name="promoCode" class="form-control <c:if test="${!(referralCode != null && referralCode != '')}">bmg_custom_placeholder</c:if>" style="display:inline-block;width:70%;padding: 0px;"
									    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');"
									    onblur="placeholderOnBlur(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');"
									    <c:choose>
										    <c:when test="${referralCode != null && referralCode != ''}">
										        value="${referralCode }"
										    </c:when>
										    <c:otherwise>
	                                            value="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />"
	                                        </c:otherwise>
									    </c:choose>
									    autocomplete='off'>
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onclick="applyTravelPromoCode()"><fmt:message key="travel.action.apply" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
					            <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><fmt:message key="annual.quote.care.getpromotioncode" bundle="${msg}" /></i></a>
							</div>
							<div class="checkbox" style="margin-top: 20px; font-size: 14px;">
                                <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo" /> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" height="12" /> <fmt:message key="club.membership.confirm" bundle="${msg}" /></a></label>
                            </div>
                            <span class="text-red" id="errClubMemberID"></span>
                            <div class="form-group" style="margin-top: 0; margin-bottom: 20; display: none;">
                                <div class="input-group" style="display:inital; width:100%;">
                                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder" style="display:inline-block;width:100%;" onfocus="placeholderOnFocus(this,'<fmt:message key="club.membership.number" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="club.membership.number" bundle="${msg}" />');" value="<fmt:message key="club.membership.number" bundle="${msg}" />" />
                                </div>
                            </div>
							</div>
						</div>
						<div class="col-md-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.subtotal" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;">0</h3>
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
		                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 EN','USD');perventRedirect=false;submitPlan();">
		                                    <fmt:message key="annual.button.next" bundle="${msg}" /></button>
		                            </c:when>
		                            <c:otherwise>
		                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','<%=travelQuote.getToalDue()%>','','Regis_Travel_Step1 ZH','USD');perventRedirect=false;submitPlan();">
		                                    <fmt:message key="annual.button.next" bundle="${msg}" /></button>
		                            </c:otherwise>
	                            </c:choose>

                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-14"><span class="text-red errDue"></span></div>
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
			<fmt:message key="annual.quote.disclaimer1" bundle="${msg}" />
				<br>
				<fmt:message key="annual.quote.disclaimer2" bundle="${msg}" />
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

<!-- The Club Membership popup -->
<div class="modal fade bs-theclub-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class="login-form">
                <div style="overflow: hidden;"><a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
                    <span aria-hidden="true" style="font-size:30px;">×</span>
                    </a>
                </div>
                <div class="form-container">
                    <div class="row">
                        <div class="col-xs-12">
                            <p><fmt:message key="annualtravel.club.membership.pop.up" bundle="${msg}" /><%-- <fmt:message key="partner.the.club.3x.period" bundle="${msg}" /> --%></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <p><a href="<fmt:message key="theclub.register.link" bundle="${msg}" />" target="_blank"><fmt:message key="club.membership.join" bundle="${msg}" /></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ The Club Membership popup -->

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
        $('#the-club-member-toggle').on('change', function() {
            if ($(this).is(':checked')) {
                $('#theClubMembershipNo').closest('.form-group').show();
            } else {
                $('#theClubMembershipNo').closest('.form-group').hide();
            }
        }).change();
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
		$('#seletedplanname').html('<fmt:message key="travel.summary.plan" bundle="${msg}" /> '+planName);
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
        	console.log($("#sendmailofpromocode form").serialize())
            $.ajax({
                type : "POST",
                url : "<%=request.getContextPath()%>/ajax/annualTravel/sendEmail/send",
                data : $("#sendmailofpromocode form").serialize(),
                async : false,
                success : function(data) {
                    if (data == 'success') {
                        $('.proSuccess').removeClass('hide').html(getBundle(getBundleLanguage, "system.promotion.success.message"));
                    } else {
                    	console.log(data)
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
