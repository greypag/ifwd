<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<header>
		<div class="full-width-container">
			<div class="container">
				<div class="top-nav">
					<div class="float-right">
						<div class="language">
							<ul class="nav">
								<!-- <li><a class="active" href="/fwdhk/changeLang?selectLang=en&action=/en" target="_top" data-lang="en">EN</a></li>
								<li><a class="inactive" href="/fwdhk/changeLang?selectLang=tc&action=/en" target="_top" data-lang="tc">中</a></li> -->
								<%
									//System.out.println("session.getAttribute(language).toString() " + session.getAttribute("language").toString());
									if ("en".equals(session.getAttribute("language").toString())) {
									%>
										<li><a class="inactive" href="" target="_top" onclick="" data-lang="en">EN</a></li>
										<li><a class="active" href="<%=request.getContextPath()%>/changeLang?selectLang=tc&action=<%=request.getServletPath()%><%=request.getQueryString()!=null?"?"+request.getQueryString():""%>" target="_top" onclick="perventRedirect=false;" data-lang="tc">中</a></li>
									<%
									} else {
									%>
										<li><a class="active" href="<%=request.getContextPath()%>/changeLang?selectLang=en&action=<%=request.getServletPath()%><%=request.getQueryString()!=null?"?"+request.getQueryString():""%>" target="_top" onclick="perventRedirect=false;" data-lang="en">EN</a></li>
										<li><a class="inactive" href="" target="_top" onclick="" data-lang="tc">中</a></li>
									<%
									}
									
									 %>
							</ul>
						</div>
					</div>
					<div class="logo-wrap">
						<a href="/fwdhk/en">
							<img class="logo" src="<%=request.getContextPath()%>/resources/images/passkit/mobile_logo.png" alt="" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>