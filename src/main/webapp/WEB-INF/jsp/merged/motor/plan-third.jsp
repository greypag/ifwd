<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
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
.light-green-color p{
color: #fff;
}
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
    .planbox-wrapper.dark-green-color .plan-panel-content{
    height: 240px;
    }
      .chin .planbox-wrapper.dark-green-color .plan-panel-content{
    height: 200px;
    }

    }

    
    @media screen and (max-width: 991px){
      .planbox-wrapper.dark-green-color .plan-panel-content{
    height: 400px;
    }
     .chin .planbox-wrapper.dark-green-color .plan-panel-content{
    height: 250px;
    }
    
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
 .plan-panel > .red-color {
  margin-right: 0;
 }


    }
    
      @media screen and (max-width: 767px){
      
       .plan-panel > .red-color {
  margin-left: 0;
 }
 
 }

</style>

<section id="" class="motor-select-plan">
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>
    <!-- Breadcrumb Component End-->

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
                                    <fmt:message key="motor.label.currency.from" bundle="${motorMsg}" /> 
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
                            <a href="javascript:;" class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackPage();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /></a>
                            <br />
                            <br /> <br />
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

var quote = jQuery.parseJSON('<%=StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data")))%>');
(function($){

 	var backDetectValues = {
 		frameLoaded: 0,
 		frameTry: 0,
 		frameTime: 0,
 		frameDetect: null,
 		frameSrc: null,
 		frameCallBack: null,
 		frameThis: null,
 		frameNavigator: window.navigator.userAgent,
 		frameDelay: 0,
 		frameDataSrc: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC'
 	};

	$.fn.backDetect = function(callback, delay) {
		backDetectValues.frameThis = this;
		backDetectValues.frameCallBack = callback;
		if(delay !== null){
			backDetectValues.frameDelay = delay;
		}
		setTimeout(function(){
			$('<iframe src="' + backDetectValues.frameDataSrc + '?loading" style="display:none;" id="backDetectFrame" onload="jQuery.fn.frameInit();"></iframe>').appendTo(backDetectValues.frameThis);
		}, backDetectValues.frameDelay);	  
	};

	$.fn.frameInit = function(){
		backDetectValues.frameDetect = document.getElementById('backDetectFrame');
		if(backDetectValues.frameLoaded > 1){
			if(backDetectValues.frameLoaded == 2){
				backDetectValues.frameCallBack.call(this);
				//history.go(-1);
			}
		}
		backDetectValues.frameLoaded++;
		if(backDetectValues.frameLoaded == 1){
			backDetectValues.frameTime = setTimeout(function(){jQuery.fn.setupFrames();}, 500);
		}
  }; 

  $.fn.setupFrames = function(){
  	clearTimeout(backDetectValues.frameTime);
		backDetectValues.frameSrc = backDetectValues.frameDetect.src;
  	if(backDetectValues.frameLoaded == 1 && backDetectValues.frameSrc.indexOf("historyLoaded") == -1){
  		backDetectValues.frameDetect.src = backDetectValues.frameDataSrc + "?historyLoaded";
  	}
  };

}(jQuery));
function BackPage() {
	var $form = $("<form id='quote-form' />");
	$form.attr("action","get-quote?plan="+quote.planCode+"&back=yes");
	$form.attr("method", "post");
	var $quote = $("<input type='hidden' name='data' />");
	$quote.attr("value", JSON
			.stringify(quote));
	$form.append($quote);
	$("body").append($form);
	$('#quote-form').submit();
}
$(window).load(function(){
    $('body').backDetect(function(){
    	BackPage();
    	return false;
    });
});
$(document).ready(function(){
	
	var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
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
    	if(getUrlParameter("edit") == "yes")
    		redirectQuotePage("rider-options?edit=yes", quote);
    	else
    		redirectQuotePage("rider-options", quote);
    });

    $('#comp-next').on("click", function(){
    	if(getUrlParameter("edit") == "yes")
    		redirectQuotePage("comprehensive-quote?edit=yes", quote);
    	else
    		redirectQuotePage("comprehensive-quote", quote);
    });
});

function updatePriceTable(){
    $('#youngDriverExcess').html(formatCurrency(motorPrice.third.youngDriverExcess).substring(0,formatCurrency(motorPrice.third.youngDriverExcess).length - 3));
    $('#inexperiencedDriverExcess').html(formatCurrency(motorPrice.third.inexperiencedDriverExcess).substring(0,formatCurrency(motorPrice.third.inexperiencedDriverExcess).length - 3));
    $('#tPPDExcess').html(formatCurrency(motorPrice.third.tPPDExcess).substring(0,formatCurrency(motorPrice.third.tPPDExcess).length - 3));
    $('#parkingExcess').html(formatCurrency(motorPrice.third.parkingExcess));
}

</script>
