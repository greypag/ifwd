<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script type='text/javascript'>
perventRedirect=true;

var enablePayment=true;
var clicked = false;
function confirmOverseaPayment(form, gatewayUrlId, paymentFormId) {
	if(enablePayment){
		enablePayment=false;
		$("#PaymentingDiv").show();
	    if(payValid() && clicked === false) {
	        clicked = true;
	        var gatewayUrlId = '#' + gatewayUrlId;
	        var paymentFormId = '#' + paymentFormId;
	        var method = "<%=request.getContextPath()%>/ajax/oversea/processOverseaPayment";
	         
	        var geteWayUrl = $(gatewayUrlId).val();
	        console.log($(paymentFormId).serialize());
	        $.ajax({
	            type : "POST",
	            url : method,
	            data : $(paymentFormId).serialize(),
	            async : false,
	            success : function(data) {
	                clicked = false;
	                //$("#PaymentingDiv").hide();
	                if (data == 'success') {
	                    setTimeout(function(){
	                        $("#"+form).attr('action', geteWayUrl);
	                        $("#"+form).submit();
	                    }, 3000);
	                } else {
	                    console.log(data);
	                    $("#PaymentingDiv").hide();
	                    enablePayment=true;
	                    $('#paymentErrorPopup').modal('show');
	                    return false;
	                }
	            }
	        });
	        return true;
	    }else{ 
	    	$("#PaymentingDiv").hide();
	        enablePayment=true;	
	     	return false;
	    };
	}
}
$(document).ready(function(){
    $('#cardNo1').payment('formatCardNumber');
    $('#cardNo1').keyup(function() {
        var replaceSpace = $(this).val(); 
        var result = replaceSpace.replace(/\s/g,'');
        $("#cardnumber").val(result);
    });
});
</script>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item1'>Plan options</key><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item2'>Application</key></div>
        <div class="product_header_path_item active"><key id='Overseas.PlanOptions.progressbar.item3'>Payment</key></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><key id='Overseas.PlanOptions.progressbar.item4'>Confirmation</key></div>
    </div>
</section>
<!--/#main-Content-->
<section>
    <div id="cn" class="oversea-summary-detail-wrapper container">
        <div class="row">
            <form name="paymentForm" id="paymentForm" method="post">
				<!-- <div class="oversea-summary-mainhead col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
					<h3 class="h2-3-existing-fwd-head summary-header summary-header-margin oversea-summary-mainhead" style="margin-left:0px !important;"><key id='Overseas.Payment.Summaryheader'>Your summary and payment</key></h3>
				</div>
				-->
				<div class="clearfix"></div>
                <ol class="breadcrumb pad-none">
				  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer1'>Home</key></a> <i class="fa fa-chevron-right"></i></li>
				  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer2'>Protect</key></a></li> <i class="fa fa-chevron-right"></i></li>
				  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer3'>Overseas StudentCare Insurance</key></a></li>
				  <li class="active "><i class="fa fa-chevron-right"></i><key id='Overseas.Landing.Breadcrumb.step3'>Payment</key></li>
                </ol>
                <div class="oversea-summary-detail-wrapper container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container product_summary_container">
                       <div class="row summary-row">
                           <div style="width:80%;margin-left:10%;">						   
								<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
									<h3 class="h2-3-existing-fwd-head summary-header summary-header-margin oversea-summary-subhead" style="margin-left:0px !important;"><key id='Overseas.Payment.Summary'>Plan Summary</key></h3>
								</div>
                             <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="row summary-row summary-group-divider">
			
                            <div style="width:80%;margin-left:10%;">
									
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><key id='Overseas.Payment.Summary.Applicant.sectiontitle'>Applicant</key></span></div>
										</div>								
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Fullname'>Full name</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.fullName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.HKID'>HKID</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.hkid }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.DOB'>Date of birth</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.applicantDob }</div>
                                        </div>                                      
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Email'>Email address</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.emailAddress }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Mobile'>Mobile no.</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.mobileNo }</div>
                                        </div>                                      
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Relationship'>Relationship with insured person</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">XXX</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Correspondence'>Correspondence address</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                                <c:if test="${planDetailsForm.correspondenceAddressRoom != ''}">
	                                                Room/Flat ${planDetailsForm.correspondenceAddressRoom}, 
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.correspondenceAddressFloor != ''}">
	                                                Floor ${planDetailsForm.correspondenceAddressFloor}, 
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.correspondenceAddressBlock != ''}">
	                                                Block ${planDetailsForm.correspondenceAddressBlock}, 
	                                            </c:if>
	                                            
	                                            <c:if test="${planDetailsForm.correspondenceAddressBuilding != ''}">
	                                                ${planDetailsForm.correspondenceAddressBuilding},
	                                            </c:if>
	                                            
	                                            <c:if test="${planDetailsForm.correspondenceAddressEstate != ''}">
	                                                ${planDetailsForm.correspondenceAddressEstate},
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.correspondenceAddressStreetNo != ''}">
	                                                ${planDetailsForm.correspondenceAddressStreetNo} 
	                                            </c:if>
	                                             <c:if test="${planDetailsForm.correspondenceAddressStreetName != ''}">
	                                                ${planDetailsForm.correspondenceAddressStreetName},
	                                            </c:if>
	                                            
	                                            <c:if test="${planDetailsForm.applicantDistrictDesc != ''}">
	                                                ${planDetailsForm.applicantDistrictDesc},
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.correspondenceAddressDistrictDesc != ''}">
	                                                ${planDetailsForm.correspondenceAddressDistrictDesc}
	                                            </c:if>
	                                            Hong Kong
                                            </div>
                                        </div>											
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.RequestNo'>Request no.</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${createPolicy.referenceNo }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Plan'>Plan</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><!--${planSelected }-->
                                                <c:choose>
                                                    <c:when test="${planSelected == 'basicA'}">
                                                    Standard Overseas StudyCare Insurance - Plan A
                                                    </c:when>
                                                    <c:when test="${planSelected == 'basicB'}">
                                                    Standard Overseas StudyCare Insurance - Plan B
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalWorldwideA'}">
                                                    Comprehensive Medical Overseas StudyCare Insurance - Plan A
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalWorldwideB'}">
                                                    Comprehensive Medical Overseas StudyCare Insurance - Plan B
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalAsiaA'}">
                                                    Comprehensive Medical Overseas StudyCare Insurance - Plan A
                                                    </c:when>
                                                     <c:when test="${planSelected == 'medicalAsiaB'}">
                                                    Comprehensive Medical Overseas StudyCare Insurance - Plan B
                                                    </c:when>                                                                                                                                                                                                                                                                                                                                                                         
                                                </c:choose>                                            
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Region'>Region</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
	                                            <c:choose>
													<c:when test="${planSelected == 'medicalAsiaA' || planSelected == 'medicalAsiaB'}">
													Asia Only
													</c:when>
													<c:otherwise>
													Worldwide
													</c:otherwise>
												</c:choose>
                                            </div>
                                        </div>	
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           </div>
                        </div>
                        
                        
                        
						<div class="row summary-row summary-group-divider">
			
                            <div style="width:80%;margin-left:10%;">
									
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><key id='Overseas.Payment.Summary.Insured..sectiontitle'>Insured person</key></span></div>
										</div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Insured.Fullname'>Full name</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.personalName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Insured.HKID'>HKID</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.personalHKID }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Insured.DOB'>DOB</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.insuredDob }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Insured.Email'>Email address</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.emailAddress }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Beneficiary'>Beneficiary</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${overseaBeneficaryDesc} </div>
                                        </div>
                                        <c:if test="${planDetailsForm != null && planDetailsForm.personalBeneficiary != 'SE'}" >
	                                        <div class="row summary-row">
	                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Beneficiary.Fullname'>Full name(Beneficiary)</key></div>
	                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.beneficiaryFullName }</div>
	                                        </div>
	                                        <div class="row summary-row">
	                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Beneficiary.hkid'>HKID(Beneficiary)</key></div>
	                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.beneficiaryID }</div>
	                                        </div>
                                        </c:if>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           </div>
                        </div>
                        
                        
                        
                        <div class="row summary-row summary-group-divider">
            
                            <div style="width:80%;margin-left:10%;">
                                    
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">

                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><key id='Overseas.Payment.Summary.Institution.sectiontitle'>Educational institution</key></span></div>
										</div>										
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Applicant.Peroid'>Period of insurance</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">From ${planDetailsForm.departureDate } to ${planDetailsForm.returnDate }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Institution.Country'>Educational institution country</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${planDetailsForm.countryOfInstitution }</div>
                                        </div>	
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Institution.Name'>Educational institution name</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${planDetailsForm.nameOfInstitution }</div>
                                        </div>	
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.Institution.Address'>Educational institution address</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${AddressofInstitutionLine }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.StudentVisaHolder'>Student visa holder</key></div>
											<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">Yes</div>
										</div>                                                                            
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><key id='Overseas.Payment.Summary.originalamount'>Original amount</key></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">HK$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${originalAmount}" /></div> 
                                        </div>  
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><key id='Overseas.Payment.Summary.AmountDue'>Amount due</key></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none textUpper"><span class="h4-4-orange-b pad-none">HK$ <fmt:formatNumber type="number" maxFractionDigits="3" value="${dueAmount}" /></span></div> 
                                        </div>
										<div class="row summary-row">
											<h4 class="h4-4 product_landing_download_button pull-left">
												<i class="fa fa-download"></i> <a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf" target="_blank"><key id='Overseas.Payment.Brochure'>Download Brochure</key></a> <!-- /<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf -->
											</h4>	
										</div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           </div>
                        </div>						
                        <div class="clearfix"></div>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>
                
                
                
                <div class="gray-bg1 product_payment_detail_form_container ">
                    <div style="width:80%;margin-left:10%;">
                    <!-- Payment Form -->
                    <div class="col-xs-12 pad-none">
                       <h2 class="from-control" style="padding:0px !important;"><key id='Overseas.Payment.Details'>Payment Details</key></h2>
                       <span id="paymentGatewayErrorMsg" class="text-red"></span>
                    </div>
                    <input type="hidden" name="merchantId" value="${createPolicy.merchantId}">
                    <input type="hidden" name="amount" value="${dueAmount.trim()}">
                    <input type="hidden" name="remark" value="${referralCode.trim()}">
                    <input type="hidden" name="orderRef" value="${createPolicy.transactionNo }">
                    <input type="hidden" name="currCode" value="${createPolicy.currCode }">
                    <input type="hidden" name="successUrl" value="${path}">
                    <input type="hidden" name="failUrl" value="${failurePath }">
                    <input type="hidden" name="errorUrl" value="${failurePath }">
                    <input type="hidden" name="payType" value="${createPolicy.paymentType}">
                    <input type="hidden" name="referenceNo" value="${createPolicy.referenceNo}">
                    
                    <input type="hidden" name="lang" value="C">
                    <input type="hidden" name="secureHash" value="${createPolicy.secureHash }">
                    <input type="hidden" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress}">
                    <input type="hidden" id="gateway" name="gateway" value="${createPolicy.paymentGateway}">





                    <div class="col-xs-12 pad-none product_payment_details">
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label h4-5"><key id='Overseas.Payment.Details.Cardtype'>Card type</key></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float" style="display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <label class="control-label h4-5">Payment Method</label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <label class="radio-inline">                            
                                 <input type="radio" name="pMethod" checked="checked" value="VISA" id="chkVisa"> VISA
                                </label>    
                                <label class="radio-inline">        
                                    <input type="radio" name="pMethod" value="Master" id="chkMaster"> MasterCard 
                                </label>
                                
                                <!-- <input type="radio" name="pMethod" value="Diners">Diners
                                    Club <input type="radio" name="pMethod" value="JCB">JCB
                                    <input type="radio" name="pMethod" value="AMEX">AMEX
                                    
                                    -->
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label h4-5"><key id='Overseas.Payment.Details.CardNo'>Credit card number</key></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input id="cardNo1" type="tel" class="input-block-level cardnumber" maxlength="19" data-min="19" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardnumber').val());">

                                <span id="errcardno" class="error-msg"></span>
                                <input id="cardnumber" name="cardNo" type="hidden" class="input-block-level" maxlength="16" data-min="16">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><key id='Overseas.Payment.Details.Expiry'>Expiry date</key></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <div class="styled-select payment-select" id="inputMonth"><select class="pay-details-select" id="month" name="epMonth" onblur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
                                        <option value="0"><key id='Overseas.Payment.Details.Expiry.Month'>Month</key></option>
                                        <option value="1">01</option>
                                        <option value="2">02</option>
                                        <option value="3">03</option>
                                        <option value="4">04</option>
                                        <option value="5">05</option>
                                        <option value="6">06</option>
                                        <option value="7">07</option>
                                        <option value="8">08</option>
                                        <option value="9">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                </select></div>
                                <span id="errmonth" class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-left: 2% !important;">
                                <div class="styled-select payment-select" id="inputYear"><select class="pay-details-select" id="year" name="epYear" onblur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
                                        <option value="0"><key id='Overseas.Payment.Details.Expiry.Year'>year</key></option>
                                    <c:forEach begin="0" end="10" varStatus="loop">
                                        <c:set var="currentYear" value="${year + loop.index}" />
                                        <option value="${currentYear}">${currentYear}</option>
                                    </c:forEach>
                                </select></div>
                                <span id="erryear" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><key id='Overseas.Payment.Details.Name'>Name on credit card</key></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input id="holdername" name="cardHolder" type="text" class="input-block-level" onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');" onkeypress="return alphaOnly(event);"> <span id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><key id='Overseas.Payment.Details.CVV'>CVV</key></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode" class="input-block-level" autocomplete="off" maxlength="3" title="" onblur="replaceAlphaNumeric(this);" onkeypress="return isAlphaNumeric(event);">
                                <span id="errcode" class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    
                    
                    
                    
                    <div class="clearfix"></div>
                    <div class="declaration-content" style="margin:0px !important;">
                        <div class="checkbox" style="padding-left: 24px;">
                            <input id="checkbox3" type="checkbox"> <label for="checkbox3"> I hereby authorize FWD General Insurance Company Limited to debit my Credit Card Account for the premium of this insurance. No refund of premium is allowed once the insurance certificate has been issued.</label>
                        </div>
                        <span id="errchk1" class="error-msg"></span>

                        <span id="errchk2" class="error-msg"></span>
                        <div class="clearfix"></div>
                        
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 pull-right">
                                <c:choose>
								    <c:when test="${language=='en'}">
								        <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Oversea_Step3 EN','USD');perventRedirect=false;confirmOverseaPayment('paymentForm', 'gateway', 'paymentForm');"
								            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
								    </c:when>
								    <c:otherwise>
									    <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Oversea_Step3 ZH','USD');perventRedirect=false;confirmOverseaPayment('paymentForm', 'gateway', 'paymentForm');"
								            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
								    </c:otherwise>
								</c:choose>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-right">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();">Back </a>
                            </div>
                        </div>
                        
                            <div class="clearfix"></div>
                        </div>
                        
                        <hr class="summary-hr">

                        
                        
                        <div id="paydoller-wrap" class="declaration-content" style="margin:0px !important;">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <key id='Overseas.Payment.Paydollar'>We adopt PayDollar payment gateway, a leading, secure and reliable international payment service provider to banks and online merchants.</key>
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <key id='Overseas.Payment.VISA'>Verified by Visa is a new way to add safety when you buy online. It ensures that only you can use your Visa card online.</key>
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <key id='Overseas.Payment.MasterCard'>MasterCard SecureCode is a new service that enhances your existing MasterCard card. A private code gives added protection against unauthorized use of your card when you shop at participating online merchants.</key>
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div class="clearfix"></div>
                        </div>
                        <br>
                        <br>
                        </div>
                    </div>
                    
                    
                    <div class="form-wrap" style="margin-bottom: 10px;">

                </form></div>
            
        </div>
        <!--/.row-->
    
    <!--/.container-->
</section>
<!--/end Main Content-->
<div id="PaymentingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img style="width: 300px; height: 300px;" src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
</div>

<link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>
