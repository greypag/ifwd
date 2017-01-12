<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div id="faq_wealthree_mob" class="col-xs-12 col-sm-12 pad-none faq_care_container" style="display:none;">
    <div class="col-xs-12 col-sm-12 hidden-md hidden-lg pad-none faq_title_container">
        <div class="faq_back" onclick="faqMainMenuMob('wealthree')">
            <i class="fa fa-arrow-left fa-2"></i>
        </div>
        <div class="faq_title">
           <fmt:message key="faq.wealthree" bundle="${msg}" />
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="col-xs-12 col-sm-12 pad-none faq_content">
        <div class="col-xs-11 col-sm-11 pad-none faq_cat">
           <fmt:message key="faq.wealthree.group1" bundle="${msg}" />
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
                    <fmt:message key="faq.wealthree.group1.q1" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                	<fmt:message key="faq.wealthree.group1.a1" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group1.q2" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
					<fmt:message key="faq.wealthree.group1.a2" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group1.q3" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group1.a3" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group1.q4" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group1.a4" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group1.q5" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group1.a5" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>                                               
        <div class="clearfix"></div>                                                                                                                                           
    </div>
    
    <div class="col-xs-12 col-sm-12 pad-none faq_content">
        <div class="col-xs-11 col-sm-11 pad-none faq_cat">
           <fmt:message key="faq.wealthree.group2" bundle="${msg}" />
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
                    <fmt:message key="faq.wealthree.group2.q6" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                	<fmt:message key="faq.wealthree.group2.a6" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group2.q7" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
					<fmt:message key="faq.wealthree.group2.a7" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group2.q8" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group2.a8" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>                                               
        <div class="clearfix"></div>                                                                                                                                           
    </div>

    <div class="col-xs-12 col-sm-12 pad-none faq_content">
        <div class="col-xs-11 col-sm-11 pad-none faq_cat">
           <fmt:message key="faq.wealthree.group3" bundle="${msg}" />
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
                    <fmt:message key="faq.wealthree.group3.q9" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                	<fmt:message key="faq.wealthree.group3.a9" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q10" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
					<fmt:message key="faq.wealthree.group3.a10" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q11" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a11" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>      
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q12" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a12" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q13" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a13" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q14" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a14" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q15" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a15" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q16" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a16" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q17" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a17" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-xs-12 col-sm-12 pad-none faq_qna">
            <div class="col-xs-12 col-sm-12 pad-none">
                <div class="col-xs-11 col-sm-11 pad-none faq_question">
                    <fmt:message key="faq.wealthree.group3.q18" bundle="${msg}" />
                </div>
                <div class="col-xs-1 col-sm-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-xs-12 col-sm-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-xs-12 col-sm-12 pad-none faq_answer">
                    <fmt:message key="faq.wealthree.group3.a18" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>                                                                                                       
        <div class="clearfix"></div>                                                                                                                                           
    </div>
              
	<div class="clearfix"></div>
</div>