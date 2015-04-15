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
<title>Home User Details | FWD Hong Kong</title>
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
	$('#selectCADistHid').find('option[value="' + id + '"]').attr('selected', 'selected');
	var skillsSelect = document.getElementById("selectCADistHid");
	var selectedText = skillsSelect.options[skillsSelect.selectedIndex].text;
	
	/*if(selectedText.trim() == 'District'){
		$('#errCADist').html(getBundle(getBundleLanguage, "insured.address.netFloorArea.notNull.message"));
	}
	else*/ 
	if (selectedText.trim() == "HK")
		document.getElementById("inlineCARadio3").checked = true;
	else if (selectedText.trim() == "KL")
		document.getElementById("inlineCARadio4").checked = true;
	else
		document.getElementById("inlineCARadio5").checked = true;
	
	
}

function setDropArea2(id2) {
	$('#selectADistHid').find('option[value="' + id2 + '"]').attr('selected', 'selected');
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

			if(applicantBuilding.trim() != ''){
				$('#errABuilding').html('');
			}else{
				$('#errABuilding').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.building.notNull.message"));
			}
			
			$('#inputAEstate').val(applicantEstate);
			
			if(applicantEstate.trim() != ''){
				$('#errAEstate').html('');
			}else{
				$('#errAEstate').html(getBundle(getBundleLanguage, "homecare.correspondingAddress.estate.notNull.message"));
			}
			
			$('#inputAStreetNo').val(applicantStreetNo);
			$('#inputAStreetName').val(applicantStreetName);

			$('#selectADist').val(selectCADist);

			
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
		<div id="cn" class="container">
			<div class="row">
				<form:form name="frmYourDetails" id="frmYourDetails"
					action="prepareUserSummaryForHome" method="post"
					onsubmit="return hc_planValid();" modelAttribute="frmYourDetails">
					<ol class="breadcrumb pad-none">
						<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#">家居保險 </a> <i class="fa fa-caret-right"></i></li>
						<li><a href="#">您的選擇 </a></li>
						<li class="active "><i class="fa fa-caret-right"></i> 您的保單</li>
					</ol>
					<div class="container ">
						<div class="col-md-12 shop-tracking-status">
							<div class="center wow fadeInDown animated"
								style="visibility: visible;">
								<h2>您的保單</h2>
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
											<span class="status color3">您的選擇</span>
											<div class="icon">1</div>
										</div>

										<div
											class="image-order-status image-order-status-intransit  img-circle act second">
											<span class="status color2">您的保單</span>
											<div class="icon">2</div>
										</div>
										<div
											class="image-order-status image-order-status-delivered  img-circle disabled third">
											<span class="status"> 總結及付款</span>
											<div class="icon">3</div>
										</div>
										<div
											class="image-order-status image-order-status-completed  img-circle disabled fourth">
											<span class="status lst-status">確認保單</span>
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
							if (authenticate.equals("false") || authenticate.equals("direct")) {
						%>
							<h3 class="margin-left-2 h2-3-existing-fwd-head">是否FWD
								eServices現有會員？</h3>
							<a href="#"
								class="col-lg-5 col-md-5 col-sm-5 col-xs-5 btn-box-2 margin-left-2 color4"
								data-toggle="modal" data-target=".bs-example-modal-lg">登入</a>

							<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-left">
								<h3 class="btn-box-3 text-left">
									<span>or</span> 或以訪客身份登記
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
												class="black-bold pad-none">申請人資料</h3></td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500">中文全名</label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputFullName" name="applicantName"
											value="${userDetails.getFullName().trim()}"
											placeholder="中文全名" onblur="replaceAlpha(this); chkNotNullApplicantName(this, 'appfullname');"
											onkeypress="    return alphaOnly(event);" maxlength="100" />
											<span id="appfullname" class="text-red"></span></td>
									</tr>
									<!-- <tr>
                  <td  class="pad-none"><label  class="control-label bold-500">香港身份證號碼</label></td>
                  <td class="pad-none"><input type="text" class="form-control numberinput" id="txtAppHkid"  name="hkId" placeholder="X123456(7)" maxlength="20" >
                    <span id="errAppHkid" class="text-red"> </span></td>
                </tr> -->
									<tr>


										<td class=""><select name="apphkidandpassport"
											id="selectHkidPass" class="form-control soflow full-control">
												<option value="appHkid" selected="selected">香港身份證號碼</option>
												<option value="appPassport">護照</option>
										</select></td>
										<td class=""><input type="text" name="hkId"
											class="form-control numberinput textUpper full-control" id="txtAppHkid"
											placeholder="X1234567/Passport No" onblur="chkValidApplicantHkId(this, 'errAppHkid', 'selectHkidPass');"> <span id="errAppHkid"
											class="text-red"> </span></td>
									</tr>

									<tr>
										<td class=""><label
											class="control-label bold-500">手提電話</label></td>
										<td class=""><input type="text"
											class="form-control full-control" id="inputMobileNo" name="mobileNo"
											value="${userDetails.getMobileNo().trim()}"
											placeholder="手提電話" onkeypress="return isNumeric(event)"
											onblur="replaceNumeric(this); chkValidApplicantMobileNo(this, 'errMobileNo');" maxlength="8" /> <span
											id="errMobileNo" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class=""><label
											class="control-label bold-500">電郵地址</label></td>
										<td class=""><input class="form-control full-control"
											id="inputEmailId" name="emailAddress"
											value="${userDetails.getEmailAddress().trim()}"
											placeholder="電郵地址" onblur="chkValidApplicantEmail(this, 'errEmailid');" maxlength="50"> <span
											id="errEmailid" class="text-red"> </span></td>
									</tr>
								</tbody>
							</table>
							<%
							if (authenticate.equals("false") || "direct".equalsIgnoreCase(request.getSession().getAttribute("authenticate").toString())) {
						%>
							<div class="gray-bg3-wid">
								<table class="table plandetail-form margin-left-2 vert-middle"
									id="input-white">
									<tbody>
										<tr>
											<td colspan="2" class=""><h3 class="pad-none">建立富衛帳戶?
												</h3> <i>如不需要建立戶口，請留空此欄</i> <br></td>
										</tr>
										<tr>
											<td colspan="2" class="">&nbsp;</td>
										</tr>
										<tr>
											<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
												class="control-label bold-500">用戶名稱</label></td>
											<td class=""><input type="text"
												class="form-control full-control" id="inputRegUserName"
												placeholder="用戶名稱"> <span id="errRegUserName"
												class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="control-label bold-500">個人密碼</label></td>
											<td class=""><input type="password"
												class="form-control full-control" id="inputRegPass" placeholder="個人密碼">
												<span id="errRegPass" class="text-red"> </span></td>
										</tr>
										<tr>
											<td class=""><label
												class="control-label bold-500">確認密碼</label></td>
											<td class=""><input type="password"
												class="form-control full-control" id="inputRegCPass" placeholder="確認密碼">
												<span id="errRegCPass" class="text-red"> </span></td>
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
										<td width="88" rowspan="5" valign="top"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											for="inputFullName" class="control-label bold-500">通訊地址
										</label></td>
										<td width="33%" height="54" colspan="2"><input
											type="text" class="form-control wd2 full-control" id="inputCARoom"
											name="applicantRoom" placeholder="室"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control full-control "
											id="inputCAFloor" name="applicantFloor" placeholder="樓 "
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td><input type="text" class="form-control  full-control"
											id="inputCABlock" name="applicantBlock" placeholder="座"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputCABuilding"
											name="applicantBuilding" placeholder="大廈"
											onblur="replaceAlphaNumeric(this); chkNotNullCABuilding(this, 'errCABuilding');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCABuilding" class="text-red"> </span></td>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputCAEstate"
											name="applicantEstate" placeholder="屋苑"
											onblur="replaceAlphaNumeric(this); chkNotNullCAEstate(this, 'errCAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errCAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputCAStreetNo"
											name="applicantStreetNo" placeholder="街道號碼"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" />
										</td>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputCAStreetName"
											name="applicantStreetName" placeholder="街道名稱"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />

										</td>
									</tr>
									<tr>
										<td height="60" colspan="4"><select name="applicantDistrict"
											class="form-control soflow full-control" id="selectCADist">
												<option value="">地區</option>
												<%
                      List lst= (List)request.getAttribute("districtList");
                      Iterator itr = lst.iterator();int i=1;
						while (itr.hasNext()) {
							DistrictBean districtList = (DistrictBean) itr.next();
                %>
												<option value="<%=districtList.getCode()%>"><%=districtList.getDescription() %></option>
												<%} %>
										</select> <span id="errCADist" class="text-red"> </span></td>
									</tr>
									<tr>
										<td height="60" colspan="4"><label
											class="radio-inline homecare-lb"> <input type="radio"
												name="applicantArea" id="inlineCARadio3" value="HK"
												checked="" class="home-input1"> <span>香港 </span></label> <label
											class="radio-inline homecare-lb"> <input type="radio"
												name="applicantArea" id="inlineDeskRadio4" value="KLN"
												class="home-input1"> <span>九龍</span>
										</label> <label class="radio-inline"> <input type="radio"
												name="applicantArea" id="inlineDeskRadio5" value="NT"
												class="home-input1"> <span>新界</span>
										</label></td>
									</tr>
								</tbody>
							</table>
							<div class="clearfix"></div>

							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td colspan="2" class=""><h3
												class="black-bold pad-none">Address Details</h3></td>
									</tr>

									<tr>
										<td class="">
											<div class="checkbox">

												<input id="checkbox3" type="checkbox"
													onclick="autofillFields()"> <label for="checkbox3">
													與申請人通訊地址相同<br>
												</label>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
							<table class="table activation-form margin-left-2">
								<tbody>
									<tr>
										<td width="88" rowspan="5" valign="top"
											class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500">通訊地址 </label></td>
										<td width="33%" height="54" colspan="2"><input
											type="text" class="form-control wd2 full-control" id="inputARoom"
											name="aRoom" placeholder="室"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="10" /></td>
										<td><input type="text" class="form-control full-control"
											id="inputAFloor" name="aFloor" placeholder="樓"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
										<td><input type="text" class="form-control full-control "
											id="inputABlock" name="aBlock" placeholder="座"
											onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);" maxlength="5" /></td>
									</tr>
									<tr>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputABuilding" name="aBuilding"
											placeholder="大廈" onchange="replaceAlphaNumeric(this); chkNotNullIABuilding(this, 'errABuilding');"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /> <span id="errABuilding" class="text-red">
										</span></td>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputAEstate" name="aEstate"
											placeholder="屋苑" onblur="replaceAlphaNumeric(this); chkNotNullIAEstate(this, 'errAEstate');"
											onkeypress="    return isAlphaNumeric(event);" maxlength="50" />
											<span id="errAEstate" class="text-red"> </span></td>
									</tr>
									<tr>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputAStreetNo" name="aStreetNo"
											placeholder="街道號碼" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
										<td height="60" colspan="2"><input type="text"
											class="form-control full-control" id="inputAStreetName" name="aStreetName"
											placeholder="街道名稱" onblur="replaceAlphaNumeric(this);"
											onkeypress="    return isAlphaNumeric(event);"
											maxlength="100" /></td>
									</tr>
									<tr>
										<td height="60" colspan="4">
										
										<select onchange="setDropArea2(this.value)" id="selectADist" class="form-control soflow full-control" name="aDistrict">
										
												<option value="">地區</option>
												<%
                      List list= (List)request.getAttribute("districtList");
                      Iterator itrr = list.iterator();
						while (itrr.hasNext()) {
							DistrictBean districtList = (DistrictBean) itrr.next();
                %>
												<option value="<%=districtList.getCode()%>"><%=districtList.getDescription() %></option>
												<%} %>
										</select></td>
									</tr>
									<tr>
										<td height="60" colspan="4"><label
											class="radio-inline homecare-lb"> <input type="radio"
												name="aArea" id="inlineDeskRadio31" value="HK" checked=""
												class="home-input1"> <span>香港</span></label> <label
											class="radio-inline homecare-lb"> <input type="radio"
												name="aArea" id="inlineDeskRadio41" value="KLN"
												class="home-input1"> <span>九龍</span>
										</label> <label class="radio-inline"> <input type="radio"
												name="aArea" id="inlineDeskRadio51" value="NT"
												class="home-input1"> <span>新界</span></label></td>
									</tr>
								</tbody>
							</table>

							<div class="clearfix"></div>

							<table class="table activation-form margin-left-2">
								<tbody>

									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500 home-line">實用面積(平方尺)</label></td>
										<td ><select name="netFloorArea"
											class="form-control soflow full-control full-control" id="selectNFA" onChange="chkNotNullIANetFloorArea(this, 'errNFA');">
												<option value="">Please Select</option>
												<c:forEach var="floorAreaList" items="${mapNetFloorArea}">
													<option value="${floorAreaList.key}">
														<c:out value="${floorAreaList.value}" /></option>
												</c:forEach>

										</select> <span id="errNFA" class="text-red"> </span></td>
									</tr>
									<tr>
										<td class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><label
											class="control-label bold-500 home-line">保單生效日期 </label></td>
										<td class="">
											<div class="form-group full-control">
												<div class="input-group date" id="homecareDp">
													<span class="input-group-addon bg-img in border-radius"><span><img
															src="resources/images/calender1.png" alt="" /></span></span> <input
														name="effectiveDate" type="text"
														class="datepicker form-control border-radius" id="txtEffDate" />
												</div>
											</div> <span id="errEffDate" class="text-red"></span>
									</tr>


								</tbody>
							</table>

							<div class="clearfix"></div>
							<h4 class="h4-2 padding3">本人（等）在此聲明:-</h4>
							<div class="declaration-content">
								<div class="checkbox">
									<input id="checkbox1" type="checkbox" name="declarration">
									<label for="checkbox1">本人在此:- <br> i. <span
										class="margin-left-2"></span> 聲明上列資料及本人所知一切據實填報 ；<br> ii.
										<span class="margin-left-2"></span> 聲明投保之居所以磚塊、
										石塊或混凝土建成及有以混凝土蓋成之屋頂，並為本人及本人的家庭成員之私人住所；<br> iii. <span
										class="margin-left-2"></span>
										聲明本人或同住家人在過去三年內未曾就有關保險計劃列明的保障範圍蒙受損失；或曾被拒絕續保；及 <br> iv. <span
										class="margin-left-2"></span> 同意此申請書及聲明將構成本人與富衛之間的合約根據。
									</label>
								</div>
								<span id="chk1" class="text-red"></span>
								<br/>
								<div class="checkbox">
									<input id="checkbox2" type="checkbox" name="declarration2">
									<label for="checkbox2">本人已參閱及明白 <a href="resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf" target="_blank">"收集個人資料聲明"</a>，並同意接受其約束。
									</label>
								</div>
								<span id="chk2" class="text-red"></span>
								<hr>
								<div>
									若閣下不希望本公司使用閣下的個人資料，或將閣下的個人資料提供予其他人士或公司作直接促銷用途，請剔以下有關方格，藉以行使閣下不同意此項安排的權利。
								</div>
								
								<div class="checkbox">
									<input id="checkbox3" type="checkbox" name="readAndUnderstood">
									<label for="checkbox3"> 請不要將直接促銷資料發給本人。
 <br>

									</label>
								</div>
								
								
								
								
								

								<div class="checkbox">
									<input id="checkbox4" type="checkbox"
										name="donotWishDirectMarketing"> <label
										for="checkbox4">
										請不要將本人的個人資料提供予其他人士或公司作其直接促銷用途。
										<br> <br>
									</label>
								</div>
							</div>
						</div>
						<%
							HomeQuoteBean homeQuoteDetails = (HomeQuoteBean) request.getAttribute("homeQuoteDetails");%>
						
						<div
							class="col-lg-5 col-md-5 col-sm-12 col-xs-12  gray-bg pad-none wht-bg3">

							<div class="hidden-sm hidden-xs">

								<div class="wd2">
										<div class="col-md-7 col-lg-7">
											<h2 class="h2-3-choose pad-none">${homeQuoteDetails.getPlanCode()}
											保</h2>
											<h4 class="pad-none">計劃慨覽</h4>
										</div>
										<div class="col-md-5 col-lg-5 pull-right">
											<h2 class="text-left  h2-2  pad-none">
												<div class="home-hk text-right-imp" style="margin: 0">
													港幣
													<div class="flightcare-hk text-right-imp"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%></div>
												</div>
											</h2>
										</div>
								</div>
								<div class="clearfix"></div>
								<div class="orange-bdr"></div>
								<div class="form-container">




									<h3>計劃類型</h3>
									<div class="form-group">
										<p class="h4-5 pad-none">基本保障，年度</p>
									</div>

									<h3>優惠代碼</h3>
									<!-- <div class="form-group">
										<span class="input-group-addon1"><span class="apply">使用</span></span>
                <input type="text" class="form-control placeholder-fl" value="eg.FWD30" readonly placeholder="eg.FWD789">
										<span class="text-red" id="errPromoCode"></span> <input
											type="text" id="promoCode" name="promoCode"
											class="form-control" placeholder="eg.FWD789"> <span
											class="input-group-addon in black-bold"> <input
											type="button" name="Apply" value="APPLY"
											onclick="applyPromoCode()">
										</span>


									</div> 
									<div class="travel-italic">
										<a href="#" class="sub-link" data-toggle="modal"
											data-target=".bs-promo-modal-lg"><i> 如何取得優惠代碼？</i></a>
									</div>
									-->
								</div>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">小計</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
									<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%></h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">折扣優惠</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"><%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getDiscountAmount()))%>
								</h3>
								<div class="clearfix"></div>
								<div class="orange-bdr"></div>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6">所需保費</h3>
								<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right">
									<%=String.format("%.2f",Double.parseDouble(homeQuoteDetails.getTotalDue()))%></h3>

							</div>
							<input type="hidden" name="totalDue"
								value="${ homeQuoteDetails.getTotalDue()}"> <input
								type="hidden" name="planCode"
								value="${ homeQuoteDetails.getPlanCode()}"> <input
								type="hidden" name="answer1" value="${answer1}"> <input
								type="hidden" name="answer2" value="${answer2}">

							<!--mob--->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="#" onclick="BackMe();"
									class="bdr-curve btn btn-primary bck-btn">上一頁 </a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<input type="submit" class="bdr-curve btn btn-primary btn-next"
									onclick="return hc_planValid();" value="下一頁">
							</div>
							<div class="clearfix"></div>
							<br>
						</div>
						<div class="clearfix"></div>
					</div>
					<p class="padding1 hidden-sm hidden-xs">以上資料只作參考用途。詳情請查看<a href="<%=request.getContextPath()%>/resources/policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf" target="_blank">保單條款</a>。
						有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123 3123與客戶服務主任聯絡。</p>
				</form:form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->

	</section>

	<!--/end- Main Content-->


	<!------Plan-login-popup-->
	<div class="modal fade bs-example-modal-lg " tabindex="-1"
		role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form">
					<div class="form-container">
						  <h2>登入富衛客戶網上服務</h2>
						<h4>
							用戶名稱 <a href="forgotUserName"
								class="pull-right sub-link">忘記用戶名稱?</a>
						</h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								id="txtPopUserName">
						</div>
						<span id="errPopUserName" class="text-red"></span>
						<h4>
							密碼 <a href="forgotUserPassword" class="pull-right sub-link">忘記密碼?</a>
						</h4>
						<div class="form-group">
							<input type="password" class="form-control" id="txtPopUserPass">
						</div>
						  <span id="errPass" class="text-red"></span> <br>
				          <div class="row">
									<div class="text-left col-lg-6 col-md-6">
										<button class="bdr-curve-none btn btn-primary btn-lg  wd5"
											type="button" onclick="return userLoginFnc();" tabindex="3">登入</button>
									</div>
									<h3 class="text-left col-lg-6 col-md-6 pad-none margin-none">
										<span> 新用戶?</span><br> <a href="joinus"
											class="sub-link">請註冊 </a>
									</h3>
									<div class="clearfix"></div>
						 </div>

						<p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!--Get promotion code popup-->
	<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
		aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form:form name="frmGetPromoCode" id="frmGetPromoCode">
						<div class="form-container">
							<h2>Get promotion code</h2>
							<h4>Email</h4>
							<div class="form-group">
								<input type="text" class="form-control" placeholder=""
									id="emailToSendPromoCode">
							</div>
							<span id="errPromoEmail" class="text-red"></span> <br>

							<div class="row">
								<div class="col-lg-6 col-md-6">
									<input type="button" value="Submit"
										class="bdr-curve btn btn-primary btn-lg wd5"
										onclick=" GetPromoCode()">
									<!--<a class="bdr-curve btn btn-primary btn-lg wd5" href="#" onclick="return get_promo_val()">Submit</a>-->
								</div>
								<div class="col-md-2">
									<br>
								</div>
								<div class="col-lg-4 col-md-4">
									<a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5"
										href="#" data-dismiss="modal">Close</a>
								</div>
								<br> <br>
								<p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<!--/ Get promotion code popup-->
	
	<script>
	
	
	function BackMe() {
		window.history.back();
	}
	</script>
</body>
</html>








