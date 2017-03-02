<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!--   Main Content-->
<section id="contact-page">
	<div class="container mob-pad" id="joinus_form">
		<div class="row">
			<%--
			<ol class="breadcrumb pad-none">
				<li><fmt:message key="header.menu.home" bundle="${msg}" /><i
					class="fa fa-caret-right"></i></li>
				<li><fmt:message key="home.breadcrumb1.type3" bundle="${msg}" /></li>
				<li class="active"><i class="fa fa-caret-right"></i> <fmt:message
						key="partner.partners.offers" bundle="${msg}" /></li>
			</ol> 
			--%>
		<!-- Breadcrumb Component Start-->
    		<div class="container container-fluid container--breadcrumb">
        		<c:set var="breadcrumbItems">
            		breadcrumb.item.home,breadcrumb.item.enjoy,breadcrumb.item.offers
        		</c:set>
        	<c:set var="breadcrumbActive">2</c:set>
        	<c:set var="breadcrumbBold">true</c:set>
        
        	<jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            	<jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            	<jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
            	<jsp:param name="breadcrumbBold" value="${breadcrumbBold}"/>
        	</jsp:include>
    		</div>
    	<!-- Breadcrumb Component End-->
<%-- 
			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading_title">
				<fmt:message key="partner.partners.offers" bundle="${msg}" />
			</div>
--%>
			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading">
				<div class="h4-5">
					<fmt:message key="partner.heading" bundle="${msg}" />
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_container">
					<%-- 3HK --%>
                    <%-- <div id="3HK_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="3HK">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image--3hk partner_image" src="<%=request.getContextPath()%>/resources/images/partner_3hk.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.3HK.title" bundle="${msg}" /></div>
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.3hk.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="partner.3hk.desc1.part2.url" bundle="${msg}" />" target="_blank">
													<fmt:message key="partner.3hk.desc1.part2" bundle="${msg}" />
												</a>
												<fmt:message key="partner.3hk.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.3hk.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.3hk.tnc2.part1" bundle="${msg}" />
													<a href="<%=request.getContextPath()%>/<fmt:message key="partner.3hk.tnc2.part2.url" bundle="${msg}" />" target="_blank">
														<fmt:message key="partner.3hk.tnc2.part2" bundle="${msg}" />
													</a>
													<fmt:message key="partner.3hk.tnc2.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>
					--%>
					<%-- 7-Eleven --%>
                	<hr class="partner_hr"/>
                    <div id="7eleven_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="7eleven">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image--711 partner_image" src="<%=request.getContextPath()%>/resources/images/7-Eleven_Bar_Logo.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.711.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
										<li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.711.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="partner.711.desc1.part2.url" bundle="${msg}" />" target="_blank">
													<fmt:message key="partner.711.desc1.part2" bundle="${msg}" />
												</a>
												<fmt:message key="partner.711.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.711.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.711.tnc2.part1" bundle="${msg}" />
													<a href="<%=request.getContextPath()%>/<fmt:message key="partner.711.tnc2.part2.url" bundle="${msg}" />" target="_blank">
														<fmt:message key="partner.711.tnc2.part2" bundle="${msg}" />
													</a>
													<fmt:message key="partner.711.tnc2.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>

					<%-- Agoda 
					<hr class="partner_hr"/>
                    <div id="agoda_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="agoda">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_agoda.png" alt="<fmt:message key="image.alt_62" bundle="${msg}" />"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.agoda.title" bundle="${msg}" /></div>
                            <div class="partner_desc_list">
                                    <ul class="bullets">
										<li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.agoda.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="partner.agoda.desc1.part2.url" bundle="${msg}" />" target="_blank">
													<fmt:message key="partner.agoda.desc1.part2" bundle="${msg}" />
												</a>
												<fmt:message key="partner.agoda.desc1.part3" bundle="${msg}" />
												<a href="<fmt:message key="partner.agoda.desc1.part4.url" bundle="${msg}" />" target="_blank">
													<fmt:message key="partner.agoda.desc1.part4" bundle="${msg}" />
												</a>
												<fmt:message key="partner.agoda.desc1.part5" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.agoda.tnc1.part1" bundle="${msg}" />
													<a href="<%=request.getContextPath()%>/<fmt:message key="partner.agoda.tnc1.part2.url" bundle="${msg}" />" target="_blank">
														<fmt:message key="partner.agoda.tnc1.part2" bundle="${msg}" />
													</a>
													<fmt:message key="partner.agoda.tnc1.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>
					--%>
					<%-- Cathay Pacific --%>
					<hr class="partner_hr"/>
                    <div id="cathay_pacific_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="cathay_pacific">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image--cathay-pacific partner_image"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.cathay_pacific.title" bundle="${msg}" /></div>
                            <div class="partner_desc_list">
                                    <ul class="bullets">
										<li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.cathay_pacific.desc1.part1" bundle="${msg}" />
                                                <%--
																<a href="<%=request.getContextPath()%><fmt:message key="partner.cathay_pacific.desc1.part2.url" bundle="${msg}" />" target="_blank">
																	<fmt:message key="partner.cathay_pacific.desc1.part2" bundle="${msg}" />
																</a>
																--%>
												<fmt:message key="partner.cathay_pacific.desc1.part2" bundle="${msg}" />
												<fmt:message key="partner.cathay_pacific.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
										<li style="list-style: none;">
                                            <ul class="desc_sublist">
                                                <%-- <li><p class="h4-5"><fmt:message key="partner.cathay_pacific.desc1.point1" bundle="${msg}" /></p></li> --%>
												<li><p class="h4-5"><fmt:message key="partner.cathay_pacific.desc1.point2" bundle="${msg}" /></p></li>
												<li><p class="h4-5"><fmt:message key="partner.cathay_pacific.desc1.point3" bundle="${msg}" /></p></li>
                                            </ul>
                                            <%--<p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice1" bundle="${msg}" /></p> --%>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.cathay_pacific.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.cathay_pacific.tnc2.part1" bundle="${msg}" />
													<a href="<%=request.getContextPath()%>/<fmt:message key="partner.cathay_pacific.tnc2.part2.url" bundle="${msg}" />" target="_blank">
														<fmt:message key="partner.cathay_pacific.tnc2.part2" bundle="${msg}" />
													</a>
													<fmt:message key="partner.cathay_pacific.tnc2.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>

					<%-- cFu Come --%>
                	<hr class="partner_hr"/>
                    <div id="cfucome_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="cfucome">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_logo_cfucome.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.cfu.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.cfu.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
										<li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.cfu.desc1.part1" bundle="${msg}" />
                                                <a href="<%=request.getContextPath()%>" target="_blank">
													<fmt:message key="partner.cfu.desc1.part2" bundle="${msg}" />
												</a>
												<fmt:message key="partner.cfu.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_desc_list">
	                                    <ul class="bullets">
											<li style="list-style: none;">
	                                            <ol class="desc_sublist" style="color:black;">
													<li><p class="h4-5"><b><fmt:message key="partner.cfu.desc1.part1_1.title" bundle="${msg}" /></b><fmt:message key="partner.cfu.desc1.part1_1.part1" bundle="${msg}" /><a href="<fmt:message key="link.partner.cfu.come.link1" bundle="${msg}" />" target="_blank"><fmt:message key="partner.cfu.desc1.part1_1.part2" bundle="${msg}" /></a><fmt:message key="partner.cfu.desc1.part1_1.part3" bundle="${msg}" /><br><br><fmt:message key="partner.cfu.desc1.remark.directed.out" bundle="${msg}" /><br><fmt:message key="partner.cfu.desc1.part1_1_offer_period" bundle="${msg}" /></p><br></li>
													<li><p class="h4-5"><b><fmt:message key="partner.cfu.desc1.part1_3.title" bundle="${msg}" /></b><fmt:message key="partner.cfu.desc1.part1_3.part1" bundle="${msg}" /><a href="<fmt:message key="link.partner.cfu.come.link3" bundle="${msg}" />" target="_blank"><fmt:message key="partner.cfu.desc1.part1_3.part2" bundle="${msg}" /></a><fmt:message key="partner.cfu.desc1.part1_3.part3" bundle="${msg}" /><br><br><fmt:message key="partner.cfu.desc3.remark.directed.out.part1" bundle="${msg}" /><a href="<fmt:message key="link.partner.cfu.come.link3" bundle="${msg}" />"><fmt:message key="partner.cfu.desc3.remark.directed.out.part2" bundle="${msg}" /></a><fmt:message key="partner.cfu.desc3.remark.directed.out.part3" bundle="${msg}" /><br><fmt:message key="partner.cfu.desc1.part1_3_offer_period" bundle="${msg}" /></p><br></li>
													<li><p class="h4-5"><b><fmt:message key="partner.cfu.desc1.part1_2.title" bundle="${msg}" /></b><fmt:message key="partner.cfu.desc1.part1_2.part1" bundle="${msg}" /><a href="<fmt:message key="link.partner.cfu.come.link2" bundle="${msg}" />" target="_blank"><fmt:message key="partner.cfu.desc1.part1_2.part2" bundle="${msg}" /></a><fmt:message key="partner.cfu.desc1.part1_2.part3" bundle="${msg}" /><br><br><fmt:message key="partner.cfu.desc1.remark.directed.out" bundle="${msg}" /><br><fmt:message key="partner.cfu.desc1.part1_2_offer_period" bundle="${msg}" /></p><br></li>
	                                            </ol>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
								<div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
	                                        <li><p class="h4-5"><fmt:message key="partner.cfu.tnc1.part1" bundle="${msg}" /></p></li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <%-- <div class="partner_link"> --%>
	                            <%--     <a href="<fmt:message key="agoda.promo3.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a> --%>
	                            <%-- </div> --%>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>

                	<%-- CSL --%>
                	<hr class="partner_hr"/>
                    <div id="csl_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="csl">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/CSL_logo.png" alt="<fmt:message key="image.alt_63" bundle="${msg}" />"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.csl.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.csl.desc1.part1" bundle="${msg}" />
                                                <b><fmt:message key="partner.csl.desc1.part1_1" bundle="${msg}" /></b>
                                                <fmt:message key="partner.csl.desc1.part1_2" bundle="${msg}" />
                                                <a href="<fmt:message key="csl.promo1.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.csl.desc1.part2" bundle="${msg}" /></a>
                                                <fmt:message key="partner.csl.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.csl.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.csl.tnc2.part1" bundle="${msg}" />
	                                                <a href="<%=request.getContextPath()%>/<fmt:message key="partner.csl.tnc2.part2.url" bundle="${msg}" />"><fmt:message key="partner.csl.tnc2.part2" bundle="${msg}" /></a>
	                                                <fmt:message key="partner.csl.tnc2.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <%-- <div class="partner_link"> --%>
	                            <%--     <a href="<fmt:message key="agoda.promo3.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a> --%>
	                            <%-- </div> --%>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>

                	<%-- KLOOK --%>
                	<hr class="partner_hr"/>
                    <div id="klook" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="klook">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image partner_image--klook" src="<%=request.getContextPath()%>/resources/images/KLOOK_LOGO_HK_MKT.png" alt="<fmt:message key="image.alt_63" bundle="${msg}" />"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.klook.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.klook.desc1.part1" bundle="${msg}" />
                                                <%-- <fmt:message key="partner.klook.desc1.link" bundle="${msg}" />
                                                <fmt:message key="partner.klook.desc1.part2" bundle="${msg}" /> --%>
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                                <%--
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                	<ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.klook.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.klook.tnc2.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                            --%>
	                            <% /* <div class="partner_link"> */%>
	                            <% /*     <a href="<fmt:message key="agoda.promo3.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a> */%>
	                            <% /* </div> */%>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>
					 
					<%-- Sony --%>
                	<%--<hr class="partner_hr"/>
                     <div id="sony_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="sony">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image--sony partner_image" src="<%=request.getContextPath()%>/resources/images/partner_sony_logo.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.sony.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.sony.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="link.partner.sony.link1" bundle="${msg}" />" target="_blank"><fmt:message key="partner.sony.desc1.part2" bundle="${msg}" /></a><fmt:message key="partner.sony.desc1.part3" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.sony.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.sony.tnc2.part1" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="link.partner.sony.link2" bundle="${msg}" />" target="_blank"><fmt:message key="partner.sony.tnc2.part2" bundle="${msg}" /></a><fmt:message key="partner.sony.tnc2.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.sony.tnc3.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>
					--%>
					<%-- Tap & Go --%>
                	<hr class="partner_hr"/>
                    <div id="tng" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="tng">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image partner_image--tng" src="<%=request.getContextPath()%>/resources/images/tng.png" alt="<fmt:message key="image.alt_63" bundle="${msg}" />"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.tng.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.tng.desc1.part1" bundle="${msg}" />
                                                <fmt:message key="partner.tng.desc1.link" bundle="${msg}" />
                                                <fmt:message key="partner.tng.desc1.part2" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
											<li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.tng.tnc1.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.tng.tnc2.part1" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <%-- <div class="partner_link"> --%>
	                            <%--     <a href="<fmt:message key="agoda.promo3.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a> --%>
	                            <%-- </div> --%>
                    		</div>
	                	<div class="clearfix"></div>
                	</div>
					<%-- the Club --%>
                	<hr class="partner_hr"/>
                    <div id="theclub_nodefault" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content" name="theclub">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_theclub.png" alt="<fmt:message key="image.alt_61" bundle="${msg}" />"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.the.club.title" bundle="${msg}" /></div>
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                           <p class="h4-5"><fmt:message key="partner.the.club.desc1" bundle="${msg}" /></p>
                                        </li>
                                        <li style="list-style: none;">
                                            <ul class="desc_sublist">
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point1" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point2" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point3" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point4" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point5" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point6" bundle="${msg}" /></p></li>
                                            </ul>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice1" bundle="${msg}" /></p>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice2" bundle="${msg}" /></p>
                                        </li>
                                    </ul>
                                </div>
                            <div class="partner_tnc">
                                <div class="partner_tnc_list">
                                    <ul class="bullets">
                                    	<%-- <li>
                                    	   <p class="h4-5"> <fmt:message key="partner.the.club.3x.period" bundle="${msg}" /></p>
                                    	</li>--%>
                                        <li>
                                           <p class="h4-5"><fmt:message key="the.club.copy8.1" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.the.club.tnc1.part2" bundle="${msg}" /></a> <fmt:message key="partner.the.club.tnc1.part3" bundle="${msg}" /></p>
                                         </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="partner_link">
                               <a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.visit.website" bundle="${msg}" /></u></a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

				</div>
			</div>
		</div>
	</div>
<script>
// #3988 & 3976 update
(function() {
	var languageP = "${language}";
	var currentPath = "<%=request.getContextPath()%>";

	if ( languageP == 'en') {

		$('.partner_image.partner_image--cathay-pacific').attr("src", currentPath + "/resources/images/partner_cx_" + languageP + ".png");

	} else if ( languageP == 'tc') {

		// $('.partner_image.partner_image--cathay-pacific').attr("src", currentPath + "/resources/images/partner_cx_" + languageP + ".png");
		$('.partner_image.partner_image--cathay-pacific').attr("src", currentPath + "/resources/images/partner_cx_en.png");

	} else {

		$('.partner_image.partner_image--cathay-pacific').attr("src", currentPath + "/resources/images/partner_cx_en.png");
		console.error('No defaulted language found');

	}
})();
// End of #3988 & 3976 update

$(window).on("hashchange", function () {
    window.scrollTo(window.scrollX, window.scrollY - 100);
});
$(window).load(function(e){
	$(".partner_content").each(function(){
		var new_id = $(this).attr("id").replace("_nodefault","");
		$(this).attr("id",new_id);
	});
	if(location.href.indexOf("#") != -1){
		$('html, body').animate({ scrollTop: $(location.hash).offset().top - 100 });
	}
});
</script>
</section>
