<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


<script type='text/javascript'>
var promoData = '';
var promoCodePlaceholder="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />";

$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
function prepareOverseaPlan(form){
	var result = false;
	var method = "<%=request.getContextPath()%>/ajax/oversea/prepareOverseaQuote";
	$.ajax({
		type : "POST",
		url : method,
		async : false,
		success : function(data) {
			if (data == "success") {
				form.action = "<%=request.getContextPath()%>/${language}/oversea-insurance/quote";
				result = true;
			} else {
				console.log(data);
				result = false;
			}
		}
	});
	return result;
}

function changeRegion(region){
    /*
    $('#amountdue').html('0');
    $('#subtotal').html('0');
    $('#plansummary').html('0');
    $('#discountAmt').html('0');
    */
    if(region=='region0'){
        $('#region0').css("display","block");
        $('#region1').css("display","none");
        $('#region-btn-0').addClass("region-box-active");
        $('#region-btn-0').removeClass("region-box-inactive");
        $('#region-btn-1').addClass("region-box-inactive");
        $('#region-btn-1').removeClass("region-box-active");
        changeColorAndPrice('box2','2','medicalWorldwideA','0.0','8000.0')
    }
    if(region=='region1'){
        $('#region0').css("display","none");
        $('#region1').css("display","block");
        $('#region-btn-0').addClass("region-box-inactive");
        $('#region-btn-0').removeClass("region-box-active");
        $('#region-btn-1').addClass("region-box-active");
        $('#region-btn-1').removeClass("region-box-inactive");
        //changeColorAndPrice('box6','6','medicalAsiaA','0.0','5500.0');
    }
}

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
            $('#' + idArray[i]).removeClass("plan-box-active");
            $('#plan-coverage-' + idArray[i]).css("display","none");
        }
	}

	var selected_price = $("#txtGrossPremium"+index).val();//$('#' + id).find('h6').text();
	selected_price = parseFloat(selected_price).toFixed(2);
	
	$('#amountdue').html(numeral(totalDue).format('0,0.00'));
	
	
	$('#subtotal').html(numeral(selected_price).format('0,0.00'));
	$('#plansummary').html(numeral(selected_price).format('0,0.00'));
	$('#seletedplanname').html(planName);
	$('#inputseletedplanname').val(planName);
	$('#selectPlanPremium').val(parseFloat(selected_price).toFixed(2));
	
	$('#' + id).addClass("plan-box-active");
    
    $('#plan-coverage-' + id).css("display","block");

	$('#discountAmt').html(numeral(discountAmt).format('0,0.00'));
	
	document.getElementById("selectedAmountDue").value = parseFloat(totalDue.trim()).toFixed(2);
	document.getElementById("selectedDiscountAmt").value = parseFloat(discountAmt.trim()).toFixed(2);
	$('#txtDiscountAmount').val(numeral(discountAmt.trim()).format('0,0.00'));
	document.getElementById("txtgrossPremiumAmt").value = parseFloat(selected_price.trim()).toFixed(2);
	
	if(promoData != '')
		setValue(promoData);
	
}

function submitPlan(){
	$('#loading-overlay').modal({backdrop: 'static',keyboard: false});
	
	setTimeout(function(){
		//if(chkDueAmount() && chkClubMember()){
		if(chkDueAmount()){
			$("#frmTravelPlan").submit();
		}else{
			$('#loading-overlay').modal('hide');
		}
	}, 500);
}

function subForm(form, formId) {
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/ajax/oversea/prepareOverseaDetails',
		data : $(formId).serialize(),
		async : false,
		success : function(data) {
			if (data == "success") {
				form.action = '${pageContext.request.contextPath}/${language}/oversea-insurance/details';
				result = true;
			} else {
				console.log(data);
				$(".errDue").html("api is Wrong");
				result = false;
			}
		}
	});
	$('#loading-overlay').modal('hide');
	return result;
}
var promoCodeInsertFlag = true;
function applyOverseaPromoCode() {
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
                url : '<%=request.getContextPath()%>/ajax/oversea/applyOverseaPromoCode',
                data : $('#frmTravelPlan input').serialize(),
                success : function(data) {
                	$('#loading-overlay').modal('hide');
                    promoCodeInsertFlag = true;
                    
                    var json = JSON.parse(data);
                    promoData = json;
                   
                    //setValue(ccc);
                }

            });
        }else{
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
			$('.actualPriceA').removeClass('hide');
			$('.actualPriceA del').html(numeral(result["priceInfoA"].grossPremium).format('0,0.00'));
		}
		/*$('.totalPriceA').html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));*/
		$('.totalPriceA').html(numeral(result["priceInfoA"].totalDue).format('0,0.00'));
		
		if(result["priceInfoB"].totalDue!=result["priceInfoB"].grossPremium){
            //$('.actualPriceB del').html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
            $('.actualPriceB').removeClass('hide');
			$('.actualPriceB del').html(numeral(result["priceInfoB"].grossPremium).format('0,0.00'));
        }
		//$('.totalPriceB').html(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
		$('.totalPriceB').html(numeral(result["priceInfoB"].totalDue).format('0,0.00'));
	}
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

function chkDueAmount() {		
	$(".errDue").html('');
	var flag = false;
	var amount = document.getElementById("amountdue").innerHTML;

	if (amount == "0") {
		$(".errDue").html("Please select a plan.") ;
		flag = false;
	} else {
		if ($("#promoCode").val()==promoCodePlaceholder) {
            $("#promoCode").val('');
        }
		flag = true;
	}

	return flag;
}

$(document).ready(function() {                     
	$('[data-toggle="tooltip"]').tooltip();
	changeColorAndPrice('box2','2','medicalWorldwideA','0.0','8000.0');
});

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

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition hidden-lg hidden-md"></div></div>
        <div class="product_header_path_item active"><key id='Overseas.PlanOptions.progressbar.item1'>Plan options</key></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item2'>Application</key><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item3'>Payment</key><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item4'>Confirmation</key></div>
    </div>
</section>
<section>
	<div id="cn" class="container">
		<div class="row">
			<form id="frmTravelPlan" name="frmTravelPlan" method="post" onsubmit="return subForm(this, 'frmTravelPlan');" >
				<ol class="breadcrumb pad-none">
					<li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer1'>Home</key></a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer2'>Protect</key></a><i class="fa fa-chevron-right"></i></li>
					<li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer3'>StudyCare Insurance</key></a></li>
					<i class="fa fa-chevron-right"></i>
					<li class="active "><i class="fa fa-caret-right"></i><key id='Overseas.Landing.Breadcrumb.step1'>Plan Options</key></li>
				</ol>
				<div id="quote-wrap" class="container pad-none bdr gray-bg3">
					<div class="col-lg-8 col-xs-12 col-sm-12 col-md-8 pad-none white-bg1" id="oversea-plan-quote-select-region-container">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose"><key id='Overseas.PlanOptions.Region'>Select a region</key></h2>
						<div style="margin-bottom: 40px;">
                            <div class="pull-left pad-none region-box col-lg-6 col-xs-6 col-sm-6 col-md-6" >
	                                <div id="region-btn-0" type="button" class="btn-block bdr-curve btn region-box-btn region-box-active" onClick="changeRegion('region0')">
                                    Worldwide
	                                </div>
							</div>
                            <div class="pull-right pad-none region-box col-lg-6 col-xs-6 col-sm-6 col-md-6" style="padding:0 0 0 2%!important">
	                                <div id="region-btn-1" type="button" class="btn-block bdr-curve btn region-box-btn" data-toggle="modal" data-target="#myModal" onClick="changeRegion('region1')">
                                    Asia Only
	                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
						



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title region-asia-title" id="myModalLabel">Asia Countries</h4>
      </div>
      <div class="modal-body">
        <div class="row plan-display-desktop-only">
          <div class="col-lg-3 col-xs-3 col-sm-3 col-md-3">
Abu Dhabi<br>
Dubai<br>
India<br>
Indonesia<br>
Iran<br>
Japan<br>
Korea<br>
Lao, P.D.R.
</div>
          <div class="col-lg-5 col-xs-5 col-sm-5 col-md-5">
Macau<br>
Malaysia<br>
Myanmar<br>
Nepal<br>
North Korea<br>
Pakistan<br>
People Republic of China
</div>
          <div class="col-lg-3 col-xs-3 col-sm-3 col-md-3">
Philippines<br>
Singapore<br>
Sri Lanka<br>
Sudan<br>
Taiwan<br>
Thailand<br>
Vietnam
</div>
        </div>

        <div class="row plan-display-mobile-only">
          <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6">
Abu Dhabi<br>
Dubai<br>
India<br>
Indonesia<br>
Iran<br>
Japan<br>
Korea<br>
Lao, P.D.R.<br>
Macau<br>
Malaysia<br>
Myanmar<br>
</div>
          <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6">
Nepal<br>
North Korea<br>
Pakistan<br>
People Republic of China<br>
Philippines<br>
Singapore<br>
Sri Lanka<br>
Sudan<br>
Taiwan<br>
Thailand<br>
Vietnam
</div>
          <div class="col-lg-3 col-md-3">
</div>
        </div>
      </div>
      <div class="modal-footer" style="text-align:center">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
      </div>
    </div>
  </div>
</div>	
<!-- / Modal -->

						
						
						<h2 class="h2-3-choose hidden-sm hidden-xs">
						<fmt:message key="Overseas.PlanOptions.Plans.table1.col1.header" bundle="${msg}" />
						</h2>
						<c:forEach begin="0" end="4" var="h" step="4">
							<div id="region${h==4?1:0}" <c:if test="${h==4}">class="region-box-hidden"</c:if>>
								<div class="plan-box-l plan-box-title oversea_productbox_title plan-display-desktop-only">
									<div class="" style="">                           
										<h2>Plans</h2>
									</div>
									<div class="clearfix"></div>
								</div>
	
								<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only">
                                    <div class="" style="">                           
										<h2><fmt:message key="Overseas.PlanOptions.Plans.table1.col2.header" bundle="${msg}" /></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only plan-flow-r-mobile-only">
                                    <div class="" style="">                           
										<h2><fmt:message key="Overseas.PlanOptions.Plans.table1.col3.header" bundle="${msg}" /></h2>
									</div>
									<div class="clearfix"></div>
								</div>
							
								
								<c:forEach begin="${h }" end="${h+2 }" var="i" step="2">
									<c:set var="j" value="${h==4 ? (i==4 ? 0 : 4) : i}" />
								<div class="oversea-insurance-quote-plan-wraper">
									<div class="plan-box-l oversea_productbox_subtitle<c:if test="${h == 0}"> plan-flow-l-mobile-only</c:if>">
                                    <div class="" style="">                           
											<h2>Region</h2>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="plan-box-s travelproductbox oversea_productbox<c:if test="${h == 0}"> plan-flow-l-mobile-only pad-right-des</c:if>" id="box${i}" onClick="changeColorAndPrice('box${i}','${i}','${quoteDetails.planName[j] }','${quoteDetails.discountAmount[j] }','${quoteDetails.toalDue[j] }')">
										<div class="" style="">
											<h3 class="plan-display-mobile-only"><fmt:message key="Overseas.PlanOptions.Plans.table1.col2.header" bundle="${msg}" /></h3>
											<h2>
											<key id='Overseas.PlanOptions.Plans.table1.col2row2'>HK$ ${quoteDetails.totalNetPremium[j] }</key>
											</h2>
										</div>
										<div class="clearfix"></div>
									</div>
		                            <input type="hidden" name="txtTotalDue" id="txtTotalDue${i}" value="${quoteDetails.toalDue[j] }">
		                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i}" value="${quoteDetails.grossPremium[j] }">
		                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i}" value="${quoteDetails.discountAmount[j] }">
								
									<div class="plan-box-s travelproductbox oversea_productbox plan-flow-r-mobile-only pad-left-des" id="box${i+1}" onClick="changeColorAndPrice('box${i+1}','${i+1}','${quoteDetails.planName[j+1] }','${quoteDetails.discountAmount[j+1] }','${quoteDetails.toalDue[j+1] }')">
										<div class="" style="">
											<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan B</key></h3>
											<h2><key id='Overseas.PlanOptions.Plans.table1.col3row2'>HK$ ${quoteDetails.totalNetPremium[j+1] }</key></h2>
										</div>
										<div class="clearfix"></div>
									</div>
		                            <input type="hidden" name="txtTotalDue" id="txtTotalDue${i+1}" value="${quoteDetails.toalDue[j+1] }">
		                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i+1}" value="${quoteDetails.grossPremium[j+1] }">
		                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i+1}" value="${quoteDetails.discountAmount[j+1] }">
								</div>
								</c:forEach>
								<!-- <div class="plan-box-l oversea_productbox_subtitle plan-flow-r-mobile-only">
									<div class="" style="margin-bottom: 20px;">                           
										<h2><key id='Overseas.PlanOptions.Plans.table1.col1row3'>Comprehensive medical plan</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="plan-box-s travelproductbox oversea_productbox plan-flow-l-mobile-only" id="box2" onClick="changeColorAndPrice('box2','2','Plan A Comprehensive','0.0','8000.0')">
									<div class="" style="margin-bottom: 20px;">       
										<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan A</key></h3>
										<h2><key id='Overseas.PlanOptions.Plans.table1.col2row3'>HK$ 8,000</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
	                            <input type="hidden" name="txtTotalDue" id="txtTotalDue2" value="8000.0"> <input type="hidden" name="txtGrossPremium" id="txtGrossPremium2" value="8000.0"> <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount2" value="0.0"> <input type="hidden" name="referralCode" id="referralCode2" value=""> <input type="hidden" name="referralName" id="referralName2" value="">
							
								<div class="plan-box-s travelproductbox oversea_productbox plan-flow-r-mobile-only" id="box3" onClick="changeColorAndPrice('box3','3','Plan B Comprehensive','0.0','5000.0')">
									<div class="" style="margin-bottom: 20px;">             
										<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan B</key></h3>
										<h2><key id='Overseas.PlanOptions.Plans.table1.col3row3'>HK$ 5,000</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
	                            <input type="hidden" name="txtTotalDue" id="txtTotalDue3" value="5000.0"> <input type="hidden" name="txtGrossPremium" id="txtGrossPremium3" value="5000.0"> <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount3" value="0.0"> <input type="hidden" name="referralCode" id="referralCode3" value=""> <input type="hidden" name="referralName" id="referralName3" value=""> -->
							</div>
						</c:forEach>
						<!-- /Region -->
						
						<!-- Region -->
						<%-- <div id="region1" class="region-box-hidden">
							<div class="plan-box-l plan-box-title oversea_productbox_title plan-display-desktop-only">
								<div class="" style="margin-bottom: 20px;">                           
									<h2>Plans</h2>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only">
								<div class="" style="margin-bottom: 20px;">                           
									<h2><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan A</key></h2>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only">
								<div class="" style="margin-bottom: 20px;">                           
									<h2><key id='Overseas.PlanOptions.Plans.table1.col3.header'>Plan B</key></h2>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<c:forEach begin="4" end="7" var="i" step="2">
								<c:set var="j" value="${i==4?0:4}" />
								<div class="plan-box-l oversea_productbox_subtitle">
									<div class="" style="margin-bottom: 20px;">                           
										<h2><key id='Overseas.PlanOptions.Plans.table1.col1row2.ver2'>Standard plan (Worldwide)</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="plan-box-s travelproductbox oversea_productbox" id="box${i}" onClick="changeColorAndPrice('box${i}','${i}','${quoteDetails.planName[j] }','${quoteDetails.discountAmount[j] }','${quoteDetails.toalDue[j] }')">
									<div class="" style="margin-bottom: 20px;">
										<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan A</key></h3>
										<h2><key id='Overseas.PlanOptions.Plans.table1.col2row2'>HK$ ${quoteDetails.totalNetPremium[j] }</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<input type="hidden" name="txtTotalDue" id="txtTotalDue${i}" value="${quoteDetails.toalDue[j] }">
	                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i}" value="${quoteDetails.grossPremium[j] }">
	                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i}" value="${quoteDetails.discountAmount[j] }">
						
								<div class="plan-box-s travelproductbox oversea_productbox plan-flow-r-mobile-only pad-left-des" id="box${i+1}" onClick="changeColorAndPrice('box${i+1}','${i+1}','${quoteDetails.planName[j+1] }','${quoteDetails.discountAmount[j+1] }','${quoteDetails.toalDue[j+1] }')">
									<div class="" style="margin-bottom: 20px;">
										<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col3.header'>Plan B</key></h3>
		
										<h2><key id='Overseas.PlanOptions.Plans.table1.col3row2'>HK$ ${quoteDetails.totalNetPremium[j+1] }</key></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<input type="hidden" name="txtTotalDue" id="txtTotalDue${i+1}" value="${quoteDetails.toalDue[j+1] }">
	                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i+1}" value="${quoteDetails.grossPremium[j+1] }">
	                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i+1}" value="${quoteDetails.discountAmount[j+1] }">
							</c:forEach> --%>
		
						
							<!-- <div class="plan-box-l oversea_productbox_subtitle">
								<div class="" style="margin-bottom: 20px;">                           
									<h2><key id='Overseas.PlanOptions.Plans.table1.col1row3'>Comprehensive medical plan</key></h2>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="plan-box-s travelproductbox oversea_productbox" id="box6" onClick="changeColorAndPrice('box6','6','Plan A Comprehensive','0.0','5500.0')">
								<div class="" style="margin-bottom: 20px;">
									<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col2.header'>Plan A</key></h3>
									<h2><key id='Overseas.PlanOptions.Plans.table1.col2row3'>HK$ 5,500</key></h2>
								</div>
								<div class="clearfix"></div>
							</div>

                        <input type="hidden" name="txtTotalDue" id="txtTotalDue2" value="5500.0"> <input type="hidden" name="txtGrossPremium" id="txtGrossPremium6" value="5500.0"> <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount6" value="0.0"> <input type="hidden" name="referralCode" id="referralCode6" value=""> <input type="hidden" name="referralName" id="referralName6" value="">
						

							<div class="plan-box-s travelproductbox oversea_productbox plan-flow-r-mobile-only pad-left-des" id="box7" onClick="changeColorAndPrice('box7','7','Plan B Basic','0.0','3500.0')">

							<div class="" style="margin-bottom: 20px;">
									<h3 class="plan-display-mobile-only"><key id='Overseas.PlanOptions.Plans.table1.col3.header'>Plan B</key></h3>
									<h2><key id='Overseas.PlanOptions.Plans.table1.col3row3'>HK$ 3,500</key></h2>
								</div>
								<div class="clearfix"></div>
							</div>

                        <input type="hidden" name="txtTotalDue" id="txtTotalDue7" value="3500.0"> <input type="hidden" name="txtGrossPremium" id="txtGrossPremium7" value="3500.0"> <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount7" value="0.0"> <input type="hidden" name="referralCode" id="referralCode7" value=""> <input type="hidden" name="referralName" id="referralName7" value=""> -->
						
						<!-- </div> -->
						
						<!-- /Region -->
						
						
						<div class="clearfix"></div>
						<!--Full Coverage-->
                        
                        <div class="planDetails" id="plan-coverage-box0" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit1.Amount" bundle="${msg}" />
							</div>
                            <div class="plan-coverage-box-l">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit2" bundle="${msg}" />
							</div>
                            <div class="plan-coverage-box-r">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link"  onclick="coverageToogle('summary-of-coverage');">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit.textlink" bundle="${msg}" />
							</div>
                        </div>
                        
                        
                        <div class="planDetails" id="plan-coverage-box1" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                            <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit1.Amount'>HK$40,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit2'>Personal Accident </key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit2.Amount'>Up to HK$500,000</key>
                            </div>
                            <div class="sub-link"  onclick="coverageToogle('summary-of-coverage');">
<key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit.textlink'>Coverage item 3-11 (refer to coverage table)</key>
							</div>
                        </div>
                        
                        
                        
                        <div class="planDetails" id="plan-coverage-box2" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit1'>Medical Expenses benefits</key>
                            </div>
                            <div class="plan-coverage-box-r">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit1.Amount'>HK$1,000,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit2'>Top up inpatient medical expenses</key>
                            </div>
                            <div class="plan-coverage-box-r">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit2.Amount'>Up to HK$2,000,000</key>
                            </div>
                            <div class="sub-link">
                                <a data-toggle="tooltip" title="Worldwide Comprehensive medical plan A Benefit 2"><img src="/fwdhk/resources/images/annual_travel/i-icon.png"></a>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        <div class="planDetails" id="plan-coverage-box3" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit1'>Medical Expenses benefits</key>
                            </div>
                            <div class="plan-coverage-box-r">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit1.Amount'>HK$500,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit2'>Personal Accident</key>
                            </div>
                            <div class="plan-coverage-box-r">
								<key id='Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit2.Amount'>Up to HK$500,000</key>
                            </div>
                            <div class="sub-link">
                                <a data-toggle="tooltip" title="Full coverage (refer to coverage table)"><img src="/fwdhk/resources/images/annual_travel/i-icon.png"></a>
							</div>
                        </div>
                        
                        
                        <div class="planDetails" id="plan-coverage-box4" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanA.Benefit1'>Worldwide Emergency Assistance Service</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanA.Benefit1.Amount'>HK$40,000</key>
							</div>
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanA.Benefit2'>Personal Accident</key>
							</div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanA.Benefit2.Amount'>Up to HK$1,000,000</key>
                            </div>
                            <div class="sub-link"  onclick="coverageToogle('summary-of-coverage');;">
<key id='Overseas.PlanOptions.WorldwideStandardplanA.Benefit.textlink'>Coverage item 3-11 (refer to coverage table)</key>
							</div>
                        </div>
                        
                        
                        <div class="planDetails" id="plan-coverage-box5" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit1'>Worldwide Emergency Assistance Service</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit1.Amount'>HK$40,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit2'>Personal Accident </key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit2.Amount'>Up to HK$500,000</key>
                            </div>
                            <div class="sub-link"  onclick="coverageToogle('summary-of-coverage');;">
<key id='Overseas.PlanOptions.WorldwideStandardplanB.Benefit.textlink'>Coverage item 3-11 (refer to coverage table)</key>
							</div>
                        </div>
                        
                        
                        
                        <div class="planDetails" id="plan-coverage-box6" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit1'>Medical Expenses benefits</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit1.Amount'>HK$1,000,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit2'>Top up inpatient medical expenses</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit2.Amount'>Up to HK$2,000,000</key>
                            </div>
                            <div class="sub-link"  onclick="coverageToogle('summary-of-coverage');;">
<key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit.textlink'>Full coverage (refer to coverage table)</key>
							</div>
                        </div>
                        
                        
                        
                        
                        
                        
                        <div class="planDetails" id="plan-coverage-box7" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit1'>Medical Expenses benefits</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit1.Amount'>HK$500,000</key>
                            </div>
                            <div class="plan-coverage-box-l">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2'>Personal Accident</key>
                            </div>
                            <div class="plan-coverage-box-r">
                                <key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2.Amount'>Up to HK$500,000</key>
                            </div>
                            <div class="sub-link" onclick="coverageToogle('summary-of-coverage');">
<key id='Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2.Tooltip'><img src="/fwdhk/resources/images/annual_travel/i-icon.png"></key>
							</div>
                        </div>

<!--
						<div class="annual_travel_tips hidden-xs hidden-sm">
						  <table>
						      <tbody><tr>
						          <td><img src="resources/images/annual_travel/i-icon.png" alt=""></td>
						          <td>If travel more than 3 times a year, you should consider <strong>Annual Travel</strong> year round coverage with better price.</td>
						      </tr>
						  </tbody></table>
                        </div>
-->                    
                    </div>
					<div class="workingholiday-plan-mobile-nomargin form-wrap">
                        <div class="fwdpanel product_plan_panel_container">
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
									<key id='Overseas.PlanOptions.Producthights.title'>Product Highlight</key>
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p><key id='Overseas.PlanOptions.Producthighlights.copy'>Overseas StudyCare provides you or your children with comprehensive protection while studying in foreign countries. Included coverage for Medical Expenses, Worldwide Emergency Services, Personal Accident, Major Burns, Personal Liability, Cancellation and Curtailment of Trip and Education Fund.</key></p>
                                        <br>
                                        <p></p>
											<ul class="bullets">
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item1'>Top-up In-Patient Medical Expenses providing extra benefits on top of your other medical policy, up to HK$2,000,000</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item2'>Education Fund to provide for unpaid Tuition Fees if tragedy strikes your family</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item3'>Compassionate Visit and Death Compensation for a kidnapping incident.</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item4'>Cover for leisure and amateur sports activities during your study including winter sports, bungee jumping, hiking, rock climbing, horse riding, scuba diving and other water sports</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item5'>Cover for personal accident and medical related claims caused by an act of terrorism</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item6'>Covers your Overseas Study from secondary school to life-long education</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item7'>Worldwide cover Medical and Personal Accident benefits.</key>
                                                </li>
                                                <li>
                                                    <key id='Overseas.PlanOptions.Producthighlights.copy.item8'>24 hours Worldwide Emergency Assistance Services</key>
                                                </li>												
                                            </ul>
                                        <p></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
									<key id='Overseas.PlanOptions.Productcoverage.title'>Summary of Coverage</key>
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;"  id="summary-of-coverage">
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Medical Expenses
                                        <i class="fa fa-plus"></i>
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
                                                      <td data-title="Benefits">a) Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from a sickness or accidental injury. </td>
                                                      <td data-title="Plan A">$1,000,000</td>
                                                      <td data-title="Plan B">$500,000</td>
                                                  </tr>
                                                  <tr>
                                                      <td data-title="Benefits">b) Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Student’s return to the country of residence up to HK$100,000 (Including Chinese medical practitioner in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200). </td>
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
                                        Top up In-Patient Medical Expenses
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Additional medical insurance cover for inpatient medical expenses, where you have another medical benefits policy cover the same area, up to 2 times the cover provided under that other policy, or HK$2,000,000 (whichever is the lesser) </td>
                                                   <td data-title="Plan A">Up to $2,000,000</td>
                                                   <td data-title="Plan B">N/A</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Worldwide Emergency Assistance Services
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;" id="WorldwideEmergencyAssistanceServices">
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
                                                   <td data-title="Benefits">a) Remittance of Hospital Admission Guarantee Deposits - for hospital admittance fees on behalf of the Insured Student.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$40,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Emergency Medical Evacuation and Repatriation - to the nearest facility capable of providing adequate medical care and to repatriate back to Hong Kong if the physician determines that it is necessary.</td>
                                                   <td data-title="Plan A">Included</td>
                                                   <td data-title="Plan B">Included</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">c) Repatriation of Mortal Remains - transportation charges for repatriation of the mortal remains to Hong Kong.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">d) Compassionate Visit and Hotel Accommodation - up to 2 immediate family members, includes travelling cost to join the Insured Student  where the Insured Student is confined in hospital for more than 3 days. (Accommodations HK$1,200 per night up to 5 consecutive days)</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">e) Convalescence Expenses - ISOS will arrange additional hotel expenses incurred in relation to an incident which requires medical evacuation and repatriation. (Accommodations HK$1,200 per night up to 5 consecutive days)</td>
                                                   <td data-title="Plan A">$6,000</td>
                                                   <td data-title="Plan B">$6,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">f) Unexpected Return in the Event of the Death of a Close Relative - return economy class airfare for unexpected return to Hong Kong following the death of a close relative.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">g) Additional Costs of Travel – Intl.SOS will arrange for an economy class airfare for the Insured Student to return Hong Kong  due to a serious medical condition.</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">$15,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">h) Other Assistance - including telephone medical advice, emergency travel service assistance or legal referral.</td>
                                                   <td data-title="Plan A">included</td>
                                                   <td data-title="Plan B">included</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">Worldwide Emergency Services are arranged by International SOS Assistance (HK) Limited.</td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">a) Personal Accident - Accidental death/ permanent total disablement/total and permanent loss of sight in one or both eyes/loss by severance or permanent and total loss of use of one or more limbs.</td>
                                                   <td data-title="Plan A">$500,000</td>
                                                   <td data-title="Plan B">$250,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Limit for Death benefit for children under 18 years old)</td>
                                                   <td data-title="Plan A">$250,000</td>
                                                   <td data-title="Plan B">$250,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Double Indemnity – Accidental Death Benefits will be doubled up for:
													   <ol>
															<li>- a fare paying passenger on a public conveyance which was involved in an accident</li>
															<li>- an innocent bystander in a gun battle between the police and another person(s)</li>
															<li>- a fire within a residential building</li>
													   </ol>
												   </td>
                                                   <td data-title="Plan A">$1,000,000</td>
                                                   <td data-title="Plan B">$500,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Limit for Death benefit for children under 18 years old)</td>
                                                   <td data-title="Plan A">$500,000</td>
                                                   <td data-title="Plan B">$500,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">c) Major Burns - Suffering of Third Degree Burns with burnt areas equal to or greater than 5% of head or 10% of total body surface area.</td>
                                                   <td data-title="Plan A">$200,000</td>
                                                   <td data-title="Plan B">$100,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Apply either a or b compensation only)</td>
                                                   <td data-title="Plan A"></td>
                                                   <td data-title="Plan B"></td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Reimbursement of irrecoverable prepaid study costs and airfares in the event of death, serious sickness or injury of the Insured Student, immediate family members of the Insured Student, witness summons, jury service, compulsory quarantine of the Insured Student, natural disaster, unanticipated outbreak of epidemic diseases at destination; industrial action involving a Public Conveyance, riot/civil commotion at the destination, serious damage to the Insured Student's principal home in Hong Kong arising from fire or flooding within 10 days from the departure date or Black Outbound Travel Alert for the destination in effect 7 days before the departure date.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">N/A</td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Irrecoverable unused portion of prepaid transport or accommodation charges, pre-paid tuition fees and additional public transportation expenses incurred to return to Hong Kong as a direct result of death, serious injury/sickness of the Insured Student or immediate family member , or of the hijack of transport arranged by a travel agency, adverse weather conditions, natural disaster, or unanticipated outbreak of epidemic diseases; industrial action involving a Public Conveyance, riot/civil commotion at the destination that prevents the Insured Student from continuing the journey or Black Outbound Travel Alert for the destination is in effect during the study.</td>
                                                   <td data-title="Plan A">$30,000</td>
                                                   <td data-title="Plan B">N/A</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Kidnapping
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">a) Compassionate Visit and Hotel Accommodation – Provided to up to 2 immediate family members, including travelling costs to the location of the educational institution where the Insured Student was kidnapped. (Accommodations up to HK$1,200 per person per night for 5 consecutive days)</td>
                                                   <td data-title="Plan A">$40,000</td>
                                                   <td data-title="Plan B">N/A</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Compassionate Death Benefit – compensation for the Accidental Death of Insured Student from injury inflicted during the kidnapping incident. </td>
                                                   <td data-title="Plan A">$250,000</td>
                                                   <td data-title="Plan B">N/A</td>
                                               </tr>											   
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        Education Fund
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Payment of unpaid tuition fees in the event of the death of the parent or legal guardian of the Insured Student, where the Insured Student is an unmarried full time student under 23 years old.</td>
                                                   <td data-title="Plan A">$350,000</td>
                                                   <td data-title="Plan B">$200,000</td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">a) Additional Travel Cost - Public transportation expenses necessarily incurred as a direct consequence of airline or other public transportation being delayed due to serious weather condition, industrial action, hijack, mechanical derangement, but only if the Insured Student has to re-route the trip as the result of the cancellation of the transportation previously confirmed.</td>
                                                   <td data-title="Plan A">$10,000</td>
                                                   <td data-title="Plan B">$2,500</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Cash Allowance - In the event of travel delay exceeding 6 hours,  the Insured Student will be indemnified at HK$300 for each full 6-hour period delay. </td>
                                                   <td data-title="Plan A">$2,500</td>
                                                   <td data-title="Plan B">$600</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Select either a or b for compensation only.) </td>
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
                                        Baggage
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Loss, physical breakage or damage directly resulting from accident, theft, burglary, or mishandling by carriers to the Insured Student’s baggage or personal property</td>
                                                   <td data-title="Plan A">$20,000</td>
                                                   <td data-title="Plan B">$10,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">(Personal property does not include mobile phones, pagers, handheld portable telecommunication equipment, or other computer equipment, except lap top computers)</td>
                                                   <td data-title="Plan A">$20,000</td>
                                                   <td data-title="Plan B">$10,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">a) Limit for each item, pair or set</td>
                                                   <td data-title="Plan A">$3,000</td>
                                                   <td data-title="Plan B">$3,000</td>
                                               </tr>
                                               <tr>
                                                   <td data-title="Benefits">b) Limit for lap-top computer</td>
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
                                        Personal Liability
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Indemnity against third party legal liability arising as a result of accidental injury or loss or damage to third party's property during the Period of Insurance. (This benefit does not apply to liability arising from the use or hire of motor vehicle.)</td>
                                                   <td data-title="Plan A">$1,500,000</td>
                                                   <td data-title="Plan B">$750,000</td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">The loss of or damage to the contents or personal effects of the Insured Person’s principal home as a result of burglary accompanied by forcible and violent entry to or exit from the premise whilst the home is unoccupied during the period of travel. </td>
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
                                        <i class="fa fa-plus"></i>
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
                                                   <td data-title="Benefits">Indemnity against third party legal liability arising from a result of accidental injury. Loss or damage to third party’s property during the Period of Insurance. (This benefit does not apply to liability arising from the use or hire of motor vehicle.) </td>
                                                   <td data-title="Plan A">$3,000,000</td>
                                                   <td data-title="Plan B">$1,500,000</td>
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
                                    <key id='Overseas.PlanOptions.importantnotes.title'>Important notes</key>
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
										<key id='Overseas.PlanOptions.importantnotes.copy'>
                                        <p>
                                            For the insured person<br>
                                            </p><ul class="bullets">
                                                <li>The insured person must be the holder of a valid HKID through out the policy coverage period</li>
                                                <li>This policy excluded any accidents whilst engaging in sports or games in a professional capacity or where an insured person would or could earn income or remuneration from engaging in such sport or game; racing (other than on foot). </li>
                                                <li>This policy does not cover the insured person being a crew member or an operator of any air carrier; accidents whilst engaging in any kind of manual labour work; engaging in offshore activities including commercial diving, oil rigging, mining or aerial photography; handling of explosives, performing as an actor/actress, being a site worker, tour guide or tour escort; or being a member of an armed forces service</li>
                                            </ul>
                                        <p></p>
                                        <p>
                                            About the journey<br>
                                            </p><ul class="bullets">
                                                <li>Each journey commences when the insured person completes the immigration departure clearance procedure from Hong Kong and ends when the insured person completes the immigration arrival clearance procedure for returning to Hong Kong after such Journey.</li>
                                                <li>The policy will only cover journeys taken within the period of insurance that are less than 90 days duration.</li>
                                            </ul>
                                        <p></p>
                                        <p>
                                            General Conditions<br>
                                            </p><ul class="bullets">
                                                <li>In the event that an insured person is covered by more than one policy issued by the Company for the same journey, the benefits payable for any claim based on the policy which provides the greatest amount of benefit.</li>
                                                <li>This policy may be cancelled by the policyholder provided no claim has been made.  In this event, the policyholder may be entitled to a partial refund of the premium paid, but subject to a minimum premium of HK$500 being retained by the Company per policy. Please see the policy provisions for the details of the partial refund.</li>
                                            </ul>
                                        <p></p>
										</key>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <key id='Overseas.PlanOptions.exclusions.title'>Major Exclusions</key>
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <key id='Overseas.PlanOptions.exlusions.copy'><ol class="">
                                            <li>War (whether declared or not), civil war, act of foreign enemies, rebellion, military or usurped power.</li>
                                            <li>Nuclear hazards.</li>
                                            <li>Acts of Terrorism (except that this exclusion does not apply to the Medical Expenses Benefit, Worldwide Emergency Assistance Services, Personal Accident Benefit, Cancellation Charge Benefit, Curtailment of Trip Benefit and Travel Delay).</li>
                                            <li>Pre-existing condition, congenital and hereditary condition.</li>
                                            <li>Suicide, attempted suicide or intentional self-inflicted bodily injuries, insanity, abortion, miscarriage, assigned complications, pregnancy, child-birth, venereal diseases, the use of alcohol or drugs other than those prescribed by a qualified registered physician, dental treatment (unless resulting from accidental bodily injury to sound and natural teeth).</li>
                                            <li>Racing (other than on foot) or any sports or games in a professional capacity or where the Insured Student would or could earn income or remuneration from engaging in such sport.</li>
                                            <li>Any activities in the air unless an Insured Student is (i) travelling as a fare paying passenger in a licensed aircraft operated by a recognised airline, or (ii) participating in such activity where the maneuver or navigation of such activity is managed and controlled by another licensed person and the provider of such activity must be authorised by the relevant local authority.</li>
                                            <li>The Insured Student being a crew member or an operator of any air carrier; engaging in offshore activities including commercial diving, oil rigging, mining or aerial photography; handling of explosives, being a site worker or rendering armed force services. This exclusion does not apply if the Insured Student was engaged in one of the above occupation as a compulsory requirement of his/her course of study.</li>
                                            <li>Losses not reported within 24 hours to the authorities (such as airlines, police) and failure to provide the report certified by the relevant authorities.</li>
                                            <li>Personal liabilities arising from use or operation of vehicles, aircraft, watercraft.</li>
											<li>Any illegal or unlawful act.</li>
                                        </ol></key>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <key id='Overseas.PlanOptions.agelimit.title'>Age Limit</key>
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
										<p><key id='Overseas.PlanOptions.agelimit.copy'>Individual – refers to the insured person aged between 18 and 70 years of age.<br>Children – refers to the insured person’s children who is/are 6 weeks to 17 years of age. <br><br>(This summary gives only an outline of the insurance cover. Please refer to the insurance policy for the precise terms and conditions.)</key></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div style="margin-bottom:20px;" id="oversea-plan-quote-download-container">
                              <h4 class="h4-4 product_landing_download_button pull-left plan-mobile-center">
                                    <i class="fa fa-download"></i> <a href="/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf" target="_blank"><key id='Overseas.PlanOptions.Brochure'>Product Brochure</key></a>
                                </h4>
                                <h4 class="h4-4 product_landing_download_button pull-left plan-mobile-center">
                                    <i class="fa fa-download"></i> <a href="/resources/policy-provisions-pdf/Overseas_StudyCare_Provisions.pdf" target="_blank"><key id='Overseas.PlanOptions.Provisions'>Policy Provisions</key></a>
                                </h4>
                                <div class="clearfix"></div>
                        </div>
						<!-- <div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span>
									<a href="#" class="fwdpanel-minimize">
									   <i class="fa fa-plus"></i> Full Coverage Details</span>
									</a>		
								</h4>
							</div>
							<div class="fwdpanel-body" style="display: none;">
								<div class="row">
									<div class="col-md-12">
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full ">
													<span><i
															class="fa fa-plus"></i> <a href="#"data-target="#details-popup-1" data-toggle="modal">Product Highlights</a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
				                                <div class="modal-dialog modal-lg">
				                                    <div class="modal-content plan-modal">
				                                        <a class="close" aria-label="Close" data-dismiss="modal">
				                                        <span aria-hidden="true" style="font-size:30px;">×</span>
				                                        </a>
				                                        <div class="fwdpanel-heading">
				                                            <h4 class="fwdpanel-title h4-4-full ">Product Highlights</h4>
				                                        </div>
				                                        <div class="fwdpanel-body">
			                                                <p>TravelCare provides you with comprehensive travel protection for leisure and business trips. Medical Expenses, Worldwide Emergency Services, Hospital Cash Allowance, Personal Accident, Major Burns, Personal Money, Baggage, Personal Liability, Travel Delay, Cancellation and Curtailment of Trip are all included. For details, please refer to the section of "Coverage" below.</p>
			                                                <br>
			                                                <p>
			                                                    <ul class="text-justify">
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
				                                    </div>
				                                 </div>
				                            </div>
											
										</div>
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full">
													<span><i
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-2" data-toggle="modal">Summary of Coverage</a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full ">Summary of Coverage</h4>
                                                        </div>
                                                        <div class="fwdpanel-body" >
			                                                <table id="summary" class="table table-bordred">
			                                                    <tbody>
			                                                        <tr>
			                                                            <td rowspan="2">Cover</td>
			                                                            <td rowspan="2">Benefits</td>
			                                                            <td colspan="2">Maximum Limit (HK$)</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>Plan A</td>
			                                                            <td>Plan B</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>1. Medical Expenses</td>
			                                                            <td>a)  Medical Expenses - the cost of qualified medical treatment, surgery and hospitalisation arising from sickness or accidental injury. <br/><br/>
			                                                                b)  Follow-up Expenses - medical, hospital and treatment expenses reasonably incurred within 90 days of the Insured Person’s return to the place of origin from overseas up to HK$100,000 (Including Chinese Bonesetting in Hong Kong up to HK$3,000 with maximum daily limit per visit HK$200 ).
			                                                            </td>
			                                                            <td>$1,000,000</td>
			                                                            <td>$500,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="2">2. Hospital or Quarantine Cash Allowance</td>
			                                                            <td>a)  Overseas Hospital - HK$500 for each complete day in hospital to meet Insured Person's extra expenses.</td>
			                                                            <td>$10,000</td>
			                                                            <td>$5,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>b)  Compulsory Quarantine - HK$500 for each complete day during the journey or 7 days upon return to Hong Kong.</td>
			                                                            <td>$10,000</td>
			                                                            <td>$5,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="9">3.  Worldwide Emergency Assistance Service</td>
			                                                            <td>a)  Emergency Medical Evacuation and Repatriation - to the nearest facility capable of providing adequate medical care and to repatriate back to Hong Kong if the physician determines that it is necessary.</td>
			                                                            <td>Fully Covered</td>
			                                                            <td>Fully Covered</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>b)  Guarantee of Hospital Admission Deposits - for hospital admittance fees on behalf of the Insured Person.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$40,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>c)  Additional Costs of Accommodation - for an Insured Person's family member or travelling companion when such costs arise from hospitalization or delay due to a serious medical condition of the Insured Person.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>d)  Compassionate Visit and Hotel Accommodation - up to 2 immediate family members, includes travelling cost to join the Insured Person who is confined in hospital for more than 3 days or dies abroad.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>e)  Return of Minor Children - reasonable additional accommodation and travelling expenses for the return of unattended Insured Person's children (aged below 18) to Hong Kong.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>f)  Repatriation of Mortal Remains - transportation charges for repatriation of the mortal remains to Hong Kong.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>g)  Unexpected Return in the Event of the Death of a Close Relative - return economy class airfare for unexpected return to Hong Kong following the death of a close relative.</td>
			                                                            <td>$40,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>h)  Other Assistance - including telephone medical advice, emergency travel service assistance or legal referral etc.</td>
			                                                            <td>included</td>
			                                                            <td>included</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>Worldwide Emergency Assistance Service is arranged by International SOS (HK) Limited.</td>
			                                                            <td></td>
			                                                            <td></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="3">4.  Personal Accident</td>
			                                                            <td>Accidental death/permanent total disablement/total and permanent loss of sight in one or both eyes/loss by severance or permanent and total loss of use of one or more limbs. (Death benefit for children under 18 years old and for person over 70 years old shall not exceed HK$300,000.) <br/>
			                                                                </td>
			                                                            <td>$1,200,000</td>
			                                                            <td>$600,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>Major Burns<br/>
			                                                                Suffering of Third Degree Burns with burnt areas equal to or greater than 5% of head or 10% of total body surface area.
			                                                            </td>
			                                                            <td>$200,000</td>
			                                                            <td>$100,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>Credit Card Protection<br/> 
			                                                                In the event of accidental death of the Insured Person during the journey, the outstanding balance of the Insured Person's credit card as at the date of accident will be covered.
			                                                            </td>
			                                                            <td>$30,000</td>
			                                                            <td>$15,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>5.   Baggage</td>
			                                                            <td>Loss, physical breakage of damage directly resulting from accident, theft, burglary, or mishandling by carriers to the Insured Person’s baggage or personal property carry-on.  The limit for each item, pair or set shall be HK$3,000.</td>
			                                                            <td>$20,000</td>
			                                                            <td>$3,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>6.  Baggage Delay</td>
			                                                            <td>Emergency purchases of essential items of toiletries and clothing and the additional travelling cost to get back the baggage consequent upon temporary deprivation of baggage for at least 6 hours from the time of arrival at destination abroad due to delay or misdirection in delivery.<This part is not applicable when the Insured Person already reach home or the final destination.></td>
			                                                            <td>$1,500</td>
			                                                            <td>$500</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>7.   Personal Money</td>
			                                                            <td>Loss of cash, banknotes and travellers cheque arising from theft, burglary or robbery.</td>
			                                                            <td>$3,000</td>
			                                                            <td>$2,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>8.   Loss of Travel Document</td>
			                                                            <td>Cost of obtaining replacement air tickets, travel expenses and accommodation incurred to obtain such replacement arising from theft, burglary, robbery and accidental loss (Reimbursement is limited to HK$2,000 per day for Plan A or HK$1,000 per day for Plan B).</td>
			                                                            <td>$20,000</td>
			                                                            <td>$5,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td rowspan="3">9.   Travel Delay</td>
			                                                            <td>a)   Additional Travel Cost<br/>
			                                                                Public transportation expenses necessarily incurred as a direct consequence of airline or other public transportation is being delayed due to serious weather condition, industrial action, hijack, mechanical derangement, but only if the Insured Person has to re-route the trip as the result of the cancellation of the transportation previously confirmed.
			                                                            <td>$10,000</td>
			                                                            <td>$2,500</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>b)   Cash Allowance<br/>
			                                                                If the Insured Person needs to pay additional travelling cost in the event of travel delay, the Insured Person will be indemnified at HK$300 for each full 6-hour period delay.
			                                                            </td>
			                                                            <td>$2,500</td>
			                                                            <td>$600</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>(Select either a or b for compensation only.)</td>
			                                                            <td></td>
			                                                            <td></td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>10.  Cancellation Charge</td>
			                                                            <td>Reimbursement of irrecoverable prepaid tour costs and airfares in the event of death, serious sickness or injury of the Insured Person, immediate family members, travel companion or close business partner of the Insured Person, witness summons, jury service, compulsory quarantine of the Insured Person, natural disaster or unanticipated outbreak of epidemic diseases/industrial action, riot/civil commotion at the destination within 7 days before departure date, serious damage to the Insured Person’s principal home in Hong Kong arising from fire or flooding within 10 days from the departure date or Black Outbound Travel Alert for the destination is in effect 7 days before the departure date.</td>
			                                                            <td>$30,000</td>
			                                                            <td>$5,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>11.  Curtailment of Trip</td>
			                                                            <td>Reimbursement of irrecoverable prepaid tour costs and airfares in the event of death, serious sickness or injury of the Insured Person, immediate family members, travel companion or close business partner of the Insured Person, witness summons, jury service, compulsory quarantine of the Insured Person, natural disaster or unanticipated outbreak of epidemic diseases/industrial action, riot/civil commotion at the destination within 7 days before departure date, serious damage to the Insured Person’s principal home in Hong Kong arising from fire or flooding within 10 days from the departure date or Black Outbound Travel Alert for the destination is in effect 7 days before the departure date.</td>
			                                                            <td>$30,000</td>
			                                                            <td>$5,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>12.  Loss of Home Contents</td>
			                                                            <td>The loss of or damage to the contents or personal effects of the Insured Person’s principal home as a result of burglary accompanied by forcible and violent entry to or exit from the premise whilst the home is unoccupied during the period of travel.</td>
			                                                            <td>$30,000</td>
			                                                            <td>$10,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>13.  Personal Liability</td>
			                                                            <td>Indemnity against third party legal liability arising from a result of accidental injury. Loss or damage to third party’s property during the Period of Insurance. (This benefit does not apply to liability arising from the use or hire of motor vehicle.)</td>
			                                                            <td>$3,000,000</td>
			                                                            <td>$1,500,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>14.  Rental Vehicle Excess</td>
			                                                            <td>If the Insured Person hires a rental vehicle during the journey and is involved in a car accident, or the vehicle is damaged or stolen, the claims excess in the motor insurance policy purchased by the Insured Person will be reimbursed.</td>
			                                                            <td>$5,000</td>
			                                                            <td>$3,000</td>
			                                                        </tr>
			                                                        <tr>
			                                                            <td>15.  Golfer "Hole-in-One"</td>
			                                                            <td>If the Insured Person achieve a "hole-in-one" at any recognized golf course.</td>
			                                                            <td>$3,000</td>
			                                                            <td>$1,000</td>
			                                                        </tr>
			                                                    </tbody>
			                                                </table>
			                                            </div>
                                                    </div>
                                                </div>
                                             </div>
											
										</div>
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full">
													<span><i
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-3" data-toggle="modal">Major Exclusions	</a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full ">Major Exclusions	</h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
			                                                <ol class="text-justify">
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
                                                    </div>
                                                </div>
                                             </div>
											
										</div>
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full">
													<span><i
															class="fa fa-plus"></i>  <a href="#" data-target="#details-popup-4" data-toggle="modal">Age Limit</a> </span>
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
	                                                            <h4 class="fwdpanel-title h4-4-full ">Age Limit</h4>
	                                                        </div>
			                                                <p>A minimum age of 6 weeks to a maximum of 85 years. Children under 18 years of age must be accompanied by at least one adult who is also insured under the same policy.<br/>
			                                                    (This summary gives only an outline of the insurance cover. Please refer to the Insurance Policy for the precise terms and conditions.)
			                                                </p>
			                                            </div>
                                                    </div>
                                                </div>
                                             </div>
											
										</div>
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-full">
													<span><i
															class="fa fa-plus"></i> <a href="#" data-target="#details-popup-5" data-toggle="modal">Premium table (HK$)</a> </span>
												</h4>
											</div>
											<div class="modal fade details-popup" id="details-popup-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content plan-modal">
                                                        <a class="close" aria-label="Close" data-dismiss="modal">
                                                        <span aria-hidden="true" style="font-size:30px;">×</span>
                                                        </a>
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="fwdpanel-title h4-4-full ">Premium table (HK$)</h4>
                                                        </div>
                                                        <div class="fwdpanel-body">
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
                                                    </div>
                                                </div>
                                             </div>
											
										</div>
									</div>
								</div>
							</div>
							<h4 class="h4-4">
								<i class="fa fa-download"></i> <a
									href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf"
									target="_blank">Download brochure	</a>
							</h4>
						</div>-->
						</div>
					</div>

					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 gray-bg pad-none" id="oversea-plan-quote-promotion-code-container">
						<div class="hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left" style="">
								    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;">Overseas StudentCare Worldwide</h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"></h2>
									<h4 style="padding-left:0px;line-height: 24px;font-size: 16px;" id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname" value="">
									
										
								</div>
								<div class="pull-right" style="">
									<div class="text-left h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;">
											HK$
											<div style="font-weight: bold;font-size: 28px;" class="flightcare-hk" id="plansummary">0</div>
											<input type="hidden" name="txtgrossPremiumAmt" id="txtgrossPremiumAmt" value="">
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
						</div>
						<div id="promo-code-body" class="hide-html col-xs-12 pad-none">
						  <div style="width: 80%;margin-left: 10%;">
							<h3 style="font-size:18px;"><key id='Overseas.PlanOptions.Promo'>Promotion Code</key></h3>
							<span class="text-grey" id="loadingPromo" style="display:none;">Updating...</span>
							<span class="text-red" id="errPromoCode"></span>
							<div id="promo-wrap" class="form-group">
								<div class="input-group" id="inputPromo" style="display:inital;width:100%;padding-left: 20px;padding-right: 20px;">
									<!--
									<input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onFocus="placeholderOnFocus(this,'eg: FWD789');" onBlur="placeholderOnBlur(this,'eg: FWD789');" value="eg: FWD789">
									-->
                                    <input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onFocus="placeholderOnFocus(this,'<key id='Overseas.PlanOptions.Promo.eg'>If applicable</key>');" onBlur="placeholderOnBlur(this,'<key id='Overseas.PlanOptions.Promo.eg'>If applicable</key>');" value="If applicable">
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onClick="applyTravelPromoCode()">APPLY</a>
									<%-- <input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onFocus="placeholderOnFocus(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" onBlur="placeholderOnBlur(this,'<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />');" value="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />">
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onClick="applyOverseaPromoCode()">APPLY</a> --%>
								</div>
							</div>
							<div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
					            <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><key id='Overseas.PlanOptions.Promo.How'>How do I get a promotion code?</key></i></a>
							</div>
							<!--
							<div class="checkbox" style="margin-top: 20px; font-size: 14px;">
                              <input type="checkbox" id="the-club-member-toggle" name="hasTheClubMembershipNo"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg"><img src="resources/images/partner_theclub.png" height="12"> member.</a></label>
                            </div>
							
                            <span class="text-red" id="errClubMemberID"></span>-->
                            <div class="form-group" style="margin-top: 0; margin-bottom: 20; display: none;">
                                <div class="input-group" style="display:inital; width:100%;">
                                    <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder" style="display:inline-block;width:100%;" onFocus="placeholderOnFocus(this,'The Club Membership Number');" onBlur="placeholderOnBlur(this,'The Club Membership Number');" value="The Club Membership Number">
                                </div>
                            </div>
						  </div>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12 pad-none">
                          <div style="width: 80%;margin-left: 10%;">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;margin-bottom:0;font-size: 18px;"><key id='Overseas.PlanOptions.Subtotal'>Subtotal</key></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="subTotal" id="subTotal" value="540">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;margin-bottom:0;margin-top:0;font-size: 18px;"><key id='Overseas.PlanOptions.Discount'>Discount</key></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="discountAmt" style="padding-right: 0px;margin-top:0;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedDiscountAmt" id="selectedDiscountAmt" value="0.00">
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div style="width:80%;margin-left:10%">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><key id='Overseas.PlanOptions.Amountdue'>Amount Due</key></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="amountdue" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedAmountDue" id="selectedAmountDue" value="435.00">
							<input type="hidden" name="selectPlanPremium" id="selectPlanPremium" value="435.00">
						  </div>
						</div>
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                <a class="bdr-curve btn btn-primary bck-btn" onClick="perventRedirect=false;BackMe();"><key id='Overseas.PlanOptions.Back'>Back</key></a>
                            </div>
                            <div class="top35 pull-right pad-none" style="width:47%">
	                            
	                        <c:choose>
	                            <c:when test="${language=='en'}">
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','${quoteDetails.toalDue }','','Regis_Oversea_Step1 EN','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:when>
	                            <c:otherwise>
	                                <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','${quoteDetails.toalDue }','','Regis_Oversea_Step1 ZH','USD');perventRedirect=false;submitPlan();">
	                                    <fmt:message key="travel.action.next" bundle="${msg}" /></button>
	                            </c:otherwise>
                            </c:choose>

                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-14"><span class="text-red errDue"></span></div>
                            <br>
                            <div class="clearfix"></div>
                            <span id="divPersonsDesk"></span>
                            <span id="lblDaysDesk" style="display: none">0</span>
                            <div id="quote-wrap" class="clearfix"></div>
                        </div>
                    </div>
				</div>
		</div>
		<input type="hidden" name="planSelected" id="planSeelcted" value="personal">
		<p class="padding1 workingholiday-plan-disclaimer">
			The features above are indicative only.
				<br>
				For a complete explanation of the terms and conditions for our online travel insurance, feel free to contact our 24-hour hotline at 3123 3123.
		</p>
		
		<div class="col-xs-12 hidden-md hidden-lg pad-none">
		   <div style="width: 80%;margin-left: 10%; margin-bottom: 40px;">
		        <div class="top35 pull-left pad-none" style="width:47%">
		            <a class="bdr-curve btn btn-primary bck-btn" onClick="perventRedirect=false;BackMe();">Back </a>
		        </div>
		        <div class="top35 pull-right pad-none" style="width:47%">
		            
	                <c:choose>
                        <c:when test="${language=='en'}">
                            <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','${quoteDetails.toalDue }','','Regis_Oversea_Step1 EN','USD');perventRedirect=false;submitPlan();">
                                <fmt:message key="travel.action.next" bundle="${msg}" /></button>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="bdr-curve btn btn-primary nxt-btn" onclick="javascript:kenshoo_conv('Registration_Step1','${quoteDetails.toalDue }','','Regis_Oversea_Step1 ZH','USD');perventRedirect=false;submitPlan();">
                                <fmt:message key="travel.action.next" bundle="${msg}" /></button>
                        </c:otherwise>
                    </c:choose>            
           
		        </div>
		        <div class="clearfix"></div>
		        <span class="text-red errDue"></span>
		    </div>
		</div>

		</form>
		
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
	            <div style="overflow: hidden;">
	            	<a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
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

<link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>
