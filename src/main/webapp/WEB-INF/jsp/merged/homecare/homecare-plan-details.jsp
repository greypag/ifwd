<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%@page import="java.util.*"%>
<%
	String authenticate = "false";
	if (request.getSession().getAttribute("authenticate") != null) {
		authenticate = request.getSession()
				.getAttribute("authenticate").toString();
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>-->


<script>
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

var hkidPlaceholder="<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />";

var roomPlaceholder="<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />";
var floorPlaceholder="<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />";
var blockPlaceholder="<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />";
var buildingPlaceholder="<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />";
var estatePlaceholder="<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />";
var streetNoPlaceholder="<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />";
var streetNamePlaceholder="<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />";
</script>


<script>
	function setDropArea(id) {
		$("#inputCADistrict").removeClass("invalid-field");
		
		$('#errCADist').html('');
		if($('#selectCADist').val() == ''){
	    	$('#errCADist').html(getBundle(getBundleLanguage, "homecare.district.notNull.message"));
	    	$("#inputCADistrict").addClass("invalid-field");
	    }
		
		$('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
		
		/*if(selectedText.trim() == 'District'){
			$('#errCADist').html(getBundle(getBundleLanguage, "insured.address.netFloorArea.notNull.message"));
		}
		else*/ 
		
		if ($("#selectCADistHid option[value='"+id+"']").text() == "HK")
			document.getElementById("inlineCARadio3").checked = true;
		else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
			document.getElementById("inlineCARadio4").checked = true;
		else
			document.getElementById("inlineCARadio5").checked = true;
		
		
	}

	function setDropArea2(id2) {
		$("#inputADistrict").removeClass("invalid-field");
		
		$('#errADist').html('');
		if($('#selectADist').val() == ''){
	    	$('#errADist').html(getBundle(getBundleLanguage, "homecare.district.notNull.message"));
	    	$("#inputADistrict").addClass("invalid-field");
	    }
		
		$('#selectADistHid').find('option[value="' + id2 + '"]').attr('selected', 'selected');
		
		if ($("#selectADistHid option[value='"+id+"']").text() == "HK")
			document.getElementById("inlineDeskRadio31").checked = true;
		else if ($("#selectCADistHid option[value='"+id+"']").text() == "KL")
			document.getElementById("inlineDeskRadio41").checked = true;
		else
			document.getElementById("inlineDeskRadio51").checked = true;
	}
	
	$(function () {
		autofillFields(); //for the back button!
		
		$('.autofillForm input, .autofillForm select').on('change keyup',function(e){
				autofillFields();
		});
		
	});
	

	function autofillFields() {

		var chk = $('#checkbox3').val();

		//if (chk == "on") {
		if(document.getElementById("checkbox3").checked){
			var applicantRoom = $('#inputCARoom').val();
			var applicantFloor = $('#inputCAFloor').val();
			var applicantBlock = $('#inputCABlock').val();
			var applicantBuilding = $('#inputCABuilding').val();
			var applicantEstate = $('#inputCAEstate').val();
			var applicantStreetNo = $('#inputCAStreetNo').val();
			var applicantStreetName = $('#inputCAStreetName').val();
			var selectCADist = $('#selectCADist').val();
			
			if(applicantRoom==roomPlaceholder){
				applicantRoom='';
		    }else{
		    	$('#inputARoom').removeClass("bmg_custom_placeholder");
		    }
		    if(applicantFloor==floorPlaceholder){
		    	applicantFloor='';
		    }else{
                $('#inputAFloor').removeClass("bmg_custom_placeholder");
            }
		    if(applicantBlock==blockPlaceholder){
		    	applicantBlock='';
		    }else{
                $('#inputABlock').removeClass("bmg_custom_placeholder");
            }
		    if(applicantBuilding==buildingPlaceholder){
		    	applicantBuilding='';
		    }else{
                $('#inputABuilding').removeClass("bmg_custom_placeholder");
            }
		    if(applicantEstate==estatePlaceholder){
		    	applicantEstate='';
		    }else{
                $('#inputAEstate').removeClass("bmg_custom_placeholder");
            }
		    if(applicantStreetNo==streetNoPlaceholder){
		    	applicantStreetNo='';
		    }else{
                $('#inputAStreetNo').removeClass("bmg_custom_placeholder");
            }
		    if(applicantStreetName==streetNamePlaceholder){
		    	applicantStreetName='';
		    }else{
                $('#inputAStreetName').removeClass("bmg_custom_placeholder");
            }
		    
			/* var applicantAreaCode = $('#applicantArea').checked */

			//alert(applicantAreaCode);
			// Set Values
			$('#inputARoom').val(applicantRoom);
			$('#inputAFloor').val(applicantFloor);
			$('#inputABlock').val(applicantBlock);
			$('#inputABuilding').val(applicantBuilding);
			
// 			if(applicantBuilding.trim() != ''){
// 				$('#errABuilding').html('');
// 			}else{
// 				$('#errABuilding').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.building.notNull.message"));
// 			}
			
			$('#inputAEstate').val(applicantEstate);
			
// 			if(applicantEstate.trim() != ''){
// 				$('#errAEstate').html('');
// 			}else{
// 				$('#errAEstate').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.estate.notNull.message"));
// 			}
			
			$('#inputAStreetNo').val(applicantStreetNo);
			$('#inputAStreetName').val(applicantStreetName);

			$('#selectADist').val(selectCADist);
			
			$('#errAEstate').html('');
			$('#errABuilding').html('');
			$("#inputAEstate").removeClass("invalid-field");
			$("#inputABuilding").removeClass("invalid-field");
			
			$('#errADist').html('');
			$("#inputADistrict").removeClass("invalid-field");
			if($('#selectADist').val() == ''){
		    	$('#errADist').html(getBundle(getBundleLanguage, "homecare.district.notNull.message"));
		    	$("#inputADistrict").addClass("invalid-field");
		    }
			
			var element = document.getElementById('selectADist');
			element.value = selectCADist;
			//$('#selectADist').val('AD123');
			if (document.getElementById("inlineCARadio3").checked) {
				document.getElementById("inlineDeskRadio31").checked = true;
			} else if (document.getElementById("inlineCARadio4").checked) {
				document.getElementById("inlineDeskRadio41").checked = true;
			} else {
				document.getElementById("inlineDeskRadio51").checked = true;
			}

			/*if (document.getElementById('inputARoom').readOnly == true)
			{
	
			}
			else
			{	
				*/
			
			    document.getElementById('inputARoom').readOnly = true;
			    document.getElementById('inputAFloor').readOnly = true;
			    document.getElementById('inputABlock').readOnly = true;
			    document.getElementById('inputABuilding').readOnly = true;
			    document.getElementById('inputAEstate').readOnly = true;
			    document.getElementById('inputAStreetNo').readOnly = true;
			    document.getElementById('inputAStreetName').readOnly = true;
			    document.getElementById('selectADist').disabled = true;
			    document.getElementById('inlineDeskRadio31').disabled = true;
			    document.getElementById('inlineDeskRadio41').disabled = true;
			    document.getElementById('inlineDeskRadio51').disabled = true;
			//}
			
			
			
		} else {
					
			document.getElementById('inputARoom').readOnly = false;
			document.getElementById('inputAFloor').readOnly = false;
			document.getElementById('inputABlock').readOnly = false;
			document.getElementById('inputABuilding').readOnly = false;
			document.getElementById('inputAEstate').readOnly = false;
			document.getElementById('inputAStreetNo').readOnly = false;
			document.getElementById('inputAStreetName').readOnly = false;
			document.getElementById('selectADist').disabled = false;
			document.getElementById('inlineDeskRadio31').disabled = false;
			document.getElementById('inlineDeskRadio41').disabled = false;
			document.getElementById('inlineDeskRadio51').disabled = false;
			
			$('#inputARoom').val();
			$('#inputAFloor').val();
			$('#inputABlock').val();
			$('#inputABuilding').val();
			$('#inputAEstate').val();
			$('#inputAStreetNo').val();
			$('#inputAStreetName').val();
			$('#selectADist').val();
		}
	}

	function applyHomePromoCode() {
		$.ajax({
			type : 'POST',
			url : '<%=request.getContextPath()%>/applyHomePromoCode',
			data : $('#frmYourDetails input').serialize(),
			success : function(data) {
				document.getElementById("errPromoCode").innerHTML = data;
				var json = JSON.parse(data);
				//  alert(json);
				// setValue(json);
			}

		});
	}

	/*   function GetPromoCode() {
		$('#login-err-msg').html("");
		$('#login-err-msg').hide();
	var emailid=$('#txtPromoEmail').val(); 
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "getPromoCodebyEmail",
				data :emailid ,
				async : false,
				success : function(data) {
					if (data == 'success') {
						var Backlen = history.length;
						history.go(-Backlen);
				
						$('#login-err-msg').show();
						$('#login-err-msg').html(data);
					}
				}
			});
		}
	} */

	function userLoginFnc() {

		$('#ajax-loading').show();
		/* var a=validUser(); */
		/* 
		if(a==true)
		{ */
		$.ajax({
			type : "POST",
			url : "<%=request.getContextPath()%>/userLogin",
			data : $("#popUploginform input").serialize(),
			async : false,
			success : function(data) {
				$('#ajax-loading').hide();
				if (data == 'success') {
					window.location.reload();
					/* window.location.href = "getAccByUsernaneAndPassword"; */
				} else if (data == 'fail') {
					$('#ajax-loading').hide();
					$('#login-err-msg').show();
					$('#login-err-msg').html('Please Check Login Credential');
				}

			}
		});
		/* } */
		return false;
	}

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "<%=request.getContextPath()%>/sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					if (data == 'success') {
					} else {

					}

				},
				error : function() {
				}
			});
		}
		return false;
	}
	
	$(function(){
		// today
		var effective_start_date = new Date();
		
		// 30 days date
		var effective_end_date = new Date();

		effective_end_date.setDate(effective_end_date.getDate()+59);

		
		$('#homecareDp').datepicker({
			autoclose: true,
			todayHighlight: true,
			format: "dd-mm-yyyy",
			startDate: effective_start_date,
			endDate: effective_end_date

		}).on('changeDate', function (ev) {
			$(".hidden-sm .form-container .topten").html($('#txtEffDate').val());
			$('#errEffDate').html('');
			$("#homecareDp").removeClass("invalid-field");
		});
	});
	
	
</script>

<% if (authenticate.equals("false") || authenticate.equals("direct")) { %>
<script>

function activateUserAccountJoinUs() {
	
	//html change, change the submit input type to button, add a onclick function
    //html change, added some error html note for user, so they know if the user name and email is not success
    
    //basic logic(how it works)    
    /*
    1. if no username or password is filled, direct submit the form
    2. if username field is filled, call the create user ajax and post data
    3. if the data has something wrong, return and show msg.
    4. if the data is correct, user created and will continue to submit the form.
    5, If user is created and the normal form data is missing, 
       the user create field html will hide, and the vaule will erase so it wont trigger the create user function again.
    */
    
    name = document.getElementById("Username").value;
    password = document.getElementById("Password").value;
    password2 = document.getElementById("Confirm-Password").value;
     
    $("#UsernameError").text("");
    $("#PasswordError").text("");
    $("#Confirm-PasswordError").text("");
    $("#Username").removeClass("invalid-field");
    $("#Password").removeClass("invalid-field");
    $("#Confirm-Password").removeClass("invalid-field");
    
    //first error element
    var firstErrorElementId="";
    
    if(name == "" && password == "" && password2 == ""){
        $('#frmYourDetails').submit()
    }else{
    	if(name != "" && password != "" && password2 != ""){
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
        		return;
        	}

	       	optIn1 = "false"
	        optIn2 = "false"
	        if($('#checkbox34').is(':checked')){
	            optIn2 = "true";    
	        }
	        if($('#checkbox33').is(':checked')){
	            optIn1 = "true";    
	        }
	        password = document.getElementById("Password").value; 
	        mobile = document.getElementById("inputMobileNo").value;
	        name = document.getElementById("inputFullName").value;
	        userName = document.getElementById("Username").value;
	        email = document.getElementById("inputEmailId").value;
	        
	        $('#loading-overlay').modal({
	            backdrop: 'static',
	            keyboard: false
	         })
	        
	        
	       $.ajax({
	                   type : 'POST',
	                    url : '<%=request.getContextPath()%>/${language}/joinus',
	                    data : { optIn1: optIn1, optIn2: optIn2, password: password, mobile: mobile, name: name, userName: userName, email: email, ajax: "true" },
	                    async : false,
	                    success : function(data) {
	                        if (data == 'success') {
   	                            $(".error-hide").css("display", "none");
	                        	$(".membership-wrap").css("display", "none"); 
	                        	document.getElementById("Username").value = "";
	                       	    document.getElementById("Password").value = "";
	                       	    document.getElementById("Confirm-Password").value = "";
	                       	    
	                       	    $("#link-error").click();	                       	    
	                       	    perventRedirect=false;
	                        	$('#frmYourDetails').submit();
	                            return;                            
	                        } else {
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
    	}
    	else{
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
        scrollToElement(firstErrorElementId);
    }
    
    return;
       
}
</script>

<% }else{%>
<script>
function activateUserAccountJoinUs() {
	perventRedirect=false;
	$('#frmYourDetails').submit();
}
</script>
<% } %> 
</head>
<body>
	

	<!--/#main-Content-->
	<section>
		<div id="cn" class="container">
			<div class="row">
				<form:form name="frmYourDetails" id="frmYourDetails"
					action="${pageContext.request.contextPath}/${language}/home-insurance/home-summary" method="post"
					onsubmit="return hc_planValid();" modelAttribute="frmYourDetails">
					<ol class="breadcrumb pad-none">
						<li><a href="#"><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item2" bundle="${msg}" /></a> <i
							class="fa fa-caret-right"></i></li>
						<li><a href="#"><fmt:message key="home.breadcrumb1.item3" bundle="${msg}" /></a></li>
						<li class="active "><i class="fa fa-caret-right"></i> <fmt:message key="home.breadcrumb1.item4" bundle="${msg}" /></li>
					</ol>
					<div class="container ">
						<div class="col-md-12 shop-tracking-status">
							<div class="center" style="visibility: visible;">
								<h2><fmt:message key="home.details.jumbo" bundle="${msg}" /></h2>
							</div>
							<br>
							<div class="col-lg-12">
								<div id="tr-wizard" class="shop-tracking-status">
									<div class="order-status has-four">
										<div class="order-status-timeline-new">
											<div class="order-status-timeline-completion dots-active"></div>
											<div class="order-status-timeline-completion dots-inactive"></div>
											<div class="order-status-timeline-completion dots-inactive"></div>
										</div>
										<div
											class="image-order-status image-order-status-new active img-circle first">
											<span class="status color3"><fmt:message key="home.breadcrumb2.item1" bundle="${msg}" /></span>
											<div class="icon">1</div>
										</div>
										<div
											class="image-order-status image-order-status-intransit  img-circle act second">
											<span class="status color2"><fmt:message key="home.breadcrumb2.item2" bundle="${msg}" /></span>
											<div class="icon">2</div>
										</div>
										<div
											class="image-order-status image-order-status-delivered  img-circle third">
											<span class="status"><fmt:message key="home.breadcrumb2.item3" bundle="${msg}" /></span>
											<div class="icon">3</div>
										</div>
										<div
											class="image-order-status image-order-status-completed  img-circle fourth">
											<span class="status lst-status"><fmt:message key="home.breadcrumb2.item4" bundle="${msg}" /></span>
											<div class="icon">4</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="quote-wrap" class="container pad-none bdr ur-opt-content gray-bg3">






						<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 pad-none white-bg1">
							<br>
							<div class="form-wrap">
							<%
								if (authenticate.equals("false") || authenticate.equals("direct")) 
								{
							%>
							<h3 class="h2-3-existing-fwd-head bmg-detail-exist-member-head">
							<fmt:message key="home.details.login" bundle="${msg}" />
							<!--
                            278
                            --> 
                            <a 
                            class="tool-tip show-inline-md"
                            data-toggle="tooltip" data-placement="bottom"
                            title="<fmt:message key="member.account.login.help" bundle="${msg}" />">
                            <img src="<%=request.getContextPath()%>/resources/images/ic.png"
                            alt=""></a>
							</h3>
							
							<a href="#" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 btn-box-2 color4 login-btn" data-toggle="modal" data-target="#loginpopup"><fmt:message key="home.details.login.action" bundle="${msg}" /></a>
							<div class="col-lg-9 col-md-9 col-xs-9 col-sm-9 text-left">
								<h3 class="text-left or-continue">
									<span><fmt:message key="home.details.login.other.part1" bundle="${msg}" /></span> <fmt:message key="home.details.login.other.part2" bundle="${msg}" />
								</h3>
							</div>
							<%
								}
								else
								{
							%>
								<input type="hidden" id="isLogin" value="true">
							<%
								}
							%>
							</div>

							<div class="clearfix"></div>
							<br/>
							<div class="gray-bdr"></div>
							<!-- updated responsive design start -->
	                        <div class="form-wrap">
	                            <div class="big-title black-bold pad-none bmg-big-title">
	                                <fmt:message key="home.details.applicant.heading" bundle="${msg}" />
	                            </div>
	                            <!-- english name start -->
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                  <label class="field-label bold-500"><fmt:message key="home.details.applicant.name" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                   <input type="text"
                                            class="form-control full-control textUpper" id="inputFullName" name="applicantName"
                                            value="${userDetails.fullName.trim()}"
                                            onblur="replaceAlpha(this); chkNotNullApplicantName(this, 'appfullname');"
                                            onkeypress=" return alphaOnly(event);" maxlength="50" /> <span
                                            id="appfullname" class="text-red"></span>
	                               </div>
	                           </div>
	                           <!-- english name end -->
	                           <!-- id card starts -->
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                   <label class="field-label form-label bold-500 hidden-lg hidden-md"><fmt:message
                                                            key="home.details.applicant.hkid"
                                                            bundle="${msg}" /></label>
	                                   <div class="bmg-label-styled-select styled-select">
                                           <select
                                               name="apphkidandpassport" id="selectHkidPass"
                                               class="form-control soflow select-label" onchange="togglePlaceholder(this,'txtAppHkid','<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />');">
                                               <option
                                                   value="appHkid" selected="selected">
                                                   <fmt:message
                                                       key="home.details.applicant.hkid" bundle="${msg}" />
                                               </option>
                                               <option
                                                   value="appPassport">
                                                   <fmt:message
                                                       key="home.details.applicant.passport" bundle="${msg}" />
                                               </option>
                                           </select>
                                       </div>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                    <!-- <input type="text" name="hkId" class="form-control numberinput textUpper full-control" id="txtAppHkid" placeholder="<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />" onblur="chkValidApplicantHkId(this, 'errAppHkid', 'selectHkidPass');" onkeyup="hkidValid(this)"> -->
                                        <input type="text" name="hkId" class="form-control numberinput textUpper full-control bmg_custom_placeholder" id="txtAppHkid" value="<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />" onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />'); chkValidApplicantHkId(this, 'errAppHkid', 'selectHkidPass');" onkeypress=" return hkidOnkeypress(event);">
                                        <span id="errAppHkid" class="text-red"> </span>
	                               </div>
	                           </div>
	                           <!-- id card ends -->
	                           <!-- birthday starts -->
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                   <label for="inputApplicantDob"
                                            class="field-label bold-500"><fmt:message key="home.details.applicant.birthday" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                    <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
	                                          <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.trLeavingDate}" readonly>
	                                      </div>
	                                      <span id="dobInvalid" class="text-red"> </span></td>
	                               </div>
	                           </div>
	                           <!-- birthday ends -->
	                           <!-- mobile starts -->
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                   <label for="inputFullName" class="field-label bold-500">
	                                       <fmt:message key="home.details.applicant.mobile" bundle="${msg}" />
	                                   </label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                   <input type="text"
                                            class="form-control full-control" id="inputMobileNo" name="mobileNo"
                                            value="${userDetails.mobileNo.trim()}"
                                            onkeypress="return isNumeric(event)"
                                            onblur="replaceNumeric(this); chkValidApplicantMobileNo(this, 'errMobileNo');" maxlength="8" /> <span
                                            id="errMobileNo" class="text-red"> </span>
	                               </div>
	                           </div>
	                           <!-- mobile ends -->
	                           <!-- email address starts -->
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                   <label for="inputFullName" class="field-label bold-500">
	                                       <fmt:message key="home.details.applicant.email" bundle="${msg}" />
	                                   </label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                   <input class="form-control full-control textLower"
                                            id="inputEmailId" name="emailAddress"
                                            value="${userDetails.emailAddress.trim()}"
                                            onblur="chkValidApplicantEmail(this, 'errEmailid');" maxlength="50"> <span
                                            id="errEmailid" class="text-red"> </span>
	                               </div>
	                           </div>
	                           <!-- email address ends -->
	                        </div>
							<%-- <table class="table activation-form margin-left-2 vert-middle">
								<tbody>
									<tr>
										<td colspan="2"><h3
												class="black-bold pad-none"><fmt:message key="home.details.applicant.heading" bundle="${msg}" /></h3></td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="bold-500"><fmt:message key="home.details.applicant.name" bundle="${msg}" /></label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputFullName" name="applicantName"
											value="${userDetails.getFullName().trim()}"
											placeholder="<fmt:message key="home.details.applicant.name.placeholder" bundle="${msg}" />" onblur="replaceAlpha(this); chkNotNullApplicantName(this, 'appfullname');"
											onkeypress=" return alphaOnly(event);" maxlength="100" /> <span
											id="appfullname" class="text-red"></span></td>
									</tr>
									<tr>

										<td class="">
											<div class="styled-select">
												<select
													name="apphkidandpassport" id="selectHkidPass"
													class="form-control soflow full-control">
													<option
														value="appHkid" selected="selected">
														<fmt:message
															key="home.details.applicant.hkid" bundle="${msg}" />
													</option>
													<option
														value="appPassport">
														<fmt:message
															key="home.details.applicant.passport" bundle="${msg}" />
													</option>
												</select>
											</div>
										</td>
										<td class=""><input type="text" name="hkId"
											class="form-control numberinput textUpper full-control" id="txtAppHkid"
											placeholder="<fmt:message key="home.details.applicant.passport.placeholder" bundle="${msg}" />"
											onblur="chkValidApplicantHkId(this, 'errAppHkid', 'selectHkidPass');" onkeyup="hkidValid(this)"> <span id="errAppHkid"
											class="text-red"> </span></td>

									</tr>
									<!-- Birthday starts -->
	                                <tr>
	                                    <td valign="middle"><label for="inputApplicantDob"
	                                        class="bold-500"><fmt:message key="home.details.applicant.birthday" bundle="${msg}" /></label></td>
	                                    <td>
	                                        <div class="input-group date" id="input_dob"> <span class="input-group-addon in border-radius"><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span>
	                                            <input name="applicantDob" type="text" class="pointer datepicker form-control border-radius" id="applicantDob" value="${corrTravelQuote.getTrLeavingDate()}" readonly>
	                                        </div>
	                                        <span id="dobInvalid" class="text-red"> </span></td>
	                                    </td>
	                                </tr>
	                                <!-- Birthday ends -->
									<tr>
										<td class=""><label
											class="bold-500"><fmt:message key="home.details.applicant.mobile" bundle="${msg}" /></label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputMobileNo" name="mobileNo"
											value="${userDetails.getMobileNo().trim()}"
											placeholder="<fmt:message key="home.details.applicant.mobile.placeholder" bundle="${msg}" />"
											onkeypress="return isNumeric(event)"
											onblur="replaceNumeric(this); chkValidApplicantMobileNo(this, 'errMobileNo');" maxlength="8" /> <span
											id="errMobileNo" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class=""><label
											class="bold-500"><fmt:message key="home.details.applicant.email" bundle="${msg}" /></label></td>
										<td class=""><input class="form-control full-control"
											id="inputEmailId" name="emailAddress"
											value="${userDetails.getEmailAddress().trim()}"
											placeholder="<fmt:message key="home.details.applicant.email.placeholder" bundle="${msg}" />" 
											onblur="chkValidApplicantEmail(this, 'errEmailid');" maxlength="50"> <span
											id="errEmailid" class="text-red"> </span></td>
									</tr>
								</tbody>
							</table> --%>
							<%
								if (authenticate.equals("false")
											|| "direct".equalsIgnoreCase(request.getSession()
													.getAttribute("authenticate").toString())) {
							%>

                            <div class="gray-bg3-wid container membership-wrap" style="padding-top: 20px;padding-left:0px;padding-right:0px;">
                             <div class="form-wrap">
	                            <div class="membership-header">
	                                <h3 class="bmg-membership-header"><fmt:message key="home.details.registration.heading" bundle="${msg}" /></h3>
	                                <i class="text-grey"><fmt:message key="home.details.registration.desc" bundle="${msg}" /></i>                                
	                                <h3 class="error-hide" style='display:none; color:red; font-size:15px;'></h3>                                    
	                            </div>
	                            <div class="form-group float row">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
	                                   <label class="field-label bold-500"><fmt:message key="home.details.registration.username" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
	                                   <input type="text"
                                                class="form-control marginbt full-control input-white" id="Username"
                                                name="userName" onkeypress="return validationUsername(event);"> <span id="UsernameError"
                                                class="text-red"> </span>
	                               </div>
	                            </div>
	                            <div class="form-group float row">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
	                                   <label
                                                class="field-label bold-500"><fmt:message key="home.details.registration.password" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
	                                   <input type="password"
                                                class="form-control marginbt full-control input-white" id="Password" autocomplete="off" name="password"
                                                placeholder="<fmt:message key="home.details.registration.password.placeholder" bundle="${msg}" />"> <span id="PasswordError"
                                                class="text-red"> </span>
	                               </div>
	                            </div>
	                            <div class="form-group float row">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12">
	                                   <label
	                                            class="field-label bold-500"><fmt:message key="home.details.registration.confirmPassword" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
	                                  <input type="password"
                                                class="form-control marginbt full-control input-white" id="Confirm-Password" autocomplete="off"
                                                placeholder="<fmt:message key="home.details.registration.confirmPassword.placeholder" bundle="${msg}" />"> <span
                                                id="Confirm-PasswordError" class="text-red"> </span>
	                               </div>
	                            </div>
	                            </div>
	                        </div>
							<%-- <div class="gray-bg3-wid">
								<table class="table plandetail-form margin-left-2 vert-middle"
									id="input-white">
									<tbody>
										<tr>
											<td colspan="2" class="">
												<h3 class="pad-none"><fmt:message key="home.details.registration.heading" bundle="${msg}" /></h3> <i>
													<fmt:message key="home.details.registration.desc" bundle="${msg}" /></i> <br>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="">&nbsp;</td>
										</tr>
										<tr>
											<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
												class="bold-500"><fmt:message key="home.details.registration.username" bundle="${msg}" /></label></td>
											<td class=""><input type="text"
												class="form-control marginbt full-control" id="Username"
												placeholder="<fmt:message key="home.details.registration.username.placeholder" bundle="${msg}" />" name="userName"> <span id="UsernameError"
												class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="bold-500"><fmt:message key="home.details.registration.password" bundle="${msg}" /></label></td>
											<td class=""><input type="password"
												class="form-control marginbt full-control" id="Password" autocomplete="off" name="password"
												placeholder="<fmt:message key="home.details.registration.password.placeholder" bundle="${msg}" />"> <span id="PasswordError"
												class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="bold-500"><fmt:message key="home.details.registration.confirmPassword" bundle="${msg}" /></label></td>
											<td class=""><input type="password"
												class="form-control marginbt full-control" id="Confirm-Password" autocomplete="off"
												placeholder="<fmt:message key="home.details.registration.confirmPassword.placeholder" bundle="${msg}" />"> <span
												id="Confirm-PasswordError" class="text-red"> </span></td>
										</tr>
									</tbody>
								</table>
							</div> --%>
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
						    <div class="form-wrap">
                                <div class="big-title black-bold" style="padding-left:0px !important;">
                                    <fmt:message key="home.details.applicant.heading" bundle="${msg}" />
                                </div>
                                 
	                           <div class="form-group float">
	                               <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
	                                   <label
	                                        for="inputFullName" class="field-label bold-500"><fmt:message key="home.details.registration.corraddress" bundle="${msg}" /></label>
	                               </div>
	                               <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
	                                   <!-- room, floor, block start -->
	                                   <div class="row form-group">
	                                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                           <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCARoom" name="applicantRoom" placeholder="<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="10" />
	                                       </div>
	                                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                            <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCAFloor" name="applicantFloor" placeholder="<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />"  
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />');"     
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="5"/>
	                                       </div>
	                                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
	                                            <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCABlock" name="applicantBlock" placeholder="<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />');" onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
	                                       </div>
	                                   </div>
	                                   <!--  room, floor, block end -->
		                               <!-- building, estate start -->
		                               <div class="row form-group">
                                           <div class="col-xs-12">
                                               <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCABuilding" name="applicantBuilding"
	                                            placeholder="<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />'); chkNotNullCABuilding(this, 'errCABuilding');"
	                                            onkeypress="return isAlphaNumeric(event);" maxlength="50" />
	                                            <span id="errCABuilding" class="text-red"> </span>
                                           </div>
                                        </div>
                                        <div class="row form-group">
                                           <div class="col-xs-12">
                                                <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCAEstate" name="applicantEstate"
	                                            placeholder="<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />'); chkNotNullCAEstate(this, 'errCAEstate');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
	                                            <span id="errCAEstate" class="text-red"> </span>
                                           </div>
                                       </div>
		                               <!-- building, estate end -->
		                               <!-- street no., street name start -->
		                               <div class="row form-group">
                                           <div class="col-xs-12">
                                               <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
                                            id="inputCAStreetNo" name="applicantStreetNo"
                                            placeholder="<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />"
                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />');"
                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />');"
                                            onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
                                           </div>
                                        </div>
                                        <div class="row form-group">
                                           <div class="col-xs-12">
                                                <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputCAStreetName" name="applicantStreetName"
	                                            placeholder="<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
                                           </div>
                                       </div>
		                               <!-- street no., street name end -->
		                               <!-- district start -->
		                               <div class="row form-group">
                                           <div class="col-xs-12">
                                                <div class="styled-select" id="inputCADistrict">
                                                <select name="applicantDistrict"class="form-control soflow full-control" id="selectCADist" onchange="setDropArea(this.value)">
                                                <option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
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
                                        </select></div>
                                            <div class="hidden">
                                                <select name="applicantDistrictHid"
                                                    class="form-control soflow full-control" id="selectCADistHid">
                                                    <option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
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
                                       </div>
		                               <!-- district end -->
		                               <!-- location start -->
		                               <div class="row form-group">
                                           <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="radio-inline homecare-lb">
                                                        <input type="radio" name="applicantArea" id="inlineCARadio3"
                                                        value="HK" checked="" class="home-input1"> <span><fmt:message key="home.details.registration.hk" bundle="${msg}" />
                                                    </span>
                                                </label> 
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="radio-inline homecare-lb"> <input
	                                                        type="radio" name="applicantArea" id="inlineCARadio4"
	                                                        value="KL" class="home-input1"> <span> <fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
	                                                </label>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="radio-inline"> <input type="radio"
                                                        name="applicantArea" id="inlineCARadio5" value="NT"
                                                        class="home-input1"> <span> <fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
                                                     </label>
                                                </div>
                                           </div>
                                       </div>
		                               <!-- location start -->
	                               </div>
	                           </div>
	                           
                             </div>
							<%-- <table class="table activation-form margin-left-2 autofillForm">
								<tbody>
									<tr>
										<td rowspan="5"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="bold-500"><fmt:message key="home.details.registration.corraddress" bundle="${msg}" /></label></td>
										<td><input type="text" class="form-control full-control"
											id="inputCARoom" name="applicantRoom" placeholder="<fmt:message key="home.details.registration.corraddress.room.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputCAFloor" name="applicantFloor" placeholder="<fmt:message key="home.details.registration.corraddress.floor.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5"/></td>
										<td><input type="text" class="form-control full-control"
											id="inputCABlock" name="applicantBlock" placeholder="<fmt:message key="home.details.registration.corraddress.block.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputCABuilding" name="applicantBuilding"
											placeholder="<fmt:message key="home.details.registration.corraddress.building.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this); chkNotNullCABuilding(this, 'errCABuilding');"
											onkeypress="return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCABuilding" class="text-red"> </span></td>
										<td><input type="text" class="form-control full-control"
											id="inputCAEstate" name="applicantEstate"
											placeholder="<fmt:message key="home.details.registration.corraddress.estate.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this); chkNotNullCAEstate(this, 'errCAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="1"><input type="text" class="form-control full-control"
											id="inputCAStreetNo" name="applicantStreetNo"
											placeholder="<fmt:message key="home.details.registration.corraddress.streetNo.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputCAStreetName" name="applicantStreetName"
											placeholder="<fmt:message key="home.details.registration.corraddress.streetName.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" /></td>
									</tr>
									<tr>
										<td colspan="3">
										<div class="styled-select"><select name="applicantDistrict"
											class="form-control soflow full-control" id="selectCADist"
											onchange="setDropArea(this.value)">
												<option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
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
										</select></div>
											<div class="hidden">
												<select name="applicantDistrictHid"
													class="form-control soflow full-control" id="selectCADistHid">
													<option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
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
											</div> <span id="errCADist" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="3"><label class="radio-inline homecare-lb">
												<input type="radio" name="applicantArea" id="inlineCARadio3"
												value="HK" checked="" class="home-input1"> <span><fmt:message key="home.details.registration.hk" bundle="${msg}" />
											</span>
										</label> <label class="radio-inline homecare-lb"> <input
												type="radio" name="applicantArea" id="inlineCARadio4"
												value="KL" class="home-input1"> <span> <fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
										</label> <label class="radio-inline"> <input type="radio"
												name="applicantArea" id="inlineCARadio5" value="NT"
												class="home-input1"> <span> <fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
										</label></td>
									</tr>
								</tbody>
							</table> --%>
							<div class="clearfix"></div>
							
							<%-- <table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none"><h3 class="black-bold pad-none">
												<fmt:message key="home.details.registration.addressdetails" bundle="${msg}" /></h3></td>
									</tr>
									<tr>
										<td class="pad-none"><div class="checkbox btm-pad-10">
												<input id="checkbox3" type="checkbox"
													onclick="autofillFields()"> <label for="checkbox3">
													<fmt:message key="home.details.registration.addressdetails.msg" bundle="${msg}" /><br>
												</label>
											</div></td>
									</tr>
								</tbody>
							</table> --%>
							<div class="form-wrap">
                                <div class="big-title black-bold" style="padding-left:0px !important;">
                                    <fmt:message key="home.details.registration.addressdetails" bundle="${msg}" />
                                </div>
                                <div class="form-group float">
                                   <div class="form-label col-xs-12">
	                                   <div class="checkbox btm-pad-10">
	                                        <input id="checkbox3" type="checkbox"
	                                            onclick="autofillFields()"> <label for="checkbox3">
	                                            <fmt:message key="home.details.registration.addressdetails.msg" bundle="${msg}" /><br>
	                                        </label>
	                                    </div>
                                   </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
							<div class="form-wrap">
                                <%-- <div class="big-title black-bold">
                                    <fmt:message key="home.details.applicant.heading" bundle="${msg}" />
                                </div>
                                  --%>
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                       <label
                                            for="inputFullName" class="field-label bold-500"><fmt:message key="home.details.registration.insuaddress" bundle="${msg}" /></label>
                                   </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                       <!-- room, floor, block start -->
                                       <div class="row form-group">
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                               <input type="text"
	                                            class="form-control full-control bmg_custom_placeholder textUpper" id="inputARoom" name="aRoom"
	                                            placeholder="<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="10" />
                                           </div>
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <input type="text" class="form-control  full-control bmg_custom_placeholder textUpper"
	                                            id="inputAFloor" name="aFloor" placeholder="<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
                                           </div>
                                           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                <input type="text" class="form-control  full-control bmg_custom_placeholder textUpper"
	                                            id="inputABlock" name="aBlock"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="5" placeholder="<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />"/>
                                           </div>
                                       </div>
                                       <!--  room, floor, block end -->
                                       <!-- building, estate start -->
                                       <div class="row form-group">
                                           <div class="col-xs-12">
                                              <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputABuilding" name="aBuilding" placeholder="<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />');"
	                                            onChange="replaceAlphaNumeric(this); chkNotNullIABuilding(this, 'errABuilding');"
	                                            onkeypress="    return isAlphaNumeric(event);"
	                                            maxlength="100" /> <span id="errABuilding" class="text-red">
	                                        </span>
                                           </div>
                                        </div>
                                        <div class="row form-group">
                                           <div class="col-xs-12">
                                                <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputAEstate" name="aEstate" placeholder="<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />'); chkNotNullIAEstate(this, 'errAEstate');"
	                                            onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
	                                            <span id="errAEstate" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- building, estate end -->
                                       <!-- street no., street name start -->
                                       <div class="row form-group">
                                           <div class="col-xs-12">
                                               <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputAStreetNo" name="aStreetNo" placeholder="<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);"
	                                            maxlength="100" />
                                        </div>
                                        </div>
                                        <div class="row form-group">
                                           <div class="col-xs-12">
                                                <input type="text" class="form-control full-control bmg_custom_placeholder textUpper"
	                                            id="inputAStreetName" name="aStreetName"
	                                            placeholder="<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />"
	                                            onfocus="placeholderOnFocus(this,'<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />');"
	                                            onblur="placeholderOnBlur(this,'<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />');"
	                                            onkeypress="    return isAlphaNumeric(event);"
	                                            maxlength="100" />
                                           </div>
                                       </div>
                                       <!-- street no., street name end -->
                                       <!-- district start -->
                                       <div class="row form-group">
                                           <div class="col-xs-12">
                                                <div class="styled-select" id="inputADistrict">
                                            <select name="aDistrict"
                                                class="form-control soflow full-control" id="selectADist"
                                                onchange="setDropArea2(this.value)">
                                                <option value="">
                                                    <fmt:message
                                                        key="home.details.registration.district" bundle="${msg}" />
                                                </option>
                                                <%
                                                    List list = (List)
                                                    request.getAttribute("districtList");
                                                    Iterator itrr =
                                                    list.iterator();
                                                    while
                                                    (itrr.hasNext()) {
                                                    DistrictBean
                                                    districtList =
                                                    (DistrictBean)
                                                    itrr.next();
                                                %>
                                                <option
                                                    value="<%=districtList.getCode()%>">
                                                    <%=
                                                        districtList.getDescription()
                                                    %>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div>


                                            <div class="hidden">
                                                <select name="applicantDistrictHid"
                                                    class="form-control soflow" id="selectADistHid">
                                                    <option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
                                                    <%
                                                        List list1 = (List) request.getAttribute("districtList");
                                                            Iterator itrr1 = list1.iterator();
                                                            while (itrr1.hasNext()) {
                                                                DistrictBean districtList = (DistrictBean) itrr1.next();
                                                    %>
                                                    <option value="<%=districtList.getCode()%>"><%=districtList.getArea()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div><span id="errADist" class="text-red"> </span>
                                           </div>
                                       </div>
                                       <!-- district end -->
                                       <!-- location start -->
                                       <div class="row form-group">
                                           <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="radio-inline homecare-lb">
		                                                <input type="radio" name="aArea" id="inlineDeskRadio31"
		                                                value="HK" checked="" class="home-input1"> <span><fmt:message key="home.details.registration.hk" bundle="${msg}" />
		                                                  </span>
		                                          </label>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="radio-inline homecare-lb"> <input
			                                                type="radio" name="aArea" id="inlineDeskRadio41" value="KL"
			                                                class="home-input1"> <span> <fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
			                                        </label>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="radio-inline"> <input type="radio"
			                                                name="aArea" id="inlineDeskRadio51" value="NT"
			                                                class="home-input1"> <span> <fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
			                                        </label>
                                                </div>
                                           </div>
                                       </div>
                                       <!-- location start -->
                                       <br/><br/>
                                   </div>
                               </div>
                               <div class="clearfix"></div>
                               <!-- place start -->
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                      <label
                                        class="field-label bold-500"><fmt:message key="home.details.registration.FloorArea.part1" bundle="${msg}" /> <fmt:message key="home.details.registration.FloorArea.part2" bundle="${msg}" />
                                       </label>                                        
                                    </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                       <div class="styled-select" id="inputNFA">
                                        <select
                                            name="netFloorArea"
                                            class="form-control soflow full-control" id="selectNFA"
                                            onChange="chkNotNullIANetFloorArea(this, 'errNFA');">
                                            <option value="">
                                                <fmt:message
                                                    key="home.details.registration.select" bundle="${msg}" />
                                            </option>
                                            <c:forEach
                                                var="floorAreaList" items="${mapNetFloorArea}">
                                                <option
                                                    value="${floorAreaList.key}">
                                                    <c:out
                                                        value="${floorAreaList.value}" />
                                                </option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <span id="errNFA" class="text-red"> </span>
                                   </div>
                               </div>
                               <!-- place end -->
                               <!-- start date  -->
                               <div class="form-group float">
                                   <div class="form-label col-lg-5 col-md-5 col-sm-12 col-xs-12 pad-none">
                                      <label
                                        class="field-label bold-500 home-line"><fmt:message key="home.details.registration.effdate.part1" bundle="${msg}" /> <fmt:message key="home.details.registration.effdate.part2" bundle="${msg}" />
                                    </label>
                                    </div>
                                   <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none">
                                        <div class="input-group date" id="homecareDp">
                                            <span class="input-group-addon in border-radius"><span><img
                                                    src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="" /></span></span> <input
                                                name="effectiveDate" type="text"
                                                class="datepicker form-control full-control" id="txtEffDate"
                                                readonly />
                                        </div>
                                        <span id="errEffDate" class="text-red"></span>
                                   </div>
                               </div>
                               <!-- start date  -->
                             </div>
							<%-- <table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td rowspan="5"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="bold-500"><fmt:message key="home.details.registration.insuaddress" bundle="${msg}" /></label></td>
										<td colspan="2"><input type="text"
											class="form-control wd2 full-control" id="inputARoom" name="aRoom"
											placeholder="<fmt:message key="home.details.registration.insuaddress.room.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control  full-control"
											id="inputAFloor" name="aFloor" placeholder="<fmt:message key="home.details.registration.insuaddress.floor.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td><input type="text" class="form-control  full-control"
											id="inputABlock" name="aBlock" placeholder="<fmt:message key="home.details.registration.insuaddress.block.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td colspan="3"><input type="text" class="form-control full-control"
											id="inputABuilding" name="aBuilding" placeholder="<fmt:message key="home.details.registration.insuaddress.building.placeholder" bundle="${msg}" />"
											
											onChange="replaceAlphaNumeric(this); chkNotNullIABuilding(this, 'errABuilding');"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /> <span id="errABuilding" class="text-red">
										</span></td>
										<td colspan=""><input type="text" class="form-control full-control"
											id="inputAEstate" name="aEstate" placeholder="<fmt:message key="home.details.registration.insuaddress.estate.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this); chkNotNullIAEstate(this, 'errAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="1"><input type="text" class="form-control full-control"
											id="inputAStreetNo" name="aStreetNo" placeholder="<fmt:message key="home.details.registration.insuaddress.streetNo.placeholder" bundle="${msg}" />"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
										<td colspan="3"><input type="text" class="form-control full-control"
											id="inputAStreetName" name="aStreetName"
											placeholder="<fmt:message key="home.details.registration.insuaddress.streetName.placeholder" bundle="${msg}" />" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
									</tr>
									<tr>
										<td colspan="4">
										<div class="styled-select">
											<select name="aDistrict"
												class="form-control soflow full-control" id="selectADist"
												onchange="setDropArea2(this.value)">
												<option value="">
													<fmt:message
														key="home.details.registration.district" bundle="${msg}" />
												</option>
												<%
													List list = (List)
													request.getAttribute("districtList");
													Iterator itrr =
													list.iterator();
													while
													(itrr.hasNext()) {
													DistrictBean
													districtList =
													(DistrictBean)
													itrr.next();
												%>
												<option
													value="<%=districtList.getCode()%>">
													<%=
														districtList.getDescription()
													%>
												</option>
												<%}%>
											</select>
										</div>


											<div class="hidden">
												<select name="applicantDistrictHid"
													class="form-control soflow" id="selectADistHid">
													<option value=""><fmt:message key="home.details.registration.district" bundle="${msg}" /></option>
													<%
														List list1 = (List) request.getAttribute("districtList");
															Iterator itrr1 = list1.iterator();
															while (itrr1.hasNext()) {
																DistrictBean districtList = (DistrictBean) itrr1.next();
													%>
													<option value="<%=districtList.getCode()%>"><%=districtList.getArea()%></option>
													<%
														}
													%>
												</select>
											</div><span id="errADist" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="4"><label class="radio-inline homecare-lb">
												<input type="radio" name="aArea" id="inlineDeskRadio31"
												value="HK" checked="" class="home-input1"> <span><fmt:message key="home.details.registration.hk" bundle="${msg}" />
											</span>
										</label> <label class="radio-inline homecare-lb"> <input
												type="radio" name="aArea" id="inlineDeskRadio41" value="KL"
												class="home-input1"> <span> <fmt:message key="home.details.registration.kln" bundle="${msg}" /></span>
										</label> <label class="radio-inline"> <input type="radio"
												name="aArea" id="inlineDeskRadio51" value="NT"
												class="home-input1"> <span> <fmt:message key="home.details.registration.nt" bundle="${msg}" /></span>
										</label></td>
									</tr>
								</tbody>
							</table> --%>
							
							<div class="clearfix"></div>
							
							<%-- <table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "><label
											class="bold-500"><fmt:message key="home.details.registration.FloorArea.part1" bundle="${msg}" /><br> <fmt:message key="home.details.registration.FloorArea.part2" bundle="${msg}" />
										</label></td>
										<td class="">

											<div class="styled-select">
												<select
													name="netFloorArea"
													class="form-control soflow full-control" id="selectNFA"
													onChange="chkNotNullIANetFloorArea(this, 'errNFA');">
													<option value="">
														<fmt:message
															key="home.details.registration.select" bundle="${msg}" />
													</option>
													<c:forEach
														var="floorAreaList" items="${mapNetFloorArea}">
														<option
															value="${floorAreaList.key}">
															<c:out
																value="${floorAreaList.value}" />
														</option>
													</c:forEach>

												</select>
											</div>
											<span id="errNFA" class="text-red"> </span>
										</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="bold-500 home-line"><fmt:message key="home.details.registration.effdate.part1" bundle="${msg}" /><br> <fmt:message key="home.details.registration.effdate.part2" bundle="${msg}" />
										</label></td>
										<td class=""><div class="form-group">
												<div class="input-group date" id="homecareDp">
													<span class="input-group-addon bg-img in"><span><img
															src="<%=request.getContextPath()%>/resources/images/calendar.png" alt="" /></span></span> <input
														name="effectiveDate" type="text"
														class="datepicker form-control full-control" id="txtEffDate"
														readonly />
												</div>
											</div> <span id="errEffDate" class="text-red"></span></td>
									</tr>
								</tbody>
							</table> --%>
							<div class="clearfix"></div>
							<div class="form-wrap">
							<h4 class="h4-2 bmg-disclaimer-header"><fmt:message key="home.details.declarations.heading" bundle="${msg}" /></h4>
							<div class="declaration-content" style="margin-left: 0px;margin-right: 0px;">
								<div class="checkbox">
									<input id="checkbox1" name="declarration" type="checkbox">
									<label for="checkbox1"> <fmt:message key="home.details.declarations.tnc" bundle="${msg}" /><br> 
										i. <span class="margin-left-2"></span> <fmt:message key="home.details.declarations.tnc.desc1" bundle="${msg}" /><br>
										ii. <span class="margin-left-2"></span> <fmt:message key="home.details.declarations.tnc.desc2" bundle="${msg}" /> <br>
										iii. <span class="margin-left-2"></span> <fmt:message key="home.details.declarations.tnc.desc3" bundle="${msg}" /><br>
										iv. <span class="margin-left-2"></span> <fmt:message key="home.details.declarations.tnc.desc4" bundle="${msg}" /><br>
										v. <span class="margin-left-2"></span> <fmt:message key="home.details.declarations.tnc.desc5" bundle="${msg}" /><br/>
									</label>
								</div>
								<span id="chk1" class="text-red"></span>
								<br/>
								<div class="checkbox">
									<input id="checkbox2" name="declarration2" type="checkbox">
									<label for="checkbox2"><fmt:message key="home.details.declarations.PICS.part1" bundle="${msg}" />  <a
										href="<fmt:message key="PICS.link" bundle="${msg}" />"
										 class="sub-link" target="_blank"> <fmt:message key="home.details.declarations.PICS.part2" bundle="${msg}" /></a> <fmt:message key="home.details.declarations.PICS.part3" bundle="${msg}" /> <br> 
									</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr/>
								<div>
									<fmt:message key="home.details.declarations.PDPO" bundle="${msg}" />
								</div>
								
								<div class="checkbox">
									<input id="checkbox33" type="checkbox"
										name="donotWishDirectMarketing"> <label
										for="checkbox33"> <fmt:message key="home.details.declarations.PDPO.option1" bundle="${msg}" /> <br> <br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox34" type="checkbox"
										name="donotDisclose"> <label
										for="checkbox34"> <fmt:message key="home.details.declarations.PDPO.option2" bundle="${msg}" /><br>
									</label>
								</div>

                                <div class="checkboxBubble">
                                    <fmt:message key="home.details.declarations.PDPO.warning" bundle="${msg}" />
                                </div>
                                
                                <script type="text/javascript">
								function showBubble(){
								    if($("#checkbox33").prop('checked') || $("#checkbox34").prop("checked")) {
								        $(".checkboxBubble").fadeIn();
								    }else{
								        $(".checkboxBubble").fadeOut();
								    }
								}
								
								$("#checkbox33").change(function() {
								    showBubble();
								});
								
								$("#checkbox34").change(function() {
								    showBubble();
								});
								</script>
							</div>
							</div>
						</div>
						<%HomeQuoteBean homeQuoteDetails = (HomeQuoteBean) request.getAttribute("homeQuoteDetails");%>
						<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12  gray-bg wht-bg3 pad-none floatingbox">
							<div class="hidden-sm hidden-xs">
								<div class="wd2">
								
								    <div class="pull-left" style="width:150px;">
	                                    <h2 class="h2-3-choose" style="padding-left:0px;font-size: 24px;"><fmt:message key="home.details.summary.product" bundle="${msg}" /></h2>
	                                    <h4 style="padding-left:0px;line-height: 0px;font-size: 16px;"><fmt:message key="home.details.summary.desc1" bundle="${msg}" /></h4>
	                                </div>
	                                <div class="pull-right" style="padding-top: 45px;">
	                                    <div class="text-right h2-2 h2" style="margin-top:0px;margin-bottom:0px;">
	                                        <div class="hk" style="font-size: 18px;">
	                                            <fmt:message key="travel.dollar" bundle="${msg}" />
	                                            <div class="flightcare-hk" style="font-weight: bold;font-size: 28px;"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getGrossPremium()))%></div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="clearfix"></div>
									
								</div>
								<div class="clearfix"></div>
								<div class="orange-bdr"></div>
								<div style="width: 80%;margin-left: 10%;">
	                                <div class="form-container" style="padding:0px;">
										<h3 class="txt-bold"><fmt:message key="home.details.summary.desc2" bundle="${msg}" /></h3>
										<h4 class="topten"><fmt:message key="home.details.summary.desc3" bundle="${msg}" /></h4>
									</div>
									
									<c:if test="${referralCode!=''}">
									    <div class="form-container">
		                                    <h3><fmt:message key="travel.sidebar.summary.promocode" bundle="${msg}" /></h3>
	                                        <h4>${referralCode}</h4>
		                                </div>
	                                </c:if>
									
									<h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.details.summary.subtotal" bundle="${msg}" /></h3>
									<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getGrossPremium()))%></h3>
									<h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.details.summary.discount" bundle="${msg}" /></h3>
									<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getDiscountAmount()))%></h3>
									<div class="clearfix"></div>
								</div>
								<div class="orange-bdr"></div>
								<div style="width: 80%;margin-left: 10%;">
									<h3 class="h4-1-orange-b col-lg-6 col-md-6" style="padding-left:0px;font-size: 18px;"><fmt:message key="home.details.summary.amountDue" bundle="${msg}" /></h3>
									<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right" style="padding-right: 0px;font-size: 18px;"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%></h3>
								     <input type="hidden" name="totalDue"
									value="${ homeQuoteDetails.totalDue}"> <input
									type="hidden" name="planCode"
									value="${ homeQuoteDetails.planCode}"> <input
									type="hidden" name="answer1" value="${answer1}"> <input
									type="hidden" name="answer2" value="${answer2}">
                                </div>
							<!--mob-->
							     
					           <div style="width: 80%;margin-left: 10%;">
	                                <div class="top35 pull-left pad-none" style="width:47%">
	                                     <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="home.action.back" bundle="${msg}" /> </a>
	                                </div>
	                                <div class="top35 pull-right pad-none" style="width:47%"> 
	                                    <!-- <input type="submit" class="bdr-curve btn btn-primary nxt-btn" value="<fmt:message key="home.action.next" bundle="${msg}" />" /> -->
	                                    <input type="button" onclick="return activateUserAccountJoinUs();" class="bdr-curve btn btn-primary nxt-btn" value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
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
		                     <hr/>
		                 </div>
		            </div>
					
					<p class="padding1 workingholiday-plan-disclaimer">
						<fmt:message key="home.main.other.disclaimer.part1" bundle="${msg}" /> <a
							class="sub-link"
							href="${pageContext.request.contextPath}/<fmt:message key="home.provision.link" bundle="${msg}" />"
							target="_blank"><fmt:message key="home.main.other.disclaimer.part2" bundle="${msg}" /></a> 
							<fmt:message key="home.main.other.disclaimer.part3" bundle="${msg}" /> <br> 
							<fmt:message key="home.main.other.disclaimer.part4" bundle="${msg}" />
					</p>
					
					<div class="col-xs-12 hidden-md hidden-lg pad-none">
	                   <div style="width: 80%;margin-left: 10%;  margin-bottom: 50px;">
	                        <div class="top35 pull-left pad-none" style="width:47%">
	                            <a class="bdr-curve btn btn-primary bck-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="flight.details.action.back" bundle="${msg}" /> </a>
	                        </div>
	                        <div class="top35 pull-right pad-none" style="width:47%">
	                            <input type="button" onclick="return activateUserAccountJoinUs();"
	                                class="bdr-curve btn btn-primary nxt-btn"
	                                value="<fmt:message key="flight.details.action.next" bundle="${msg}" />" />
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

	<!--/end- Main Content-->

	<!--Plan-login-popup-->



	<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
						<div class="form-container">
							<h2>Don't have a promotion code? Enter your email address
								and we'll send you one.</h2>
							<h4>Email</h4>
							<div class="form-group">
								<input type="text" class="form-control" placeholder=""
									name="emailToSendPromoCode" id="emailToSendPromoCode">
							</div>
							<span id="errPromoEmail" class="text-red"></span> <br>
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
										onclick="return sendEmail()">Submit</a>
								</div>
								<div class="col-md-2">
									<br>
								</div>
								<div class="col-lg-4 col-md-4">
									<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
								</div>
								<br> <br>
								<div class="col-lg-12 col-md-12">
									<p>By submitting my email address I agree to receive FWD's
										promotion code and other offers in the future.</p>
								</div>
							</div>
						</div>
					</form>
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

</body>
</html>