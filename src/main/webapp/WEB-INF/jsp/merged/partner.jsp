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
			<ol class="breadcrumb pad-none">
				<li><fmt:message key="header.menu.home" bundle="${msg}" /><i
					class="fa fa-caret-right"></i></li>
				<li><fmt:message key="home.breadcrumb1.type3" bundle="${msg}" /></li>
				<li class="active"><i class="fa fa-caret-right"></i> <fmt:message
						key="partner.partners.offers" bundle="${msg}" /></li>
			</ol>

			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading_title">
				<fmt:message key="partner.partners.offers" bundle="${msg}" />
			</div>
			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading">
				<div class="h4-5">
					<fmt:message key="partner.heading" bundle="${msg}" />
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_container">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_theclub.png"/>
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
                                            </ul>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice1" bundle="${msg}" /></p>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice2" bundle="${msg}" /></p>
                                        </li>
                                    </ul>
                                </div>
                            <div class="partner_tnc">
                                <div class="partner_tnc_list">
                                    <ul class="bullets">
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
                    <hr class="partner_hr"/>                                    
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_agoda.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.agoda.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.agoda.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part2" bundle="${msg}" /></a>
                                                <fmt:message key="partner.agoda.desc1.part3" bundle="${msg}" />
                                                <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part4" bundle="${msg}" /></a>
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
	                                                <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.tnc1.part2" bundle="${msg}" /></a>
	                                                <fmt:message key="partner.agoda.tnc1.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
<%-- 	                            <div class="partner_link"> --%>
<%-- 	                                <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a> --%>
<%-- 	                            </div> --%>
                    		</div>                              
	                	<div class="clearfix"></div>
                	</div>
                	
                	<!--  -->
                	<hr class="partner_hr"/>                                    
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/CSL_logo.png"/>
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
	                                                <a href="<%=request.getContextPath()%>/<fmt:message key="link.csl_simcard" bundle="${msg}" />" target="_blank"><fmt:message key="partner.csl.tnc1.part2" bundle="${msg}" /></a>
	                                                <fmt:message key="partner.csl.tnc1.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.csl.tnc1.part4" bundle="${msg}" />
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
				</div>
			</div>
		</div>
	</div>
</section>