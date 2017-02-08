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
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/easy-health/easyhealth-app-uifn.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/elite-term/bootstrapValidator.min.js"></script>
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

     <div class="savie-online-container app-pg-ctnr" id="eh-app-underwriting">

     	<!-- StepIndicator Component Start-->

     	<c:set var="stepItems" value="stepindicator.selectplan" /> 
		<c:set var="stepActive" value="0" />

		<c:if test="${planIndex == 'cansurance'}">
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

	    
	    <jsp:include page="/WEB-INF/jsp/merged/comp/step-indicator.jsp">
	       	<jsp:param name="stepItems" value="${stepItems}"/>
    		<jsp:param name="stepActive" value="${stepActive}"/>
	    </jsp:include>

		<!-- StepIndicator Component End-->


	<!-- Application Content Start -->
		<div class="app-pg-cont">
			<form id="ef-form-underwriting">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-12 col-md-12">
							<h3 class="heading-title"><fmt:message key="underwriting.title.easyhealth" bundle="${msg}" /></h3>
							<div class="row form-group question-row">
								<div class="col-xs-12">
									<h4><fmt:message key="underwriting.question.q1" bundle="${msg}" /></h4>
								</div>
								<div class="col-xs-11">
									<p><label for="ehUnderWriting1"><fmt:message key="underwriting.question.q1.copy" bundle="${msg}" /></label></p>
								</div>
								<div class="col-xs-1">
									<div class="form-group">
										<div class="checkbox">
											<input type="checkbox" name="ehUnderWriting1" id="ehUnderWriting1" value="">
											<label for="ehUnderWriting1">&nbsp;</label>
										</div>
									</div>
									<!-- <div class="radio-gp">
										<label class="radio-inline"><input type="radio" name="ehUnderWriting1" value="Yes"><fmt:message key="underwriting.option.yes" bundle="${msg}" /></label>
										<label class="radio-inline"><input type="radio" name="ehUnderWriting1" value="No"><fmt:message key="underwriting.option.no" bundle="${msg}" /></label>
									</div> -->
								</div>
								<div class="col-xs-12 col-md-12">
									<span class="error-msg" id="ehUnderWriting1ErrMsg"></span>
								</div>
							</div>
                            <div class="row form-group question-row">
                                <div class="col-xs-12">
                                    <h4><fmt:message key="underwriting.question.q2" bundle="${msg}" /></h4>
                                </div>
                                <div class="col-xs-11">
                                    <p><label for="ehUnderWriting2"><fmt:message key="underwriting.question.q2.copy" bundle="${msg}" /></label></p>
                                </div>
                                <div class="col-xs-1">
                                	<div class="form-group">
	                                	<div class="checkbox">
											<input type="checkbox" name="ehUnderWriting2" id="ehUnderWriting2" value="">
											<label for="ehUnderWriting2">&nbsp;</label>
										</div>
									</div>
                                    <!-- <div class="radio-gp">
                                        <label class="radio-inline"><input type="radio" name="ehUnderWriting2" value="Yes"><fmt:message key="underwriting.option.yes" bundle="${msg}" /></label>
                                        <label class="radio-inline"><input type="radio" name="ehUnderWriting2" value="No"><fmt:message key="underwriting.option.no" bundle="${msg}" /></label>

                                    </div> -->
                                </div>
                                <div class="col-xs-12 col-md-12">
                                    <span class="error-msg" id="ehUnderWriting2ErrMsg"></span>
                                </div>
                            </div>
							<div class="row form-group question-row">
								<div class="col-xs-12">
									<h4><fmt:message key="underwriting.question.q3" bundle="${msg}" /></h4>
								</div>
								 
								<div class="col-xs-11 col-md-11">
									<div class="row">
										<div class="col-xs-12">
											<p><label for="ehUnderWriting3"><fmt:message key="underwriting.question.q3.copy" bundle="${msg}" /></label></p>
										</div>
										<!-- <div class="col-xs-12 col-md-6">
											<ul>
												<li><fmt:message key="underwriting.question.q3.sickness1" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness2" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness3" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness4" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness5" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness6" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness7" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness8" bundle="${msg}" /></li>
											</ul>
										</div>
										<div class="col-xs-12 col-md-6">
											<ul>
												<li><fmt:message key="underwriting.question.q3.sickness9" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness10" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness11" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness12" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness13" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness14" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness15" bundle="${msg}" /></li>
												<li><fmt:message key="underwriting.question.q3.sickness16" bundle="${msg}" /></li>
											</ul>
										</div>-->
									</div>
								</div>
								<div class="col-xs-1 col-md-1">
									<div class="form-group">
										<div class="checkbox">
											<input type="checkbox" name="ehUnderWriting3" id="ehUnderWriting3" value="">
											<label for="ehUnderWriting3">&nbsp;</label>
										</div>
									</div>
									<!-- <div class="radio-gp">
										<label class="radio-inline"><input type="radio" name="ehUnderWriting3" value="Yes"><fmt:message key="underwriting.option.yes" bundle="${msg}" /></label>
										<label class="radio-inline"><input type="radio" name="ehUnderWriting3" value="No"><fmt:message key="underwriting.option.no" bundle="${msg}" /></label>
									</div> -->
								</div>
								<div class="col-xs-12 col-md-12">
									<span class="error-msg" id="ehUnderWriting3ErrMsg"></span>
								</div>
							</div>
							<div class="tnc-row form-group">
								<div class="checkbox">
									<input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC"><fmt:message key="underwriting.declaration" bundle="${msg}" /></label>
									<span class="error-msg" id="ehUnderWriting4ErrMsg"></span>
									</div>
							</div>
							<div class="btn-row text-center">
								<a href="javascript:void(0);" class="btn-app eh-btn-next grey-out" id="eh-btn-underwriting-next"><fmt:message key="button.next" bundle="${msg}" /></a>
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
					Please call our Customer Hotline
					3123 3123
					to find out more or leave your contact and let us call you back.
				</p>
				<form action="" id="eh-cust-serv-form" method="post">
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
					<button type="submit" class="btn next" id="eh-cannot-apply-btn">
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

var nextPageFlow = '<%=request.getContextPath()%>/${language}/${nextPageFlow}';
	$(document).ready(function(){
		$('#eh-cust-serv-form').bootstrapValidator({
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
                	   notEmpty: {
                           message: '<fmt:message key="eliteTerms.selectPlan.Your.email.address.is.invalid" bundle="${msg}" />'
                        },
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
	               		$.get(context+'/ajax/eliteTerm/contactCs',
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
		
		
		
		
		$('#et-select-plan-go-homepage').on('click', function(e) {
			window.location.href= contextPath+'/'+language+'/medical-insurance';
		});
	});
</script>