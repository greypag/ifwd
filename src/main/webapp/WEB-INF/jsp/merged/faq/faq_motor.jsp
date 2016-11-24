<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<div id="faq_motor" class="col-md-12 col-lg-12 pad-none faq_care_container" style="display:none;">
    <div class="col-md-12 col-lg-12 pad-none faq_content">
        <div class="col-md-11 col-lg-11 pad-none faq_cat">
           <fmt:message key="faq.motor.group1" bundle="${msg}" />
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
                    <fmt:message key="faq.motor.group1.q1" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.motor.group1.a1.part1" bundle="${msg}" />
                	<fmt:message key="faq.motor.group1.a1.table.title" bundle="${msg}" />
                    <table class="faq-answer__table">
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row0.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row0.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row0.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row0.cell3" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row1.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row1.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row1.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row1.cell3" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row2.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row2.cell1" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row2.cell2" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row2.cell3" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row3.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row4.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row5.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row6.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row7.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row8.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row9.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row10.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row11.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row12.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.true" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a1.table.row.false" bundle="${msg}" /></td>
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
                    <fmt:message key="faq.motor.group1.q2" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
            	<div class="col-md-12 col-lg-12 pad-none faq_answer">
            		<fmt:message key="faq.motor.group1.a2.part1" bundle="${msg}" />
                    <table class="faq-answer__table">
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row0.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row0.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row1.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row1.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row2.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row2.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row3.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row3.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row4.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row4.cell1" bundle="${msg}" /></td>
                    	</tr>
                    	<tr>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row5.cell0" bundle="${msg}" /></td>
                    		<td class="faq-answer__table__cell"><fmt:message key="faq.motor.group1.a2.row5.cell1" bundle="${msg}" /></td>
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
                    <fmt:message key="faq.motor.group1.q3" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a3" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q4" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a4" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                   	<fmt:message key="faq.motor.group1.q5" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.motor.group1.a5" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q6" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.motor.group1.a6" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q7" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a7" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q8" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <ol class="faq_answer__list--pad-left20">
                    	<li><fmt:message key="faq.motor.group1.a8.li1" bundle="${msg}" /></li>
                    	<li><fmt:message key="faq.motor.group1.a8.li2" bundle="${msg}" /></li>
                    </ol>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q9" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a9" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>

        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q10" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a10" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q11" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                    <fmt:message key="faq.motor.group1.a11" bundle="${msg}" />
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
		<div class="col-md-12 col-lg-12 pad-none faq_qna">
            <div class="col-md-12 col-lg-12 pad-none">
                <div class="col-md-11 col-lg-11 pad-none faq_question">
                    <fmt:message key="faq.motor.group1.q12" bundle="${msg}" />
                </div>
                <div class="col-md-1 col-lg-1 pad-none faq_question_arrow">
                    <a href="#" class="faq_qna_mini"><i class="fa fa-plus"></i></a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-12 col-lg-12 pad-none faq_answer_container" style="display:none;">
                <div class="col-md-12 col-lg-12 pad-none faq_answer">
                	<fmt:message key="faq.motor.group1.a12.part1" bundle="${msg}" />
                	<ul class="faq_answer__list--pad-left20">
                		<li><fmt:message key="faq.motor.group1.a12.li1" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.motor.group1.a12.li2" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.motor.group1.a12.li3" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.motor.group1.a12.li4" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.motor.group1.a12.li5" bundle="${msg}" /></li>
                		<li><fmt:message key="faq.motor.group1.a12.li6" bundle="${msg}" /></li>
                	</ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>        
        <div class="clearfix"></div>
    </div>            
    <div class="clearfix"></div>
</div>