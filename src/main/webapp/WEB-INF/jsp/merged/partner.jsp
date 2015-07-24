<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

	<!--   Main Content-->
	<section id="contact-page">
		<div class="container mob-pad" id="joinus_form">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><a href="http://localhost:8080/FWDHKPH1A/en/joinus#"><fmt:message key="header.menu.home" bundle="${msg}" /></a></li>
					<li class="active"><i class="fa fa-caret-right"></i> <fmt:message key="partner.partners.offers" bundle="${msg}" />
					</li>
				</ol>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_container">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
					    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
					        <img class="partner_image" src="http://localhost:8080/FWDHKPH1A/resources/images/partner_agoda.png"/>
					    </div>
					    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
	                        <div class="partner_title"><fmt:message key="partner.title.agoda" bundle="${msg}" /></div>
	                        <div class="partner_description h4-5"><fmt:message key="partner.travelCare.description" bundle="${msg}" /></div>
	                        <div class="partner_tnc">
	                            <div class="h4-5"><fmt:message key="partner.terms.conditions" bundle="${msg}" /></div>
	                            <div class="partner_tnc_list">
									<ul class="bullets">
										<li>
									        <p class="h4-5"><fmt:message key="partner.offer.validUntil" bundle="${msg}" /></p>
										</li>
										<li>
										   <p class="h4-5"><fmt:message key="partner.not.applicable" bundle="${msg}" /></p>
										</li>
										<li>
										   <p class="h4-5"><fmt:message key="partner.final.agoda" bundle="${msg}" /></p>
										</li>
									</ul>
	                            </div>
	                        </div>
	                        <div class="partner_link">
	                           <a href="#" target="_blank"><u><fmt:message key="partner.visit.website" bundle="${msg}" /></u></a>
	                        </div>
	                    </div>
					    <div class="clearfix"></div>
					</div>
					<hr class="partner_hr"/>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
	                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
	                        <img class="partner_image" src="http://localhost:8080/FWDHKPH1A/resources/images/partner_Boconcept.png"/>
	                    </div>
	                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
	                        <div class="partner_title"><fmt:message key="partner.title.agoda" bundle="${msg}" /></div>
	                        <div class="partner_description h4-5"><fmt:message key="partner.travelCare.description" bundle="${msg}" /></div>
	                        <div class="partner_tnc">
	                            <div class="h4-5"><fmt:message key="partner.terms.conditions" bundle="${msg}" /></div>
	                            <div class="partner_tnc_list">
	                                <ul class="bullets">
	                                    <li>
	                                        <p class="h4-5"><fmt:message key="partner.offer.validUntil" bundle="${msg}" /></p>
	                                    </li>
	                                    <li>
	                                       <p class="h4-5"><fmt:message key="partner.not.applicable" bundle="${msg}" /></p>
	                                    </li>
	                                    <li>
	                                       <p class="h4-5"><fmt:message key="partner.final.agoda" bundle="${msg}" /></p>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	                        <div class="partner_link">
                               <a href="#" target="_blank"><u><fmt:message key="partner.visit.website" bundle="${msg}" /></u></a>
                            </div>
	                    </div>
	                    <div class="clearfix"></div>
	                </div>
	                <hr class="partner_hr"/>
	                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
	                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
	                        <img class="partner_image" src="http://localhost:8080/FWDHKPH1A/resources/images/partner_y5.png"/>
	                    </div>
	                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
	                        <div class="partner_title"><fmt:message key="partner.title.agoda" bundle="${msg}" /></div>
	                        <div class="partner_description h4-5"><fmt:message key="partner.travelCare.description" bundle="${msg}" /></div>
	                        <div class="partner_tnc">
	                            <div class="h4-5"><fmt:message key="partner.terms.conditions" bundle="${msg}" /></div>
	                            <div class="partner_tnc_list">
	                                <ul class="bullets">
	                                    <li>
	                                        <p class="h4-5"><fmt:message key="partner.offer.validUntil" bundle="${msg}" /></p>
	                                    </li>
	                                    <li>
	                                       <p class="h4-5"><fmt:message key="partner.not.applicable" bundle="${msg}" /></p>
	                                    </li>
	                                    <li>
	                                       <p class="h4-5"><fmt:message key="partner.final.agoda" bundle="${msg}" /></p>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	                        <div class="partner_link">
                               <a href="#" target="_blank"><u><fmt:message key="partner.visit.website" bundle="${msg}" /></u></a>
                            </div>
	                    </div>
	                    <div class="clearfix"></div>
	                </div>
	                <div class="clearfix"></div>
                </div>
			</div>
		</div>
		<!--/.container-->
	</section>