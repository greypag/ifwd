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
		<div class="container">
			<div class="row">
				<ol class="breadcrumb pad-none">
					<li><fmt:message key="header.menu.home" bundle="${msg}" /></li>
					<li class="active"><i class="fa fa-caret-right"></i><fmt:message key="header.menu.faq" bundle="${msg}" /></li>
				</ol>
				
				<div class="col-md-12 col-lg-12 hidden-xs hidden-sm pad-none faq_container">
				    <div class="col-md-12 col-lg-12 pad-none faq_description">
				        <p class="h4-5">
				            <fmt:message key="faq.note" bundle="${msg}" /><br/>
				            <br/>
				            <fmt:message key="faq.refer.to" bundle="${msg}" /><br/>
				            <fmt:message key="faq.compensation.apply" bundle="${msg}" />
				        </p>
				    </div>
			        <div class="col-md-12 col-lg-12 pad-none faq_menu">
		                <div class="faq-btn-wrapper">
	                        <div id="ElitetermFaq" class="faq_menu_item" onclick="faqChangeCare(this, 'e', false);"><fmt:message key="faq.eliteterm" bundle="${msg}" /></div>
	                        <div id="SavieFaq" class="faq_menu_item" onclick="faqChangeCare(this, 's', false);"><fmt:message key="faq.savie.care" bundle="${msg}" /></div>
	                        <div id="WorkingHolidayFaq" class="faq_menu_item last" onclick="faqChangeCare(this, 'wh', false);"><fmt:message key="faq.working.holidayCare" bundle="${msg}" /></div>		                
		                </div>  
			            <div class="clearfix"></div>
			            <div class="faq-btn-wrapper-bottom">
	                        <div id="FlightFaq" class="faq_menu_item" onclick="faqChangeCare(this, 'f', false);"><fmt:message key="faq.flight.care" bundle="${msg}" /></div>
	                        <div id="TravelFaq" class="faq_menu_item" onclick="faqChangeCare(this, 't', false);"><fmt:message key="faq.travel.care" bundle="${msg}" /></div>
	                        <div id="HomecareFaq" class="faq_menu_item last" onclick="faqChangeCare(this, 'h', false);"><fmt:message key="faq.home.care" bundle="${msg}" /></div>			            
			            </div>
			            <div class="clearfix"></div>
			        </div>
                    
                    <!-- Elite Term start -->
                    <div id="faq_e" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                               <fmt:message key="faq.eliteterm.group1" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>                            
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a3" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.eliteterm.group1.a3.li1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a3.li2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a3.li3" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a7" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group1.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group1.a8" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li5" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.eliteterm.group1.a8.li6" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.eliteterm.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a8" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a9" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a12" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a15" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q16" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a16" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q17" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a17" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q18" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a18" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group2.q19" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group2.a19" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>                           
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.eliteterm.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q20" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a20" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q21" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a21" bundle="${msg}" /><a class='faq_answer_url' href="<fmt:message key="faq.eliteterm.group3.a21.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.eliteterm.group3.a21.link" bundle="${msg}" /></u></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q22" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a22" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q23" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a23" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q24" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a24" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>                                                                                    
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.eliteterm.group3.q25" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.eliteterm.group3.a25" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div> 
                                                        
                            <div class="clearfix"></div>
                        </div>
                   
                        <div class="clearfix"></div>
                    </div>
                    <!-- Elite Term end -->
			        
			        <!-- Savie start -->
                    <div id="faq_s" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                               <fmt:message key="faq.savie.group1" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a1" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.savie.group1.a1.li1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.savie.group1.a1.li2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.savie.group1.a1.li3" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>                            
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a7" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a8" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a9" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a12" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a15" bundle="${msg}" />
                                        <table class="table table-bordred">
                                            <tr><td style="color: #fff;background-color: #f68a1d;"></td><td style="color: #fff;background-color: #f68a1d;"><fmt:message key="faq.savie.group1.a15.tr1.td2" bundle="${msg}" /></td></tr>
                                            <tr><td style="color: #fff;background-color: #f68a1d;"><fmt:message key="faq.savie.group1.a15.tr2.td1" bundle="${msg}" /></td><td><fmt:message key="faq.savie.group1.a15.tr2.td2" bundle="${msg}" /></td></tr>
                                            <tr><td style="color: #fff;background-color: #f68a1d;"><fmt:message key="faq.savie.group1.a15.tr3.td1" bundle="${msg}" /></td><td><fmt:message key="faq.savie.group1.a15.tr3.td2" bundle="${msg}" /></td></tr>
                                        </table>
                                        <fmt:message key="faq.savie.group1.a15.2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group1.q16" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group1.a16" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.savie.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q19" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a19" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q21" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a21" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q22" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a22" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q23" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a23" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q24" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a24" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q25" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a25" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q26" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a26" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group2.q27" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group2.a27" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.savie.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group3.q28" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group3.a28" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group3.q28_1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group3.a28_1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group3.q29" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group3.a29.part1" bundle="${msg}" /><br/>
                                        <a class='faq_answer_url' href="<fmt:message key="faq.savie.group3.a29.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.savie.group3.a29.link" bundle="${msg}" /></u></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.group3.q30" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.group3.a30" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.savie.oceanpark.group5" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.oceanpark.group5.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.oceanpark.group5.a1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                           
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.oceanpark.group5.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.oceanpark.group5.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.oceanpark.group5.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.oceanpark.group5.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.oceanpark.group5.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.oceanpark.group5.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.savie.oceanpark.group5.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.savie.oceanpark.group5.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>                        
                        <div class="clearfix"></div>
                    </div>
                    <!-- Savie end -->
                    
                    <!-- WH start -->
			        <div id="faq_wh" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
			            <div class="col-md-12 col-lg-12 pad-none faq_content">
			                <div class="col-md-11 col-lg-11 pad-none faq_cat">
                               <fmt:message key="faq.workingholiday.group1" bundle="${msg}" />
                            </div>
			                <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
			                    <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
			                </div>
			                
			                <div class="clearfix"></div>
			            </div>
			            <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
			                <div class="col-md-12 col-lg-12 pad-none faq_qna">
			                    <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
	                                    <fmt:message key="faq.workingholiday.group1.a1" bundle="${msg}" />
	                                </div>
	                                <div class="clearfix"></div>
                                </div>
	                            
	                            <div class="clearfix"></div>
			                </div>
			                <div class="col-md-12 col-lg-12 pad-none faq_qna">
				                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a7.part1" bundle="${msg}" /></br>
                                        <fmt:message key="faq.workingholiday.group1.a7.part2" bundle="${msg}" /></br></br>
                                        <fmt:message key="faq.workingholiday.group1.a7.part3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
			                <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a8" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group1.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group1.a9.part1" bundle="${msg}" /></br></br>
                                        <fmt:message key="faq.workingholiday.group1.a9.part2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>

			                <div class="clearfix"></div>
			            </div>
			            <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.workingholiday.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.claimProcedure.q" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.claimProcedure.a.part1" bundle="${msg}" /><br/><br/>
                                            <fmt:message key="faq.workingholiday.group2.claimProcedure.a.part2" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.desc1" bundle="${msg}" /> <a class="faq_answer_url" href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.link1" bundle="${msg}" /></u></a></li> 
                                            <li><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.desc4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.desc5" bundle="${msg}" /> <a class="faq_answer_url" href="<fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.link2" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.workingholiday.group2.claimProcedure.a.part3.link2" bundle="${msg}" /></u></a></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a12.part1" bundle="${msg}" /></br></br>
                                        <fmt:message key="faq.workingholiday.group2.a12.part2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a15" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q16" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a16" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q17" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a17" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q18" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a18" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.q19" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group2.a19" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.workingholiday.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group3.q20" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group3.a20" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group3.q21" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group3.a21" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group3.q22" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group3.a22.part1" bundle="${msg}" /></br></br>
                                        <ul>
                                            <li><fmt:message key="faq.workingholiday.group3.a22.part2.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.workingholiday.group3.a22.part2.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.workingholiday.group3.a22.part2.desc3" bundle="${msg}" /></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.workingholiday.group4" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group4.q23" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group4.a23" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group4.q24" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group4.a24" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group4.q25" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.workingholiday.group4.a25" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
			        </div>
			        <!-- WH end -->
                    
                    <!-- Flight start -->
			        <div id="faq_f" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.flight.group1" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group1.a7" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.flight.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.claimProcedure.q" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.claimProcedure.a.part1" bundle="${msg}" /><br/><br/>
                                            <fmt:message key="faq.flight.group2.claimProcedure.a.part2" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.flight.group2.claimProcedure.a.part3.desc1" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.flight.group2.claimProcedure.a.part3.link1" bundle="${msg}" /></u></a></li> 
                                            <li><fmt:message key="faq.flight.group2.claimProcedure.a.part3.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group2.claimProcedure.a.part3.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group2.claimProcedure.a.part3.desc4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group2.claimProcedure.a.part3.desc5" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="faq.flight.group2.claimProcedure.a.part3.link2" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.flight.group2.claimProcedure.a.part3.link2" bundle="${msg}" /></u></a></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a9" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a12" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group2.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group2.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.flight.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.flight.group3.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.flight.group3.a15.part1" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.flight.group3.a15.part2.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group3.a15.part2.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group3.a15.part2.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.flight.group3.a15.part2.desc4" bundle="${msg}" /></li>
                                        </ol>
                                        <fmt:message key="faq.flight.group3.a15.part3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                    <!-- Flight end -->
                    
                    <!-- Travel start -->
                    <div id="faq_t" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.travel.group1" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a7" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a8" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a9" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a12" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group1.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group1.a15" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.travel.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a15.part1" bundle="${msg}" /><br/><br/>
                                            <fmt:message key="faq.travel.group2.a15.part2" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.travel.group2.a15.part3.desc1" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.travel.group2.a15.part3.link1" bundle="${msg}" /></u></a></li> 
                                            <li><fmt:message key="faq.travel.group2.a15.part3.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a15.part3.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a15.part3.desc4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a15.part3.desc5" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="faq.travel.group2.a15.part3.link2" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.travel.group2.a15.part3.link2" bundle="${msg}" /></u></a></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q16" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a16" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q18" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a18" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q19" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a19" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q20" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a20" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q21" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a21" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group2.q22" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group2.a22.part1" bundle="${msg}" />
                                        <ol class="">
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc5" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc6" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc7" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc8" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc9" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group2.a22.part2.desc10" bundle="${msg}" /></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.travel.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group3.q26" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group3.a26" bundle="${msg}" />
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                           
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group3.q27" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group3.a27.part1" bundle="${msg}" /></br></br>
                                        <ul>
                                            <li><fmt:message key="faq.travel.group3.a27.part2.desc1" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group3.a27.part2.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.travel.group3.a27.part2.desc3" bundle="${msg}" /></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group3.q28" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group3.a28" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.travel.group3.q29" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.travel.group3.a29" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                    <!-- Travel end -->
                    
                    <!-- Home Care start -->
                    <div id="faq_h" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.home.group1" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q1" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a1" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q2" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a2" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q3" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a3" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q4" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a4" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q5" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a5" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q6" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a6" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q7" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a7" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q8" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a8" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q9" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a9" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q10" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a10" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q11" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a11" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q12" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a12" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q13" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a13" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q14" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a14" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q15" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a15" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q16" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a16" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group1.q17" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group1.a17" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>

                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.home.group2" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.workingholiday.group2.claimProcedure.q" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group2.claimProcedure.a.part1" bundle="${msg}" /><br/><br/>
                                            <fmt:message key="faq.home.group2.claimProcedure.a.part2" bundle="${msg}" />
                                        <ol>
                                            <li><fmt:message key="faq.home.group2.claimProcedure.a.part3.desc1" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="fwd.homepage.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.home.group2.claimProcedure.a.part3.link1" bundle="${msg}" /></u></a></li> 
                                            <li><fmt:message key="faq.home.group2.claimProcedure.a.part3.desc2" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.home.group2.claimProcedure.a.part3.desc3" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.home.group2.claimProcedure.a.part3.desc4" bundle="${msg}" /></li>
                                            <li><fmt:message key="faq.home.group2.claimProcedure.a.part3.desc5" bundle="${msg}" /> <a class='faq_answer_url' href="<fmt:message key="faq.home.group2.claimProcedure.a.part3.link2" bundle="${msg}" />" target="_blank"><u><fmt:message key="faq.home.group2.claimProcedure.a.part3.link2" bundle="${msg}" /></u></a></li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group2.q18" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group2.a18" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group2.q19" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group2.a19" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group2.q20" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group2.a20" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.home.group3" bundle="${msg}" />
                            </div>
                            <div class="col-md-1 col-lg-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group3.q21" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group3.a21" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group3.q22" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group3.a22" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.home.group3.q23" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.home.group3.a23.part1" bundle="${msg}" /></br></br>
                                        <fmt:message key="faq.home.group3.a23.part2" bundle="${msg}" />
                                        <table id="address_table" class="table table-bordred">
                                            <tbody>
                                                 <tr style="background-color: #f68a1d;">
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.header1" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.header2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.header3" bundle="${msg}" /></br></td>
                                                </tr>
                                                <tr>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row1.col1.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row1.col1.desc2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row1.col2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row1.col3.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row1.col3.desc2" bundle="${msg}" /></td>
                                                </tr>
                                                <tr>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row2.col1" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row2.col2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row2.col3.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row2.col3.desc2" bundle="${msg}" /></td>
                                                </tr>
                                                <tr>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row3.col1" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row3.col2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row3.col3.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row3.col3.desc2" bundle="${msg}" /></td>
                                                </tr>
                                                <tr>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row4.col1" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row4.col2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row4.col3.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row4.col3.desc2" bundle="${msg}" /></td>
                                                </tr>
                                                <tr>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row5.col1" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row5.col2" bundle="${msg}" /></td>
                                                    <td><fmt:message key="faq.home.group3.a23.part3.table.row5.col3.desc1" bundle="${msg}" /></br><fmt:message key="faq.home.group3.a23.part3.table.row5.col3.desc2" bundle="${msg}" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                    <!-- Home Care end -->
                    			        
			        <div class="clearfix"></div>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<jsp:include page="/WEB-INF/jsp/merged/faqMob.jsp" />
				
				<div class="clearfix"></div>
			</div>
		</div>
		
		<script>
        $(function() {
            //faqChangeCare("#OverseaFaq","o");
            $('input, textarea').placeholder();
            var curProductUrl = window.location.href;
            var productName = curProductUrl.substr(curProductUrl.indexOf("#") + 1)+"Faq";
            if(productName=="ElitetermFaq"){
                faqChangeCare(productName,"e", true);
            }else if(productName=="SavieFaq"){
                faqChangeCare(productName,"s", true);
            }else if(productName=="OverseaFaq"){
                faqChangeCare(productName,"o", true);
            }else if(productName=="WorkingHolidayFaq"){
                faqChangeCare(productName,"wh", true);          
            }else if(productName=="FlightFaq"){
                faqChangeCare(productName,"f", true);
            }else if(productName=="TravelFaq"){
                faqChangeCare(productName,"t", true);
            }else if(productName=="HomecareFaq"){
                faqChangeCare(productName,"h", true);
            }else{
            	faqChangeCare("ElitetermFaq","e", true);
            }  
        }); 	  
		</script>
		<!--/.container-->
	</section>