<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="fna-icons-body text-center clearfix">
	<div class="fwd-container-limit" id="nav-holder">
		<ul class="nav nav-tabs row so-fna-row visible-xs visible-sm" role="tablist">
			<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li active" id="nav-title-1">
				<a href="#navtabs-1" role="tab" data-toggle="tab" class="navtabs-title first-fna ui-link"><fmt:message key="pillar.support.title" bundle="${msg}" /></a>
			</li>
			<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-2">
				<a href="#navtabs-2" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></a>
			</li>
			<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li" id="nav-title-3">
				<a href="#navtabs-3" role="tab" data-toggle="tab" class="navtabs-title ui-link"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></a>
			</li>
			<li role="presentation" class="col-lg-3 col-md-3 col-sm-3 col-xs-3 navtabs-li last" id="nav-title-4">
				<a href="#navtabs-4" role="tab" data-toggle="tab" class="navtabs-title last-fna ui-link"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></a>
			</li>
		</ul>
		<div class="fna-carousel carousel slide" id="so-carousel" data-ride="carousel" data-interval="false">
			<div class="tab-content carousel-inner clearfix" role="listbox">
				<div role="tabpanel" class="fna-tab-content tab-pane item active" id="navtabs-1" next-target="nav-title-2">
					<div class="so-fna-content">
						<div class="fna-icon-circle">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-1.png">1
						</div>
						<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.support.title" bundle="${msg}" /></h3>
						 <p><fmt:message key="pillar.support.copy1" bundle="${msg}" /> <!--<a href="#" class="eserv-link ui-link">eServices</a>--></p>
					</div>
				</div>
				<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-2" next-target="nav-title-3">
					<div class="so-fna-content">
						<div class="fna-icon-circle">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-2.png">2
						</div>
						<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.convenience.title" bundle="${msg}" /></h3>
						<p> <fmt:message key="pillar.convenience.copy1" bundle="${msg}" /></p>
					</div>
				</div>
				<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-3" next-target="nav-title-4">
					<div class="so-fna-content">
						<div class="fna-icon-circle">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-3.png">3
						</div>
						<h3 class="visible-md visible-lg tab-head"><fmt:message key="pillar.claim.easy.title" bundle="${msg}" /></h3>
						<p><fmt:message key="pillar.claim.easy.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.claims" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.claim.easy.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.claim.easy.copy1.part3" bundle="${msg}" /></p>
					</div>
				</div>
				<div role="tabpanel" class="fna-tab-content tab-pane item" id="navtabs-4" next-target="nav-title-1">
					<div class="so-fna-content">
						<div class="fna-icon-circle">
							<img src="<%=request.getContextPath()%>/resources/images/savie-regular/fna-4.png">4
						</div>
						<h3 class="visible-md visible-lg  tab-head"><fmt:message key="pillar.eservice.app.title" bundle="${msg}" /></h3>
						<p><fmt:message key="pillar.eservice.app.copy1.part1" bundle="${msg}" /> <a href="<fmt:message key="link.eservices" bundle="${msg}" />" class="eserv-link ui-link" target="_blank"><fmt:message key="pillar.eservice.app.copy1.part2" bundle="${msg}" /></a> <fmt:message key="pillar.eservice.app.copy1.part3" bundle="${msg}" /></p>
					</div>
				</div>
			</div>
			<!-- Carousel -->
			<a class="left carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="prev">
			</a>
			<a class="right carousel-control hidden-lg hidden-md ui-link" href="#so-carousel" role="button" data-slide="next">
			</a>
		</div>
	</div>
</div>
