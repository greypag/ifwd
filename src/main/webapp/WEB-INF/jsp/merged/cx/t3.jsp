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
<meta name="description" content="description" />
<meta name="title" content="title" />
<meta name="format-detection" content="telephone=no">
<meta property="og:title" content="og title" />
<meta property="og:image" content="og  image" />
<meta property="og:description" content="og description" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">	
	$(document).ready(function () {
		$("#submit").on('click', function(){
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
	    });
	});
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
                            <li><a href="#" target="_top">中</a></li>
                        </ul>
                    </div>
                </div>
                <div class="logo-wrap">
                    <a href="/">
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
                        <h2>Tell us about yourself</h2>
                        <div class="small">
                            Registered just now but <a href="#" class="link">lost your voucher code</a>?
                            <br/>
                            Already friends? Existing members <a href="login" class="link">sign in</a> here                                
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
                                    <label class="placeholder" for="name">Full Name</label>
                                    <label class="error-message" for="name">Please enter your Name.</label>
                                </li>
                                <li>
                                    <input id="mobile" type="tel" name="mobile" data-validate="required script phone" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="mobile">Mobile No.</label>
                                    <label class="error-message" for="mobile">Please enter a valid Mobile No.</label>
                                </li>
                                <li>
                                    <input id="email" type="email" name="email" data-validate="required script email" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="email">Email address</label>
                                    <label class="error-message" for="email">Please enter your Email Address.</label>
                                </li>
                                <li>
                                    <input id="username" type="text" name="username" data-validate="required script username" />
                                    <span class="sp icon"></span>
                                    <label class="placeholder" for="username">User Name</label>
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
                                    <label class="placeholder" for="password_confirm">Confirm Password</label>
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
                                                I have read and understood Personal Information Collection Statement and agree to be bound by the same. By submitting my email address I agree to receive FWD's promotion code and other offers in the future.
                                            </label>
                                            <label class="error-message" for="agreement">Please read and agree the statement.</label>

                                        </li>
                                    </ul>


                            </div>
                            <div id="submit" class="btn primary">Give Me Wi-Fi !!!</div>                        
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
                    <li><a href="#" target="">Online Security</a></li>
                    <li><a href="#" target="">Disclaimer</a></li>
                    <li><a href="#" target="">Personal Data</a></li>
                    <li><a href="#" target="">Protection Policy and Practices</a></li>
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
