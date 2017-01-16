<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<!-- Provie start -->
<div id="faq_prvoie" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
           <fmt:message key="faq.provie.group1" bundle="${msg}" />
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
                    <fmt:message key="faq.provie.group1.q1" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a1" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q2" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a2" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q3" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a3.part1" bundle="${msg}" />
                    <ol class="faq_answer__list--pad-left20">
                    	<li><fmt:message key="faq.provie.group1.a3.part1.li1" bundle="${msg}" /></li>
                    	<li><fmt:message key="faq.provie.group1.a3.part1.li2" bundle="${msg}" /></li>
                    	<li><fmt:message key="faq.provie.group1.a3.part1.li3" bundle="${msg}" /></li>
                    </ol>
                    <fmt:message key="faq.provie.group1.a3.part2" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q4" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a4" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q5" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a5" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q6" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <p>
                    	<fmt:message key="faq.provie.group1.a6.part1" bundle="${msg}" />
                    	<ul class="faq_answer__list--no-Style faq_answer__list--pad-left20">
                    		<li><fmt:message key="faq.provie.group1.a6.part1.li1" bundle="${msg}" /></li>
                    	</ul>                                        	
                    </p>
                     <p>
                    	<fmt:message key="faq.provie.group1.a6.part2" bundle="${msg}" />
                    	<ol class="faq_answer__list--pad-left20">
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li1" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li2" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li3" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li4" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li5" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li6" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li7" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part2.li8" bundle="${msg}" /></li>
                    	</ol>                                        	
                    </p>
                    <p>
                    	<fmt:message key="faq.provie.group1.a6.part3" bundle="${msg}" />
                    	<ol class="faq_answer__list--lo-roman faq_answer__list--pad-left20">
                    		<li><fmt:message key="faq.provie.group1.a6.part3.li1" bundle="${msg}" /></li>
                    		<li><fmt:message key="faq.provie.group1.a6.part3.li2" bundle="${msg}" /></li>
                    	</ol>                                        	
                    </p>
                    <p><fmt:message key="faq.provie.group1.a6.part4" bundle="${msg}" /></p>                                                                              
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q7" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a7" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q8" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a8" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q9" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a9" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q10" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a10" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q11" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a11" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q12" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a12" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q13" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a13" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q14" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a14" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q15" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a15" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q16" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a16" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q17" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a17" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q18" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a18" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q19" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a19" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q20" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a20" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q21" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a21" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q22" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a22.part1" bundle="${msg}" />
                    <table class="faq-answer__table">
                    	<tr>
                    		<td class="faq-answer__table__cell"></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row0.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row0.cell2" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row1.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row1.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row1.cell2" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row2.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row2.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group1.a22.table.row2.cell2" bundle="${msg}" /></td>
                    	</tr>
                    </table>                                        
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q23" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a23" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group1.q24" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group1.a24" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.provie.group2" bundle="${msg}" />
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
                    <fmt:message key="faq.provie.group2.q25" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group2.a25" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group2.q26" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group2.a26" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q27" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a27" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
         <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q28" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <p><fmt:message key="faq.provie.group2.a28.part1" bundle="${msg}" /></p>
                    <table class="faq-answer__table">
                    	<tr>
                    		<th rowspan="2" class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.th0" bundle="${msg}" /></th>
                    		<td colspan="3" class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row1.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row4.cell0" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row1.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row2.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row3.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row4.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<th class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.th1" bundle="${msg}" /></th>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row1.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row2.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row3.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row4.cell2" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<th class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.th2" bundle="${msg}" /></th>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row1.cell3" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row2.cell3" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row3.cell3" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.provie.group2.a28.table.row4.cell3" bundle="${msg}" /></td>
                    	</tr>	                    	  	                    	                    	
                    </table>
                   	<p>
                   		<fmt:message key="faq.provie.group2.a28.part2" bundle="${msg}" />
                   		<ol>
                   			<li><fmt:message key="faq.provie.group2.a28.part2.li1" bundle="${msg}" /></li>
                   			<li><fmt:message key="faq.provie.group2.a28.part2.li2" bundle="${msg}" /></li>
                   			<li><fmt:message key="faq.provie.group2.a28.part2.li3" bundle="${msg}" /></li>
                   		</ol>             		
                   	</p>                                         	
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q29" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a29" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q30" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a30" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q31" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a31" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q32" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a32" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q33" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a33" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q34" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a34" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
           <div class="col-md-12 col-lg-12 pad-none">
               <div class="col-md-11 col-lg-11 pad-none faq_question">
                   <fmt:message key="faq.provie.group2.q35" bundle="${msg}" />
               </div>
               <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                   <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
               </div>
               <div class="clearfix"></div>
           </div>
           <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
               <div class="col-md-12 col-lg-12 pad-none faq_answer">
                   <fmt:message key="faq.provie.group2.a35" bundle="${msg}" />
               </div>
               <div class="clearfix"></div>
           </div>

           <div class="clearfix"></div>
        </div>                                                                                 
        <div class="clearfix"></div>
    </div>
	<div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
        	<fmt:message key="faq.provie.group3" bundle="${msg}" />
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
                    <fmt:message key="faq.provie.group3.q36" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer faq-answer">
                    <fmt:message key="faq.provie.group3.a36" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q37" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a37" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q38" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a38" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q39" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer faq-answer">
                    <fmt:message key="faq.provie.group3.a39" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q40" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a40" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q41" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a41" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q42" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a42" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q43" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a43" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q44" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a44" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div> 
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q45" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a45" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.provie.group3.q46" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.provie.group3.a46" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>                                                       
        <div class="clearfix"></div>
    </div>
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
            <fmt:message key="faq.withdrawal.group.title" bundle="${msg}" />
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
                    <fmt:message key="faq.withdrawal.group.q1" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a1" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q2" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a2" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q3" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a3" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q4" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a4" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q5" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a5" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q6" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a6" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q7" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a7" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q8" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a8" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q9" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a9" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q10" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a10" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.withdrawal.group.q11" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.withdrawal.group.a11" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>                                                                                                                                                                                                                             
        <div class="clearfix"></div>
    </div>   
    <div class="clearfix"></div>
</div>
<!-- Provie end -->