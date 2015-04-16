<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<style>

</style>

<!--/#main-Content-->
<section>
<div class="container">
<div class="row">
<form:form name="frmTravelPlan" id="frmTravelPlan"
modelAttribute="travelQuote" method="post"
action="flight-upgrade-travel-summary">

<ol class="breadcrumb pad-none">
<li><a href="#"><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /> </a></li>
<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="flight.breadcrumb1.item5" bundle="${msg}" /></li>
</ol>
<div class="container ">
<div
class="col-lg-12 col-md-12 col-sm-12 col-xs-12 shop-tracking-status">
<div class="center wow fadeInDown animated"
style="visibility: visible;">
<h2><fmt:message key="flight.confirmation.jumbo" bundle="${msg}" /></h2>
</div>
<br> <br>
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
<br>
<br>
<br>
<div class="container pad-none bdr">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gray-bg1">
<h3>
<fmt:message key="flight.confirmation.msg.part1" bundle="${msg}" /> <strong><fmt:message key="flight.confirmation.msg.part2" bundle="${msg}" /></strong>
<fmt:message key="flight.confirmation.msg.part3" bundle="${msg}" /> <strong><fmt:message key="flight.confirmation.msg.part4" bundle="${msg}" /></strong><fmt:message key="flight.confirmation.msg.part5" bundle="${msg}" /><strong> <%-- <%=request.getAttribute("email")%> --%>

<%=request.getSession().getAttribute(
"setEmailForConfirmation")%>
</strong> <fmt:message key="flight.confirmation.msg.part6" bundle="${msg}" />
</h3>
<%-- <h4>Reference Number :<span>${createFlightPolicy.getReferenceNo()}</span></h4> --%>
<h4>
Policy Number: <span><%=request.getSession().getAttribute(
"policyNo")%></span>
</h4>

<div class="gray-bg1-content">
<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 pad-none">

<div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/FWDHKPH1A/" data-title="iFWD"></div>
</div>
<div class="col-lg-6 col-md-6">
<p>
<!-- Other sharing options -->
</p>
</div>
<div class="clearfix"></div>
</div>
</div>
<div class="clearfix"></div>
</div>
<div class="spacer2"></div>
<div class="container pad-none">
<div class="row-fluid">
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

<div
class="col-lg-6 col-md-6 col-sm-6 col-xs-12 plan-box">
<div class="plan-box2-inner travelproductbox"
id="box<%=i%>">
<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
<h2>
									Plan <%=travelQuote.getPlanName()[i]%>
									<%-- <input type="text" name="txtPlanName<%=i %>" values="<%=travelQuote.getPlanName()[i] %>"> --%>
									<br> <%if (travelQuote.getPlanName()[i].equals("A"))
									{%> <fmt:message key="flight.confirmation.upgrade.plan1.type" bundle="${msg}" /><br> HK$ 1,000,000 <fmt:message key="flight.confirmation.upgrade.plan1.medical" bundle="${msg}" /> 
								<%}	else{ %>
								<fmt:message key="flight.confirmation.upgrade.plan2.type" bundle="${msg}" /><br> HK$	500,000 <fmt:message key="flight.confirmation.upgrade.plan2.medical" bundle="${msg}" />
									<%} %>
									
								</h2>
</div>
<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
<br>
<h3>HK$</h3>
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
<span><i class="fa fa-plus"></i> <a href="#"
class="fwdpanel-minimize uline"><fmt:message key="flight.confirmation.upgrade.plan1.benefits" bundle="${msg}" />  </a> </span>
</h4>
</div>

<div class="fwdpanel-body" style="display: none;">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<p>
			<i class="fa fa-plus"></i> <fmt:message key="flight.confirmation.upgrade.plan1.benefits.desc1" bundle="${msg}" /> <br> 
			<i class="fa fa-plus"></i> <fmt:message key="flight.confirmation.upgrade.plan1.benefits.desc2" bundle="${msg}" /><br> 
			<i class="fa fa-plus"></i> <fmt:message key="flight.confirmation.upgrade.plan1.benefits.desc3" bundle="${msg}" /><br>
			<i class="fa fa-plus"></i> <fmt:message key="flight.confirmation.upgrade.plan1.benefits.desc4" bundle="${msg}" /><br>
		</p>
	</div>
</div>
<div class="clearfix"></div>
</div>
<h5> <a href="javascript:void(0)" onclick="setPriceAndColor('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getToalDue()[i]%>')"><fmt:message key="flight.confirmation.upgrade.action" bundle="${msg}" /></a> </h5>
</div>
</div>


<%
}
}
%>
<!-- End Travel Plan -->

</div>
</div>


<input type="hidden" name="totalAdultTraveller"
id="totalAdultTraveller"
value="${createFlightPolicy.getTotalAdultTraveller()}">
<input type="hidden" name="totalChildTraveller"
id="totalChildTraveller"
value="${createFlightPolicy.getTotalChildTraveller()}">
<input type="hidden" name="totalOtherTraveller"
id="totalOtherTraveller"
value="${createFlightPolicy.getTotalOtherTraveller()}">
<input type="hidden" name="returnDate" id="returnDate"
value="${createFlightPolicy.getReturnDate()}">
<input type="hidden" name="departureDate" id="departureDate"
value="${createFlightPolicy.getDepartureDate()}">
<input type="hidden" name="days"
value="${createFlightPolicy.getDays()}">
<input type="hidden" name="travellerCount"
value="${createFlightPolicy.getTravellerCount()}">
<input type="hidden" name="fullName" value="${fullName}">
<input type="hidden" name="hkid" value="${hkid}">
<input type="hidden" name="mobileNo" value="${mobileNo}">
<input type="hidden" name="emailAddress" value="${emailAddress}">




<input type="hidden" name="upgradeStatus" value="true">
<!-- End Travel Create Travel Plan Attribute -->
<input type="hidden" name="planName" id="inputseletedplanname"
value="">

<!-- Set total dues after click on plan -->
<input type="hidden" name="selectedAmountDue"
id="inputseletedDueAmount" value="">

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

function setPriceAndColor(id, planName, selectedPrice) {
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

	

	$('#frmTravelPlan').submit();
/* $.ajax({
type : 'POST',
url : 'travel-summary',
data : $('#frmTravelPlan').serialize()
});  */

}
</script>

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->