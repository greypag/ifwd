<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
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
<title>Home Insurance User Details |  FWD Hong Kong</title>
<meta name="description"
	content="Get affordable home insurance with protection for emergencies and accidents ✓24/7 support ✓ 'A' rated secure & stable financial strength ✓ Rewards & benefits" />

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>-->

<!--Google Code for SEO-->

<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTMK7TX8B"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTMK7TX8B');
</script>

<!--END -Google Code for SEO-->

<!--VWO-->
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 95373, settings_tolerance = 2000, library_tolerance = 2500, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<script>
	function setDropArea(id) {
		$('#selectCADistHid').find('option[value="' + id + '"]').attr(
				'selected', 'selected');
		var skillsSelect = document.getElementById("selectCADistHid");
		var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;
		if (selectedText.trim() == "HK")
			document.getElementById("inlineCARadio3").checked = true;
		else if (selectedText.trim() == "KL")
			document.getElementById("inlineCARadio4").checked = true;
		else
			document.getElementById("inlineCARadio5").checked = true;
	}

	function setDropArea2(id2) {
		$('#selectADistHid').find('option[value="' + id2 + '"]').attr(
				'selected', 'selected');
		var skillsSelect = document.getElementById("selectADistHid");

		var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;
		if (selectedText.trim() == "HK")
			document.getElementById("inlineDeskRadio3").checked = true;
		else if (selectedText.trim() == "KL")
			document.getElementById("inlineDeskRadio4").checked = true;
		else
			document.getElementById("inlineDeskRadio5").checked = true;
	}

	function autofillFields() {

		var chk = $('#checkbox3').val();

		if (chk == "on") {
			var applicantRoom = $('#inputCARoom').val();
			var applicantFloor = $('#inputCAFloor').val();
			var applicantBlock = $('#inputCABlock').val();
			var applicantBuilding = $('#inputCABuilding').val();
			var applicantEstate = $('#inputCAEstate').val();
			var applicantStreetNo = $('#inputCAStreetNo').val();
			var applicantStreetName = $('#inputCAStreetName').val();
			var selectCADist = $('#selectCADist').val();
			/* var applicantAreaCode = $('#applicantArea').checked */

			//alert(applicantAreaCode);
			// Set Values
			$('#inputARoom').val(applicantRoom);
			$('#inputAFloor').val(applicantFloor);
			$('#inputABlock').val(applicantBlock);
			$('#inputABuilding').val(applicantBuilding);
			$('#inputAEstate').val(applicantEstate);
			$('#inputAStreetNo').val(applicantStreetNo);
			$('#inputAStreetName').val(applicantStreetName);
			$('#selectADist').val(selectCADist);

			if (document.getElementById("inlineCARadio3").checked) {
				document.getElementById("inlineDeskRadio31").checked = true;
			} else if (document.getElementById("inlineCARadio4").checked) {
				document.getElementById("inlineDeskRadio41").checked = true;
			} else {
				document.getElementById("inlineDeskRadio51").checked = true;
			}

			if (document.getElementById('inputARoom').readOnly == true)
			{
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
			}
			else
			{	
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
			}
		} else {
						
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

	function applyPromoCode() {
		$.ajax({
			type : 'POST',
			url : 'applyHomePromoCode',
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
			url : "userLogin",
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
				url : "sendEmail",
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
</script>
</head>
<body>
	<!-- Google Tag Manager -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
	</script>
	<!-- End Google Tag Manager-->

	<!--/#main-Content-->
	<section>
		<div class="container">
			<div class="row">
				<form:form name="frmYourDetails" id="frmYourDetails"
					action="prepareUserSummaryForHome" method="post"
					onsubmit="return hc_planValid();" modelAttribute="frmYourDetails">
					<ol class="breadcrumb pad-none">
						<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#">Easy HomeCare </a> <i
							class="fa fa-caret-right"></i></li>
						<li><a href="#">Your options </a></li>
						<li class="active "><i class="fa fa-caret-right"></i> Your
							details</li>
					</ol>
					<div class="container ">
						<div class="col-md-12 shop-tracking-status">
							<div class="center" style="visibility: visible;">
								<h2>Your details</h2>
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
											<span class="status color3">Your Options</span>
											<div class="icon">1</div>
										</div>
										<div
											class="image-order-status image-order-status-intransit  img-circle act second">
											<span class="status color2"> Your Details</span>
											<div class="icon">2</div>
										</div>
										<div
											class="image-order-status image-order-status-delivered  img-circle disabled third">
											<span class="status">Summary & Payment</span>
											<div class="icon">3</div>
										</div>
										<div
											class="image-order-status image-order-status-completed  img-circle disabled fourth">
											<span class="status lst-status">Confirmation</span>
											<div class="icon">4</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="container pad-none bdr ur-opt-content gray-bg3">

						<div
							class="col-lg-7 col-md-7 col-sm-12 col-xs-12 pad-none white-bg1">
							<br>
							<%
								if (authenticate.equals("false")
											|| authenticate.equals("direct")) {
							%>
							<h3 class="margin-left-2 h2-3-existing-fwd-head">Existing
								FWD eServices member?</h3>
							<a href="#"
								class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
								data-toggle="modal" data-target=".bs-example-modal-lg">Login</a>
							<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
								<h3 class="text-left or-continue">
									<span>Or,</span> continue as a guest.
								</h3>
							</div>
							<%
								}
							%>

							<div class="clearfix"></div>
							<div class="gray-bdr"></div>
							<table class="table activation-form margin-left-2 vert-middle-small">
								<tbody>
									<tr>
										<td colspan="2"><h3
												class="black-bold pad-none">Applicant's Details</h3></td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500">Full name</label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputFullName" name="applicantName"
											value="${userDetails.getFullName().trim()}"
											placeholder="Full name" onblur="replaceAlpha(this); chkNotNullApplicantName(this, 'appfullname');"
											onkeypress=" return alphaOnly(event);" maxlength="100" /> <span
											id="appfullname" class="text-red"></span></td>
									</tr>
									<tr>

										<td class=""><select name="apphkidandpassport"
											id="selectHkidPass" class="form-control soflow full-control">
												<option value="appHkid" selected="selected">HKID</option>
												<option value="appPassport">Passport</option>
										</select></td>
										<td class=""><input type="text" name="hkId"
											class="form-control numberinput textUppe full-control" id="txtAppHkid"
											placeholder="X1234567/Passport No"
											onblur="chkValidApplicantHkId(this, 'errAppHkid', 'selectHkidPass');"> <span id="errAppHkid"
											class="text-red"> </span></td>

									</tr>
									<tr>
										<td class=""><label
											class="control-label bold-500">Mobile number</label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputMobileNo" name="mobileNo"
											value="${userDetails.getMobileNo().trim()}"
											placeholder="Mobile number"
											onkeypress="return isNumeric(event)"
											onblur="replaceNumeric(this); chkValidApplicantMobileNo(this, 'errMobileNo');" maxlength="8" /> <span
											id="errMobileNo" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class=""><label
											class="control-label bold-500">Email address</label></td>
										<td class=""><input class="form-control full-control"
											id="inputEmailId" name="emailAddress"
											value="${userDetails.getEmailAddress().trim()}"
											placeholder="Email address" 
											onblur="chkValidApplicantEmail(this, 'errEmailid');" maxlength="50"> <span
											id="errEmailid" class="text-red"> </span></td>
									</tr>
								</tbody>
							</table>
							<%
								if (authenticate.equals("false")
											|| "direct".equalsIgnoreCase(request.getSession()
													.getAttribute("authenticate").toString())) {
							%>


							<div class="gray-bg3-wid">
								<table class="table plandetail-form margin-left-2 vert-middle"
									id="input-white">
									<tbody>
										<tr>
											<td colspan="2" class="">
												<h3 class="pad-none">Create FWD Member Account?</h3> <i>
													Leave blank if you do not want an member account to be
													created </i> <br>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="">&nbsp;</td>
										</tr>
										<tr>
											<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
												class="control-label bold-500">Choose Username</label></td>
											<td class=""><input type="text"
												class="form-control marginbt full-control" id="inputRegUserName"
												placeholder="Username"> <span id="errRegUser"
												class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="control-label bold-500">Choose Password</label></td>
											<td class=""><input type="password"
												class="form-control marginbt full-control" id="inputRegPass"
												placeholder="Password"> <span id="errRegPass"
												class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="control-label bold-500">Confirm Password</label></td>
											<td class=""><input type="password"
												class="form-control marginbt full-control" id="inputRegCPass"
												placeholder="Confirm password"> <span
												id="errRegCPass" class="text-red"> </span></td>
										</tr>
									</tbody>
								</table>
							</div>

							<%
								}
							%>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td rowspan="5"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500">Correspondence Address</label></td>
										<td><input type="text" class="form-control wd2"
											id="inputCARoom" name="applicantRoom" placeholder="Room/Flat"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputCAFloor" name="applicantFloor" placeholder="Floor "
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputCABlock" name="applicantBlock" placeholder="Block"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputCABuilding" name="applicantBuilding"
											placeholder="Building" onblur="replaceAlphaNumeric(this); chkNotNullCABuilding(this, 'errCABuilding');"
											onkeypress="return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCABuilding" class="text-red"> </span></td>
										<td><input type="text" class="form-control full-control"
											id="inputCAEstate" name="applicantEstate"
											placeholder="Estate" onblur="replaceAlphaNumeric(this); chkNotNullCAEstate(this, 'errCAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputCAStreetNo" name="applicantStreetNo"
											placeholder="Street No." onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputCAStreetName" name="applicantStreetName"
											placeholder="Street Name" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" /></td>
									</tr>
									<tr>
										<td colspan="3"><select name="applicantDistrict"
											class="form-control soflow full-control" id="selectCADist"
											onchange="setDropArea(this.value)">
												<option value="">District</option>
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
											</div> <span id="errCADist" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="3"><label class="radio-inline homecare-lb">
												<input type="radio" name="applicantArea" id="inlineCARadio3"
												value="HK" checked="" class="home-input1"> <span>HK
											</span>
										</label> <label class="radio-inline homecare-lb"> <input
												type="radio" name="applicantArea" id="inlineCARadio4"
												value="KL" class="home-input1"> <span> KLN</span>
										</label> <label class="radio-inline"> <input type="radio"
												name="applicantArea" id="inlineCARadio5" value="NT"
												class="home-input1"> <span> NT</span>
										</label></td>
									</tr>
								</tbody>
							</table>
							<div class="clearfix"></div>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="pad-none"><h3 class="black-bold pad-none">
												Address Details</h3></td>
									</tr>
									<tr>
										<td class="pad-none"><div class="checkbox btm-pad-10">
												<input id="checkbox3" type="checkbox"
													onclick="autofillFields()"> <label for="checkbox3">
													Same as applicant's correspondence address<br>
												</label>
											</div></td>
									</tr>
								</tbody>
							</table>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td rowspan="5"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4 pad-none"><label
											class="control-label bold-500">Insured Address</label></td>
										<td colspan="2"><input type="text"
											class="form-control wd2 full-control" id="inputARoom" name="aRoom"
											placeholder="Room/Flat" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control  full-control"
											id="inputAFloor" name="aFloor" placeholder="Floor "
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td><input type="text" class="form-control  full-control"
											id="inputABlock" name="aBlock" placeholder="Block"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputABuilding" name="aBuilding" placeholder="Building"
											onblur="replaceAlphaNumeric(this); chkNotNullIABuilding(this, 'errABuilding');"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /> <span id="errABuilding" class="text-red">
										</span></td>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputAEstate" name="aEstate" placeholder="Estate"
											onblur="replaceAlphaNumeric(this); chkNotNullIAEstate(this, 'errAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputAStreetNo" name="aStreetNo" placeholder="Street No."
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
										<td colspan="2"><input type="text" class="form-control full-control"
											id="inputAStreetName" name="aStreetName"
											placeholder="Street Name" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
									</tr>
									<tr>
										<td colspan="4"><select name="aDistrict"
											class="form-control soflow full-control" id="selectADist"
											onchange="setDropArea2(this.value)">
												<option value="">District</option>
												<%
													List list = (List) request.getAttribute("districtList");
														Iterator itrr = list.iterator();
														while (itrr.hasNext()) {
															DistrictBean districtList = (DistrictBean) itrr.next();
												%>
												<option value="<%=districtList.getCode()%>"><%=districtList.getDescription()%></option>
												<%
													}
												%>
										</select> <!-- <select name="" class="form-control soflow" id="selectAgeRange">
                      <option value="">District</option>
                      <option value="18-70">18-70</option>
                      <option value="71-85">71-85</option>
                    </select> -->

											<div class="hidden">
												<select name="applicantDistrictHid"
													class="form-control soflow" id="selectADistHid">
													<option value="">District</option>
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
											</div></td>
									</tr>
									<tr>
										<td colspan="4"><label class="radio-inline homecare-lb">
												<input type="radio" name="aArea" id="inlineDeskRadio31"
												value="HK" checked="" class="home-input1"> <span>HK
											</span>
										</label> <label class="radio-inline homecare-lb"> <input
												type="radio" name="aArea" id="inlineDeskRadio41" value="KL"
												class="home-input1"> <span> KLN</span>
										</label> <label class="radio-inline"> <input type="radio"
												name="aArea" id="inlineDeskRadio51" value="NT"
												class="home-input1"> <span> NT</span>
										</label></td>
									</tr>
								</tbody>
							</table>
							<div class="clearfix"></div>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "><label
											class="control-label bold-500 home-line">Net Floor
												Area<br> (square feet)
										</label></td>
										<td class="">
											<%--  <select name="" class="form-control soflow" id="selectNFA">
                      <option value="">Please Select</option>
                      <option value="< 500"> Less Than 500</option>
                      <option value="500-700">500-700</option>
                      <option value="701-850">701-850</option>
                      <option value="851-1000">851-1000</option>
                    </select> --%> <select name="netFloorArea"
											class="form-control soflow full-control" id="selectNFA" onBlur="chkNotNullIANetFloorArea(this, 'errNFA');">
												<option value="">Please Select</option>
												<c:forEach var="floorAreaList" items="${mapNetFloorArea}">
													<option value="${floorAreaList.key}"><c:out
															value="${floorAreaList.value}" /></option>
												</c:forEach>

										</select> <span id="errNFA" class="text-red"> </span>
										</td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500 home-line">Effective
												Date of <br> Coverage
										</label></td>
										<td class=""><div class="form-group">
												<div class="input-group date" id="homecareDp">
													<span class="input-group-addon bg-img in"><span><img
															src="resources/images/calender1.png" alt="" /></span></span> <input
														name="effectiveDate" type="text"
														class="datepicker form-control full-control" id="txtEffDate"
														onBlur="chkValidIAEffDate(this, 'errEffDate', 'Effective Date');" />
												</div>
											</div> <span id="errEffDate" class="text-red"></span></td>
									</tr>
								</tbody>
							</table>
							<div class="clearfix"></div>
							<h4 class="h4-2 padding3">Declaration:-</h4>
							<div class="declaration-content">
								<div class="checkbox">
									<input id="checkbox1" name="declarration" type="checkbox">
									<label for="checkbox1"> I have read and understand the
										policy provisions and hereby declare that:- <br> i. <span
										class="margin-left-2"></span> Declare that the particulars are
										true to the best of my knowledge, belief and complete; <br>
										ii. <span class="margin-left-2"></span> Declare the Home is
										constructed from bricks, stone or concrete with concrete roof
										and occupied by me and my family as private dwelling; <br>
										iii. <span class="margin-left-2"></span> Declare that I or my
										family member living with me have not sustained any loss
										during the last three years from any of the risks now proposed
										for insurance; or been refused renewal by any insurer; and<br>
										iv. <span class="margin-left-2"></span> Agree that this
										application shall be the basis of the contract between me and
										FWD.<br>v. <span class="margin-left-2"></span> this Proposal Form
										is applied and signed at HKSAR, in case of fraud or factual
										misrepresentation, the cover for me or for the Insured
										Person(s) may be invalidated.
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox2" name="declarration2" type="checkbox">
									<label for="checkbox2">I have read and understood <a
										href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
										 class="sub-link" target="_blank"> Personal Information Collection
											Statement</a> and agree to be bound by the same. <br> 
									</label>
								</div>
								<hr/>
								<div>
									If you do NOT wish The Company to use Your Personal Data in direct
										marketing or provide Your Personal Data to other persons or
										companies for their use in direct marketing, please tick the
										appropriate box(es) below to exercise
								</div>
								<span id="chk2" class="text-red"></span>
								<div class="checkbox">
									<input id="checkbox33" type="checkbox"
										name="donotWishDirectMarketing"> <label
										for="checkbox33"> Please do not send direct marketing
										information to me. <br> <br>
									</label>
								</div>
								<div class="checkbox">
									<input id="checkbox34" type="checkbox"
										name="donotWishDirectMarketing3"> <label
										for="checkbox34"> Please do not provide my personal
										data to other persons or companies for their use in direct
										marketing. <br>
									</label>
								</div>

							</div>
						</div>
						<%
							HomeQuoteBean homeQuoteDetails = (HomeQuoteBean) request.getAttribute("homeQuoteDetails");%>
						<div
							class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg wht-bg3">
							<div class="hidden-sm hidden-xs">
								<div class="wd2">
									<div class="row">
										<div class="col-md-7 col-lg-8">
											<h2 class="h2-3-choose">${homeQuoteDetails.getPlanCode()}
												Insurance</h2>
											<h4>Plan summary</h4>
										</div>
	
										<div class="col-md-5 col-lg-4 pull-right">
											<div class="text-left pad-right1 h2-2 h2">
												<div class="hk1">HK$</div>
												<div class="hk1 top-mrg-10">
													<div class="flightcare-hk">
														<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%></div>
												</div>
											</div>
										</div>
									</div>
									<%-- <div class="pull-right">
										<div class="text-left pad-right1 h2-2 h2">
											<div class="hk1">
												HK$
												<div class="flightcare-hk">${homeQuoteDetails.getTotalDue()}</div>
											</div>
										</div>
									</div> --%>
								</div>
								<div class="clearfix"></div>
								<div class="orange-bdr"></div>
								<div class="form-container">
									<h3>Plan Type</h3>
									<div class="form-group">
										<p class="h4-5 pad-none">Standard Cover, Annual</p>
									</div>
									<!-- <h3>Promotion code</h3>
									<span class="text-red" id="errPromoCode"></span>
									<div class="form-group">
										<div class="input-group">
											<input type="text" id="promoCode" name="promoCode"
												class="form-control" placeholder="eg.FWD789"> <span
												class="input-group-addon in black-bold"> <span
												class="apply pointer" onclick="applyPromoCode()">APPLY</span>
											</span>
										</div>
									</div>
									<div class="travel-italic">
										<a href="#" class="sub-link" data-toggle="modal"
											data-target=".bs-promo-modal-lg"><i> How do I get a
												promotion code?</i> </a>
									</div> -->
								</div>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">Subtotal</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%>
									</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">Discount</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getDiscountAmount()))%>
								
								</h3>
								<div class="clearfix"></div>
								<div class="orange-bdr"></div>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%>
									</h3>
							</div>
							<input type="hidden" name="totalDue"
								value="${ homeQuoteDetails.getTotalDue()}"> <input
								type="hidden" name="planCode"
								value="${ homeQuoteDetails.getPlanCode()}"> <input
								type="hidden" name="answer1" value="${answer1}"> <input
								type="hidden" name="answer2" value="${answer2}">

							<!--mob-->
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
									<a href="getHomePlan" class="bdr-curve btn btn-primary bck-btn">Back </a>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
									<input type="submit" class="bdr-curve-none btn btn-primary btn-next " value="Next" />
								</div>
							</div>
							<!--
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> 
              <a href="homecare-summary-payment.html" class="bdr-curve btn btn-primary nxt-btn" onclick="return hc_planValid();">
             Next</a> </div> 
             -->


							<div class="clearfix"></div>
							<br>
						</div>
						<div class="clearfix"></div>
					</div>
					<p class="padding1 hidden-sm hidden-xs">
						The features above are indicative only. Please refer to the <a
							class="sub-link"
							href="resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
							target="_blank">Policy Provisions</a> for details. <br> For
						a complete explanation of the terms and conditions, feel free to
						contact an adviser or our 24-hour hotline at 3123 3123 for more
						details.
					</p>
				</form:form>
			</div>
			<!--/.row-->

		</div>
		<!--/.container-->
	</section>

	<!--/end- Main Content-->

	<!--Plan-login-popup-->
	<div class="modal fade bs-example-modal-lg " id="loginpopup"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<form name="popUploginform" id="popUploginform" class="">
					<div class="login-form">
						<%-- <%request.setAttribute("is-flight-plan", "true"); %> --%>
						<div id="login-err-msg" class="alert alert-danger hide">
							<div id="login-err-msg" class="alert alert-danger" role="alert"></div>
						</div>
						<div class="form-container">
							<h2>Log in to FWD</h2>
							<h4>
								Username <a href="forgotUserName" class="pull-right sub-link">Forgot
									username?</a>
							</h4>
							<div class="form-group">
								<input type="text" name="userName" class="form-control"
									placeholder="" id="txtUserName">
							</div>
							<span id="errUserName" style="color: red"></span>
							<h4>
								Password <a href="forgotUserPassword"
									class="pull-right sub-link">Forgot password?</a>
							</h4>
							<div class="form-group">
								<input type="password" class="form-control" name="password"
									id="txtPass">
							</div>
							<span id="errPass" style="color: red"></span> <br>
							<div class="row">
								<div class="text-left col-lg-6 col-md-6">
									<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
										type="button" onclick="return userLoginFnc();" tabindex="3">Log
										In</button>
								</div>
								<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
									<span> New Member?</span><br> <a href="joinus"
										class="sub-link"> Register here</a>
								</h3>
								<div class="clearfix"></div>
							</div>
							<p>For the purpose of purchasing a specified insurance plan
								through this website (“the Plan”), I hereby consent the transfer
								of my personal data from FWD eServices to the issuer of the
								Plan.</p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


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


</body>
</html>