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
    .center .landing_h2{
        font-size: 20px !important;
        margin-bottom: 10px !important;
    }
    .silver{
        border-bottom: solid 4px #fbbf15 !important;
    }
    .gold{
        border-bottom: solid 4px #f85100 !important;
    }
    h4{
        color: #1f4146;
        font-weight: 600;
        margin: 15px 0 15px;
    }
            @media screen and (min-width: 991px){
#testimonials{
        padding: 0 15px;
    }
        
    }
    @media screen and (max-width: 991px){
        .select-plan-main{
          background: #f5f5f5;
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
    <div class="container">
        <div class="center" > 
            <!--desktop-->
            <h1 class="landing_h2 text-left hidden-sm hidden-xs"><fmt:message key="motor.selectplan1.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 text-left hidden-lg hidden-md feature-ttl"><fmt:message key="motor.selectplan1.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <!--/.container--> 
    <div class="container select-plan-main">
        <div id="testimonials">
            <form action="/api/iMotor/quote" method="post">
                <div class="row planbox-wrapper">
                    <div class="col-sm-6 plan-panel">
                        <div class="yellow-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/Sliver.png" alt="" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-9">
                                    <h3><fmt:message key="motor.selectplan1.plan.silver.title" bundle="${motorMsg}" /></h3>
                                    <p class="plan-panel-content"><fmt:message key="motor.selectplan1.plan.silver.copy" bundle="${motorMsg}" /></p>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <div class="currency">
                                        <fmt:message key="motor.label.currency" bundle="${motorMsg}" /> 
                                    </div>
                                    <div class="price">
                                        <small><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small>
                                        <big id="silver-price"></big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <br />
                                    <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-silver"><fmt:message key="motor.button.getsilver" bundle="${motorMsg}" /></a>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 plan-panel">
                        <div class="red-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/Gold.png" alt="" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-9">
                                    <h3><fmt:message key="motor.selectplan1.plan.gold.title" bundle="${motorMsg}" /></h3>
                                    <p class="plan-panel-content"><fmt:message key="motor.selectplan1.plan.gold.copy" bundle="${motorMsg}" /></p>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <div class="currency">
                                        <fmt:message key="motor.label.currency" bundle="${motorMsg}" /> 
                                    </div>
                                    <div class="price">
                                        <small><fmt:message key="motor.label.from" bundle="${motorMsg}" /></small>
                                        <big id="gold-price"></big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <br />
                                    <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-gold"><fmt:message key="motor.button.getgold" bundle="${motorMsg}" /></a>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-xs-12">
                    <div class="center">
                        <h4><fmt:message key="motor.selectplan1.table.heading" bundle="${motorMsg}" /></h4>
                    </div>
                </div>
            </div>
            <div class="plan-accordion">
                <div class="panel-group" id="accordion" role="tablist" >
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse"  href="#collapseOne" aria-controls="collapseOne">
                                    <fmt:message key="motor.selectplan1.table.1.heading" bundle="${motorMsg}" />
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse in" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-6 col-md-8"></th>
                                                <th class="col-xs-3 col-md-2 silver text-center"><fmt:message key="motor.selectplan1.table.1.header.col1" bundle="${motorMsg}" /></th>
                                                <th class="col-xs-3 col-md-2 gold text-center"><fmt:message key="motor.selectplan1.table.1.header.col2" bundle="${motorMsg}" /></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row1.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan1.table.1.row1.col1" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan1.table.1.row1.col2" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row2.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan1.table.1.row2.col1" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.selectplan1.table.1.row2.col2" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row3.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row4.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row5.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row6.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row7.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row8.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row9.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row10.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                           <!-- <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row11.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.1.row12.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                                <td class="text-center"><i class="fa fa-check" aria-hidden="true"></i></td>
                                            </tr> -->
                                                <tr class="hidden-xs">
                                                <td></td>
                                                <td class="text-center"><a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-silver"><fmt:message key="motor.button.getsilver" bundle="${motorMsg}" /></a></td>
                                                <td class="text-center"><a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-gold"><fmt:message key="motor.button.getgold" bundle="${motorMsg}" /></a></td>
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
                                    <fmt:message key="motor.selectplan1.table.2.heading" bundle="${motorMsg}" /> 
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse in" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-6 col-md-8"></th>
                                                <th class="col-xs-3 col-md-2 silver text-center"><fmt:message key="motor.selectplan1.table.2.header.col1" bundle="${motorMsg}" /></th>
                                                <th class="col-xs-3 col-md-2 gold text-center"><fmt:message key="motor.selectplan1.table.2.header.col2" bundle="${motorMsg}" /></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row1.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="ownDamageExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_ownDamageExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row2.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="theftExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_theftExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row3.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="unnamedDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_unnamedDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row4.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="youngDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_youngDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row5.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="inexperiencedDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_inexperiencedDriverExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row6.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="tPPDExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_tPPDExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                            <tr>
                                                <td><fmt:message key="motor.selectplan1.table.2.row7.copy" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="parkingExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                                <td class="text-center"><fmt:message key="motor.label.currency.front" bundle="${motorMsg}" /><span id="g_parkingExcess"></span><fmt:message key="motor.label.currency.behind" bundle="${motorMsg}" /></td>
                                            </tr>
                                                <tr class="hidden-xs">
                                                <td></td>
                                                <td class="text-center"><a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-silver"><fmt:message key="motor.button.getsilver" bundle="${motorMsg}" /></a></td>
                                                <td class="text-center"><a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-gold"><fmt:message key="motor.button.getgold" bundle="${motorMsg}" /></a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--form action="/api/iMotor/quote" method="post"-->
                <div class="row visible-xs">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-silver"><fmt:message key="motor.button.getsilver" bundle="${motorMsg}" /></a>
                               <br />
                                 <br />
                            </div>
                            <div class="col-sm-6 text-center">
                             
                                <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn get-gold"><fmt:message key="motor.button.getgold" bundle="${motorMsg}" /></a>
  <br />
    <br />
                            </div>
                        </div>
                    </div>
                </div>
            <!--  /form-->
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-api.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/select-plan.js"></script>
<script type="text/javascript">
var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');

$(document).ready(function(){
  	$('#loading-overlay').modal("show");
    $.when(
        getMotorQuotePrice('silver', quote),
        getMotorQuotePrice('gold', quote)
    ).then(function(){
    	$('#loading-overlay').modal("hide");
        $('#silver-price').html(formatCurrency(motorPrice.silver.amountDueAmount));
        $('#gold-price').html(formatCurrency(motorPrice.gold.amountDueAmount));
        updatePriceTable();
    });


    $('.get-silver').on("click", function(e){
    	e.preventDefault();
        quote.compPlan = "Silver";
        quote.planCode = "Comp";
    	redirectQuotePage("rider-options", quote);
    });

    $('.get-gold').on("click", function(e){
    	e.preventDefault();
    	quote.compPlan = "Gold";
        quote.planCode = "Comp";
    	redirectQuotePage("rider-options", quote);
    });    
        
});

/*
 * Update Gold/Silver price tabel
 */
function updatePriceTable(){

    $('#ownDamageExcess').html(formatCurrency(motorPrice.silver.ownDamageExcess)); //print silver price
    $('#theftExcess').html(formatCurrency(motorPrice.silver.theftExcess)); //print silver price
    $('#unnamedDriverExcess').html(formatCurrency(motorPrice.silver.unnamedDriverExcess)); //print silver price
    $('#youngDriverExcess').html(formatCurrency(motorPrice.silver.youngDriverExcess)); //print silver price
    $('#inexperiencedDriverExcess').html(formatCurrency(motorPrice.silver.inexperiencedDriverExcess)); //print silver price
    $('#tPPDExcess').html(formatCurrency(motorPrice.silver.tPPDExcess)); //print silver price
    $('#parkingExcess').html(formatCurrency(motorPrice.silver.parkingExcess)); //print silver price

    $('#g_ownDamageExcess').html(formatCurrency(motorPrice.gold.ownDamageExcess)); //print silver price
    $('#g_theftExcess').html(formatCurrency(motorPrice.gold.theftExcess)); //print silver price
    $('#g_unnamedDriverExcess').html(formatCurrency(motorPrice.gold.unnamedDriverExcess)); //print silver price
    $('#g_youngDriverExcess').html(formatCurrency(motorPrice.gold.youngDriverExcess)); //print silver price
    $('#g_inexperiencedDriverExcess').html(formatCurrency(motorPrice.gold.inexperiencedDriverExcess)); //print silver price
    $('#g_tPPDExcess').html(formatCurrency(motorPrice.gold.tPPDExcess)); //print silver price
    $('#g_parkingExcess').html(formatCurrency(motorPrice.gold.parkingExcess)); //print silver price
}

</script>