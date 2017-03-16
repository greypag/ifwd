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
var tapAndGoUrl = "https://custportal.tapngo.com.hk/en/login";
var clicked = false;
    function confirmTravelPayment(form, gatewayUrlId, paymentFormId) {


    	var selectedPaymentType = $("input:radio[name=paymentGroup]:checked").val();
    	clicked = false;
    	console.log(enablePayment);

		if(payValid(selectedPaymentType) && enablePayment){
			console.log("enablePayment");
    		enablePayment=false;

    		var gatewayUrlId = '#' + gatewayUrlId;
            var paymentFormId = '#' + paymentFormId;
    		var method = "<%=request.getContextPath()%>/processTravePayment";
    		$.ajax({
                type : "POST",
                url : method,
                data : $(paymentFormId).serialize(),
                async : false,
                success : function(data) {
                	clicked = false;
                    if (data == 'success') {
                    	payment(form, gatewayUrlId, paymentFormId);
                    } else {
                    	console.log(data);
                    	$("#PaymentingDiv").hide();
                        enablePayment=true;
                        $('#paymentErrorPopup').modal('show');
                        return false;
                    }
                }
            });
		}

    	<%-- var selectedPaymentType = $("input:radio[name=paymentGroup]:checked").val();
    	clicked = false;
    	console.log(enablePayment);
    	if(enablePayment){
    		console.log("enablePayment");
    		enablePayment=false;
	        if (payValid(selectedPaymentType) && clicked === false && selectedPaymentType=="cc") {
	        	//console.log("aaa");
	        	$("#PaymentingDiv").show();
	            clicked = true;

	            var gatewayUrlId = '#' + gatewayUrlId;
	            var paymentFormId = '#' + paymentFormId;
	            var method = "<%=request.getContextPath()%>/processTravePayment";

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
	        }else if(selectedPaymentType=="tg" && payValid(selectedPaymentType) && clicked === false){
	        		//window.open(tapAndGoUrl, '_blank');
	        		var method = "<%=request.getContextPath()%>/ajax/annualTravel/calculateTapNGoPaymentInfo";
	        		$.ajax({
                        type : "POST",
                        url : method,
                        async : false,
                        success : function(data) {
                        	clicked = false;
                        	var str = JSON.stringify(data)

                        	if(data.errMsg){
                        		console.log(data);
                            	$("#PaymentingDiv").hide();
                                enablePayment=true;
                                $('#paymentErrorPopup').modal('show');
                                return false;
                           	}else{
                           		$('#appId').val(data.appId);
								$('#merTradeNo').val(data.merTradeNo);
								$('#payload').val(data.payload);
								$('#paymentType').val(data.paymentType);
								$('#sign').val(data.sign);
								setTimeout(function(){
									$("#"+form).attr('action', "${tapNGoTransactionUrl}");
									$("#"+form).submit();
									3000}
								);


                           	}
                        }
                    });

	        		return true;
	        }else{
	        	$("#PaymentingDiv").hide();
                enablePayment=true;
	        	return false;
	        }
    	} --%>
    }

	function payment(form, gatewayUrlId, paymentFormId){
		var selectedPaymentType = $("input:radio[name=paymentGroup]:checked").val();
        clicked = false;
		if (payValid(selectedPaymentType) && clicked === false && selectedPaymentType=="cc") {
			var geteWayUrl = $(gatewayUrlId).val();
			 clicked = true;
			$("#PaymentingDiv").show();
			setTimeout(function(){
        		$("#"+form).attr('action', geteWayUrl);
                $("#"+form).submit();
            }, 3000);
		}else if(selectedPaymentType=="tg" && payValid(selectedPaymentType)==true && clicked === false){
    		var method = "<%=request.getContextPath()%>/ajax/calculateTapNGoPaymentInfo";
    		$.ajax({
                type : "POST",
                url : method,
                async : false,
                success : function(data) {
                	clicked = false;
                	if(data.errMsg){
                		console.log(data);
                    	$("#PaymentingDiv").hide();
                        enablePayment=true;
                        $('#paymentErrorPopup').modal('show');
                        return false;
                   	}else{
                   		$('#appId').val(data.appId);
						$('#merTradeNo').val(data.merTradeNo);
						$('#payload').val(data.payload);
						$('#paymentType').val(data.paymentType);
						$('#sign').val(data.sign);
						setTimeout(function(){
							$("#"+form).attr('action', data.geteWayUrl);
							$("#"+form).submit();
							3000}
						);
                   	}
                }
            });
    		return true;
	    }else{
	    	$("#PaymentingDiv").hide();
	        enablePayment=true;
	    	return false;
	    }
	}






    var paymentDelcareMsg = '<fmt:message key="travel.payment.declarations" bundle="${msg}" />';
    var paymentDelcareMsgTagAndGo = '<fmt:message key="travel.payment.declarations.tagAndGo" bundle="${msg}" />';
	function switchPayment(selector){
		selector = $(selector).attr('id');
		if(selector=="visaMaster"){
			$("#payment-detail-section").show();
			$(".support-reminder").hide();
			$("#checkbox3").next().html(paymentDelcareMsg);
			//console.log(selector);
		}else if (selector=="tapAndGo"){
			$("#payment-detail-section").hide();
			$(".support-reminder").show();
			$("#checkbox3").next().html(paymentDelcareMsgTagAndGo);
			//console.log(selector);
		}
	}
    $(document).ready(function(){
        $('#cardNo1').payment('formatCardNumber');
        $('#cardNo1').keyup(function() {
            var replaceSpace = $(this).val();
            var result = replaceSpace.replace(/\s/g,'');
            $("#cardnumber").val(result);
        });
        $( ".paymentType__btn" ).on( "click", function() {
        	switchPayment($(this));
       	});
        $( "#button_confirm" ).on( "click", function(e) {
        	e.stopPropagation();
        	if(lang=="en"){
	        	kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 EN','USD');
        	}else{
        		kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 ZH','USD');
        	}
        	perventRedirect=false;
        	confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');
       	});
    })
</script>


<%
    PlanDetailsForm planDetailsForm = (PlanDetailsForm) request.getAttribute("planDetailsForm");
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
                    <li><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="travel.breadcrumb1.item5" bundle="${msg}" /></li>
                </ol>
                <!-- <div class="container ">
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
                </div> -->
                <div class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-12 col-xs-12 col-sm-12 col-md-12 pad-none white-bg1 summary-container product_summary_container">
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
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.fullName }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.hkid" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.hkid}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.email" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.emailAddress }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.applicant.mobileNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${userDetails.mobileNo }</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.requestNo" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${createPolicy.referenceNo}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.plan" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none"><fmt:message key="travel.summary.plan" bundle="${msg}" /> ${selectPlanName}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.insuredNo" bundle="${msg}" /> <br></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">
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
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="travel.summary.period.from" bundle="${msg}" /> ${travelBean.trLeavingDate} <fmt:message key="travel.summary.period.to" bundle="${msg}" /> ${travelBean.trBackDate}</div>
                                        </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.days" bundle="${msg}" /></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper">${totalTravellingDays}</div>
                                        </div>

                                        <fmt:formatNumber var="totalA" value="${quoteDetails.toalDue[0]}" pattern="#"/>
						                <fmt:formatNumber var="totalB" value="${quoteDetails.toalDue[1]}" pattern="#"/>
	                                    <div class="row summary-row">
	                                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 h2-1 pad-none summary-detail-head"><fmt:message key="travel.summary.originalamount" bundle="${msg}" /></div>
	                                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 h4-5 pad-none textUpper"><fmt:message key="travel.dollar" bundle="${msg}" /> ${originalAmount }</div>
	                                    </div>
                                        <div class="row summary-row">
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none summary-detail-head"><span class="h4-4-orange-b pad-none"><fmt:message key="travel.summary.amountDue" bundle="${msg}" /></span></div>
                                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none textUpper"><span class="h4-4-orange-b pad-none"><fmt:message key="travel.dollar" bundle="${msg}" /> ${dueAmount} </span></div>
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

                        <hr class="hidden-lg hidden-md"/>

                        <!-- ******************* NEW ********************** -->
                        <div id="no-more-tables2" class="hidden-md hidden-lg" style="margin-bottom:30px;">
                          <div style="width:80%;margin-left:10%;">
                            <div class="col-xs-12 col-sm-12 pad-none">
                                <div class="text-left">
                                    <h3 class="h2-3-existing-fwd-head summary-header summary-header-margin"><fmt:message key="travel.summary.insured" bundle="${msg}" /></h3>
                                </div>
                                <%
                                    for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) {
                                %>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getPersonalName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getPersonalAgeRangeName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if(planDetailsForm!=null && planDetailsForm.getSelectedPersonalHkidPass()!=null && planDetailsForm.getSelectedPersonalHkidPass()[i]!=null && "HKID".equals(planDetailsForm.getSelectedPersonalHkidPass()[i])) { %><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />
                                        <% }else { %><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />
                                        <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getPersonalHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></div>
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
                                            <% if("HKID".equals(planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getAdultName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getAdultAgeRangeName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if("HKID".equals(planDetailsForm.getSelectedAdHkidPass()[i])) { %><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />
                                        <% }else { %><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />
                                        <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getAdultHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></div>
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
                                            <% if("HKID".equals(planDetailsForm.getSelectedAdBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getChildName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></div>

                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getChildAgeRangeName()[i]%></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if("HKID".equals(planDetailsForm.getSelectedChldHkidPass()[i])) { %><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />
                                        <% }else { %><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />
                                        <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getChildHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></div>
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
                                            <% if("HKID".equals(planDetailsForm.getSelectedChldBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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
                                    for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
                                %>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field product_summary_table_header"><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" /> <%=i + 1%></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getOtherName()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></div>

                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none"><%=planDetailsForm.getOtherAgeRangeName()[i]%></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head">
                                        <% if("HKID".equals(planDetailsForm.getSelectedOtHkidPass()[i])) { %><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />
                                        <% }else { %><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />
                                        <% } %>
                                    </div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper"><%=planDetailsForm.getOtherHKID()[i]%></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row summary-row" style="margin-bottom:10px !important;">
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none summary-detail-head"><fmt:message key="travel.summary.insured.label.family.beneficiary" bundle="${msg}" /></div>
                                    <div class="product_summary_table_field col-xs-6 col-sm-6 pad-none textUpper">
                                        <%
                                            if("個人遺產".equals(planDetailsForm.getOtherBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getOtherBeneRelationDesc()[i])){
                                        %>
                                        <%=planDetailsForm.getOtherBeneRelationDesc()[i] %>
                                        <%
                                            }else{
                                        %>
                                        <%=planDetailsForm.getOtherBenificiaryFullName()[i]%> (<%=planDetailsForm.getOtherBeneRelationDesc()[i] %>)
                                        <div style="margin-top:10px;"><%=planDetailsForm.getOtherBenificiaryHkid()[i]%>
                                            <% if("HKID".equals(planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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



                        <!-- ******* new ******* -->
                        <div id="no-more-tables" class="hidden-sm hidden-xs" style="margin-bottom:30px;">
                            <div style="width:80%;margin-left:10%;">
                            <table class="table-striped cf beneList bmg_custom_benelist product_payment_detail_benelist">
                                <thead>
                                    <tr class="travel-tb-head">
                                        <td class="travel-tb-td"><fmt:message key="travel.summary.insured" bundle="${msg}" /></td>
                                        <td class="travel-tb-td"><fmt:message key="travel.summary.insured.name" bundle="${msg}" /></td>
                                        <td class="travel-tb-td"><fmt:message key="travel.summary.insured.age" bundle="${msg}" /></td>
                                        <td class="travel-tb-td"><fmt:message key="travel.summary.insured.hkid" bundle="${msg}" /></td>
                                        <td class="travel-tb-td"><fmt:message key="travel.summary.insured.beneficiary.relation" bundle="${msg}" /></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Personal -->
                                    <%
                                        for (int i = 0; i < planDetailsForm.getTotalPersonalTraveller(); i++) {
                                    %>
                                    <tr>
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"><fmt:message key="travel.summary.insured.label.personal" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalName()[i]%></span></td>
                                        <td data-title="Age range"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalAgeRangeName()[i]%></span></td>
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
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Age range"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getPersonalBenificiaryHkid()[i]%>
                                            <% if("HKID".equals(planDetailsForm.getSelectedPersonalBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"><fmt:message key="travel.summary.insured.label.family.parent" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultName()[i]%></span></td>
                                        <td data-title="Age range"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultAgeRangeName()[i]%></span></td>
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
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Age range"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getAdultBenificiaryHkid()[i]%>
                                            <% if("HKID".equals(planDetailsForm.getSelectedAdBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"><fmt:message key="travel.summary.insured.label.family.child" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getChildName()[i]%></span></td>
	                                    <td data-title="Age range"><span class="h4-5 textUpper"><%=planDetailsForm.getChildAgeRangeName()[i]%></span></td>
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
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Age range"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getChildBenificiaryHkid()[i]%>
                                            <% if("HKID".equals(planDetailsForm.getSelectedChldBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
                                            <% } %>
                                        </span></td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>

                                    <%
                                        for (int i = 0; i < planDetailsForm.getTotalOtherTraveller(); i++) {
                                    %>
                                    <tr>
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"><fmt:message key="travel.summary.insured.label.family.others" bundle="${msg}" /> <%=i + 1%></span></td>
                                        <td data-title="Full name"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherName()[i]%></span></td>
                                        <td data-title="Age range"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherAgeRangeName()[i]%></span></td>
                                        <td data-title="HKID"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherHKID()[i]%></span></td>
                                        <%
                                            if("個人遺產".equals(planDetailsForm.getOtherBeneRelationDesc()[i]) || "Own Estate".equals(planDetailsForm.getOtherBeneRelationDesc()[i])){
                                        %>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherBeneRelationDesc()[i] %></span></td>
                                    </tr>
                                        <%
                                            }else{
                                        %>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherBenificiaryFullName()[i]%> (<%=planDetailsForm.getOtherBeneRelationDesc()[i] %>)</span></td>   <!-- hide relationship if insured -->
                                    </tr>
                                    <tr>
                                        <td data-title="Personal <%=i + 1%>"><span class="h4-5"></span></td>
                                        <td data-title="Full name"><span class="h4-5"></span></td>
                                        <td data-title="Age range"><span class="h4-5"></span></td>
                                        <td data-title="HKID"><span class="h4-5"></span></td>
                                        <td data-title="Relationship"><span class="h4-5 textUpper"><%=planDetailsForm.getOtherBenificiaryHkid()[i]%>
                                            <% if("HKID".equals(planDetailsForm.getSelectedOtherBenefitiaryHkidPass()[i])) { %>(<fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" />)
                                            <% }else { %>(<fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" />)
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

                <c:if test="${(selectPlanName=='A' && totalA<=0) || (selectPlanName=='B' && totalB<=0)}">
                    <div class="gray-bg1 product_payment_detail_form_container">
                        <div style="width:80%;margin-left:10%;">
		                    <div class="declaration-content" style="margin:0px !important;">
		                        <div class="checkbox" style="padding-top: 24px;">
		                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 pull-right">
		                                <a id="button_confirm" href="<%=request.getContextPath()%>/${language}/travel-insurance/confirmation"
                                        class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.next" bundle="${msg}" /></a>
                                    </div>
		                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-right">
		                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                        <div class="clearfix"></div>
		                    </div>
	                    </div>
                    </div>
                </c:if>

                <div class="gray-bg1 product_payment_detail_form_container <c:if test="${selectPlanName=='A' && totalA<=0}">hidden</c:if><c:if test="${selectPlanName=='B' && totalB<=0}">hidden</c:if>">
                    <div style="width:80%;margin-left:10%;">
                    <!-- Payment Form -->
                    <div class="col-xs-12 pad-none">
                       <h2 class="from-control" style="padding:0px !important;"><fmt:message key="travel.payment" bundle="${msg}" /></h2>
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
                    <input type="hidden" name="merchantId" value="${createPolicy.merchantId}">
                    <input type="hidden" name="amount" value="${dueAmount.trim()}">
                    <input type="hidden" name="remark" value="${referralCode.trim()}">
                    <input type="hidden" name="orderRef" value="${createPolicy.transactionNo }">
                    <input type="hidden" name="currCode" value="${createPolicy.currCode }">
                    <input type="hidden" name="successUrl" value="${path}">
                    <input type="hidden" name="failUrl" value="${failurePath }">
                    <input type="hidden" name="errorUrl" value="${failurePath }">
                    <input type="hidden" name="payType" value="${createPolicy.paymentType}">
                    <input type="hidden" id="referenceNo" name="referenceNo" value="${createPolicy.referenceNo}">
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


					<input type="hidden" id="appId" name="appId" value=""/>
					<input type="hidden" id="merTradeNo" name="merTradeNo" value=""/>
					<input type="hidden" id="payload" name="payload" value=""/>
					<input type="hidden" id="paymentType" name="paymentType" value=""/>
					<input type="hidden" id="sign" name="sign" value=""/>


					<div class="form-group float product-payment-type">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title">
							<label class="control-label h4-5"><fmt:message key="travel.payment.card.type" bundle="${msg}" /></label>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
							<div class="radio paymentType paymentType--first">
								<input id="visaMaster" class="paymentType__btn" type="radio" name="paymentGroup" value="cc" checked>
								<label for="visaMaster" class="paymentType__btnLabel">
									<fmt:message key="payment.type1" bundle="${msg}" />
									<img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">
								</label>
							</div>
							<div class="radio paymentType paymentType">
								<input id="tapAndGo" class="paymentType__btn" type="radio" name="paymentGroup" value="tg">
								<label for="tapAndGo" class="paymentType__btnLabel">
									<fmt:message key="payment.type2" bundle="${msg}" />
									<img class="img-responsive img-payment__tagAndGo" src="<%=request.getContextPath()%>/resources/images/FWD_pay_withTapngo_button.png">
								</label>
							</div>
							<%--<img src="<%=request.getContextPath()%>/resources/images/payment.png" alt="">--%>
						</div>
						<div class="clearfix"></div>
					</div>
                    <div id="payment-detail-section" class="col-xs-12 pad-none product_payment_details">
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
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title">
                                <label class="control-label h4-5"><fmt:message key="annual.summary.creditcardnumber" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="cardNo1" type="tel" class="js-field-creditcard input-block-level cardnumber" maxlength="19" data-min="19" onkeypress="return isNumeric(event);" onblur="validatecardnumber($('#cardnumber').val());"/>

                                <span id="errcardno" class="error-msg"></span>
                                <input id="cardnumber" name="cardNo" type="hidden" class="input-block-level" maxlength="16" data-min="16"/>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title">
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
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="travel.payment.card.holderName" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                                <input id="holdername" name="cardHolder" type="text"
                                            class="js-field-fullname input-block-level"
                                            onblur="replaceAlpha(this); chkNotNullCreditCareName(this, 'errname');"
                                            onkeypress="return alphaOnly(event);"> <span
                                            id="errname" class="error-msg"></span>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="form-group float">
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title">
                                <label class="control-label  h4-5"><fmt:message key="travel.payment.card.cvv" bundle="${msg}" /></label>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-right: 2% !important;">
                                <input id="seccode" type="password" name="securityCode"
                                            class="js-field-mobile input-block-level" autocomplete="off" maxlength="3"
                                            title=""
                                            onblur="replaceNumeric(this);"
                                            onkeypress="return isNumeric(event);" >
                                <span id="errcode"
                                    class="error-msg"></span>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 pad-none" style="padding-left: 2% !important;">
                                <img src="<%=request.getContextPath()%>/resources/images/icon-card.png" alt="">
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="form-group float">
                        	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-none product_payment_details_title"></div>
                        	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 pad-none">
                        		<div><fmt:message key="payment.gi.address.line1" bundle="${msg}" /></div>
                        		<div><fmt:message key="payment.gi.address.line2" bundle="${msg}" /></div>
                        		<div><fmt:message key="payment.gi.address.line3" bundle="${msg}" /></div>
                        	</div>
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>



                    <div class="clearfix"></div>
                    <div class="support-reminder" style="display:none;">
                    	<span class="support-reminder__title"><fmt:message key="travel.payment.reminder.title" bundle="${msg}" /></span>
                    	<ul class="support-reminder__list">
                    		<li><span><fmt:message key="travel.payment.reminder.list.item1" bundle="${msg}" /></span></li>
                    		<li><span><fmt:message key="travel.payment.reminder.list.item2" bundle="${msg}" /></span></li>
                    	</ul>
                    </div>
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
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 pull-right">
                                <c:choose>
       <c:when test="${language=='en'}">
                                	<a id="button_confirm"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
       </c:when>
       <c:otherwise>
	                                <a id="button_confirm"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
</c:otherwise>
</c:choose>


                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-right">
                                <!-- <a href="<%=request.getContextPath()%>/${language}/travel-insurance/user-details" class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;">
                                    <fmt:message key="travel.action.back" bundle="${msg}" />
                                </a> -->

                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
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

                        <!--/ Payment Form -->
                        <!-- Show the following buttons when hiding the payment form, update the link for Confirm button
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 pull-right">
                                <c:choose>
       <c:when test="${language=='en'}">
                                    <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 EN','USD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
       </c:when>
       <c:otherwise>
                                    <a id="button_confirm" onclick="javascript:kenshoo_conv('Registration_Step3','${dueAmount}','','Regis_Travel_Step3 ZH','USD');perventRedirect=false;confirmTravelPayment('paymentForm', 'gateway', 'paymentForm');"
                                    class="bdr-curve btn btn-primary nxt-btn" style="white-space: initial;"><fmt:message key="travel.action.payment" bundle="${msg}" /></a>
</c:otherwise>
</c:choose>


                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 pull-right">
                                <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="travel.action.back" bundle="${msg}" /> </a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        -->

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


                    <div class="form-wrap" style="margin-bottom: 10px;">
                    <h4 class="h4-4 product_landing_download_button pull-left">
                        <i class="fa fa-download"></i> <a
                            href="<fmt:message key="travel.brochure.link" bundle="${msg}" />"
                            target="_blank"><fmt:message key="annual.common.productbrochure" bundle="${msg}" />   </a>
                    </h4>
                    <h4 class="h4-4 product_landing_download_button pull-left">
                        <i class="fa fa-download"></i> <a
                            href="https://home.fwd.com.hk/gidoc/policyprovisions/TravelCare_Insurance_JacketLatest.pdf"
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

<!-- <div>
    <form id="tgPaymentForm" action="" method="post"><br><br>
		<input type="hidden" id="appId" name="appId" value=""/>
		<input type="hidden" id="merTradeNo" name="merTradeNo" value=""/>
		<input type="hidden" id="payload" name="payload" value=""/>
		<input type="hidden" id="paymentType" name="paymentType" value=""/>
		<input type="hidden" id="sign" name="sign" value=""/>
	</form>
</div> -->

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/fwd-payment.js"></script>
