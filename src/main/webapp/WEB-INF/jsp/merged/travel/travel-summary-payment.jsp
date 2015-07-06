<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.ifwd.fwdhk.model.PlanDetailsForm"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />

<script>
perventRedirect=true;

var enablePayment=true;

    var clicked = false;
    function confirmTravelPayment(form, gatewayUrlId, paymentFormId) {
    	if(enablePayment){
    		enablePayment=false;
    		$("#PaymentingDiv").show();
	        if (payValid() && clicked === false) {
	            clicked = true;
	            
	            var gatewayUrlId = '#' + gatewayUrlId;
	            var paymentFormId = '#' + paymentFormId;
	            var method = "<%=request.getContextPath()%>/processTravePayment";
	            
	            var geteWayUrl = $(gatewayUrlId).val();
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

</script>


<%
    PlanDetailsForm planDetailsForm = (PlanDetailsForm) request.getAttribute("planDetailsForm");
%>
<!--/#main-Content-->
<section>
    <div id="cn" class="container">
        <div class="row">
            <form name="paymentForm" id="paymentForm" method="post">
                <ol class="breadcrumb pad-none">
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
                    <li><a href="#"><span class="clearfix"></span> <fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></a><i
                        class="fa fa-caret-right"></i></li>
                    <li><a href="#"><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /></a></li>
                    <li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="travel.breadcrumb1.item5" bundle="${msg}" /></li>
                </ol>
                <div class="container ">
                    <div class="col-md-12 shop-tracking-status">
                        <div class="center wow fadeInDown animated"
                            style="visibility: visible;">
                            <h2><fmt:message key="travel.summary.jumbo" bundle="${msg}" /></h2>
                        </div>
                        <br>
                        <div class="col-lg-12">
                            <div id="tr-wizard" class="shop-tracking-status">
                                <div class="order-status has-four">
                                    <div class="order-status-timeline-new">
                                <!--
                                        There can be n '.order-status-timeline-completion'
                                        dots-inactive and dots-active color the dots -->
                                        <div class="order-status-timeline-completion dots-active"></div>
                                        <div class="order-status-timeline-completion dots-active"></div>
                                        <div class="order-status-timeline-completion dots-inactive"></div>
                                    </div>
                                    <div class="image-order-status image-order-status-new active img-circle first">
                                        <span class="status color3"> <fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
                                        <div class="icon">1</div>
                                    </div>
                                    <div class="image-order-status image-order-status-intransit  img-circle second">
                                        <span class="status color3"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
                                        <div class="icon">2</div>
                                    </div>
                                    <div class="image-order-status image-order-status-delivered  img-circle act third">
                                        <span class="status color2"> <fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
                                        <div class="icon">3</div>
                                    </div>
                                    <div class="image-order-status image-order-status-completed  img-circle fourth">
                                        <span class="status lst-status"> <fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
                                        <div class="icon">4</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container">
                       <div class="row summary-row">
                           <div style="width:80%;margin-left:10%;">
                               <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 pad-none">
                                <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin" style="margin-left:0px !important;"><fmt:message key="travel.summary.heading" bundle="${msg}" /></h3>
                            </div>
                            <!-- 
                            <div class="hidden-xs hidden-sm col-md-2 col-lg-2 pad-none summary-header-margin">
                                <h4 class="h4-trav-full">
                                    <a href="<%=request.getContextPath()%>/${language}/travel-insurance/user-details" onclick="perventRedirect=false;" ><fmt:message key="travel.summary.subheading" bundle="${msg}" /></a>
                                </h4>
                            </div>
                             -->
                             <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="row summary-row">
                            <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none">
                                <div class="table activation-form vert-middle travel-summary">
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.name" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.fullName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.hkid" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.hkid}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.email" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.emailAddress }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.mobileNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${userDetails.mobileNo }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.requestNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${createPolicy.referenceNo}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.plan" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="travel.summary.plan" bundle="${msg}" /> ${selectPlanName}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.insuredNo" bundle="${msg}" /> <br></div>
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
                                                                     planDetailsForm.getTotalChildTraveller() +
                                                                     planDetailsForm.getTotalOtherTraveller()   );
                                                    }
                                                }               
                                            %>
                                            </div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.period" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="travel.summary.period.from" bundle="${msg}" /> ${travelBean.trLeavingDate} <fmt:message key="travel.summary.period.to" bundle="${msg}" /> ${travelBean.trBackDate}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.days" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none">${totalTravellingDays}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="travel.summary.amountDue" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none"><span class="h4-4-orange-b pad-none"><fmt:message key="travel.dollar" bundle="${msg}" /> ${dueAmount} </span></div> 
                                        </div>
                                        <div class="row summary-row">
                                            <div class="hidden-xs hidden-sm col-md-12 col-lg-12 pad-none">
                                            <!-- Plan benefits -->
                                                <div class="fwdpanel summary-fwdpanel">
                                                    <c:if test="${selectPlanName=='A'}">
                                                        <div class="fwdpanel-heading">
                                                            <h4 class="benefits">
                                                                <span>
                                                                    <a href="#" class="fwdpanel-minimize uline"><i class="fa fa-plus"></i> <fmt:message key="travel.quote.plan1.benefits" bundle="${msg}" /></a>
                                                                </span>
                                                            </h4>
                                                        </div>
                                                        <div class="fwdpanel-body" style="display: none;">
                                                        <div class="col-xs-11 col-xs-offset-1">
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                                    <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan1.benefits.desc1" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan1.benefits.desc1.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan1.benefits.desc2" bundle="${msg}" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan1.benefits.desc2.price" bundle="${msg}" />
                                                            </div>
                                                        </div> 
                                                        
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan1.benefits.desc3" bundle="${msg}" /> </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan1.benefits.desc3.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan1.benefits.desc4" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan1.benefits.desc4.price" bundle="${msg}" />
                                                                    </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${selectPlanName=='B'}">
                                                        <div class="fwdpanel-heading">
                                                            <h4 class=" benefits">
                                                                <span>
                                                                  <a href="#" class="fwdpanel-minimize uline text-black"><i class="fa fa-plus"></i> <fmt:message key="travel.quote.plan2.benefits" bundle="${msg}" /></a>
                                                                </span>
                                                            </h4>
                                                        </div>
                                                        <div class="fwdpanel-body" style="display: none;">
                                                        <div class="col-xs-11 col-xs-offset-1">
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                                    <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan2.benefits.desc1" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan2.benefits.desc1.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan2.benefits.desc2" bundle="${msg}" />
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan2.benefits.desc2.price" bundle="${msg}" />
                                                            </div>
                                                        </div> 
                                                        
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan2.benefits.desc3" bundle="${msg}" /> </div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan2.benefits.desc3.price" bundle="${msg}" />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-8 col-md-8 col-xs-7 pad-none">
                                                            <i class="fa fa-circle small-fa-bullet"></i> <fmt:message key="travel.quote.plan2.benefits.desc4" bundle="${msg}" /></div>
                                                        <div class="col-lg-4 col-md-4 col-xs-5">
                                                            <fmt:message key="travel.quote.plan2.benefits.desc4.price" bundle="${msg}" />
                                                                    </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </c:if>
                                                    
                                                    
                                                    <div class="clearfix"></div>
                                                </div>
                                            <!-- / Plan benefits -->
                                            </div>
                                        </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                           </div>
                        </div>
                        <div class="clearfix"></div>
                        
                        <div id="no-more-tables2" class="hidden-md hidden-lg">
                          <div style="width:80%;margin-left:10%;">
                        
                            <div class="col-xs-12 col-sm-12 pad-none">
                                <div class="travel-tb-td text-left">
                                    <h3 class="color4 h2-1 insur padding-t"><fmt:message key="travel.summary.insured" bundle="${msg}" /></h3>
                                    
                                    <!-- Mobile Table starts -->
                                </div>
                            <table class="col-xs-12 table-condensed cf insur pad-none">
                                <%

                                    for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) {
                                %>
                                <tr><td class="col-xs-12 pad-none"><table class="col-xs-12 pad-none">
                                

                                <tbody>
                                    <tr class="">
                                        <td  ><span class="bd"><fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td ><span class="bd gy"><fmt:message key="travel.summary.insured.label.personal.beneficiary" bundle="${msg}" /></span></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getPersonalName()[i]%></span></td>
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
                                            
	                                        }else{
	                                    %>
                                        <td  class="gy"><%=planDetailsForm.getPersonalBenificiaryFullName()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getPersonalAgeRangeName()[i]%></span></td>
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="">&nbsp;</td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getPersonalHKID()[i]%></span></td>
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getPersonalBenificiaryHkid()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ></td>  <!-- hide relationship if insured -->
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getPersonalBeneRelationDesc()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr><td>&nbsp;</td></tr>

                                    
                                </tbody>
                                </table></td></tr>
                                
                                <%
                                    }
                                %>
                                <%

                                    for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) {
                                %>
                                <tr><td class="col-xs-12"><table class="col-xs-12">
                                

                                <tbody>
                                    <tr class="">
                                        <td  ><span class="bd"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td ><span class="bd gy"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getAdultName()[i]%></span></td>
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getAdultAgeRangeName()[i]%></span></td>
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="">&nbsp;</td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><span class=""><%=planDetailsForm.getAdultHKID()[i]%></span></td>
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ></td>  <!-- hide relationship if insured -->
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getAdultBeneRelationDesc()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr><td>&nbsp;</td></tr>

                                    
                                </tbody>
                                </table></td></tr>
                                
                                <%
                                    }
                                %>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
                                %>
                                <tr><td class="col-xs-12"><table class="col-xs-12">
                                <tbody>
                                    <tr><td>&nbsp;</td></tr>
                                    <tr>
                                        <td ><span class="bd"><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td ><span class="bd gy" ><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                        <% } %>
                                    </tr>
                                    <tr>    
                                        <td ><%=planDetailsForm.getChildName()[i]%></td>
                                        <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td class="gy"><%=planDetailsForm.getChildBenificiaryFullName()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><%=planDetailsForm.getChildAgeRangeName()[i]%></td>
                                        <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td >&nbsp;</td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><%=planDetailsForm.getChildHKID()[i]%></td>
                                        <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getChildBenificiaryHkid()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ></td>  <!-- hide relationship if insured -->
                                        <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getChildBeneRelationDesc()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr><td>&nbsp;</td></tr>
                                </tbody>
                                </table></td></tr>

                                <%
                                    }
                                %>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
                                %>
                                <tr><td class="col-xs-12"><table class="col-xs-12">
                                <tbody>
                                    <tr><td>&nbsp;</td></tr>
                                    <tr class="">
                                        <td ><span class="bd"><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" /><%=i + 1%></span></td>
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td ><span  class="bd gy"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><%=planDetailsForm.getOtherName()[i]%></td>
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getOtherBenificiaryFullName()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <!-- vincent getOtherAgeRangeName - null ptr -->
                                        <td ><% 
                                                    if (planDetailsForm.getOtherAgeRangeName()[i] != null) 
                                                        out.println(planDetailsForm.getOtherAgeRangeName()[i]);
                                             %>
                                        </td>
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td >&nbsp;</td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ><%=planDetailsForm.getOtherHKID()[i]%></td>
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getOtherBenificiaryHkid()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <td ></td>  <!-- hide relationship if insured -->
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                            
                                            }else{
                                        %>
                                        <td  class="gy"><%=planDetailsForm.getOtherBeneRelationDesc()[i]%></td>
                                        <% } %>
                                    </tr>
                                    <tr><td>&nbsp;</td></tr>
                                </tbody>
                                </table></td></tr>
                                <%
                                    }
                                %>


                            </table>
                                    <!-- Mobile table ends -->
                            </div>
                            
                            </div>
                        </div>
                        
                        
                        <div id="no-more-tables" class="hidden-sm hidden-xs">
                            <div style="width:80%;margin-left:10%;">
                            <table class="col-md-12 table-condensed cf pad-left-20 beneList bmg_custom_benelist">

                                <tbody>
                                    <tr class="travel-tb-head">
                                        <td class=" h2-1  travel-tb-td"><fmt:message key="travel.summary.insured" bundle="${msg}" /></td>
                                        <td class=" h2-1  travel-tb-td"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></td>
                                        <td class=" h2-1  travel-tb-td"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></td>
                                        <td class=" h2-1  travel-tb-td"><fmt:message key="travel.summary.insured.hkid" bundle="${msg}" /></td>
                                        <td class=" h2-1  travel-tb-td"><fmt:message key="travel.summary.insured.beneficiary.relation" bundle="${msg}" /></td>
                                    </tr>
                                    <%
                                        for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) 
                                        {
                                    %>

                                        <tr class="hidden-sm hidden-xs">
                                            <td data-title="Personal <%=i + 1%>">
                                            <span class="h2-1-td">
                                                <fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" />
                                                    <%=i + 1%>
                                            </span>
                                            </td>
                                            <td data-title="Full name"><span class="h4-5"><%=planDetailsForm.getPersonalName()[i]%></span></td>
                                            <td data-title="Age range"><span class="h4-5"><%=planDetailsForm.getPersonalAgeRangeName()[i]%></span></td>
                                            <td data-title="HKID"><span class="h4-5"><%=planDetailsForm.getPersonalHKID()[i]%></span></td>
                                            <td data-title="Relationship"><span class="h4-5"></span></td>   <!-- hide relationship if insured -->
                                        </tr>
                                        <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){
		                                        
		                                    }else{
		                                %>
                                        <tr class="<%=planDetailsForm.getPersonalBenificiaryFullName().length%>">
                                            <td data-title="Personal1"><span class="h4-6-td"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                            <% if(planDetailsForm.getPersonalBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getPersonalBeneRelationDesc()[i].equals("Own Estate")){ %>
                                            <td data-title="Full name" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="HKID" class="travel-tb-h3">&nbsp;</td>
                                            <% }else{ %>
                                            <td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getPersonalBenificiaryFullName()[i]%></td>
                                            <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getPersonalBenificiaryHkid()[i]%></td>
                                            <% } %>
                                            <td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getPersonalBeneRelationDesc()[i]%></td>
    <!--                                        <td data-title="Relationship" class="travel-tb-h3"></td> -->
                                        </tr>
                                        <%
                                                }
                                        %>
                                    </tbody>
                                    <%
                                             }
                                    %>
                                    <%
                                        for (int i = 0; i < planDetailsForm.getTotalAdultTraveller(); i++) 
                                        {
                                    %>

                                    <tr class="hidden-sm hidden-xs">
                                        <td data-title="Adult <%=i + 1%>">
                                        <span class="h2-1-td">
                                            <fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" />
                                                <%=i + 1%>
                                        </span>
                                        </td>
                                        <td data-title="Full name"><span class="h4-5"><%=planDetailsForm.getAdultName()[i]%></span></td>
                                        <td data-title="Age range"><span class="h4-5"><%=planDetailsForm.getAdultAgeRangeName()[i]%></span></td>
                                        <td data-title="HKID"><span class="h4-5"><%=planDetailsForm.getAdultHKID()[i]%></span></td>
                                        <td data-title="Relationship"><span class="h4-5"></span></td>   <!-- hide relationship if insured -->
                                    </tr>
                                    <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){
		                                    
		                                }else{
		                            %>
                                    <tr>
                                        <td data-title="Adult1"><span class="h4-6-td"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                        <% if(planDetailsForm.getAdultBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getAdultBeneRelationDesc()[i].equals("Own Estate")){ %>
                                            <td data-title="Full name" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="HKID" class="travel-tb-h3">&nbsp;</td>
                                            <% }else{ %>
                                            <td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryFullName()[i]%></td>
                                        <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                        <td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%></td>
                                            <% } %>
                                        <td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getAdultBeneRelationDesc()[i]%></td>
<!--                                        <td data-title="Relationship" class="travel-tb-h3"></td> -->
                                    </tr>
                                    <%
                                            }
                                    %>
                                </tbody>
                                <%
                                         }
                                %>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalChildTraveller(); i++) {
                                %>
                                <tr>
                                    <td data-title="Child <%=i + 1%>"><span class="h2-1-td"><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" />
                                            <%=i + 1%></span></td>
                                    <td class="h4-5" data-title="Full name"><%=planDetailsForm.getChildName()[i]%></td>
                                    <td class="h4-5" data-title="Age range"><%=planDetailsForm.getChildAgeRangeName()[i]%></td>
                                    <td class="h4-5" data-title="HKID"><%=planDetailsForm.getChildHKID()[i]%></td>                                  
                                    <td class="h4-5" data-title="Relationship"></td>    <!-- hide relationship if insured -->
                                </tr>
                                <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){
                                        
                                    }else{
                                %>
                                <tr>
                                    <td data-title="Adult1"><span class="h4-6-td"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                    
                                    <% if(planDetailsForm.getChildBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getChildBeneRelationDesc()[i].equals("Own Estate")){ %>
                                            <td data-title="Full name" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="HKID" class="travel-tb-h3">&nbsp;</td>
                                            <% }else{ %>
                                            <td data-title="Full name" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryFullName()[i]%></td>
                                        <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                        <td data-title="HKID" class="travel-tb-h3"><%=planDetailsForm.getChildBenificiaryHkid()[i]%></td>
                                            <% } %>
                                    
                                    <td data-title="Relationship" class="travel-tb-h3"><%=planDetailsForm.getChildBeneRelationDesc()[i]%></td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                                <%
                                    }
                                %>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
                                %>
                                <tbody>
                                    <tr class="hidden-sm hidden-xs">
                                        <td data-title="Other<%=i + 1%>"><span class="h2-1-td"><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" />
                                                <%=i + 1%></span></td>
                                        <td class=" h4-5" data-title="Full name"><%=planDetailsForm.getOtherName()[i]%></td>
                                        <!-- vincent getOtherAgeRangeName - null ptr -->
                                        <td class=" h4-5" data-title="Age range">
                                        <% 
                                            if ( planDetailsForm.getOtherAgeRangeName()[i] != null ) 
                                                out.println(planDetailsForm.getOtherAgeRangeName()[i]); 
                                        %></td> 
                                        <td class=" h4-5" data-title="HKID"><%=planDetailsForm.getOtherHKID()[i]%></td>
                                        <td class=" h4-5" data-title="Relationship"></td>   <!-- hide relationship if insured -->
                                    </tr>
                                    <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){
                                    	
                                    	}else{
                                   	%>
                                    <tr>
                                        <td data-title="Adult1"><span class="h4-6-td"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></span></td>
                                        <% if(planDetailsForm.getOtherBeneRelationDesc()[i].equals("個人遺產") || planDetailsForm.getOtherBeneRelationDesc()[i].equals("Own Estate")){ %>
                                            <td data-title="Full name" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="Age range" class="travel-tb-h3">&nbsp;</td>
                                            <td data-title="HKID" class="travel-tb-h3">&nbsp;</td>
                                            <% }else{ %>
                                            <td data-title="Full name" class="travel-tb-h3 "><%=planDetailsForm.getOtherBenificiaryFullName()[i]%></td>
                                        <td data-title="Age range" class="travel-tb-h3 ">&nbsp;</td>
                                        <td data-title="HKID" class="travel-tb-h3 "><%=planDetailsForm.getOtherBenificiaryHkid()[i]%></td>          
                                            <% } %>                             
                                        <td data-title="Relationship" class="travel-tb-h3 "><%=planDetailsForm.getOtherBeneRelationDesc()[i]%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                                <%
                                    }
                                %>


                            </table>
                          </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="gray-bg1">
                    <div style="width:80%;margin-left:10%;">
                    <div class="col-xs-12 pad-none">
                       <h2 class="from-control" style="padding:0px !important;"><fmt:message key="travel.payment" bundle="${msg}" /></h2>
                       <span id="paymentGatewayErrorMsg"  class="text-red">${errormsg}</span>
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
                    <%
                        String payLang = (String) session.getAttribute("language");
                        //payLang = payLang.substring(0, 1);
                        
                        payLang = "C";
                        
                        //if (payLang.equals("t"))
                        
                    %>
<%--                    <input type="hidden" name="lang" value="<%=payLang%>"> <input --%>
                    <input type="hidden" name="lang" value="C"> <input
                        type="hidden" name="secureHash"
                        value="${createPolicy.secureHash }"> <input
                        type="hidden" id="emailAddress" name="emailAddress"
                        value="${userDetails.emailAddress}"> <input
                        type="hidden" id="gateway" name="gateway"
                        value="${createPolicy.paymentGateway}">





                    <div class="col-xs-12 pad-none">
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="travel.payment.card.type" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float" style="display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5">Payment Method</label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
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
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label h4-5"><fmt:message key="travel.payment.card.no" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="cardnumber" name="cardNo" type="text"
                                            class="input-block-level" maxlength="16" data-min="16"
                                            title=""
                                            onkeyup="" onkeypress="return isNumeric(event)" 
                                            onBlur="validatecardnumber(this.value)"
                                             />
                                            
                                            <span
                                            id="errcardno" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="travel.payment.card.expiryDate" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
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
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <div class="styled-select payment-select" id="inputYear"><select class="pay-details-select" id="year"
                                    name="epYear" onBlur="chkValidCreditCardExpDate(this, 'erryear', '', '');">
                                        <option value="0"><fmt:message key="travel.payment.card.expiryDate.year" bundle="${msg}" /></option>
<!--                                        <option value="2015">2015</option> -->
<!--                                        <option value="2016">2016</option> -->
<!--                                        <option value="2017">2017</option> -->
<!--                                        <option value="2018">2018</option> -->
<!--                                        <option value="2019">2019</option> -->
<!--                                        <option value="2020">2020</option> -->

<!--                                        <option value="2021">2021</option> -->
<!--                                        <option value="2022">2022</option> -->
<!--                                        <option value="2023">2023</option> -->
<!--                                        <option value="2024">2024</option> -->
<!--                                        <option value="2025">2025</option> -->


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
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="travel.payment.card.holderName" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="holdername" name="cardHolder" type="text"
                                            class="input-block-level"
                                            onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
                                            onkeypress="return alphaOnly(event);"> <span
                                            id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none">
                                <label class="control-label  h4-5"><fmt:message key="travel.payment.card.cvv" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode"
                                            class="input-block-level" autocomplete="off" maxlength="3"
                                            title=""
                                            onblur="replaceAlphaNumeric(this);"
                                            onkeypress="return isAlphaNumeric(event);" >
                                <span id="errcode"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    
                    
                    
                    
                    <div class="clearfix"></div>
                    <div class="declaration-content" style="margin:0px !important;">
                        <div class="checkbox" style="padding-left: 24px;">
                            <input id="checkbox3" type="checkbox"> <label
                                for="checkbox3"> <fmt:message key="travel.payment.declarations" bundle="${msg}" /></label>
                        </div>
                        <span id="errchk1" class="error-msg"></span>

                        <span id="errchk2" class="error-msg"></span>
                        <div class="clearfix"></div>
                        <!--     <div class="col-lg-12 pad-none"><a href="travel-plan-details.html" class="bdr-curve btn btn-primary bck-btn2">返� </a> <a href="travel-confirmation.html" class="bdr-curve btn btn-primary nxt-btn margin-left" onclick="return payValid();"> 確�付款</a> </div>-->
                        <!-- <div class="hidden-sm hidden-xs pad-none">
                            
                                class="bdr-curve btn btn-primary bck-btn2">返� </a> <input
                                type="submit"
                                class="bdr-curve btn btn-primary nxt-btn margin-left"
                                value="確�付款" onclick="confirmPayment()" />
                        </div>
                        <br> <br>
                        
                        <div class="pad-none hidden-md hidden-lg">
                            <a href="travel-plan-details.html"
                                class="bdr-curve btn btn-primary bck-btn col-xs-5 col-sm-5 text-center">返�
                            </a>
                        </div> -->
                        <!-- vincent add a button for paymnet confirmation (mobile) -->
                        <!-- <div class="pad-none hidden-md hidden-lg">
                            <input
                                type="submit"
                                class="bdr-curve btn btn-primary nxt-btn"
                                value="確�付款" onclick="confirmPayment()" /> -->
                        <!-- vincent add a button for paymnet confirmation (mobile) --> 
                        
                        
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-left">
                                <!-- <a href="<%=request.getContextPath()%>/${language}/travel-insurance/user-details" class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;">
                                    <fmt:message key="travel.action.back" bundle="${msg}" /> 
                                </a> -->
                                
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 pull-left">
                                <c:choose>
						       <c:when test="${language=='en'}">
						                                	<a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 EN','HKD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
						                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
						       </c:when>
						       <c:otherwise>
							                                <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 ZH','HKD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
						                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
								</c:otherwise>
								</c:choose>
                                
                            </div>
                        </div>
                        
                        <!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
                                <a href="#" onclick="BackMe()"
                                    class="bdr-curve btn btn-primary bck-btn">返� </a>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
                                <input type="submit"
                                    class="bdr-curve-none btn btn-primary nxt-btn "
                                    value="確�付款" onclick="confirmPayment()" />
                                

                            </div> -->
                            <!-- 
                            <div class="hidden-sm hidden-xs pad-none">
                            <a href="<%=request.getContextPath()%>/${language}/travel-insurance/user-details"
                                class="bdr-curve btn btn-primary bck-btn2"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                            <input type="submit"
                                class="bdr-curve btn btn-primary nxt-btn margin-left" 
                                value="<fmt:message key="travel.action.payment" bundle="${msg}" />">
                                
                              </div>
                              
                        <br> <br>
                        <div class="row hidden-md hidden-lg">
                            <div class="clearfix"></div>

                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
                                <a href="<%=request.getContextPath()%>/${language}/travel-insurance/user-details"
                                    class="bdr-curve btn btn-primary bck-btn"><fmt:message key="travel.action.back" bundle="${msg}" />  </a>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
                                
                                <input type="submit"
                                    class="bdr-curve-none btn btn-primary nxt-btn"
                                    value="<fmt:message key="travel.payment.confirmPayment" bundle="${msg}" />" />


                            </div>
                            <div class="clearfix"></div>
                        </div>
                             -->
                            
                            
                                                    
                            <div class="clearfix"></div>
                        </div>
                        
                        
                        
                        <hr class="summary-hr"/>
                        
                        
                        
                        <div id="paydoller-wrap" class="declaration-content" style="margin:0px !important;">
                          <div id="paydollar-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="paydollar-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-pay-dollar.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="travel.action.paydollar" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="visa-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="visa-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-visa.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="travel.action.visa" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div id="master-container" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 paymethod-container">
                            <div id="master-icon" class="col-xs-6 col-sm-3 col-md-12 col-lg-12 pad-none pull-left paymethod-icon">
                             <img src="<%=request.getContextPath()%>/resources/images/icon-master.png" alt="">
                            </div>
                            <div class="col-xs-6 col-sm-9 col-md-12 col-lg-12 pad-none pull-right">
                             <fmt:message key="travel.action.master" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          <div class="clearfix"></div>
                        </div>
                        <br/>
                        <br/>
                        </div>
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
        style="width: 200px; height: 200px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader2.gif">
</div>
</body>
</html>