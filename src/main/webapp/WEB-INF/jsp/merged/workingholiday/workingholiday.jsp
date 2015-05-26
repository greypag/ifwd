<%@page import="com.ifwd.fwdhk.model.WorkingHolidayQuoteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<script type="text/javascript">

    function reset_submit()
    {
      var frm = document.getElementById("frmWorkingHolidayGetQuote");

    }   
</script>
<script type='text/javascript'>
$(document).ready(function() {
    $(".navbar-inverse").addClass("product-header");
});
function prepareWorkingHolidayPlan(form, paymentFormId){
	var paymentFormId = '#' + paymentFormId;
	var method = "<%=request.getContextPath()%>/prepareWorkingHolidayPlan";
	$.ajax({
		type : "POST",
		url : method,
		data : $(paymentFormId).serialize(),
		async : false,
		success : function(data) {
			if (data == 'success') {
				form.action = "<%=request.getContextPath()%>/${language}/workingholiday-insurance/quote";
			} else {
				console.log("fail to process prepareWorkingHolidayPlan " + data);
				return false;
			}
		}
	}); 
}




</script>
<section id="main-slider" class="no-margin"> 
<img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image.mobile" bundle="${msg}" />" alt="" class="img-responsive hidden-lg hidden-md"  /> 

<div class="carousel slide hidden-xs hidden-sm">
	<div class="carousel-inner">
		<div class="item active">
            <img src="<%=request.getContextPath()%>/<fmt:message key="workingholiday.hero.image" bundle="${msg}" />" alt=""  />
		</div>
	</div>
</div>
<div id="middle" class="hidden-sm hidden-xs workingholiday-middle" style="background:none;">
    <form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" method="post" onsubmit="return prepareWorkingHolidayPlan(this,'frmWorkingHolidayGetQuote');">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 slide-form workingholiday-text-align-center">
					<h2 class="workingholiday-heading"><fmt:message key="workingholiday.main.quote.top.heading" bundle="${msg}" /></h2>
					<table class="table activation-form3">
						<tbody>
							<tr>  
								<td align="center" class="col-md-2 pad-none">
								    <button style="height:70px;" type="submit" class="border-radius btn btn-primary get-btn " onclick="reset_submit()"><fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /></button>
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
<%-- <form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" action="<%=request.getContextPath()%>/${language}/workingholiday-insurance/quote" method="post" onsubmit="return flightValidateDeskWorkingHoliday();"> --%>

<!--Mobileform-->
<div class="slider-form hidden-lg hidden-md">
<form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" action="getWorkingHolidayQuote" method="post" onsubmit="return flightValidateMobWorkingHoliday();">
      <!-- <a href="#" class="border-radius get-btn" onclick="return flightValidateMobWorkingHoliday()">立即申請免費保障! </a>  -->
      <button type="submit" class="bdr-curve-none btn btn-primary btn-lg" style="width:100%">
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
      
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="col-xs-12 col-sm-4">
            <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;">
		      <h3 style="font-weight: bold; color:black; margin-top:45px; line-height:35px;">
		      Flexibility <br />
		      of Refund
		      </h3>
	          <div style="margin-top:25px;">
	               <img src="<%=request.getContextPath()%>/resources/images/icon1.png" />
	          </div>
	          <div style="margin-top:15px; ">
	               Pay only for what <br /> you use
	          </div>
	          <hr width="50%">
	          <div style="margin-top:10px;">
                   Get refunded for <br /> unused coverage<span style="color:#f68a1d;">*</span>
              </div>
              <div style="margin-top:15px; font-size:10px; color:#f68a1d;">
                    *Service fee of $500HK applies
              </div>
              </div>
	      </div>
	      <div class="col-xs-12 col-sm-4">
	           <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;">
	          <h3 style="font-weight: bold; color:black; margin-top:45px; line-height:35px;">
	          Unforeseable <br />
	          Loss of Income
	          </h3>
	          <div style="margin-top:25px;">
                   <img src="<%=request.getContextPath()%>/resources/images/icon2.png" />
              </div>
              <div style="margin-top:15px; ">
                   Get cash allowanc for <br /> 
                   accidental injury
              </div>
              <hr width="50%">
              <div style="margin-top:10px;">
                   Get compensation for <br /> 
                   employer's business <br />
                   bankruptcy
              </div>
              </div>
          </div>
          <div class="col-xs-12 col-sm-4">
	          <div style="border: 1px solid #D1D1D1; height:450px;margin-bottom: 20px;">
	               <h3 style="font-weight: bold; color:black; margin-top:45px; line-height:35px;">
	              Travel The World <br />
	              Without Limits
	              </h3>
	              <div style="margin-top:25px;">
	                   <img src="<%=request.getContextPath()%>/resources/images/icon3.png" />
	              </div>
	              <div style="margin-top:15px; ">
	                   Cover leisure trips within <br /> 
	                   coverage period
	              </div>
	              <hr width="50%">
	              <div style="margin-top:10px;">
	                   Extends to worldwide <br />
	                   locations
	              </div>
	          </div>
          </div>
      </div>
      
      

<!--end desktop--> 


</div>





<div class="clearfix"></div>
<div class="other-benefits col-lg-12" style="margin-left:20px;">
  <h2><fmt:message key="workingholiday.main.other.benefit" bundle="${msg}" /></h2>
  <ul class="bullets">
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc1" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc2" bundle="${msg}" /></p>
    </li>
    <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc3" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc4" bundle="${msg}" /></p>
    </li>
  <li>
      <p class="h4-5"><fmt:message key="workingholiday.main.other.benefit.desc5" bundle="${msg}" /></p>
    </li>
  </ul>
  <div class="spacer3"></div>
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part1" bundle="${msg}" /> <a href="<%=request.getContextPath()%>/<fmt:message key="workingholiday.provision.link" bundle="${msg}" />" target="_blank"> <fmt:message key="workingholiday.main.other.disclaimer.part2" bundle="${msg}" /></a><fmt:message key="workingholiday.main.other.disclaimer.part3" bundle="${msg}" /></p>
  
  <p class="h4-6"><fmt:message key="workingholiday.main.other.disclaimer.part4" bundle="${msg}" /></p>
</div>
<!--/.container-->
</div>
</section>
<!--/#feature-->




<!--/#testiomonials-->
<section id="testimonials" class="hidden-sm hidden-xs" style="background:#4E4E4E;">
  <div class="container"> 
    <!--desktop-testimonials-->
    
    
    <div style="float:left; margin-right:10%;">
        <img style="width:100%;" src="<%=request.getContextPath()%>/resources/images/icon4.png" />
    </div>
    
    <div style="color:white; float:left; width:60%;">
        <div>
	        <h2>Next Step</h2>        
	        <hr style="width:120px; margin:0; margin-left:10px; margin-top:8px;">
        </div>
        
        <div>
            <h2>Made your decision</h2>        
            <span style="font-size:21px;">It's time to get protected and choose the right coverage for you.</span>
        </div>
        
        <div style="margin-top:18px;">
            <button style="height:70px;" type="submit" class="border-radius btn btn-primary get-btn " onclick="reset_submit()">Get Covered Now</button>
        </div>
    </div>
    
    
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
    
  </div>
  <!--/.container--> 
</section>
<!--/#testiomonials--> 

<!--/#testiomonials mob-->
<section id="testimonials-mob" class="hidden-lg hidden-md workingholiday-testimonials-mob" style="margin: 0px;">
    <!--desktop-testimonials-->
    <img src="<%=request.getContextPath()%>/resources/images/icon4.png" style="margin-top: 50px;" />
    <h2>Next Step</h2>        
    <hr style="width:120px;">
    <h2>Made your decision</h2>        
    <span style="font-size:21px;">It's time to get protected and choose the right coverage for you.</span>
    <button style="width:100%;height:70px;margin-top: 50px;" type="submit" class="border-radius btn btn-primary get-btn " onclick="reset_submit()">Get Covered Now</button>    
    
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
</section>
<!--/#testiomonials mob-->






<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight1.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight1.heading.line2" bundle="${msg}" />
            </h1>
              <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>

          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight2.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
            <h1><fmt:message key="workingholiday.main.highlight3.heading.line1" bundle="${msg}" /><br/>
              <fmt:message key="workingholiday.main.highlight3.heading.line2" bundle="${msg}" /></h1>
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
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
                <h2><fmt:message key="workingholiday.main.highlight1.heading.line1" bundle="${msg}" /><br/>
                  <fmt:message key="workingholiday.main.highlight1.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank" ><fmt:message key="workingholiday.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="workingholiday.main.highlight1.desc.part3" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item" >
          <div class="row slide-margin">
            <div class="recent-work-wrap-mid text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  /> 
              <h2><fmt:message key="workingholiday.main.highlight2.heading.line1" bundle="${msg}" /> <fmt:message key="workingholiday.main.highlight2.heading.line2" bundle="${msg}" /></h2>
                <p><fmt:message key="workingholiday.main.highlight2.desc" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
      </div>
      <!--/.item-->
      <div class="item">
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  /> 
              <h2><fmt:message key="workingholiday.main.highlight3.heading.line1" bundle="${msg}" /> <fmt:message key="workingholiday.main.highlight3.heading.line2" bundle="${msg}" /></h2>
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
<!-- 
<section id="bottom-form" class="hidden-sm hidden-xs">
  <div class="container">
    <div class="row">
    <form name="frmWorkingHolidayGetQuote" id="frmWorkingHolidayGetQuote" commandName="workingholidayQuote" action="<%=request.getContextPath()%>/${language}/getWorkingHolidayQuote" method="post" onsubmit="return flightValidateBtmWorkingHoliday();">
      <div class="col-lg-12 col-md-12 pad-none">
        <h2><fmt:message key="workingholiday.main.quote.bottom.heading" bundle="${msg}" /></h2>
        <table class="table activation-form3">
          <tbody>
          <tr>
        	  <td align="middle" class="col-md-2 pad-none">
                <button style="height:70px;" type="submit" class="border-radius btn btn-primary get-btn " onclick="reset_submit()"><fmt:message key="workingholiday.main.quote.top.action" bundle="${msg}" /></button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      </form>
    </div> 
  </div> 
</section>
-->
<!--/#middle-->