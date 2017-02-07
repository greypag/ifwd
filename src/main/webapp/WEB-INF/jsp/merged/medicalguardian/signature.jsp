<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var affiliate = "${affiliate}";
var home_url = "<%=request.getContextPath()%>";
</script>


    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/application.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/easy-health/easyhealth-application.css">
    <link href="<%=request.getContextPath()%>/resources/css/easy-health/mobiscroll.custom-2.17.1.min.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/jsignature/jSignature.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.common.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/application.signature.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
  
	<!-- Breadcrumb Component Start-->
	<div class="container container-fluid container--breadcrumb">
		<c:set var="breadcrumbItems">
		    breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.health,breadcrumb.item.easyhealth,breadcrumb.item.application
		</c:set>
		  <c:set var="breadcrumbActive">4</c:set>
		
		<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
		  <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
		  <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
		</jsp:include>
	</div>
	<!-- Breadcrumb Component End-->

  <!-- StepIndicator Component Start-->

      <c:set var="stepItems">
          stepindicator.selectplan,stepindicator.application.summary.declaration,stepindicator.sign,stepindicator.payment,stepindicator.upload.document,stepindicator.confirmation
      </c:set>
      <c:set var="stepActive">2</c:set>
      
      <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
        <jsp:param name="stepItems" value="${stepItems}"/>
        <jsp:param name="stepActive" value="${stepActive}"/>
      </jsp:include>

  <!-- StepIndicator Component End-->
    
    <div class="savie-online-container app-pg-ctnr" id="eh-app-signature">
    
    <!-- Application Content Start -->
    <div class="app-pg-cont">
        <form id="ef-form-payment">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <h3 class="heading-title"><fmt:message key="signature.title" bundle="${msg}" /></h3>
                     <p><fmt:message key="signature.description" bundle="${msg}" /></p>
                     <form action="">
                        <div class="signature-parent">
                            <div id="signature" class="signature-img so-signature"></div>
                        </div>
                        <div class="clearfix">
                            <a id="link-clear" href="javascript:void(0);" class="pull-left link-clear"><fmt:message key="signature.clear" bundle="${msg}" /></a>
                            
                                
                                <p class="text-right"><fmt:message key="signature.hksign" bundle="${msg}" /></p>
                            
                        </div>
                        <div class="text-center">
                            <span class="error-msg" id="signatureError"></span>
                            <div id="correct-signature" class="correct-signature hidden">
                                <img src="<%=request.getContextPath()%>/resources/images/elite-terms/correct-signature.png">
                                <span><fmt:message key="payment.label.correct.signature" bundle="${msg}" /></span>
                            </div>
                            <a class="text-bold btn btn-confirm btn-app" id="btn-signature-next"><fmt:message key="button.proceed.to.payment" bundle="${msg}" /></a>
                        </div>
                     </form>
                </div>
			</div>
		</div>
		</form>
	</div>
	
	<!-- Application Content End -->
		<!-- <div class="fwd-container-limit clearfix">	
				<div class="row">
					<h3 class="heading-title">Your Selected Plan<span>
					<a href="/en/savings-insurance/plan-details-sp?type=2">Edit</a>
					</span></h3>
					
					<div class="col-xs-12 col-md-6 left-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Plan name</label>
							<p class="data-info">Savie</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Saving amount</label>
							<p class="data-info">HK$ 100,000</p>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 right-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Premium mode</label>
							<p class="data-info">
							   Single premium
							</p>
						</div>
					</div>
				</div>
				<div class="row" id="sales-input">
					<h3 class="heading-title">Input for sales illustration</h3>
					<p id="info-note"><span class="asterisk">*</span>The following information will become your policy information</p>
					<div class="col-xs-12 col-md-6 left-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Last name(same as HKID)</label>
							<p class="data-info">Fok</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Given name (same as HKID)</label>
							<p class="data-info">Ting Kin </p>
						</div>
						<div class="gray-bg-data-info hidden">
							<label class="data-label">label.chinese.name</label>
							<p class="data-info">陳大文</p>
							<p class="data-info"> </p>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 right-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Date of birth</label>
							<p class="data-info">29-12-1958</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Gender</label>
							<p class="data-info">Male</p>
						</div>
					</div>       	
				 </div>
		    <div class="row" id="pdf-illustration-holder">
		    	<p id="review-note">Review and accept your sales illustration in order to proceed, you may refer to the <a href="#" data-toggle="modal" data-target="#sales-illustration-modal">sales illustration sample</a> for easy reference.</p>
		    </div>
			<div class="modal fade common-welcome-modal" id="sales-illustration-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<div id="pdf-image" class="pdf-image-container">
						<div class="pdf-image-zoom zoom-in"><span class="glyphicon glyphicon-plus"></span></div>
						<div class="pdf-image-zoom zoom-out"><span class="glyphicon glyphicon-minus"></span></div>
						<div class="pdf-image-scroll">
							<img class="pdf-image" data-width="75" src="/resources/pdf/template/SavieProposalTemplate_en.jpg" style="width: 75%;">
						</div>
					</div>
					<div class="text-center">
						<button class="text-bold btn savie-common-btn" data-dismiss="modal" id="close-btn">Close</button>
					</div>	
				</div>
			  </div>
			</div>					
		</div> -->
    </div>

</div>

    <script>
        $(document).ready(function() {
        	var signatureFileSize = "${signatureFileSize}";
        	$('#btn-signature-next').on('click', function(e) {
    			
    			e.preventDefault();
    			if($('#correct-signature').hasClass('hidden') == false) {
    				if (!$("#signature").jSignature('getData', 'native').length) {
    			    	alert(getBundle(getBundleLanguage, "error.signature.empty"))
    				}
    				else{
    					$('#btn-signature-next').attr('disabled',"true");
    					var $sigdiv = $("#signature");
    					var datapair = $sigdiv.jSignature("getData", "image");
    					var obj = datapair[1];
    					if(datapair[1].length > signatureFileSize*1024 ){
    					    //$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "error.signature.size")).css('display', 'block');
    					    alert(getBundle(getBundleLanguage, "error.signature.size"));
    					    $('#loading-overlay').modal('hide');
    	
    					}else if($('.correct-signature').hasClass('hidden')){
    						//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "error.signature.empty")).css('display', 'block');
    						alert(getBundle(getBundleLanguage, "error.signature.empty"));
    						$('#loading-overlay').modal('hide');
    					}
    					else{
    						var planSelected ='${planIndex}';
    						var planCd="ROPHI1";
    						if(planSelected=='medical-insurance/cansurance'){
    							planCd="HCP1";
    						}    						
    						
    						 $.ajax({
    					    	url:'<%=request.getContextPath()%>/ajax/savings-insurance/uploadSignature',     
    					    	type:'post',     
    					    	data:{ "image" : datapair[1],"planCode" : planCd },     
    					    	success:function(data){
    					    		//loading mask 
    					    		$('#loadingDiv').toggle();
    								$('body').addClass('modal-open');
    					    	    if(data==null || data == ''){
    					    	    	//Unknown errors
    					    	    	//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
    					    	    	//alert(getBundle(getBundleLanguage, "system.error.message"))
    					    	    	//$('#loading-overlay').modal('hide');
    					    	    	
    					    	    	
    					    	    } 
    					    	    else if( data.errMsgs == 'session expired'){
    					    	    	//Timeout errors
    					    	    	$('#loading-overlay').modal('hide');
    					    	    	$('#timeout-modal').modal('show'); 
    					    	    } 
    					    	    else if( data.errMsgs != null ){
    					    	    	//Other errors
    					    	    	//$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
    					    	    	alert(getBundle(getBundleLanguage, "system.error.message"))
    					    	    	$('#loading-overlay').modal('hide');
    					    	    	// tes
    					    	    	window.onbeforeunload=null;
    					    	    	window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
    					    	    
    					    	    } 
    					    	    else {
    					    	    	// success
    					    	    	window.onbeforeunload=null;
    					    	    	window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
    					    	    }
    					        },
    							error:function(){
    								
    								$('#signature-section .fwd-error-red .help-block').html(getBundle(getBundleLanguage, "system.error.message")).css('display', 'block');
    								$('#loading-overlay').modal('hide');
    							}
    					        
    					    });
    						 
    					}
    				}
    				
    			}
    		});
        })
</script>
