<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<fmt:setBundle basename="motor" var="motorMsg" />
<script type="text/javascript">
var context = "${pageContext.request.contextPath}";
var language = "${language}";
var nextPage = "${nextPageFlow}";
</script>



<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/motor/selectize.bootstrap3.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css_dir/motor-styles.css" type="text/css">
<style type="text/css" media="all">
#carValue{
max-width: 150px;
}
.get-quote-form [data-toggle="tooltip"]{
line-height: 1;
}
.q4 select{
width: 100px !important;
}

    .quote-form-wrapper{
        margin: 0 15px;
    }
    .q5:last-of-type{
        margin-bottom: 30px;
    }
       @media screen and (min-width: 767px){
    .motor-get-quote{
    min-height: 700px;
    }
    }
    @media screen and (max-width: 767px){
        .quote-form-wrapper{
            margin: 0;
            padding: 0 20px;
        }
        #testimonials{
            margin-left: -20px;
            margin-right: -20px;
            padding-left: 20px;
            padding-right: 20px;
        }
    }

</style>
<section id="" class="motor-get-quote">
    
    <!-- Breadcrumb Component Start-->
    <div class="container container-fluid container--breadcrumb">
        <c:set var="breadcrumbItems">
            breadcrumb.item.home,breadcrumb.item.protect,breadcrumb.item.motor,breadcrumb.item.get.quote
        </c:set>
        <c:set var="breadcrumbActive">3</c:set>
        
        <jsp:include page="/WEB-INF/jsp/merged/comp/breadcrumb.jsp">
            <jsp:param name="breadcrumbItems" value="${breadcrumbItems}"/>
            <jsp:param name="breadcrumbActive" value="${breadcrumbActive}"/>
        </jsp:include>
    </div>

    <!-- Breadcrumb Component End-->
    
    <div class="container">
        <div class="center" > 
            <!--desktop-->
            <h1 class="landing_h2 col-md-10 col-md-offset-1 hidden-sm hidden-xs"><fmt:message key="motor.getquote.page.heading" bundle="${motorMsg}" /></h1>
            <!--end-desktop--> 
            <!--Mobile-->
            <h1 class="landing_h2 hidden-lg hidden-md motor-ttl"><fmt:message key="motor.getquote.page.heading" bundle="${motorMsg}" /></h1>
            <!--end mobile--> 
        </div>
    </div>
    <div class="container">
        <div class="center row" >
            <div class="quote-form-wrapper hidden">
                <form role="form" data-toggle="validator" class="form-inline get-quote-form" id="get-quote-form">
                    <div class="get-quote-field">
                        <br/>
                        <div class="q1">
                            <div class="form-group">
                                <label for=""><fmt:message key="motor.getquote.statement.part1" bundle="${motorMsg}" /></label>
                                <div class="help-block-wrap">
                                    <select class="form-control" id="carMake" data-required-error='<fmt:message key="motor.error.msg.make.empty" bundle="${motorMsg}" />' name="carMakeCode" required>
                                        <option value="" disabled selected hidden><fmt:message key="motor.getquote.statement.dropdown.brand" bundle="${motorMsg}" /></option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                    <label for=""><fmt:message key="motor.getquote.statement.part2" bundle="${motorMsg}" /> </label>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <div class="help-block-wrap">
                                    <select class="form-control" id="carModel" data-required-error='<fmt:message key="motor.error.msg.model.empty" bundle="${motorMsg}" />' name="carModel" required>
                                        <option value="" disabled selected hidden><fmt:message key="motor.getquote.statement.dropdown.model" bundle="${motorMsg}" /></option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                     <label for=""><fmt:message key="motor.getquote.statement.part3" bundle="${motorMsg}" /> </label>
                                </div>
                               
                            </div>
                            <div class="form-group" id="cc">
                                <div class="help-block-wrap">
                                    <input type="number" class="form-control" id="" data-required-error='<fmt:message key="motor.error.msg.cc.empty" bundle="${motorMsg}" />' name="cc" placeholder="0" data-error='<fmt:message key="motor.error.msg.cc.format" bundle="${motorMsg}" />' min=100 max=9999 >
                                    <div class="help-block with-errors"></div>
                                     <label><fmt:message key="motor.getquote.statement.part4" bundle="${motorMsg}" /></label> 
                                </div>
                               
                            </div>
                            <div class="form-group">
                                <label><fmt:message key="motor.getquote.statement.part5" bundle="${motorMsg}" /></label> 
                                <div class="help-block-wrap">
                                    <input id="madeYearVal" type="number" class="form-control" min="1900" max="<%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %>" placeholder="2016" name="carYearOfManufacture" data-min-error="<fmt:message key="motor.error.msg.madeyear.format" bundle="${motorMsg}" />" data-max-error="<fmt:message key="motor.error.msg.madeyear.format" bundle="${motorMsg}" />" data-required-error='<fmt:message key="motor.error.msg.madeyear.empty" bundle="${motorMsg}" />'  required>
                                    <div class="help-block with-errors"></div>
                                <label><fmt:message key="motor.getquote.statement.part6" bundle="${motorMsg}" /> </label> 
                                </div>
                               
                            </div>
                        </div>
                        
                        <div class="q2 fadeInUp animated hidden">
                            <div class="form-group custom-dollar-box">
                                <label for=""><fmt:message key="motor.getquote.statement.part7" bundle="${motorMsg}" /></label>
                                <div class="help-block-wrap">
                                    <input type="text" class="form-control" id="carValue" placeholder="0" name="carEstimatedValue" data-required-error='<fmt:message key="motor.error.msg.carvalue.empty" bundle="${motorMsg}" />' data-min-error='<fmt:message key="motor.error.msg.carvalue.toohigh" bundle="${motorMsg}" />' required>
                                   <label><fmt:message key="motor.getquote.statement.part8" bundle="${motorMsg}" /> </label> 
                                   <button type="button" class="btn btn-default pull-right" data-toggle="tooltip" data-html="true" title="<fmt:message key="motor.getquote.statement.tooltips" bundle="${motorMsg}" />">
                                 <i class="fa fa-question-circle" aria-hidden="true"></i>
                                </button>
                                    <div class="help-block with-errors"></div>
                                </div>
                                

                            </div>
                        </div>
                        
                        <div class="q3 fadeInUp animated hidden">
                            <div class="form-group">
                                <label for=""><fmt:message key="motor.getquote.statement.part9" bundle="${motorMsg}" /> </label>
                                <div class="help-block-wrap">
                                    <select class="form-control" data-required-error='<fmt:message key="motor.error.msg.occupation.empty" bundle="${motorMsg}" />' name="occupation" id="occupation" required>
                                        <option value="" disabled selected hidden><fmt:message key="motor.getquote.statement.dropdown.occupation" bundle="${motorMsg}" /></option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </div>
                      
                        <div class="q4 fadeInUp animated hidden">
                            <div class="form-group">
                                <label for=""><fmt:message key="motor.getquote.statement.part10" bundle="${motorMsg}" /></label>
                                <div class="help-block-wrap">
                                    <select class="form-control" data-required-error='<fmt:message key="motor.error.msg.noclaimdiscount.empty" bundle="${motorMsg}" />' name="ncd" id="ncd" required>
                                        <option value="" disabled selected hidden>0</option>
                                        <option value="0" >0</option>
                                        <option value="20" >20</option>
                                        <option value="30" >30</option>
                                        <option value="40" >40</option>
                                        <option value="50" >50</option>
                                        <option value="60" >60</option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                    <label><fmt:message key="motor.getquote.statement.part11" bundle="${motorMsg}" /> </label> 
                                </div>
                                
                            </div>
                        </div>
                       
                        <div class="q5 row hidden">
                            <div class="col-md-6 col-md-offset-4 text-left">
                                <div class="custom-checkbox">
                                    <div class="checkbox">
                                        <div class="form-group">
                                            <div class="help-block-wrap">
                                                <input type="checkbox" name="validAgeGroup" id="age" >
                                                <label>
                                                    <fmt:message key="motor.getquote.statement.checkbox.age" bundle="${motorMsg}" />
                                                </label>
                                                <!--div class="help-block with-errors"></div  -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="custom-checkbox">
                                    <div class="checkbox">
                                        <div class="form-group">
                                            <div class="help-block-wrap">
                                                <input type="checkbox" name="driveMoreThanTwo" id="exp" >
                                                <label>
                                                    <fmt:message key="motor.getquote.statement.checkbox.drivingyears" bundle="${motorMsg}" />
                                                </label>
                                                 <!--div class="help-block with-errors"></div  -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                                    <div class="col-md-6 col-md-offset-3">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a class="bdr-curve btn btn-primary nxt-btn" onclick="perventRedirect=false;BackMe();"><fmt:message key="motor.button.back" bundle="${motorMsg}" /> </a>
                                    <br />
                                </div>
                                <div class="col-xs-6">
                                    <a href="javascript:;" id="submitGetQuote" class="bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.next" bundle="${motorMsg}" /></a>
                                    <br />
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                    <!-- <div id="testimonials" class="q5 fadeInUp animated hidden">
                        <div class="center">
                            <h2><fmt:message key="motor.getquote.promotion.heading" bundle="${motorMsg}" /></h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <input type="text" name="promoCode" id="" class="form-control" value="" placeholder='<fmt:message key="motor.getquote.promotion.placeholder" bundle="${motorMsg}" />' />
                                        <label>
                                            <a href="javascript:;"><fmt:message key="motor.getquote.promotion.how.text" bundle="${motorMsg}" /></a>
                                        </label>
                                        <br/>
                                        <br/>
                                    </div>
                                    <div class="col-md-6 text-left">
                                        <div class="checkbox">
                                            <input type="checkbox" id="the-club-member-toggle" name="clubMember"> <label for="the-club-member-toggle"><a class="sub-link" href="" data-toggle="modal" data-target=".bs-theclub-modal-lg">
                                                    <img src="<%=request.getContextPath()%>/resources/images/theclub-logo.png" > <fmt:message key="motor.getquote.promotion.clubmemeber.checkbox" bundle="${motorMsg}" /></a></label>
                                        </div>
                                        <span class="text-red" id="errClubMemberID"></span>
                                        <div class="form-group hidden" >
                                            <div class="input-group">
                                                <input type="text" id="theClubMembershipNo" name="theClubMembershipNo" class="form-control bmg_custom_placeholder" style="display:inline-block;width:100%;" onfocus="placeholderOnFocus(this,'The Club Membership Number');" onblur="placeholderOnBlur(this,'The Club Membership Number');" value="The Club Membership Number">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="clubMemberNum" id="" class="form-control" value="" placeholder='<fmt:message key="motor.getquote.promotion.clubmemeber.placeholder" bundle="${motorMsg}" />' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->

                </form>
            </div>
        </div>
    </div>
    <!--/.container-->
</section>
<!-- Modal -->
<div class="modal fade" id="contactpopup" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div
        style="display: none; position: absolute; left: 0; top: 0; bottom: 0; right: 0; background: #000; opacity: 0.8; z-index: 1052"
        class="login-ajax-loading">
        <img
        style="width: 100px; height: 100px; position: absolute; top: 50%; left: 50%; margin-left:-50px; margin-top: -50px;"
        src="<%=request.getContextPath()%>/resources/images/ajax-loader.gif">
    </div>
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class=""><a class="close overlay__close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
            <div class="contact-us-wrap">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 plan-panel">
                        <div class="row">
                            <div class="col-xs-5">
                                <div class="thumbnail">
                                    <img src="<%=request.getContextPath()%>/resources/images/motor/dummy.png" alt="" />
                                </div>
                            </div>
                            <div class="col-xs-7">
                                <h3 class="heading-h3 color-orange">
                                    <fmt:message key="motor.quickquote.contactme.heading" bundle="${motorMsg}" /> 
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
                        <p>
                        <br/>
                            <fmt:message key="motor.quickquote.contanctme.copy.part1" bundle="${motorMsg}" /><a href="tel:23123123"><fmt:message key="motor.quickquote.contanctme.copy.part2" bundle="${motorMsg}" /></a><fmt:message key="motor.quickquote.contanctme.copy.part3" bundle="${motorMsg}" />
                        </p>
                        
                    </div>
                </div>
            </div>
            <div id="successMessage" class="text-center hidden contact-us-wrap">
            	<p><br/>
            	 <fmt:message key="motor.quickquote.contactme.form.thankyou" bundle="${motorMsg}" />
            	<br/>
            	            	<br/>
            	</p>
            </div>
            <form role="form" data-toggle="validator" name="contactform" id="contactform-pop" >
                <input type="hidden" name="ref_no" id="ref_no" value="RQ862541" />
                <div class="contact-form contact-us-wrap">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" name="fullName"
                                            class="form-control gray-textbox mdl-textfield__input" id="fullName" maxlength="100" pattern="^[a-zA-Z\s]+$" data-pattern-error="<fmt:message key="motor.error.msg.name.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.name.empty" bundle="${motorMsg}" />" required >
                                            <label class="mdl-textfield__label" for="fullName"><fmt:message key="motor.quickquote.contactme.form.fullname" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="email" name="email" id="contactEmail" class="form-control gray-textbox mdl-textfield__input" data-error="<fmt:message key="motor.error.msg.email.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.email.empty" bundle="${motorMsg}" />" required>
                                            <label class="mdl-textfield__label" for="email"><fmt:message key="motor.quickquote.contactme.form.email" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6">
                                <div class="form-group">
                                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                        <div class="help-block-wrap">
                                            <input type="text" id="contactNo" class="form-control gray-textbox check-emp login-input mdl-textfield__input" name="contactNo" pattern="^[2|3|5|6|8|9]{1}\d{7}$" maxlength="8" data-pattern-error="<fmt:message key="motor.error.msg.mobile.format" bundle="${motorMsg}" />" data-required-error="<fmt:message key="motor.error.msg.mobile.empty" bundle="${motorMsg}" />" required>
                                            <label class="mdl-textfield__label" for="headerUserName"><fmt:message key="motor.quickquote.contactme.form.mobile" bundle="${motorMsg}" /></label>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6" style="padding-top:5px;">
                                <div class="form-group">
                                    <div class="selectDiv centreDiv gray-text-bg" id="plan-dob">
                                          <div class="help-block-wrap">
                                    <select class="form-control" id="perferedDate" data-required-error='<fmt:message key="motor.error.msg.calltime.empty" bundle="${motorMsg}" />' name="perferedDate" required>
                                        <option value="anytime" disabled selected hidden><fmt:message key="motor.quickquote.contactme.form.prefereddate" bundle="${motorMsg}" /></option>
                                        <option value="Anytime"><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.0" bundle="${motorMsg}" /></option>
                                        <option value="Morning" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.1" bundle="${motorMsg}" /></option>
                                         <option value="Afternoon" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.2" bundle="${motorMsg}" /></option>
                                            <option value="Evening" ><fmt:message key="motor.quickquote.contactme.form.prefereddate.option.3" bundle="${motorMsg}" /></option>
                                    </select>
                                    <div class="help-block with-errors"></div>
                                </div>
                                  
                                    </div>
                                </div>
                            </div>
                            <div class="custom-checkbox col-xs-12">
                            <div class="checkbox">
                                <div class="form-group">
                                    <div class="help-block-wrap">
                                        <input type="checkbox" id="agreement" name="agreement" value="" data-required-error="<fmt:message key="motor.error.msg.declaration.empty" bundle="${motorMsg}" />" required>
                                        <label>
                                        <small>
                                                <fmt:message key="motor.quickquote.contactme.form.agreement.part1" bundle="${motorMsg}" /><a href='<fmt:message key="motor.quickquote.contactme.form.agreement.pics.link" bundle="${motorMsg}" />' target="_blank"><fmt:message key="motor.quickquote.contactme.form.agreement.pics.copy" bundle="${motorMsg}" /></a><fmt:message key="motor.quickquote.contactme.form.agreement.part2" bundle="${motorMsg}" />
                                        </small>
                                        </label>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <br/>
                            </div>
                        </div>
                            <div class=" col-xs-4 col-xs-offset-4 text-center">
                            <input type="hidden" name="reason" id="reason" />
                            <a href="javascript:;" id="submitEnquiry" class="bdr-curve btn btn-primary nxt-btn">
                                <fmt:message key="motor.button.submit" bundle="${motorMsg}" />  
                            </a>
                            <br/>
                            <br/>
                        </div>
                        </div>
                        </div>
                        
                   
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/jquery.maskMoney.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/getQuote-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>

