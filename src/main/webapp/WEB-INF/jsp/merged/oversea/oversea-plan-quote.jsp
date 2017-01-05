<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />


<script type='text/javascript'>
var promoData = '';
var promoCodePlaceholder="<fmt:message key="travel.sidebar.summary.promocode.placeholder" bundle="${msg}" />";
//var userSelectRegion=false;
function prepareOverseaPlan(form){
	var result = false;
	var method = "<%=request.getContextPath()%>/ajax/oversea/prepareOverseaQuote";
	$.ajax({
		type : "POST",
		url : method,
		async : false,
		success : function(data) {
			if (data == "success") {
                form.action = "<%=request.getContextPath()%>/${language}/overseas-study-insurance/plan-options";
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
       //$('#seletedplanregion').html('Worldwide');
    }else if(region=='region1'){
        $('#region0').css("display","none");
        $('#region1').css("display","block");
        $('#region-btn-0').addClass("region-box-inactive");
        $('#region-btn-0').removeClass("region-box-active");
        $('#region-btn-1').addClass("region-box-active");
        $('#region-btn-1').removeClass("region-box-inactive");
        //$('#seletedplanregion').html('Asia');
    }
    //return true;
}
function changeColorAndPrice(id,index, planName, discountAmt, totalDue) {
	if(index>=0&&index<=3){
        $('#seletedplanregion').html('<fmt:message key="Overseas.PlanOptions.Region.Worldwide" bundle="${msg}" />');
    }else if(index>=3&&index<=5){
        $('#seletedplanregion').html('<fmt:message key="Overseas.PlanOptions.Region.WorldwideAsia" bundle="${msg}" />');
    }else{
        $('#seletedplanregion').html('<fmt:message key="Overseas.PlanOptions.Region.Asiaonly" bundle="${msg}" />');
	}
	$("#planIndex").val(index);
    var txtPlanName = $("#"+planName).val()

	var txtDiscountAmt = $("#"+discountAmt).val()
	var txtTotalDue = $("#"+totalDue).val()
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

	$('#amountdue').html(numeral(txtTotalDue).format('0,0.00'));


	$('#subtotal').html(numeral(selected_price).format('0,0.00'));
	$('#plansummary').html(numeral(selected_price).format('0,0.00'));
	/*
    $('#seletedplanname').html(txtPlanName);
    */
    if(txtPlanName=='basicA')$('#seletedplanname').html('<fmt:message key="Overseas.Plan.Name.Short.Standard.PlanA" bundle="${msg}" />');
    if(txtPlanName=='basicB')$('#seletedplanname').html('<fmt:message key="Overseas.Plan.Name.Short.Standard.PlanB" bundle="${msg}" />');
    if(txtPlanName=='medicalWorldwideA'||txtPlanName=='medicalAsiaA')$('#seletedplanname').html('<fmt:message key="Overseas.Plan.Name.Short.Comprehensive.PlanA" bundle="${msg}" />');
    if(txtPlanName=='medicalWorldwideB'||txtPlanName=='medicalAsiaB')$('#seletedplanname').html('<fmt:message key="Overseas.Plan.Name.Short.Comprehensive.PlanB" bundle="${msg}" />');


	$('#inputseletedplanname').val(txtPlanName);
	$('#selectPlanPremium').val(parseFloat(selected_price).toFixed(2));

	$('#' + id).addClass("plan-box-active");

    $('#plan-coverage-' + id).css("display","block");

	$('#discountAmt').html(numeral(txtDiscountAmt).format('0,0.00'));

	/*
	document.getElementById("selectedAmountDue").value = parseFloat(txtTotalDue.trim()).toFixed(2);
    document.getElementById("selectedDiscountAmt").value = parseFloat(txtDiscountAmt.trim()).toFixed(2);
    $('#txtDiscountAmount').val(numeral(txtDiscountAmt.trim()).format('0,0.00'));
    document.getElementById("txtgrossPremiumAmt").value = parseFloat(selected_price.trim()).toFixed(2);
    */


    document.getElementById("selectedAmountDue").value = parseFloat(txtTotalDue).toFixed(2);
    document.getElementById("selectedDiscountAmt").value = parseFloat(txtDiscountAmt).toFixed(2);
    //document.getElementById("txtDiscountAmount").value = parseFloat(txtDiscountAmt).toFixed(2);
    //$('#txtDiscountAmount').val(numeral(txtDiscountAmt).format('0,0.00'));
    document.getElementById("txtgrossPremiumAmt").value = parseFloat(selected_price).toFixed(2);
    if(promoData != '')
		setValue(promoData);
	return true;

}
function regionDefaultPlan(id1,index1, planName1, discountAmt1, totalDue1){
    changeColorAndPrice(id1,index1, planName1, discountAmt1, totalDue1);
    $('#inputseletedplanname').val(planName1);
    $('#amountdue').html(parseFloat(totalDue1).toFixed(2));
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
                form.action = '<%=request.getContextPath()%>/${language}/overseas-study-insurance/application';
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
            /* console.log($('#frmTravelPlan input').serialize()); */
            $.ajax({
                type : 'POST',
                url : '<%=request.getContextPath()%>/ajax/oversea/applyOverseaPromoCode',
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
function coverageToggleGoto(id){
    $.mCustomScrollbar.defaults.scrollButtons.enable=true;
    $.mCustomScrollbar.defaults.axis="y";
    $('.fwdpanel-body').mCustomScrollbar({
        theme:"light-2"
    });

	if(id=="1"){
		coverageToggle('#SummaryofCoverageContent','open');
        coverageToggle('#MedicalExpensesInnerContent','close');
        coverageToggle('#TopupInPatientMedicalExpensesInnerContent','close');
		coverageToggle('#WorldwideEmergencyAssistanceServicesInnerContent','open');
        coverageToggle('#PersonalLiabilityInnerContent','close');
        if($('.top-bar').height()>0){
            $('html, body').animate({
                scrollTop: $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().offset().top
            }, 500);
            $("#plan-no-more-tables").removeAttr('id');
        }else{
            $('html, body').animate({
                scrollTop:($('#WorldwideEmergencyAssistanceServicesInnerContent').prev().offset().top-$('.logobox').height())
            }, 500);
            $('#WorldwideEmergencyAssistanceServicesInnerContent').find('table').parent().attr('id', 'plan-no-more-tables');
        }
        $('#WorldwideEmergencyAssistanceServicesInnerContent').parents(".mCustomScrollbar").mCustomScrollbar('scrollTo', $('#WorldwideEmergencyAssistanceServicesInnerContent').prev());
		$('#MedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#MedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().addClass('fa-minus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().removeClass('fa-plus');
        $('#SummaryofCoverage').find('h4').find('i').removeClass('fa-chevron-down');
        $('#SummaryofCoverage').find('h4').find('i').addClass('fa-chevron-up');
   	}else if(id=="2"){
        coverageToggle('#SummaryofCoverageContent','open');
        coverageToggle('#MedicalExpensesInnerContent','open');
        coverageToggle('#TopupInPatientMedicalExpensesInnerContent','close');
        coverageToggle('#WorldwideEmergencyAssistanceServicesInnerContent','close');
        coverageToggle('#PersonalLiabilityInnerContent','close');
        if($('.top-bar').height()>0){
            $('html, body').animate({
                scrollTop: $('#MedicalExpensesInnerContent').prev().offset().top
            }, 500);
            $("#plan-no-more-tables").removeAttr('id');
        }else{
            $('html, body').animate({
                scrollTop:($('#MedicalExpensesInnerContent').prev().offset().top-$('.logobox').height())
            }, 500);
            $('#MedicalExpensesInnerContent').find('table').parent().attr('id', 'plan-no-more-tables');
        }
        $('#MedicalExpensesInnerContent').parents(".mCustomScrollbar").mCustomScrollbar('scrollTo', $('#MedicalExpensesInnerContent').prev());
        $('#MedicalExpensesInnerContent').prev().children().children().addClass('fa-minus');
        $('#MedicalExpensesInnerContent').prev().children().children().removeClass('fa-plus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().addClass('fa-plus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#SummaryofCoverage').find('h4').find('i').removeClass('fa-chevron-down');
        $('#SummaryofCoverage').find('h4').find('i').addClass('fa-chevron-up');
    }/*else if(id=="3"){
        coverageToggle('#SummaryofCoverageContent','open');
        coverageToggle('#MedicalExpensesInnerContent','close');
        coverageToggle('#TopupInPatientMedicalExpensesInnerContent','close');
        coverageToggle('#WorldwideEmergencyAssistanceServicesInnerContent','close');
        coverageToggle('#PersonalLiabilityInnerContent','open');
        //$('#PersonalLiabilityInnerContent').slideDown("slow");
        $('html, body').animate({
            scrollTop: $('#PersonalLiabilityInnerContent').offset().top
        }, 500);

        //$('#SummaryofCoverageContent').animate({
        //    scrollTop: $('#PersonalLiabilityInnerContent').slideUp("fast")
        //}, 500);

        $('#PersonalLiabilityInnerContent').parents(".mCustomScrollbar").mCustomScrollbar('scrollTo', $('#PersonalLiabilityInnerContent'));

        $('#MedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#MedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().addClass('fa-plus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#PersonalLiabilityInnerContent').prev().children().children().addClass('fa-minus');
        $('#PersonalLiabilityInnerContent').prev().children().children().removeClass('fa-plus');
        $('#SummaryofCoverage').find('h4').find('i').removeClass('fa-chevron-down');
        $('#SummaryofCoverage').find('h4').find('i').addClass('fa-chevron-up');
    }else if(id=="4"){
        coverageToggle('#SummaryofCoverageContent','open');
        coverageToggle('#MedicalExpensesInnerContent','close');
        coverageToggle('#TopupInPatientMedicalExpensesInnerContent','open');
        coverageToggle('#WorldwideEmergencyAssistanceServicesInnerContent','close');
        coverageToggle('#PersonalLiabilityInnerContent','close');

        //TopupInPatientMedicalExpensesInnerContent
        //$('#PersonalLiabilityInnerContent').slideDown("slow");
        $('html, body').animate({
            scrollTop: $('#TopupInPatientMedicalExpensesInnerContent').offset().top
        }, 500);

        //$('#SummaryofCoverageContent').animate({
        //    scrollTop: $('#PersonalLiabilityInnerContent').slideUp("fast")
        //}, 500);

        $('#TopupInPatientMedicalExpensesInnerContent').parents(".mCustomScrollbar").mCustomScrollbar('scrollTo', $('#TopupInPatientMedicalExpensesInnerContent'));

        $('#MedicalExpensesInnerContent').prev().children().children().addClass('fa-plus');
        $('#MedicalExpensesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().removeClass('fa-plus');
        $('#TopupInPatientMedicalExpensesInnerContent').prev().children().children().addClass('fa-minus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().addClass('fa-plus');
        $('#WorldwideEmergencyAssistanceServicesInnerContent').prev().children().children().removeClass('fa-minus');
        $('#PersonalLiabilityInnerContent').prev().children().children().addClass('fa-minus');
        $('#PersonalLiabilityInnerContent').prev().children().children().removeClass('fa-plus');
        $('#SummaryofCoverage').find('h4').find('i').addClass('fa-chevron-down');
        $('#SummaryofCoverage').find('h4').find('i').removeClass('fa-chevron-up');
    }*/
}
function coverageToggle(id,action){
    //$(id).mCustomScrollbar();
    if(action=='open'){
        $(id).css("display","block");
    }else if(action=='close'){
        $(id).css("display","none");
    }
    return true;
}
/*
function scrollDownOverseaProductPanel($element){
    $element.slideDown("slow", function(){
        $panel.find('i').addClass('fa-chevron-up');
        $panel.find('i').removeClass('fa-chevron-down');
        $.mCustomScrollbar.defaults.scrollButtons.enable=true; //enable scrolling buttons by default
        $.mCustomScrollbar.defaults.axis="y";
        $(".product_plan_panel_content").mCustomScrollbar({
            theme:"light-2"
        });

        //product_plan_panel_valid=true;

        $('html, body').animate({
            scrollTop: $panel.offset().top
        }, 500);
    });
}
*/
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
    $('[data-toggle="tooltip"]').tooltip();
    $('#seletedplanregion').html('<fmt:message key="Overseas.PlanOptions.Region.Worldwide" bundle="${msg}" />');
    $('#seletedplanname').html('<fmt:message key="Overseas.Plan.Name.Short.Comprehensive.PlanA" bundle="${msg}" />');
    changeColorAndPrice('box2','2','txtPlanName2','txtDiscountAmount2','txtTotalDue2');

    <c:if test="${selectedRegion!=null}">
    $('#region-btn-${selectedRegion}').click();
    </c:if>
});

</script>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition hidden-lg hidden-md"></div></div>
        <div class="product_header_path_item active"><fmt:message key="Overseas.PlanOptions.progressbar.item1" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item2" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item3" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item4" bundle="${msg}" /></div>
    </div>
</section>
<section>
	<div id="cn" class="container">
		<div class="row">
			<form id="frmTravelPlan" name="frmTravelPlan" method="post" onsubmit="return subForm(this, 'frmTravelPlan');" >
				<ol class="breadcrumb pad-none">
					<li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer1" bundle="${msg}" /></a> <i class="fa fa-chevron-right"></i></li>
					<li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer2" bundle="${msg}" /></a><i class="fa fa-chevron-right"></i></li>
					<li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer3" bundle="${msg}" /></a></li>
					<li class="active "><i class="fa fa-chevron-right"></i><fmt:message key="Overseas.Landing.Breadcrumb.step1" bundle="${msg}" /></li>
				</ol>
				<div id="quote-wrap" class="container pad-none bdr gray-bg3">
					<div class="col-lg-8 col-xs-12 col-sm-12 col-md-8 pad-none white-bg1" id="oversea-plan-quote-select-region-container">
					   <div class="workingholiday-plan-margin form-wrap">
						<h2 class="h2-3-choose"><fmt:message key="Overseas.PlanOptions.Region" bundle="${msg}" /></h2>
						<div style="margin-bottom: 40px;">
                            <div class="pull-left pad-none region-box col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-right-des" >
	                                <div id="region-btn-0" type="button" class="btn-block bdr-curve btn region-box-btn region-box-active" onClick="changeRegion('region0');regionDefaultPlan('box2','2','medicalWorldwideA','0','8000')" style="" ><fmt:message key="Overseas.PlanOptions.Region.Worldwide" bundle="${msg}" /></div>
							</div>
                            <div class="pull-right pad-none region-box col-lg-6 col-xs-6 col-sm-6 col-md-6 pad-left-des" >
	                                <div id="region-btn-1" type="button" class="btn-block bdr-curve btn region-box-btn" onClick="changeRegion('region1');regionDefaultPlan('box6','6','medicalAsiaA','0','5500')" style=""  data-toggle="modal" data-target="#myModalAsia"><fmt:message key="Overseas.PlanOptions.Region.Asiaonly" bundle="${msg}" /></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>



<!-- Modal -->
<div class="modal fade" id="myModalAsia" tabindex="-1" role="dialog" aria-labelledby="myModalLabelAsia">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title region-asia-title" id="myModalLabelAsia"><fmt:message key="Overseas.PlanOptions.AsiaCountries.title" bundle="${msg}" /></h4>
      </div>
      <div class="modal-body">
        <div class="row plan-display-desktop-only">
          <div class="col-lg-4 col-xs-4 col-sm-4 col-md-4"><fmt:message key="Overseas.PlanOptions.AsiaCountries.desktop.col1" bundle="${msg}" /></div>
          <div class="col-lg-5 col-xs-5 col-sm-5 col-md-5"><fmt:message key="Overseas.PlanOptions.AsiaCountries.desktop.col2" bundle="${msg}" /></div>
          <div class="col-lg-3 col-xs-3 col-sm-3 col-md-3"><fmt:message key="Overseas.PlanOptions.AsiaCountries.desktop.col3" bundle="${msg}" /></div>
        </div>
        <div class="row plan-display-mobile-only">
          <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6"><fmt:message key="Overseas.PlanOptions.AsiaCountries.mobi.col1" bundle="${msg}" /></div>
          <div class="col-lg-6 col-xs-6 col-sm-6 col-md-6"><fmt:message key="Overseas.PlanOptions.AsiaCountries.mobi.col2" bundle="${msg}" /></div>
          <div class="col-lg-3 col-md-3"></div>
        </div>
      </div>
      <div class="modal-footer" style="text-align:center">
        <button type="button" class="btn btn-primary" data-dismiss="modal"><fmt:message key="Overseas.PlanOptions.AsiaCountries.ok" bundle="${msg}" /></button>
      </div>
    </div>
  </div>
</div>
<!-- / Modal -->



						<h2 class="h2-3-choose hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.Plans.table1.col1.header" bundle="${msg}" /></h2>
						<c:forEach begin="0" end="4" var="h" step="4">
							<div id="region${h==4?1:0}" <c:if test="${h==4}">class="region-box-hidden"</c:if>>
								<div class="plan-box-l plan-box-title oversea_productbox_title plan-display-desktop-only">
									<div class="" style="">
										<h2><fmt:message key="Overseas.PlanOptions.Plans.table1.col1row2.header" bundle="${msg}" /></h2>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only">
									<div class="" style="">
										<h2><fmt:message key="Overseas.PlanOptions.Plans.table1.col2.header" bundle="${msg}" /></h2>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="plan-box-s plan-box-title oversea_productbox_title plan-display-desktop-only">
									<div class="" style="">
										<h2><fmt:message key="Overseas.PlanOptions.Plans.table1.col3.header" bundle="${msg}" /></h2>
									</div>
									<div class="clearfix"></div>
								</div>


								<c:forEach begin="${h }" end="${h+2 }" var="i" step="2">
									<c:set var="j" value="${h==4 ? (i==4 ? 0 : 4) : i}" />
								<div class="oversea-plan-quote-coverage-wrapper<c:if test="${j == 2 || j == 4}"> plan-flow-r-mobile-only</c:if>">
                                    <div class="plan-box-l oversea_productbox_subtitle">
										<div class="" style="">
											<h2><fmt:message key="oversea.quote.coverage${i }" bundle="${msg}" />
											    <!--<c:if test="${ i == 4 }"><a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title="<fmt:message key="Overseas.PlanOptions.WorldWideComprehensivemedicalplanA.Benefit1.Tooltip" bundle="${msg}" />" onclick="coverageToggleGoto(2)" onmouseover="this.style.cursor='pointer';">
                                                <img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""></a></c:if>-->
											</h2>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="plan-box-s travelproductbox oversea_productbox<c:if test="${h == 0}"> pad-right-des</c:if>" id="box${i}" onClick="changeColorAndPrice('box${i}','${i}','txtPlanName${i}','txtDiscountAmount${i}','txtTotalDue${i}')">
										<div class="" style="">
											<h3 class="plan-display-mobile-only"><fmt:message key="Overseas.PlanOptions.Plans.table1.col2.header" bundle="${msg}" /></h3>
											<h2><fmt:message key="Overseas.PlanOptions.Currency" bundle="${msg}" /> <span id="total${i}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${quoteDetails.toalDue[j] }" />.00</span></h2>
										</div>
										<div class="clearfix"></div>
									</div>
									<input type="hidden" name="txtPlanName" id="txtPlanName${i}" value="${quoteDetails.planName[j]}">
		                            <input type="hidden" name="txtTotalDue" id="txtTotalDue${i}" value="${quoteDetails.toalDue[j] }">
		                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i}" value="${quoteDetails.grossPremium[j] }">
		                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i}" value="${quoteDetails.discountAmount[j] }">

									<div class="plan-box-s travelproductbox oversea_productbox  pad-left-des" id="box${i+1}" onClick="changeColorAndPrice('box${i+1}','${i+1}','txtPlanName${i+1}','txtDiscountAmount${i+1}','txtTotalDue${i+1}')">
										<div class="" style="">
											<h3 class="plan-display-mobile-only"><fmt:message key="Overseas.PlanOptions.Plans.table1.col3.header" bundle="${msg}" /></h3>
											<h2><fmt:message key="Overseas.PlanOptions.Currency" bundle="${msg}" /> <span id="total${i+1}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${quoteDetails.toalDue[j+1] }" />.00</span></h2>
										</div>
										<div class="clearfix"></div>
									</div>

									<input type="hidden" name="txtPlanName" id="txtPlanName${i+1}" value="${quoteDetails.planName[j+1]}">
		                            <input type="hidden" name="txtTotalDue" id="txtTotalDue${i+1}" value="${quoteDetails.toalDue[j+1] }">
		                            <input type="hidden" name="txtGrossPremium" id="txtGrossPremium${i+1}" value="${quoteDetails.grossPremium[j+1] }">
		                            <input type="hidden" name="txtDiscountAmount" id="txtDiscountAmount${i+1}" value="${quoteDetails.discountAmount[j+1] }">
		                           </div>
								</c:forEach>
							</div>
						</c:forEach>
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
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a  onclick="coverageToggleGoto(1)"><fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit.textlink" bundle="${msg}" /></a>
							</div>
                        </div>


                        <div class="planDetails" id="plan-coverage-box1" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a onclick="coverageToggleGoto(1)"><fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit.textlink" bundle="${msg}" /></a>
							</div>
                        </div>



                        <div class="planDetails" id="plan-coverage-box2" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit1" bundle="${msg}" /><a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title="<fmt:message key="Overseas.PlanOptions.WorldWideComprehensivemedicalplanA.Benefit1.Tooltip" bundle="${msg}" />" onclick="coverageToggleGoto(2)" onmouseover="this.style.cursor='pointer';">
                    <img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""></a>
                            </div>
                            <div class="plan-coverage-box-r">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a onclick="coverageToggleGoto(2)"><fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanA.Benefit2.Tooltip" bundle="${msg}" /> <!--<img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""  class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title=" " onmouseover="this.style.cursor='pointer';">--></a>
                            </div>
                        </div>





                        <div class="planDetails" id="plan-coverage-box3" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
								<fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
								<a  onclick="coverageToggleGoto(2)"><fmt:message key="Overseas.PlanOptions.WorldwideComprehensivemedicalplanB.Benefit2.Tooltip" bundle="${msg}" /> <!--<img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""  class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title=" " onmouseover="this.style.cursor='pointer';">--></a>
							</div>
                        </div>


                        <div class="planDetails" id="plan-coverage-box4" style="padding:1em;display:none">
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
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a onclick="coverageToggleGoto(1)"><fmt:message key="Overseas.PlanOptions.WorldwideStandardplanA.Benefit.textlink" bundle="${msg}" /></a>
							</div>
                        </div>


                        <div class="planDetails" id="plan-coverage-box5" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a onclick="coverageToggleGoto(1)"><fmt:message key="Overseas.PlanOptions.WorldwideStandardplanB.Benefit.textlink" bundle="${msg}" /></a>
							</div>
                        </div>



                        <div class="planDetails" id="plan-coverage-box6" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit1" bundle="${msg}" /><a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title="<fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit1.Tooltip" bundle="${msg}" />" onclick="coverageToggleGoto(4)" onmouseover="this.style.cursor='pointer';">
                    <img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""></a>


                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a  onclick="coverageToggleGoto(2)"><fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanA.Benefit.textlink" bundle="${msg}" /></a>
							</div>
                        </div>






                        <div class="planDetails" id="plan-coverage-box7" style="padding:1em;display:none">
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit1" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit1.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2.Amount" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-l">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit3" bundle="${msg}" />
                            </div>
                            <div class="plan-coverage-box-r">
                                <fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit3.Amount" bundle="${msg}" />
                            </div>
                            <div class="sub-link">
                                <a  onclick="coverageToggleGoto(2)"><fmt:message key="Overseas.PlanOptions.AsiaComprehensivemedicalplanB.Benefit2.Tooltip" bundle="${msg}" /> <!--<img src="<%=request.getContextPath()%>/resources/images/oversea/oversea-tooltip.png" alt=""  class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title=" " onmouseover="this.style.cursor='pointer';">--></a>
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
									<fmt:message key="Overseas.PlanOptions.Producthights.title" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;" id="ProductHighlightContent">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <p><fmt:message key="Overseas.PlanOptions.Producthighlights.copy" bundle="${msg}" /></p>
                                        <br>
                                        <p></p>
											<ul class="bullets">
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item1" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item2" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item3" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item4" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item5" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item6" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item7" bundle="${msg}" />
                                                </li>
                                                <li>
                                                    <fmt:message key="Overseas.PlanOptions.Producthighlights.copy.item8" bundle="${msg}" />
                                                </li>
                                            </ul>
                                        <p></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="fwdpanel-heading product_plan_panel" id="SummaryofCoverage">
                                <h4 class="fwdpanel-title h4-4-full">
									<fmt:message key="Overseas.PlanOptions.Productcoverage.title" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;" id="SummaryofCoverageContent" >
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;" id="MedicalExpensesInnerContent">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                                <thead>
                                                  <tr>
                                                      <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                      <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                      <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                                  </tr>
                                                  </thead>
                                                  <tbody>
                                                  <tr>
                                                      <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.row1" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" rowspan="2" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.planA.1" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" rowspan="2" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.planB.1" bundle="${msg}" /></td>
                                                  </tr>
                                                  <!--<tr>
                                                      <td><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.row2" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" rowspan="2" class="mobile-show planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.planA.1" bundle="${msg}" /></td>
                                                      <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" rowspan="2" class="mobile-show splanOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item1.planB.1" bundle="${msg}" /></td>
                                                  </tr>-->
                                                  </tbody>
                                               </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item2" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;" id="TopupInPatientMedicalExpensesInnerContent">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item2.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item2.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item2.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;" id="WorldwideEmergencyAssistanceServicesInnerContent">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.3" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.4" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.5" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row6" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.6" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.6" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row7" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.7" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.7" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row8" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.8" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planB.8" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td colspan="3" data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.row9" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                       <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planA.2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planB.2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planA.3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planB.3" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planA.4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planB.4" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planA.5" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.planB.5" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td colspan="3" bundle="${msg}"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item4.row6" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item5" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item5.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item5.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item5.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item6" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item6.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item6.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item6.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS" rowspan="1"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.row2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item3.planA.7.2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS" rowspan="1"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <!--
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item7.planA.2" bundle="${msg}" /></td>
                                               </tr>											    -->
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item8" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item8.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item8.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item8.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td colspan="3"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.row1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.row2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.row3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.planA.2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.planB.2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td colspan="3"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item9.row4" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS" rowspan="2"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS" rowspan="2"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.row2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.row3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planA.2" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planB.2" bundle="${msg}" /></td>
                                               </tr>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.row4" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planA.3" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item10.planB.3" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="fwdpanel-heading product_plan_inner_panel">
                                    <h4 class="fwdpanel-title h4-4-full">
                                        <fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item11" bundle="${msg}" />
                                        <i class="fa fa-plus"></i>
                                    </h4>
                                </div>
                                <div class="fwdpanel-body product_plan_inner_panel_content" style="display: none;" id="PersonalLiabilityInnerContent">
                                   <div class="row product_plan_panel_inner_content_row">
                                        <div class="col-xs-12">
                                            <table>
                                               <thead>
                                               <tr>
                                                   <th><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" /></th>
                                                   <th class="planOptionCoverageColTitleS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" /></th>
                                               </tr>
                                               </thead>
                                               <tbody>
                                               <tr>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item11.row1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item11.planA.1" bundle="${msg}" /></td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS"><fmt:message key="Overseas.PlanOptions.Productcoverage.copy.item11.planB.1" bundle="${msg}" /></td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <!--
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
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />">The loss of or damage to the contents or personal effects of the Insured Person’s principal home as a result of burglary accompanied by forcible and violent entry to or exit from the premise whilst the home is unoccupied during the period of travel. </td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS">$30,000</td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS">$10,000</td>
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
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col1" bundle="${msg}" />">Indemnity against third party legal liability arising from a result of accidental injury. Loss or damage to third party’s property during the Period of Insurance. (This benefit does not apply to liability arising from the use or hire of motor vehicle.) </td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col2" bundle="${msg}" />" class="planOptionCoverageColS">$3,000,000</td>
                                                   <td data-title="<fmt:message key="Overseas.PlanOptions.Productcoverage.copy.row1.col3" bundle="${msg}" />" class="planOptionCoverageColS">$1,500,000</td>
                                               </tr>
                                               </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                -->
                            </div>
                            <!--
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="Overseas.PlanOptions.importantnotes.title" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>

                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                    	<fmt:message key="Overseas.PlanOptions.importantnotes.copy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                             -->
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="Overseas.PlanOptions.exclusions.title" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>

                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
                                        <ol>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy1" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy2" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy3" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy4" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy5" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy6" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy7" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy8" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy9" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy10" bundle="${msg}" /></li>
                                            <li><fmt:message key="Overseas.PlanOptions.exlusions.copy11" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <!--
                            <div class="fwdpanel-heading product_plan_panel">
                                <h4 class="fwdpanel-title h4-4-full">
                                    <fmt:message key="Overseas.PlanOptions.agelimit.title" bundle="${msg}" />
                                    <i class="fa fa-chevron-down"></i>
                                </h4>
                            </div>
                            <div class="fwdpanel-body product_plan_panel_content" style="display: none;">
                                <div class="row product_plan_panel_content_row">
                                    <div class="col-xs-12">
										<p><fmt:message key="Overseas.PlanOptions.agelimit.copy" bundle="${msg}" /></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                             -->
                        </div>
                        <div style="margin-bottom:20px;" id="oversea-plan-quote-download-container">
                              <h4 class="h4-4 product_landing_download_button pull-left plan-mobile-center">
                                    <i class="fa fa-download"></i> <a href="/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf" target="_blank"><fmt:message key="Overseas.PlanOptions.Brochure" bundle="${msg}" /></a>
                                </h4>
                                <h4 class="h4-4 product_landing_download_button pull-left plan-mobile-center">
                                    <i class="fa fa-download"></i> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/Overseas_StudyCare_JacketLatest.pdf" target="_blank"><fmt:message key="Overseas.PlanOptions.Provisions" bundle="${msg}" /></a>
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
								<!--
								    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="Overseas.Planname.title" bundle="${msg}" /></h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;" id="seletedplanname"></h2>
									<h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanregion"></h4>
									 -->
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="Overseas.PlanOptions.PlanSelected.line1" bundle="${msg}" /></h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;" id="seletedplanname"></h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;" id="seletedplanregion"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname" value="">
									<input type="hidden" name="planIndex" id="planIndex" value="">
								</div>
								<div class="clearfix"></div>
								<div class="pull-right" style="">
									<div class="text-left h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
										<div class="hk" style="font-size: 18px;">
											<fmt:message key="Overseas.PlanOptions.Currency" bundle="${msg}" />
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
							<h3 style="font-size:18px;"><fmt:message key="Overseas.PlanOptions.Promo" bundle="${msg}" /></h3>
							<span class="text-grey" id="loadingPromo" style="display:none;">Updating...</span>
							<span class="text-red" id="errPromoCode"></span>
							<div id="promo-wrap" class="form-group">
								<div class="input-group" id="inputPromo" style="display:inital;width:100%;padding-left: 20px;padding-right: 20px;">
									<!--
									<input type="text" id="promoCode" name="promoCode" class="form-control bmg_custom_placeholder" style="display:inline-block;width:70%;padding: 0px;" onFocus="placeholderOnFocus(this,'eg: FWD789');" onBlur="placeholderOnBlur(this,'eg: FWD789');" value="eg: FWD789">
									-->
									<input autocomplete="off" type="text" id="promoCode" name="promoCode" class="form-control <c:if test="${!(referralCode != null && referralCode != '')}">bmg_custom_placeholder</c:if>" style="display:inline-block;width:70%;padding: 0px;" onFocus="placeholderOnFocus(this,'<fmt:message key="Overseas.PlanOptions.Promo.eg" bundle="${msg}" />');" onBlur="placeholderOnBlur(this,'<fmt:message key="Overseas.PlanOptions.Promo.eg" bundle="${msg}" />');"
									    <c:choose>
										   <c:when test="${referralCode != null && referralCode != ''}">
										   value="${referralCode }"
										   </c:when>
										   <c:otherwise>
	                                       value="<fmt:message key="Overseas.PlanOptions.Promo.eg" bundle="${msg}" />"
	                                       </c:otherwise>
									   </c:choose>
									/>
									<a class="input-group-addon in black-bold pointer sub-link" style="display:inline-block;width:30%;padding: 0px;float: right;margin-top: 15px;" onClick="applyOverseaPromoCode()"><fmt:message key="Overseas.PlanOptions.Promo.Apply" bundle="${msg}" /></a>
								</div>
							</div>
							<div class="travel-italic workingholiday-getpromocode" style="font-size:14px;">
					            <a href="" class="sub-link" data-toggle="modal" data-target=".bs-promo-modal-lg"><i><fmt:message key="Overseas.PlanOptions.Promo.How" bundle="${msg}" /></i></a>
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
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;margin-bottom:0;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Subtotal" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="subtotal" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="subTotal" id="subTotal" value="540">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;margin-bottom:0;margin-top:0;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Discount" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="discountAmt" style="padding-right: 0px;margin-top:0;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedDiscountAmt" id="selectedDiscountAmt" value="0.00">
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div style="width:80%;margin-left:10%">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="Overseas.PlanOptions.Amountdue" bundle="${msg}" /></h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right" id="amountdue" style="padding-right: 0px;font-size: 18px;">0</h3>
							<input type="hidden" name="selectedAmountDue" id="selectedAmountDue" value="0.00">
							<input type="hidden" name="selectPlanPremium" id="selectPlanPremium" value="0.00">
						  </div>
						</div>
						<div class="col-xs-12 hidden-sm hidden-xs pad-none">
                          <div style="width: 80%;margin-left: 10%;">
                            <div class="top35 pull-left pad-none" style="width:47%">
                                <a class="bdr-curve btn btn-primary bck-btn" onClick="perventRedirect=false;BackMe();"><fmt:message key="Overseas.PlanOptions.Back" bundle="${msg}" /></a>
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
<fmt:message key="Overseas.userdetails.Disclaimer1" bundle="${msg}" /><br>
<fmt:message key="Overseas.userdetails.Disclaimer2" bundle="${msg}" /></p>
		</p>

		<div class="col-xs-12 hidden-md hidden-lg pad-none">
		   <div style="width: 80%;margin-left: 10%; margin-bottom: 40px;">
		        <div class="top35 pull-left pad-none" style="width:47%">
		            <a class="bdr-curve btn btn-primary bck-btn" onClick="perventRedirect=false;BackMe();"><fmt:message key="Overseas.PlanOptions.Back" bundle="${msg}" /></a>
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
	                        <input autocomplete="off" type="email" class="form-control" placeholder=""
	                            name="emailToSendPromoCode" id="emailToSendPromoCode">
	                        <input type="hidden" name="planCode" id="planCode" value="OVERSEACARE">
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
<script>
/*
(function($){
    $(window).load(function(){
        $("#oversea-plan-quote-select-region-container").mCustomScrollbar();
    });
})(jQuery);
*/
</script>
