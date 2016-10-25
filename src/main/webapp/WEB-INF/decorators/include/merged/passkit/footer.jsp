<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="passkit" var="msg" />
<footer class="footer-small visible-sm visible-xs">
		<div class="container">
			<div class="corp-links">
				<ul class="nav">
					<li><a href="http://www.fwd.com.hk/tc" target="_blank"><fmt:message key="passkit.footer.home.link" bundle="${msg}" /></a></li>
					<li><a href="http://blog.fwd.com.hk/zh" target="_blank"><fmt:message key="passkit.footer.blog.link" bundle="${msg}" /></a></li>
				</ul>
			</div>
		</div>
		<div class="full-width-container">
			<div class="container">
				<div class="copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank"><fmt:message key="passkit.footer.online.security.link" bundle="${msg}" /></a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank"><fmt:message key="passkit.footer.disclaimer.link" bundle="${msg}" /></a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank"><fmt:message key="passkit.footer.personal.data.protection.policy.practices.link" bundle="${msg}" /></a></li>
					</ul>
					<p>&copy; <fmt:message key="passkit.footer.copyright" bundle="${msg}" /></p>
				</div>
			</div>
		</div>
	</footer>
	<footer class="footer-large hidden-sm hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank"><fmt:message key="passkit.footer.online.security.link" bundle="${msg}" /></a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank"><fmt:message key="passkit.footer.disclaimer.link" bundle="${msg}" /></a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank"><fmt:message key="passkit.footer.personal.data.protection.policy.practices.link" bundle="${msg}" /></a></li>
					</ul>
					<p>&copy; <fmt:message key="passkit.footer.copyright" bundle="${msg}" /></p>
				</div>
				<div class="col-sm-4 corp-links">
					<ul class="nav">
						<li><a href="http://www.fwd.com.hk/tc" target="_blank"><fmt:message key="passkit.footer.home.link" bundle="${msg}" /></a></li>
						<li><a href="http://blog.fwd.com.hk/zh" target="_blank"><fmt:message key="passkit.footer.blog.link" bundle="${msg}" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>