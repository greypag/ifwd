<%
//  session = request.getSession();
//  String uatAuth = (String) session.getAttribute("uatAuth");
//  //System.out.println("uatAuth " + uatAuth);
//  if (uatAuth == null)
//      response.sendRedirect(request.getContextPath() + "/uatAuth");

//  if (!uatAuth.equals("ifwdUser"))
//      response.sendRedirect(request.getContextPath() + "/uatAuth");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareQuetionaries"%>
<%@page import="java.util.*"%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<c:set var="context" value="${pageContext.request.contextPath}" />
<fmt:setBundle basename="messages" var="msg" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<title>Find affordable home insurance | FWD Hong Kong</title>
<meta name="description"
	content="Get affordable home insurance with protection for emergencies and accidents ✓24/7 support ✓ 'A' rated secure & stable financial strength ✓ Rewards & benefits" />
<!-- core CSS -->



<!-- Start fixed header -->
<script type='text/javascript'>
$(document).ready(function() {
    $("header .top-bar").addClass("fixed-header");
    $(".navbar-inverse").addClass("product-header");
});
</script>

<script type="application/ld+json">
{
  "@context":"http://schema.org/",
  "@type":"Product",
  "name":"${scriptName}",
  "image":"${scriptImg}",
  "description":"${scriptDescription}",
  "brand":{
    "@type":"Insurance",
    "name":"${scriptChildName}"
  },
  "offers":{
    "@type":"Offer",
    "priceCurrency":"HKD",
    "price":"420",
    "priceValidUntil":"2016-12-31",
    "availability":"http://schema.org/InStock",
    "seller":{
      "@type":"Organization",
      "name":"${scriptChildName}"
    }
  }
}
</script>
<!-- End fixed header -->
</head>
<body class="chin">



	<!--   Main Content-->
	<section id="main-slider" class="p_homecare no-margin">
		<!--Mobile--->
		<img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.image.mobile" bundle="${msg}" />" alt="<fmt:message key="home.hero.image.alt" bundle="${msg}" />"
			class="img-responsive hidden-lg hidden-md" />
        <div class="tagline-holder hidden-lg hidden-md">
            <img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.tagline" bundle="${msg}" />" alt="Protection for your family's future" class="img-responsive">
        </div>
		<!--desktop-->
		<div class="carousel slide hidden-xs hidden-sm">
		     <div class="col-lg-12 col-md-12 breadcrumb-wrapper">
		         <ol class="breadcrumb container pad-none">
		             <li><fmt:message key="home.breadcrumb1.item1" bundle="${msg}" /></li>
		             <i class="fa fa-chevron-right"></i>
		             <li class="active"><fmt:message key="home.breadcrumb1.care" bundle="${msg}" /></li>
		         </ol>
		     </div>
			<div class="carousel-inner">
				<div class="item active item-border">

					<img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.image" bundle="${msg}" />" alt="<fmt:message key="home.hero.image.alt" bundle="${msg}" />" />
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
        <div class="tagline-holder">
            <img src="<%=request.getContextPath()%>/<fmt:message key="home.hero.tagline" bundle="${msg}" />" alt="Protection for your family's future" class="img-responsive">
        </div>
		</div>
		<div class="homecare hidden-xs hidden-sm" id="homecare-scroll">
                        <div class="container">
                            <div class="row">

                                <form:form name="getHomeQuote" id="getHomeQuote" action="${pageContext.request.contextPath}/${language}/home-insurance/quote" method="post" modelAttribute="homeCarelPlan">
                                    <div class="hidden-xs hidden-sm slide-form">
                                        <!-- <h2 class="col-xs-12"><fmt:message key="home.main.quote.top.heading" bundle="${msg}" /></h2> -->
                                        <%
                                            List lst = (List) request
                                                        .getAttribute("homeCareQuetionariesList");

                                                Iterator itr = lst.iterator();
                                                int i = 1;
                                                while (itr.hasNext()) {

                                                    HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
                                                            .next();
                                        %>

                                        <div class="col-md-4">
                                            <h4>
                                                <%=quetionList.getQuetion()%>
                                            </h4>
                                            <input type="hidden" id="lblCount" value="${homeCareQuetionariesList.size()}"></input>
                                            <label class="radio radio-warning radio-inline radio-homecare"> <input
                                                name="home_situated<%=quetionList.getQid()%>"
                                                id="inlineDeskRadio1a<%=quetionList.getQid()%>"
                                                data-id="home"
                                                value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
                                                type="radio"> <label
                                                for="inlineDeskRadio1a<%=quetionList.getQid()%>"> <span><%=quetionList.getAnswer1()%></span>
                                            </label>
                                            </label> <label class="radio radio-warning radio-inline radio-homecare"> <input
                                                name="home_situated<%=quetionList.getQid()%>"
                                                id="inlineDeskRadio1b<%=quetionList.getQid()%>"
                                                data-id="home"
                                                value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
                                                type="radio"> <label
                                                for="inlineDeskRadio1b<%=quetionList.getQid()%>"> <span>
                                                        <%=quetionList.getAnswer2()%></span>
                                            </label>
                                            </label>
                                        </div>
                                        <%
                                            }
                                                i++;
                                        %>
                                        <div class="col-md-4">
                                            <button id="home_submit" type="submit"
                                                class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare btn-color-ylw"
                                                onclick="return msgAlertDesk('getHomeQuote')"><fmt:message key="home.main.quote.top.action" bundle="${msg}" /></button>
                                        </div>
                                        <div class="clearfix"></div>
                                        <p class="col-xs-12 mute">
                                            <!--<fmt:message key="home.main.quote.subheading" bundle="${msg}" /><br>
                                            <br>-->
                                            <fmt:message key="home.main.quote.terms" bundle="${msg}" />
                                        </p>

                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
	</section>

	<%
    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
	long current = System.currentTimeMillis();
    long start = format.parse("2015-08-03").getTime();
    long end = format.parse("2016-12-31").getTime() + 86400000;
    if(start <= current && end >= current) {
	%>
	<section id="home_promo_banner">
        <div class="container pad-none">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 home_promo_banner_container">
                <div class="circle_fake"></div>
                <div class="circle_core"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/middle-circle.gif" /></div>
                <div class="circle_outer"><img class="img-responsive" src="<%=request.getContextPath()%>/resources/images/outer-circle.gif" /></div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 home_promo_banner_container">
                <div class="home_promo_banner_content pull-left">
                    <div class="home_promo_banner_title"><fmt:message key="home.cheapest.h1" bundle="${msg}" /></div>
                    <div class="home_promo_banner_caption"><fmt:message key="home.cheapest.h2.part1" bundle="${msg}" /> <span class="special_word"><fmt:message key="home.cheapest.h2.part2" bundle="${msg}" /></span><fmt:message key="home.cheapest.h2.part3" bundle="${msg}" /></div>
                    <div class="home_promo_banner_description">
                        <p>
                            <fmt:message key="home.cheapest.desc1" bundle="${msg}" />
                        </p>
                        <br/>
                        <p>
                            <fmt:message key="home.cheapest.desc2" bundle="${msg}" />
                        </p>
                    </div>
                    <button type="button" class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare" onclick="showHomePromoHidden();"><fmt:message key="home.cheapest.action1" bundle="${msg}" /></button>
                    <div class="home_promo_banner_tnc"><span class="special_word"> <fmt:message key="home.cheapest.disclaimer.part1" bundle="${msg}" /> </span><fmt:message key="home.cheapest.disclaimer.part2" bundle="${msg}" /> <span class="special_word"><a href="<%=request.getContextPath()%>/<fmt:message key="home.cheapest.tnc.guaranteed" bundle="${msg}" />" target="_blank"><u><fmt:message key="home.cheapest.disclaimer.part3" bundle="${msg}" /></u></a></span> <fmt:message key="home.cheapest.disclaimer.part4" bundle="${msg}" /></div>
                </div>
                <div class="home_promo_banner_hidden_content pull-left" style="display:none;">
                    <div class="home_promo_banner_title"><fmt:message key="home.cheapest.h1" bundle="${msg}" /></div>
                    <div class="home_promo_banner_caption"><fmt:message key="home.cheapest.h2.part1" bundle="${msg}" /> <span class="special_word"><fmt:message key="home.cheapest.h2.part2" bundle="${msg}" /></span><fmt:message key="home.cheapest.h2.part3" bundle="${msg}" /></div>
                    <div class="home_promo_banner_description">
                        <div class="home_promo_banner_list_description"><fmt:message key="home.cheapest.features.h1" bundle="${msg}" /></div>
                        <ul>
                            <li><fmt:message key="home.cheapest.features1" bundle="${msg}" /></li>
                            <li><fmt:message key="home.cheapest.features2" bundle="${msg}" /></li>
                            <li><fmt:message key="home.cheapest.features3" bundle="${msg}" /></li>
                            <li><fmt:message key="home.cheapest.features4" bundle="${msg}" /></li>
                            <li><fmt:message key="home.cheapest.features5" bundle="${msg}" /></li>
                        </ul>
                    </div>
                    <div class="home_promo_banner_description">
                        <fmt:message key="home.cheapest.help.part1" bundle="${msg}" /> <a href="mailto:<fmt:message key="home.cheapest.help.part2" bundle="${msg}" />"><u><fmt:message key="home.cheapest.help.part2" bundle="${msg}" /></u></a> <fmt:message key="home.cheapest.help.part3" bundle="${msg}" />
                    </div>
                    <button type="button" class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare hidden-sm hidden-xs" onclick="homeScrollToElement('home_submit', 400)"><fmt:message key="home.cheapest.action2" bundle="${msg}" /></button>
                    <button type="button" class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare hidden-md hidden-lg" onclick="homeScrollToElement('getHomeQuoteMob', 100)"><fmt:message key="home.cheapest.action2" bundle="${msg}" /></button>
                    <div class="home_promo_banner_tnc"><span class="special_word"> <fmt:message key="home.cheapest.disclaimer.part1" bundle="${msg}" /> </span><fmt:message key="home.cheapest.disclaimer.part2" bundle="${msg}" /> <span class="special_word"><a href="<%=request.getContextPath()%>/<fmt:message key="home.cheapest.tnc.guaranteed" bundle="${msg}" />" target="_blank"><u><fmt:message key="home.cheapest.disclaimer.part3" bundle="${msg}" /></u></a></span> <fmt:message key="home.cheapest.disclaimer.part4" bundle="${msg}" /></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </section>
    <%} %>

    <script>
    $( document ).ready(function() {
    	$(".circle_fake").height($(".circle_fake").width());
   	});

    $(window).on('resize', function(){
    	$(".circle_fake").height($(".circle_fake").width());
	});

    function showHomePromoHidden(){
        $(".home_promo_banner_content").fadeOut(function(){
            $(".home_promo_banner_hidden_content").fadeIn();
        });
    }

    function homePromoGetQuote(dev){
        if(dev=="desktop"){
            if(msgAlertDesk('getHomeQuote')){
                $("#getHomeQuote").submit();
            }
        }else{
            if(msgAlertDesk('getHomeQuoteMob')){
                $("#getHomeQuoteMob").submit();
            }
        }
    }

    function homeScrollToElement(elementId, offset){
        $('html, body').animate({
            scrollTop: $("#"+elementId).offset().top - offset
        }, 1000);
    }

    </script>


		<!--mobile-->
		<form:form name="getHomeQuote" id="getHomeQuoteMob" action="${pageContext.request.contextPath}/${language}/home-insurance/quote"
			method="post" modelAttribute="homeCarelPlan">
			<div
				class="col-lg-12 col-md-12 hidden-lg  hidden-md pad-none homecare ">
				<h2 class="center"><fmt:message key="home.main.quote.bottom.heading" bundle="${msg}" /></h2>
				<%
					List lst = (List) request
								.getAttribute("homeCareQuetionariesList");

						Iterator itr = lst.iterator();
						int i = 1;
						while (itr.hasNext()) {

							HomeCareQuetionaries quetionList = (HomeCareQuetionaries) itr
									.next();
				%>

				<div class="col-lg-3 col-md-3 marg20 ">
					<h4>
						<%=quetionList.getQuetion()%>
					</h4>
					<input type="hidden" name="questionCount" id="lblCount"
						value="${homeCareQuetionariesList.size()}"></input> <label
						class="radio radio-warning radio-inline radio-homecare"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2a<%=quetionList.getQid()%>" data-id="home"
						value="<%=quetionList.getAnswer1()%>" <%=quetionList.getAnswer1Checked()%>
						type="radio"> <label
						for="inlineDeskRadio2a<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer1()%>
						</span>
					</label>
					</label> <label class="radio radio-warning radio-inline radio-homecare"> <input
						name="home_situated<%=quetionList.getQid()%>"
						id="inlineDeskRadio2b<%=quetionList.getQid()%>" data-id="home"
						value="<%=quetionList.getAnswer2()%>" <%=quetionList.getAnswer2Checked()%>
						type="radio"> <label
						for="inlineDeskRadio2b<%=quetionList.getQid()%>"> <span>
								<%=quetionList.getAnswer2()%></span>
					</label>
					</label>
				</div>
				<%
					}
						i++;
				%>
                <p class="col-xs-12 mute">
                    <fmt:message key="home.main.quote.terms" bundle="${msg}" />
                </p>
                <div class="clearfix"></div>
				<div class="form-container">
				    <h3 class="text-center">
				        <button type="submit" class="bdr-curve btn btn-primary btn-lg btn-block btn-color-ylw"
                            onclick="return msgAlertDesk('getHomeQuoteMob')"><fmt:message key="home.main.quote.bottom.action" bundle="${msg}" /></button>
				    </h3>

				</div>

			</div>
		</form:form>
		<!--/.carousel-->
	<!--Mobile-form-->

	<!--Mobile-form-->

	<!--/#main-slider-->





	<section id="feature" style="margin-top:40px;">
		<div class="container pad-none">
			<div class="center wow fadeInDown">
				<div class="spacer3"></div>
				<!--desktop-->
				<h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="home.main.desc" bundle="${msg}" /></h1>
				<!--end desktop-->

				<!--Mobile-->
				<h1 class="landing_h2 hidden-lg hidden-md feature-ttl"><fmt:message key="home.main.desc" bundle="${msg}" /></h1>
				<!--end Mobile-->
			</div>


			<!--desktop Features-->
		    <div class="center wow fadeInDown">
		        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		            <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
		                <div style="border: 1px solid #D1D1D1; height:600px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
		                  <h2 class="landing-feature-title">
		                    <fmt:message key="home.main.feature1.heading.part1" bundle="${msg}" /><fmt:message key="home.main.feature1.heading.part2" bundle="${msg}" />
		                  </h2>
		                  <div style="margin-top:70px;">
		                       <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_home_icon1.png" />
		                  </div>
		                  <div style="margin-top:10px;">
		                       <fmt:message key="home.main.feature1.paragraph" bundle="${msg}" />
		                  </div>
		                  </div>
		              </div>
		              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
		                   <div style="border: 1px solid #D1D1D1; height:600px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
		                  <h2 class="landing-feature-title">
		                     <fmt:message key="home.main.feature2.heading.part1" bundle="${msg}" /><fmt:message key="home.main.feature2.heading.part2" bundle="${msg}" />
		                  </h2>
		                  <div style="margin-top:70px;">
		                       <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_home_icon2.png" />
		                  </div>
		                  <div style="margin-top:10px;">
		                        <fmt:message key="home.main.feature2.paragraph" bundle="${msg}" />
		                  </div>
		                  </div>
		              </div>
		              <div class="col-xs-12 col-sm-12 col-md-4 pad-none" style="padding:5px !important;">
		                  <div style="border: 1px solid #D1D1D1; height:600px;margin-bottom: 20px;padding-left: 10%;padding-right: 10%;">
		                       <h2 class="landing-feature-title">
		                         <fmt:message key="home.main.feature3.heading.part1" bundle="${msg}" /><fmt:message key="home.main.feature3.heading.part2" bundle="${msg}" />
		                      </h2>
		                      <div style="margin-top:70px;">
		                           <img style="max-width:30%" src="<%=request.getContextPath()%>/resources/images/iFWD_home_icon3.png" />
		                      </div>
		                      <div style="margin-top:10px;">
		                          <fmt:message key="home.main.feature3.paragraph.part1" bundle="${msg}" />
		                      </div>
		                      <div style="margin-top:15px; font-size:14px; color:#f68a1d;">
				                  <fmt:message key="home.main.feature3.paragraph.part2" bundle="${msg}" />
				              </div>
		                  </div>
		              </div>
		              <div class="clearfix"></div>
		          </div>
		          <div class="clearfix"></div>
		      </div>


			<div class="other-benefits col-lg-12 col-md-12 hidden-sm hidden-xs" style="margin-left:10px;">

				<h2><fmt:message key="home.main.other.benefit" bundle="${msg}" /></h2>
				  <ul class="bullets">
				    <li>
                        <p class="h4-5"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.main.other.benefit.desc4.part1" bundle="${msg}" /></a> <fmt:message key="home.main.other.benefit.desc4.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.main.other.benefit.desc4.part3" bundle="${msg}" /></a> <fmt:message key="home.main.other.benefit.desc4.part4" bundle="${msg}" />
				    </li>

				  </ul>
				  <div class="col-lg-12 col-md-12 hidden-xs hidden-sm main-partner" style="">
				    <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="margin-right:15px;">
				  </div>

				<div class="spacer1"></div>

				<p class="col-xs-12 h4-6">
				<fmt:message key="home.main.other.disclaimer.part1" bundle="${msg}" />

					<a href="https://home.fwd.com.hk/gidoc/policyprovisions/Easy_HomeCare_JacketLatest.pdf" target="_blank" class="">
					<u><fmt:message key="home.main.other.disclaimer.part2" bundle="${msg}" /></u></a>
					<fmt:message key="home.main.other.disclaimer.part5" bundle="${msg}" />
					<a href="<fmt:message key="home.brochure.link" bundle="${msg}" />" target="_blank" class="">
					<u><fmt:message key="home.main.other.disclaimer.part6" bundle="${msg}" /></u></a>
					<fmt:message key="home.main.other.disclaimer.part3" bundle="${msg}" /><br>
					<fmt:message key="home.main.other.disclaimer.part4" bundle="${msg}" />


				</p>
				<!-- <p class="h4-6">
				The features above are indicative only. Please refer to the <a
						href="https://home.fwd.com.hk/gidoc/policyprovisions/Easy_HomeCare_JacketLatest.pdf"
						target="_blank" class="sub-link"> Policy Provisions </a> for details.
For a complete explanation of the terms and conditions, feel free to contact an adviser or our 24-hour hotline at 3123 3123 for more details.

				</p>-->
			</div>
			<!--/.container-->
			<div id="other-benefits-mob" class="other-benefits col-xs-12 col-sm-12 hidden-lg hidden-md">
				  <h2 style="text-align: center;"><fmt:message key="workingholiday.main.other.benefit" bundle="${msg}" /></h2>
				  <div class="carousel slide">
				    <div class="carousel-inner">
                      <div class="item active" >
                          <div class="slide-margin">
                            <div class="other-benefits-wrap text-center">
                              <div class="other-benefits-inner">
                                <p style="font-size: 21px"><a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.main.other.benefit.desc4.part1" bundle="${msg}" /></a> <fmt:message key="home.main.other.benefit.desc4.part2" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="home.main.other.benefit.desc4.part3" bundle="${msg}" /></a> <fmt:message key="home.main.other.benefit.desc4.part4" bundle="${msg}" />

                              </div>
                            </div>
                          </div>
                      </div>
                      <!--/.item-->
				    </div>
				    <!--/.carousel-inner-->
				    <!--<a class="prev" href="#other-benefits-mob" data-slide="prev"> <i class="fa fa-chevron-left"></i> </a>
				    <a class="next" href="#other-benefits-mob" data-slide="next"> <i class="fa fa-chevron-right"></i> </a>-->
				  </div>
				  <!--/.carousel-->
				  <div class="clearfix"></div>

				  <div class="col-lg-12 col-md-12 col-xs-12 main-partner mob" style="text-align:center;">
                    <div class="col-lg-12 col-md-12 col-xs-12">
                        <img src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="" class="" style="margin-bottom:15px;">
                    </div>
				  </div>

				  <div class="spacer3"></div>
				  <p class="h4-6"><fmt:message key="home.main.other.disclaimer.part1" bundle="${msg}" /> <a href="https://home.fwd.com.hk/gidoc/policyprovisions/Easy_HomeCare_JacketLatest.pdf" target="_blank"> <u><fmt:message key="home.main.other.disclaimer.part2" bundle="${msg}" /></u></a> <fmt:message key="home.main.other.disclaimer.part5" bundle="${msg}" /> <a href="<fmt:message key="home.brochure.link" bundle="${msg}" />" target="_blank"> <u><fmt:message key="home.main.other.disclaimer.part6" bundle="${msg}" /></u></a> <fmt:message key="home.main.other.disclaimer.part3" bundle="${msg}" /></p>

				  <p class="h4-6"><fmt:message key="home.main.other.disclaimer.part4" bundle="${msg}" /></p>
				<!--/.container-->
				</div>
		</div>
	</section>

	<!--/#feature-->

	<section id="recent-works-homecare" class="hidden-xs hidden-sm">
		<div class="container">
			<div class="row hidden-sm hidden-xs">
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="<%=request.getContextPath()%>/resources/images/time.png" alt="<fmt:message key="image.alt_8" bundle="${msg}" />" />
							<h1>
								<fmt:message key="home.main.highlight1.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight1.heading.line2" bundle="${msg}" />
							</h1>
							<p>
								<fmt:message key="home.main.highlight1.desc.part1" bundle="${msg}" /> <a
									href="<fmt:message key="app.download.link" bundle="${msg}" />"
									target="_blank"> <fmt:message key="home.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="home.main.highlight1.desc.part3" bundle="${msg}" />
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap-mid wrap text-center">
						<div class="recent-work-inner">
							<img src="<%=request.getContextPath()%>/resources/images/secure.png" alt="" />
							<h1><fmt:message key="home.main.highlight2.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight2.heading.line2" bundle="${msg}" /></h1>
							<p>
								<fmt:message key="home.main.highlight2.desc" bundle="${msg}" /><br>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
					<div class="recent-work-wrap wrap text-center">
						<div class="recent-work-inner">
							<img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="<fmt:message key="image.alt_10" bundle="${msg}" />" />
							<h1><fmt:message key="home.main.highlight3.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight3.heading.line2" bundle="${msg}" /></h1>
							<p>
								<fmt:message key="home.main.highlight3.desc" bundle="${msg}" /><br>
							</p>

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

	<section id="recent-works-mob" class="hidden-lg hidden-md">
		<div class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div class="recent-work-wrap text-center">
								<div class="recent-work-inner">
									<img src="<%=request.getContextPath()%>/resources/images/time.png" alt="<fmt:message key="image.alt_8" bundle="${msg}" />" />

									<h1>
								<fmt:message key="home.main.highlight1.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight1.heading.line2" bundle="${msg}" />
							</h1>

								<p>
								<fmt:message key="home.main.highlight1.desc.part1" bundle="${msg}" /><a
									href="<fmt:message key="app.download.link" bundle="${msg}" />"
									target="_blank"> <fmt:message key="home.main.highlight1.desc.part2" bundle="${msg}" /></a> <fmt:message key="home.main.highlight1.desc.part3" bundle="${msg}" />
								</p>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
				<div class="item">
					<div class="container">
						<div class="row slide-margin">
							<div class="recent-work-wrap-mid text-center">
								<div class="recent-work-inner">
									<img src="<%=request.getContextPath()%>/resources/images/secure.png" alt="" />
										<h1>
								<fmt:message key="home.main.highlight2.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight2.heading.line2" bundle="${msg}" />
							</h1>
									<p>
										<fmt:message key="home.main.highlight2.desc" bundle="${msg}" /><br>
									</p>
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
								<div class="recent-work-inner">
									<img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt="<fmt:message key="image.alt_10" bundle="${msg}" />" />
									<h1>
										<fmt:message key="home.main.highlight3.heading.line1" bundle="${msg}" /><br> <fmt:message key="home.main.highlight3.heading.line2" bundle="${msg}" />
									</h1>
									<p><fmt:message key="home.main.highlight3.desc" bundle="${msg}" /><br></p>

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
		<a class="prev" href="#recent-works-mob" data-slide="prev"> <i
			class="fa fa-chevron-left"></i>
		</a> <a class="next" href="#recent-works-mob" data-slide="next"> <i
			class="fa fa-chevron-right"></i>
		</a>
	</section>

    <div class="content-disclaimer">
       <p><fmt:message key="Home.Landing.Disclaimer" bundle="${msg}" /></p>
    </div>


	<!--/#testiomonials-->
	<section id="testimonials" class="hidden-sm hidden-xs">
		<div class="container pad-none">
			<!--desktop-testimonials-->
			<div class="hidden-sm hidden-xs">
				<div class="center">
					<h2><fmt:message key="home.main.testimonial.heading" bundle="${msg}" /></h2>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-left">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none text-italic">
								<fmt:message key="home.main.testimonial.customer1" bundle="${msg}" />

							</p>
							<br>
							<div class="hr1"></div>
							<h2><fmt:message key="home.main.testimonial.customer1.name" bundle="${msg}" /></h2>
							<h4></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-5 pad-none pull-right">
					<div class="testimonials-wrap text-center">
						<div class="testimonials-inner text-center">
							<div class="h1-1">
								<blockquote class="testimonial"></blockquote>
							</div>
							<p class="pad-none text-italic">

								<fmt:message key="home.main.testimonial.customer2" bundle="${msg}" />
								</p>
							<div class="hr1"></div>
							<h2><fmt:message key="home.main.testimonial.customer2.name1" bundle="${msg}" /></h2>
							<h4><fmt:message key="home.main.testimonial.customer2.name2" bundle="${msg}" /></h4>
						</div>
					</div>
				</div>

				<div class="clearfix"></div>

				<br>
				<P class="pad-none p1">
					<br> <fmt:message key="home.main.testimonial.disclaimer" bundle="${msg}" />

				</P>
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
				<h2><fmt:message key="home.main.testimonial.heading" bundle="${msg}" /></h2>
			</div>
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<div class="row slide-margin">
							<div class="testimonials-wrap text-center">
								<div class="testimonials-inner travel-testimonial text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>
									<fmt:message key="home.main.testimonial.customer1" bundle="${msg}" />
									</p>
									<div class="hr1"></div>
									<h2><fmt:message key="home.main.testimonial.customer1.name" bundle="${msg}" /></h2>
									<h4></h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
				<div class="item">
					<div class="container">
						<div class="row slide-margin">
							<div class="testimonials-wrap text-center">
								<div class="testimonials-inner travel-testimonial text-center">
									<div class="h1-1">
										<blockquote class="testimonial"></blockquote>
									</div>
									<p>
									<fmt:message key="home.main.testimonial.customer2" bundle="${msg}" />
									</p>
									<div class="hr1"></div>
									<h2><fmt:message key="home.main.testimonial.customer2.name1" bundle="${msg}" /></h2>
									<h4><fmt:message key="home.main.testimonial.customer2.name2" bundle="${msg}" /></h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
		<a class="prev" href="#testimonials-mob" data-slide="prev"> <i
			class="fa fa-chevron-left"></i>
		</a> <a class="next" href="#testimonials-mob" data-slide="next"> <i
			class="fa fa-chevron-right"></i>
		</a>
		<P class="p1" style="padding:20px;">
                    <br> <fmt:message key="home.main.testimonial.disclaimer" bundle="${msg}" />
                </P>
	</section>
	<!--/#testiomonials mob-->

	<section class="blog-item hidden-sm hidden-xs">
		<div class="container pad-none">
			<div class="center">
				<h2><fmt:message key="home.main.blog.heading" bundle="${msg}" /></h2>
			</div>
			<div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx1">
						<div>
							<a href="<fmt:message key="home.blog.post1.link" bundle="${msg}" />" target="_blank"><img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home8.png" alt=""></a>
							<h3>
								<a href="<fmt:message key="home.blog.post1.link" bundle="${msg}" />" target="_blank">
									<fmt:message key="home.main.blog.subheading1.part1" bundle="${msg}" /> <fmt:message key="home.main.blog.subheading1.part2" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx2">
						<div>
							<a href="<fmt:message key="home.blog.post2.link" bundle="${msg}" />" target="_blank">
							<img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home9.png" alt="">
								</a>
							<h3>
								<a href="<fmt:message key="home.blog.post2.link" bundle="${msg}" />" target="_blank">
								<fmt:message key="home.main.blog.subheading2" bundle="${msg}" /> <i class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 pad-none">
					<div class="services-wrap service-bx3">
						<div>
						<a href="<fmt:message key="home.blog.post3.link" bundle="${msg}" />" target="_blank">
							<img class="img-responsive bdr-img"
								src="<%=request.getContextPath()%>/resources/images/home10.png" alt=""></a>
							<h3>
								<a href="<fmt:message key="home.blog.post3.link" bundle="${msg}" />" target="_blank">
									<fmt:message key="home.main.blog.subheading3.part1" bundle="${msg}" /> <fmt:message key="home.main.blog.subheading3.part2" bundle="${msg}" /> <i
									class="fa fa-caret-right"></i>
								</a>
							</h3>

						</div>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<p>
			<fmt:message key="home.main.blog.disclaimer" bundle="${msg}" />

			</p>


			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#services-->

	<!--bottom-form-->
	<section id="bottom-form" class="hidden-sm hidden-xs homecare">
		<div class="container">
			<div class="row">
				<form:form name="getHomeQuoteBottom" id="getHomeQuoteBottom" action="${pageContext.request.contextPath}/${language}/home-insurance/quote" method="post" modelAttribute="homeCarelPlan">
					<div class="col-lg-12 col-md-12 hidden-xs pad-none homecare slide-form">
						<!-- <h2><fmt:message key="home.main.quote.bottom.heading" bundle="${msg}" /></h2> -->
						<%
							List blst = (List) request
										.getAttribute("homeCareQuetionariesList");

								Iterator bitr = blst.iterator();
								int i = 1;
								while (bitr.hasNext()) {

									HomeCareQuetionaries bQuetionList = (HomeCareQuetionaries) bitr
											.next();
						%>

						<div class="col-lg-4 col-md-4 pad-none">
							<h4>
								<%=bQuetionList.getQuetion()%>
							</h4>
							<label class="radio radio-warning radio-inline radio-homecare"> <input
								type="hidden" id="lblCount" value="${homeCareQuetionariesList.size()}"></input> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio3a<%=bQuetionList.getQid()%>" data-id="home"
								value="<%=bQuetionList.getAnswer1()%>" <%=bQuetionList.getAnswer1Checked()%> type="radio">
								<label for="inlineDeskRadio3a<%=bQuetionList.getQid()%>">
									<span> <%=bQuetionList.getAnswer1()%>
								</span>
							</label>
							</label> <label class="radio radio-warning radio-inline radio-homecare"> <input
								name="home_situated<%=bQuetionList.getQid()%>"
								id="inlineDeskRadio3b<%=bQuetionList.getQid()%>" data-id="home"
								value="<%=bQuetionList.getAnswer2()%>" <%=bQuetionList.getAnswer2Checked()%> type="radio"> <label
								for="inlineDeskRadio3b<%=bQuetionList.getQid()%>"> <span>
										<%=bQuetionList.getAnswer2()%>
								</span>
							</label>
							</label>
						</div>
						<%
							}
								i++;
						%>
						<div class="col-md-4 ">
							<button type="submit"
								class="bdr-curve btn btn-primary btn-next btn-next2 btn-homecare btn-color-ylw"
								onclick="return msgAlertDesk('getHomeQuoteBottom')"><fmt:message key="home.main.quote.bottom.action" bundle="${msg}" /></button>
						</div>
						<div class="clearfix"></div>
						<p class="pad-none mute">
							<!-- FWD Easy HomeCare*<br>
							<br>  -->
							<fmt:message key="home.main.quote.terms" bundle="${msg}" />
						</p>
					</div>
				</form:form>
			</div>
		</div>
	</section>

	<!--/mob-#bottom-->
	<div class="modal fade" id="oldHome"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div id="homecareLandingModal" class="modal-content plan-modal">
		   <div class="modal-body">
		   <div style="overflow: hidden;"><a class="close" aria-label="Close" data-dismiss="modal">
                 <span aria-hidden="true" style="font-size:30px;">×</span>
               </a>
            </div>

		   		<p class="errorMsg"><fmt:message key="homecare.uw.question1.notEntitled.message" bundle="${msg}" /></p>
		   		<br/>
      		</div>
		</div>
	</div>
</div>
<style>
   @media screen and (max-width: 991px) {
   body {
      /* Hero image Position Fix*/
      padding-top: 50px;
   }
</style>
</body>
</html>
