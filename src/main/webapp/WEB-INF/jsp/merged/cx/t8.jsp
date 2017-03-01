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
	<script src="../../resources/js/vendor/jquery.min.js"></script>
	<script type="text/javascript">	
	$(document).ready(function () {
		$("#submit").on('click', function(){
			$.ajax({     
			    url:'../../cx/action',     
			    type:'get',     
			    data:{    
			    	"flightNumber":$("input[name='flight']").val(),
			    	"step":"login"
		   		},     
			    error:function(){       
			    },     
			    success:function(data){
				    if (data.errorMsg == null) {
				    	window.location = "step4";  
					} else {
					}				    
			    }
			});
	    });
	});
	</script>        
	</head>
	<body class="en t8">
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
            
        <div class="container main">
            <div class="content-box">
                <h2>GET STARTED</h2>    
            </div> 
            <form id="personal_info" method="post">                           
                <ul>                           
                    <li>
                        <input id="username" type="text" name="username" class="" data-validate="required script username" />
                        <span class="sp icon"></span>
                        <label class="placeholder" for="username">User Name</label>
                        <label class="error-message" for="username">Username must be between 6 and 50 characters.</label>
                    </li>
                    <li>
                        <input id="password" type="password" name="password" class="" data-validate="required script password" />
                        <span class="sp icon"></span>
                        <label class="placeholder" for="password">Password</label>
                        <label class="error-message" for="password">Password must be at least 8 characters and alphanumeric (both upper AND lower cases).</label>
                    </li>
                </ul> 
                <div class="content-box">
                    <div id="submit" class="btn primary">Login</div> 
                </div>
            </form>
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
