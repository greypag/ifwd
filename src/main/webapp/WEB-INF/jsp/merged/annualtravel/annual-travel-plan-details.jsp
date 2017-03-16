<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<%@page import="java.util.*"%>
<%@page	import="com.ifwd.fwdhk.model.DistrictBean,com.ifwd.fwdhk.model.AnnualTravelQuoteBean"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
    String authenticate = "false";
    if (request.getSession().getAttribute("authenticate") != null) {
        authenticate = request.getSession()
                .getAttribute("authenticate").toString();
    }
    
    AnnualTravelQuoteBean sessTravelQuoteBean = (AnnualTravelQuoteBean) session.getAttribute("corrAnnualTravelQuote");
    request.setAttribute("annualTravelQuote", sessTravelQuoteBean);
%>

<script>
    var contextPath = "${pageContext.request.contextPath}";
    
    $(function() {
        $("[data-toggle='tooltip']").tooltip();
    });
</script>


<script>

var getBundleLanguage = "";
var lang = UILANGUAGE;

if(lang === "EN"){
    getBundleLanguage = "en";
}else{
    if(lang === "tc"){
        getBundleLanguage = "zh";
    } 
    else{
        getBundleLanguage = "en";
    }
}

perventRedirect=true;
    
var namePlaceholder="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />";
var hkidPlaceholder="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />";
var appMobilePlaceholder = "";
var appEmailPlaceholder = "";

var insureNamePlaceholder="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />";
var insureHkidPlaceholder="<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />";

var benNamePlaceholder="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />";
var benHkidPlaceholder="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />";

var roomPlaceholder="<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />";
var floorPlaceholder="<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />";
var blockPlaceholder="<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />";
var buildingPlaceholder="<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />";
var estatePlaceholder="<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />";
var streetNoPlaceholder="<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />";
var streetNamePlaceholder="<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />";
    
function setDropArea(id) {
	$('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
	
	if ($("#selectCADistHid option[value='"+id+"']").text() == "HK")
        document.getElementById("inlineCARadio3").checked = true;
    else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
        document.getElementById("inlineCARadio4").checked = true;
    else
        document.getElementById("inlineCARadio5").checked = true;
	if(id != '') {
		$("#errCADist").html('');
		$('#inputCADistrict').removeClass('invalid-field');
	}
}

</script>

<script>
function activateUserAccountJoinUs() {
	perventRedirect=false;
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    
    setTimeout(function(){
    	   $('#frmYourDetails').submit();
    }, 500);
}
</script>


<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.planoption" bundle="${msg}" /></div>
        <div class="product_header_path_item active"><fmt:message key="annual.title.application" bundle="${msg}" /></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.payment" bundle="${msg}" /><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs"><fmt:message key="annual.title.confirmation" bundle="${msg}" /></div>
    </div>
</section>

<section>
    <div id="cn" class="container">
        <div class="row">
            <form:form name="frmYourDetails" id="frmYourDetails" onsubmit="return validateAnnualTravelDetails(this,'frmYourDetails','${language}');" modelAttribute="frmYourDetails" method="post" action="" >
                <ol class="breadcrumb pad-none">
                    <li><fmt:message key="annual.title.home" bundle="${msg}" /> <i class="fa fa-caret-right"></i></li>
                    <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /><i class="fa fa-caret-right"></i></li>                    
                    <li><fmt:message key="annual.title.travelcare" bundle="${msg}" /></li>
                    <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="annual.title.application" bundle="${msg}" /></li>
                </ol>
                <%
                    if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                        .getAttribute("authenticate").toString())) {
                %>
                <div class="product_plan_details_member_title white-bg1">
	                <h3 class="pull-left h2-3-existing-fwd-head bmg-detail-exist-member-head">
	                <fmt:message key="annual.common.member" bundle="${msg}" />
	                </h3>
	                <div class="pull-left">
	                    <a href="#" class="pull-left btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="annual.common.login" bundle="${msg}" /></a>    
	                    <div class="pull-left text-left">
	                        <h3 class="text-left or-continue">
	                            <span style="margin-left:10px;margin-right:10px;"><fmt:message key="annual.common.or" bundle="${msg}" /></span>
	                            <fmt:message key="annual.common.guest" bundle="${msg}" />
	                        </h3>
	                    </div>
	                    <div class="clearfix"></div>
	                </div>
	                <div class="clearfix"></div>
                </div>
                <%
                    }
                %>
                <div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
                        <br/>
                        <!-- <div class="gray-bdr"></div> -->
                        <!-- updated responsive design start -->
                        <div class="form-wrap">
                            <div class="big-title black-bold pad-none bmg-big-title" style="color: #f68a1d;">
                                <fmt:message key="annual.details.details" bundle="${msg}" />
                            </div>
                            <div class="form-group float">
								<span id="errorMsg"  class="text-red">${errormsg}</span>
							</div>
                            <!-- english name start -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.fullname" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="fullName" autocomplete="off"
                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" id="inputFullName"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
										    value="${userDetails.fullName }" readonly="readonly"
										    </c:when>
										    <c:otherwise>
                                            value="<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />"
                                            </c:otherwise>
										</c:choose>
	                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />');" 
	                                    onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.applicant.name.placeholder" bundle="${msg}" />'); validateName('inputFullName','fullnameinvalid',true,'applicant');"
                                        onkeypress="return alphaOnly(event);" maxlength="50" />
                                    <span id="fullnameinvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- english name end -->
                           <!-- id card starts -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputHkid" class="field-label bold-500"><fmt:message key="annual.details.hkid" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="hkid" class="js-field-hkid form-control numberinput textUpper full-control bmg_custom_placeholder" id="inputTxtAppHkid" 
                                   onkeypress=" return hkidOnkeypress(event);"
                                   value="<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />"
                                   onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />');" 
                                   onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.applicant.hkid.placeholder" bundle="${msg}" />'); validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');" autocomplete="off"/>
                                       <span id="errAppHkid" class="text-red" ></span>
                               </div>
                           </div>
                           <!-- id card ends -->
                           <!-- birthday starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputApplicantDob" class="field-label bold-500"><fmt:message key="annual.details.birthday" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_annual_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                        <input name="applicantDob" type="text"  class="pointer datepicker form-control border-radius" id="applicantDob" value="" readonly>
                                    </div>
                                    <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- birthday ends -->
                           <!-- mobile starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputMobileNo"
                                        class="field-label bold-500"><fmt:message key="annual.details.mobile" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input name="mobileNo" type="tel" autocomplete="off"
                                        class="js-field-mobile form-control full-control" value="${userDetails.mobileNo.trim()}"
                                        id="inputMobileNo"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
                                        onkeypress="return isNumeric(event)"
                                        onblur="replaceNumeric(this); validateMobile('inputMobileNo','errMobileNo');" maxlength="8" /> 
                                    <span id="errMobileNo" class="text-red">
                                    </span>
                               </div>
                           </div>
                           <!-- mobile ends -->
                           <!-- email address starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputEmailId"
                                        class="field-label bold-500"><fmt:message key="annual.details.email" bundle="${msg}" /></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input class="form-control full-control textLower" name="emailAddress" type="email" autocomplete="off"
                                        value="${userDetails.emailAddress.trim()}" id="inputEmailId"
                                        <c:choose>
										    <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
										    readonly="readonly"
										    </c:when>
										</c:choose>
                                        maxlength="50" onblur="validateEmail('inputEmailId','emailid');" > <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- email address ends -->
                         </div>
                         <!-- updated responsive design end -->
                        
                        
                        <div class="form-wrap">          
                               <div class="big-title field-label bold-500 pad-none" style="margin-top: 30px;"><fmt:message key="annual.details.address.correspondence" bundle="${msg}" /></div>                       
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.address.RFB" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                       <div class="row">
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                               <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCARoom" name="applicantRoom"
                                                placeholder="<fmt:message key="annual.details.address.room.placeholder" bundle="${msg}" />"
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.room.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.room.placeholder" bundle="${msg}" />');"
                                                onkeypress="    return isAlphaNumeric(event);" maxlength="10" autocomplete="off"/>
                                           </div>
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCAFloor" name="applicantFloor"
                                                placeholder="<fmt:message key="annual.details.address.floor.placeholder" bundle="${msg}" />"  
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.floor.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.floor.placeholder" bundle="${msg}" />');"     
                                                onkeypress="    return isAlphaNumeric(event);" maxlength="5" autocomplete="off"/>
                                           </div>
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCABlock" name="applicantBlock"
                                                placeholder="<fmt:message key="annual.details.address.block.placeholder" bundle="${msg}" />"
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.block.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.block.placeholder" bundle="${msg}" />');"
                                                onkeypress="    return isAlphaNumeric(event);" maxlength="5" autocomplete="off" />
                                           </div>
                                           <div class="clearfix"></div>
                                        </div>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.address.building" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCABuilding" name="applicantBuilding"
                                                placeholder="<fmt:message key="annual.details.address.building.placeholder" bundle="${msg}" />"
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.building.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.building.placeholder" bundle="${msg}" />'); chkNotNullCABuilding(this, 'errCABuilding');"
                                                onkeypress="return isAlphaNumeric(event);" maxlength="50" autocomplete="off"/>
                                                <span id="errCABuilding" class="text-red"> </span>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.address.estate" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCAEstate" name="applicantEstate"
                                                placeholder="<fmt:message key="annual.details.address.estate.placeholder" bundle="${msg}" />"
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.estate.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.estate.placeholder" bundle="${msg}" />'); chkNotNullCAEstate(this, 'errCAEstate');"
                                                onkeypress="    return isAlphaNumeric(event);" maxlength="50" autocomplete="off"/>
                                                <span id="errCAEstate" class="text-red"> </span>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.address.streetno" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                            id="inputCAStreetNo" name="applicantStreetNo"
                                            placeholder="<fmt:message key="annual.details.address.streetNo.placeholder" bundle="${msg}" />"
                                            onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.streetNo.placeholder" bundle="${msg}" />');"
                                            onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.streetNo.placeholder" bundle="${msg}" />');"
                                            onkeypress="" maxlength="5" autocomplete="off"/>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label for="inputFullName" class="field-label bold-500"><fmt:message key="annual.details.address.streetname" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text" class="js-field-address form-control full-control bmg_custom_placeholder textUpper"
                                                id="inputCAStreetName" name="applicantStreetName"
                                                placeholder="<fmt:message key="annual.details.address.streetName.placeholder" bundle="${msg}" />"
                                                onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.address.streetName.placeholder" bundle="${msg}" />');"
                                                onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.address.streetName.placeholder" bundle="${msg}" />');"
                                                onkeypress="    return isAlphaNumeric(event);" maxlength="50" autocomplete="off"/>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 hidden-sm hidden-xs pad-none">
                                       <label for="inputFullName" class="field-label bold-500">&nbsp;</label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select" id="inputCADistrict">
                                                <select name="applicantDistrict"class="form-control soflow full-control" id="selectCADist" onchange="setDropArea(this.value)">
	                                                <option value=""><fmt:message key="annual.details.address.district" bundle="${msg}" /></option>
	                                                <%
														List lst = (List) request.getAttribute("districtList");
														Iterator itr = lst.iterator();
														int i = 1;
														while (itr.hasNext()) {
															DistrictBean districtList = (DistrictBean) itr.next();
													%>
														<option value="<%=districtList.getCode()%>"><%=districtList.getDescription()%></option>
													<%
														}
													%>
                                                </select>
                                            </div>
                                            <div class="hidden">
                                                <select name="applicantDistrictHid"
                                                    class="form-control soflow full-control" id="selectCADistHid">
                                                    <option value="">District</option>
                                                    <%
														List lst1 = (List) request.getAttribute("districtList");
														Iterator itr1 = lst1.iterator();
														while (itr1.hasNext()) {
															DistrictBean districtList = (DistrictBean) itr1.next();
													%>
													<option value="<%=districtList.getCode()%>"><%=districtList.getArea()%></option>
													<%
														}
													%>
                                                </select>
                                            </div> <span id="errCADist" class="text-red"> </span>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                               
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 hidden-sm hidden-xs pad-none">
                                       <label for="inputFullName" class="field-label bold-500">&nbsp;</label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                       <div class="row" style="margin-top: 10px;">
                                           <div class="col-xs-4">
                                               <label class="radio-inline homecare-lb">
                                                   <input type="radio" name="applicantArea" id="inlineCARadio3"
                                                   value="HK" checked="" class="home-input1">
                                                   <span><fmt:message key="home.details.registration.hk" bundle="${msg}"/></span>
                                           </label> 
                                           </div>
                                           <div class="col-xs-4">
                                               <label class="radio-inline homecare-lb"> <input
                                                       type="radio" name="applicantArea" id="inlineCARadio4"
                                                       value="KL" class="home-input1">
                                                       <span><fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
                                               </label>
                                           </div>
                                           <div class="col-xs-4">
                                               <label class="radio-inline"> <input type="radio"
                                                   name="applicantArea" id="inlineCARadio5" value="NT"
                                                   class="home-input1">
                                                   <span><fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
                                                </label>
                                           </div>
                                           <div class="clearfix"></div>
                                        </div>
                                   </div>
                                   <div class="clearfix"></div>
                               </div>
                             </div>
                        
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="black-bold" style="padding-left:0px !important;color: #f68a1d;">
                                <fmt:message key="annual.details.insured" bundle="${msg}" />
                            </div>
                        </div>
                        
                            <!-- Personal -->
                            <input type="hidden" name="totalPersonalTraveller"
                                id="totalPersonalTraveller"
                                value="${corrAnnualTravelQuote.totalPersonalTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrAnnualTravelQuote.totalPersonalTraveller}">
                                
                                <div class="form-wrap">
                                <div class="personaltraveller" style="border: none;">
                                    <h4 class="bold" style="padding-left:0px !important;color:#ccc;">
                                        <fmt:message key="annual.details.insured.traveller" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                        <c:if test="${inx == 1}"><fmt:message key="annual.details.insured.same" bundle="${msg}" /></c:if>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.fullname" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                  <c:if test="${inx == 1}">
                                                  <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" 
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														    <c:otherwise>
	                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
				                                            </c:otherwise>
														</c:choose>
		                                                onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
		                                                onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly"/>
                                                </c:if>
                                                <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="personalName"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtPersonalFullName${inx}',false,'insured');"
                                                        onkeypress="return alphaOnly(event);" maxlength="100" autocomplete="off"/>
                                                 </c:if>
                                                 <span id="errtxtPersonalFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.hkid" bundle="${msg}" /></label>
                                               <input type="hidden" id="selectedPersonalHkidPass${inx}" value="HKID" autocomplete="off"/>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid${inx}" name="personalHKID" class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                               value="<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                               onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                               onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedPersonalHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
                                               <c:if test="${inx == 1}">readonly="readonly"</c:if>/> 
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.birthday" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="input-group date annual_dob" id="input_insure_dob${inx}"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
			                                       <input name="personalDob" type="text"  class="pointer datepicker form-control border-radius" id="insureDob${inx}" value="" readonly>
			                                   </div>
			                                   <c:if test="${inx == 1}">
                                                   <div style="cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)">&nbsp;</div>
                                               </c:if>
			                                   <span id="errtxtInsuDob${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                     <select name="personalBeneficiary" id="personalselectBenificiary${inx}" 
                                                            onChange="activeDiv('personalbenificiaryId${inx}','personalselectBenificiary${inx}', 'personalBenefitiaryId${inx}', 'personalBenefitiaryHKId${inx}')"
                                                        class="form-control soflow select-label" >
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                        	<enhance:out escapeXml="false">
                                                            <option value="${relationshipList.key}"><c:out
                                                                    value="${relationshipList.value}" /></option>
                                                            </enhance:out>
                                                        </c:forEach>
                                                    </select>
                                                    </div>
                                                    <span id="errpersonalselectBenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                        <fmt:message key="annual.details.insured.fullname" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                        name="personalBenificiaryFullName"
                                                        id="personalBenefitiaryId${inx}" class="js-field-hkid form-control full-control textUpper bmg_custom_placeholder"
                                                        value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('personalBenefitiaryId${inx}','errpersonalBenefitiaryId${inx}',false,'beneficiary');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" autocomplete="off" />
                                                    <span id="errpersonalBenefitiaryId${inx}" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId end -->
                                       <!-- personalbenificiaryId b start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                    <fmt:message key="travel.details.insured.beneficiary.type" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="selectPersonalBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedPersonalBenefitiaryHkidPass" onchange="togglePlaceholder(this,'personalBenefitiaryHKId${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
                                                        <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                        <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId b end -->
                                       <!-- personalbenificiaryId c start -->
                                       <div class="form-group float hide" id="personalbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input
                                                    id="personalBenefitiaryHKId${inx}" name="personalBenificiaryHkid"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('personalBenefitiaryHKId${inx}','selectPersonalBenefitiaryHkidPass${inx}','errpersonalBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="errpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidpersonalBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
                            
                            <input type="hidden" name="totalAdultTraveller"
                                id="totalAdultTraveler"
                                value="${corrAnnualTravelQuote.totalAdultTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrAnnualTravelQuote.totalAdultTraveller}">
                                
                                <div class="form-wrap">
                                <div class="personaltraveller" style="border: none;">
                                    <h4 class="bold" style="padding-left:0px !important;color:#ccc;">
                                        <fmt:message key="annual.details.insured.adult" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                        <c:if test="${inx == 1}"><fmt:message key="annual.details.insured.same" bundle="${msg}" /></c:if>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.fullname" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                  <c:if test="${inx == 1}">
                                                  <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName"
                                                        class="js-field-fullname form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" 
                                                        <c:choose>
														    <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI'}">
														    value="${userDetails.fullName }"
														    </c:when>
														    <c:otherwise>
	                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
				                                            </c:otherwise>
														</c:choose>
		                                                onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" readonly="readonly" autocomplete="off"/>
                                                </c:if>
                                                <c:if test="${inx > 1}">
                                                    <input type="text"
                                                        id="txtInsuFullName${inx}" name="adultName"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtInsuFullName${inx}','errtxtAdFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" autocomplete="off"/>
                                                 </c:if>
                                                 <span id="errtxtAdFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <c:if test="${inx == 1}">
                                                   <label class="field-label bold-500"><fmt:message key="annual.details.hkid" bundle="${msg}" /></label>
                                                   <input type="hidden" id="selectedAdHkidPass${inx}" name="selectedAdHkidPass" value="HKID" autocomplete="off"/>
                                               </c:if>
                                               <c:if test="${inx > 1}">
                                                   <div class="bmg-label-styled-select styled-select">
                                                       <select id="selectedAdHkidPass${inx}" class="form-control soflow select-label" name="selectedAdHkidPass" onchange="togglePlaceholder(this,'txtInsuHkid${inx}','<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />');">
                                                           <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                           <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                       </select>
                                                   </div>
                                               </c:if>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid${inx}" name="adultHKID" class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                               value="<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);"
                                               onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                               onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtInsuHkid${inx}','selectedAdHkidPass${inx}','errtxtInsuHkid${inx}',false,'insured');"
                                               <c:if test="${inx == 1}">readonly="readonly"</c:if>/> 
                                                    <span id="errtxtInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.birthday" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="input-group date annual_dob" id="input_adult_dob${inx}"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
			                                       <input name="adultDob" type="text"  class="pointer datepicker form-control border-radius" id="adultDob${inx}" value="" readonly>
			                                   </div>
			                                   <c:if test="${inx == 1}">
                                                   <div style="cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)">&nbsp;</div>
                                               </c:if>
			                                   <span id="errtxtAdDob${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                   <select name="adultBeneficiary" id="adultsselectBenificiary${inx}" 
                                                       onChange="activeDiv('adultsbenificiaryId${inx}','adultsselectBenificiary${inx}', 'adultBenefitiaryId${inx}', 'adultBenefitiaryHKId${inx}')"
                                                       class="form-control soflow select-label" >
                                                       <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                      	   <enhance:out escapeXml="false">
                                                               <option value="${relationshipList.key}">
                                                               <c:out value="${relationshipList.value}" /></option>
                                                           </enhance:out>
                                                       </c:forEach>
                                                   </select>
                                               </div>
                                               <span id="erradultsselectBenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                        <fmt:message key="annual.details.insured.fullname" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
	                                                  name="adultBenificiaryFullName"
	                                                  id="adultBenefitiaryId${inx}"
	                                                  class="js-field-hkid form-control full-control textUpper bmg_custom_placeholder" 
	                                                  value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                      onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                      onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('adultBenefitiaryId${inx}','erradultBenefitiaryId${inx}',false,'beneficiary');"
	                                                  onkeypress="    return alphaOnly(event);" maxlength="100" autocomplete="off"/>
                                                    <span id="erradultBenefitiaryId${inx}" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId end -->
                                       <!-- personalbenificiaryId c start -->
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                   <label class="field-label bold-500">
                                                       <fmt:message key="annual.details.type" bundle="${msg}" />
                                                   </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <div class="styled-select">
                                                       <select id="selectAdBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="selectedAdBenefitiaryHkidPass" onchange="togglePlaceholder(this,'adultBenefitiaryHKId${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
                                                           <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                           <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                       </select>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="form-group float hide" id="adultsbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                   <label class="field-label bold-500">
                                                   </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input
                                                    id="adultBenefitiaryHKId${inx}" name="adultBenificiaryHkid"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('adultBenefitiaryHKId${inx}','selectAdBenefitiaryHkidPass${inx}','erradultBenefitiaryHKId${inx}',false,'beneficiary');"/> <span id="erradultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span><span id="errInvalidadultBenefitiaryHKId${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
                            
                             <input type="hidden" name="totalChildTraveller"
                                id="totalCountOfChild"
                                value="${corrAnnualTravelQuote.totalChildTraveller}">
                            <c:forEach var="inx" begin="1"
                                end="${corrAnnualTravelQuote.totalChildTraveller}">
                                
                                <div class="form-wrap">
                                <div class="personaltraveller" style="border: none;">
                                    <h4 class="bold" style="padding-left:0px !important;color:#ccc;">
                                        <fmt:message key="annual.details.insured.child" bundle="${msg}" />
                                        <c:out value="${inx}"></c:out>
                                    </h4>
                                    <div>
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.fullname" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input type="text"
                                                        name="childName" id="txtChldFullName${inx}"
                                                        class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder"
                                                        value="<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />"
                                                        onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />');" 
                                                        onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.name.placeholder" bundle="${msg}" />'); validateName('txtChldFullName${inx}','errtxtChldFullName${inx}',false,'insured');"
                                                        onkeypress="    return alphaOnly(event);" maxlength="100" autocomplete="off" />
                                                    <span id="errtxtChldFullName${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <div class="bmg-label-styled-select styled-select">
                                                  <select id="selectedChldHkidPass${inx}" class="form-control soflow select-label" name="selectedChldHkidPass" onchange="togglePlaceholder(this,'txtChldInsuHkid${inx}','<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />');">
                                                      <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.hkid.option1" bundle="${msg}" /></option>
                                                      <option value="passport"><fmt:message key="travel.details.insured.hkid.option2" bundle="${msg}" /></option>
                                                  </select>
                                              </div>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input
                                                    id="txtChldInsuHkid${inx}" name="childHKID"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder"
                                                    value="<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />');" 
                                                    onblur="placeholderOnBlur(this,'<fmt:message key="annual.details.insured.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtChldInsuHkid${inx}','selectedChldHkidPass${inx}','errtxtChldInsuHkid${inx}',false,'insured');"/> <span id="errtxtChldInsuHkid${inx}"
                                                    class="text-red"> </span><span
                                                    id="errtxtChldInvalidInsuHkid${inx}" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- age start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.birthday" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="input-group date annual_child_dob" id="input_child_dob${inx}"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
			                                       <input name="childDob" type="text"  class="pointer datepicker form-control border-radius" id="childDob${inx}" value="" readonly>
			                                   </div>
			                                   <span id="errtxtChldDob${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- age end -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"><fmt:message key="annual.details.insured.beneficiary" bundle="${msg}" /></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                   <select
                                                        id="childselectBenificiary${inx}" name="childBeneficiary"
                                                        onchange="activeDiv('childbenificiaryId${inx}','childselectBenificiary${inx}', 'childBenefitiaryName${inx}', 'txtchildInsuHkid${inx}')"
                                                        class="form-control soflow select-label">
                                                        <c:forEach var="relationshipCodeList" items="${mapRelationshipCode}">
                                                        <enhance:out escapeXml="false">
                                                            <option value="${relationshipCodeList.key}"><c:out
                                                                    value="${relationshipCodeList.value}" /></option>
                                                        </enhance:out>
                                                        </c:forEach>
                                                    </select>
                                               </div>
                                               <span id="errselectChildbenificiary${inx}" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="childbenificiaryId${inx}">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                        <fmt:message key="annual.details.insured.fullname" bundle="${msg}" />
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text"
                                                       name="childBenificiaryFullName"
                                                       id="childBenefitiaryName${inx}"
                                                       class="js-field-fullname form-control full-control textUpper bmg_custom_placeholder" 
                                                       value="<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />"
                                                       onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />');" 
                                                       onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.name.placeholder" bundle="${msg}" />'); validateName('childBenefitiaryName${inx}','errchildBenefitiaryName${inx}',false,'beneficiary');"
                                                       onkeypress="    return alphaOnly(event);" maxlength="100" autocomplete="off" />
                                                    <span id="errchildBenefitiaryName${inx}" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId end -->
                                       <!-- personalbenificiaryId c start -->
                                       <div class="form-group float hide" id="childbenificiaryId${inx}b">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                   <label class="field-label bold-500">
                                                       <fmt:message key="annual.details.type" bundle="${msg}" />
                                                   </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <div class="styled-select">
                                                       <select id="selectedChldBenefitiaryHkidPass${inx}" class="form-control soflow select-label" name="SelectedChldBenefitiaryHkidPass" onchange="togglePlaceholder(this,'txtchildInsuHkid${inx}','<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');">
                                                           <option value="HKID" selected="selected"><fmt:message key="travel.details.insured.beneficiary.hkid.option1" bundle="${msg}" /></option>
                                                           <option value="passport"><fmt:message key="travel.details.insured.beneficiary.hkid.option2" bundle="${msg}" /></option>
                                                       </select>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="form-group float hide" id="childbenificiaryId${inx}c">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                   <label class="field-label bold-500">
                                                   </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input
                                                    id="txtchildInsuHkid${inx}" name="childBenificiaryHkid"
                                                    class="js-field-hkid form-control textUpper full-control bmg_custom_placeholder" 
                                                    value="<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />" onkeypress=" return hkidOnkeypress(event);" 
                                                    onfocus="placeholderOnFocus(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />');" 
                                                  onblur="placeholderOnBlur(this,'<fmt:message key="travel.details.insured.beneficiary.hkid.placeholder" bundle="${msg}" />'); validateHkid('txtchildInsuHkid${inx}','selectedChldBenefitiaryHkidPass${inx}','errtxtchildInsuHkid${inx}',false,'beneficiary');"/> <span id="errtxtchildInsuHkid${inx}"
                                                    class="text-red"> </span><span id="errtxtInvalidchildInsuHkid${inx}"
                                                    class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    </div>
                                </div>
                                </div>
                            </c:forEach>
                            
                       <div class="clearfix"></div>
							
							<div class="form-wrap">
								<h4 class="h4-2 bmg-disclaimer-header"><fmt:message key="annual.details.declarations.heading" bundle="${msg}" /></h4>
								<div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
								<div class="checkbox">
									<input id="checkbox1" name="checkbox1" type="checkbox"> 
									<label for="checkbox1">
										<fmt:message key="annual.details.declarations.tnc" bundle="${msg}" /> 
										<ol class="ol-disclaimer">
											<li><fmt:message key="annual.details.declarations.tnc.desc1" bundle="${msg}" /></li>
											<li><fmt:message key="annual.details.declarations.tnc.desc2" bundle="${msg}" /></li>
											<li><fmt:message key="annual.details.declarations.tnc.desc3" bundle="${msg}" /></li>
											<li><fmt:message key="annual.details.declarations.tnc.desc4" bundle="${msg}" /></li>
											<li><fmt:message key="annual.details.declarations.tnc.desc5" bundle="${msg}" /></li>
										</ol>
									</label>
								</div>	
								<span id="chk1" class="text-red"></span>		
								<div class="checkbox">
									<input id="checkbox2" name="checkbox2" type="checkbox"> <label
										for="checkbox2">
										<fmt:message key="annual.details.declarations.PICS.part1" bundle="${msg}" /> <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										class="sub-link" target="_blank"><fmt:message key="annual.details.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="annual.details.declarations.PICS.part3" bundle="${msg}" />
										


										</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr/>
								<div>
									 <label>
 									<fmt:message key="annual.details.declarations.PDPO" bundle="${msg}" /> <br>
									</label>
								</div>
								 <div class="checkbox">
									<input id="checkbox3" name="checkbox3" type="checkbox"> <label

										for="checkbox3"> <fmt:message key="annual.details.declarations.PDPO.option1" bundle="${msg}" /><br>
										
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox4" name="checkbox4" type="checkbox"> <label
										for="checkbox4">
                                        <fmt:message key="annual.details.declarations.PDPO.option2" bundle="${msg}" /><br>
                                    </label>
                                </div>
                                
                                <div class="checkboxBubble">
                                    <fmt:message key="annual.details.declarations.PDPO.warning" bundle="${msg}" />
                                </div>

                                <script type="text/javascript">
                                function showBubble(){
                                    if($("#checkbox3").prop('checked') || $("#checkbox4").prop("checked")) {
                                        $(".checkboxBubble").fadeIn();
                                    }else{
                                        $(".checkboxBubble").fadeOut();
                                    }
                                }
                                
                                $("#checkbox3").change(function() {
                                    showBubble();
                                });
                                
                                $("#checkbox4").change(function() {
                                    showBubble();
                                });
                                </script>

                            </div>
                            </div>
                        <%
                            if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession()
                                    .getAttribute("authenticate").toString())) {
                        %>
                        <input type="hidden" id="isLogin" value="false">
                        <%
                            }
                            else
                            {
                        %>
                            <input type="hidden" id="isLogin" value="true">
                        <%
                            }
                        %>
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
                    


                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox">

                        <div class="hidden-sm hidden-xs">

                            <div class="wd2">                                
                                <div class="pull-left" style="width:145px;">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;"><fmt:message key="annual.title.travelcare" bundle="${msg}" /></h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"><fmt:message key="annual.title.annualtravel" bundle="${msg}" /></h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="annual.common.plan" bundle="${msg}" /> ${planName }</h4>
                                    <input type="hidden" name="selectedPlanName" value="${planName }">
                                </div>
                                <div class="pull-right" style="padding-top: 80px;">
                                    <div class="text-left pad-right1 h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
                                        <div class="hk" style="font-size: 18px;text-align: right;">
                                            <fmt:message key="annual.common.dollar" bundle="${msg}" />
                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;">${planPremium}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div class="form-container" style="padding: 0px !important;">
                                <div style="width: 80%;margin-left: 10%;">
                                <h3 class="txt-bold">
                                    <fmt:message key="annual.quote.care.starting" bundle="${msg}" /> 
                                </h3>
                                <h4> 
                                <div class="input-group date"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                    <input name="trLeavingDate" type="text" class="datepicker form-control border-radius" id="txtStartDateDesk" value="${corrAnnualTravelQuote.trLeavingDate}" readonly>
                                </div>
                             </h4>
                                <input type="hidden" name="departureDate" id="departureDate"
                                    value="01-01-2015">

                                <h3 class="txt-bold">
                                    <fmt:message key="annual.quote.care.ending" bundle="${msg}" /> 
                                </h3>
                                <h4>
                                <div class="input-group date"> <span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
                                    <input name="trBackDate" type="text" class="datepicker form-control border-radius" id="txtEndDateDesk" value="${corrAnnualTravelQuote.trBackDate}" readonly>
                                </div>
                                
                                </h4>
                                <input type="hidden" name="backDate" id="backDate"
                                    value="29-08-2015">

                                <div>
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
                                        <h3><fmt:message key="annual.quote.care.numberoftraveller" bundle="${msg}" /></h3>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-none">
                                        <h3 style="text-align: right;font-weight: normal;">
                                            <c:if test="${corrAnnualTravelQuote.totalPersonalTraveller>0}">${corrAnnualTravelQuote.totalPersonalTraveller} <fmt:message key="annual.quote.care.traveller" bundle="${msg}" /></c:if>
                                            <c:if test="${corrAnnualTravelQuote.totalAdultTraveller>0}">${corrAnnualTravelQuote.totalAdultTraveller} <fmt:message key="annual.quote.care.adult" bundle="${msg}" /><br/></c:if>
                                            <c:if test="${corrAnnualTravelQuote.totalChildTraveller>0}">${corrAnnualTravelQuote.totalChildTraveller} <fmt:message key="annual.quote.care.child" bundle="${msg}" /></c:if>
                                        </h3>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <input type="hidden" name="planSelected" value="${corrAnnualTravelQuote.planSelected}">
                               </div>
            </div>
            <div class="orange-bdr"></div>
                <div style="width: 80%;margin-left: 10%;">
                    <c:if test="${referralCode!=''}">
                        <h3 style="margin-bottom:0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h3>
                        <h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">${referralCode}</h4>
                    </c:if>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.subtotal" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planPremium}</h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.discount" bundle="${msg}" /> </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planDiscount} </h3>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <div class="orange-bdr"></div>
                <div style="width: 80%;margin-left: 10%;">
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="annual.quote.care.amountdue" bundle="${msg}" />  </h3>
                    <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planSummary}</h3>
                    <input type="hidden" name="finalDueAmount" value="${planSummary}">
                    <input type="hidden" name="finalOriginalAmount" value="${planPremium}">
                    <div class="clearfix"></div>
                </div>
                
                <div style="width: 80%;margin-left: 10%;">
                    <div class="top35 pull-left pad-none" style="width:47%">
                         <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /> </a>
                    </div>
                    <div class="top35 pull-right pad-none" style="width:47%"> 
                        <c:choose>
                            <c:when test="${language=='en'}">
                                <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                            </c:when>
                            <c:otherwise>
                                <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="clearfix"></div>
                </div>
<div class="clearfix"></div>
<br>
</div>
</div>
<div class="clearfix"></div>
</div>

<!-- 
<div class="col-xs-12 hidden-md hidden-lg pad-none">
     <div style="width: 80%;margin-left: 10%;">
         <hr/>
     </div>
</div>
 -->

<p class="padding1 workingholiday-plan-disclaimer">
	<fmt:message key="annual.quote.disclaimer1" bundle="${msg}" />
	<br>
	<fmt:message key="annual.quote.disclaimer2" bundle="${msg}" />
</p>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
        <div class="top35 pull-left pad-none" style="width:47%">
            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /></a>
        </div>
        <div class="top35 pull-right pad-none" style="width:47%">
			<c:choose>
				<c:when test="${language=='en'}">
	       			<input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 EN','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
	        	</c:when>
	        	<c:otherwise>
	       			<input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Travel_Step2 ZH','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
	       		</c:otherwise>
			</c:choose>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

</form:form>
</div>
<!--/.row-->
</div>
<!--/.container-->

</section>

<!--Plan-login-popup-->
<!--Get promotion code popup-->
 <div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;">
      <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
          <div class="login-form">
            <div class="form-container">
              <h2><fmt:message key="promotion.get.code" bundle="${msg}" /></h2>
              <h4><fmt:message key="promotion.get.code.email" bundle="${msg}" /> </h4>
              <div class="form-group">
                <input type="email" class="form-control" placeholder="" id="txtPromoEmail">
              </div>
              <span id="errPromoEmail" class="text-red"></span>
               <br>
              
              <div class="row"> 
               <div class="col-lg-6 col-md-6">
                  <a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="return get_promo_val()"><fmt:message key="promotion.get.code.action" bundle="${msg}" /></a> 
               </div>
               <div class="col-md-2">
               <br>
               </div>
               <div class="col-lg-4 col-md-4">
               <!--     <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
               </div>
               <br>
               <br>
               <div class="col-md-12">
                  <p><fmt:message key="promotion.get.code.disclaimer" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    
<!--/ Get promotion code popup-->

<div class="scroll-to-top">
    <a title="Scroll to top" href="#">
        <img src="<%=request.getContextPath()%>/resources/images/up-arrow.png" alt="Scroll to top"  />
    </a>
</div>

<script>
    function activeDiv(id, selected, beneFullName, beneHkId) {
        var selectedValue = $('#' + selected).val();
        if (id.indexOf('personal') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('adult') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('child') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
        if (id.indexOf('other') > -1) {
            activeDeactive(selectedValue, id, beneFullName, beneHkId);
        }
    }
    function activeDeactive(selectedValue, id, beneFullName, beneHkId) {
        if (selectedValue == "SE") {
        	$('#' + beneFullName).text('');
            $('#' + beneHkId).text('');
            $('#' + beneFullName).val('');
            $('#' + beneHkId).val('');
            
            $('#' + id).addClass('hide');
            $('#' + id + 'b').addClass('hide');
            $('#' + id + 'c').addClass('hide');
            
        } else {
            $('#' + id).removeClass('hide');
            $('#' + id + 'b').removeClass('hide');
            $('#' + id + 'c').removeClass('hide');
            
        }
    }

    function selected(id){
        $('#selectedAdHkidPass1').val(id.value);
        $('#selectedPersonalHkidPass1').val(id.value);
    }
</script>

<script>

/* UserLogin ajax function */
function userLoginFnc() {

    $('#ajax-loading').show();
    console.log($("#popUploginform input").serialize());
    $.ajax({
        type : "POST",
        url : "<%=request.getContextPath()%>/userLogin",
        data : $("#popUploginform input").serialize(),
        async : false,
        success : function(data) {
            $('#ajax-loading').hide();
            if (data == 'success') {
            	window.location.reload();
            } else if (data == 'fail') {
            	console.log(data);
                $('#ajax-loading').hide();
                $('#login-err-msg').show();
                $('#login-err-msg').html(getBundle(getBundleLanguage, "member.login.fail.first"));
            }

        }
    });
    /* } */
    return false;
}
function BackMe() {
    window.history.back();
}
</script>
<script>
window.onload = function(){
	$('select[id^="personalselectBenificiary"]').each(function(i) {
		var index = i + 1;
		activeDiv('personalbenificiaryId' + index,'personalselectBenificiary' + index, 'personalBenefitiaryId' + index, 'personalBenefitiaryHKId' + index);
	});
};
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/annual-travel.js"></script>
