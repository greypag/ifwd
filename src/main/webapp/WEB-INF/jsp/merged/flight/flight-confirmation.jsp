<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<style>

</style>

<script>
perventRedirect=true;
</script>

<!--/#main-Content-->
<section>
<div class="container">
<div class="row">
<form:form name="frmTravelPlan" id="frmTravelPlan" modelAttribute="travelQuote" method="post" action="${pageContext.request.contextPath}/${language}/flight-upgrade-travel-summary">

<div class="container ">
<div id="tr-steps"
class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
<div class="center wow fadeInDown animated"
style="visibility: visible;">
<h2><fmt:message key="flight.confirmation.jumbo" bundle="${msg}" /></h2>
</div>
<br>
<div class="order-status">
<div class="order-status-timeline-new">
								<!--
								There can be n '.order-status-timeline-completion'
								dots-inactive and dots-active color the dots -->
								<div class="order-status-timeline-completion dots-active"></div>
								<div class="order-status-timeline-completion dots-active"></div>
								
							</div>
<div
class="image-order-status image-order-status-new  img-circle">
<div class="icon">1</div>
<span class="status status-working"><fmt:message key="flight.breadcrumb2.item1" bundle="${msg}" /></span>
</div>
<div
class="image-order-status image-order-status-active  img-circle">
<div class="icon">2</div>
<span class="status status-working"><fmt:message key="flight.breadcrumb2.item2" bundle="${msg}" /></span>
</div>
<div class="image-order-status image-order-status-intransit active  img-circle">
	<div class="icon">3</div>
	<span class="status min-left"><fmt:message key="flight.breadcrumb2.item3" bundle="${msg}" /></span>
</div>
</div>
</div>
</div>
<ol class="breadcrumb pad-none">
<li><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
<li><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" />  <i class="fa fa-caret-right"></i></li>
<li><fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
<li><fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /></li>
<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="flight.breadcrumb1.item5" bundle="${msg}" /></li>
</ol>
<div class="container pad-none bdr">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none" style="background-color: #f5f5f5;">
    <div style="width:80%;margin-left:10%">
		<h3 class="bmg-confirmation-h3">
			<fmt:message key="flight.confirmation.msg.part1" bundle="${msg}" />
			<fmt:message key="flight.confirmation.msg.part2" bundle="${msg}" />
			<fmt:message key="flight.confirmation.msg.part3" bundle="${msg}" />
			<fmt:message key="flight.confirmation.msg.part4" bundle="${msg}" />
			<fmt:message key="flight.confirmation.msg.part5" bundle="${msg}" />
			<strong><%=request.getSession().getAttribute("setEmailForConfirmation")%></strong>
			<fmt:message key="flight.confirmation.msg.part6" bundle="${msg}" />
		</h3>
		<%-- <h4>Reference Number :<span>${createFlightPolicy.getReferenceNo()}</span></h4> --%>
		<h4 class="bmg-confirmation-h4">
			<strong><fmt:message key="flight.confirmation.policyNo" bundle="${msg}" /></strong> <span><%=request.getSession().getAttribute(
			"policyNo")%></span>
		</h4>
		
		<div class="fwd_partner_title"><fmt:message key="fwd.partners" bundle="${msg}" /></div>
		<div class="hidden-xs hidden-sm">
            <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class=" " style="margin-right:15px; margin-bottom: 20px;">
        </div>
        <div class="hidden-lg hidden-md" style="text-align:center;">
            <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class=" " style="margin-bottom:20px;"><br/>
        </div>
		
		<div class="gray-bg1-content" style="padding:0px !important">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 pad-none">
			     <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/flight-insurance/sharing/" data-title="iFWD"></div>
			</div>
			<div class="col-lg-6 col-md-6">
				<p>
				<!-- Other sharing options -->
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
</div>
<div class="spacer2"></div>
<div class="container pad-none">
	<div class="row-fluid">
	   <div style="width:80%;margin-left:10%">
		<div class="center " style="visibility: visible;">
			<h4 class="center-h2"><fmt:message key="flight.confirmation.heading" bundle="${msg}" /></h4>
			<h3 class="center-h3"><fmt:message key="flight.confirmation.subheading" bundle="${msg}" /></h3>
			<br>
		</div>
		<!--Start Travel Plan  -->
		
		<!-- HTML Travel Plans -->
		
		<!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 plan-box ">
		<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
		<h2>
		PLAN A<br> Superior Cover<br> HK$ 1,000,000 Medical
		</h2>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
		<br>
		<h3>HK$</h3>
		<h6>420</h6>
		<p>
		<del> 540</del>
		</p>
		</div>
		<div class="clearfix"></div>
		<div class="fwdpanel">
		<div class="fwdpanel-heading">
		<h4 class="benefits">
		<span><i class="fa fa-plus"></i> 
		<button href="#"
		class="fwdpanel-minimize uline color-wht">See All
		Benefits </button> </span>
		</h4>
		</div>
		<div class="fwdpanel-body" style="display: none;">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<p class="color-wht">
		<i class="fa fa-plus"></i> Hospital or quarantine cash
		$10,000<br> <i class="fa fa-plus"></i>Worldwide
		emergency assistance Fully Covered <br> <i
		class="fa fa-plus"></i> Rental vehicle excess $5,000 <br>
		<i class="fa fa-plus"></i> Golfer Hole in one $3,000 <br>
		</p>
		</div>
		</div>
		<div class="clearfix"></div>
		</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 plan-box2 ">
		<div class="plan-box2-inner">
		<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
		<h2>
		PLAN B<br> Standard Cover<br> HK$ 500,000 Medical
		</h2>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
		<br>
		<h3>HK$</h3>
		<h6>285</h6>
		<p>
		<del> 376</del>
		<p>
		</div>
		<div class="clearfix"></div>
		<div class="fwdpanel">
		<div class="fwdpanel-heading">
		<h4 class="benefits">
		<span><i class="fa fa-plus"></i> <button
		class="fwdpanel-minimize uline">See All Benefits </button> </span>
		</h4>
		</div>
		<div class="fwdpanel-body" style="display: none;">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<p>
		<i class="fa fa-plus"></i> Hospital or quarantine cash
		$5,000 <br> <i class="fa fa-plus"></i> Worldwide
		emergency assistance Fully Covered<br> <i
		class="fa fa-plus"></i> Rental vehicle excess $3,000<br>
		<i class="fa fa-plus"></i> Golfer Hole in one $1,000<br>
		</p>
		</div>
		</div>
		<div class="clearfix"></div>
		</div>
		</div>
		</div> -->
		
		<!-- Commented code for upgrade plan to travel -->
		
		<%
		QuoteDetails travelQuote = (QuoteDetails) request
		.getAttribute("quoteDetails");
		if (travelQuote.getPlanName().length > 0) {
		for (int i = 0; i < travelQuote.getPlanName().length; i++) {
		%>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 plan-box">
		<div class="plan-box2-inner travelproductbox" id="box<%=i%>">
		<div class="col-lg-7 col-md-7 col-sm-6 col-xs-6 pad-none">
		<h2>
											Plan <%=travelQuote.getPlanName()[i]%>
											<%-- <input type="text" name="txtPlanName<%=i %>" values="<%=travelQuote.getPlanName()[i] %>"> --%>
											<br> <%if (travelQuote.getPlanName()[i].equals("A"))
											{%> <fmt:message key="flight.confirmation.upgrade.plan1.type" bundle="${msg}" /><br><fmt:message key="flight.confirmation.upgrade.plan1.medical" bundle="${msg}" /> 
										<%}	else{ %>
										<fmt:message key="flight.confirmation.upgrade.plan2.type" bundle="${msg}" /><br>
											<fmt:message key="flight.confirmation.upgrade.plan2.medical" bundle="${msg}" />
											<%} %>
											
										</h2>
		</div>
		<div class="col-lg-5 col-md-5 col-sm-6 col-xs-6" style="text-align: right;">
		<h3><fmt:message key="dollar.hkd" bundle="${msg}" /></h3>
		<span id="totalDue"></span>
		<h6><%=String.format("%.2f",Double.parseDouble(travelQuote.getToalDue()[i]))%></h6>
		    
		<p>
		<del><%=String.format("%.2f",Double.parseDouble(travelQuote.getGrossPremium()[i]))%></del> 
		</p>
		</div>
		<div class="clearfix"></div>
		<div class="fwdpanel">
		<div class="fwdpanel-heading">
		<h4 class="benefits">
		<span><a href="#"
		class="fwdpanel-minimize uline"><i class="fa fa-plus"></i> <fmt:message key="flight.confirmation.upgrade.plan1.benefits" bundle="${msg}" />  </a> </span>
		</h4>
		</div>
		<div class="fwdpanel-body clearfix" style="display: none;">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<ul>
					<%
						String planBenefitDesc1Key = "flight.confirmation.upgrade.plan" + (i+1) + ".benefits.desc1";
						String planBenefitDesc2Key = "flight.confirmation.upgrade.plan" + (i+1) + ".benefits.desc2";
						String planBenefitDesc3Key = "flight.confirmation.upgrade.plan" + (i+1) + ".benefits.desc3";
						String planBenefitDesc4Key = "flight.confirmation.upgrade.plan" + (i+1) + ".benefits.desc4";
					%>
					<li><fmt:message key="<%=planBenefitDesc1Key%>" bundle="${msg}" /></li> 
					<li><fmt:message key="<%=planBenefitDesc2Key%>" bundle="${msg}" /></li> 
					<li><fmt:message key="<%=planBenefitDesc3Key%>" bundle="${msg}" /></li>
					<li><fmt:message key="<%=planBenefitDesc4Key%>" bundle="${msg}" /></li>
				</ul>
			</div>
		</div>
		</div>
		<h5>
		    <!-- joe -->
			<a href="#" class="bdr-curve btn btn-primary bck-btn" id="confirm-popup<%=i%>" data-target="#confirm-popup" data-toggle="modal" onclick="perventRedirect=false;setPriceAndColorNotSubmit('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=String.format("%.2f",Double.parseDouble(travelQuote.getToalDue()[i]))%>','<%=String.format("%.2f",Double.parseDouble(travelQuote.getGrossPremium()[i]))%>')">
			   <fmt:message key="flight.confirmation.upgrade.action" bundle="${msg}" />
			</a>
		</h5>
		<!--
		this is the old button 
		<h5><a href="javascript:void(0)" class="bdr-curve-none btn btn-primary bck-btn" onclick="perventRedirect=false;setPriceAndColor('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=String.format("%.2f",Double.parseDouble(travelQuote.getToalDue()[i]))%>')"><fmt:message key="flight.confirmation.upgrade.action" bundle="${msg}" /></a> </h5>
		-->
		</div>
		</div>
		<%
		}
		}
		%>
		
		<!-- End Travel Plan -->
		</div>
	</div>
</div>

<div class="modal fade details-popup" id="confirm-popup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal" style="top:30px;">
            <a class="close" aria-label="Close" data-dismiss="modal">
               <span aria-hidden="true" style="font-size:30px;">×</span>
            </a>
            
            
            <div class="declaration-content">
                <h4 class="h4-2"><fmt:message key="travel.details.declarations.heading" bundle="${msg}" /></h4>
                
                <div class="checkbox">
                    <input id="checkbox1" name="checkbox1" type="checkbox"> 
                    <label for="checkbox1">
                        <fmt:message key="travel.details.declarations.tnc" bundle="${msg}" /> 
                        <ol class="ol-disclaimer">
                            <li><fmt:message key="travel.details.declarations.tnc.desc1" bundle="${msg}" /></li>
                            <li><fmt:message key="travel.details.declarations.tnc.desc2" bundle="${msg}" /></li>
                            <li><fmt:message key="travel.details.declarations.tnc.desc3" bundle="${msg}" /></li>
                            <li><fmt:message key="travel.details.declarations.tnc.desc4" bundle="${msg}" /></li>
                            <li><fmt:message key="travel.details.declarations.tnc.desc5" bundle="${msg}" /></li>
                        </ol>
                        
                    </label>
                </div>  
                <span id="chk1" class="text-red"></span>
                <h3 class="error-hide1" style='display:none; color:red; font-size:15px;'>
                    <fmt:message key="general.tnc.error" bundle="${msg}" />
                </h3>     
                
                <div class="checkbox">
                    <input id="checkbox2" name="checkbox2" type="checkbox"> <label
                        for="checkbox2">
                        <fmt:message key="travel.details.declarations.PICS.part1" bundle="${msg}" /> <a
                        href="<fmt:message key="PICS.link" bundle="${msg}" />"
                        class="sub-link" target="_blank"><fmt:message key="travel.details.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="travel.details.declarations.PICS.part3" bundle="${msg}" />
                        


                        </label>
                </div>
                <span id="chk2" class="text-red"></span>
                <h3 class="error-hide2" style='display:none; color:red; font-size:15px;'>
                    <fmt:message key="general.PICS.error" bundle="${msg}" />
                </h3>
                <hr/>
                <div>
                     <label>
                    <fmt:message key="travel.details.declarations.PDPO" bundle="${msg}" /> <br>
                    </label>
                </div>
                 <div class="checkbox">
                    <input id="checkbox3" name="checkbox3" type="checkbox"> <label

                        for="checkbox3"> <fmt:message key="travel.details.declarations.PDPO.option1" bundle="${msg}" /><br>
                        
                    </label>
                </div>
                <div class="checkbox">
                    <input id="checkbox4" name="checkbox4" type="checkbox"> <label
                        for="checkbox4">

                        <fmt:message key="travel.details.declarations.PDPO.option2" bundle="${msg}" /><br>
                        
                    </label>
                </div>
                
                <div class="checkboxBubble">
                    <fmt:message key="travel.details.declarations.PDPO.warning" bundle="${msg}" />
                </div>

                <script type="text/javascript">
                function showBubble(){
                    if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                        $(".checkboxBubble").fadeIn();
                    }else{
                        $(".checkboxBubble").fadeOut();
                    }
                }
                
                $("#checkbox3").change(function() {
                    showBubble();
                });
                
                $("#checkbox4").change(function() {
                    showBubble();
                });
                </script>
                <!-- Provision Link -->
                <p class="padding1 workingholiday-plan-disclaimer"><fmt:message key="travel.main.other.disclaimer.part1" bundle="${msg}" />
				<a class="sub-link" href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf" target="_blank">
				<fmt:message key="travel.main.other.disclaimer.part2" bundle="${msg}" /></a> 
				<fmt:message key="travel.main.other.disclaimer.part5" bundle="${msg}" /> 
				<a href="<fmt:message key="travel.brochure.link" bundle="${msg}" />" target="_blank"> 
					<u><fmt:message key="travel.main.other.disclaimer.part6" bundle="${msg}" /></u>
				</a> 
				<fmt:message key="travel.main.other.disclaimer.part3" bundle="${msg}" /><br>
				<fmt:message key="travel.main.other.disclaimer.part4" bundle="${msg}" /></p>
				
				<!-- submit -->
				<input style="width:250px; margin-top:50px;" type="button" onclick="return checkbox();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="travel.action.next" bundle="${msg}" />" />
				<script>
				function checkbox() {
					optIn1 = "false"
		            optIn2 = "false"
		            
		            
		            if($('#checkbox1').is(':checked')){
		                optIn1 = "true";    
		            }
		            if($('#checkbox2').is(':checked')){
		                optIn2 = "true";    
		            }
		            
		            
		            if(optIn1 == "true" && optIn2 == "true"){
		            	$(".error-hide1").hide();
		            	$(".error-hide2").hide();
		            	
		            	$('#frmTravelPlan').submit();
		            }
		            
		            
		            
	            	if(optIn1 == "false"){
	            		$(".error-hide1").show();     	
	            	}else{
	            		$(".error-hide1").hide();
	            	}
	            	
	                if(optIn2 == "false"){
	                	$(".error-hide2").show();   
                    }else{
                    	$(".error-hide2").hide();
                    }
		            	
		            
		            
		            
				}
				</script>
            </div>
        </div>
     </div>
</div>

<input type="hidden" name="totalAdultTraveller"
id="totalAdultTraveller"
value="${createFlightPolicy.totalAdultTraveller}">
<input type="hidden" name="totalChildTraveller"
id="totalChildTraveller"
value="${createFlightPolicy.totalChildTraveller}">
<input type="hidden" name="totalOtherTraveller"
id="totalOtherTraveller"
value="${createFlightPolicy.totalOtherTraveller}">
<input type="hidden" name="returnDate" id="returnDate"
value="${createFlightPolicy.returnDate}">
<input type="hidden" name="departureDate" id="departureDate"
value="${createFlightPolicy.departureDate}">
<input type="hidden" name="days"
value="${createFlightPolicy.days}">
<input type="hidden" name="travellerCount"
value="${createFlightPolicy.travellerCount}">
<input type="hidden" name="fullName" value="${fullName}">
<input type="hidden" name="hkid" value="${hkid}">
<input type="hidden" name="mobileNo" value="${mobileNo}">
<input type="hidden" name="emailAddress" value="${emailAddress}">
<input type="hidden" name="optIn1" value="${optIn1}">
<input type="hidden" name="optIn2" value="${optIn2}">
<input type="hidden" name="upgradeStatus" value="true">
<!-- End Travel Create Travel Plan Attribute -->
<input type="hidden" name="planName" id="inputseletedplanname"
value="">

<!-- Set total dues after click on plan -->
<input type="hidden" name="selectedAmountDue"
id="inputseletedDueAmount" value="">
<input type="hidden" name="selectPlanPremium"
id="inputselectPlanPremium" value="">
</form:form>
</div>
<!--/.row-->
</div>
<!--/.container-->
<br>
</section>
<!--------/end- Main Content------------>

<script>
$(document).ready(function() {

$(".travelproductbox").animate({
"background-color" : "#000"
}, 3000);

});

function setPriceAndColor(id, planName, selectedPrice, selectPlanPremium) {
	var selected_div;
	var idArray = [];

	$('.travelproductbox').each(function() {
		idArray.push(this.id);
	});

	var index = idArray.indexOf(id);
	if (index > -1) {
		idArray.splice(index, 1);
		
	}

	$('#inputseletedplanname').val(planName);
	$('#inputseletedDueAmount').val(selectedPrice);
	$('#inputselectPlanPremium').val(selectPlanPremium);
	

	$('#frmTravelPlan').submit();
/* $.ajax({
type : 'POST',
url : 'travel-summary',
data : $('#frmTravelPlan').serialize()
});  */

}



function setPriceAndColorNotSubmit(id, planName, selectedPrice, selectPlanPremium) {
    var selected_div;
    var idArray = [];

    $('.travelproductbox').each(function() {
        idArray.push(this.id);
    });

    var index = idArray.indexOf(id);
    if (index > -1) {
        idArray.splice(index, 1);
        
    }

    $('#inputseletedplanname').val(planName);
    $('#inputseletedDueAmount').val(selectedPrice);
    $('#inputselectPlanPremium').val(selectPlanPremium);
    

    //$('#frmTravelPlan').submit();
/* $.ajax({
type : 'POST',
url : 'travel-summary',
data : $('#frmTravelPlan').serialize()
});  */

}


</script>


<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>

<!--End of addthis -->
<script type=text/javascript>
   var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
   document.write('<scr'+'ipt src="', hostProtocol+
   '://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');


   var params = new Array();
   params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
   params[1]='type=Registration_Flight';
   params[2]='val=${dueAmount}';
   params[3]='orderId=<%=request.getSession().getAttribute("policyNo")%>';
   if ('${language}'==='en'){
	   params[4]='promoCode=Regis_Flight EN_Sc';
   } else {
	   params[4]='promoCode=Regis_Flight ZH_Sc';   
   }
   params[5]='valueCurrency=USD';
   params[6]='GCID='; //For Live Tracking only
   params[7]='kw='; //For Live Tracking only
   params[8]='product='; //For Live Tracking only
   k_trackevent(params,'5198');
</script>

<noscript>
   	<c:choose>
		<c:when test="${language=='en'}">
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Flight&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Flight EN_Sc&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
   		</c:when>
   		<c:otherwise>
   			<img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration_Flight&val=${dueAmount}&orderId=${transNo}&promoCode=Regis_Flight ZH_Sc&valueCurrency=USD&GCID=&kw=&product=" width="1" height="1">
   		</c:otherwise>
   </c:choose>
</noscript>
<script>
$(document).ready(function() {
	ga('create', 'UA-60032236-1', 'auto');
	ga('require', 'ecommerce');
	ga('ecommerce:addTransaction', {
	  'id': '<%=request.getSession().getAttribute("policyNo")%>', // Transaction ID. Required.
	  'revenue': '${dueAmount}', // Grand Total.
	  'affiliation': 'Flight', // Insurance type, e.g. Life
	   'currency': 'HKD'
	  });
	ga('ecommerce:addItem', {
	      'id': '<%=request.getSession().getAttribute("policyNo")%>', // Transaction ID. Required
	      'name': 'FlightCare', // Product name. Required
	      'category': 'Flight', // Category or variation
	      'price': '${dueAmount}', // Unit price
	      'quantity': '1',
	      'currency': 'HKD'
	    });
	ga('ecommerce:send');
});

</script>