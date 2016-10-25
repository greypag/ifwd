<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="passkit" var="msg" />
<footer class="footer-small visible-sm visible-xs">
		<div class="container">
			<div class="corp-links">
				<ul class="nav">
					<li><a href="http://www.fwd.com.hk/tc" target="_blank">富衛主頁</a></li>
					<li><a href="http://blog.fwd.com.hk/zh" target="_blank">富衛博客</a></li>
				</ul>
			</div>
		</div>
		<div class="full-width-container">
			<div class="container">
				<div class="copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank">網上保安</a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank">免責聲明</a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank">個人資料保護政策及執行</a></li>
					</ul>
					<p>&copy; 2016 富衛香港　版權所有　不得轉載</p>
				</div>
			</div>
		</div>
	</footer>
	<footer class="footer-large hidden-sm hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 copyright-links">
					<ul class="nav">
						<li><a href="https://www.fwd.com.hk/tc/online-security/" target="_blank">網上保安</a></li>
						<li><a href="https://www.fwd.com.hk/tc/disclaimer/" target="_blank">免責聲明</a></li>
						<li><a href="https://www.fwd.com.hk/tc/personal-data-protection-policy-and-practices/" target="_blank">個人資料保護政策及執行</a></li>
					</ul>
					<p>&copy; 2016 富衛香港　版權所有　不得轉載</p>
				</div>
				<div class="col-sm-4 corp-links">
					<ul class="nav">
						<li><a href="http://www.fwd.com.hk/tc" target="_blank">富衛主頁</a></li>
						<li><a href="http://blog.fwd.com.hk/zh" target="_blank">富衛博客</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>