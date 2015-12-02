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
			<li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer1" bundle="${msg}" /></a></li>
			<i class="fa fa-chevron-right"></i>
			<li><a href="#"><fmt:message key="Overseas.Landing.Breadcrumb.layer2" bundle="${msg}" /></a></li>
			<i class="fa fa-chevron-right"></i>
			<li class="active"><fmt:message key="Overseas.Landing.Breadcrumb.layer3" bundle="${msg}" /></li>
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
											<button style="height:70px;" type="submit" class="oversea-cta border-radius cta-btn btn btn-primary get-btn ">Get Quote</button>
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
		<p class="container banner-message"><fmt:message key="Overseas.Landing.H1" bundle="${msg}" /></p>
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
								<fmt:message key="Overseas.Landing.USP.TopUp" bundle="${msg}" />
						  </h3>
						  <div style="margin-top:25px;">
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon1.png">
						  </div>
						  <div class="ups-message-wrapper">
							   <fmt:message key="Overseas.Landing.USP.TopUp.Copy" bundle="${msg}" />
						  </div>
	                  </div>
	            </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                   <div>
						  <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<fmt:message key="Overseas.Landing.USP.Education" bundle="${msg}" />
						  </h3>
						  <div style="margin-top:25px;">
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon2.png">
						  </div>
						  <div class="ups-message-wrapper">
								<fmt:message key="Overseas.Landing.USP.Education.Copy" bundle="${msg}" />
						  </div>
	                  </div>
	              </div>
	              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	                  <div>
	                       <h3 class="landing-feature-title" style="font-weight: bold; color:black; margin-top:45px; line-height:35px; height: 80px;">
								<fmt:message key="Overseas.Landing.USP.Leisure" bundle="${msg}" />
	                      </h3>
	                      <div style="margin-top:25px;">
	                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/big_icon3.png">
	                      </div>
	                      <div class="ups-message-wrapper">
	                          <fmt:message key="Overseas.Landing.USP.Leisure.Copy" bundle="${msg}" />
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
								<fmt:message key="Overseas.Landing.USP.TopUp" bundle="${msg}" />
						  </h3>
						  <div class="ups-message-wrapper">
							   <fmt:message key="Overseas.Landing.USP.TopUp.Copy" bundle="${msg}" />
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
									<fmt:message key="Overseas.Landing.USP.Education" bundle="${msg}" />
							  </h3>
							  <div class="ups-message-wrapper">
									<fmt:message key="Overseas.Landing.USP.Education.Copy" bundle="${msg}" />
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
									<fmt:message key="Overseas.Landing.USP.Leisure" bundle="${msg}" />
								</h3>
								<div class="ups-message-wrapper">
								  <fmt:message key="Overseas.Landing.USP.Leisure.Copy" bundle="${msg}" />
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
                <h5><fmt:message key="Overseas.Landing.Coverage.24hours" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon1.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.24hours" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><fmt:message key="Overseas.Landing.Coverage.24hours.hover" bundle="${msg}" /></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon2.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Medical" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon2.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Medical" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Medical.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon3.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Personal" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon3.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Personal" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p>"<fmt:message key="Overseas.Landing.Coverage.Personal.hover" bundle="${msg}" />"</p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon4.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Act" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon4.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Act" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Act.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon5.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Kidnapping" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon5.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Kidnapping" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Kidnapping.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 annualTravel_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/icon6.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Lifelong" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/icon6.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Lifelong" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Lifelong.hover" bundle="${msg}" /></p></div>
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
  <h2 class="oversea-sponsor-header"><fmt:message key="Overseas.Landing.Other" bundle="${msg}" /></h2>
  <ul class="bullets oversea-bullets pad-none">
	<li class="sponsor-wrapper col-lg-6 col-md-6 hidden-xs hidden-sm pad-none">
		<!--Refer to key ID Overseas.Landing.Other.Benefit1.Logo for alt value-->
		<img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="Agoda" class="" style="margin-right:15px;">
		<p class="h4-5"><fmt:message key="Overseas.Landing.Other.Benefit1" bundle="${msg}" /></p>
    </li>
	<li class="sponsor-wrapper col-lg-6 col-md-6 hidden-xs hidden-sm pad-none">
		<!--Refer to key ID Overseas.Landing.Other.Benefit2.Logo for alt value-->
		<img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="Y5Buddy" class="" style="margin-right:15px;">
		<p class="h4-5"><fmt:message key="Overseas.Landing.Other.Benefit2" bundle="${msg}" /></p>  
    </li>
	<li class="clearfix"></li>
  </ul>
  
  <div class="col-lg-12 col-md-12 hidden-xs hidden-sm main-partner pad-none" style="">
  </div>
  <div class="hidden-lg hidden-md col-xs-12 col-sm-12 main-partner mob" style="text-align:center">
    <div class="col-md-6 col-xs-6">
        <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-bottom:15px;">
		<p class="h4-5"><fmt:message key="Overseas.Landing.Other.Benefit1" bundle="${msg}" /></p>
    </div>
    <div class="col-md-6 col-xs-6">
        <img src="<%=request.getContextPath()%>/resources/images/partner_y5.png" alt="" class="" style="margin-bottom:15px;">
		<p class="h4-5"><fmt:message key="Overseas.Landing.Other.Benefit2" bundle="${msg}" /></p> 
    </div>
  </div>
  <div class="spacer3"></div>
        <p class="h4-6"><fmt:message key="Overseas.Landing.Disclaimer" bundle="${msg}" /></p>
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
            <h1><fmt:message key="Overseas.Landing.Platformpillar1.headline" bundle="${msg}" /></h1>
              <p><fmt:message key="Overseas.Landing.Platformpillar1.copy" bundle="${msg}" /></p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center claim-pillar-wrapper">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/claim.png" alt="">
            <h1><fmt:message key="Overseas.Landing.Platformpillar2.headline" bundle="${msg}" /></h1>
            <p><fmt:message key="Overseas.Landing.Platformpillar2.copy" bundle="${msg}" /></p>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="">
            <h1><fmt:message key="Overseas.Landing.Platformpillar3.headline" bundle="${msg}" /></h1>
            <p><fmt:message key="Overseas.Landing.Platformpillar3.copy" bundle="${msg}" /></p>
            <!--<img src="<%=request.getContextPath()%>/resources/images/agoda-logo.png" alt=""/>--> </div>
        </div>
      </div>
    </div>
    <!--End Desktop Support--> 
    <!--/.row-->
    <div class="clearfix"></div>
  </div>
  <!--/.container--> 
</section>
<!--Desktop Disclaimer--> 
<section class="hidden-xs hidden-sm">
    <div class="bottom-disclaimer-wrapper container">
        <p class="h4-6"><fmt:message key="Overseas.Landing.Disclaimer" bundle="${msg}" /></p>
    </div>
</section>
<!--End of Desktop Disclaimer-->     
<!--/#recent-works-->
<section id="recent-works-mob" class="hidden-lg hidden-md">
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner pillar-here-height"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="">
				  <h2><fmt:message key="Overseas.Landing.Platformpillar1.headline" bundle="${msg}" /></h2>
				  <p><fmt:message key="Overseas.Landing.Platformpillar1.copy" bundle="${msg}" /></p>
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
				<h2><fmt:message key="Overseas.Landing.Platformpillar2.headline" bundle="${msg}" /></h2>
				<p><fmt:message key="Overseas.Landing.Platformpillar2.copy" bundle="${msg}" /></p>
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
				<h2><fmt:message key="Overseas.Landing.Platformpillar3.headline" bundle="${msg}" /></h2>
				<p><fmt:message key="Overseas.Landing.Platformpillar3.copy" bundle="${msg}" /></p>
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
<section class="hidden-lg hidden-md">
    <div class="bottom-disclaimer-wrapper container">
        <p class="h4-6"><fmt:message key="Overseas.Landing.Disclaimer" bundle="${msg}" /></p>
    </div>
</section>
  <link href="<%=request.getContextPath()%>/resources/css/oversea.css" rel="stylesheet">
  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>