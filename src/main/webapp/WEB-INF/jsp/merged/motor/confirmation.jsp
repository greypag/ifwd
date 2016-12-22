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
var quote = '${quote}';
//var quote = '{"addOnTppdAmt":"309","addOnPaBenefit":"500000","discountAmount":null,"theClubMemberNum":null,"addOnPaAmt":"100","personalAccidentAmount":null,"expDateOfPreviousInsurance":null,"motorCareDeclaration":[{"declarationDesc":null,"langCode":null,"declarationNo":"q1","declarationAns":false},{"declarationDesc":null,"langCode":null,"declarationNo":"q2","declarationAns":false},{"declarationDesc":null,"langCode":null,"declarationNo":"q3","declarationAns":false}],"tPPDExcess":null,"amtFromThirdPartyToCompGold":null,"compInsuranceAmount":null,"regNoofPreviousPolicy":null,"psNoProvidePersonalData":true,"youngDriverExcess":null,"inexperiencedDriverExcess":null,"promoCode":null,"id":0,"addOnTppdIncrease":"5000000","carDetail":{"yearOfManufacture":"2016","bankMortgage":false,"bankMortgageCode":null,"bankMortgageName":null,"electricCar":false,"engineCapacity":2599,"chassisNumber":"1HGCM82633A004352","estimatedValue":200000,"typeOfBody":null,"alarm":null,"makeCode":"BMW","model":"120I","modelDesc":"MODELZ","id":null,"carGroup":null},"thirdPartyPropertyDamage":false,"theftExcess":null,"amountDueAmount":"1614.53","previousPolicyNo":null,"unnamedDriverExcess":null,"compPlan":null,"subTotalAmount":null,"amtFromThirdPartyToCompSilver":null,"ownDamageExcess":null,"coverNoteNum":"CVVPE16-000257","parkingExcess":null,"policyStartDate":"2016-11-25T10:54:02","planCode":"Third","applicant":{"occupation":"A1","name":null,"dateOfBirth":null,"ncb":40.0,"validAgeGroup":true,"hkid":null,"email":null,"driveMoreThanTwo":true,"contactNo":null,"correspondenceAddress":null},"personalAccident":false,"policyId":"26655406","driver":[{"occupation":"A1","name":null,"dateOfBirth":null,"ncb":null,"validAgeGroup":true,"hkid":null,"email":null,"driveMoreThanTwo":true,"contactNo":null}],"psPICS":false,"refNumber":"QFVPE16-001608","psNoDM":true,"grossPremium":null,"nameOfPreviousInusrancer":null}';
var jsonQuote ="";
try{
	jsonQuote = jQuery.parseJSON('${quote}');
}catch(err) {
	window.location="<%=request.getContextPath()%>/en/motor-insurance/";
}
</script>

<!--Body-->



<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/bootstrap-switch.min.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<style type="text/css" media="all">
    .motor-confirmation .center .landing_h1{
        color: #555 !important;

    }
    .motor-confirmation .confirmation-section{
        padding-top: 0;
        padding-bottom: 40px;
    }
    .motor-confirmation #testimonials .landing_h2{
        color: #555 !important;
    }
    .motor-confirmation .table-cell{
        display: table-cell;
        vertical-align: middle;
        height: 100px;
        padding-right: 15px;
    }
    .motor-confirmation #testimonials .upload{
        padding-top: 15px;
    }
    .motor-confirmation .table-cell .thumbnail{
        margin: 0;
        width: auto;
    }
    .small-print{
        line-height: 1;
    }
    .motor-confirmation .social-link-wrapper{
        float: none;
        padding: 40px 0;
    }
    @media screen and (max-width: 767px){
        .motor-confirmation .table-cell{
            height: auto;
        }
        .motor-confirmation #testimonials{
            padding-left: 15px;
            padding-right: 15px;
        }
        .motor-confirmation .thumbnail{
            max-width: 60px;
        }

    }
</style>
<section id="" class="motor-landing motor-confirmation">
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

    <div class="">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h1 class="landing_h1 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.confirmation.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h1 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.confirmation.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container confirmation-section">
        <div class="content">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12 text-center">
                    <!-- <p>
                        <fmt:message key="motor.confirmation.page.copy.part1" bundle="${motorMsg}" /><strong><fmt:message key="motor.confirmation.page.copy.part2" bundle="${motorMsg}" /></strong><fmt:message key="motor.confirmation.page.copy.part3" bundle="${motorMsg}" />
                        <br/>
                        <fmt:message key="motor.confirmation.covernote.copy.part1" bundle="${motorMsg}" /><a href='mailto:<fmt:message key="motor.confirmation.covernote.email" bundle="${motorMsg}" />'><fmt:message key="motor.confirmation.covernote.email" bundle="${motorMsg}" /></a><fmt:message key="motor.confirmation.covernote.copy.part2" bundle="${motorMsg}" />
                    </p>
                    <p>
                        <fmt:message key="motor.confirmation.referenceno.copy" bundle="${motorMsg}" />
                        <h3 id="motorRef" class="heading-h3 color-orange ref-number">
                         
                        </h3>
                    </p>-->
                    <p>
                        <fmt:message key="motor.uploadconfirm.page.copy.part1" bundle="${motorMsg}" /><strong><fmt:message key="motor.uploadconfirm.page.copy.part2" bundle="${motorMsg}" /></strong><fmt:message key="motor.uploadconfirm.page.copy.part3" bundle="${motorMsg}" />
                        <br/>
                        <fmt:message key="motor.uploadconfirm.covernote.copy.part1" bundle="${motorMsg}" />
                        <span id="sendMail"></span>
                        <fmt:message key="motor.uploadconfirm.covernote.copy.part2" bundle="${motorMsg}" />
                    </p>
                    <p>
                        <fmt:message key="motor.uploadconfirm.referenceno.copy" bundle="${motorMsg}" />
                        <h3 id="motorRef" class="heading-h3 color-orange ref-number"></h3>
                    </p>
                </div>
            </div>

        </div>
    </div>
    <div class="container no-border" id="testimonials" >
        <div class="center" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.confirmation.uploaddoc.title" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.confirmation.uploaddoc.title" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
            <div class="row">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                    <p>
                        <fmt:message key="motor.confirmation.uploaddoc.copy" bundle="${motorMsg}" />
                        <br />
                        <br />
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="row">
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="">
                                <img src="<%=request.getContextPath()%>/resources/images/motor/HKID_upload_confirm.png" alt="" width="150" />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            <fmt:message key="motor.confirmation.uploaddoc.1.copy" bundle="${motorMsg}" />
                        </h4>
                    </div>
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="">
                                <img src="<%=request.getContextPath()%>/resources/images/motor/Driver_License_upload_confirm.png" alt="" width="150"  />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            <fmt:message key="motor.confirmation.uploaddoc.2.copy" bundle="${motorMsg}" />
                        </h4>
                    </div>
                    <div class="col-sm-4 upload">
                        <div class="table-cell">
                            <div class="">
                                <img src="<%=request.getContextPath()%>/resources/images/motor/vehicle_registeration_Confirm_upload.png" alt="" width="150"  />
                            </div>
                        </div>
                        <h4 class="table-cell text-left">
                            <fmt:message key="motor.confirmation.uploaddoc.3.copy" bundle="${motorMsg}" />
                        </h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                        <small>
                            <fmt:message key="motor.confirmation.uploaddoc.reminder.copy" bundle="${motorMsg}" />
                        </small>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                <div class="content text-center">
                    <br />
                    <a class="bdr-curve btn btn-primary" href="#" id="uploadDoc"><fmt:message key="motor.button.uploadnow" bundle="${motorMsg}" /></a>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
    <div class="container" >
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.confirmation.discount.title" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.confirmation.discount.title" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row text-center">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="content">
                    <p>
                        <fmt:message key="motor.confirmation.discount.copy" bundle="${motorMsg}" />
                        <br />
                        <br />
                    </p>
                    <p>
                        <h3><fmt:message key="motor.confirmation.discount.original.copy" bundle="${motorMsg}" /> <strike class="amountDueAmount"></strike></h3>
                        <h2 class="orange"><fmt:message key="motor.confirmation.discount.save.copy" bundle="${motorMsg}" /><span class="amountSave"></span></h2>
                    </p>
                    <p>
                        <br />
                        <a class="" href="#"><fmt:message key="motor.confirmation.discount.downloadnow" bundle="${motorMsg}" /></a>
                        <br />
                        <img src="<%=request.getContextPath()%>/resources/images/motor/Apple_icon.png" alt="" />
                        &nbsp;
                        &nbsp;
                        <img src="<%=request.getContextPath()%>/resources/images/motor/Andriod_icon.png" alt="" />
                    </p>
                    <p class="small-print">
                        <br/>

                        <small>
                            <fmt:message key="motor.confirmation.discount.remark.copy.part1" bundle="${motorMsg}" /><a href='<fmt:message key="motor.confirmation.discount.remark.tnc.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.confirmation.discount.remark.tnc.copy" bundle="${motorMsg}" /></a><fmt:message key="motor.confirmation.discount.remark.copy.part2" bundle="${motorMsg}" />
                        </small>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row bottom">
            <div class="text-center col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                <h3><fmt:message key="motor.confirmation.share.title" bundle="${motorMsg}" /></h3>
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2" style="display:none">
                        <input type="text" name="shareUrl" id="" value="https://i.fwd......." class="form-control" disabled/>
                    </div>

                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2">
                        <div class="social-link-wrapper">
                            <div class="social-link">
                                <a id="fb-dialog-share" href="javascript:void(0);" onclick="return false;" target="_blank"><i class="fa fa-share-alt"></i></a>
                                <a href="https://www.facebook.com/FWD.HK.MO/" target="_blank"><i class="fa fa-facebook-official"></i></a>
                                <a href="https://www.youtube.com/FWDHK" target="_blank"><i class="fa fa-youtube-play"></i></a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="center wow fadeInDown animated" > 
            <!--desktop-->
            <h2 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.confirmation.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end-desktop--> 
            <!--Mobile-->
            <h2 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.confirmation.tips.heading" bundle="${motorMsg}" /></h2>
            <!--end mobile--> 
        </div>
        <div class="row read-more-blog">
            <div class="col-sm-6 col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/1st_blog_image.jpg" alt="">
                    <div class="overlay ">
                        <h2><fmt:message key="motor.confirmation.tips.1.title" bundle="${motorMsg}" /></h2>
                        <div class="hidden-xs">
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                        </div>
                    </div>
                </div>
                <div class="clearfix">
                </div>
                <div class="row text-center">
                    <div class="col-xs-4 col-xs-offset-4">
                        <br />
                        <a class="info visible-xs btn btn-primary bdr-curve" href='<fmt:message key="motor.confirmation.tips.1.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>


            </div>
            <div class="col-sm-6 hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/2nd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.2.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.2.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/3rd_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.3.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.3.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm hidden-xs col-md-3">
                <div class="hovereffect">
                    <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/motor/4th_blog_image.jpg" alt="">
                    <div class="overlay">
                        <h2><fmt:message key="motor.confirmation.tips.4.title" bundle="${motorMsg}" /></h2>
                        <a class="info" href='<fmt:message key="motor.confirmation.tips.4.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.button.readmore" bundle="${motorMsg}" /></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/landing.js"></script>
<script type="text/javascript">
//var quote = jQuery.parseJSON('{"policyId":"26336399","refNumber":"QFVPE16-001548","applicant":{"ncb":"40","occupation":"A1","driveMoreThanTwo":true,"validAgeGroup":true,"contactNo":"28515450","correspondenceAddress":{"block":"cc","building":"ddd","district":"鴨脷洲","estate":"ee","flat":"aa","floor":"bb","hkKlNt":"香港","streetName":null,"streetNo":null},"dateOfBirth":"23-11-1991","email":"kevin.chan@isobar.com","hkid":"a1234563","name":"chan chan chan"},"carDetail":{"estimatedValue":200000,"makeCode":"BMW","engineCapacity":"2599","model":"120I","yearOfManufacture":"2016","bankMortgage":true,"bankMortgageName":"ACB FINANCE LIMITED","chassisNumber":"1HGCM82633A004352","modelDesc":"MODELZ"},"driver":[{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"a1234567","name":"chan chan chan","occupation":"銀行/金融/保險/投資","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"b1234567","name":"bb bb bb","occupation":"會計","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"c1234567","name":"ccc ccc ccc","occupation":"廣告","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"d1234567","name":"dd dd  ddd","occupation":"演藝娛樂界 (例如：演藝人員/化妝師/髪型師等等)","validAgeGroup":"true"},{"dateOfBirth":"23-11-1991","driveMoreThanTwo":true,"hkid":"e1234567","name":"ee ee ee","occupation":"航空業","validAgeGroup":"true"}],"planCode":"Third","compPlan":null,"personalAccident":false,"thirdPartyPropertyDamage":false,"policyStartDate":"23-11-2016","nameOfPreviousInusrancer":"axa","regNoofPreviousPolicy":"11233588","expDateOfPreviousInsurance":"27-05-2016","previousPolicyNo":"P122345","motorCareDeclaration":[{"declarationAns":true,"declarationNo":"q1"},{"declarationAns":true,"declarationNo":"q2"},{"declarationAns":true,"declarationNo":"q3"}],"psNoDM":"true","psNoProvidePersonalData":"true","psPICS":"true"}');

$(document).ready(function(){
	//jsonQuote = jQuery.parseJSON('{"addOnTppdAmt":"309","addOnPaBenefit":"500000","discountAmount":null,"theClubMemberNum":null,"addOnPaAmt":"100","personalAccidentAmount":null,"expDateOfPreviousInsurance":"21-12-2016","motorCareDeclaration":[{"declarationDesc":null,"langCode":null,"declarationNo":"q1","declarationAns":false},{"declarationDesc":null,"langCode":null,"declarationNo":"q2","declarationAns":false},{"declarationDesc":null,"langCode":null,"declarationNo":"q3","declarationAns":false}],"tPPDExcess":null,"amtFromThirdPartyToCompGold":null,"compInsuranceAmount":null,"regNoofPreviousPolicy":"3321321","psNoProvidePersonalData":true,"youngDriverExcess":null,"inexperiencedDriverExcess":null,"promoCode":null,"id":0,"addOnTppdIncrease":"5000000","carDetail":{"yearOfManufacture":"2015","bankMortgage":false,"bankMortgageCode":null,"bankMortgageName":null,"electricCar":false,"engineCapacity":2599,"chassisNumber":"1HGCM82633A004352","estimatedValue":200000,"typeOfBody":null,"alarm":null,"makeCode":"BMW","model":"120I","modelDesc":"MODELZ","id":null,"carGroup":null},"thirdPartyPropertyDamage":true,"theftExcess":null,"amountDueAmount":"4510.59","previousPolicyNo":"3321","unnamedDriverExcess":null,"compPlan":"Gold","subTotalAmount":null,"amtFromThirdPartyToCompSilver":null,"ownDamageExcess":null,"coverNoteNum":"CVVPE16-000366","parkingExcess":null,"policyEndDate":"21-12-2017","policyStartDate":"22-12-2016","planCode":"Comp","applicant":{"occupation":"A1","name":"chan chan chan","dateOfBirth":"22-12-1991","ncb":40.0,"validAgeGroup":true,"hkid":"a1234563","email":"kevin.chan@isobar.com","driveMoreThanTwo":true,"contactNo":"28515450","correspondenceAddress":{"streetName":"dsdsadsa","streetNo":"33213","hkKlNt":"??","addressType":null,"flat":"aa","district":"TIN HAU","estate":"ddsa","block":"cccc","floor":"bbbb","building":"ddd"}},"personalAccident":true,"policyId":"27034429","driver":[{"occupation":"A1","name":"chan chan chan","dateOfBirth":"22-12-1991","ncb":null,"validAgeGroup":true,"hkid":"a1234563","email":null,"driveMoreThanTwo":true,"contactNo":null}],"psPICS":false,"psNoDM":true,"refNumber":"gOgQXchfS4B9UnUmSD1hnQ==","grossPremium":null,"nameOfPreviousInusrancer":"AXAChinaRegionInsuranceCompanyLimited","riderDiscountAmt":null}');
	
	$(".amountDueAmount").html("$"+jsonQuote.amountDueAmount);
	
	$(".amountSave").html((parseInt(jsonQuote.amountDueAmount)*0.3).toFixed(2));
	$("#sendMail").html("<a href='mailto:"+jsonQuote.applicant.email+"'>"+jsonQuote.applicant.email+"</a>");
	$(".ref-number").html(jsonQuote.coverNoteNum);
	$("#uploadDoc").on('click',function(){
		var $form = $("<form id='quote-form' />");
        $form.attr("action", "document-upload");
        $form.attr("method", "post");
        var $quote = $("<input type='hidden' name='data' />");
        $quote.attr("value", JSON.stringify(jsonQuote));
        $form.append($quote);
        $("body").append($form);
        $('#quote-form').submit();  
	});
});
</script>
