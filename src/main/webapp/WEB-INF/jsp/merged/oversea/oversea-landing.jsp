<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");

});

function hover2div(obj){
	$(obj).children("div .hidden-content").css('display','block');
	$(obj).children("div .block-content").css('display','none');
}
function mouseout2div(obj) {
	$(obj).children("div .hidden-content").css('display','none');
	$(obj).children("div .block-content").css('display','block');
}

	function prepareOverseaPlan(form) {
		var result = false;
		var method = "<%=request.getContextPath()%>/ajax/oversea/prepareOverseaQuote";
	$.ajax({
		type : "POST",
		url : method,
		async : false,
		success : function(data) {
			if (data == "success") {
				form.action = "<%=request.getContextPath()%>/${language}/overseas-study-insurance/plan-options";
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

<section id="main-slider" class="p_oversea no-margin"> 
  <!--Mobilebanner--> 
  <img src="<%=request.getContextPath()%>/<fmt:message key="oversea.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="Overseas.Landing.Hero.Image.Alt" bundle="${msg}" />" class="img-responsive hidden-lg hidden-md">
  <div class="tagline-holder hidden-lg hidden-md">
      <img src="<%=request.getContextPath()%>/<fmt:message key="oversea.hero.tagline" bundle="${msg}" />" class="img-responsive">
  </div>

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
        <img src="<%=request.getContextPath()%>/<fmt:message key="oversea.hero.image" bundle="${msg}" />" alt="<fmt:message key="Overseas.Landing.Hero.Image.Alt" bundle="${msg}" />">
         </div>
      <!--/.item--> 
    </div>
    <!--/.carousel inner--> 
  </div> 
  <div class="tagline-holder hidden-xs hidden-sm">
      <img src="<%=request.getContextPath()%>/<fmt:message key="oversea.hero.tagline" bundle="${msg}" />" class="img-responsive">
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
											<button type="submit" class="oversea-cta border-radius cta-btn btn btn-primary get-btn "><fmt:message key="Overseas.Landing.GetQuote" bundle="${msg}" /></button>
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
					<a href="<%=request.getContextPath()%>/<fmt:message key="Overseas.Brochure.Download.URL" bundle="${msg}" />" target="_blank"><fmt:message key="Overseas.Brochure.Download.title" bundle="${msg}" /></a>
				</h4>
				<h4 class="product_landing_download_button">
					<a id="travel_provision_button" href="https://home.fwd.com.hk/gidoc/policyprovisions/Overseas_StudyCare_JacketLatest.pdf" target="_blank" style=""><fmt:message key="Overseas.Provisions.Download.title" bundle="${msg}" /></a>
				</h4>
				
			</div>
			<div class="clearfix"></div>
		</div> 					
	    <div class="banner-message-wrapper row hidden-xs hidden-sm">
		<p class="container banner-message"><fmt:message key="Overseas.Landing.H1" bundle="${msg}" /></p>
	    </div>
	    <!--/.row--> 
	</section>
	<!--</form>-->
</section>
<div class="banner-message-wrapper hidden-lg hidden-md">
	<p class="container banner-message"><fmt:message key="Overseas.Landing.H1" bundle="${msg}" /></p>
</div>


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
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_medical-250.png">
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
							   <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_edu-250.png">
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
	                           <img style="max-width:40%" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_sport-250.png">
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
	                       <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_medical-250.png">
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
							   <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_edu-250.png">
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
							   <img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_sport-250.png">
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
        <h2><fmt:message key="Overseas.Landing.Coverage" bundle="${msg}" /></h2>
        <h4><strong></strong></h4>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-top:40px;">
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_24hr.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.24hours" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_24hr.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.24hours" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><fmt:message key="Overseas.Landing.Coverage.24hours.hover" bundle="${msg}" /></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_medical_personal.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Medical" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_medical_personal.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Medical" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Medical.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_liability.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Personal" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_liability.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Personal" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Personal.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_terrorist.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Act" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_terrorist.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Act" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Act.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_kidnapping.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Kidnapping" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_kidnapping.png"></div>
                    <div class="col-xs-12 hidden-content-title"><fmt:message key="Overseas.Landing.Coverage.Kidnapping" bundle="${msg}" /></div>
                    <div class="col-xs-12 hidden-content-p"><p><fmt:message key="Overseas.Landing.Coverage.Kidnapping.hover" bundle="${msg}" /></p></div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 oversea_policy_item">
                <img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_life-edu.png">
                <h5><fmt:message key="Overseas.Landing.Coverage.Lifelong" bundle="${msg}" /></h5>
                <div class="hidden-content">
                    <div class="col-xs-12 hidden-md hidden-lg"><img src="<%=request.getContextPath()%>/resources/images/oversea/landing/icon_life-edu.png"></div>
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
                  <p><fmt:message key="Overseas.Landing.Platformpillar1.copy1" bundle="${msg}" /> <a href="<fmt:message key="Overseas.Landing.Platformpillar1.textlink1.url" bundle="${msg}" />"> <fmt:message key="Overseas.Landing.Platformpillar1.copy2" bundle="${msg}" /> </a> <fmt:message key="Overseas.Landing.Platformpillar1.copy3" bundle="${msg}" /></p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center claim-pillar-wrapper">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/claim_pillar.png" alt="">
            <h1><fmt:message key="Overseas.Landing.Platformpillar2.headline" bundle="${msg}" /></h1>
            <p><fmt:message key="Overseas.Landing.Platformpillar2.copy" bundle="${msg}" /></p>
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
            <div class="recent-work-wrap text-center recent-work-fixed-height">
              <div class="recent-work-inner pillar-here-height"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt="">
				  <h2><fmt:message key="Overseas.Landing.Platformpillar1.headline" bundle="${msg}" /></h2>
				  <!-- <p><fmt:message key="Overseas.Landing.Platformpillar1.copy" bundle="${msg}" /></p>-->
				  <p><fmt:message key="Overseas.Landing.Platformpillar1.copy1" bundle="${msg}" /> <a href="<fmt:message key="Overseas.Landing.Platformpillar1.textlink1.url" bundle="${msg}" />"> <fmt:message key="Overseas.Landing.Platformpillar1.copy2" bundle="${msg}" /> </a> <fmt:message key="Overseas.Landing.Platformpillar1.copy3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div class="container">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center recent-work-fixed-height">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/claim_pillar.png" alt=""> 
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
            <div class="recent-work-wrap text-center recent-work-fixed-height">
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
<style>
   @media screen and (max-width: 991px) {
   body {
      /* Hero image Position Fix*/
      padding-top: 95px;
   }
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/oversea.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    if(isMobile){
        $(".oversea_policy_item").click(function(){
            var html=$(this).children('.hidden-content').children().clone();
            $("#modal_policy_container").html(html);
            $("#policyCoveragePopup").modal("show");
        });
    }
});
</script>
<div class="modal fade bs-example-modal-lg  in" id="policyCoveragePopup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content plan-modal">
        <div class="modal-body">
            <a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true" style="font-size:30px;">×</span></a>
            <div id="modal_policy_container" style="padding-top: 10px;text-align: center;">
            </div>
      </div>
    </div>
  </div>
</div>