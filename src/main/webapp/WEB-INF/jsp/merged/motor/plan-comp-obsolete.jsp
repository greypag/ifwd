<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
var quote = jQuery.parseJSON('<%=request.getParameter("data").replace("&quot;", "\"")%>');

$(document).ready(function(){
    $.ajax({
        url: '/fwdhk/api/iMotor/quote',
		contentType: "application/json",        
        type: 'POST',
        dataType: "json",
        data: JSON.stringify({
			"addOnPaAmt": null,
			"addOnTppdAmt": null,
			"compPlan": "Silver",
			"discountAmount": null,
			"grossPremium": null,
			"personalAccident": false,
			"planCode": "Comp",
			"quoteDriver": {
				"carEstimatedValue": quote.quoteDriver.carEstimatedValue,
				"carMakeCode": quote.quoteDriver.carMakeCode,
				"carCC": quote.quoteDriver.carCC,
				"carModel": quote.quoteDriver.carModel,
				"carYearOfManufacture": quote.quoteDriver.carYearOfManufacture,
				"clubMember": false,
				"clubMemberNum": null,
				"driveMoreThanTwo": true,
				"ncb": quote.quoteDriver.ncb,
				"occupation": quote.quoteDriver.occupation,
				"promoCode": null,
				"validAgeGroup": true
			},
			"quoteId": null,
			"refNumber": null,
			"thirdPartyPropertyDemage": false
       	}),
        error: function() {
            alert("Error");
        },
        success: function(data) {
        	$('#silver-price big').html(data.grossPremium);
        }
    });

    $.ajax({
        url: '/fwdhk/api/iMotor/quote',
		contentType: "application/json",        
        type: 'POST',
        dataType: "json",
        data: JSON.stringify({
			"addOnPaAmt": null,
			"addOnTppdAmt": null,
			"compPlan": "Gold",
			"discountAmount": null,
			"grossPremium": null,
			"personalAccident": false,
			"planCode": "Comp",
			"quoteDriver": {
				"carEstimatedValue": quote.quoteDriver.carEstimatedValue,
				"carMakeCode": quote.quoteDriver.carMakeCode,
				"carCC": quote.quoteDriver.carCC,
				"carModel": quote.quoteDriver.carModel,
				"carYearOfManufacture": quote.quoteDriver.carYearOfManufacture,
				"clubMember": false,
				"clubMemberNum": null,
				"driveMoreThanTwo": true,
				"ncb": quote.quoteDriver.ncb,
				"occupation": quote.quoteDriver.occupation,
				"promoCode": null,
				"validAgeGroup": true
			},
			"quoteId": null,
			"refNumber": null,
			"thirdPartyPropertyDemage": false
       	}),
        error: function() {
            alert("Error");
        },
        success: function(data) {
        	$('#gold-price big').html(data.grossPremium);
        }
    });

    $('.silver-next').on("click", function(){
        var
        carMakeCode = quote.quoteDriver.carMakeCode,
        carModel = quote.quoteDriver.carModel,
        cc = quote.quoteDriver.carCC,
        ncb = quote.quoteDriver.ncb,
        carYearOfManufacture = quote.quoteDriver.carYearOfManufacture,
        clubMember = "false",
        carEstimatedValue = quote.quoteDriver.carEstimatedValue,
        occupation = quote.quoteDriver.occupation,
        driveMoreThanTwo = "true",
        validAgeGroup = "true",
        promoCode = "null",
        clubMemberNum = "null",
        item = {};
        item ["addOnPaAmt"] = "string";
        item ["addOnTppdAmt"] = "string";
        item ["discountAmount"] = "string";
        item ["grossPremium"] = "string";
        item ["personalAccident"] = "false";
        item ["compPlan"] = "Silver";
        item ["planCode"] = "Comp";
        item ["quoteId"] = "string";
        item ["refNumber"] = "string";
        item ["thirdPartyPropertyDemage"] = "false";
        item ["quoteDriver"] = {"carEstimatedValue": carEstimatedValue, "carMakeCode":carMakeCode, "carModel":carModel, "carYearOfManufacture":carYearOfManufacture, "clubMember":clubMember, "clubMemberNum":clubMemberNum, "driveMoreThanTwo":driveMoreThanTwo, "cc":cc, "ncb":ncb, "occupation":occupation, "promoCode":promoCode, "validAgeGroup":validAgeGroup};

        var $form = $("<form />");
        $form.attr("action", "quick-quote");
        $form.attr("method", "post");
        $form.append("<input type='hidden' name='data' value='"+JSON.stringify(item)+"' />");
        $("body").append($form);
        $form.submit();
    });

    $('.gold-next').on("click", function(){
        var
        carMakeCode = quote.quoteDriver.carMakeCode,
        carModel = quote.quoteDriver.carModel,
        ncb = quote.quoteDriver.ncb,
        cc = quote.quoteDriver.carCC,
        carYearOfManufacture = quote.quoteDriver.carYearOfManufacture,
        clubMember = "false",
        carEstimatedValue = quote.quoteDriver.carEstimatedValue,
        occupation = quote.quoteDriver.occupation,
        driveMoreThanTwo = "true",
        validAgeGroup = "true",
        promoCode = "null",
        clubMemberNum = "null",
        item = {};
        item ["addOnPaAmt"] = "string";
        item ["addOnTppdAmt"] = "string";
        item ["discountAmount"] = "string";
        item ["grossPremium"] = "string";
        item ["personalAccident"] = "false";
        item ["compPlan"] = "Gold";
        item ["planCode"] = "Comp";
        item ["quoteId"] = "string";
        item ["refNumber"] = "string";
        item ["thirdPartyPropertyDemage"] = "false";
        item ["quoteDriver"] = {"carEstimatedValue": carEstimatedValue, "carMakeCode":carMakeCode, "carModel":carModel, "carYearOfManufacture":carYearOfManufacture, "clubMember":clubMember, "clubMemberNum":clubMemberNum, "driveMoreThanTwo":driveMoreThanTwo, "cc":cc, "ncb":ncb, "occupation":occupation, "promoCode":promoCode, "validAgeGroup":validAgeGroup};

        var $form = $("<form />");
        $form.attr("action", "quick-quote");
        $form.attr("method", "post");
        $form.append("<input type='hidden' name='data' value='"+JSON.stringify(item)+"' />");
        $("body").append($form);
        $form.submit();
    });    
        
});

</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<style type="text/css" media="all">
    .quote-form-wrapper{
        margin: 0 15px;
    }
    .q5:last-of-type{
        margin-bottom: 30px;
    }
    @media screen and (max-width: 767px){
        .quote-form-wrapper{
            margin: 0;
            padding: 0 20px;
        }
        #testimonials{
            margin-left: -20px;
            margin-right: -20px;
            padding-left: 20px;
            padding-right: 20px;
        }
    }
</style>
<section id="" class="motor-get-quote">
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
            <h1 class="landing_h2 text-left hidden-sm hidden-xs">Please Select your plan.</h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 text-left hidden-lg hidden-md feature-ttl">Please Select your plan.</h1>
            <!--end mobile--> 
        </div>
    </div>
    <!--/.container--> 
    <div class="container select-plan-main">
        <div id="testimonials">
            <form action="/api/iMotor/quote" method="post">
                <div class="row planbox-wrapper">
                    <div class="col-sm-6 plan-panel">
                        <div class="blue-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-9">
                                    <h3>Lorem ipsum dolor sit amet</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <div class="currency">
                                        HK$ 
                                    </div>
                                    <div class="price" id="silver-price">
                                        <small>from</small>
                                        <big></big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <br />
                                    <a href="#" class="bdr-curve btn btn-primary nxt-btn silver-next">Get Silver</a>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 plan-panel">
                        <div class="yellow-color">
                            <div class="row">
                                <div class="col-xs-2 col-sm-3">
                                    <div class="thumbnail">
                                        <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-9">
                                    <h3>Lorem ipsum dolor sit amet</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
                                </div>
                                <div class="col-xs-12 text-right">
                                    <div class="currency">
                                        HK$ 
                                    </div>
                                    <div class="price" id="gold-price">
                                        <small>from</small>
                                        <big></big>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 text-center">
                                    <br />
                                    <a href="#" class="bdr-curve btn btn-primary nxt-btn gold-next">Get Gold</a>
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
                        <h4>See coverage and excess for the plans</h4>
                    </div>
                </div>
            </div>
            <div class="plan-accordion">
                <div class="panel-group" id="accordion" role="tablist" >
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title">
                                <a role="button" data-toggle="collapse"  href="#collapseOne" aria-controls="collapseOne">
                                    Coverage
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-6 col-md-8"></th>
                                                <th class="col-xs-3 col-md-2 silver text-center">Silver</th>
                                                <th class="col-xs-3 col-md-2 gold text-center">Gold</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Lorem ipsum dolor sit amet</td>
                                                <td class="text-center">$200,000,000</td>
                                                <td class="text-center">$200,000,000</td>
                                            </tr>
                                            <tr>
                                                <td>Lorem ipsum dolor sit amet</td>
                                                <td class="text-center">$200,000,000</td>
                                                <td class="text-center">$200,000,000</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
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
                                    Excess 
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-6 col-md-8"></th>
                                                <th class="col-xs-3 col-md-2 silver text-center">Silver</th>
                                                <th class="col-xs-3 col-md-2 gold text-center">Gold</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Lorem ipsum dolor sit amet</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="text-center">Silver</td>
                                                <td class="text-center">Gold</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form action="/api/iMotor/quote" method="post">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="row">
                            <div class="col-xs-6">
                                <br />
                                <br />
                                <a href="#" class="bdr-curve btn btn-primary nxt-btn silver-next">Get Silver</a>
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                            <div class="col-xs-6">
                                <br />
                                <br />
                                <a href="#" class="bdr-curve btn btn-primary nxt-btn g-next">Get Gold</a>
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>