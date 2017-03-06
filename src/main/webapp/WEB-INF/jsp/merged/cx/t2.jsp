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
		$("#submit").on('click', function(){
			$.ajax({     
			    url:'../../cx/action',     
			    type:'get',     
			    data:{    
			    	"discount":$("input[name='discount']").val(),
			    	"step":"get_promo"
		   		},     
			    error:function(){       
			    },     
			    success:function(data){
				    if (data.errorMsg == null) {
				    	window.location = "step3";  
					}
			    }
			});
	    });
	});
	</script>        
	</head>
	<body class="en t2">
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
    
        <div class="container main">
            <div class="content-box">
                <h2>Pick a voucher</h2>
                <p>
                    Get ready to live with FWD! Select one of our great offers below – 
                </p>
                <div class="small">
                    you are under no obligation to purchase! We promise :)                               
                </div>  
                <form class="discount-wrap">
                    <div class="discount-headline">Please choose one</div>
                    <div class="discount-all">
                        <div class="col-space"></div>
                        <div class="discount">
                            <div id="discount_1_img" class="image-wrap" style="background-image: url('../../resources/cx/images/discount-travel.png');">
                                <div class="input-wrap">
                                    <input id="discount_1" type="radio" name="discount" data-validate="" value="discount_1" />
                                    <label for="discount_1"><span class="sp icon"></span><span class="title">Free 4-day Travel insurance</span></label>
                                    <span class="more">More ></span>
                                </div>   
                                <div class="shadow"></div>                                     
                            </div>
                            <div class="content-box">                                      
                                <ul>
                                    <li>4-days single trip travel plan</li>
                                    <li>Original price: HK$135 (Plan B)</li>
                                    <li>Valid for one individual</li>
                                    <li>Covers medical expenses, baggage loss/damage, personal liability etc.</li>
                                    <li>Please refer to full Terms & Conditions.</li>
                                </ul>                                        
                            </div>
                            <div class="line"></div>
                        </div>
                        <div class="col-space"></div>
                        <div class="discount">
                            <div id="discount_2_img" class="image-wrap" style="background-image: url('../../resources/cx/images/discount-travel2.png');">
                                <div class="input-wrap">
                                    <input id="discount_2" type="radio" name="discount" data-validate="" value="discount_2" />
                                    <label for="discount_2"><span class="sp icon"></span><span class="title">Annual Travel insurance 80% off (now HK$260)</span></label>
                                    <span class="more">More ></span>
                                </div>  
                                <div class="shadow"></div>                                      
                            </div>
                            <div class="content-box">                                   
                                <ul>
                                    <li>Original price: HK$1,300 (Plan B)</li>
                                    <li>Valid for one individual</li>
                                    <li>Year-round coverage up to 90 days per trip</li>
                                    <li>Covers medical expenses, baggage loss/damage, personal liability etc.</li>
                                    <li>Please refer to full Terms & Conditions.</li>
                                </ul>
                            </div>
                            <div class="line"></div>
                        </div>
                        <div class="col-space"></div>
                        <div class="discount">
                            <div id="discount_3_img" class="image-wrap" style="background-image: url('../../resources/cx/images/discount-home.png');">
                                <div class="input-wrap">
                                    <input id="discount_3" type="radio" name="discount" data-validate="" value="discount_3" />
                                    <label for="discount_3"><span class="sp icon"></span><span class="title">Home insurance 50% off (now HK$210)</span></label>
                                    <span class="more">More ></span>
                                </div>      
                                <div class="shadow"></div>                                  
                            </div>
                            <div class="content-box">
                                <ul>
                                    <li>Original price: HK$420</li>
                                    <li>Applicable to any home below a net floor area of 1,000 sq. ft., aged not more than 35 years and situated in a building which is at least 5-storeys high</li>
                                    <li>Covers up to HK$500,000 household contents, alternative accommodation of up to HK$1,000 per day / HK$50,000 per year and up to HK$5,000,000 personal liability</li>
                                    <li>Please refer to full Terms & Conditions.</li>
                                </ul>                                        
                            </div>
                        </div>
                        <div class="col-space"></div>
                    </div>
                    <div id="submit" class="btn primary next disabled">Next</div>
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
