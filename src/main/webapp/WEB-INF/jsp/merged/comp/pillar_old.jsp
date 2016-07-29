<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section id="recent-works" class="hidden-xs hidden-sm">
  <div class="container pad-none"> 
    <!--Desktop Support-->
    <div class="row hidden-sm hidden-xs">
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/time.png" alt=""  />
            <h1><fmt:message key="flight.main.highlight1.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight1.heading.line2" bundle="${msg}" /></h1>
            <p>
              <fmt:message key="flight.main.highlight1.desc.part1" bundle="${msg}" /> <a href="<fmt:message key="app.download.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="flight.main.highlight1.desc.part2" bundle="${msg}" /></u> </a>  <fmt:message key="flight.main.highlight1.desc.part3" bundle="${msg}" />
            </p>
            </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap-mid wrap  text-center">
          <div class="recent-work-inner less-padding-orange"> <img src="<%=request.getContextPath()%>/resources/images/secure.png" alt=""  />
            <h1><fmt:message key="flight.main.highlight2.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight2.heading.line2" bundle="${msg}" /></h1>
              <p><fmt:message key="flight.main.highlight2.desc" bundle="${msg}" /><br>
              <br>
            </p>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 pad-none ">
        <div class="recent-work-wrap wrap  text-center">
          <div class="recent-work-inner"> <img src="<%=request.getContextPath()%>/resources/images/rewards.png" alt=""  />
             <h1><fmt:message key="flight.main.highlight3.heading.line1" bundle="${msg}" /><br>
              <fmt:message key="flight.main.highlight3.heading.line2" bundle="${msg}" /></h1>
            <p><fmt:message key="flight.main.highlight3.desc" bundle="${msg}" /></p>
          </div>
        </div>
      </div>
    </div>
    <!--End Desktop Support--> 
    
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<!--/#recent-works-->