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
<link rel="stylesheet" type="text/css" href="../resources/cx/css/all.css" />
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
			    url:'../cx/action',     
			    type:'get',     
			    data:{    
			    	"flight_num":$("input[name='flight']").val(),
			    	"step":"get_flight"
		   		},     
			    error:function(){       
			    },     
			    success:function(data){
				    if (data.errorMsg == null) {
				    	window.location = "cx/step2";  
					} else {
						$(".error-message").html("Invalid Flight Number");
					}
			    }
			});
	    });
	});
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
                            <li><a href="#" target="_top">中</a></li>
                        </ul>
                    </div>
                </div>
                <div class="logo-wrap">
                    <a href="/">
                        <img class="logo" src="../resources/cx/images/mobile_logo.png" alt="" />
                    </a>
                </div>
            </div>
       </div>               
   </div>
</header>
    
        <div class="container main">
            <div class="hero" style="background-image: url('../resources/cx/images/header-image.jpg');">
                <div class="shadow"></div>
                <div class="text-wrap">
                    <h1>Free Wi-Fi from FWD</h1>
                    <p>Get free Wi-Fi for the entire flight now. (Up to 120MB)</p>
                </div>
            </div>                
            <div class="content-box flight">
                <p>
                    To get online <i>and</i> receive one of our discount vouchers simply fill out the form and grab it now!  We have limited quantity so get a move on!
                </p>
                <form id="flight_number" method="post">
                   <ul>
                       <li>
                           <input id="flight" type="text" name="flight" class="" data-validate="required script symbol whitespace" />
                           <span class="sp icon"></span>
                           <label class="placeholder" for="flight">Current Flight Number</label>
                           <label class="error-message" for="flight">Error Message</label>                                   
                       </li>
                   </ul>  
                   <div class="small">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </div>
                   <div id="submit" class="btn primary">GET STARTED</div>                          
                </form>                        
            </div>
            <div class="row-space"></div>
            <div class="content-box intro">
                <h2>About FWD</h2>
                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                </p>
                <h2>About iFWD</h2>
                <p>
                   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                </p>
            </div>
            <div class="row-space"></div>
            <div class="row-space"></div>
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
<script src="../resources/cx/js/plugins.js"></script>
<script src="../resources/cx/js/all.js"></script>
		
	</body>
</html>
