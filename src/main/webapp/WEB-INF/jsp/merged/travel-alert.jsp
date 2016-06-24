<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages" var="msg" />
<!--Modal in Customer Service Centre-->
<div class="modal fade" role="dialog" aria-labelledby="travel-alert" id="travel-alert" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog teaserSurvey" role="document">
		<div class="modal-content teaserSurvey clearfix">
			<div class="modal-header teaserSurvey">
				<!--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
				<h2><fmt:message key="travelAlert.modal.header" bundle="${msg}" /></h2>
			</div>
			<div class="modal-body teaserSurvey">
				<p class="registered"><fmt:message key="travelAlert.modal.Body" bundle="${msg}" /></p>
				<!--<button type="submit" class="btn btn-white btn-thank-you" id="teaser-mmodal-submit">Submit</button>-->
				<button type="button" class="btn btn-orange" id="travel-alert-proceed"><fmt:message key="travelAlert.modal.btnProcess" bundle="${msg}" /></button>
				<button type="button" class="btn btn-orange" id="travel-alert-close"><fmt:message key="travelAlert.modal.btnBack" bundle="${msg}" /></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->	
</div><!-- /.modal -->
<script type="text/javascript">

$(function() {
	var currentController = "<%=request.getAttribute("controller").toString()%>";
	$('#travel-alert').modal('show');
	$( "#travel-alert-close" ).on( "click", function() {
		$('#travel-alert').modal('hide');
		if(currentController=="Oversea"){
			window.location.replace("../overseas-study-insurance");
		}else if(currentController=="Travel"){
			window.location.replace("../travel-insurance");
		}else if(currentController=="WorkingHoliday"){
			window.location.replace("../working-holiday-insurance");	
		}
	});
	$( "#travel-alert-proceed" ).on( "click", function() {
		$('#travel-alert').modal('hide');
		//console.log(document.referrer);		
	});	
});
</script>