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
 <%--   <script src="<%=request.getContextPath()%>/resources/js/easy-health/mobiscroll.custom-2.17.1.min.js" type="text/javascript"></script> --%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
     <div class="savie-online-container app-pg-ctnr" id="eh-app-underwriting">
	     <div class="container-fluid fwd-full-container browse-holder">
	        <div class="application-page-header et-header-browse">
	           <div class="browse-container">
	              <div class="row reset-margin hidden-xs hidden-sm">
	                 <ul class="common-steps-list six-steps nav nav-pills">
	                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn active"><span class="status">1</span>Select Plan</button></li>
	                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
	                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">2</span>Application, Summary &amp; Declaration</button></li>
	                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
	                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Signature</button></li>
	                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
	                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Payment</button></li>
	                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
	                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document Upload</button></li>
	                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow"></li>
	                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
	                 </ul>
	             </div>
	           </div>  
	           <div class="et-mobile-header-info hidden-md hidden-lg">
	              <div class="clearfix">
	                 <div class="et-back-arrow">
	                    <a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#" class="back-arrow-link">
	                       <span class="icon-arrow-left2 arrow-left"></span>
	                    </a>
	                 </div>
	                 <div class="et-header-tex">
	                    <h3 id="">簽署</h3>
	                 </div>
	              </div>
	              <span id="step-of">4 out of 5</span>
	           </div>
	        </div>
	     </div>
	
	<!-- Application Content Start -->
		<div class="app-pg-cont">
			<form id="ef-form-underwriting">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12 col-md-12">
							<h3 class="heading-title">Medical declaration</h3>
							<div class="row form-group question-row">
								<div class="col-xs-12">
									<h4>Question 1</h4>
								</div>
								<div class="col-xs-12 col-md-10">
									<p>Has your proposal, renewal or reinstatement for life, disability, accident, critical illness or health insurance made to any company including FWD ever been declined, postponed or modified in anyway?</p>
								</div>
								<div class="col-xs-12 col-md-2">
									<div class="radio-gp">
										<label class="radio-inline"><input type="radio" name="ehUnderWriting1" value="Yes">Yes</label>
										<label class="radio-inline"><input type="radio" name="ehUnderWriting1" value="No">No</label>
									</div>
								</div>
								<div class="col-xs-12 col-md-12">
									<span class="error-msg" id="ehUnderWriting1ErrMsg"></span>
								</div>
							</div>
                            <div class="row form-group question-row">
                                <div class="col-xs-12">
                                    <h4>Question 3</h4>
                                </div>
                                <div class="col-xs-12 col-md-10">
                                    <p>In the past 3 years, have you ever had any accident or illness treatment (medication or drugs) for more than 14 days or have you undergone surgical operation at a hospital or clinic, or been advised by a registered physician to undergo any investigations including ECG, CT Scan, Blood Test, Biopsy etc. (Excluding Routine Medical or Employment check-up)?</p>
                                </div>
                                <div class="col-xs-12 col-md-2">
                                    <div class="radio-gp">
                                        <label class="radio-inline"><input type="radio" name="ehUnderWriting2" value="Yes">Yes</label>
                                        <label class="radio-inline"><input type="radio" name="ehUnderWriting2" value="No">No</label>

                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-12">
                                    <span class="error-msg" id="ehUnderWriting2ErrMsg"></span>
                                </div>
                            </div>
							<div class="row form-group question-row">
								<div class="col-xs-12">
									<h4>Question 2</h4>
								</div>
								<div class="col-xs-12 col-md-10">
									<div class="row">
										<div class="col-xs-12">
											<p>Have you ever had, or been told to have or been treated for the following diseases?</p>
										</div>
										<div class="col-xs-12 col-md-6">
											<ul>
												<li>High Blood Pressure</li>
												<li>Stroke</li>
												<li>Chest Pain</li>
												<li>Heart Disease</li>
												<li>Kidney Disease</li>
												<li>Diabetes Mellitus</li>
												<li>Respiratory Disorder</li>
												<li>Thyroid Disease</li>
											</ul>
										</div>
										<div class="col-xs-12 col-md-6">
											<ul>
												<li>Digestive Problems</li>
												<li>Liver Problems (including Hepatitis B and C)</li>
												<li>Blood Disease</li>
												<li>Cancer or Tumour</li>
												<li>any disease or disorder of Breast</li>
												<li>any disease or disorder of Uro-Genital</li>
												<li>AIDS or AIDS Related Complex</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-md-2">
									<div class="radio-gp">
										<label class="radio-inline"><input type="radio" name="ehUnderWriting3" value="Yes">Yes</label>
										<label class="radio-inline"><input type="radio" name="ehUnderWriting3" value="No">No</label>
									</div>
								</div>
								<div class="col-xs-12 col-md-12">
									<span class="error-msg" id="ehUnderWriting3ErrMsg"></span>
								</div>
							</div>

							<div class="tnc-row form-group">
								<div class="checkbox">
									<input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC">I declare to the best of my knowledge and belief that all the statements and answers in the above are full, complete and true and form part of the application and the basis of the policy to be issued. I understand and agree that if any of the statements and answers given in the above are inaccurate or I have not disclosed any material facts, FWD Life Insurance Company (Bermuda) Limited shall be entitled to cancel the policy or to re-issue the policy with changes even after the policy has been issued;</label>
									<span class="error-msg" id="ehUnderWriting4ErrMsg"></span>
								</div>
							</div>
							<div class="btn-row text-center">
								<a href="javascript:void(0);" class="btn-app eh-btn-next grey-out" id="eh-btn-underwriting-next">Next</a>
							</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	<!-- Application Content End -->
		
	</div>





<!--CANNOT APPLY MODAL-->
<div class="modal et-modal fade" role="dialog"
	aria-labelledby="cantapply" id="cannot-apply-modal">
	<div class="container-fluid modal-dialog" role="document">
		<div class="modal-content et-modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5>
					Sorry, you cannot apply for this plan online.
				</h5>
			</div>
			<div class="modal-body">
				<p>
					Please call our Customer Service Hotline
					3123 3123
					to find out more or leave your contact and let us call you back.
				</p>
				<form action="" id="et-cust-serv-form" method="post" onsubmit="return submmitinfo()">
					<div class="input-items clearfix form-group">
						<label for="name">Name</label> <input
							type="text" class="form-control gray-textbox chinese-input"
							placeholder="Name"
							id="name" name="name"> <span class="error-msg"
							id="cannotApplyNameMessage"></span>
					</div>
					<div class="input-items clearfix form-group">
						<label for="email">Email address</label> <input
							type="email" class="form-control gray-textbox"
							placeholder="Email address"
							id="email" name="email"> <span class="error-msg"
							id="cannotApplyEmailMessage"></span>
					</div>
					<div class="input-items clearfix form-group">
						<label for="tel">Mobile Number</label> <input
							type="tel" class="form-control gray-textbox"
							placeholder="Mobile Number"
							id="tel" name="tel" maxlength="8"> <span
							class="error-msg" id="cannotApplyTelMessage"></span>
					</div>
					<div class="input-items clearfix form-group">
						<label for="day"><fmt:message
								key="eliteTerms.selectPlan.Preffered.day" bundle="${msg}" /></label>
						<div class="select-holder">
							<select class="form-control gray-textbox" id="day" name="day">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${etCsContactPreferredDayEN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${etCsContactPreferredDayCN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="cannotApplyDayMessage"></span>
					</div>
					<div class="input-items clearfix form-group">
						<label for="time"><fmt:message
								key="eliteTerms.selectPlan.Preffered.timeslot" bundle="${msg}" /></label>
						<div class="select-holder">
							<select class="form-control gray-textbox" id="time" name="time">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${etCsContactPreferredTimeSlotEN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${etCsContactPreferredTimeSlotCN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="cannotApplyTimeMessage"></span>
					</div>
					<div class="input-items clearfix form-group">
						<label for="enquiry"><fmt:message
								key="eliteTerms.selectPlan.Enquire.type" bundle="${msg}" /></label>
						<div class="select-holder">
							<select class="form-control gray-textbox" id="enquiry"
								name="enquiry">
								<option value=""><fmt:message
										key="eliteTerms.selectPlan.Please.select" bundle="${msg}" /></option>
								<c:if test="${language == 'en'}">
									<c:forEach var="list" items="${etEnquiryTypeEN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
								<c:if test="${language == 'tc'}">
									<c:forEach var="list" items="${etEnquiryTypeCN}">
										<option value="${list.itemCode }-${list.itemDesc }">${list.itemDesc }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<span class="error-msg" id="cannotApplyEnquireMessage"></span>
					</div>
					<div class="">
						<p class="notice">
							* The information will not be used for direct marketing.
						</p>
					</div>
					<button type="submit" class="btn next" id="et-cannot-apply-btn">
						Submit
					</button>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!--END OF CANNOT APPLY MODAL-->
<div id="back-to-home-modal"
	class="modal fade fwd-generic-modal back-to-home" role="dialog"
	data-keyboard="false" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content" align="center">
			<div class="modal-body form-container" style="color: #fc6d08">
				<div class="row">
					<h2>
						<fmt:message key="eliteTerms.selectPlan.successfully.submitted"
							bundle="${msg}" />
					</h2>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 fwd-orange-btn-center-wrapper">
						<button type="button"
							class="btn next bdr-curve btn btn-primary btn-lg wd5"
							id="et-select-plan-go-homepage" data-dismiss="modal">
							<fmt:message key="eliteTerms.selectPlan.Back.to.homepage"
								bundle="${msg}" />
						</button>
					</div>
				</div>
			</div>
		</div>


		<!--<div class="modal-content">
                  <div class="modal-header">
                     <h4 class="modal-title">Your request has been successfully submitted.</h4>
                  </div>
                     
                  <div class="modal-body"></div>
                  
                  <div class="modal-footer">
                     <a href="/" title="Back to homepage" class="btn-block">Back to homepage</a>
                     <button type="button" class="btn btn-orange et-next-btn et-pad-bot-50" id="et-select-plan-go-homepage" data-dismiss="modal"><fmt:message key="eliteTerms.selectPlan.Back.to.homepage" bundle="${msg}" /></button>
                  </div>
               </div>-->

	</div>
</div>
<script>
	$('#et-select-plan-go-homepage').on('click', function(e) {
		window.location.href= contextPath+'/'+language+'/easyhealth-insurance';
	});

	function submmitinfo() {
		if($("#name").val() != '' && $("#cannotApplyNameMessage").val() == '' && $("#cannotApplyEmailMessage").val() == ''
				&& $("#cannotApplyTelMessage").val() == '' && $("#cannotApplyDayMessage").val() == '' 
				&& $("#cannotApplyDayMessage").val() == ''  && $("#cannotApplyTimeMessage").val() == ''){
			$('.modal').modal('hide');
			 var name = $('#name').val();
	        	var email = $('#email').val();
	        	var mobile = $('#tel').val();
	        	var preferredDay = $('#day').val();
	        	var preferredTimeSlot = $('#time').val();
	        	var enquiryType = $('#enquiry').val();
	        	var channel = $("#channel").val();
	        	var product = "eliteterm";
	        	
	        	if(name ==null){
	        		console.log("data error");
	        	}
	        	else{
	        		$.get(contextPath+'/ajax/eliteTerm/contactCs',
	        		{ 
	        			name : name,
	        			email : email,
	        			mobile : mobile,
	        			preferredDay : preferredDay,
	        			preferredTimeSlot : preferredTimeSlot,
	        			enquiryType : enquiryType,
	        			channel : channel,
	        			product : product
	        		},
	        		function(data) {
	        			if(data.errMsgs == null){
	        				console.log("data success");
	                  $('#back-to-home-modal').modal('show');
	        			}
	        			else{
	        				console.log("data error");
	        			}
	        		})
	        		.fail(function(data) {
	        		});
	        	}
		}
        return false;
	}

	$(document).ready(function(){
		$("#eh-btn-underwriting-next").click(function() {
    		window.location = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
        });
		  $('#et-cust-serv-form').bootstrapValidator({
              excluded:[],
              fields: {
                 "name": {
                    container: '#cannotApplyNameMessage',
                    trigger: 'blur',
                    validators: {
                       notEmpty: {
                          message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.name" bundle="${msg}" />'
                       },
                       regexp: {
                          regexp: /^[a-zA-Z\s\u4e00-\u9eff]*$/, /*chinese and english chars only*/
                          message: '<fmt:message key="eliteTerms.selectPlan.Your.name.is.invalid" bundle="${msg}" />'
                       },
                       callback: {
                          message: '<fmt:message key="eliteTerms.selectPlan.Please.enter.your.name" bundle="${msg}" />',
                          callback: function(value, validator) {
                             return value !== document.getElementById('name').getAttribute('placeholder');
                          }
                       }
                    }
                 },
                 "email": {
                    container: '#cannotApplyEmailMessage',
                    trigger: 'blur',
                    validators: {
                       emailAddress: {
                          message: '<fmt:message key="eliteTerms.selectPlan.Your.email.address.is.invalid" bundle="${msg}" />'
                       },
                       callback: {
                          callback: function(value, validator) {
                              // Check if both email and mobile is blank
                              if ( value == '' && $('#et-cust-serv-form #tel').val() == '') {
                                  return {
                                      valid: false,
                                      message: '<fmt:message key="eliteTerms.selectPlan.email.mobile" bundle="${msg}" />'
                                  }
                             }

                             // Remove Tel Error message as well
                             $('#et-cust-serv-form')
                                 .data('bootstrapValidator')
                                 .updateStatus('tel','VALID');
                             return true;
                          }
                       }
                    }
                 },
                 "tel": {
                    container: '#cannotApplyTelMessage',
                    trigger: 'blur',
                    validators: {
                       stringLength: {
                          min: 8,
                          max: 8,
                          message: getBundle(getBundleLanguage, "member.mobileNo.notValidLength.message")
                       },
                      	regexp: {
                             regexp: /^1[0-9]{10}$|^[5689][0-9]{7}$/, //^[5689]{3}[0-9]+$/,
                             message: '<fmt:message key="eliteTerms.selectPlan.Your.mobile.no.is.invalid" bundle="${msg}" />'
                       },
                       callback: {
                          callback: function(value, validator) {
                              // Check if both email and mobile is blank
                              if ( value == '' && $('#et-cust-serv-form #email').val() == '') {
                                  return {
                                      valid: false,
                                      message: '<fmt:message key="eliteTerms.selectPlan.email.mobile" bundle="${msg}" />'
                                  }                          
                              }
                              
                             // Remove Email Error message as well
                             $('#et-cust-serv-form')
                                  .data('bootstrapValidator')
                                  .updateStatus('email','VALID');
                             
                             return true;
                          }
                       }
                    }
                 },
                 "day": {
                    container: '#cannotApplyDayMessage',
                    validators: {
                       notEmpty: {
                          message: '<fmt:message key="eliteTerms.selectPlan.Please.choose.a.perferred.day" bundle="${msg}" />'
                       }
                    }
                 },
                 "time": {
                    container: '#cannotApplyTimeMessage',
                    validators: {
                       notEmpty: {
                          message: '<fmt:message key="eliteTerms.selectPlan.Please.choose.a.perferred.timeslot" bundle="${msg}" />'
                       }
                    }
                 }
              }
           }).on('success.form.bv', function(e){
                 e.preventDefault();
                 var $form = $(this);
                  $('.modal').modal('hide');
                  
                   var name = $('#name').val();
	               	var email = $('#email').val();
	               	var mobile = $('#tel').val();
	               	var preferredDay = $('#day').val();
	               	var preferredTimeSlot = $('#time').val();
	               	var enquiryType = $('#enquiry').val();
	               	var channel = $("#channel").val();
	               	var product = "eliteterm";
	               	
	               	if(name ==null){
	               		console.log("data error");
	               	}
	               	else{
	               		$.get(contextPath+'/ajax/eliteTerm/contactCs',
	               		{ 
	               			name : name,
	               			email : email,
	               			mobile : mobile,
	               			preferredDay : preferredDay,
	               			preferredTimeSlot : preferredTimeSlot,
	               			enquiryType : enquiryType,
	               			channel : channel,
	               			product : product
	               		},
	               		function(data) {
	               			if(data.errMsgs == null){
	               				console.log("data success");
                             $('#back-to-home-modal').modal('show');
	               			}
	               			else{
	               				console.log("data error");
	               			}
	               		})
	               		.fail(function(data) {
	               		});
	               	}
           });
			
	});
</script>