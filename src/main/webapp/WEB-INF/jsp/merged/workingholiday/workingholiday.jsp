<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
function prepareWorkingHolidayPlan(form, paymentFormId){
	var result = false;
	var paymentFormId = '#' + paymentFormId;
	var method = "<%=request.getContextPath()%>/prepareWorkingHolidayPlan";
	console.log($(paymentFormId).serialize());
	$.ajax({
		type : "POST",
		url : method,
		data : $(paymentFormId).serialize(),
		async : false,
		success : function(data) {
			if (data == 'success') {
				form.action = "<%=request.getContextPath()%>/${language}/working-holiday-insurance/quote";
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
<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${scriptName}",
  "image":"https://i.fwd.com.hk/resources/images/sharing/iFWD_fb-sharing_working-holidaycare_en.jpg",
  "description":"${scriptChildName}",
  "brand":{
    "@type":"Insurance",
    "name":"${scriptChildName}"
  },
  "offers":{
    "@type":"AggregateOffer",
    "lowPrice":"3500",
    "highPrice":"4500",
    "priceCurrency":"HKD"
  }
}
</script>

<section id="main-slider" class="p_workingholiday no-margin"> 
  <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="workingholiday.hero.image.alt" bundle="${msg}" />" class="img-responsive hidden-lg hidden-md"  /> 
  <div class="tagline-holder hidden-lg hidden-md">
    <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.text.image" bundle="${msg}" />" alt="<fmt:message key="workingholiday.hero.image.alt" bundle="${msg}" />" class="img-responsive">
  </div>

  <div class="carousel slide hidden-xs hidden-sm">
    <div class="col-lg-12 col-md-12 breadcrumb-wrapper">
    <ol class="breadcrumb container pad-none">
        <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
         <i class="fa fa-chevron-right"></i>
        <li><fmt:message key="home.breadcrumb1.type1" bundle="${msg}" /></li>
         <i class="fa fa-chevron-right"></i>                     
        <li class="active"><fmt:message key="home.breadcrumb1.workingHoliday" bundle="${msg}" /></li>
    </ol>
    </div> 
    <div class="carousel-inner">
    	<div class="item active">
        <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image" bundle="${msg}" />" alt="<fmt:message key="workingholiday.hero.image.alt" bundle="${msg}" />"  />
		</div>
    <div class="tagline-holder">
      <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.text.image" bundle="${msg}" />" alt="<fmt:message key="workingholiday.hero.image.alt" bundle="${msg}" />" class="img-responsive">
    </div>
	</div>
</div>
<div id="middle" class="hidden-sm hidden-xs workingholiday-middle" style="background:none;">
    <form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" method="post" onsubmit="return prepareWorkingHolidayPlan(this,'frmWorkingHolidayGetQuote');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 slide-form workingholiday-text-align-center">
					<table class="table activation-form3">
						<tbody>
							<tr>  
								<td align="center" class="col-md-2 pad-none">
								    <button style="height:70px;" type="submit" class="border-radius btn btn-primary get-btn btn-color-ylw"><fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /></button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div> 
		</div>
	</form>
</div>
</section>

<!--Mobileform-->
<div class="slider-form hidden-lg hidden-md">
<form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" method="post" onsubmit="return prepareWorkingHolidayPlan(this,'frmWorkingHolidayGetQuote');">
      <button type="submit" class="bdr-curve btn btn-primary btn-lg btn-color-ylw" style="width:100%">
              <fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /> 
      </button>
</form>
</div>
<!--Mobileform--> 

<!--/#main slider-->

<section id="feature" style="margin-top:40px;">
  <div class="container pad-none">
    <div class="center wow fadeInDown">
      <!--desktop-->
      
      <h1 class="workingholiday-heading"><fmt:message key="workingholiday.main.quote.top.heading" bundle="${msg}" /></h1>
      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
            <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
		      <h2 class="landing-feature-title">
		        <fmt:message key="workingholiday.main.feature1.heading" bundle="${msg}" />
		      </h2>
	          <div style="margin-top:25px;">
	               <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_working-holiday_icon1.png" />
	          </div>
	          <div style="margin-top:10px;">
                   <fmt:message key="workingholiday.main.feature1.paragraph1" bundle="${msg}" />
              </div>
              <div style="margin-top:15px; font-size:14px; color:#f68a1d;">
                    <fmt:message key="workingholiday.main.feature1.paragraph2" bundle="${msg}" />
              </div>
              </div>
	      </div>
	      <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	           <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	          <h2 class="landing-feature-title">
	             <fmt:message key="workingholiday.main.feature2.heading" bundle="${msg}" />
	          </h2>
	          <div style="margin-top:25px;">
                   <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_working-holiday_icon2.png" />
              </div>
              <div style="margin-top:10px;">
                    <fmt:message key="workingholiday.main.feature2.paragraph" bundle="${msg}" />
              </div>
              </div>
          </div>
          <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
	          <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
	               <h2 class="landing-feature-title">
	                 <fmt:message key="workingholiday.main.feature3.heading" bundle="${msg}" />
	              </h2>
	              <div style="margin-top:25px;">
	                   <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_working-holiday_icon3.png" />
	              </div>
	              <div style="margin-top:10px;">
	                  <fmt:message key="workingholiday.main.feature3.paragraph" bundle="${msg}" />
	              </div>
	          </div>
          </div>
          <div class="clearfix"></div>
      </div>
      <div class="clearfix"></div>
      
      

<!--end desktop--> 


</div>
<div id="other-benefits" class="other-benefits col-lg-12 col-md-12 hidden-sm hidden-xs" style="margin-left:10px;">
  <h2><fmt:message key="other.coverage.headline" bundle="${msg}" /></h2>
  <ul class="bullets">
    <li>
      <p class="h4-5 "><fmt:message key="workingholiday.main.other.benefit.desc1" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5 "><fmt:message key="workingholiday.main.other.benefit.desc2" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5 "><fmt:message key="workingholiday.main.other.benefit.desc3" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5 "><fmt:message key="workingholiday.main.other.benefit.desc4" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5 "><fmt:message key="other.coverage5" bundle="${msg}" /></p>
    </li>
    <!--<li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc6.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.promo.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.other.benefit.desc6.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.other.benefit.desc6.part3" bundle="${msg}" /></p>
    </li>-->
  </ul>
  
  <!--<div class="col-lg-12 col-md-12 col-xs-12 main-partner" style="">
      <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="">
  </div>-->

  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/Working_HolidayCare_JacketLatest.pdf" target="_blank"> <u><fmt:message key="workingholiday.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="workingholiday.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="workingholiday.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.other.disclaimer.part3" bundle="${msg}" /><fmt:message key="workingholiday.main.other.disclaimer.part4" bundle="${msg}" />
  </p>
</div>
 
<div id="other-benefits-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
  <h2 style="text-align: center;"><fmt:message key="other.coverage.headline" bundle="${msg}" /></h2>
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="workingholiday.main.other.benefit.desc1" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="workingholiday.main.other.benefit.desc2" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="workingholiday.main.other.benefit.desc3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="workingholiday.main.other.benefit.desc4" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="workingholiday.main.other.benefit.desc5" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;"><fmt:message key="other.coverage5" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>      
      <!--/.item-->
      <!--<div class="item" >
          <div class="slide-margin">
            <div class="other-benefits-wrap text-center">
              <div class="other-benefits-inner">
                <p style="font-size: 21px;">
                  <fmt:message key="workingholiday.main.other.benefit.desc6.part1" bundle="${msg}" /> <a href="<fmt:message key="agoda.promo.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.other.benefit.desc6.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.other.benefit.desc6.part3" bundle="${msg}" />
                </p>
              </div>
            </div>
          </div>
      </div>-->
      <!--/.item-->
    </div>
    <!--/.carousel-inner--> 
    <a class="prev" href="#other-benefits-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a>
    <a class="next" href="#other-benefits-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  </div>
  <!--/.carousel-->
  <div class="clearfix"></div>
  
  <!--<div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="text-align:center;">
    <div class="col-lg-12 col-md-12 col-xs-12">
      <img src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="" class="" style="margin-bottom:15px;">
    </div>
  </div>-->
  
  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/Working_HolidayCare_JacketLatest.pdf" target="_blank"> <u><fmt:message key="workingholiday.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="workingholiday.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="workingholiday.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.other.disclaimer.part3" bundle="${msg}" /><fmt:message key="workingholiday.main.other.disclaimer.part4" bundle="${msg}" />
  </p>

<!--/.container-->
</div>
</div>
</section>
<!--/#feature-->





<!--/#testiomonials-->
<section id="testimonials" class="hidden-sm hidden-xs" style="background:#4E4E4E;">
<form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" method="post" onsubmit="return prepareWorkingHolidayPlan(this,'frmWorkingHolidayGetQuote');">
  <div class="container"> 
    <!--desktop-testimonials-->
    
    
    <div style="float:left;margin-right:20%;">
        <img style="width:100%;" src="<%=request.getContextPath()%>/resources/images/icon4.png" />
    </div>
    
    <div style="color:white; float:left; width:50%;">
        <div>
          <h2 style="border-bottom: solid 2px #fff;display: inline;padding-bottom: 3px;"><fmt:message key="workingholiday.main.quote.bottom.next" bundle="${msg}" /></h2>
        </div>
        
        <div>
            <h2><fmt:message key="workingholiday.main.quote.bottom.heading" bundle="${msg}" /></h2>        
            <span style="font-size:21px;"><fmt:message key="workingholiday.main.quote.bottom.desc" bundle="${msg}" /></span>
        </div>
        
        <div style="margin-top:18px;">
            <button style="height:70px;" type="submit" class="border-radius btn btn-primary get-btn btn-color-ylw"><fmt:message key="workingholiday.main.quote.bottom.action" bundle="${msg}" /></button>
        </div>
    </div>
    
    
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
    
  </div>
  <!--/.container-->
</form>   
</section>
<!--/#testiomonials--> 

<!--/#testiomonials mob-->
<section id="testimonials-mob" class="hidden-lg hidden-md workingholiday-testimonials-mob" style="margin: 0px;">
<form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" method="post" onsubmit="return prepareWorkingHolidayPlan(this,'frmWorkingHolidayGetQuote');">
    <!--desktop-testimonials-->
   <%--  <img src="<%=request.getContextPath()%>/resources/images/icon4.png" style="margin-top: 50px;" />
    <h2><fmt:message key="workingholiday.main.quote.bottom.next" bundle="${msg}" /></h2>        
    <hr style="width:120px;">
    <h2><fmt:message key="workingholiday.main.quote.bottom.heading" bundle="${msg}" /></h2>        
    <span style="font-size:21px;">
      <fmt:message key="workingholiday.main.quote.bottom.desc" bundle="${msg}" />
    </span>
    <button style="width:100%;height:70px;margin-top: 50px;" type="submit" class="border-radius btn btn-primary get-btn "><fmt:message key="workingholiday.main.quote.bottom.action" bundle="${msg}" /></button>  --%>   

 
    <!--desktop-testimonials-->
        <img src="<%=request.getContextPath()%>/resources/images/icon4.png" style="margin-top: 50px;" />
    


          <h2><fmt:message key="workingholiday.main.quote.bottom.next" bundle="${msg}" /></h2>        
          <hr style="width:120px;">

        

            <h2><fmt:message key="workingholiday.main.quote.bottom.heading" bundle="${msg}" /></h2>        
            <span style="font-size:21px;"><fmt:message key="workingholiday.main.quote.bottom.desc" bundle="${msg}" /></span>

        

            <button style="width:100%;height:70px;margin-top: 50px;" type="submit" class="border-radius btn btn-primary get-btn btn-color-ylw"><fmt:message key="workingholiday.main.quote.bottom.action" bundle="${msg}" /></button>
    
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
</form>
</section>
<!--/#testiomonials mob-->




<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight1.heading" bundle="${msg}" />
            </h1>
              <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight2.heading" bundle="${msg}" /></h1>
              <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight3.heading" bundle="${msg}" /></h1>
            <p><fmt:message key="workingholiday.main.highlight3.desc" bundle="${msg}" /></p>
            <!--<img src="resources/images/agoda-logo.png" alt=""/>--> </div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
    <!--End Desktop Support--> 
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#recent-works-->


<section id="recent-works-mob" class="hidden-lg hidden-md" style="margin: 0px;">
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
          <div class="slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
                <h2><fmt:message key="workingholiday.main.highlight1.heading" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><u><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></u></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="slide-margin">
            <div class="recent-work-wrap-mid text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  /> 
              <h2><fmt:message key="workingholiday.main.highlight2.heading" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item">
          <div class="slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  /> 
              <h2><fmt:message key="workingholiday.main.highlight3.heading" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight3.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#recent-works-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#recent-works-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>
  <div class="clearfix"></div>
  </section>



<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
    <div class="center">
      <h2><fmt:message key="workingholiday.main.blog.heading" bundle="${msg}" /></h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="<fmt:message key="workingholiday.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
            <h3> <a href="<fmt:message key="workingholiday.blog.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading1" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="<fmt:message key="workingholiday.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
            <h3><a href="<fmt:message key="workingholiday.blog.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="<fmt:message key="workingholiday.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
            <h3> <a href="<fmt:message key="workingholiday.blog.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="workingholiday.main.blog.subheading3" bundle="${msg}" /> <i class="fa fa-caret-right"></i> </a></h3>
          </div>
        </div>
      </div>
    </div>
    <!--/.row--> 
     <p><fmt:message key="workingholiday.main.blog.disclaimer" bundle="${msg}" /></p>
    <div class="clearfix"></div>
   
   
  </div>
</section>

<style>
   @media screen and (max-width: 991px) {
   body {
      /* Hero image Position Fix*/
      padding-top: 95px;
   }
</style>

<!--/#middle-->