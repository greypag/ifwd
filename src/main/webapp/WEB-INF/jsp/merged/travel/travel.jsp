<%
//	session = request.getSession();
//	String uatAuth = (String) session.getAttribute("uatAuth");
//	//System.out.println("uatAuth " + uatAuth);
//	if (uatAuth == null)
//		response.sendRedirect(request.getContextPath() + "/uatAuth");
%>





<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!--   Main Content-->
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
	var contextPath = "${pageContext.request.contextPath}";

    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${travelScriptName}",
  "image":"${travelScriptImg}",
  "description":"${travelScriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${travelScriptChildName}"
  },
  "offers":{
    "@type":"AggregateOffer",
    "lowPrice":"95",
    "highPrice":"1800",
    "priceCurrency":"HKD"
  }
}
</script>


<script type="text/javascript">
  // personal or family
  var traveller;
  // personal
  var personalTraveller = parseInt("${corrTravelQuote.totalPersonalTraveller}");
  // family
  var familyAdult = "${corrTravelQuote.totalAdultTraveller}";
  var familyChild = "${corrTravelQuote.totalChildTraveller}";
  var familyOther = "${corrTravelQuote.totalOtherTraveller}";
  var familyTraveller = parseInt(familyAdult) + parseInt(familyChild) + parseInt(familyOther);

  var t1 = "${corrTravelQuote.totalAdultTraveller}";
  var t2 = "${corrTravelQuote.totalChildTraveller}";
  var t3 = "${corrTravelQuote.totalOtherTraveller}";

  function reset_desktop_submit(){
      if(document.getElementById("family_plan_desk").checked){
          $('#txtTravellersDesk').val(0);
      }else if (document.getElementById("personal_plan_desk").checked){
          $('#txtAdultsDesk').val(0);
          $('#txtOtherDesk').val(0);
          $('#txtChildDesk').val(0);
      }
      var frm = document.getElementById("frmTravelGetQuoteDesk");
  }
  function reset_mobile_submit(){
      if(document.getElementById("family_plan_mob").checked){
          $('#txtTravellersMob').val(0);
      }else if (document.getElementById("personal_plan_mob").checked){
          $('#txtAdultsMob').val(0);
          $('#txtOtherMob').val(0);
          $('#txtChildMob').val(0);
      }
      var frm = document.getElementById("frmTravelGetQuoteMob");
  }

  function reset_bottom_submit(){
      if(document.getElementById("family_plan_btm").checked){
          $('#txtTravellersBtm').val(0);
      }else if (document.getElementById("personal_plan_btm").checked){
          $('#txtAdultsBtm').val(0);
          $('#txtOtherBtm').val(0);
          $('#txtChildBtm').val(0);
      }
      var frm = document.getElementById("frmTravelGetQuoteBtm");
  }

 function selectTravelCareType(type, type_string){
	 $(".travel_type_label").html(type_string);

	 if(type=='single'){
		 //$('.family_plan_selectArea').show();

		 $('.personal-data-updown').show();
		 $('.other-data-container').show();

		 $('#tdp2').parent().show();
		 $('#endDateDeskIn').show();
		 $('#tdp4').parent().show();
         $('#tdp4').parent().prev().show();
         $('#tdp6').parent().show();
         $('#endDateBtmIn').show();

         $("#travelTypeDesk").val('single');
         $("#travelTypeMob").val('single');
         $("#travelTypeBtm").val('single');
         $("#frmTravelGetQuoteDesk").attr("action", "<%=request.getContextPath()%>/${language}/travel-insurance/quote");
         $("#frmTravelGetQuoteMob").attr("action", "<%=request.getContextPath()%>/${language}/travel-insurance/quote");
         $("#frmTravelGetQuoteBtm").attr("action", "<%=request.getContextPath()%>/${language}/travel-insurance/quote");

         $(".travel_feature").hide();
         $("#single_travel_feature").show();
         $("#annual_travel_provision_button").hide();
         $("#travel_provision_button").show();
         $("#annual_benefit_club").hide();
         $("#single_benefit_club").show();
	 }else{
		 //$('.personal_plan_selectArea').trigger('click');
		 //$('.family_plan_selectArea').hide();

		 if($('input[name=planSelected]').val()=='personal'){
			 $('.family_plan_selectArea').trigger('click');
			 $('.personal_plan_selectArea').trigger('click');
		 }else{
			 $('.personal_plan_selectArea').trigger('click');
		 }

		 $('.personal-data-updown').hide();
		 $('.other-data-container').hide();

		 $('#tdp2').parent().hide();
		 $('#endDateDeskIn').hide();
		 $('#tdp4').parent().hide();
         $('#tdp4').parent().prev().hide();
		 $('#tdp6').parent().hide();
		 $('#endDateBtmIn').hide();

         $("#travelTypeDesk").val('annual');
         $("#travelTypeMob").val('annual');
         $("#travelTypeBtm").val('annual');
         $("#frmTravelGetQuoteDesk").attr("action", "<%=request.getContextPath()%>/${language}/annual-travel-insurance/quote");
         $("#frmTravelGetQuoteMob").attr("action", "<%=request.getContextPath()%>/${language}/annual-travel-insurance/quote");
         $("#frmTravelGetQuoteBtm").attr("action", "<%=request.getContextPath()%>/${language}/annual-travel-insurance/quote");

         $(".travel_feature").hide();
         $("#annual_travel_feature").show();
         $("#travel_provision_button").hide();
         $("#annual_travel_provision_button").show();
         $("#single_benefit_club").hide();
         $("#annual_benefit_club").show();
	 }
 }
</script>
<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");

    var errMsgFromWrongUrl="${errMsgs[0]}";
    errMsgFromWrongUrl=errMsgFromWrongUrl.substring(1,errMsgFromWrongUrl.length-1);
    $('#errMsgFromWrongUrl .text-red').html(errMsgFromWrongUrl);

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

    if(getParameterByUrl("product")=="annual"){
    	selectTravelCareType('annual', getBundle(getBundleLanguage, "travel.main.quote.annualtravel"));
    }else {
    	selectTravelCareType('single', getBundle(getBundleLanguage, "travel.main.quote.singletriptravel"));
    }
});


function getParameterByUrl(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}


</script>
<!-- End fixed header -->
<%



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
<section id="main-slider" class="travel-hero-wrapper no-margin">
  <!--Mobilebanner-->
  <img src="<%=request.getContextPath()%>/<fmt:message key="travel.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="travel.hero.image.alt" bundle="${msg}" />" class="img-responsive hidden-lg hidden-md"  />
  <!--Mobilebanner-->
<div class="carousel slide hidden-xs hidden-sm">
<div class="col-lg-12 col-md-12 breadcrumb-wrapper">
	 <ol class="breadcrumb container pad-none">
	     <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
	     <i class="fa fa-chevron-right"></i>
         <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /></li>
         <i class="fa fa-chevron-right"></i>
	    <li class="active"><fmt:message key="home.breadcrumb1.travel" bundle="${msg}" /></li>
	 </ol>
</div>
<div class="carousel-inner">
<div class="item active">

<!--/#middle-->
        <img src="<%=request.getContextPath()%>/<fmt:message key="travel.hero.image" bundle="${msg}" />" alt="<fmt:message key="travel.hero.image.alt" bundle="${msg}" />"  />
         </div>
      <!--/.item-->
    </div>
    <!--/.carousel inner-->
  </div>
  <div class="tagline-holder">
      <img src="<%=request.getContextPath()%>/<fmt:message key="travel.hero.text.image" bundle="${msg}" />" class="img-responsive">
  </div>
  <!--/.carousel-->
  <form name="frmTravelGetQuote" id="frmTravelGetQuoteDesk" commandName="travelQuote" action="" method="post" onsubmit="return flightValidateDeskTravel();">
	<section id="middle" class="hidden-sm hidden-xs">
        <div class="container bmg_flighttravel_main_container">
	    <div class="row">
	      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
	        <!-- <h2><fmt:message key="travel.main.quote.top.heading" bundle="${msg}" /></h2> -->
	                <table class="table activation-form3">
	              <tbody>
	                <tr class="hide-html">
	                  <td><h3><fmt:message key="travel.main.quote.q1" bundle="${msg}" /></h3></td>
	                  <td><h3><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h3></td>
	                  <td><h3><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h3></td>
	                  <td><div id="divPersonsDesk" style="visibility:hidden;">
	                   <h3 class="h3-i">
	                      <label id="lblPeopleDesk">0</label>
	                    <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
	                      <label id="lblDaysDesk">0</label>
	                    <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></h3>
	                  </div></td>
	                </tr>
	                  <tr>
	                  <td class="" style="min-width: 210px;">
                        <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="travelTypeDropdown">
                          <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">
                             <label class="select-label travel_type_label" style="cursor: pointer;white-space: nowrap;"><fmt:message key="travel.main.quote.pleaseselect" bundle="${msg}" /></label>
                             <span class="product_landing_custom_fa-caret-down">
                                <i class="fa fa-caret-down"></i>
                             </span>
                          </a>
                          <div class="dropdown-menu bdr1 pad-none" style="width: 190px;">
                            <div class="drop-content pad-none">
                                <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('single',$(this).html());"><fmt:message key="travel.main.quote.singletriptravel" bundle="${msg}" /></div>
                                <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('annual',$(this).html());"><fmt:message key="travel.main.quote.annualtravel" bundle="${msg}" /></div>
                             </div>
                           </div>
                           <div class="clearfix"></div>

                           <input type="hidden" id="travelTypeDesk" name="travel_type" />
                        </div>
                     </td>

	                  <td class="" style="min-width: 150px;">
	                    <div class="input-group date" id="tdp1" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
	                      <input name="trLeavingDate" type="text" class="datepicker form-control border-radius bmg_custom_placeholder" style="display:inline-block;width:70%;" id="txtStartDateDesk" <%-- value="${departureDate != '' ? departureDate : corrTravelQuote.trLeavingDate}" --%> placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
	                    </div>
	                    </td>
	                  <td class="" style="min-width: 150px;">
	                    <div class="input-group date" id="tdp2" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
	                      <input name="trBackDate" type="text" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtEndDateDesk" <%-- value="${returnDate != '' ? returnDate : corrTravelQuote.trBackDate}" --%> placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
	                    </div>
	                    </td>
	                  <td class="" style="min-width: 190px;">
	                    <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdown">
	                      <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">
                               <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountDesk"></label>&nbsp; <i class="fa fa-caret-down pull-right" style="position: absolute;right: 7px;"></i>
                          </a>
	                      <div class="dropdown-menu bdr1" style="width: 355px;">
	                        <div class="drop-content">
	                          <div class="col-lg-6 col-md-6">
	                            <label class="radio radio-warning radio-inline personal_plan_selectArea">
	                              <input type="radio" name="planSelected" id="personal_plan_desk" data-id="desk" class="plan" value="personal" <%=PersonalPlanChecked%> >
	                              <label for="personal_plan_desk"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label>
	                            </label>
	                          </div>
	                          <div class="col-lg-6 col-md-6" style="margin-top: -5px;">
	                            <label class="radio radio-warning radio-inline family_plan_selectArea">
	                              <input type="radio" name="planSelected" id="family_plan_desk" data-id="desk" class="plan" value="family" <%=FamilyPlanChecked %>>
	                              <label for="family_plan_desk"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label>
	                                <a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title="<fmt:message key="travel.main.quote.family.help" bundle="${msg}" />">
			                        <img src="<%=request.getContextPath()%>/resources/images/ic.png" alt=""></a>
			                    </label>
	                          </div>
	                          <div class="clearfix"></div>
	                          <hr>
	                          <!-- start of personal plan bottom spinner-->
	                       <input type="hidden" name="familyPlan" id="family_desk_count" value="${corrTravelQuote.totalFamilyTravellers}">
	                       <div class="plan_spinner_desk" id="personal_plan_desk_spinner" <%=personalSpinnerStyle%>>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn personal-data-updown">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersDesk"  data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalPersonalTraveller}</div>
	                             <input type="hidden" name="totalPersonalTraveller" id="txtTravellersDesk" data-min="1" data-max="15" value="${corrTravelQuote.totalPersonalTraveller}"/>
	                             <span class="input-group-btn data-up personal-data-updown">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersDesk" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                       </div>
	                       <!-- end of personal plan bottom spinner-->
	                       <div class="clearfix"></div>

	                       <!-- start of family plan bottom spinner-->
	                       <div class="plan_spinner_desk" id="family_plan_desk_spinner" <%=familySpinnerStyle%>>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalAdultTraveller}</div>
	                             <input type="hidden" name="totalAdultTraveller" id="txtAdultsDesk" data-min="1" data-max="2" value="${corrTravelQuote.totalAdultTraveller}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="clearfix"></div>
	                         <div class="col-lg-6">
	                           <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalChildTraveller}</div>
	                             <input type="hidden" name="totalChildTraveller" id="txtChildDesk" data-min="1" data-max="15" value="${corrTravelQuote.totalChildTraveller}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="clearfix"></div>
	                         <div class="col-lg-6 other-data-container">
	                           <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="col-lg-6 other-data-container">
	                           <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
	                             </span>
	                             <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalOtherTraveller}</div>
	                             <input type="hidden" name="totalOtherTraveller" id="txtOtherDesk" data-min="0" data-max="15" value="${corrTravelQuote.totalOtherTraveller}"/>
	                             <span class="input-group-btn data-up ">
	                             <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherDesk" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
	                             </span> </div>
	                         </div>
	                         <div class="clearfix"></div>
	                         <div class="col-lg-12 child-notes">
	                           <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
	                         </div>
	                         <div class="clearfix"></div>
	                       </div>

	                       <!-- start of family plan bottom spinner-->
	                       <div class="clearfix"></div>
	                     </div>
	                   </div>
	                   <div class="clearfix"></div>
	                 </div>
	                 </td>
	               <td class="">
	                <button type="submit" class="two-test-002 border-radius btn btn-primary get-btn btn-color-ylw" style="line-height:32px;padding: 8px 20px !important;width: 100%;" onclick="reset_desktop_submit()">
	                   <fmt:message key="travel.main.quote.top.action" bundle="${msg}" />
	                </button>
	                 <!--   <a href="flight-plan-cn.html" class="border-radius btn btn-primary  get-btn marg-t2" onclick="return flightValidateDeskTravel()">立即報價</a> -->
	              </td>
	             </tr>
	             <tr class="product-landing-error-wrap">
	              <td><span id="travelTypeDeskIn" class="text-red"> </span></td>
	              <td><span id="startDateDeskIn" class="text-red"> </span></td>
	              <td><span id="endDateDeskIn" class="text-red"> </span></td>
	              <td><span id="travelCountDeskIn"  style="display:none">
	                 <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
	                 </span></td>
	              <td><span id="errMsgFromWrongUrl" >
	                 <label class="text-red"></label>
	                 </span>
	              </td>
	             </tr>
	           </tbody>
	         </table>
	      </div>
	      <!--/.col-sm-6-->

	    </div>
	    <!--/.row-->
	  </div>
	  <!--/.container-->
	</section>
	</form>
</section>










<!--Mobileform-->
<div class="slider-form hidden-lg hidden-md" style="background-color:#383A37;padding-bottom: 30px;">
<form name="frmTravelGetQuote" id="frmTravelGetQuoteMob" commandName="travelQuote" action="" method="post" onsubmit="return flightValidateMobTravel();">
  <div class="form-container">
    <h2 style="text-align: center;color: #f6871e;padding-top: 10px;padding-bottom: 10px;"><fmt:message key="travel.main.quote.top.heading" bundle="${msg}" /></h2>
    <h4 style="color: #fff;"><fmt:message key="travel.main.quote.planSelect" bundle="${msg}" /></h4>
    <div class="dropdown  form-group drop-down" id="travelTypeDropdownMob" style="background-color: #fff;">

      <a href="#" class="dropdown-toggle col-xs-12 col-sm-12" data-toggle="dropdown"> <label class="select-label travel_type_label" style="cursor: pointer;font-size: 23px !important;"><fmt:message key="travel.main.quote.pleaseselect" bundle="${msg}" /></label>&nbsp; <i class="fa fa-caret-down pull-right"></i></a>
    <div class="dropdown-menu bdr1 pad-none" style="width: 100%;">
      <div class="drop-content pad-none">
          <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('single',$(this).html());"><fmt:message key="travel.main.quote.singletriptravel" bundle="${msg}" /></div>
          <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('annual',$(this).html());"><fmt:message key="travel.main.quote.annualtravel" bundle="${msg}" /></div>
      </div>
    </div>
    <span id="travelTypeMobIn" style="color:red"> </span>
    <div class="clearfix"></div>
       <input type="hidden" id="travelTypeMob" name="travel_type" />
    </div>
    <h4 style="color: #fff;"><fmt:message key="travel.main.quote.q1" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="tdp3"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trLeavingDate" type="text" class="datepicker form-control" id="txtStartDateMob" style="font-size: 23px !important;" <%-- value="${corrTravelQuote.trLeavingDate}" --%> readonly>
      </div>
    </div>
    <span id="startDateMobIn" style="color:red"> </span>
    <h4 style="color: #fff;"><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h4>
    <div class="form-group">
      <div class="input-group date" id="tdp4"> <span class="input-group-addon in"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
        <input name="trBackDate" type="text" class="datepicker form-control" id="txtEndDateMob" style="font-size: 23px !important;" <%-- value="${corrTravelQuote.trBackDate}" --%> readonly>
      </div>
    </div>
    <span id="endDateMobIn" style="color:red"> </span>
    <h4 style="color: #fff;"><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h4>
    <div class="dropdown  form-group drop-down" id="myFWDropdownMob" style="background-color: #fff;">

      <a href="#" class="dropdown-toggle col-sm-12 col-xs-12" data-toggle="dropdown"> <label id="lblCountMob"></label> <i class="fa fa-caret-down pull-right"></i> </a>
      <div class="dropdown-menu bdr1">
        <div class="drop-content">
          <div class="col-xs-6 col-sm-6">
            <label class="radio radio-warning radio-inline personal_plan_selectArea">
             <input type="radio" name="planSelected" id="personal_plan_mob"  data-id="mob" class="plan" value="personal" <%=PersonalPlanChecked%>>
          <label for="personal_plan_mob"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label></label>
          </div>
          <div class="col-xs-6 col-sm-6" style="margin-top: -3px;">
            <label class="radio radio-warning radio-inline family_plan_selectArea">
              <input type="radio"  name="planSelected" id="family_plan_mob"  data-id="mob" class="plan" value="family" <%=FamilyPlanChecked %>>
             <label for="family_plan_mob"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label>
                <a class="tool-tip show-inline-md" data-toggle="tooltip" data-placement="bottom" title="<fmt:message key="travel.main.quote.family.help" bundle="${msg}" />">
                   <img src="<%=request.getContextPath()%>/resources/images/ic.png" alt="">
                </a>
             </label>
          </div>
          <div class="clearfix"></div>
          <hr>
          <!-- Start of personal plan mobile spinner-->
          <input type="hidden" name="" id="family_mob_count" value="${corrTravelQuote.totalFamilyTravellers}">
          <div class="plan_spinner_mob" id="personal_plan_mob_spinner" <%=personalSpinnerStyle%>>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd ">
              <span class="input-group-btn data-dwn personal-data-updown">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtTravellersMob" data-parent="personal">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalPersonalTraveller}</div>
              <input type="hidden" name="totalPersonalTraveller" id="txtTravellersMob" data-min="1" data-max="15" value="${corrTravelQuote.totalPersonalTraveller}"/>
              <span class="input-group-btn data-up personal-data-updown">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersMob" data-parent="personal">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>

         </div>
          <!-- End of personal plan mobile spinner-->
           <!-- Start of family plan mobile spinner-->
         <div class="plan_spinner_mob" id="family_plan_mob_spinner" <%=familySpinnerStyle%>>

           <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd ">
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtAdultsMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalAdultTraveller}</div>
              <input type="hidden" name="totalAdultTraveller" id="txtAdultsMob" data-min="1" data-max="2" value="${corrTravelQuote.totalAdultTraveller}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8">
            <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4">
            <div class="input-group number-spinner none-bd ">
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtChildMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalChildTraveller}</div>
              <input type="hidden" name="totalChildTraveller" id="txtChildMob" data-min="1" data-max="15" value="${corrTravelQuote.totalChildTraveller}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
         <div class="clearfix"></div>

          <div class="col-xs-6 col-sm-8 other-data-container">
            <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>
          </div>
           <div class="col-xs-6 col-sm-4 other-data-container">
            <div class="input-group number-spinner none-bd ">
              <span class="input-group-btn data-dwn">
                <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="minus" data-field="txtOtherMob" data-parent="family">
                      <span class="glyphicon glyphicon-minus"></span>
                </button>
              </span>
              <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalOtherTraveller}</div>
              <input type="hidden" name="totalOtherTraveller" id="txtOtherMob" data-min="0" data-max="15" value="${corrTravelQuote.totalOtherTraveller}"/>
              <span class="input-group-btn data-up ">
                 <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherMob" data-parent="family">
                   <span class="glyphicon glyphicon-plus"></span>
                 </button>
              </span>
           </div>
          </div>
          <div class="clearfix"></div>
          <div class="col-lg-12 child-notes">
               <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
             </div>
           </div>
           <!-- End of family plan mobile spinner -->
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <span id="travelCountMobIn" style="display:none">
    <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
    </span>
<!--     <span id="travelCountMobIn" style="display:none"> -->
<!--     <label style="color:red">Traveller count which is blank</label> -->
<!--     </span> -->
    <div class="text-center" id="divPersonsMob" style="visibility:hidden;display:none;">
      <small>
      <label id="lblPeopleMob">0</label>
        <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
      <label id="lblDaysMob">0</label>
        <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></small>
    </div>
  </div>

  <div class="form-container">
    <h3 class="text-center">
      <!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobTravel()">立即申請免費保障! </a>  -->
      <button type="submit" onclick="reset_mobile_submit()" class="two-test-002 bdr-curve btn btn-primary btn-lg btn-block btn-color-ylw">
              <fmt:message key="travel.main.quote.top.action" bundle="${msg}" />
             </button>
    </h3>
  </div>
  </form>
</div>
<!--Mobileform-->

<!--/#main slider-->

<section id="feature" style="margin-top:40px;">
  <div class="container pad-none">
    <div class="center wow fadeInDown">
      <!--desktop-->
		<h2 class="hidden-sm hidden-xs"><fmt:message key="travel.main.desc1" bundle="${msg}" /></h2>
		<!--end desktop-->

		<!--Mobile-->
		<h2 class="col-xs-12 hidden-lg hidden-md feature-ttl">
		<fmt:message key="travel.main.mobile.desc1" bundle="${msg}" />
		<fmt:message key="travel.main.mobile.desc2" bundle="${msg}" />
		<fmt:message key="travel.main.mobile.desc3" bundle="${msg}" />
		</h2>
		<!--end Mobile-->
	</div>


    <div id="single_travel_feature" class="travel_feature">
	    <div class="center wow fadeInDown">
	        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	            <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	                  <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
	                    <fmt:message key="travel.main.feature1.heading1" bundle="${msg}" /> <fmt:message key="travel.main.feature1.heading2" bundle="${msg}" />
	                  </h3>
	                  <div style="margin-top:25px;">
	                       <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/annual_travel/usp2.png" alt="<fmt:message key="image.alt_26" bundle="${msg}" />"/>
	                  </div>
	                  <div style="margin-top:10px;">
	                       <fmt:message key="travel.main.feature1.paragraph" bundle="${msg}" />
	                  </div>
	                  </div>
	              </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                   <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	                  <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
	                     <fmt:message key="travel.main.feature2.heading1" bundle="${msg}" /> <fmt:message key="travel.main.feature2.heading2" bundle="${msg}" />
	                  </h3>
	                  <div style="margin-top:25px;">
	                       <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/annual_travel/usp3.png" alt="<fmt:message key="image.alt_27" bundle="${msg}" />"/>
	                  </div>
	                  <div style="margin-top:10px;">
	                        <fmt:message key="travel.main.feature2.paragraph" bundle="${msg}" />
	                  </div>
	                  </div>
	              </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                  <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	                       <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
	                         <fmt:message key="travel.main.feature3.heading" bundle="${msg}" />
	                      </h3>
	                      <div style="margin-top:25px;">
	                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/iFWD_travel_icon3.png" alt="<fmt:message key="image.alt_28" bundle="${msg}" />"/>
	                      </div>
	                      <div style="margin-top:10px;">
	                          <fmt:message key="travel.main.feature3.paragraph" bundle="${msg}" />
	                      </div>
	                  </div>
	              </div>
	              <div class="clearfix"></div>
	          </div>
	          <div class="clearfix"></div>
	      </div>
      </div>

      <div id="annual_travel_feature" class="travel_feature" style="display:none;">
        <div class="center wow fadeInDown">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
                    <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
                      <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
                        <fmt:message key="annual.main.feature1.heading" bundle="${msg}" />
                      </h3>
                      <div style="margin-top:25px;">
                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/annual_travel/annual_usp1.png" />
                      </div>
                      <div style="margin-top:10px;">
                           <fmt:message key="annual.main.feature1.paragraph" bundle="${msg}" />
                      </div>
                      </div>
                  </div>
                  <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
                       <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
                      <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
                         <fmt:message key="annual.main.feature2.heading" bundle="${msg}" />
                      </h3>
                      <div style="margin-top:25px;">
                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/annual_travel/annual_usp2.png" />
                      </div>
                      <div style="margin-top:10px;">
                            <fmt:message key="annual.main.feature2.paragraph" bundle="${msg}" />
                      </div>
                      </div>
                  </div>
                  <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
                      <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
                           <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
                             <fmt:message key="annual.main.feature3.heading" bundle="${msg}" />
                          </h3>
                          <div style="margin-top:25px;">
                               <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/annual_travel/annual_usp3.png" />
                          </div>
                          <div style="margin-top:10px;">
                              <fmt:message key="annual.main.feature3.paragraph" bundle="${msg}" />
                          </div>
                      </div>
                  </div>
                  <div class="clearfix"></div>
              </div>
              <div class="clearfix"></div>
          </div>
      </div>


      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align:left;">
        <h4 class="product_landing_download_button h4-4 pull-left">
	          <i class="fa fa-download"></i> <a
	              href="<fmt:message key="travel.brochure.link" bundle="${msg}" />"
	              target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" /></a>
	      </h4>
	      <h4 class="product_landing_download_button h4-4 pull-left">
	          <i class="fa fa-download"></i>
	          	  <a
	              id="travel_provision_button" href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf"
	              target="_blank" style="display:none;" ><fmt:message key="annual.common.policyprovisions" bundle="${msg}" /></a>
	              <a
	              id="annual_travel_provision_button" href="https://home.fwd.com.hk/gidoc/policyprovisions/Travelcare_Annual_JacketLatest.pdf"
	              target="_blank" style="display:none;" ><fmt:message key="annual.common.policyprovisions" bundle="${msg}" /></a>
	      </h4>
      </div>
      <div class="clearfix"></div>
   </div>
</section>

<div style="background-color:#F2F3F5;text-align:center;padding-top: 20px;padding-bottom: 20px;">
    <div class="container pad-none">
        <h2><fmt:message key="annual.main.policycoverage" bundle="${msg}" /></h2>
        <h4><strong></strong></h4>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top:40px;">
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon1.png" alt="<fmt:message key="image.alt_29" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.medicalexpenses" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon1.png" alt="<fmt:message key="image.alt_29" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.medicalexpenses" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.medicalexpenses.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon2.png" alt="<fmt:message key="image.alt_30" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.baggage" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon2.png" alt="<fmt:message key="image.alt_30" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.baggage" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.baggage.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon3.png" alt="<fmt:message key="image.alt_31" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.lostofpersonal" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon3.png" alt="<fmt:message key="image.alt_31" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.lostofpersonal" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.lostofpersonal.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon4.png" alt="<fmt:message key="image.alt_32" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.personalliability" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon4.png" alt="<fmt:message key="image.alt_32" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.personalliability" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.personalliability.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon5.png" alt="<fmt:message key="image.alt_33" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.rentalvehicleexcess" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon5.png" alt="<fmt:message key="image.alt_33" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.rentalvehicleexcess" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.rentalvehicleexcess.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon6.png" alt="<fmt:message key="image.alt_34" bundle="${msg}" />">
                <h5><fmt:message key="annual.main.noexcess" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/annual_travel/icon6.png" alt="<fmt:message key="image.alt_34" bundle="${msg}" />"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="annual.main.noexcess" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="annual.main.noexcess.details" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<section style="margin-top:40px;margin-bottom:40px;">
  <div class="container pad-none">
<div class="other-benefits col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<h2><fmt:message key="special.promotion.headline" bundle="${msg}" /></h2>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:40px;">
	  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
	  	<div class="col-lg-12 col-md-12 hidden-xs hidden-sm main-partner pad-none" style="">
		    <img src="<%=request.getContextPath()%>/resources/images/CSL_logo.png" alt="" class="" style="display:block; margin-left:auto; margin-right:auto;">
		  </div>
		  <div class="hidden-lg hidden-md col-xs-12 col-sm-12 main-partner mob" style="text-align:center">
		    <div class="col-md-12 col-xs-12">
		        <img src="<%=request.getContextPath()%>/resources/images/CSL_logo.png" alt="" class="" style="display:block; margin-left:auto; margin-right:auto; margin-bottom:15px;">
		    </div>
		  </div>
      <ul class="bullets">
	      <li style="clear: both;">
	        <p class="h4-5">
			  <fmt:message key="travel.main.other.benefit.desc10.part1" bundle="${msg}" />
			  <b><fmt:message key="travel.main.other.benefit.desc10.part1_1" bundle="${msg}" /></b>
			  <fmt:message key="travel.main.other.benefit.desc10.part1_2" bundle="${msg}" />
			  <%--<fmt:message key="csl.simcard.link1" bundle="${msg}" />/${language}/<fmt:message key="csl.simcard.link2" bundle="${msg}" /> --%>
			  <a href="<%=request.getContextPath()%>/${language}/<fmt:message key="link.partner_offers" bundle="${msg}" />" target="_blank">
			    <fmt:message key="travel.main.other.benefit.desc10.part2" bundle="${msg}" />
			  </a>
			  <fmt:message key="travel.main.other.benefit.desc10.part3" bundle="${msg}" />
			</p>
	      </li>
	    </ul>
	  </div>
	  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
      	  <div class="col-lg-12 col-md-12 hidden-xs hidden-sm main-partner pad-none" style="">
		    <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="display:block; margin-left:auto; margin-right:auto; padding-top:33px;">
		  </div>
		  <div class="hidden-lg hidden-md col-xs-12 col-sm-12 main-partner mob" style="text-align:center">
		    <div class="col-md-12 col-xs-12">
		        <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="display:block; margin-left:auto; margin-right:auto; margin-bottom:15px; padding-top:33px;">
		    </div>
		  </div>
    <ul class="bullets">
      <li style="clear: both;">
        <p class="h4-5"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc8.part1" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc8.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc8.part3" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc8.part4" bundle="${msg}" /></p>
      </li>
      <%--<li>
        <p class="h4-5"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc9.part1" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc9.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc9.part3" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc9.part4" bundle="${msg}" /></p>
      </li>--%>
      <%--<li>
        <p class="h4-5"> <fmt:message key="partner.the.club.3x.period" bundle="${msg}" /></p>
      </li>--%>
      <%--<li>
        <p class="h4-5"><fmt:message key="travel.main.other.benefit.desc7.part1" bundle="${msg}" /> <a href="<fmt:message key="flight.landing.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc7.part2" bundle="${msg}" /></a><fmt:message key="travel.main.other.benefit.desc7.part3" bundle="${msg}" />
        </p>
      </li>--%>
    </ul>
	 </div>
</div>



  <div class="spacer3"></div>
  <!--<p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /></p>

  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p> -->
  <p class="h4-6"><fmt:message key="annual.quote.disclaimer2" bundle="${msg}" /></p>
</div>

<!-- <div id="other-benefits-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
  <h2 style="text-align: center;"><fmt:message key="workingholiday.main.other.benefit" bundle="${msg}" /></h2>
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc1" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc2" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc4.part1" bundle="${msg}" /> <a href="<fmt:message key="y5buddy.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.other.benefit.desc4.part2" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc4.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="travel.main.other.benefit.desc5.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.link" bundle="${msg}" />"><fmt:message key="travel.main.other.benefit.desc5.part2" bundle="${msg}" /></a> <fmt:message key="travel.main.other.benefit.desc5.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
    </div>
    <a class="prev" href="#other-benefits-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a>
    <a class="next" href="#other-benefits-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  </div>
  <div class="clearfix"></div>

  <div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="text-align:center;">
  	<div class="col-lg-12 col-md-12 col-xs-12">
    	<img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-bottom:15px;">
    </div>
    <div class="col-lg-12 col-md-12 col-xs-12">
    	<img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="" class="" style="margin-bottom:15px;">
    </div>
  </div>

  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /></p>

  <p class="h4-6"><fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p>
</div> -->

<!--/.container-->
</div>
</section>
<!--/#feature-->
<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="<fmt:message key="image.alt_8" bundle="${msg}" />"  />
            <h1><fmt:message key="travel.main.highlight1.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight1.heading.line2" bundle="${msg}" />
            </h1>
              <p><fmt:message key="travel.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="travel.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.highlight1.desc.part3" bundle="${msg}" /></p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="travel.main.highlight2.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="travel.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="<fmt:message key="image.alt_10" bundle="${msg}" />"  />
            <h1><fmt:message key="travel.main.highlight3.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="travel.main.highlight3.heading.line2" bundle="${msg}" /></h1>
            <p><fmt:message key="travel.main.highlight3.desc" bundle="${msg}" /></p>
            <!--<img src="resources/images/agoda-logo.png" alt=""/>--> </div>
        </div>
      </div>
    </div>
    <!--End Desktop Support-->
    <!--/.row-->
  </div>
  <!--/.container-->
</section>
<!--/#recent-works-->

<section id="recent-works-mob" class="hidden-lg hidden-md"  >
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="<fmt:message key="image.alt_8" bundle="${msg}" />"  />
                <h2><fmt:message key="travel.main.highlight1.heading.line1" bundle="${msg}" /><br/>
                  <fmt:message key="travel.main.highlight1.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="travel.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="travel.main.highlight1.desc.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap-mid text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
              <h2><fmt:message key="travel.main.highlight2.heading.line1" bundle="${msg}" /> <fmt:message key="travel.main.highlight2.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight2.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="<fmt:message key="image.alt_10" bundle="${msg}" />"  />
              <h2><fmt:message key="travel.main.highlight3.heading.line1" bundle="${msg}" /> <fmt:message key="travel.main.highlight3.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="travel.main.highlight3.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
    </div>
    <!--/.carousel-inner-->
  </div>
  <!--/.carousel-->
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>

<div class="content-disclaimer">
   <p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
</div>

<!--/#testiomonials-->
<section id="testimonials" class="hidden-sm hidden-xs">
  <div class="container">
    <!--desktop-testimonials-->
    <div class="row hidden-sm hidden-xs">
      <div class="center">
        <h2><fmt:message key="travel.main.testimonial.heading" bundle="${msg}" /></h2>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-left">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="travel.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="travel.main.testimonial.customer1.name" bundle="${msg}" /></h2>
            <h4><fmt:message key="travel.main.testimonial.customer1.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <div class="col-lg-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="travel.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="travel.main.testimonial.customer2.name" bundle="${msg}" /> </h2>
            <h4><fmt:message key="travel.main.testimonial.customer2.age" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <br>
      <div class="clearfix"></div>
      <p class="pad-none p1"><br>
      <fmt:message key="travel.main.testimonial.disclaimer" bundle="${msg}" /></p>
    </div>
    <!--/.row-->
    <!--/.desktop-testimonials-->

  </div>
  <!--/.container-->
</section>
<!--/#testiomonials-->

<!--/#testiomonials mob-->
<section id="testimonials-mob" class="hidden-lg hidden-md">
  <div class="carousel slide">
  <div class="center">
        <h2><fmt:message key="travel.main.testimonial.heading" bundle="${msg}" /></h2>
 </div>

    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <blockquote class="testimonial"></blockquote>
                <p><fmt:message key="travel.main.testimonial.customer1.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="travel.main.testimonial.customer1.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="travel.main.testimonial.customer1.age" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner travel-testimonial text-center">
                <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
                <p><fmt:message key="travel.main.testimonial.customer2.feedback" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="travel.main.testimonial.customer2.name" bundle="${msg}" /></h2>
                <h4><fmt:message key="travel.main.testimonial.customer2.age" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/.carousel-inner-->
  </div>
  <!--/.carousel-->
  <a class="prev" href="#testimonials-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#testimonials-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  <p class="p1" style="padding:20px;"><br>
      <fmt:message key="travel.main.testimonial.disclaimer" bundle="${msg}" /></p>
  </section>
<!--/#testiomonials mob-->

<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
    <div class="center">
      <h2><fmt:message key="travel.main.blog.heading" bundle="${msg}" /></h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="<fmt:message key="travel.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/blog-spots-view-snow.jpg" alt=""></a>
            <h3> <a href="<fmt:message key="travel.blog.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>

          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="<fmt:message key="travel.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/blog-kala-patthar.jpg" alt=""></a>
            <h3><a href="<fmt:message key="travel.blog.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>

          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="<fmt:message key="travel.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/blog-annual-travel-single-trip-travel-insurance.jpg" alt=""></a>
            <h3> <a href="<fmt:message key="travel.blog.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="travel.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>

          </div>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
    <!--/.row-->
     <p><fmt:message key="travel.main.blog.disclaimer" bundle="${msg}" /></p>



  </div>
  <!--/.container-->
</section>
<!--/#services-->

<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container bmg_flighttravel_main_container">
    <div class="row">
    <form name="frmTravelGetQuote" id="frmTravelGetQuoteBtm" commandName="travelQuote" action="" method="post" onsubmit="return flightValidateBtmTravel();">
      <div class="col-lg-12 col-md-12 pad-none-lg slide-form">
        <!-- <h2><fmt:message key="travel.main.quote.bottom.heading" bundle="${msg}" /></h2> -->
        <table class="table activation-form3">
          <tbody>
          <tr class="hide-html">
            <td><h3><fmt:message key="travel.main.quote.q1" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="travel.main.quote.q2" bundle="${msg}" /></h3></td>
            <td><h3><fmt:message key="travel.main.quote.q3" bundle="${msg}" /></h3></td>
            <td><div id="divPersonsBtm" style="visibility:hidden;">
                  <h3 class="h3-i">
                    <label id="lblPeopleBtm">0</label>
            <fmt:message key="travel.main.quote.total.people" bundle="${msg}" />
                    <label id="lblDaysBtm">0</label>
            <fmt:message key="travel.main.quote.total.days" bundle="${msg}" /></h3>
                </div>
             </td>
          </tr>
            <tr>
                <td class="" style="min-width: 210px;">
                   <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="travelTypeDropdownBtm">
                     <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">
                        <label class="select-label travel_type_label" style="cursor: pointer;white-space: nowrap;"><fmt:message key="travel.main.quote.pleaseselect" bundle="${msg}" /></label>
                        <span class="product_landing_custom_fa-caret-down">
                           <i class="fa fa-caret-down"></i>
                        </span>
                     </a>
                     <div class="dropdown-menu bdr1 pad-none" style="width: 190px;">
                       <div class="drop-content pad-none">
                           <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('single',$(this).html());"><fmt:message key="travel.main.quote.singletriptravel" bundle="${msg}" /></div>
                           <div class="product_landing_custom_selectbox" onclick="selectTravelCareType('annual',$(this).html());"><fmt:message key="travel.main.quote.annualtravel" bundle="${msg}" /></div>
                        </div>
                      </div>
                      <div class="clearfix"></div>

                      <input type="hidden" id="travelTypeBtm" name="travel_type" />
                   </div>
                </td>

              <td class="" style="min-width: 150px;">
                <div class="input-group date" id="tdp5" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trLeavingDate"  class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtStartDateBtm" <%-- value="${corrTravelQuote.trLeavingDate}" --%> placeholder="<fmt:message key="flight.main.quote.q1" bundle="${msg}" />" readonly>
                </div>
                </td>
              <td class="" style="min-width: 150px;">
                <div class="input-group date" id="tdp6" style="display: inline-block;background-color:#eee;"> <span class="input-group-addon in border-radius" style="display:inline-block;width:25%;"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                  <input type="text" name="trBackDate" class="datepicker form-control border-radius" style="display:inline-block;width:70%;" id="txtEndDateBtm" <%-- value="${corrTravelQuote.trBackDate}" --%> placeholder="<fmt:message key="flight.main.quote.q2" bundle="${msg}" />" readonly>
                </div>
                </td>
              <td class="" style="min-width: 190px;">
                <div class="dropdown  form-group drop-down wh-bg input-group-div marg-b2 dropup" id="myFWDropdownBtm">

                  <a href="#" class="dropdown-toggle col-lg-12 col-md-12" data-toggle="dropdown">  <label class="select-label"><fmt:message key="flight.main.quote.plan1.type" bundle="${msg}" />:</label> <label id="lblCountBtm"></label>&nbsp;<i class="fa fa-caret-down pull-right" style="position: absolute;right: 7px;"></i> </a>
                  <div class="dropdown-menu bdr1" style="width:355px;">
                    <div class="drop-content">
                      <div class="col-lg-6 col-md-6">
                         <label class="radio radio-warning radio-inline personal_plan_selectArea">
                          <input type="radio" name="planSelected" id="personal_plan_btm" data-id="btm" class="plan" value="personal"  <%=PersonalPlanChecked%> > <label for="personal_plan_btm"><fmt:message key="travel.main.quote.plan1" bundle="${msg}" /></label></label>


                      </div>
                      <div class="col-lg-6 col-md-6" style="margin-top: -5px;">
                          <label class="radio radio-warning radio-inline family_plan_selectArea">
                          <input type="radio" name="planSelected" id="family_plan_btm" data-id="btm" class="plan" value="family" <%=FamilyPlanChecked %>> <label for="family_plan_btm"><fmt:message key="travel.main.quote.plan2" bundle="${msg}" /></label><a
                        class="tool-tip show-inline-md"
                        data-toggle="tooltip" data-placement="bottom"
                        title="<fmt:message key="travel.main.quote.family.help" bundle="${msg}" />">
                        <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                        alt=""></a></label>


                      </div>
                      <div class="clearfix"></div>
                      <hr>
                      <!-- start of personal plan bottom spinner-->
                      <input type="hidden" name="" id="family_btm_count" value="${corrTravelQuote.totalFamilyTravellers}">
                      <div class="plan_spinner_btm" id="personal_plan_btm_spinner" <%=personalSpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan1.type" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn personal-data-updown">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalPersonalTraveller}</div>
                            <input type="hidden" name="totalPersonalTraveller" id="txtTravellersBtm" data-min="1" data-max="15" value="${corrTravelQuote.totalPersonalTraveller}"/>
                            <span class="input-group-btn data-up personal-data-updown">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtTravellersBtm" data-parent="personal"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                      </div>
                      <!-- end of personal plan bottom spinner-->
                      <div class="clearfix"></div>

                      <!-- start of family plan bottom spinner-->
                      <div class="plan_spinner_btm" id="family_plan_btm_spinner" <%=familySpinnerStyle%>>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan2.type1" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalAdultTraveller}</div>
                            <input type="hidden" name="totalAdultTraveller" id="txtAdultsBtm" data-min="1" data-max="2" value="${corrTravelQuote.totalAdultTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtAdultsBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6">
                          <h4><fmt:message key="travel.main.quote.plan2.type2" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalChildTraveller}</div>
                            <input type="hidden" name="totalChildTraveller" id="txtChildBtm" data-min="1" data-max="15" value="${corrTravelQuote.totalChildTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtChildBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-6 other-data-container">
                          <h4><fmt:message key="travel.main.quote.plan2.type3" bundle="${msg}" /></h4>

                        </div>
                        <div class="col-lg-6 other-data-container">
                          <div class="input-group number-spinner none-bd" > <span class="input-group-btn data-dwn">
                            <button class="btn btn-default btn-info drop-down-bg btn-new  btn-number" data-type="minus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-minus"></span> </button>
                            </span>
                            <div class="text-center drop-down-plus wd4 input-number">${corrTravelQuote.totalOtherTraveller}</div>
                            <input type="hidden" name="totalOtherTraveller" id="txtOtherBtm" data-min="0" data-max="15" value="${corrTravelQuote.totalOtherTraveller}"/>
                            <span class="input-group-btn data-up ">
                            <button class="btn btn-default btn-info drop-down-bg btn-new btn-number" data-type="plus" data-field="txtOtherBtm" data-parent="family"> <span class="glyphicon glyphicon-plus"></span> </button>
                            </span> </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-lg-12 child-notes">
                            <h4><fmt:message key="travel.main.quote.childnotes" bundle="${msg}" /></h4>
                        </div>
                        <div class="clearfix"></div>
                      </div>

                      <!-- start of family plan bottom spinner-->

                      <div class="clearfix"></div>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                </div>

        </td>
              <td class="">
                  <button type="submit" onclick="reset_bottom_submit()" class="two-test-002 border-radius btn btn-primary get-btn btn-color-ylw" style="line-height:32px;padding: 8px 20px !important;width: 100%;"><fmt:message key="travel.main.quote.bottom.action" bundle="${msg}" /></button>
                 </td>
            </tr>
            <tr class="product-landing-error-wrap">
              <td><span id="travelTypeBtmIn" style="color:red"> </span></td>
              <td><span id="startDateBtmIn" style="color:red"> </span></td>
              <td><span id="endDateBtmIn" style="color:red"> </span></td>
              <td><span id="travelCountBtmIn" class="hide-html">
                <label class="text-red"><fmt:message key="travel.main.quote.q3.error" bundle="${msg}" /></label>
                </span></td>
              <td></td>
            </tr>
          </tbody>
        </table>
      </div>
      <!--/.col-sm-6-->
      </form>
    </div>
    <!--/.row-->
  </div>
  <!--/.container-->
</section>
<!--/#middle-->

<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
    var e=$("#refreshed");
    if(e.val()=="no"){
        e.val("yes");
    }else{
        e.val("no");
        setGetParameter("refresh", "1")
    }
}

function setGetParameter(paramName, paramValue)
{
    var url = window.location.href;
    if (url.indexOf(paramName + "=") >= 0)
    {
        var prefix = url.substring(0, url.indexOf(paramName));
        var suffix = url.substring(url.indexOf(paramName));
        suffix = suffix.substring(suffix.indexOf("=") + 1);
        suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
        url = prefix + paramName + "=" + paramValue + suffix;
    }
    else
    {
    if (url.indexOf("?") < 0)
        url += "?" + paramName + "=" + paramValue;
    else
        url += "&" + paramName + "=" + paramValue;
    }
    window.location.href = url;
}

$(document).ready(function() {
	if(isMobile){
		$(".annualTravel_policy_item").click(function(){
			itemTop = $(this).offset();
			var html=$(this).children('.hidden-content').children().clone();
			$("#modal_policy_container").html(html);
			$("#policyCoveragePopup").modal("show");
            $("#policyCoveragePopup").on('show.bs.modal', function () {
                $('body').css("position", "inital");
                //$('body').css("position", "fixed");
                $('body').animate({scrollTop: itemTop.top - 60}, 0);
            });
            $("#policyCoveragePopup").on('hide.bs.modal', function () {
                //alert(itemTop.top);
                $('body').css("position", "initial");
                $('body').animate({scrollTop: itemTop.top - 60}, 0);
                //$('body').css("position", "relative");
            });
            $("#policyCoveragePopup").on('hidden.bs.modal', function () {
                $('body').attr("style", "");
            });
		});
	}
});
</script>
<style>
   @media screen and (max-width: 991px) {
   body {
      /* Hero image Position Fix*/
      padding-top: 50px;
   }
</style>

<div class="modal fade bs-example-modal-lg  in" id="policyCoveragePopup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content plan-modal">
        <div class="modal-body">
            <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
            <div id="modal_policy_container" style="padding-top: 10px;text-align: center;">
            </div>
      </div>
    </div>
  </div>
</div>
