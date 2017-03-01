<!DOCTYPE html>
<!--[if lt IE 7]><html class="ie ie6 lte9 lte8 lte7 no-js"><![endif]-->
<!--[if IE 7]><html class="ie ie7 lte9 lte8 lte7 no-js"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8 no-js"><![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9 no-js"><![endif]-->
<!--[if gt IE 9]><html class="no-js"><![endif]-->
<!--[if !IE]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<title>iFWD CX</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="../resources/cx/css/all.css" />
<meta name="robots" content="noindex">
<meta name="description" content="description" />
<meta name="title" content="iFWD CX" />
<meta name="format-detection" content="telephone=no">
<meta property="og:title" content="og title" />
<meta property="og:image" content="og  image" />
<meta property="og:description" content="og description" />
<script
	src="../resources/js/vendor/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {        
		//$("#submit").on('click', function() {
		//	$.ajax({
		//		url : '../cx/action',
		//		type : 'get',
		//		data : {
		//			"flight_num" : $("input[name='flight']").val(),
		//			"step" : "get_flight"
		//		},
		//		error : function() {
		//		},
		//		success : function(data) {
		//			if (data.errorMsg == null) {
		//				window.location = "en/step2";
		//			} else {
		//				$(".error-message").html("Invalid Flight Number");
		//			}
		//		}
		//	});
		//});
	});

    function submitAction(){
        $.ajax({
            url : '../cx/action',
            type : 'get',
            data : {
                "flight_num" : $("input[name='flight']").val().toUpperCase(),
                "step" : "get_flight"
            },
            error : function() {
                $(".error-message").html("Invalid Flight Number");
                $('#flight_number li').removeClass('ok').addClass('error');
                $('#submit').removeClass('disabled');
            },
            success : function(data) {
                if (data.errorMsg == null) {
                    window.location = "en/step2";
                } else {
                    $(".error-message").html("Invalid Flight Number");
                    $('#flight_number li').removeClass('ok').addClass('error');
                    $('#submit').removeClass('disabled');
                }
            }
        });
    }
</script>
</head>

<body class="en t1">
	<header>
		<div class="full-width-container">
			<div class="container">
				<div class="top-nav">
					<div class="float-right">
						<div class="language">
							<ul class="nav">
								<li><a class="active" href="#" target="_top">EN</a></li>
							</ul>
						</div>
					</div>
					<div class="logo-wrap">
						<a href="/cx/en"> <img class="logo"
							src="../resources/cx/images/mobile_logo.png" alt="" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container main">
		<div class="hero"
			style="background-image: url('../resources/cx/images/header-image.jpg');">
			<div class="shadow"></div>
			<div class="text-wrap">
				<h1>FREE Wi-Fi from FWD</h1>
				<p>Get 1-hour free Wi-Fi for this flight now!</p>
			</div>
		</div>
		<div class="content-box flight">
			<p>To 1) get online and 2) receive one of our discount vouchers,
				simply fill out the form and grab them now!</p>
			<p>We have limited quantity so get a move on!</p>
			<form id="flight_number" method="post">
				<ul>
					<li><input id="flight" type="text" name="flight" class=""
						data-validate="required script symbol whitespace" /> <span
						class="sp icon"></span> <label class="placeholder" for="flight">Flight
							number </label> <label class="error-message" for="flight">Please enter a flight number.</label></li>
				</ul>
				<div class="small">I agree the Free Wi-fi Terms & Conditions</div>
				<div id="submit" class="btn primary">GET STARTED</div>
			</form>
		</div>
		<div class="row-space"></div>
		<div class="content-box intro">
			<h2>About FWD Hong Kong & Macau</h2>
			<p>FWD Group's businesses span Hong Kong & Macau, Thailand,
				Indonesia and the Philippines. In Hong Kong, FWD offers life and
				medical insurance, employee benefits, pension, and general
				insurance. The life insurance and general insurance operating
				entities have been assigned strong financial strength ratings by
				international rating agencies - FWD Life Insurance Company
				(Bermuda) Limited is rated "A3" by Moody's and "A" by Fitch; and FWD
				General Insurance Company Limited is rated "A" by Fitch.</p>
			<p>FWD is focused on creating fresh customer experiences, with
				easy-to-understand products, supported by leading digital
				technologies. Through this customer-led approach, FWD will achieve
				its vision to become the leading pan-Asian insurer that changes the
				way people feel about insurance.</p>
			<p>Established in Asia in 2013, FWD is the insurance business arm
				of investment group, Pacific Century Group.</p>
			<p>
				For more information please visit <a class="link"
					href="www.fwd.com.hk" target="_blank">WWW.FWD.COM.HK</a>.
			</p>
		</div>
		<div class="row-space"></div>
		<div class="row-space"></div>
	</div>
	<footer>
		<div class="container">
			<div class="corp-links">
				<ul class="nav">
					<li><a href="http://www.fwd.com.hk" target="_target">FWD
							Home</a></li>
					<li><a href="http://blog.fwd.com.hk" target="_target">FWD
							Blog</a></li>
				</ul>
			</div>
		</div>
		<div class="full-width-container">
			<div class="container">
				<div class="copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/en/online-security" target="_blank">Online Security</a></li>
                        <li><a href="https://www.fwd.com.hk/en/disclaimer" target="_blank">Disclaimer</a></li>
                        <li><a href="https://www.fwd.com.hk/en/personal-data-protection-policy-and-practices" target="_blank">Personal Data Protection Policy and Practices</a></li>
					</ul>


					<p>&copy; Copyright 2016 FWD Hong Kong. All rights reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- static JS lib, should be compiled into 1 single JS -->
	<script src="../resources/cx/js/plugins.js"></script>
	<script src="../resources/cx/js/all.js"></script>

</body>
</html>
