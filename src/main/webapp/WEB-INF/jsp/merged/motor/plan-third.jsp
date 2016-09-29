<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<style type="text/css" media="all">
    #testimonials{
        padding: 0;
    }
    .motor-select-plan .center .landing_h2{
        font-size: 20px !important;
        margin-bottom: 10px !important;
    }
    .motor-select-plan2{
        margin: 30px 0px;
    }
    .silver{
        border-bottom: solid 4px #12afbf !important;
    }
    .gold{
        border-bottom: solid 4px #fbbf15 !important;
    }
    h4{
        color: #1f4146;
        font-weight: 600;
        margin: 15px 0 15px;
    }
    .plan-accordion .panel-heading{
        border-bottom: solid 2px #97d0ce !important;
    }
    .plan-accordion .panel-title a{
        color: #97d0ce !important;
    }
    .planbox-wrapper{
        margin-left: 0;
        margin-right: 0;
    }
    @media screen and (min-width: 992px){
    .plan-panel:first-of-type > div {
    margin-right: 15px;
    
}
    }

    
    @media screen and (max-width: 991px){
        .motor-select-plan2 > .container:first-of-type{
            background: #1f4146;
        }
        .select-plan-main{
          background: #f5f5f5;
        }
        
            .plan-panel:first-of-type > div {
    margin-left: 0;
    margin-right: 0;
}
    }

</style>

<section id="" class="motor-select-plan">
    <div class="container container-fluid breadcrumbs motor pad-0">
        <!-- Breadcrumb Component Start-->

        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>

        <!-- Breadcrumb Component End-->
    </div>
    <!--/.container--> 
    <div class="container select-plan-main">
        <div id="testimonials">
            <div class="row planbox-wrapper">
                <div class="col-xs-12 plan-panel">
                    <div class="light-green-color">
                        <div class="row">
                            <div class="col-xs-2 col-sm-2">
                                <div class="thumbnail">
                                    <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                </div>
                            </div>
                            <div class="col-xs-10 col-sm-7">
                                <h3><fmt:message key="motor.selectplan2.plan.thirdparty.title" bundle="${motorMsg}" /></h3>
                                <p><fmt:message key="motor.selectplan2.plan.thirdparty.copy" bundle="${motorMsg}" /></p>
                            </div>
                            <div class="col-xs-12 col-sm-3 text-right">
                                <div class="currency">
                                    <fmt:message key="motor.label.currency" bundle="${motorMsg}" /> 
                                </div>
                                <div class="price">
                                    <small><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small>
                                    <big id="third-price"></big>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-4 text-center">
                                <br />
                                <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn third-next"><fmt:message key="motor.button.getthirdparty" bundle="${motorMsg}" /></a>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="center">
                        <h4><fmt:message key="motor.selectplan2.table.heading" bundle="${motorMsg}" /></h4>
                    </div>
                </div>
            </div>
            <div class="plan-accordion">
                <div class="panel-group" id="accordion" role="tablist" >
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse"  href="#collapseOne" aria-controls="collapseOne">
                                    <fmt:message key="motor.selectplan2.table.1.heading" bundle="${motorMsg}" />
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan2.table.1.row1.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan2.table.1.row1.col1" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan2.table.1.row2.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan2.table.1.row2.col1" bundle="${motorMsg}" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse"  href="#collapseTwo" aria-controls="collapseTwo">
                                    <fmt:message key="motor.selectplan2.table.2.heading" bundle="${motorMsg}" /> 
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse in" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan2.table.2.row1.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="youngDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan2.table.2.row2.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="inexperiencedDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan2.table.2.row3.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="tPPDExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <!-- <tr>
                                                <td><fmt:message key="motor.selectplan2.table.2.row4.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="parkingExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="row">
                        <div class="col-xs-6 text-center">
                            <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /></a>
                            <br />
                            <br />
                                                        <br />
                            <br />
                        </div>
                        <div class="col-xs-6 text-center">
                            <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn third-next"><fmt:message key="motor.button.getthirdparty" bundle="${motorMsg}" /></a>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<section id="" class="motor-select-plan2 hidden" >
    <div class="container">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h1 class=" col-md-10 col-md-offset-1 hidden-sm hidden-xs "><fmt:message key="motor.selectplan2.upgrade.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="hidden-lg hidden-md motor-ttl"><fmt:message key="motor.selectplan2.upgrade.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
        <div class="row planbox-wrapper dark-green-color">
            <div class="col-sm-6 plan-panel" id="silverCard">
                <div class="yellow-color">
                    <div class="row">
                        <div class="col-xs-2 col-sm-3">
                            <div class="thumbnail">
                                <img src="<%=request.getContextPath()%>/resources/images/motor/Sliver.png" alt="" />
                            </div>
                        </div>
                        <div class="col-xs-10 col-sm-9">
                            <h3><fmt:message key="motor.selectplan2.upgrade.silver.title" bundle="${motorMsg}" /></h3>
                            <h2><fmt:message key="motor.selectplan2.upgrade.silver.price" bundle="${motorMsg}" /><span id="silver-price"></span></h2>
                            <p class="plan-panel-content"><fmt:message key="motor.selectplan2.upgrade.silver.content" bundle="${motorMsg}" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 plan-panel" id="goldCard">
                <div class="red-color">
                    <div class="row">
                        <div class="col-xs-2 col-sm-3">
                            <div class="thumbnail">
                                <img src="<%=request.getContextPath()%>/resources/images/motor/Gold.png" alt="" />
                            </div>
                        </div>
                        <div class="col-xs-10 col-sm-9">
                            <h3><fmt:message key="motor.selectplan2.upgrade.gold.title" bundle="${motorMsg}" /></h3>
                            <h2><fmt:message key="motor.selectplan2.upgrade.gold.price" bundle="${motorMsg}" /><span id="gold-price"></span></h2>
                            <p class="plan-panel-content"><fmt:message key="motor.selectplan2.upgrade.gold.content" bundle="${motorMsg}" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-4 text-center">
                <br />
                <a href="javascript:;" id="comp-next" class="bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.findoutmore" bundle="${motorMsg}" /></a>
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/select-plan.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript">

var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');
    
$(document).ready(function(){

    $.when(
        getMotorQuotePrice('third', quote)
    ).then(function(){
        $('#third-price').html(formatCurrency(motorPrice.third.amountDueAmount));
    
        var silverUpgradePrice = 0;
        var goldUpgradePrice = 0;

        if(motorPrice.third.amtFromThirdPartyToCompSilver){
            motorPrice.silver.valid = true;
            silverUpgradePrice = formatFloat(motorPrice.third.amtFromThirdPartyToCompSilver);
            $('#silver-price').html(formatCurrency(silverUpgradePrice));
        } else {
            motorPrice.silver.valid = false;
            $('#silverCard').remove(); // Remove with invalid quotation
        }

        if(motorPrice.third.amtFromThirdPartyToCompGold){
            motorPrice.gold.valid = true;
            goldUpgradePrice = formatFloat(motorPrice.third.amtFromThirdPartyToCompGold);
            $('#gold-price').html(formatCurrency(goldUpgradePrice));
        } else {
            motorPrice.gold.valid = false;
            $('#goldCard').remove(); // Remove with invalid quotation
        }

        if( motorPrice.silver.valid || motorPrice.gold.valid ){
            $('.motor-select-plan2').removeClass('hidden'); // display upsell section with valid quotations
        }

        updatePriceTable();
    });
    
    $('.third-next').on("click", function(){
    	quote.planCode = "Third";
    	quote.compPlan = null;
    	redirectQuotePage("rider-options", quote);
    });

    $('#comp-next').on("click", function(){
    	redirectQuotePage("comprehensive-quote", quote);
    });
});

function updatePriceTable(){
    $('#youngDriverExcess').html(motorPrice.third.youngDriverExcess);
    $('#inexperiencedDriverExcess').html(motorPrice.third.inexperiencedDriverExcess);
    $('#tPPDExcess').html(motorPrice.third.tPPDExcess);
    $('#parkingExcess').html(motorPrice.third.parkingExcess);
}

</script>
