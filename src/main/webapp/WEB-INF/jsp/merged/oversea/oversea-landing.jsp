<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
function prepareOverseaPlan(form){
	var result = false;
	var method = "<%=request.getContextPath()%>/ajax/oversea/prepareOverseaQuote";
	$.ajax({
		type : "POST",
		url : method,
		async : false,
		success : function(data) {
			if (data == "success") {
				form.action = "<%=request.getContextPath()%>/${language}/oversea-insurance/quote";
				result = true;
			} else {
				console.log(data);
				result = false;
			}
		}
	});
	return result;
}
</script>

<section id="main-slider" class="no-margin"> 
  <!--Mobilebanner--> 
  <img src="<%=request.getContextPath()%>/resources/images/slider/oversea_en_m.jpg" alt="FWD Travel Insurance Hong Kong" class="img-responsive hidden-lg hidden-md">
  <!--Mobilebanner-->
<div class="carousel slide hidden-xs hidden-sm">
<div class="col-lg-12 col-md-12 breadcrumb-wrapper">
	 <ol class="breadcrumb container pad-none"> 
			<li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer1'>Home</key></a></li>
			<i class="fa fa-chevron-right"></i>
			<li><a href="#"><key id='Overseas.Landing.Breadcrumb.layer2'>Protect</key></a></li>
			<i class="fa fa-chevron-right"></i>
			<li class="active"><key id='Overseas.Landing.Breadcrumb.layer3'>StudyCare Insurance</key></li>
	 </ol>
</div> 
<div class="carousel-inner">
<div class="item active">
<!--/#middle-->
        <img src="<%=request.getContextPath()%>/resources/images/slider/oversea_en.jpg" alt="FWD Travel Insurance Hong Kong">
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div> 
  <!--/.carousel--> 
	<section id="middle" class="banner-overlay-wrapper">
		<div class="oversea-middle" style="background:none;">
			<form name="frmOverseaGetQuote" id="frmOverseaGetQuote" commandname="frmOverseaGetQuote" method="post" onsubmit="return prepareOverseaPlan(this);">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-md-12 slide-form workingholiday-text-align-center">
							<table class="table activation-form3">
								<tbody>
									<tr>  
										<td align="center" class="col-md-2 pad-none">
											<button style="height:70px;" type="submit" class="border-radius cta-btn btn btn-primary get-btn ">Get Quote</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div> 
				</div>
			</form>	
			<div class="product-download-wrapper col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<h4 class="product_landing_download_button divider">
					<a href="/<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Brochure.pdf" target="_blank">Download brochure</a>
				</h4>
				<h4 class="product_landing_download_button">
					<a id="travel_provision_button" href="/<%=request.getContextPath()%>/resources/policy-provisions-pdf/Overseas_StudyCare_Provisions.pdf" target="_blank" style="">Download policy provisions</a>
				</h4>
			</div>
			<div class="clearfix"></div>
		</div> 					
	    <div class="banner-message-wrapper row">
		<p class="container banner-message"><key id='Overseas.Landing.H1'>Overseas StudyCare provides you or your children with comprehensive protection while studying in foreign countries. Included coverage for Medical Expenses, Worldwide Emergency Services, Personal Accident, Major Burns, Personal Liability, Cancellation and Curtailment of Trip and Education Fund.</key></p>
	    </div>
	    <!--/.row--> 
	</section>
	<!--</form>-->
</section>

<section id="feature"  class="hidden-sm hidden-xs" style="margin-top:40px;">		
    <div id="oversea_feature" class="oversea_feature" style="display: block;">
	    <div class="container center wow fadeInDown" style="visibility: hidden; animation-name: none;">
	        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	            <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                <div>
						  <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<key id='Overseas.Landing.USP.TopUp'>Top up<br/>In-patient Medical</key>
						  </h3>
						  <div style="margin-top:25px;">
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon1.png">
						  </div>
						  <div class="ups-message-wrapper">
							   <key id='Overseas.Landing.USP.TopUp.Copy'>Top-up In-Patient Medical Expenses providing extra benefits on top of your other medical policy, up to HK$2,000,000.</key>
						  </div>
	                  </div>
	            </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                   <div>
						  <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<key id='Overseas.Landing.USP.Education'>Education<br/>Fund</key>
						  </h3>
						  <div style="margin-top:25px;">
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon2.png">
						  </div>
						  <div class="ups-message-wrapper">
								<key id='Overseas.Landing.USP.Education.Copy'>Education Fund to provide for unpaid Tuition Fees if tragedy strikes your family, in the event of the death of the parent or legal guardian of the Insured Student</key>
						  </div>
	                  </div>
	              </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                  <div>
	                       <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<key id='Overseas.Landing.USP.Leisure'>Leisure + Amateur<br/>Spoarts Coverage</key>
	                      </h3>
	                      <div style="margin-top:25px;">
	                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon3.png">
	                      </div>
	                      <div class="ups-message-wrapper">
	                          <key id='Overseas.Landing.USP.Leisure.Copy'>Cover for leisure and amateur sports activities during your study including winter sports, bungee jumping, hiking, rock climbing, horse riding, scuba diving and other water sports.</key>
	                      </div>
	                  </div>
	              </div>
	              <div class="clearfix"></div>
	          </div>
	          <div class="clearfix"></div>
	      </div>
      </div>
      <div class="clearfix"></div>
   </div>
</section>

<section id="feature"  class="hidden-lg hidden-md" style="margin-top:40px;">		
    <div id="oversea_feature_mob" class="oversea_feature_mob" style="display: block;">
	    <div class="container center wow fadeInDown" style="visibility: hidden; animation-name: none;">
	        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	            <div class="col-xs-12 col-sm-12 col-md-4 landing-feature-item-wrapper pad-none" style="padding:5px !important;">
	                <div>
					  <div class="col-xs-4 col-sm-4 oversea-landing-feature-image">
	                       <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon1_mob.png">
	                  </div>
					  <div class="col-xs-8 col-sm-8 landing-feature-text-wrapper">
						  <h3 class="landing-feature-title single-line" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<key id='Overseas.Landing.USP.TopUp'>Top up<br/>In-patient Medical</key>
						  </h3>
						  <div class="ups-message-wrapper">
							   <key id='Overseas.Landing.USP.TopUp.Copy'>Top-up In-Patient Medical Expenses providing extra benefits on top of your other medical policy, up to HK$2,000,000.</key>
						  </div>
					  </div>
	                </div>
	            </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 landing-feature-item-wrapper pad-none" style="padding:5px !important;">
	                   <div>
						  <div class="col-xs-4 col-sm-4 oversea-landing-feature-image">
							   <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon2_mob.png">
						  </div>
						  <div class="col-xs-8 col-sm-8 landing-feature-text-wrapper">
							  <h3 class="landing-feature-title single-line" style="font-weight: bold; color:black; margin-top:45px;">
									<key id='Overseas.Landing.USP.Education'>Education Fund</key>
							  </h3>
							  <div class="ups-message-wrapper">
									<key id='Overseas.Landing.USP.Education.Copy'>Education Fund to provide for unpaid Tuition Fees if tragedy strikes your family, in the event of the death of the parent or legal guardian of the Insured Student</key>
							  </div>
						  </div>
	                  </div>
	              </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                  <div>
							<div class="col-xs-4 col-sm-4 oversea-landing-feature-image">
							   <img style="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon3_mob.png">
							</div>
							<div class="col-xs-8 col-sm-8 landing-feature-text-wrapper">
								<h3 class="landing-feature-title single-line" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
									<key id='Overseas.Landing.USP.Leisure'>Leisure + Amateur<br/>Spoarts Coverage</key>
								</h3>
								<div class="ups-message-wrapper">
								  <key id='Overseas.Landing.USP.Leisure.Copy'>Cover for leisure and amateur sports activities during your study including winter sports, bungee jumping, hiking, rock climbing, horse riding, scuba diving and other water sports.</key>
								</div>
						  </div>
	                  </div>
	              </div>
	              <div class="clearfix"></div>
	          </div>
	          <div class="clearfix"></div>
	      </div>
      </div>
      <div class="clearfix"></div>
   </div>
</section>
      
<div style="background-color:#F2F3F5;text-align:center;padding-top: 20px;padding-bottom: 20px;">
    <div class="container pad-none">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top:40px;">
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon1.png">
                <h5><key id='Overseas.Landing.Coverage.24hours'>24 hours<br/>Worldwide Assistance</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon1.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.24hours'>24 hours Worldwide Assistance</key></div>
                    <div class="col-xs-12 hidden-content-p"><key id='Overseas.Landing.Coverage.24hours.hover'>Provide our 24 hours Worldwide Emergency Assistance Services including telephone medical advice, emergency travel assistance or legal referral etc. </key></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon2.png">
                <h5><key id='Overseas.Landing.Coverage.Medical'>Medical + Personal<br/>Accident</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon2.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.Medical'>Medical + Personal Accident</key></div>
                    <div class="col-xs-12 hidden-content-p"><p><key id='Overseas.Landing.Coverage.Medical.hover'>Provide worldwide  cover for Medical and Personal Accident benefits.</key></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon3.png">
                <h5><key id='Overseas.Landing.Coverage.Personal'>Personal<br/>Liability</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon3.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.Personal'>Personal Liability</key></div>
                    <div class="col-xs-12 hidden-content-p"><p>"<key id='Overseas.Landing.Coverage.Personal.hover'>Indemnity against third party legal liability arising as a result of accidental injury or loss or damage to third party’s property during the Period of Insurance.</key>"</p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon4.png">
                <h5><key id='Overseas.Landing.Coverage.Act'>Act of<br/>Terroism</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon4.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.Act'>Act of Terroism</key></div>
                    <div class="col-xs-12 hidden-content-p"><p><key id='Overseas.Landing.Coverage.Act.hover'>Cover for personal accident and medical related claims caused by act of terrorism</key></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon5.png">
                <h5><key id='Overseas.Landing.Coverage.Kidnapping'>Kidnapping</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon5.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.Kidnapping'>Kidnapping</key></div>
                    <div class="col-xs-12 hidden-content-p"><p><key id='Overseas.Landing.Coverage.Kidnapping.hover'>Provide compassionate visit and hotel accommodation for 2 family members; and compassionate death benefit for the insured student for a kidnapping incident.</key></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon6.png">
                <h5><key id='Overseas.Landing.Coverage.Lifelong'>Life-long<br/>education</key></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon6.png"></div>
                    <div class="col-xs-12 hidden-content-title"><key id='Overseas.Landing.Coverage.Lifelong'>Life-long education</key></div>
                    <div class="col-xs-12 hidden-content-p"><p><key id='Overseas.Landing.Coverage.Lifelong.hover'>Covers your Overseas Study from secondary school to life-long education</key></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<section style="margin-top:40px;margin-bottom:40px;">
  <div class="container">
<div class="other-benefits col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none">
  <h2 class="oversea-sponsor-header"><key id='Overseas.Landing.Other'>Other benefits</key></h2>
  <ul class="bullets oversea-bullets pad-none">
	<li class="sponsor-wrapper col-lg-6 col-md-6 hidden-xs hidden-sm pad-none">
		<!--Refer to key ID Overseas.Landing.Other.Benefit1.Logo for alt value-->
		<img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="Agoda" class="" style="margin-right:15px;">
		<p class="h4-5"><key id='Overseas.Landing.Other.Benefit1'>Enjoy 8% discount on all travel products upon successful registration of FWD online membership.</key></p>
    </li>
	<li class="sponsor-wrapper col-lg-6 col-md-6 hidden-xs hidden-sm pad-none">
		<!--Refer to key ID Overseas.Landing.Other.Benefit2.Logo for alt value-->
		<img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="Y5Buddy" class="" style="margin-right:15px;">
		<p class="h4-5"><key id='Overseas.Landing.Other.Benefit2'>15% off pocket wifi retal</key></p>  
    </li>
	<li class="clearfix"></li>
  </ul>
  
  <div class="col-lg-12 col-md-12 hidden-xs hidden-sm main-partner pad-none" style="">
  </div>
  <div class="hidden-lg hidden-md col-xs-12 col-sm-12 main-partner mob" style="text-align:center">
    <div class="col-md-6 col-xs-6">
        <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-bottom:15px;">
		<p class="h4-5"><key id='Overseas.Landing.Other.Benefit1'>Enjoy 8% discount on all travel products upon successful registration of FWD online membership.</key></p>
    </div>
    <div class="col-md-6 col-xs-6">
        <img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="" class="" style="margin-bottom:15px;">
		<p class="h4-5"><key id='Overseas.Landing.Other.Benefit2'>15% off pocket wifi retal</key></p> 
    </div>
  </div>
  <div class="spacer3"></div>
        <p class="h4-6"><key id='Overseas.Landing.Disclaimer'>For a complete explanation of the terms and conditions, feel free to contact our 24-hour hotline at 3123 3123.</key></p>
</div>


<!--/.container-->
</div>
</section>
<!--/#feature-->
<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="">
            <h1><key id='Overseas.Landing.Platformpillar1.headline'>Here when you need us</key></h1>
              <p><key id='Overseas.Landing.Platformpillar1.copy'>Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank"><u>eServices App</u></a> ensures you get the support you need, when you need it.</key></p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center claim-pillar-wrapper">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/claim.png" alt="">
            <h1><key id='Overseas.Landing.Platformpillar2.headline'>Claims<br/>Procedure</key></h1>
            <p><key id='Overseas.Landing.Platformpillar2.copy'>Notice of any claim must be given to the company within 31 days of the expiry of this policy. In any event not later than 14 days after the incident giving rise to such a claim.</key></p>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="">
            <h1><key id='Overseas.Landing.Platformpillar3.headline'>Rewards<br/>& benefits</key></h1>
            <p><key id='Overseas.Landing.Platformpillar3.copy'>We continue to find you great rewards and benefits that let you get more from your insurance - discounts on future insurance, special offers from partners and more.</key></p>
            <!--<img src="<%=request.getContextPath()%>/resources/images/agoda-logo.png" alt=""/>--> </div>
        </div>
      </div>
    </div>
    <!--End Desktop Support--> 
    <!--/.row-->
    <p><key id='Overseas.Landing.Disclaimer'>For a complete explanation of the terms and conditions, feel free to contact our 24-hour hotline at 3123 3123.</key></p>
    <div class="clearfix"></div>
  </div>
  <!--/.container--> 
</section>
<!--/#recent-works-->

<section id="recent-works-mob" class="hidden-lg hidden-md">
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="">
				  <h2><key id='Overseas.Landing.Platformpillar1.headline'>Here when you<br/>need us</key></h2>
				  <p><key id='Overseas.Landing.Platformpillar1.copy'>Our 24x7 call centre support, 5 drop-in locations across Hong Kong and our <a href="http://www.fwd.com.hk/en-US/fwd-n-you/e_services_app.html" target="_blank"><u>eServices App</u></a> ensures you get the support you need, when you need it.</key></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/claim.png" alt=""> 
				<h2><key id='Overseas.Landing.Platformpillar2.headline'>Claims<br/>Procedure</key></h2>
				<p><key id='Overseas.Landing.Platformpillar2.copy'>Notice of any claim must be given to the company within 31 days of the expiry of this policy. In any event not later than 14 days after the incident giving rise to such a claim.</key></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""> 
				<h2><key id='Overseas.Landing.Platformpillar3.headline'>Rewards<br/>& benefits</key></h2>
				<p><key id='Overseas.Landing.Platformpillar3.copy'>We continue to find you great rewards and benefits that let you get more from your insurance - discounts on future insurance, special offers from partners and more.</key></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>

  <link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>