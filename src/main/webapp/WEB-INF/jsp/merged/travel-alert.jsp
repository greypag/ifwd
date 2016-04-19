<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages" var="msg" />
<div class="modal fade" id="travel-alert" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg fwd-modal-wrapper">
            <div class="modal-content">
                <div class="button-wrapper">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body text-center">
                    <div class="gary h5 separator"><fmt:message key="session.alert.headline" bundle="${msg}" /></div>                   
                    <!--<div class="gary h6"><fmt:message key="session.alert.headline2" bundle="${msg}" /></div>-->
                    <div id="session-alert-counter" class="separator"></div>
                    <button id="travel-alert-close" type="button" class="cta-font cta-apply cta-orange" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button>
                    <!--<button id="session-save" type="button" class="cta-font cta-apply cta-gary" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button>-->                  
                </div>
<!--                 <div class="modal-footer"> -->
<%--                   <button id="session-extend" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button> --%>
<%--                   <button id="session-save" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button> --%>
<!--                 </div> -->
            </div>
        </div>
</div>
<script type="text/javascript">
$(function() {
	$('#travel-alert').modal('show');
	$( "#travel-alert-close" ).on( "click", function() {
		$('#travel-alert').modal('hide');
	});
});
</script>