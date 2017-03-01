<!DOCTYPE html>
<!--[if lt IE 7]><html class="ie ie6 lte9 lte8 lte7 no-js"><![endif]-->
<!--[if IE 7]><html class="ie ie7 lte9 lte8 lte7 no-js"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8 no-js"><![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9 no-js"><![endif]-->
<!--[if gt IE 9]><html class="no-js"><![endif]-->
<!--[if !IE]><!--><html class="no-js"><!--<![endif]-->
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />

<title>iFWD CX</title>
<link rel="shortcut icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../../resources/cx/css/all.css" />
<meta name="robots" content="noindex">
<meta name="description" content="description" />
<meta name="title" content="title" />
<meta name="format-detection" content="telephone=no">
<meta property="og:title" content="og title" />
<meta property="og:image" content="og  image" />
<meta property="og:description" content="og description" />

	<script src="../../resources/js/vendor/jquery.min.js"></script>
	<script type="text/javascript">	
	$(document).ready(function () {
		
        //$("#submit").on('click', function(){
		//	$.ajax({     
		//	    url:'../../cx/action',     
		//	    type:'get',     
		//	    data:{    
		//	    	"name":$("input[name='name']").val(),
		//	    	"email":$("input[name='email']").val(),
		//	    	"mobile":$("input[name='mobile']").val(),
		//	    	"username":$("input[name='username']").val(),
		//	    	"password":$("input[name='password']").val(),
		//	    	"step":"register"
		//   		},     
		//	    error:function(){       
		//	    },     
		//	    success:function(data){
		//	    	window.location.href='step4';  
		//	    }
		//	});
	    //});
	});

    function submitAction(){
        $.ajax({     
            url:'../../cx/action',     
            type:'get',     
            data:{    
                "name":$("input[name='name']").val(),
                "email":$("input[name='email']").val(),
                "mobile":$("input[name='mobile']").val(),
                "username":$("input[name='username']").val(),
                "password":$("input[name='password']").val(),
                "step":"register"
            },     
            error:function(){       
            },     
            success:function(data){
                window.location.href='step4';  
            }
        });
    }

	</script>        
	</head>
	<body class="en t3">
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
                    <a href="/cx/en">
                        <img class="logo" src="../../resources/cx/images/mobile_logo.png" alt="" />
                    </a>
                </div>
            </div>
       </div>               
   </div>
</header>
            
        <div class="main">
            <div class="full-width-container">
                <div class="container">
                    <div class="content-box">
                        <h2>Something about you</h2>
                        <div class="small">
                            Existing members<a href="login" class="link"> sign in </a> here
                            <br>
                            Please ensure you use a valid email address to allow you to re-login should your connection drops.
                        </div>   
                    </div>                      
                </div>    
                <form id="personal_info" method="post">
                    <div class="gray-box">
                        <div class="container">                            
                            <ul>
                                <li>
                                    <input id="name" type="text" name="name" data-validate="required script symbol" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="name">Full Name (same as your HKID / Passport)</label>
                                    <label class="error-message" for="name">Please enter your Name.</label>
                                </li>
                                <li>
                                    <input id="mobile" type="tel" name="mobile" data-validate="required script phone" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="mobile">Mobile Number</label>
                                    <label class="error-message" for="mobile">Please enter a valid Mobile No.</label>
                                </li>
                                <li>
                                    <input id="email" type="email" name="email" data-validate="required script email" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="email">Email Address</label>
                                    <label class="error-message" for="email">Please enter your Email Address.</label>
                                </li>
                                <li>
                                    <input id="username" type="text" name="username" data-validate="required script username" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="username">Username</label>
                                    <label class="error-message" for="username">Username must be between 6 and 50 characters.</label>
                                </li>
                                <li>
                                    <input id="password" type="password" name="password" data-validate="required script password" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="password">Password</label>
                                    <label class="error-message" for="password">Password must be at least 8 characters and alphanumeric (both upper AND lower cases).</label>
                                </li>
                                <li>
                                    <input id="password_confirm" type="password" name="password_confirm" data-validate="required script confirm_password" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="password_confirm">Confirm password</label>
                                    <label class="error-message" for="password_confirm">Please Confirm Password.</label>
                                </li>
                            </ul>    
                        </div>                        
                    </div>
                    <div class="container">
                        <div class="content-box">
                            <div class="small declaration">

                                    Declaration:
                                    <ul>
                                        <li>
                                            <input id="agreement" type="checkbox" name="agreement" data-validate="checkbox" value="Agree" />
                                            <label for="agreement" class="sp">
                                                I have read and understood <a class="link" href="https://www.fwd.com.hk/~/media/Files/FWDHK/pdf/others/fwd-online-member-en.pdf?la=en" target="_blank">Personal Information Collection Statement</a> and agree to be bound by the same.<br>By submitting my personal information above I agree to receive FWD's WIFI Service Voucher Code, promotion code and other FWD offers in the future.
                                            </label>
                                            <label class="error-message margin-top-40" for="agreement">Please read and agree the statement.</label>

                                        </li>
                                    </ul>


                            </div>
                            <div id="submit" class="btn primary">GIVE ME WI-FI</div>                        
                        </div>   
                    </div> 
                </form>            
            </div>
        </div>
        <footer> 
    <div class="container">
        <div class="corp-links">
            <ul class="nav">
                <li><a href="http://www.fwd.com.hk" target="_target">FWD Home</a></li>
                <li><a href="http://blog.fwd.com.hk" target="_target">FWD Blog</a></li>
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
<script src="../../resources/cx/js/plugins.js"></script>
<script src="../../resources/cx/js/all.js"></script>
		
	</body>
</html>
