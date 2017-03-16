<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.model.AnnualDetailsForm"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<%-- <c:set var="dueAmount" value="1800"/> --%>
<script>
perventRedirect=true;

var enablePayment=true;
var dueAmount = ${dueAmount};
    var clicked = false;
    function confirmTravelPayment(form, gatewayUrlId, paymentFormId) {
    	if(enablePayment){
    		enablePayment=false;
    		$("#PaymentingDiv").show();
	        if (payValid() && clicked === false) {
	            clicked = true;
	            
	            var gatewayUrlId = '#' + gatewayUrlId;
	            var paymentFormId = '#' + paymentFormId;
	            var method = "<%=request.getContextPath()%>/ajax/annualTravel/processTravePayment/post";
	            
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
function hidePaymentSection(paymentValue){
	if(paymentValue<=0){
		$(".js-hide-payment").hide();
	}
}
$(document).ready(function(){
    $('#cardNo1').payment('formatCardNumber');
    $('#cardNo1').keyup(function() {
        var replaceSpace = $(this).val(); 
        var result = replaceSpace.replace(/\s/g,'');
        $("#cardnumber").val(result);
    });
    hidePaymentSection(dueAmount);
});
    
</script>


<%
AnnualDetailsForm planDetailsForm = (AnnualDetailsForm) request.getAttribute("planDetailsForm");
%>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.planoption" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.application" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="annual.title.payment" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.confirmation" bundle="${msg}" /></div>
    </div>
</section>
<!--/#main-Content-->
<section>
    <div id="cn" class="container">
        <div class="row">
            <form name="paymentForm" id="paymentForm" method="post">
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="annual.title.home" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                                        <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="annual.title.travelcare" bundle="${msg}" /></li>
                    <li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="annual.title.summarypayment" bundle="${msg}" /></li>
                </ol>
                <div class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container product_summary_container">
                       <div class="row summary-row">
                           <div style="width:80%;margin-left:10%;">
                               <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
                                <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin" style="margin-left:0px !important;"><fmt:message key="annual.summary.plansummary" bundle="${msg}" /></h3>
                            </div>
                             <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="row summary-row">
                            <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.fullname" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.fullName }</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.hkid" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.hkid}</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.emailaddress" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.emailAddress }</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.mobile" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.mobileNo }</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.correspondenceaddress" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
                                            	<c:if test="${planDetailsForm.applicantRoom != ''}">
	                                                Room/Flat ${planDetailsForm.applicantRoom}, 
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.applicantFloor != ''}">
	                                                Floor ${planDetailsForm.applicantFloor}, 
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.applicantBlock != ''}">
	                                                Block ${planDetailsForm.applicantBlock}, 
	                                            </c:if>
	                                            
	                                            <c:if test="${planDetailsForm.applicantBuilding != ''}">
	                                                ${planDetailsForm.applicantBuilding},
	                                            </c:if>
	                                            
	                                            <c:if test="${planDetailsForm.applicantEstate != ''}">
	                                                ${planDetailsForm.applicantEstate},
	                                            </c:if>
	                                            <c:choose>
		                                            <c:when test="${planDetailsForm.applicantStreetNo != '' && planDetailsForm.applicantStreetName !=''}">
		                                                ${planDetailsForm.applicantStreetNo} ${planDetailsForm.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${planDetailsForm.applicantStreetNo == '' && planDetailsForm.applicantStreetName !=''}">
		                                                ${planDetailsForm.applicantStreetName},
		                                            </c:when>
		                                             <c:when test="${planDetailsForm.applicantStreetNo != '' && planDetailsForm.applicantStreetName ==''}">
		                                                ${planDetailsForm.applicantStreetNo},
		                                            </c:when>		                                            
	                                            </c:choose>	                                            
	                                            <c:if test="${planDetailsForm.applicantDistrictDesc != ''}">
	                                                ${planDetailsForm.applicantDistrictDesc},
	                                            </c:if>
	                                            <c:if test="${planDetailsForm.applicantAreaDesc != ''}">
	                                                ${planDetailsForm.applicantAreaDesc}
	                                            </c:if>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.request" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${createPolicy.referenceNo}</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.plan" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="annual.summary.plan" bundle="${msg}" /> ${selectPlanName}</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.no" bundle="${msg}" /></div>

                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">
                                            <%
                                                if (planDetailsForm != null) 
                                                {
                                                    if (planDetailsForm.getPlanSelected().equals("personal"))
                                                    {
                                                        out.println( planDetailsForm.getTotalPersonalTraveller() );
                                                    }
                                                    else
                                                    {
                                                        out.println( planDetailsForm.getTotalAdultTraveller() +
                                                                     planDetailsForm.getTotalChildTraveller());
                                                    }
                                                }               
                                            %>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="annual.summary.period" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="travel.summary.period.from" bundle="${msg}" /> ${travelBean.trLeavingDate} <fmt:message key="travel.summary.period.to" bundle="${msg}" /> ${travelBean.trBackDate}</div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="row summary-row">
	                                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.originalamount" bundle="${msg}" /></div>
	                                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="annual.common.dollar" bundle="${msg}" /> ${originalAmount }</div>
	                                    </div>
                                        <div class="row summary-row product_summary_orange_price">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="annual.summary.amount" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none textUpper"><span class="h4-4-orange-b h2-3-existing-fwd-head pad-none"><fmt:message key="annual.common.dollar" bundle="${msg}" /> ${dueAmount}</span></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="clearfix"></div>
                        
                        <hr class="hidden-lg hidden-md"/>
                        
                        <div id="no-more-tables2" class="hidden-md hidden-lg" style="margin-bottom:30px;">
                          <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 pad-none">
                                <div class="text-left">
                                    <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin"><fmt:message key="annual.summary.insured.person" bundle="${msg}" /></h3>
                                </div>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) {
                                %>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="annual.summary.insured.traveller" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.fullname" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getPersonalName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.dateofbirth" bundle="${msg}" /></div>

                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getPersonalDob()[i]%></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getPersonalHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.beneficiary" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper">
                                        <%
                                        	if("個人遺產".equals(planDetailsForm.getPersonalBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getPersonalBeneRelationDesc()[i])){
                                        %>
                                        <%=planDetailsForm.getPersonalBeneRelationDesc()[i] %>
                                        <%
		                                    }else{
		                                %>
		                                <%=planDetailsForm.getPersonalBenificiaryFullName()[i]%> (<%=planDetailsForm.getPersonalBeneRelationDesc()[i] %>)
		                                <div style="margin-top:10px;"><%=planDetailsForm.getPersonalBenificiaryHkid()[i]%> 
		                                    <% if("HKID".equals(planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
		                                </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <%
                                    }
                                %>
                                
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
                                %>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="annual.quote.care.adult" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.fullname" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getAdultName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.dateofbirth" bundle="${msg}" /></div>

                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getAdultDob()[i]%></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if("HKID".equals(planDetailsForm.getSelectedAdHkidPass()[i])) { %><fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />
	                                    <% }else { %><fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />
	                                    <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getAdultHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.beneficiary" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper">
                                        <%
                                        	if("個人遺產".equals(planDetailsForm.getAdultBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getAdultBeneRelationDesc()[i])){
                                        %>
                                        <%=planDetailsForm.getAdultBeneRelationDesc()[i] %>
                                        <%
		                                    }else{
		                                %>
		                                <%=planDetailsForm.getAdultBenificiaryFullName()[i]%> (<%=planDetailsForm.getAdultBeneRelationDesc()[i] %>)
		                                <div style="margin-top:10px;"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%> 
                                            <% if("HKID".equals(planDetailsForm.getSelectedAdBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
		                                </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <%
                                    }
                                %>
                                
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
                                %>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="annual.quote.care.child" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.fullname" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getChildName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.dateofbirth" bundle="${msg}" /></div>

                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getChildDob()[i]%></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if("HKID".equals(planDetailsForm.getSelectedChldHkidPass()[i])) { %><fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />
	                                    <% }else { %><fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />
	                                    <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getChildHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="annual.summary.insured.beneficiary" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper">
                                        <%
                                        	if("個人遺產".equals(planDetailsForm.getChildBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getChildBeneRelationDesc()[i])){
                                        %>
                                        <%=planDetailsForm.getChildBeneRelationDesc()[i] %>
                                        <%
		                                    }else{
		                                %>
		                                <%=planDetailsForm.getChildBenificiaryFullName()[i]%> (<%=planDetailsForm.getChildBeneRelationDesc()[i] %>)
		                                <div style="margin-top:10px;"><%=planDetailsForm.getChildBenificiaryHkid()[i]%> 
		                                    <% if("HKID".equals(planDetailsForm.getSelectedChldBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
		                                </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <%
                                    }
                                %>
                                
                            </div>
                            <div class="clearfix"></div>
                            </div>
                        </div>
                        
                        
                        <div id="no-more-tables" class="hidden-sm hidden-xs" style="margin-bottom:30px;">
                            <div style="width:80%;margin-left:10%;">
                            <table class="table-striped cf beneList bmg_custom_benelist product_payment_detail_benelist">
                                <thead>
                                    <tr class="travel-tb-head">
	                                    <td class="travel-tb-td"><fmt:message key="annual.summary.insured.person" bundle="${msg}" /></td>
	                                    <td class="travel-tb-td"><fmt:message key="annual.summary.insured.fullname" bundle="${msg}" /></td>
	                                    <td class="travel-tb-td"><fmt:message key="annual.summary.insured.dateofbirth" bundle="${msg}" /></td>
	                                    <td class="travel-tb-td"><fmt:message key="annual.summary.insured.hkid" bundle="${msg}" /></td>
	                                    <td class="travel-tb-td"><fmt:message key="annual.summary.insured.beneficiaryrelationship" bundle="${msg}" /></td>
	                                </tr>
                                </thead>
                                <tbody>
                                    <!-- Personal -->
                                    <%
	                                    for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) {
	                                %>
	                                <tr>
	                                    <td data-title="Personal 4"><span class="h4-5"><fmt:message key="annual.summary.insured.traveller" bundle="${msg}" /> <%=i + 1%></span></td>
	                                    <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalName()[i]%></span></td>
	                                    <td data-title="Date of birth"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalDob()[i]%></span></td>
	                                    <td data-title="HKID"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalHKID()[i]%></span></td>
	                                    <%
                                        	if("個人遺產".equals(planDetailsForm.getPersonalBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getPersonalBeneRelationDesc()[i])){
                                        %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalBeneRelationDesc()[i] %></span></td>
	                                </tr>
	                                    <%
		                                    }else{
		                                %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalBenificiaryFullName()[i]%> (<%=planDetailsForm.getPersonalBeneRelationDesc()[i] %>)</span></td>   <!-- hide relationship if insured -->
	                                </tr>
	                                <tr>
                                        <td data-title="Personal 4"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Date of birth"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalBenificiaryHkid()[i]%> 
                                            <% if("HKID".equals(planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
                                        </span></td>
                                    </tr>
                                    <%
		                                    }
	                                    }
                                    %>
                                    
                                    <%
	                                    for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
	                                %>
	                                <tr>
	                                    <td data-title="Personal 4"><span class="h4-5"><fmt:message key="annual.quote.care.adult" bundle="${msg}" /> <%=i + 1%></span></td>
	                                    <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultName()[i]%></span></td>
	                                    <td data-title="Date of birth"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultDob()[i]%></span></td>
	                                    <td data-title="HKID"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultHKID()[i]%></span></td>
	                                    <%
                                        	if("個人遺產".equals(planDetailsForm.getAdultBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getAdultBeneRelationDesc()[i])){
                                        %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultBeneRelationDesc()[i] %></span></td>
	                                </tr>
	                                    <%
		                                    }else{
		                                %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%> (<%=planDetailsForm.getAdultBeneRelationDesc()[i] %>)</span></td>   <!-- hide relationship if insured -->
	                                </tr>
	                                <tr>
                                        <td data-title="Personal 4"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Date of birth"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%> 
                                            <% if("HKID".equals(planDetailsForm.getSelectedAdBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
                                        </span></td>
                                    </tr>
                                    <%
		                                    }
	                                    }
                                    %>
                                    
                                    <%
	                                    for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
	                                %>
	                                <tr>
	                                    <td data-title="Personal 4"><span class="h4-5"><fmt:message key="annual.quote.care.child" bundle="${msg}" /> <%=i + 1%></span></td>
	                                    <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getChildName()[i]%></span></td>
	                                    <td data-title="Date of birth"><span class="h4-5 textUpper"><%=planDetailsForm.getChildDob()[i]%></span></td>
	                                    <td data-title="HKID"><span class="h4-5 textUpper"><%=planDetailsForm.getChildHKID()[i]%></span></td>
	                                    <%
                                        	if("個人遺產".equals(planDetailsForm.getChildBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getChildBeneRelationDesc()[i])){
                                        %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getChildBeneRelationDesc()[i] %></span></td>
	                                </tr>
	                                    <%
		                                    }else{
		                                %>
	                                    <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getChildBenificiaryFullName()[i]%> (<%=planDetailsForm.getChildBeneRelationDesc()[i] %>)</span></td>   <!-- hide relationship if insured -->
	                                </tr>
	                                <tr>
                                        <td data-title="Personal 4"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Date of birth"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getChildBenificiaryHkid()[i]%> 
                                            <% if("HKID".equals(planDetailsForm.getSelectedChldBenefitiaryHkidPass()[i])) { %>(<fmt:message key="annual.summary.insured.benefitiary.hkid" bundle="${msg}" />)
		                                    <% }else { %>(<fmt:message key="annual.summary.insured.benefitiary.passport" bundle="${msg}" />)
		                                    <% } %>
                                        </span></td>
                                    </tr>
                                    <%
		                                    }
	                                    }
                                    %>
                                </tbody>
                            </table>
                          </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="gray-bg1 product_payment_detail_form_container">
                    <div style="width:80%;margin-left:10%;">
                    <c:if test="${dueAmount > 0.00}">
                        <div class="col-xs-12 pad-none">
                           <h2 class="from-control" style="padding:0px !important;"><fmt:message key="annual.summary.paymentdetails" bundle="${msg}" /></h2>
                           <span id="paymentGatewayErrorMsg"  class="text-red">
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
                    </c:if>
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

                    <input type="hidden" name="lang" value="C"> <input
                        type="hidden" name="secureHash"
                        value="${createPolicy.secureHash }"> <input
                        type="hidden" id="emailAddress" name="emailAddress"
                        value="${userDetails.emailAddress}"> <input
                        type="hidden" id="gateway" name="gateway"
                        value="${createPolicy.paymentGateway}">
                    <div class="col-xs-12 pad-none product_payment_details js-hide-payment">
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label h4-5"><fmt:message key="annual.summary.cardtype" bundle="${msg}" /></label>
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
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label h4-5"><fmt:message key="annual.summary.creditcardnumber" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input id="cardNo1" type="tel" class="js-field-creditcard input-block-level cardnumber" maxlength="19" data-min="19" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardnumber').val());" autocomplete="off"/>

                                <span id="errcardno" class="error-msg"></span>
                                <input id="cardnumber" name="cardNo" type="hidden" class="input-block-level" maxlength="16" data-min="16" autocomplete="off"/>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="annual.summary.expirydate" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <div class="styled-select payment-select" id="inputMonth"><select class="pay-details-select"
                                    id="month" name="epMonth" onBlur="chkValidCreditCardExpDate(this, 'erryear', 'month', 'errmonth');">
                                        <option value="0"><fmt:message key="travel.payment.card.expiryDate.month" bundle="${msg}" /></option>
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
                                <span id="errmonth"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-left: 2% !important;">
                                <div class="styled-select payment-select" id="inputYear"><select class="pay-details-select" id="year"
                                    name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
                                        <option value="0"><fmt:message key="travel.payment.card.expiryDate.year" bundle="${msg}" /></option>
                                    <c:forEach begin="0" end="10" varStatus="loop">
                                        <c:set var="currentYear" value="${year + loop.index}" />
                                        <option value="${currentYear}">${currentYear}</option>
                                    </c:forEach>
                                    
                                </select></div>
                                <span id="erryear"
                                    class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="annual.summary.nameoncreditcard" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none">
                                <input id="holdername" name="cardHolder" type="text"
                                            class="js-field-fullname input-block-level"
                                            onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
                                            onkeypress="return alphaOnly(event);"> <span
                                            id="errname" class="error-msg" autocomplete="off"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="annual.summary.securitycode" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode"
                                            class="js-field-mobile input-block-level" autocomplete="off" maxlength="3"
                                            title=""
                                            onblur="replaceNumeric(this);"
                                            onkeypress="return isNumeric(event);" autocomplete="off">
                                <span id="errcode"
                                    class="error-msg"></span>
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
                    	<c:if test="${dueAmount > 0.00}">
	                        <div class="checkbox" style="padding-left: 24px;">
	                            <input id="checkbox3" type="checkbox"> <label
	                                for="checkbox3"> <fmt:message key="annual.summary.declarations" bundle="${msg}" /></label>
	                        </div>
	                        <span id="errchk1" class="error-msg"></span>
	
	                        <span id="errchk2" class="error-msg"></span>
	                        <div class="clearfix"></div>
                        </c:if>
                        <div class="row" style="margin-top:30px;">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 pull-right">
                                <c:choose>
								    <c:when test="${language=='en'}">
								    	<c:choose>
								    		<c:when test="${dueAmount > 0.00}">
										        <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 EN','USD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
										            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>									    		
								        	</c:when>
								        	<c:otherwise>
										        <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 EN','USD')" href="<%=request.getContextPath()%>/${language}/annual-travel-insurance/confirmation"
										            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.next" bundle="${msg}" /></a>							        	
								        	</c:otherwise>
								        </c:choose>
								    </c:when>
								    <c:otherwise>
								    	<c:choose>
									    	<c:when test="${dueAmount > 0.00}">
											    <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 ZH','USD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
										            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
								        	</c:when>
									        <c:otherwise>
											    <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 ZH','USD');" href="<%=request.getContextPath()%>/${language}/annual-travel-insurance/confirmation"
										            class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.next" bundle="${msg}" /></a>										            									        
									        </c:otherwise>
								        </c:choose>
								    </c:otherwise>
								</c:choose>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-right">
                                <!-- <a href="/fwdhk/en/travel-insurance/user-details" class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;">
                                    Back 
                                </a> -->
                                
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /></a>
                            </div>
                        </div>
                            <div class="clearfix"></div>
                        </div>
                        <hr class="summary-hr"/>
                        <div id="paydoller-wrap" class="declaration-content" style="margin:0px !important;">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="annual.summary.paydollar" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="annual.summary.visa" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-5 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-7 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="annual.summary.master" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div class="clearfix"></div>
                        </div>
                        <br/>
                        <br/>
                        </div>
                    </div>
                    
                    <div class="form-wrap" style="margin-bottom: 10px;">
                    <h4 class="h4-4 product_landing_download_button pull-left">
                        <i class="fa fa-download"></i> <a
                            href="<fmt:message key="annualtravel.brochure.link" bundle="${msg}" />"
                            target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" />   </a>
                    </h4>
                    <h4 class="h4-4 product_landing_download_button pull-left">
                        <i class="fa fa-download"></i> <a
                            href="https://home.fwd.com.hk/gidoc/policyprovisions/Travelcare_Annual_JacketLatest.pdf"
                            target="_blank"><fmt:message key="annual.common.policyprovisions" bundle="${msg}" />   </a>
                    </h4>
                    <div class="clearfix"></div>
                    </div>
                </div>
            </form>
        </div>
        <!--/.row-->
    </div>
    <!--/.container-->
</section>
<!--/end Main Content-->
<div id="PaymentingDiv" class="waitingDiv" style="display: none; margin-left:auto; margin-right:auto;">
    <img
        style="width: 300px; height: 300px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>
