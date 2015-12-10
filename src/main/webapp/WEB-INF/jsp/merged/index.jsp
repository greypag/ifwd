<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta charset="utf-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<!-- <meta name="author" content=""> -->
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" />
<!--Google Code for SEO-->




 
<%-- <% --%>
<%-- 	session = request.getSession();
// 	String uatAuth = (String) session.getAttribute("uatAuth");
// 	//System.out.println("uatAuth " + uatAuth);
// 	if (uatAuth == null)


<%
// 	session = request.getSession();
// 	String uatAuth = (String) session.getAttribute("uatAuth");
// 	//System.out.println("uatAuth " + uatAuth);
// 	if (uatAuth == null)
// 		response.sendRedirect(request.getContextPath() + "/uatAuth");
	
// 	if (!uatAuth.equals("ifwdUser"))
// 		response.sendRedirect(request.getContextPath() + "/uatAuth");
<%-- %> --%>




</head>
<body>




<!--   Main Content-->
    <section id="main-slider" class="no-margin clearfix">  
        <!--Mobile-logo-->
        <img src="<%=request.getContextPath()%>/<fmt:message key="index.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="index.hero.image.alt" bundle="${msg}" />" class="img-responsive hidden-lg hidden-md" />
        <!--Mobile-logo-->
        <div class="carousel slide hidden-xs hidden-sm">
            <div class="carousel-inner">
                <div class="item active item-border">             
                    <div class="col-lg-12 col-md-12 hidden-xs pad-none homecare home-main homecare-hei center">
                       <!--  <h2></h2>
                        
                        <a href="<%=request.getContextPath()%>/${language}/flight-insurance" class="border-radius btn btn-primary  home-btn"><fmt:message key="index.product.flight" bundle="${msg}" /></a>
                        <a href="<%=request.getContextPath()%>/${language}/travel-insurance" class="border-radius btn btn-primary  home-btn"><fmt:message key="index.product.travel" bundle="${msg}" /></a>
                         <a href="<%=request.getContextPath()%>/${language}/home-insurance" class="border-radius btn btn-primary  home-btn"><fmt:message key="index.product.home" bundle="${msg}" /></a>
                        <div class="clearfix"></div> -->
                     
                    </div>


<img src="<%=request.getContextPath()%>/<fmt:message key="index.hero.image" bundle="${msg}" />" alt="<fmt:message key="index.hero.image.alt" bundle="${msg}" />" />                </div>
                <!--/.item-->
            </div>
            <!--/.carousel-inner-->
        </div>
        <div class="col-lg-12 col-md-12 hidden-lg  hidden-md pad-none homecare home-main-mobi">
            <h2 class="center"></h2>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><fmt:message key="index.product.eliteterm" bundle="${msg}" /></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/savings-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><div><fmt:message key="index.product.savie" bundle="${msg}" /><br/><fmt:message key="index.product.savie2" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/ifwd_savie_navigation-icon_limited-offer_default.png" height="35"/></div></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/term-life-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><fmt:message key="index.product.eliteterm" bundle="${msg}" /></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/flight-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><fmt:message key="index.product.flight" bundle="${msg}" /><img src="<%=request.getContextPath()%>/resources/images/iFwd_navigation-icon_desktop_default.png" height="35"/></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/travel-insurance" class="border-radius btn btn-primary  home-btn home-btn-main"><fmt:message key="index.product.travel" bundle="${msg}" /></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/oversea-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><fmt:message key="index.product.oversea" bundle="${msg}" /></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/working-holiday-insurance" class="border-radius btn btn-primary  home-btn home-btn-main" ><fmt:message key="index.product.workingholiday" bundle="${msg}" /></a></div>
            <div class="col-sm-12 col-xs-12" > <a href="<%=request.getContextPath()%>/${language}/home-insurance" class="border-radius btn btn-primary  home-btn home-btn-main"><fmt:message key="index.product.home" bundle="${msg}" /></a>
        </div>
           
            <!--<div class=" col-sm-12  col-xs-12">
                <a href="homecare-plan.html" type="button" class="border-radius btn btn-primary  get-btn get-btn-home" onclick="return flightValidateBtmTravel()">Get Quote</a>
            </div>-->
         

        </div>
        <!--/.carousel-->
    </section>
<!--Mobile-form-->

<!--Mobile-form--> 

<!--/#main-slider-->



<section id="recent-works-homecare" class="hidden-xs hidden-sm">
  <div class="container">
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="index.highlight1.heading" bundle="${msg}" /></h1>
            <p>
                <fmt:message key="index.highlight1.desc.part1" bundle="${msg}" /> <a
                  href="<fmt:message key="app.download.link" bundle="${msg}" />"
                  target="_blank"><fmt:message key="index.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="index.highlight1.desc.part3" bundle="${msg}" />
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="index.highlight2.heading" bundle="${msg}" /></h1>
            <p><fmt:message key="index.highlight2.paragraph" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
            <h1><fmt:message key="index.highlight3.heading" bundle="${msg}" /></h1>
            <p><fmt:message key="index.highlight3.paragraph" bundle="${msg}" /></p>
             </div>
        </div>
      </div>
    </div>
    <!--End-Desktop-Support--> 
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#recent-works-->

<section id="recent-works-mob" class="hidden-lg hidden-md"  >
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active">
        <div>
          <div class="slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
                <h2><fmt:message key="index.highlight1.heading" bundle="${msg}" /></h2>
                <p>
                <fmt:message key="index.highlight1.desc.part1" bundle="${msg}" /> <a
                  href="<fmt:message key="app.download.link" bundle="${msg}" />"
                  target="_blank"><fmt:message key="index.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="index.highlight1.desc.part3" bundle="${msg}" />
              </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div>
          <div class="slide-margin">
            <div class="recent-work-wrap-mid text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
                <h2><fmt:message key="index.highlight2.heading" bundle="${msg}" /></h2>
                <p><fmt:message key="index.highlight2.paragraph" bundle="${msg}" /></p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item">
        <div>
          <div class="row slide-margin">
            <div class="recent-work-wrap text-center">
              <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
                <h2><fmt:message key="index.highlight3.heading" bundle="${msg}" /></h2>
                <p><fmt:message key="index.highlight3.paragraph" bundle="${msg}" /></p>
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


<!--/#testiomonials-->
<section id="testimonials" class="hidden-sm hidden-xs">
  <div class="container"> 
    <!--desktop-testimonials-->
    <div class="row hidden-sm hidden-xs">
      <div class="center">
        <h2><fmt:message key="index.customer.heading" bundle="${msg}" /></h2>
      </div>
      <div class="col-xs-12 col-sm-5 col-md-5 pad-none">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="index.customer1.paragraph" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="index.customer1.name.part1" bundle="${msg}" /></h2>
            <h4><fmt:message key="index.customer1.name.part2" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-5 col-md-5 pad-none pull-right">
        <div class="testimonials-wrap text-center">
          <div class="testimonials-inner text-center">
            <div class="h1-1"> <blockquote class="testimonial"></blockquote></div>
            <p><fmt:message key="index.customer2.paragraph" bundle="${msg}" /></p>
            <div class="hr1"></div>
            <h2><fmt:message key="index.customer2.name.part1" bundle="${msg}" /> </h2>
            <h4><fmt:message key="index.customer2.name.part2" bundle="${msg}" /></h4>
          </div>
        </div>
      </div>
      <br>
      <P class="pad-none p1 pull-left"><br>
      <fmt:message key="index.customer.disclaimer" bundle="${msg}" /></P>
    </div>
    <!--/.row--> 
    <!--/.desktop-testimonials--> 
    
  </div>
  <!--/.container--> 
</section>
<!--/#testiomonials--> 

<!--/#testiomonials mob-->
<section id="testimonials-mob" class="hidden-lg hidden-md">
  <div class="carousel slide">
  <div class="center">
        <h2><fmt:message key="index.customer.heading" bundle="${msg}" /></h2>
 </div>

    <div class="carousel-inner">
      <div class="item active">
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner text-center">
                <blockquote class="testimonial"></blockquote>
                <p><fmt:message key="index.customer1.paragraph" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="index.customer1.name.part1" bundle="${msg}" /></h2>
                <h4><fmt:message key="index.customer1.name.part2" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--/.item-->
      <div class="item" >
        <div class="container">
          <div class="row slide-margin">
            <div class="testimonials-wrap text-center">
              <div class="testimonials-inner text-center">
                <blockquote class="testimonial"></blockquote>
                <p><fmt:message key="index.customer2.paragraph" bundle="${msg}" /></p>
                <div class="hr1"></div>
                <h2><fmt:message key="index.customer2.name.part1" bundle="${msg}" /></h2>
                <h4><fmt:message key="index.customer2.name.part2" bundle="${msg}" /></h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
  <a class="prev" href="#testimonials-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a> <a class="next" href="#testimonials-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a> </section>
<!--/#testiomonials mob-->

<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
    <div class="center">
      <h2><fmt:message key="index.blog.heading" bundle="${msg}" /></h2>
    </div>
    <div class="col-lg-12 pad-none">
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx1">
          <div> <a href="<fmt:message key="index.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home4.png" alt=""></a>
            <h3> <a href="<fmt:message key="index.blog.post1.link" bundle="${msg}" />" target="_blank"><fmt:message key="index.blog.desc1" bundle="${msg}" />  <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx2">
          <div> <a href="<fmt:message key="index.blog.post2.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home5.png" alt=""></a>
            <h3><a href="<fmt:message key="index.blog.post2.link" bundle="${msg}" />" target="_blank"><fmt:message key="index.blog.desc2" bundle="${msg}" />  <i class="fa fa-caret-right"></i> </a></h3>
         
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 pad-none">
        <div class="services-wrap service-bx3">
          <div> <a href="<fmt:message key="index.blog.post3.link" bundle="${msg}" />" target="_blank"><img class="bdr-img" src="<%=request.getContextPath()%>/resources/images/home6.png" alt=""></a>
            <h3> <a href="<fmt:message key="index.blog.post3.link" bundle="${msg}" />" target="_blank"><fmt:message key="index.blog.desc3" bundle="${msg}" />  <i class="fa fa-caret-right"></i> </a></h3>
           
          </div>
        </div>
      </div>
    </div>
    <!--/.row-->
     
  </div>
  <!--/.container--> 
</section>
<!--/#services-->
<section class="blog-item hidden-sm hidden-xs">
  <div class="container">
     <p><fmt:message key="index.blog.disclaimer" bundle="${msg}" /></p>
     
  </div>
  <!--/.container--> 
</section>
<!--/#services-->

</body>
</html>