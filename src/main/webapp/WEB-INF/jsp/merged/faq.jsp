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
					<li><a href="<%=request.getContextPath()%>/en/joinus#"><fmt:message key="header.menu.home" bundle="${msg}" /></a></li>
					<li class="active"><i class="fa fa-caret-right"></i><fmt:message key="header.menu.faq" bundle="${msg}" />FAQ</li>
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
			            <div class="faq_menu_item active" onclick="faqChangeCare(this, 'wh');"><fmt:message key="faq.working.holidayCare" bundle="${msg}" /></div>
			            <div class="faq_menu_item" onclick="faqChangeCare(this, 'f');"><fmt:message key="faq.flight.care" bundle="${msg}" /></div>
			            <div class="faq_menu_item" onclick="faqChangeCare(this, 't');"><fmt:message key="faq.travel.care" bundle="${msg}" /></div>
			            <div class="faq_menu_item" onclick="faqChangeCare(this, 'h');"><fmt:message key="faq.home.care" bundle="${msg}" /></div>
			            <div class="clearfix"></div>
			        </div>
                    
                    <!-- WH start -->
			        <div id="faq_wh" class="col-md-12 col-lg-12 pad-none faq_care_container">
			            <div class="col-md-12 col-lg-12 pad-none faq_content">
			                <div class="col-md-11 col-lg-11 pad-none faq_cat">
                               <fmt:message key="faq.related.questions" bundle="${msg}" /> 
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
	                                    <fmt:message key="faq.yes.policy" bundle="${msg}" />
	                                </div>
	                                <div class="clearfix"></div>
                                </div>
	                            
	                            <div class="clearfix"></div>
			                </div>
			                <div class="col-md-12 col-lg-12 pad-none faq_qna">
				                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
			                
			                <div class="clearfix"></div>
			            </div>
			            <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-md-12 col-lg-12 pad-none faq_content">
                            <div class="col-md-11 col-lg-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
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
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-12 col-lg-12 pad-none faq_qna">
                                <div class="col-md-12 col-lg-12 pad-none">
                                    <div class="col-md-11 col-lg-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-md-12 col-lg-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<div class="col-xs-12 col-sm-12 hidden-md hidden-lg pad-none faq_container_mob">
				    <div id="faq_main_menu_mob">
					    <div class="col-xs-12 col-sm-12 pad-none faq_description">
	                        <p class="h4-5" style="text-align:center;">
	                            <fmt:message key="faq.note" bundle="${msg}" /><br/>
	                            <br/>
	                            <fmt:message key="faq.refer.to" bundle="${msg}" /><br/>
	                            <fmt:message key="faq.compensation.apply" bundle="${msg}" />
	                        </p>
	                    </div>
	                    <div class="col-xs-12 col-sm-12 pad-none faq_menu">
	                        <div class="faq_menu_item" onclick="faqChangeCareMob('wh');"><fmt:message key="faq.working.holidayCare" bundle="${msg}" /></div>
	                        <div class="faq_menu_item" onclick="faqChangeCareMob('f');"><fmt:message key="faq.flight.care" bundle="${msg}" />Flight care</div>
	                        <div class="faq_menu_item" onclick="faqChangeCareMob('t');"><fmt:message key="faq.travel.care" bundle="${msg}" />Travel care</div>
	                        <div class="faq_menu_item" onclick="faqChangeCareMob('h');"><fmt:message key="faq.home.care" bundle="${msg}" />Home care</div>
	                        <div class="clearfix"></div>
	                    </div>
				    </div>
                    
                    <!-- WH start -->
                    <div id="faq_wh_mob" class="col-xs-12 col-sm-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-xs-12 col-sm-12 pad-none faq_title_container">
                            <div class="faq_back">
                                <i class="fa fa-arrow-left fa-2"></i>
                            </div>
                            <div class="faq_title">
                               <fmt:message key="faq.working.holidayCare" bundle="${msg}" />
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                    <div id="faq_f_mob" class="col-xs-12 col-sm-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                    <div id="faq_t_mob" class="col-xs-12 col-sm-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
                    <div id="faq_h_mob" class="col-xs-12 col-sm-12 pad-none faq_care_container" style="display:none;">
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_content">
                            <div class="col-xs-11 col-sm-11 pad-none faq_cat">
                                <fmt:message key="faq.related.questions" bundle="${msg}" />
                            </div>
                            <div class="col-xs-1 col-sm-1 pad-none faq_cat_arrow">
                                <a href="#" class="faq_cat_mini"><i class="fa fa-chevron-down"></i></a>
                            </div>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-xs-12 col-sm-12 pad-none faq_cat_detail" style="display:none;">
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-xs-12 col-sm-12 pad-none faq_qna">
                                <div class="col-xs-12 col-sm-12 pad-none">
                                    <div class="col-xs-11 col-sm-11 pad-none faq_question">
                                        <fmt:message key="faq.occupational.risks" bundle="${msg}" />
                                    </div>
                                    <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                                        <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                                    <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                                        <fmt:message key="faq.yes.policy" bundle="${msg}" />
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
				
				<div class="clearfix"></div>
			</div>
		</div>
		
		<script>
		  
		</script>
		<!--/.container-->
	</section>
