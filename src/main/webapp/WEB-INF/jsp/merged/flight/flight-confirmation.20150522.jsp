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

<ol class="breadcrumb pad-none">
<li><a href="#"><fmt:message key="flight.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item2" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item3" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
<li><a href="#"><fmt:message key="flight.breadcrumb1.item4" bundle="${msg}" /> </a></li>
<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="flight.breadcrumb1.item5" bundle="${msg}" /></li>
</ol>
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
<div class="container pad-none bdr">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gray-bg1">
<h3>
<fmt:message key="flight.confirmation.msg.part1" bundle="${msg}" /> <fmt:message key="flight.confirmation.msg.part2" bundle="${msg}" />
<fmt:message key="flight.confirmation.msg.part3" bundle="${msg}" /> <fmt:message key="flight.confirmation.msg.part4" bundle="${msg}" /> <br> <fmt:message key="flight.confirmation.msg.part5" bundle="${msg}" /> <%-- <%=request.getAttribute("email")%> --%>

<%=request.getSession().getAttribute(
"setEmailForConfirmation")%>
 <fmt:message key="flight.confirmation.msg.part6" bundle="${msg}" />
</h3>
<%-- <h4>Reference Number :<span>${createFlightPolicy.getReferenceNo()}</span></h4> --%>
<h4>
<fmt:message key="flight.confirmation.policyNo" bundle="${msg}" /> <span><%=request.getSession().getAttribute(
"policyNo")%></span>
</h4>

<div class="gray-bg1-content">
<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 pad-none">

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
<div class="clearfix"></div>
</div>
<div class="spacer2"></div>

<!--Start Travel Plan  -->

<!-- HTML Travel Plans -->

<!-- Commented code for upgrade plan to travel -->

<!-- End Travel Plan -->

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
</script>

<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>
<!--End of addthis -->