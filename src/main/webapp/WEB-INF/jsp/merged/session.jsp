<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,com.ifwd.fwdhk.model.UserDetails" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<div class="modal fade" id="session-alert"
        tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
        aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg fwd-modal-wrapper">
            <div class="modal-content">
<!--                 <div class="modal-header"> -->
<!--                   <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                 </div> -->
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-body text-center">
                    <div class="gary h5 separator"><fmt:message key="session.alert.headline" bundle="${msg}" /></div>
                    <div class="gary h6"><fmt:message key="session.alert.headline2" bundle="${msg}" /></div>
                    <div id="session-alert-counter" class="separator"></div>
                    <button id="session-extend" type="button" class="cta-font cta-apply cta-orange" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button>
                    <!--<button id="session-save" type="button" class="cta-font cta-apply cta-gary" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button>-->                  
                </div>
<!--                 <div class="modal-footer"> -->
<%--                   <button id="session-extend" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.continue" bundle="${msg}" /></button> --%>
<%--                   <button id="session-save" type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="session.alert.btn.home" bundle="${msg}" /></button> --%>
<!--                 </div> -->
            </div>
        </div>
</div>

 
<div class="session-debug hidden-xs hidden-sm hidden-md hidden-lg"> 
    <h3>Session ID:<c:out value="${pageContext.session.id}"/></h3>
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
	if (session.getAttribute("userDetails") != null && request.getAttribute("controller") == "SavieOnline" && request.isRequestedSessionIdValid()==true) {
	    session.setMaxInactiveInterval(1800);
	}
	long creationTime = session.getLastAccessedTime() + (session.getMaxInactiveInterval()* 1000);
	long now = new Date().getTime();
	
	%>
</div>


<script type="text/javascript">
   console.log(${pageContext.session.maxInactiveInterval});
   var sessionTimer = <%=creationTime%>;
   <% if (session.getAttribute("userDetails") != null && request.getAttribute("controller") == "SavieOnline" && request.isRequestedSessionIdValid()==true) {%>
   $("#session-alert-counter").countdown(new Date(sessionTimer),{elapse: true}).on('update.countdown', function(event) {	   
       if(event.elapsed){
           $(this).html('Expired');
           $('#session-extend').prop('disabled', true);
           location.replace("<%=request.getContextPath()%>/${language}");
           //$(this).html(event.strftime('Expired after<div class="h1 orange">%M</div> <div class="h6 gary">min</div> ' + '<div class="h1 orange">%S</div> <div class="h6 gary">sec</div> '));
       }else{
           $( "#session-extend" ).on( "click", function() {
                $.ajax({
                   url: "<%=request.getContextPath()%>/ajax/validateSession",
                      async : false,
                      success : function() {
                   	   $("#session-alert-counter").html('Your session is extended.');
                      }
                 });                
           });             
           $(this).html(event.strftime('Expire in<div class="h1 orange">%M</div> <div class="h6 gary">min</div> ' + '<div class="h1 orange">%S</div> <div class="h6 gary">sec</div> ')); 
       }
   });
   function sessionPopup(){
       if((new Date(sessionTimer).getTime() - new Date().getTime())/1000 <= 600){
           $('#session-alert').modal('show');
      }            
   }
   $(function() {
       setInterval(sessionPopup, 300000);
   });   
   <% } %>
</script>