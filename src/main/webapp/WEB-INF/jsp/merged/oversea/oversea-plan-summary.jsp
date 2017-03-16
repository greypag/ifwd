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
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item1" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item2" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="Overseas.PlanOptions.progressbar.item3" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="Overseas.PlanOptions.progressbar.item4" bundle="${msg}" /></div>
    </div>
</section>
<!--/#main-Content-->
<section>
    <div id="cn" class="oversea-summary-detail-wrapper container">
        <div class="row">
            <form name="paymentForm" id="paymentForm" method="post">
				<!-- <div class="oversea-summary-mainhead col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
					<h3 class="h2-3-existing-fwd-head summary-header summary-header-margin oversea-summary-mainhead" style="margin-left:0px !important;"><fmt:message key="Overseas.Payment.Summaryheader" bundle="${msg}" /></h3>
				</div>
				-->
				<div class="clearfix"></div>
                <ol class="breadcrumb pad-none">
				  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer1" bundle="${msg}" /></a> <i class="fa fa-chevron-right"></i></li>
				  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer2" bundle="${msg}" /></a></li> <i class="fa fa-chevron-right"></i></li>
				  <li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer3" bundle="${msg}" /></a></li>
				  <li class="active "><i class="fa fa-chevron-right"></i><fmt:message key="Overseas.payment.progressbar.item3" bundle="${msg}" /></li>
                </ol>
                <div class="oversea-summary-detail-wrapper container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container product_summary_container">
                       <div class="row summary-row">
                           <div style="width:80%;margin-left:10%;">						   
								<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
									<h3 class="h2-3-existing-fwd-head summary-header summary-header-margin oversea-summary-subhead" style="margin-left:0px !important;"><fmt:message key="Overseas.Payment.Summary" bundle="${msg}" /></h3>
								</div>
                             <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="row summary-row summary-group-divider">
			
                            <div style="width:80%;margin-left:10%;">
									
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="Overseas.Payment.Summary.Applicant.sectiontitle" bundle="${msg}" /></span></div>
										</div>								
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Fullname" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.fullName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.HKID" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.hkid }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.DOB" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.applicantDob }</div>
                                        </div>                                      
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Email" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.emailAddress }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Mobile" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.mobileNo }</div>
                                        </div>                                      
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Relationship" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${applicantRelationshipDisplay }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Correspondence" bundle="${msg}" /></div>
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
	                                            <c:choose>
		                                            <c:when test="${planDetailsForm.correspondenceAddressStreetNo != '' && planDetailsForm.correspondenceAddressStreetName !=''}">
		                                                ${planDetailsForm.correspondenceAddressStreetNo} ${planDetailsForm.correspondenceAddressStreetName},
		                                            </c:when>
		                                             <c:when test="${planDetailsForm.correspondenceAddressStreetNo == '' && planDetailsForm.correspondenceAddressStreetName !=''}">
		                                                ${planDetailsForm.correspondenceAddressStreetName},
		                                            </c:when>
		                                             <c:when test="${planDetailsForm.correspondenceAddressStreetNo != '' && planDetailsForm.correspondenceAddressStreetName ==''}">
		                                                ${planDetailsForm.correspondenceAddressStreetNo},
		                                            </c:when>		                                            
	                                            </c:choose>	                                            
	                                            <c:if test="${planDetailsForm.applicantDistrictDesc != ''}">
	                                                ${planDetailsForm.applicantDistrictDesc},
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.correspondenceAddressDistrictDesc != ''}">
	                                                ${planDetailsForm.correspondenceAddressDistrictDesc}
	                                            </c:if>
                                            </div>
                                        </div>											
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.RequestNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${createPolicy.referenceNo }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Plan" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><!--${planSelected }-->
                                                <c:choose>
                                                    <c:when test="${planSelected == 'basicA'}">
                                                    <fmt:message key="Overseas.Plan.Name.Standard.PlanA" bundle="${msg}" />
                                                    </c:when>
                                                    <c:when test="${planSelected == 'basicB'}">
                                                    <fmt:message key="Overseas.Plan.Name.Standard.PlanB" bundle="${msg}" />
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalWorldwideA'}">
                                                    <fmt:message key="Overseas.Plan.Name.Comprehensive.PlanA" bundle="${msg}" />
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalWorldwideB'}">
                                                    <fmt:message key="Overseas.Plan.Name.Comprehensive.PlanB" bundle="${msg}" />
                                                    </c:when>
                                                    <c:when test="${planSelected == 'medicalAsiaA'}">
                                                    <fmt:message key="Overseas.Plan.Name.Comprehensive.PlanA" bundle="${msg}" />
                                                    </c:when>
                                                     <c:when test="${planSelected == 'medicalAsiaB'}">
                                                    <fmt:message key="Overseas.Plan.Name.Comprehensive.PlanB" bundle="${msg}" />
                                                    </c:when>                                                                                                                                                                                                                                                                                                                                                                         
                                                </c:choose>                                            
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Region" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
	                                            <c:choose>
													<%-- <c:when test="${planSelected == 'medicalAsiaA' || planSelected == 'medicalAsiaB'}"> --%>
													<c:when test="${planIndex == '6' || planIndex == '7'}">
													    <fmt:message key="Overseas.PlanOptions.Region.Asiaonly" bundle="${msg}" />
													</c:when>
													<c:when test="${planIndex == '4' || planIndex == '5'}">
													    <fmt:message key="Overseas.PlanOptions.Region.WorldwideAsia" bundle="${msg}" />
													</c:when>
													<c:otherwise>
													    <fmt:message key="Overseas.PlanOptions.Region.Worldwide" bundle="${msg}" />
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
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="Overseas.Payment.Summary.Insured..sectiontitle" bundle="${msg}" /></span></div>
										</div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Insured.Fullname" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.personalName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Insured.HKID" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.personalHKID }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Insured.DOB" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.insuredDob }</div>
                                        </div>
                                        <!-- 
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Insured.Email" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.emailAddress }</div>
                                        </div>
                                         -->
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Beneficiary" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${overseaBeneficaryDesc} </div>
                                        </div>
                                        <c:if test="${planDetailsForm != null && planDetailsForm.personalBeneficiary != 'SE'}" >
	                                        <div class="row summary-row">
	                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Beneficiary.fullname" bundle="${msg}" /></div>
	                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${planDetailsForm.beneficiaryFullName }</div>
	                                        </div>
	                                        <div class="row summary-row">
	                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Beneficiary.hkid" bundle="${msg}" /></div>
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
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="Overseas.Payment.Summary.Institution.sectiontitle" bundle="${msg}" /></span></div>
										</div>										
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Applicant.Peroid" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="Overseas.Payment.Summary.Applicant.Peroid.From" bundle="${msg}" /> ${planDetailsForm.departureDate } <fmt:message key="Overseas.Payment.Summary.Applicant.Peroid.To" bundle="${msg}" /> ${planDetailsForm.returnDate }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Institution.Country" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${planDetailsForm.countryOfInstitution }</div>
                                        </div>	
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Institution.Name" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${planDetailsForm.nameOfInstitution }</div>
                                        </div>	
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.Institution.Address" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textCap">${AddressofInstitutionLine }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 h2-1 pad-none summary-detail-head">
                                            <div class="checkbox">
                                                <input type="checkbox" disable="disable" checked onclick="return false">
                                                <label ><fmt:message key="Overseas.Payment.Summary.StudentVisaHolder" bundle="${msg}" /></label>
                                            </div>
										</div>                                                                            
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="Overseas.Payment.Summary.originalamount" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                        <fmt:message key="Overseas.Payment.Summary.originalamount.currency" bundle="${msg}" /> <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${originalAmount}" /></div> 
                                        </div>  
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="Overseas.Payment.Summary.AmountDue" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none textUpper"><span class="h4-4-orange-b pad-none">
                                        <fmt:message key="Overseas.Payment.Summary.originalamount.currency" bundle="${msg}" /> <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="3" value="${dueAmount}" /></span></div> 
                                        </div>
										<div class="row summary-row">
											<h4 class="h4-4 product_landing_download_button pull-left">
												<i class="fa fa-download"></i> <a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf" target="_blank"><fmt:message key="Overseas.Payment.Brochure" bundle="${msg}" /></a> <!-- /<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf -->
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
                       <h2 class="from-control" style="padding:0px !important;"><fmt:message key="Overseas.Payment.Details" bundle="${msg}" /></h2>
                       <span id="paymentGatewayErrorMsg" class="text-red">
                           <c:choose>
							   <c:when test="${errormsg=='Invalid Card Verification Number'}">
							       <fmt:message key="common.payment.errormsg" bundle="${msg}" />
							   </c:when>
							   <c:otherwise>
                                   ${errormsg }
                               </c:otherwise>
						   </c:choose>
                       </span>
                    </div>
                    <input type="hidden" name="merchantId" value="${createPolicy.merchantId}">
                    <input type="hidden" name="amount" value="${dueAmount}">
                    <input type="hidden" name="remark" value="${referralCode}">
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
                                <label class="control-label h4-5"><fmt:message key="Overseas.Payment.Details.Cardtype" bundle="${msg}" /></label>
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
                                <label class="control-label h4-5"><fmt:message key="Overseas.Payment.Details.CardNo" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input autocomplete="off" id="cardNo1" type="tel" class="js-field-creditcard input-block-level cardnumber" maxlength="19" data-min="19" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardnumber').val());">

                                <span id="errcardno" class="error-msg"></span>
                                <input id="cardnumber" name="cardNo" type="hidden" class="input-block-level" maxlength="16" data-min="16">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="Overseas.Payment.Details.Expiry" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <div class="styled-select payment-select" id="inputMonth"><select class="pay-details-select" id="month" name="epMonth" onblur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
                                        <option value="0"><fmt:message key="Overseas.Payment.Details.Expiry.Month" bundle="${msg}" /></option>
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
                                        <option value="0"><fmt:message key="Overseas.Payment.Details.Expiry.Year" bundle="${msg}" /></option>
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
                                <label class="control-label  h4-5"><fmt:message key="Overseas.Payment.Details.Name" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input autocomplete="off" id="holdername" name="cardHolder" type="text" class="js-field-fullname input-block-level" onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');" onkeypress="return alphaOnly(event);"> <span id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="Overseas.Payment.Details.CVV" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode" class="js-field-mobile input-block-level" autocomplete="off" maxlength="3" title="" onblur="replaceNumeric(this);"
                                            onkeypress="return isNumeric(event);">
                                <span id="errcode" class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                       <div class="form-group float">
                        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title"></div>
                        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                        		<div><fmt:message key="payment.gi.address.line1" bundle="${msg}" /></div>
                        		<div><fmt:message key="payment.gi.address.line2" bundle="${msg}" /></div>
                        		<div><fmt:message key="payment.gi.address.line3" bundle="${msg}" /></div>
                        	</div>
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                    
                    
                    
                    
                    <div class="clearfix"></div>
                    <div class="declaration-content" style="margin:0px !important;">
                        <div class="checkbox" style="padding-left: 24px;">
                            <input id="checkbox3" type="checkbox"> <label for="checkbox3"><fmt:message key="Overseas.Payment.Details.Authorize" bundle="${msg}" /><br/><fmt:message key="Overseas.Payment.Details.Declare" bundle="${msg}" /></label>
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
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
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
                             <fmt:message key="Overseas.Payment.Paydollar" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="Overseas.Payment.VISA" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="Overseas.Payment.MasterCard" bundle="${msg}" />
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>
