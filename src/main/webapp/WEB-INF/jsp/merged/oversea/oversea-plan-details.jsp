<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
    String authenticate = "false";
    if (request.getSession().getAttribute("authenticate") != null) {
        authenticate = request.getSession()
                .getAttribute("authenticate").toString();
    }
%>

<script type='text/javascript'>
var getBundleLanguage = "";
var lang = UILANGUAGE;
var contextPath = '<%=request.getContextPath()%>';
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
var namePlaceholder="SAME AS ID DOCUMENT";
var hkidPlaceholder="EG: X1234567 WITHOUT ()";
var insureNamePlaceholder="";
var insureHkidPlaceholder="HKID/PASSPORT NO.";
var benNamePlaceholder="SAME AS ID DOCUMENT";
var benHkidPlaceholder="EG: X1234567 WITHOUT ()";

<% if (authenticate.equals("false") || authenticate.equals("direct")) { %>
function activateUserAccountJoinUs() {
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    setTimeout(function(){
        name = $("#Username").val();
        password = $("#Password").val();
        password2 = $("#Confirm-Password").val();
        
        $("#UsernameError").text("");
        $("#PasswordError").text("");
        $("#Confirm-PasswordError").text("");
        $("#Username").removeClass("invalid-field");
        $("#Password").removeClass("invalid-field");
        $("#Confirm-Password").removeClass("invalid-field");
        
        //first error element
        var firstErrorElementId="";
        if(name == "" && password == "" && password2 == ""){
            $('#frmYourDetails').submit();
        }else{
            if(name != "" && password != "" && password2 != ""){
                $('#chk1').html('');
                $('#chk2').html('');
                
                $('#dobInvalid').html('');
                
                validateForm = true;
                if (!checkMembership("Username")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Username";
                    }
                    validateForm = false;   
                }
                if (!checkMembership("Password")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Password";
                    }
                    validateForm = false;   
                }
                if (!checkMembership("Confirm-Password")){
                    if(firstErrorElementId==""){
                        firstErrorElementId="Confirm-Password";
                    }
                    validateForm = false;   
                }
                var applicantDob = $("#applicantDob").val();
                if (applicantDob.trim() == "") {
                    
                    document.getElementById("dobInvalid").innerHTML = getBundle(getBundleLanguage, "applicant.dob.notNull.message");
                    $("#input_dob").addClass("invalid-field");
                    if(firstErrorElementId==""){
                        firstErrorElementId="applicantDob";
                    }
                    validateForm = false;   
                
                }
                if (!validateMobile('inputMobileNo','mobileNoInvalid')){
                    if(firstErrorElementId==""){
                        firstErrorElementId="inputMobileNo";
                    }
                    validateForm = false;   
                }           
                if (!validateEmail('inputEmailId','emailid')){
                    if(firstErrorElementId==""){
                        firstErrorElementId="inputEmailId";
                    }
                    validateForm = false;   
                }    
                
                
                if(firstErrorElementId!=""){
                    scrollToElement(firstErrorElementId);
                }
                
                if (!validateForm){
                    $('#loading-overlay').modal('hide');
                    return;
                }           
    
                optIn1 = "false"
                optIn2 = "false"
                if($('#checkbox4').is(':checked')){
                    optIn2 = "true";    
                }
                if($('#checkbox3').is(':checked')){
                    optIn1 = "true";    
                }
                password = document.getElementById("Password").value; 
                mobile = document.getElementById("inputMobileNo").value;
                name = document.getElementById("inputFullName").value;
                userName = document.getElementById("Username").value;
                email = document.getElementById("inputEmailId").value;
    
               $.ajax({
                           type : 'POST',
                            url : '<%=request.getContextPath()%>/${language}/joinus',
                            data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
                            async : false,
                            success : function(data) {
                                
                                if (data == 'success') {
                                    
                                    $(".membership-wrap").css("display", "none"); 
                                    document.getElementById("Username").value = "";
                                    document.getElementById("Password").value = "";
                                    document.getElementById("Confirm-Password").value = "";
                                    
                                    $("#link-error").click();
                                    perventRedirect=false;
                                     $('#frmYourDetails').submit();
                                    return;                            
                                } else {
                                    console.log(data);
                                    $('#loading-overlay').modal('hide');
                                    $("#link-error").click();
                                    $(".error-hide").css("display", "block");
                                    $('#loading-overlay').modal('hide');
                                    if (data == 'This username already in use, please try again') {
                                        $('.error-hide').html('<fmt:message key="member.registration.fail.username.registered" bundle="${msg}" />');
                                    } else if (data == 'email address and mobile no. already registered') {
                                        $('.error-hide').html('<fmt:message key="member.registration.fail.emailMobile.registered" bundle="${msg}" />');
                                    } else {
                                        $('.error-hide').html(data);
                                    }
                                    return;
                                } 
                            },
                            error : function(xhr, status, error) {
                                $('#loading-overlay').modal('hide');
                            }
                        });
            }else{
                // not all the fields filled
                if (name == ""){
                    $('#UsernameError').text(isValidUsername($("#Username").val().trim()));
                    $("#Username").addClass("invalid-field");
                    if(firstErrorElementId==""){
                        firstErrorElementId="Username";
                    } 
                }else{
                    if (!checkMembership("Username")){
                        if(firstErrorElementId==""){
                            firstErrorElementId="Username";
                        } 
                    }
                }
                if (password == ""){
                    $('#PasswordError').text(isValidPassword($("#Password").val().trim()));
                    $("#Password").addClass("invalid-field");
                    if(firstErrorElementId==""){
                        firstErrorElementId="Password";
                    } 
                }else{
                    if (!checkMembership("Password")){
                        if(firstErrorElementId==""){
                            firstErrorElementId="Password";
                        } 
                    }
                }
                if (password2 == ""){
                    $('#Confirm-PasswordError').text(passMatch($('#Password').val(), $("#Confirm-Password").val().trim()));
                    $("#Confirm-Password").addClass("invalid-field");
                    if(firstErrorElementId==""){
                        firstErrorElementId="Confirm-Password";
                    } 
                }else{
                    if (!checkMembership("Confirm-Password")){
                        if(firstErrorElementId==""){
                            firstErrorElementId="Confirm-Password";
                        } 
                    }
                }
            }
        }
        if(firstErrorElementId!=""){
            $('#loading-overlay').modal('hide');
            scrollToElement(firstErrorElementId);
        }
        
        return;
    }, 500);
}
<% }else{ %>
function activateUserAccountJoinUs() {
    perventRedirect=false;
    $('#loading-overlay').modal({backdrop: 'static',keyboard: false});
    
    setTimeout(function(){
        $('#frmYourDetails').submit();
    }, 500);
}
<% } %> 

/* For Benefitiary Div active and Inactive */
function activeDiv(id, selected) {
    var selectedValue = $('#' + selected).val();
    activeDeactive(selectedValue, id);
}

function activeDeactive(selectedValue, id) {
    if (selectedValue == "" || selectedValue == "SE") {
        $('#' + id).addClass('hide');
        $('#' + id + 'b').addClass('hide');
        $('#' + id + 'c').addClass('hide');
    } else {
        $('#' + id).removeClass('hide');
        $('#' + id + 'b').removeClass('hide');
        $('#' + id + 'c').removeClass('hide');
    }
}
/* END- For Benefitiary Dive active and Inactive */

function setDropArea(id) {
    $('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
    
    if ($("#selectCADistHid option[value='"+id+"']").text() == "HK")
        document.getElementById("correspondenceAddressDistrictId1").checked = true;
    else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
        document.getElementById("correspondenceAddressDistrictId2").checked = true;
    else
        document.getElementById("correspondenceAddressDistrictId3").checked = true;
    /* if(id != '') {
        $("#errCADist").html('');
        $('#applicantDistrict').removeClass('invalid-field');
    } */
}

</script>

<section class="product_header_path_container ">
    <div class="container">
        <div class="product_header_path_item back"><i class="fa fa-arrow-left"></i><div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs">Plan Options</div>
        <div class="product_header_path_item active">Application</div>
        <div class="product_header_path_item hidden-sm hidden-xs">Payment<div class="partition"></div></div>
        <div class="product_header_path_item hidden-sm hidden-xs">Confirmation</div>
    </div>
</section>
<section>
    <div id="cn" class="container">
        <div class="row">
            <form:form id="frmYourDetails" name="frmYourDetails" onsubmit="return validateOverseaDetails(this,'frmYourDetails','${language}');" modelAttribute="frmYourDetails" method="post" action="">
                <ol class="breadcrumb pad-none">
                  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer1'>Home</key></a> <i class="fa fa-caret-right"></i></li>
                  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer2'>Protect</key></a></li> <i class="fa fa-caret-right"></i></li>
                  <li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer3'>Overseas StudyCare Insurance</key></a></li>
                  <li class="active "><i class="fa fa-caret-right"></i><key id='Overseas.Landing.Breadcrumb.step3'>Application</key></li>
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
                        <br>
                        <!-- <div class="gray-bdr"></div> -->
                        <!-- updated responsive design start -->
                        <div class="form-wrap">
                            <div class="big-title black-bold pad-none section-title">
                                <key id='Overseas.userdetails.info'>Applicant info</key>
                            </div>
                            <div class="form-group float">
                                <span id="errorMsg"  class="text-red">${errormsg}</span>
                            </div>
                            <!-- english name start -->
                           <div class="form-group float">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputFullName" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Fullname'>Full name</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="fullName" class="form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>" id="inputFullName" 
                                   <c:choose>
                                       <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
                                       value="${userDetails.fullName }" readonly="readonly"
                                       </c:when>
                                       <c:otherwise>
                                       value="SAME AS ID DOCUMENT"
                                       </c:otherwise>
                                   </c:choose>
                                   onfocus="placeholderOnFocus(this,'SAME AS ID DOCUMENT');" onblur="placeholderOnBlur(this,'SAME AS ID DOCUMENT'); validateName('inputFullName','fullnameinvalid',true,'applicant');" onkeypress="return alphaOnly(event);" maxlength="50">
                                   <span id="fullnameinvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- english name end -->
                           <!-- id card starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                <label class="field-label bold-500">
                                    <key id='Overseas.userdetails.applicant.HKID'>HKID</key>
                                    <input type="hidden" name="selectedHkidPassApplicant" id="selectHkidPass" value="HKID">
                                </label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input type="text" name="hkid" class="form-control numberinput textUpper full-control bmg_custom_placeholder" id="inputTxtAppHkid" onkeypress=" return hkidOnkeypress(event);" value="EG: X1234567 WITHOUT ()" onfocus="placeholderOnFocus(this,'EG: X1234567 WITHOUT ()');" onblur="placeholderOnBlur(this,'EG: X1234567 WITHOUT ()'); validateHkid('inputTxtAppHkid','selectHkidPass','errAppHkid',true,'applicant');"> <!-- <key id='Overseas.userdetails.applicant.HKID.eg'>EG: X1234567 WITHOUT ()</key> -->
                                       <span id="errAppHkid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- id card ends -->
                           <!-- birthday starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputApplicantDob" class="field-label bold-500"><key id='Overseas.userdetails.applicant.DOB'>Date of birth</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="input-group date" id="input_oversea_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                        <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" placeholder="DD-MM-YYYY" id="applicantDob" value="" readonly>
                                    </div>
                                    <span id="dobInvalid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- birthday ends -->
                           <!-- mobile starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputMobileNo" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Mobile'>Mobile no.</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input name="mobileNo" type="tel" class="form-control full-control"
                                        value="${userDetails.mobileNo.trim()}"
                                       <c:choose>
                                           <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
                                            readonly="readonly"
                                           </c:when>
                                       </c:choose>
                                        id="inputMobileNo" onkeypress="return isNumeric(event)" onblur="replaceNumeric(this); validateMobile('inputMobileNo','errMobileNo');" maxlength="8">  <!-- <key id='Overseas.userdetails.applicant.Mobile.number'>Mobile no.</key> -->
                                    <span id="errMobileNo" class="text-red">
                                    </span>
                               </div>
                           </div>
                           <!-- mobile ends -->
                           <!-- email address starts -->
                           <div class="form-group float">
                               <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                   <label for="inputEmailId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Email'>Email address</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                   <input class="form-control full-control textLower" name="emailAddress" type="email" 
                                       value="${userDetails.emailAddress.trim()}"
                                       <c:choose>
                                           <c:when test="${userDetails != null && userDetails.userName != '' && userDetails.userName != '*DIRECTGI'}">
                                            readonly="readonly"
                                           </c:when>
                                       </c:choose>
                                       id="inputEmailId" maxlength="50" onblur="validateEmail('inputEmailId','emailid');">
                                   <span id="emailid" class="text-red"></span>
                               </div>
                           </div>
                           <!-- email address ends -->
                           <!-- relationship start -->
                              <div class="form-group float">
                                  <div
                                      class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                      <label class="field-label bold-500"><key
                                              id='Overseas.userdetails.applicant.Relationship'>Relationship<br/>
                                          with insured person</key></label>
                                  </div>
                                  <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                      <div class="styled-select">
                                          <select name="applicantRelationship" id="applicantRelationship"
                                              onchange="checkInsuredPerson(this.value)"
                                              class="form-control soflow select-label">
                                              <option value="SE"><key
                                                      id='Overseas.userdetails.applicant.Relationship.Option1'>Self</key></option>
                                              <option value="CH"><key
                                                      id='Overseas.userdetails.applicant.Relationship.Option2'>Children</key></option>
                                              <option value="LG"><key
                                                      id='Overseas.userdetails.applicant.Relationship.Option3'>Legal
                                                  guardian</key></option>
                                          </select>
                                      </div>
                                      <span id="errapplicantRelationship" class="text-red"></span>
                                  </div>
                              </div>
                          <!-- relationship end -->                               
                         </div>
                         <!-- updated responsive design end -->
                         <div class="clearfix"></div>
                        <div class="form-wrap">
                        <!-- correspondence address -->
                            <div class="big-title black-bold pad-none ">
                                <key id='Overseas.userdetails.applicant.Correspondence'>Correspondence address</key>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputRoomId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.ROOM'>ROOM</key></label>
                                    /
                                    <label for="inputFloorId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.FLOOR'>FLOOR</key></label>
                                    /
                                    <label for="inputBlockId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.BLOCK'>BLOCK</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 pad-none">
                                        <input class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressRoom" size=10 type="text" value="" placeholder="ROOM" id="correspondenceAddressRoomId" maxlength="50" placeholder="ROOM" onfocus="placeholderOnFocus(this,'ROOM');" onblur="placeholderOnBlur(this,'Room');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 floor-block-pad-right-none">
                                        <input class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressFloor" size=1 type="text" value="" placeholder="FLOOR" id="correspondenceAddressFloorId" maxlength="50" placeholder="FLOOR" onfocus="placeholderOnFocus(this,'FLOOR');" onblur="placeholderOnBlur(this,'Floor');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                    <div class="col-sm-4 col-xs-4 col-lg-4 col-md-4 floor-block-pad-right-none">
                                        <input class="col-lg-12 col-md-12 col-xs-12 col-sm-12 form-control full-control textUpper bmg_custom_placeholder" name="correspondenceAddressBlock" size=1 type="text" value="" placeholder="BLOCK" id="correspondenceAddressBlockId" maxlength="50" placeholder="BLOCK" onfocus="placeholderOnFocus(this,'BLOCK');" onblur="placeholderOnBlur(this,'Block');" onkeypress="return isAlphaNumeric(event);" ><span id="" class="text-red"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputBuildingId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.BUILDING'>BUILDING</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input class="form-control full-control textUpper" name="correspondenceAddressBuilding" type="text" value="" id="correspondenceAddressBuildingId" maxlength="50" placeholder="BUILDING"  onfocus="placeholderOnFocus(this,'BUILDING');" onblur="placeholderOnBlur(this,'BUILDING');validateCorrespondenceBorE();"><span id="" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputEstateId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.ESTATE'>ESTATE</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input class="form-control full-control textUpper" name="correspondenceAddressEstate" type="text" value="" id="correspondenceAddressEstateId" maxlength="50" placeholder="ESTATE" onfocus="placeholderOnFocus(this,'ESTATE');" onblur="placeholderOnBlur(this,'ESTATE');validateCorrespondenceBorE();"><span id="errorEmptyCorrespondenceAddressEstate" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputStreetNoId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.STREETNO'>Street No.</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input class="form-control full-control textUpper" name="correspondenceAddressStreetNo" type="text" value="" id="correspondenceAddressStreetNoId" maxlength="50" placeholder="STREET NO." onfocus="placeholderOnFocus(this,'STREET NO.');" onblur="placeholderOnBlur(this,'STREET NO.');"><span id="" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputStreetNameId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.STREETNAME'>STREET NAME</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <input class="form-control full-control textUpper" name="correspondenceAddressStreetName" type="text" value="" id="correspondenceAddressStreetNameId" maxlength="50" placeholder="STREET NAME" onfocus="placeholderOnFocus(this,'STREET NAME');" onblur="placeholderOnBlur(this,'STREET NAME');"><span id="" class="text-red"></span>
                                </div>
                            </div>
                            <div class="form-group float">
                                <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                    <label for="inputDistrictId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Correspondence.District'>District</key></label>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none district-btn-grp">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                                                                <input type="radio" name="districtSelected"
                                            name="correspondenceAddressDistrict" type="" value="HK"
                                            id="inlineCARadio3" onclick="" maxlength="50" onblur=""><span id="" class="text-red"></span>
                                        <label for="inputDistrictId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.HongKong'>HK</key></label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                        <input type="radio" name="districtSelected"
                                            name="correspondenceAddressDistrict" type="" value="KL"
                                            id="inlineCARadio4" onclick="" maxlength="50" onblur=""><span id="" class="text-red"></span>
                                        <label for="inputDistrictId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.Kowloon'>KLN</key></label>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none">
                                                                                <input type="radio" name="districtSelected"
                                            name="correspondenceAddressDistrict" type="" value="NT"
                                            onclick="" id="inlineCARadio5" maxlength="50" onblur=""><span id="" class="text-red"></span>
                                        <label for="inputDistrictId" class="field-label bold-500"><key id='Overseas.userdetails.applicant.NT'>N.T.</key></label>
                                    </div>
                                </div>                                                          
                                <div class="hidden">
                                    <select name="applicantDistrictHid"
                                        class="form-control soflow full-control" id="selectCADistHid">
                                        <option value=""></option>
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
                                </div>
                                <span id="errCADist" class="text-red"> </span>
                            </div>
                            <div class="form-group float">
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none pull-right">
                                    <div class="styled-select">
                                            <select name="applicantDistrict" id="applicantDistrict"
                                            onchange="activeDiv('personalbenificiaryId1','personalselectBenificiary1', 'personalBenefitiaryId1', 'personalBenefitiaryHKId1');setDropArea(this.value)"
                                            class="form-control soflow select-label">
                                            <option value=""><fmt:message
                                                    key="annual.details.address.district" bundle="${msg}" /></option>
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
                                    <span id="errpersonalselectBenificiary1" class="text-red"></span>
                                </div>                          
                            </div>
                                <div class="form-group float">
                                    <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none"></div>
                                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                    <span id="errorEmptycorrespondenceAddressDistrict" class="text-red"></span> 
                                </div>
                            <!-- correspondence address ends -->
                            </div>
                        </div>


                
                        
                        <div class="clearfix"></div>
                        <div class="form-wrap">
                            <div class="big-title black-bold section-title" style="padding-left:0px !important;">
                                <key id='Overseas.userdetails.Insured'>Insured person info</key>
                            </div>
                        </div>
                            <!-- Personal -->
                            <input type="hidden" name="totalPersonalTraveller" id="totalPersonalTraveller" value="1">
                            
                                <div class="form-wrap">
                                <!--<div class="personaltraveller">-->
                                    <!--<h4 class="bold big-title" style="padding-left:0px !important;">
                                        Traveller
                                        1
                                        (Same as Applicant)
                                    </h4>-->
                                    <!--<div>-->
                                        <!-- english name start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                <label class="field-label bold-500"><key id='Overseas.userdetails.Insured.Fullname'>Full name</key></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                  <input type="text" id="txtInsuFullName1" name="personalName" class="form-control full-control textUpper <c:if test="${!(userDetails != null && userDetails.fullName != '' && userDetails.fullName != '*DIRECTGI')}">bmg_custom_placeholder</c:if>"
                                                      <c:choose>
                                                          <c:when test="${userDetails != null && userDetails.fullName != '' && userDetails.userName != '*DIRECTGI'}">
                                                          value="${userDetails.fullName }" readonly="readonly"
                                                          </c:when>
                                                          <c:otherwise>
                                                          value=""
                                                          </c:otherwise>
                                                      </c:choose>
                                                      onfocus="placeholderOnFocus(this,'');" onblur="placeholderOnBlur(this,''); validateName('txtInsuFullName1','errtxtPersonalFullName1',false,'insured');" onkeypress="return alphaOnly(event);" maxlength="100" readonly="readonly">
                                                 <span id="errtxtPersonalFullName1" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- english name end -->
                                       <!-- id card start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                                   <label class="field-label bold-500"><key id='Overseas.userdetails.Insured.HKID'>HKID</key></label>
                                                   <input id="selectedPersonalHkidPass1" name="selectedPersonalHkidPass" value="HKID" type="hidden">
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <input id="txtInsuHkid1" name="personalHKID" class="form-control textUpper full-control bmg_custom_placeholder" value="EG: X1234567 WITHOUT ()" placholder="EG: X1234567 WITHOUT ()" onkeypress=" return hkidOnkeypress(event);" onfocus="placeholderOnFocus(this,'EG: X1234567 WITHOUT ()');" onblur="placeholderOnBlur(this,'EG: X1234567 WITHOUT ()'); validateHkid('txtInsuHkid1','selectedPersonalHkidPass1','errtxtInsuHkid1',false,'insured');" readonly="readonly">  <!-- <key id='Overseas.userdetails.Insured.HKID.eg'>EG: X1234567 WITHOUT ()</key> --> 
                                                    <span id="errtxtInsuHkid1" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- id card end -->
                                       <!-- birthday starts -->
                                       <div class="form-group float">
                                           <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label for="inputApplicantDob" class="field-label bold-500"><key id='Overseas.userdetails.Insured.DOB'>Date of birth</key></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                                <div class="input-group date" id="oversea_insure_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                                    <input name="insuredDob" type="text" class="pointer datepicker form-control border-radius" id="insuredDob" onfocus="placeholderOnFocus(this,'DD-MM-YYYY');" onblur="placeholderOnBlur(this,'DD-MM-YYYY');" placeholder="DD-MM-YYYY" value="" readonly>
                                                </div>
                                                <div id="lock_datepicker" style="cursor: not-allowed;background-color: #eee;position:absolute;width:100%;height:100%;left:0px;top:0px;background:#fff;opacity:0;filter:alpha(opacity=0)">&nbsp;</div>
                                                <span id="dobInsuredInvalid" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- birthday ends -->
                                       <!-- beneficiary start -->
                                       <div class="form-group float">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500">Beneficiary</label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="styled-select">
                                                     <!-- <select name="personalBeneficiary" id="personalselectBenificiary1" onchange="activeDiv('personalbenificiary','personalselectBenificiary1', 'personalBenefitiaryId1', 'personalBenefitiaryHKId1')" class="form-control soflow select-label">
                                                            <option value="SE"><key id='Overseas.userdetails.Bene.Option1'>Own estate</key></option>
                                                            <option value="CH"><key id='Overseas.userdetails.Bene.Option2'>Child</key></option>
                                                            <option value="FM"><key id='Overseas.userdetails.Bene.Option3'>Fiance</key></option>
                                                            <option value="FF"><key id='Overseas.userdetails.Bene.Option4'>Fiancee</key></option>
                                                            <option value="GC"><key id='Overseas.userdetails.Bene.Option5'>Grand Parent &amp; Grand Child</key></option>
                                                            <option value="PA"><key id='Overseas.userdetails.Bene.Option6'>Parent</key></option>
                                                            <option value="SL"><key id='Overseas.userdetails.Bene.Option7'>Sibling</key></option>
                                                            <option value="SP"><key id='Overseas.userdetails.Bene.Option8'>Spouse</key></option>
                                                    </select> -->
                                                   <select name="personalBeneficiary" id="personalselectBenificiary"
                                                        onChange="activeDiv('personalbenificiary','personalselectBenificiary')"
                                                        class="form-control soflow select-label">
                                                        <c:forEach var="relationshipList" items="${mapRelationshipCode}">
                                                            <enhance:out escapeXml="false">
                                                                <option value="${relationshipList.key}">
                                                                    <c:out value="${relationshipList.value}" />
                                                                </option>
                                                            </enhance:out>
                                                        </c:forEach>
                                                    </select> 
                                               </div>
                                               <span id="errpersonalselectBenificiary" class="text-red"></span>
                                           </div>
                                       </div>
                                       <!-- beneficiary end -->
                                       <!-- personalbenificiaryId start -->
                                       <div class="form-group float hide" id="personalbenificiary">
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                               <label class="field-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                               <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">                                                    
                                                    <label class="field-label bold-500">
                                                      Full name
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                   <input type="text" name="beneficiaryFullName" id="beneficiaryFullName" class="form-control full-control textUpper bmg_custom_placeholder" value="SAME AS ID DOCUMENT" onblur="validateName('beneficiaryFullName','errBeneficiaryFullName',false,'beneficiary');" onkeypress="    return alphaOnly(event);" maxlength="100"></input>
                                                    <span id="errBeneficiaryFullName" class="text-red"> </span>
                                               </div>
                                               <div class="clearfix"></div>
                                           </div>
                                       <!-- </div>
                                       personalbenificiaryId end
                                       personalbenificiaryId b start
                                       <div class="form-group float hide" id="personalbenificiaryId1b"> -->
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500">
                                                        <key id='Overseas.userdetails.Bene.HKID'>ID Type</key>
                                                    </label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <div class="styled-select">
                                                    <select id="beneficiaryIDType" class="form-control soflow select-label" name="beneficiaryIDType" onchange="togglePlaceholder(this,'beneficiaryID','EG: X1234567 WITHOUT ()');">
                                                            <option value="HKID" selected="selected"><key id='Overseas.userdetails.Bene.HKID'>HKID</key></option>
                                                            <option value="passport"><key id='Overseas.userdetails.Bene.Passport'>Passport no</key></option>
                                                    </select>
                                                    </div>
                                               </div>
                                           </div>
                                       <!-- </div>
                                       personalbenificiaryId b end
                                       personalbenificiaryId c start
                                       <div class="form-group float hide" id="personalbenificiaryId1c"> -->
                                           <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                              <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                           </div>
                                           <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                              <div class="form-label col-lg-5 col-md-5 col-sm-5 col-xs-5 pad-none">
                                                  <label class="field-label form-label bold-500 hidden-lg hidden-md"></label>
                                               </div>
                                               <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 pad-none">
                                                  <input id="beneficiaryID" name="beneficiaryID" class="form-control textUpper full-control bmg_custom_placeholder" value="EG: X1234567 WITHOUT ()" onkeypress=" return hkidOnkeypress(event);" onfocus="placeholderOnFocus(this,'EG: X1234567 WITHOUT ()');" onblur="placeholderOnBlur(this,'EG: X1234567 WITHOUT ()'); validateHkid('beneficiaryID','beneficiaryIDType','errBeneficiaryID',false,'beneficiary');"></input>
                                                  <span id="errBeneficiaryID" class="text-red"> </span>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- personalbenificiaryId c end -->
                                    <!--</div>-->
                                    <div class="clearfix"></div>
                                    
                                <!--</div>-->
                                <!-- End of traveler--> 
                                </div>

                                <!-- Oversea student information-->
                                <div class="form-wrap">
                                    <div class="big-title black-bold section-title" style="padding-left:0px !important;">
                                        Overseas Educational Institution Info
                                    </div>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="inputOverseasInsuredDob" class="field-label bold-500"><key id='Overseas.userdetails.institution.departure'>Departure Date</key></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <div class="input-group date" id="input_dob3"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
                                                <input name="inputOverseasInsuredDob" type="text" class="pointer datepicker form-control border-radius" id="inputOverseasInsuredDob" placeholder="DD-MM-YYYY" onfocus="placeholderOnFocus(this,'DD-MM-YYYY');" onblur="placeholderOnBlur(this,'DD-MM-YYYY');" value="" readonly="">
                                            </div>
                                            <span id="dobOverseasInsuredInvalid" class="text-red"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="countryOfInstitution" class="field-label bold-500"><key id='Overseas.userdetails.Instituation.Country'>Country of Institution</key></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input name="countryOfInstitution" type="" class="form-control full-control" placeholder="Country of Institution" value="" id="countryOfInstitution" onkeypress="" onfocus="placeholderOnFocus(this,'Country of Institution');" onblur="placeholderOnBlur(this,'Country of Institution');" maxlength="50">                                              
                                            <br>                                                
                                            <span id="countryOfInstitutionInvalid" class="text-red"></span>
                                        </div>
                                    </div>
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="nameOfInstitution" class="field-label bold-500"><key id='Overseas.userdetails.Instituation.Name'>Name of Institution</key></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input name="nameOfInstitution" type="" class="form-control full-control" placeholder="Name of Institution" value="" id="nameOfInstitution" onkeypress="" onfocus="placeholderOnFocus(this,'Name of Institution');" onblur="placeholderOnBlur(this,'Name of Institution');" maxlength="50"> 
                                            <span id="nameOfInstitutionInvalid" class="text-red"></span>
                                        </div>
                                    </div>


                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                            <label for="addressofInstitutionLine1" class="field-label bold-500"><key id='Overseas.userdetails.Instituation.Address'>Address</key></label>
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input name="addressofInstitutionLine1" type="text" class="form-control full-control" placeholder="Line 1" value="" id="addressofInstitutionLine1" onkeypress=""  onfocus="placeholderOnFocus(this,'Line 1');" onblur="placeholderOnBlur(this,'Line 1');validateaddressofInstitutionLine()" maxlength="50"> 
                                        </div>
                                    </div>
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input name="addressofInstitutionLine2" type="text" class="form-control full-control" placeholder="Line 2" value="" id="addressofInstitutionLine2" onkeypress="" onfocus="placeholderOnFocus(this,'Line 2');" onblur="placeholderOnBlur(this,'Line 2');validateaddressofInstitutionLine()" maxlength="50"> 
                                        </div>
                                    </div>
                                    <div class="form-group float">
                                        <div class="field-label form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                            <input name="addressofInstitutionLine3" type="text" class="form-control full-control" placeholder="Line 3" value="" id="addressofInstitutionLine3" onkeypress="" onfocus="placeholderOnFocus(this,'Line 3');" onblur="placeholderOnBlur(this,'Line 3');validateaddressofInstitutionLine()" maxlength="50"> 
                                            <span id="addressofInstitutionInvalid" class="text-red"></span> 
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <div class="checkbox margin-fix">
                                            <input id="visacheckbox" name="visacheckbox" type="checkbox">
                                            <label for="visacheckbox"><key id='Overseas.userdetails.TC.ValidVisa'>I have a valid Full-time Overseas Student Visa</key></label>
                                        </div>
                                        <span id="visacheckboxInvalid" class="text-red"></span> 
                                    </div>
                                </div>                            
                                <!-- End of Oversea student information-->
                            <!-- adult  -->
                            <input type="hidden" name="totalAdultTraveller" id="totalAdultTraveler" value="0">
                            <!-- child  -->
                            <input type="hidden" name="totalChildTraveller" id="totalCountOfChild" value="0">
                            <!--other traveller-->
                            <input type="hidden" name="totalOtherTraveller" id="totalCountOther" value="0">
                       <div class="clearfix"></div>
                            
                            <div class="form-wrap">
                                <h4 class="h4-2 bmg-disclaimer-header">Declaration:-</h4>
                                <div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
                                <div class="checkbox">
                                    <input id="checkbox1" name="checkbox1" type="checkbox"> 
                                    <label for="checkbox1">
                                        <key id='Overseas.userdetails.TC.TC'>I have read and understood the policy provisions and declare that:</key>
                                        <ol class="ol-disclaimer">
                                            <li>the particulars and statements given above are, to the best of my knowledge and belief, true and complete;</li>
                                            <li>to the best of my knowledge and belief no Insured Person is travelling contrary to the advice of any medical practitioner or for the purpose of obtaining medical treatment and I understand that treatment of any pre-existing, recurring or congenital medical conditions are not insured. I am not aware of any condition cause or circumstance that may necessitate the cancellation or curtailment of the journey as planned;</li>
                                            <li>this application shall be the basis of the contract between me and FWD General Insurance Company Limited;</li>
                                            <li>this Proposal Form is applied at HKSAR, in case of fraud or misrepresentation, the policy may be declared void;</li>
                                            <li>I have obtained the consent from the Insured Person(s) for passing the above information to FWD General Insurance Company Limited for the purpose of carrying out the TravelCare Insurance.</li>
                                        </ol>
                                        
                                    </label>
                                </div>  
                                <span id="chk1" class="text-red"></span>        
                                <div class="checkbox">
                                    <input id="checkbox2" name="checkbox2" type="checkbox"> <label for="checkbox2">
                                        <key id='Overseas.userdetails.TC.PICS'>I have read and understood <a href="http://www.fwd.com.hk/upload/en-US/GI_Personal%20Data%20Protection%20Policy%20and%20Practices.pdf" class="sub-link" target="_blank">Personal Information Collection Statement</a> and agree to be bound by the same.</key>
                                        


                                        </label>
                                </div>
                                <span id="chk2" class="text-red"></span>
                                <hr>
                                <div>
                                    <label>
                                    <key id='Overseas.userdetails.TC.DoNotWish'>If you do NOT wish FWD General Insurance Company Limited to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing, please tick the appropriate box(es) below:</key> <br>
                                    </label>
                                </div>
                                 <div class="checkbox">
                                    <input id="checkbox3" name="checkbox3" type="checkbox"> <label for="checkbox3"><key id='Overseas.userdetails.TC.DoNotSend'>Please do not send direct marketing information to me.</key><br>
                                        
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <input id="checkbox4" name="checkbox4" type="checkbox"> <label for="checkbox4">

                                        <key id='Overseas.userdetails.TC.DoNotProvide'>Please do not provide my personal data to other persons or companies for their use in direct marketing.</key><br>
                                        
                                    </label>
                                </div>
                                
                                <div class="checkboxBubble">
                                    You may not be able to receive our latest promotion and benefits!
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
                            
                            
                        <div class="gray-bg3-wid container membership-wrap" style="padding-top: 20px;padding-left:0px;padding-right:0px;">
                            <div class="form-wrap">
                            <div class="membership-header">
                                <h3 class="bmg-membership-header"><key id='Overseas.userdetails.Create'>Create FWD member account</key></h3>
                                <h5><key id='Overseas.userdetails.Create.Enjoy'>Enjoy year-round promotions and referral benefits</key></h5>
                                <i class="text-grey"><key id='Overseas.userdetails.Create.Leave'>Leave blank if you do not want to creat a member account</key></i>
                                <h3 id="error_hide" class="error-hide" style="display:none; color:red; font-size:15px;"></h3>                                
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label class="field-label bold-500"><key id='Overseas.userdetails.Create.Username'>Choose username</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="text" name="username" class="form-control full-control input-white" id="Username" onfocus="emptyMembershipError();" onkeypress="return validationUsername(event);"><span id="UsernameError" class="text-red"> </span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label class="field-label bold-500"><key id='Overseas.userdetails.Create.Password'>Choose password</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                   <input type="password" name="password" class="form-control full-control input-white" id="Password" autocomplete="off" onfocus="emptyMembershipError();"> <span id="PasswordError" class="text-red"> </span>
                               </div>
                            </div>
                            <div class="form-group float row">
                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                   <label class="field-label bold-500"><key id='Overseas.userdetails.Create.Confirm'>Confirm password</key></label>
                               </div>
                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                                  <input type="password" class="form-control full-control input-white" id="Confirm-Password" autocomplete="off" onfocus="emptyMembershipError();"> <span id="Confirm-PasswordError" class="text-red"> </span>
                               </div>
                            </div>
                            </div>
                        </div>
                        
                        <input type="hidden" id="isLogin" value="false">
                        <input type="hidden" id="totalTravellingDays" name="totalTravellingDays" value="9">
                        
                        <div class="form-wrap" style="margin-bottom: 10px;">
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf" target="_blank">Product Brochure   </a>
                        </h4>
                        <h4 class="h4-4 product_landing_download_button pull-left">
                            <i class="fa fa-download"></i> <a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf" target="_blank">Policy Provisions   </a>
                        </h4>
                        <div class="clearfix"></div>
                        </div>  
                        </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3 floatingbox" style="top: 0px;">
                        <div class="hidden-sm hidden-xs">
                            <div class="wd2">
                                <div class="pull-left" style="">
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-bottom:0px;">Overseas StudentCare Worldwide</h2>
                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;margin-top:0px;"></h2>
                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;">${planName }</h4>
                                    <input type="hidden" id="selectedPlanName" name="selectedPlanName" value="${planName }">
                                </div>
                                <div class="pull-right" style="">
                                    <div class="text-left h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
                                        <div class="hk" style="font-size: 18px;">
                                            HK$
                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;">${planPremium}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div style="width: 80%;margin-left: 10%;">
                                 <h3 style="margin-bottom:0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h3>
                                 <c:choose>
                                 <c:when test="${referralCode!=null && referralCode!=''}"><h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h4></c:when>
                                 <c:otherwise><h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">No Code used</h4></c:otherwise>
                                 </c:choose>
                                <!--<c:if test="${referralCode!=null && referralCode!=''}">
                                    <h3 style="margin-bottom:0px;"><fmt:message key="annual.details.promotioncode" bundle="${msg}" /></h3>
                                    <h4 class="pad-none" style="color:#999;font-size: 22px;margin-top: 0px;">${referralCode}</h4>
                                </c:if>-->
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;">Subtotal </h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planPremium} </h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;">Discount </h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planDiscount} </h3>
                            </div>
                            <div class="clearfix"></div>
                            <div class="orange-bdr"></div>
                            <div style="width: 80%;margin-left: 10%;">
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;">Amount due  </h3>
                                <h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;">${planSummary}</h3>
                                <input type="hidden" name="finalDueAmount" value="${planSummary}">
                                <input type="hidden" name="finalOriginalAmount" value="${planPremium}">
                            </div>
                            <div style="width: 80%;margin-left: 10%;">
                                <div class="top35 pull-left pad-none" style="width:47%">
                                     <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="annual.button.back" bundle="${msg}" /> </a>
                                </div>
                                <div class="top35 pull-right pad-none" style="width:47%"> 
                                    <!-- <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','305.00','','Regis_Travel_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" Next"> -->
                                    <c:choose>
                                        <c:when test="${language=='en'}">
                                            <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                                        </c:when>
                                        <c:otherwise>
                                            <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <br>
                        </div>
                    </div>
            
            <div class="clearfix"></div>
            </div>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
     <div style="width: 80%;margin-left: 10%;">
         <hr>
     </div>
</div>

<p class="padding1 workingholiday-plan-disclaimer"><br>
<key id='Overseas.userdetails.Disclaimer1'>The feature above are indicative only.</key><br>
<key id='Overseas.userdetails.Disclaimer2'>For a complete explanation of the terms and conditions, please contact your adviser or our customer service at 3123 3123 for more details.</key></p>

<div class="col-xs-12 hidden-md hidden-lg pad-none">
   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
        <div class="top35 pull-left pad-none" style="width:47%">
            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();">Back </a>
        </div>
        <div class="top35 pull-right pad-none" style="width:47%">
        <!-- <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','305.00','','Regis_Travel_Step2 EN','USD');$('#loading-overlay').modal({backdrop: 'static',keyboard: false});return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" Next"> -->
            <c:choose>
               <c:when test="${language=='en'}">
                   <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 EN','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
               </c:when>
               <c:otherwise>
                   <input type="button" onclick="javascript:kenshoo_conv('Registration_Step2','${planSummary}','','Regis_Oversea_Step2 ZH','USD');return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value=" <fmt:message key="annual.button.next" bundle="${msg}" />" />
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
<link href="<%=request.getContextPath()%>/resources/css/easy-autocomplete.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.easy-autocomplete.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>
