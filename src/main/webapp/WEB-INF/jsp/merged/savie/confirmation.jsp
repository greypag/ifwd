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
<html lang="en">
	<head>
      <script type="text/javascript" src="assets/js/pdfobject.js"></script>
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>

	<c:set var="bShowVC" value="false" />
	<c:if test="${( planIndex == 'savings-insurance' ) and isVulnerable}"> 
	    <c:set var="bShowVC" value="true" />
	</c:if>

		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps confirmation-full-online" id="upload-later-confirmation-page">

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
			    	<c:set var="stepActive">5</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'medical-insurance/cansurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
					</c:set>
			    	<c:set var="stepActive">5</c:set>
			    </c:if>
			    <c:if test="${planIndex == 'savings-insurance'}">
			    	<c:set var="stepItems">
			    		stepindicator.selectplan,stepindicator.application,stepindicator.summary.declaration,stepindicator.sign,stepindicator.upload.document,stepindicator.confirmation
			    	</c:set>
			    	<c:set var="stepActive">5</c:set>
			    </c:if>

			     <!--<div class="container-fluid fwd-full-container browse-holder">-->
			        <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
			        	<jsp:param name="stepItems" value="${stepItems}"/>
		    			<jsp:param name="stepActive" value="${stepActive}"/>
			    	</jsp:include>
			     <!--</div>-->

			<!-- StepIndicator Component End-->

	        <div class="container-fluid fwd-full-container headerStick">
	        	<div class="fwd-container-limit clearfix sidebar">
	        		<div id="upload-later-confirmation-content">
	        			<div class="row">
	        				<div class="col-md-8" id="thankyou-message">
	        					<h3 class="text-bold heading-title">
		        					<c:if test="${planIndex == 'savings-insurance'}">
	        							<fmt:message key="msg.confirmation.complete.savie.copy1" bundle="${msg}" />
	        						</c:if>
		        					<c:if test="${planIndex == 'medical-insurance'}">
	        							<fmt:message key="msg.confirmation.complete.easyhealth.copy1" bundle="${msg}" />
	        						</c:if>
	        					</h3>
	        					<h3 class="text-bold visible-xs visible-sm" id="policy-no-mb"><fmt:message key="label.policyno" bundle="${msg}" /> <span class="policy-no">${lifePolicy.policyNo }</span></h3>
	        					<p id="success-purchase">
	        						<c:if test="${planIndex == 'savings-insurance'}">
	        							<fmt:message key="msg.confirmation.complete.savie.copy2" bundle="${msg}" />
	        						</c:if>
		        					<c:if test="${planIndex == 'medical-insurance'}">
	        							<fmt:message key="msg.confirmation.complete.easyhealth.copy2" bundle="${msg}" />
	        						</c:if>
	        					</p>
	        					<!--<p><fmt:message key="info.successful.purchase.copy2" bundle="${msg}" /></p> -->
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="text-bold col-md-4 visible-md visible-lg" id="policy-no-holder">
	        					<h2><fmt:message key="label.policyno" bundle="${msg}" /></h2>
	        					<h2 id="policy-no">${lifePolicy.policyNo }</h2>
	        				</div>
	        				<div class="col-md-12 border-gray visible-md visible-lg" id="border-desktop"></div>




	        			</div>

	        			<div class="row" id="contact-detail">

	        				<c:if test="${bShowVC}">

	        				<div class="col-md-12 " id="contact-time-holder" style="margin-top:20px;margin-bottom:20px">

	        					<p>
	        						<%-- <fmt:message key="msg.confirmation.upload.later.contact.text" bundle="${msg}" /> --%>
	        						<fmt:message key="msg.confirmation.contact.detail.text" bundle="${msg}" />
	        						<!-- 於核保申請期間，我們的客戶服務代表或會致電跟進。請提供您的首選時間，一邊聯絡。 -->
	        					</p>
							</div>

							<%-- <form action="${pageContext.request.contextPath}/ajax/savie/contact-time-period/post"  method="post"> --%>
							<div class="selectDiv gray-text-bg is-not-active col-md-7 text-bold" id="time-period-holder" style="margin-left: 27%;max-width: 230px;padding-top:0px !important;text-align: center;border-radius: 0;background-color: #E4E4E4;" >
							<%--
							<select class="form-control gray-dropdown " id="timePeriod" style="padding-top:0px !important;font-weight: bold;margin-top:0px;border-radius: 0; background-color: #E4E4E4;" onchange="changeSelect()">
							<option value="9:00-11:00"><fmt:message key="msg.confirmation.contact.detail.text.time.first" bundle="${msg}" /></option>
							<option value="14:00-17:00"><fmt:message key="msg.confirmation.contact.detail.text.time.second" bundle="${msg}" /></option>
							<option value="19:00-21:00"><fmt:message key="msg.confirmation.contact.detail.text.time.third" bundle="${msg}" /></option>
							</select>
							--%>

							<select class="form-control gray-dropdown " id="timePeriod" style="padding-top:0px !important;font-weight: bold;margin-top:0px;border-radius: 0; background-color: #E4E4E4;">
							<option value="" disabled="disabled" selected="selected"></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${contactTimeEN}">
										<option value="${list.itemCode }" <c:if test="${list.itemCode == 'VCCT3'}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${contactTimeCN}">
										<option value="${list.itemCode }" <c:if test="${list.itemCode == 'VCCT3'}">selected="selected"</c:if>>${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>

							<img src="<%=request.getContextPath()%>/resources/images/orange-caret.png" class="orange-caret-bg">
							</div>
							<div class="col-md-5 visible-lg visible-md" id="confirm-time-period">
							<button id="commit-time-period-btn" class="btn btn-default--vc" type="submit" onclick="commitTime(this)">
							<!-- 遞交 -->
							<fmt:message key="msg.confirmation.contact.detail.text.time.commit" bundle="${msg}" />
							</button>
							</div>
							<div class="col-md-5 visible-xs visible-sm" id="confirm-time-period">
							<button id="commit-time-period-btn-mb" class="btn btn-default--vc" style="float:right;" type="submit" onclick="commitTime(this)">
							<!-- 遞交 -->
							<fmt:message key="msg.confirmation.contact.detail.text.time.commit" bundle="${msg}" />
							</button>
							</div>
							</c:if>
						</div>
                <%-- 20160620 VC
                <div style="padding: 20px 0">
                  <p><fmt:message key="savie.confirmation.Your.application.is.part1" bundle="${msg}" /></p>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <form action="" method="POST" class="form-horizontal" id="savie-confimation-vulnerable-customer-form">
                     <div class="form-group">

                        <input type="hidden" name="savie.policyNo" value="">
                        <input type="hidden" name="savie.lastName" value="">
                        <input type="hidden" name="savie.firstName" value="">
                        <input type="hidden" name="savie.insuranceProductName" value="">
                        <input type="hidden" name="savie.timestamp" value="${now}">
                        <div class="col-lg-2 col-md-2 col-sm-2">&nbsp;</div>
                        <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12 saive-vulnerable-customer-preferred-time saive-confimation-vulnerable-customer-form">
                            <select class="form-control gray-textbox" id="time" name="preferred-time" data-bv-field="time" style="font-size: 18px;">
                              <option value="" style="color: #f5f5f5" ><fmt:message key="savie.vulnerableCustomer.preferredtime.option0" bundle="${msg}" /></option>
                              <option value="<fmt:message key="savie.vulnerableCustomer.preferredtime.option1" bundle="${msg}" />"><fmt:message key="savie.vulnerableCustomer.preferredtime.option1" bundle="${msg}" /></option>
                              <option value="<fmt:message key="savie.vulnerableCustomer.preferredtime.option2" bundle="${msg}" />"><fmt:message key="savie.vulnerableCustomer.preferredtime.option2" bundle="${msg}" /></option>
                              <option value="<fmt:message key="savie.vulnerableCustomer.preferredtime.option3" bundle="${msg}" />"><fmt:message key="savie.vulnerableCustomer.preferredtime.option3" bundle="${msg}" /></option>
                            </select>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 savie-cv-submit">
                           <button type="button" value="Submit" class="btn" id="savie-confirmation-submit-vulnerable-customer"><fmt:message key="savie.o2o.landing.Submit" bundle="${msg}" /></button>
                        </div>
                     </div>
                  </form>
                </div>
                <div style="padding: 20px 0">
                  <hr>
                </div>
                20160620 --%>
	        			<div class="row" id="partner-care-holder">
	        				<div class="col-md-6" id="care-holder">
	        					<div class="row">
	        						<h3 class="text-bold heading-title"><fmt:message key="label.you.may.interested.in" bundle="${msg}" /></h3>
	        						<div class="col-xs-6 col-md-12 care" id="care-1">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/travel-care.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/travel-care-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="text-bold care-title"><fmt:message key="product.suggestion.travel.care.title" bundle="${msg}" /></h3>
	        							<p><fmt:message key="product.suggestion.travel.care.copy" bundle="${msg}" /></p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder  visible-md visible-lg">
	        								<a href="<fmt:message key="link.product.travel.care" bundle="${msg}" />"><button class="text-bold btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12 care   " id="care-2">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/homecare.jpg" class="img-responsive visible-md visible-lg" />
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/homecare-mb.jpg" class="img-responsive visible-xs visible-sm care-img-mb" />
	        							<h3 class="text-bold care-title"><fmt:message key="product.suggestion.home.title" bundle="${msg}" /></h3>
	        							<p><fmt:message key="product.suggestion.home.copy" bundle="${msg}" /></p>
	        							<div class="clearfix"></div>
	        							<div class="get-qoute-holder  visible-md visible-lg">
	        								<a href="<fmt:message key="link.product.easy.home" bundle="${msg}" />"><button class="text-bold btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="row visible-xs visible-sm" id="get-btns-holder">
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<a href="<fmt:message key="link.product.travel.care" bundle="${msg}" />"><button class="text-bold btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        						<div class="col-xs-6 col-md-12">
	        							<div class="get-qoute-holder">
	        								<a href="<fmt:message key="link.product.easy.home" bundle="${msg}" />"><button class="text-bold btn common-yellow-btn get-quote-btn"><fmt:message key="button.get.quote" bundle="${msg}" /></button></a>
	        							</div>
	        						</div>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        				<div class="col-md-6 partners">
	        					<h3 class="text-bold heading-title"><fmt:message key="partner.savie.confirmation.title4" bundle="${msg}" /></h3>
	        					<div class="row partner">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/agoda-logo.png" class="img-responsive" />
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy1" bundle="${msg}" /> <a href="<fmt:message key="link.partner.offer.copy1" bundle="${msg}" />"><fmt:message key="label.agoda.offer.copy" bundle="${msg}" /></a> <fmt:message key="label.agoda.offer.copy2" bundle="${msg}" /></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/buddy-logo.png" class="img-responsive" />
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy2.y5buddy" bundle="${msg}" /><a href="<fmt:message key="link.offer.link.y5buddy" bundle="${msg}" />"><fmt:message key="partner.offer.copy2.y5buddy1" bundle="${msg}" /></a></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/boconcept-logo.png" class="img-responsive" />
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy3" bundle="${msg}" /></p>
	        						</div>
	        					</div>
	        					<div class="row partner hidden">
	        						<div class="col-xs-4 logo-holder">
	        							<img src="<%=request.getContextPath()%>/resources/images/savie-2016/price-rite-logo.png" class="img-responsive" />
	        						</div>
	        						<div class="col-xs-8">
	        							<p><fmt:message key="partner.offer.copy4.pricerite1" bundle="${msg}" /><a href="<fmt:message key="link.partner.offer.copy.pricerite" bundle="${msg}" />"><fmt:message key="partner.offer.copy4.pricerite2" bundle="${msg}" /></a> <fmt:message key="link.offer.copy4.pricerite3" bundle="${msg}" /></p>
	        						</div>
	        					</div>
	        					<div class="text-center">
	        						<a href="<fmt:message key="link.find.out.more" bundle="${msg}" />"><button class="text-bold btn common-yellow-btn" id="find-more-btn"><fmt:message key="button.find.out.more" bundle="${msg}" /></button></a>
	        					</div>
	        					<div class="border-gray visible-xs visible-sm"></div>
	        				</div>
	        			</div>
	        			<div class="text-center">
    						<a href="<fmt:message key="link.back.to.home" bundle="${msg}" />">
    							<button class="text-bold btn savie-common-btn" id="back-to-home-btn"><fmt:message key="button.back.to.home" bundle="${msg}" /></button>
    						</a>
    					</div>
	        		</div>
	        	</div>
	        </div>
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			window.onload = function (){
				var pdfFile = $('#pdf-object').attr('data');
				var success = new PDFObject({ url: pdfFile }).embed();
			};

			// function changeSelect(){
			// 	$("#commit-time-period-btn").attr("disabled", false);
			// }

	    <c:if test="${bShowVC}">
			function commitTime(btn){
				var contactTime = $("#timePeriod").val();
				//alert(contactTime);
				var policyNo='${lifePolicy.policyNo }';
				$.ajax({
				    url:'${pageContext.request.contextPath}/ajax/savie/contact-time-period/post',
				    type:'post',
				    data:{
				    	"policyNo": policyNo,
				    	"contactTime": contactTime,
			   		},
				    error:function(){
						$('#timePeriod').prop('disabled', false);
				    },
				    success:function(data){
						$('#timePeriod').prop('disabled', true);
				    	$("#commit-time-period-btn").attr("disabled", true);
						$("#commit-time-period-btn-mb").attr("disabled", true);
				    }
				});
				return false;
			};
		</c:if>

        </script>
	</body>
</html>
