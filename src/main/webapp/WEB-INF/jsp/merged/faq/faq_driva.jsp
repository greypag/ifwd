<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div id="faq_driva" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
           <fmt:message key="faq.driva.group1" bundle="${msg}" />
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
                    <fmt:message key="faq.driva.group1.q1" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a1" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q2" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
            	<div class="col-md-12 col-lg-12 pad-none faq_answer">
            	<fmt:message key="faq.driva.group1.a2" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q3" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a3" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q4" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a4" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                   	<fmt:message key="faq.driva.group1.q5" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.driva.group1.a5" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q6" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.driva.group1.a6" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q7" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a7" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q8" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a8" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q9" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a9" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group1.q10" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group1.a10" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.driva.group2" bundle="${msg}" />
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
                    <fmt:message key="faq.driva.group2.q11" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.a11" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group2.q12" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.a12" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group2.q13" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.q13" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group2.q14" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.q14" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group2.q15" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.a15" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.driva.group3" bundle="${msg}" />
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
                    <fmt:message key="faq.driva.group3.q16" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group3.a16" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group3.q17" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group3.a17" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group3.q18" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group3.a18" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group3.q19" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group3.a19" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group3.q20" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group3.a20" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group2.q21" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group2.a21" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>        
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.driva.group4" bundle="${msg}" />
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
                    <fmt:message key="faq.driva.group4.q22" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group4.a22" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group4.q23" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group4.a23" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group4.q24" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<ul>
                		<li><fmt:message key="faq.driva.group4.a24.li1" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.driva.group4.a24.li2" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.driva.group4.a24.li3" bundle="${msg}" /></li>
                	</ul>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group4.q25" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<ul>
                		<li><fmt:message key="faq.driva.group4.a25.li1" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.driva.group4.a25.li2" bundle="${msg}" /></li>
                	</ul>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group4.q26" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group4.a26" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group4.q27" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group4.a27" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>        
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.driva.group5" bundle="${msg}" />
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
                    <fmt:message key="faq.driva.group5.q28" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group5.a28" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group5.q29" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group5.a29" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group5.q30" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group5.a30" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.driva.group5.q31" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.driva.group5.a31" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>        
        <div class="clearfix"></div>
    </div>             
    <div class="clearfix"></div>
</div>