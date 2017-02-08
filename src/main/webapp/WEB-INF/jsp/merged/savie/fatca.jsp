<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var languageP = "${language}";
</script>
<html lang="en">
	<head>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="fatca-page">
			
			<!-- Breadcrumb Component Start-->
    		<div class="container container-fluid container--breadcrumb">

			    <c:set var="breadcrumbItems" value="breadcrumb.item.home" /> 
				<c:set var="breadcrumbActive" value="0" />

			    <c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
					</c:set>
			    	<c:set var="breadcrumbActive">4</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.cansurance,breadcrumb.item.application
					</c:set>
			    	<c:set var="breadcrumbActive">4</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'savings-insurance'}">
			    	<c:set var="breadcrumbItems">
			    		breadcrumb.item.home,breadcrumb.item.save,breadcrumb.item.savie,breadcrumb.item.application
			    	</c:set>
			    	<c:set var="breadcrumbActive">3</c:set>
			    </c:if>

			    <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
			    	<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
			    	<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
				</jsp:include>
			</div>
			<!-- Breadcrumb Component End-->

			<!-- StepIndicator Component Start-->

		     	<c:set var="stepItems" value="stepindicator.selectplan" /> 
				<c:set var="stepActive" value="0" />

				<c:if test="${planIndex == 'medical-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">1</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">1</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'savings-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application,stepindicator.summary.declaration,stepindicator.sign,stepindicator.upload.document,stepindicator.confirmation
			    	</c:set>
			    	<c:set var="stepActive">1</c:set>
			    </c:if>

			     <!--<div class="container-fluid fwd-full-container browse-holder">-->
			        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
			        	<jsp:param name="stepItems" value="${stepItems}"/>
		    			<jsp:param name="stepActive" value="${stepActive}"/>
			    	</jsp:include>
			     <!--</div>-->

			<!-- StepIndicator Component End-->

			<div class="container-fluid fwd-full-container" id="fatca-page-body">
				<div class="fwd-container-limit clearfix sidebar">
					<div id="fatca-content" class="text-center">
						<h3><fmt:message key="info.fatca.copy1" bundle="${msg}" /></h3>
						<p id="agreement"><fmt:message key="decleration.fatca.copy1" bundle="${msg}" /></p>
						<div id="buttons-holder" class="text-center clearfix">
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="yes-btn"><fmt:message key="button.yes" bundle="${msg}" /></button>
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="no-btn"><fmt:message key="button.no" bundle="${msg}" /></button>
						</div>
						<div id="condition-holder" class="clearfix pull-right hidden">
							<p id="no-btn-call-hotline"><fmt:message key="info.fatca.call.hotline" bundle="${msg}" /></p>
						</div>
					</div>
				</div>
				<div class="fwd-container-limit clearfix sidebar">
					<div id="fatca-content-02" class="text-center">
						<p id="agreement-02"><fmt:message key="decleration.fatca.copy1.02" bundle="${msg}" /></p>
						<div id="buttons-holder-02" class="text-center clearfix">
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="yes-btn-02"><fmt:message key="button.yes" bundle="${msg}" /></button>
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="no-btn-02"><fmt:message key="button.no" bundle="${msg}" /></button>
						</div>
						<div id="condition-holder-02" class="clearfix pull-right hidden">
							<p id="no-btn-call-hotline-02"><fmt:message key="info.fatca.call.hotline" bundle="${msg}" /></p>
						</div>
					</div>
				</div>
				<div class="fwd-container-limit clearfix sidebar">
					<div id="fatca-content-03" class="text-center">
						<p id="agreement-03"><fmt:message key="decleration.fatca.copy1.03" bundle="${msg}" /></p>
						<div id="buttons-holder-03" class="text-center clearfix">
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="yes-btn-03"><fmt:message key="button.yes" bundle="${msg}" /></button>
							<button type="button" class="text-bold btn savie-common-btn btn-not-clicked" id="no-btn-03"><fmt:message key="button.no" bundle="${msg}" /></button>
						</div>
						<div id="condition-holder-03" class="clearfix pull-right hidden">
							<p id="no-btn-call-hotline-03"><fmt:message key="decleration.fatca.copy1.03.no" bundle="${msg}" /></p>
						</div>
						<div class="clearfix" id="agreement-03-checkbox">
							<label class="agreement-03-01 small"><fmt:message key="decleration.fatca.copy1.03.01" bundle="${msg}" /></label>
						</div>
					</div>
				</div>
				<div class="div-next-btn text-center">
					<button type="button" class="text-bold btn savie-common-btn disabled-gray-btn" id="next-btn"><fmt:message key="button.next" bundle="${msg}" /></button>
				</div>
			</div>
			<div class="modal fade modal-fatca-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-fatca-declaration">
				<div class="modal-content common-welcome-modal" id="modal-content-fatca">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-fatca" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p><fmt:message key="label.fatca" bundle="${msg}" /></p>
					 </div>
					 <div class="modal-body" id="modal-body-fatca">
						<ol>
							<fmt:message key="declaration.fatca.copy1" bundle="${msg}" />	
						</ol>
					 </div>
				 </div>
			  </div>
			</div>
			<div class="modal fade modal-us-person" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-us-person">
				<div class="modal-content common-welcome-modal" id="modal-content-usperson">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-usopen" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
					 </div>
					 <div class="modal-body" id="modal-body-usperson">
					 	<fmt:message key="declaration.fatca.copy2" bundle="${msg}" />
					 </div>
				 </div>
			  </div>
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			var clicked_yes_01 = false;
			var clicked_yes_02 = false;
			var clicked_yes_03 = false;
			
			$('#yes-btn').click(function(){
				clicked_yes_01 = true;
				$('#yes-btn').removeClass('btn-not-clicked');
				$('#no-btn').addClass('btn-not-clicked');
				
				$('#condition-holder').addClass('hidden');
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			$('#no-btn').click(function(){
				clicked_yes_01 = false;
				$('#yes-btn').addClass('btn-not-clicked');
				$('#no-btn').removeClass('btn-not-clicked');
				
				$('#condition-holder').removeClass('hidden');
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			$('#yes-btn-02').click(function(){
				clicked_yes_02 = true;
				$('#yes-btn-02').removeClass('btn-not-clicked');
				$('#no-btn-02').addClass('btn-not-clicked');
				
				$('#condition-holder-02').addClass('hidden');
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			$('#no-btn-02').click(function(){
				clicked_yes_02 = false;
				$('#yes-btn-02').addClass('btn-not-clicked');
				$('#no-btn-02').removeClass('btn-not-clicked');
				
				$('#condition-holder-02').removeClass('hidden');
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			$('#yes-btn-03').click(function(){
				clicked_yes_03 = true;
				$('#yes-btn-03').removeClass('btn-not-clicked');
				$('#no-btn-03').addClass('btn-not-clicked');
				
				$('#condition-holder-03').addClass('hidden');
				
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			$('#no-btn-03').click(function(){
				clicked_yes_03 = false;
				$('#yes-btn-03').addClass('btn-not-clicked');
				$('#no-btn-03').removeClass('btn-not-clicked');
				
				$('#condition-holder-03').removeClass('hidden');
				
				isEnableNext(clicked_yes_01, clicked_yes_02, clicked_yes_03);
			});
			
			$('#next-btn').click(function(){
				if(!$(this).hasClass('disabled-gray-btn')){
					window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
				}
			});
			
			function isEnableNext(yes_01, yes_02, yes_03){
				if(yes_01==true && yes_02==true && yes_03==true){
					$('#next-btn').removeClass('disabled-gray-btn');
				}else{
					$('#next-btn').addClass('disabled-gray-btn');
				}
			}
		</script>
	</body>
</html>	
