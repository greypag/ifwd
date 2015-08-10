<%@page contentType="text/html" pageEncoding="UTF-8" %>
<footer>	
	<div class="footer-whole">
		<div class="fwd-full-container container-fluid menu-footer">
			<div class="fwd-container-limit footer-hotline-max-width">
				<div class="clearfix">
					<div class="pull-left footer-orange-menu">
						<ul class="nav clearfix">
							<li class="fwd-home"><a href="<fmt:message key="footer.menu.home.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.home" bundle="${msg}" /></a></li>
							<li class="reset-padding">|</li>
							<li><a href="<fmt:message key="header.menu.about.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.about" bundle="${msg}" /></a></li>
							<li class="reset-padding">|</li>
							<li class="blog"><a href="<fmt:message key="footer.menu.blog.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.blog" bundle="${msg}" /></a></li>
							<li class="reset-padding">|</li>
							<li class="faq"><a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.faq.link" bundle="${msg}" />"><fmt:message key="footer.menu.faq" bundle="${msg}" /></a></li>
							<li class="reset-padding">|</li>
							<li class="faq"><a href="<%=request.getContextPath()%>/<fmt:message key="footer.menu.partners.link" bundle="${msg}" />"><fmt:message key="footer.menu.partners" bundle="${msg}" /></a></li>
						</ul>
					</div>
					<div class="footer-menu-right">
						<div class="clearfix">
							<div class="pull-left">
								<ul class="nav footer-hotline">
									<li><a href="#">
											<div class="circle"><i class="fa fa-facebook"></i></div>
										</a></li>
									<li class="padding-left"><a href="#">
										<div class="circle"><i class="fa fa-youtube"></i></div>
									</a></li>
								</ul>
							</div>
							<div class="pull-right hotline-info-number">
								<div class="hotline-info"><fmt:message key="footer.hotline.part1" bundle="${msg}" /></div>
								<div class="hotline-number"><fmt:message key="footer.hotline.part2" bundle="${msg}" /></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="fwd-full-container container-fluid footer-tm">
			<div class="fwd-container-limit footer-max-width clearfix">
				<div class="footer-trade">
					<ul class="footer-list">
						<li><a href="<fmt:message key="footer.menu.security.link" bundle="${msg}" />" target="_blank"><fmt:message key="footer.menu.security" bundle="${msg}" /></a></li>
						<li class="rst-padding">|</li>
						<li><a href="<fmt:message key="footer.menu.disclaimer.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.disclaimer" bundle="${msg}" /> </a></li>
						<li class="rst-padding">|</li>
						<li><a href="<fmt:message key="footer.menu.privacy.link" bundle="${msg}" />" target="_blank"> <fmt:message key="footer.menu.privacy" bundle="${msg}" /></a></li>
					</ul>
				</div>
				<div class="footer-copyright">
					<fmt:message key="footer.copyright" bundle="${msg}" />
				</div>
			</div>
		</div>
	</div>
</footer>

<div class="overlay hidden hidden-xs hidden-sm" id="overlay"></div>