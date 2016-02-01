<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="messages" var="msg" />

<div class="modal fade" id="session-alert"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg fwd-modal-wrapper">
            <div class="modal-content">
<!--                 <div class="modal-header"> -->
<!--                   <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                 </div> -->
                <div class="modal-body text-center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="gary h5 separator"><fmt:message key="session.alert.headline" bundle="${msg}" /></div>
                    <div class="gary h6"><fmt:message key="session.alert.headline2" bundle="${msg}" /></div>
                    <div id="session-alert-counter" class="separator"></div>
                    <button id="session-extend" type="button" class="cta-font cta-apply cta-orange" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button>
                    <button id="session-save" type="button" class="cta-font cta-apply cta-gary" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button>                  
                </div>
<!--                 <div class="modal-footer"> -->
<%--                   <button id="session-extend" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button> --%>
<%--                   <button id="session-save" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button> --%>
<!--                 </div> -->
            </div>
        </div>
</div>

 
<div class="session-debug hidden-xs hidden-sm hidden-md hidden-lg"> 
${(pageContext.session.lastAccessedTime-pageContext.session.creationTime)/1000}   
<c:out value="${pageContext.session.id}"/>

<h3>Session date values formatted as Dates</h3>

<jsp:useBean id="timeValues" class="java.util.Date"/>

<c:set target="${timeValues}" value="${pageContext.session.creationTime}" property="time"/>
The creation time: <fmt:formatDate value="${timeValues}" type="both" dateStyle="medium" />

<br><br>

<c:set target="${timeValues}" value="${pageContext.session.lastAccessedTime}" property="time"/>
The last accessed time:
<fmt:formatDate value="${timeValues}" type="both" dateStyle="short" />

<c:out value="${timeValues}"/>
<%
HttpSession sessionHEHE = request.getSession(true);
//sessionHEHE.setMaxInactiveInterval(60);
out.println(sessionHEHE.getMaxInactiveInterval());
%>
</div>


<script type="text/javascript">
   //console.log(${pageContext.session.creationTime/1000});
   var sessionTimer = ${pageContext.session.creationTime} + ${pageContext.session.maxInactiveInterval * 1000};
   
   /*$("#session-alert-counter").countdown(new Date(sessionTimer), function(event) {
       $(this).html(
         event.strftime('<div class="h1 orange">%M</div> <div class="h6 gary">min</div> ' + '<div class="h1 orange">%S</div> <div class="h6 gary">sec</div> ')
       );
     });*/
   $("#session-alert-counter").countdown(new Date(sessionTimer),{elapse: true}).on('update.countdown', function(event) {
       if(event.elapsed){
    	   <%-- window.location = "<%=request.getContextPath()%>"; --%>
    	   $(this).html(event.strftime('Expired after<div class="h1 orange">%M</div> <div class="h6 gary">min</div> ' + '<div class="h1 orange">%S</div> <div class="h6 gary">sec</div> ')); 
       }else{
    	   $(this).html(event.strftime('Expire in<div class="h1 orange">%M</div> <div class="h6 gary">min</div> ' + '<div class="h1 orange">%S</div> <div class="h6 gary">sec</div> ')); 
       }
   });     
   $( document ).ready(function() {
	   console.log((new Date(sessionTimer).getTime() - new Date().getTime())/1000);
	   if((new Date(sessionTimer).getTime() - new Date().getTime())/1000 <= 500){
		    $('#session-alert').modal('show');
	   }
   });
   /*function isSessionExpire(mySession){
	   var timeDiff = (new Date(mySession).getTime() - new Date().getTime())/1000;
	   if( timeDiff <= 500 && timeDiff >= 1 ){
		   return true;
	   }else {
		   return false;
	   }
   }*/
</script>