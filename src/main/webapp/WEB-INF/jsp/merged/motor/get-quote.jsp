<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
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
.modal-dialog {
    margin: auto !important;
   padding-top: 3%;
}
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
                                    <input type="text" class="form-control" id="carValue" maxlength="9" onkeypress="return setMaxLength(this,8);" placeholder="0" name="carEstimatedValue" data-required-error='<fmt:message key="motor.error.msg.carvalue.empty" bundle="${motorMsg}" />' data-min-error='<fmt:message key="motor.error.msg.carvalue.toohigh" bundle="${motorMsg}" />' required>
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
                    <div id="testimonials" class="q5 fadeInUp animated hidden">
                        <div class="center">
                            <h2><fmt:message key="motor.Promotecode.title" bundle="${motorMsg}" /></h2>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <input type="text" name="promoCode" id="promoCode" class="form-control" value="" placeholder='<fmt:message key="motor.promotecode.fieldlabel" bundle="${motorMsg}" />' />
                                                                      		  <br/>
										<div id="promo-errors" class="help-block with-errors color-red heading-h5"
											role="alert" style="position:static"></div> 
                                        <br/>
                                        <%-- 
                                        <label>
                                            <a href="javascript:;" id="findPromo" ><fmt:message key="motor.promotecode.get.promotecode" bundle="${motorMsg}" /></a>
                                        </label>
                                        --%>                           
                                    </div>
                                <div class="col-md-6 col-md-offset-3">
			                            <div class="row">
			                            	<div class="col-xs-6">
			                                    <a href="javascript:;" style="cursor:not-allowed" data="check" class="finalsubmitGetQuote bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.submit" bundle="${motorMsg}" /></a>
			                                    <br />
			                                </div>
			                                <div class="col-xs-6">
			                                    <a href="javascript:;" data="go" class="finalsubmitGetQuote bdr-curve btn btn-primary nxt-btn"><fmt:message key="motor.button.skip" bundle="${motorMsg}" /></a>
			                                    <br />
			                                </div>
			                                
			                            </div>
			                        </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--/.container-->
</section>
<!-- SaveForm Modal -->
<div class="modal fade" id="saveModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content plan-modal">
            <div class="login-close-wrapper" style="padding-right: 15px;padding-top: 10px;display:none"><a class="close" aria-label="Close" data-dismiss="modal"><span aria-hidden="true">×</span></a></div>
            <div class="login-title-wrapper">
                <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1 plan-panel">
                        <h3 class="heading-h3 color-orange text-center">
                           <fmt:message key="motor.lightbox.welcomeback.title" bundle="${motorMsg}" /> <span class="userName"></span>
                        </h3>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 text-center">
                        <p>
                            <fmt:message key="motor.lightbox.welcomeback.copy" bundle="${motorMsg}" />  </p>
                    </div>
                    <div class="col-xs-12 col-sm-8 col-sm-offset-2 plan-panel">
                        <div class="row" >
                            <div class="text-center col-xs-6">
                                <br />
                                <a class="bdr-curve btn btn-primary nxt-btn startAgain"><fmt:message key="motor.button.restart.process" bundle="${motorMsg}" /></a>
                                <br/>
                            </div>
                            <div class="text-center col-xs-6">
                                <br />
                                <a class="bdr-curve btn btn-primary nxt-btn continue"><fmt:message key="motor.button.savecontinue.continue" bundle="${motorMsg}" /> </a>
                                <br/>
                            </div>
                            <div class="clearfix"></div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
                            <fmt:message key="motor.getquote.contanctme.copy.part1" bundle="${motorMsg}" /><br><br>
                            <em id="reasonMsg"></em><br><br>
                            <fmt:message key="motor.getquote.contanctme.copy.part2" bundle="${motorMsg}" />
                            <a href="tel:23123123"><fmt:message key="motor.getquote.contanctme.copy.part3" bundle="${motorMsg}" /></a> <fmt:message key="motor.getquote.contanctme.copy.part4" bundle="${motorMsg}" />
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
<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " id="PromoModal" tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
  <div class="modal-dialog modal-lg">
            <div class="modal-content plan-modal">
                <div class="login-form" id="sendmailofpromocode">
                <div style="overflow: hidden;"><a id="getPromotionClose" class="close" aria-label="Close" data-dismiss="modal">
                     <span aria-hidden="true" style="font-size:30px;">×</span>
                   </a>
                </div>
                <form>
                    <div class="form-container">
                        <h2><fmt:message key="motor.promotecode.get.promotecode.title" bundle="${motorMsg}" /></h2>
                        <div class="alert alert-success proSuccess hide"></div>
                        <h4><fmt:message key="motor.promotecode.get.promotecode.email" bundle="${motorMsg}" /></h4>
                        <div class="form-group">
                        	<input type="email" class="form-control" data-required-error='<fmt:message key="motor.error.msg.getquote.email.format" bundle="${motorMsg}" />' data-error='<fmt:message key="motor.error.msg.getquote.email.empty" bundle="${motorMsg}" />' placeholder=""
                                name="emailToSendPromoCode" id="emailToSendPromoCode" style="background-color:#f2f2f2">
                     
                        </div>
                        <span id="errPromoEmail" class="text-red"></span> <br>
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                               
                                <button type="submit" onclick="return sendEmail()"
                                                            class="bdr-curve btn btn-primary btn-lg wd5">
                                                            <fmt:message key="motor.button.submit"
																bundle="${motorMsg}" />
                                </button>
                            </div>
                            <div class="col-md-2">
                                <br>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
                            </div>
                            <br> <br>
                            <div class="col-lg-12 col-md-12">
                                <p><fmt:message key="motor.promotecode.get.promotecode.footer" bundle="${motorMsg}" />	</p>
                            </div>
                        </div>
                    </div>
                </form>
                </div>


            </div>
        </div>
</div>
<!--/ Get promotion code popup-->


<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/validator.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/selectize.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/jquery.maskMoney.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/getQuote-form.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/motor/motor-forms.js"></script>
<script type="text/javascript">
var quote = jQuery.parseJSON('<%=request.getParameter("data")!=null?StringEscapeUtils.escapeEcmaScript(StringEscapeUtils.unescapeHtml4(request.getParameter("data"))):"{}"%>');
var uri="";
var tempquote="";
var loginStatus=false;
function callback_motor_LoginSuccess(){
	//alert('Login success. Call Save later API.');
	//$('#saveModal').modal("show");
	var empty = {}; 
	  $.ajax({
			url:fwdApi.url.resume,
			type:"post",
			contentType: "application/json",
			data: JSON.stringify(empty),
			cache:false,
			async:false,
		    error:function (xhr, textStatus, errorThrown){
		        //alert("error");
		    },
		    success:function(response){
		    	console.dir(response);
		    	//uri = response.uri;
		    	//tempquote = response.motorCareDetails;
		    	//$('#saveModal').modal("show");
		    }
		});
}
function sendEmail() {
    $('.proSuccess').addClass('hide');
    if (get_promo_val()) {
    	//console.log($("#sendmailofpromocode form").serialize());
        $.ajax({
            type : "POST",
            url : context + "/api/iMotor/email/promoCodes",
            data : $("#sendmailofpromocode form").serialize(),
            async : false,
            success : function(data) {
                //if (data.result == 'OK') {
                	var chin = $('body').hasClass('chin');
					if($('body').hasClass('chin'))
                   		$('.proSuccess').removeClass('hide').html("謝謝！您的推廣編號已發送至到你所提交的電郵地址。");
					else
						$('.proSuccess').removeClass('hide').html("Thank you. Your promotion code has been emailed to you.");
					
               // } else {
                	//console.log(data);
               //     $('.proSuccess').removeClass('hide').html(getBundle(getBundleLanguage, "motor.error.msg.getquote.promote.format"))
               // }
            },
            error : function() {
            }
        });
    }
    return false;
}

$(document).ready(function(){
	function setMaxLength(obj, len) {
		return (obj.value.length < len);
	}
	$('#loading-overlay').modal("show");
	var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };
    
    if(getUrlParameter("type")=="3")
    {
    	$('#loginpopup').modal("show");
    }
    
    if(getUrlParameter("edit")=="yes" || getUrlParameter("back")=="yes")
    {   
    	$(".q2,.q3,.q4").removeClass("hidden");//q5 for promo
    	
		$('input[name=cc]').val(quote.carDetail.engineCapacity)
		$('input[name=carYearOfManufacture]').val(quote.carDetail.yearOfManufacture)
		$('input[name=carEstimatedValue]').val(quote.carDetail.estimatedValue)
		$('input[name=validAgeGroup]').attr("checked",true);	
		$('input[name=driveMoreThanTwo]').attr("checked",true);	
    }
    
  //Check UserLogin
	$.ajax({
		url:fwdApi.url.session,
		type:"get",
		contentType: "application/json",
		cache:false,
		async:false,
	    error:function (xhr, textStatus, errorThrown){
	    	
	        if(xhr.status == 404){		        
	        	$(".before-login").show();
	        } else {
	        	$(".before-login").show();
	        }
	    },
	    success:function(response){
	    	if(response){
	    		if(response.userName == '*DIRECTGI'){
	    			loginStatus=false;
	    			//$('#loginpopup').modal("show");
	    			//$(".before-login").show();
	    			//$("#saveModal").removeClass("hidden");
	    			return false;	
	    		}else
	    		{   loginStatus=true;
	    			var empty = {}; 
	    		  $.ajax({
	    				url:fwdApi.url.resume,
	    				type:"post",
	    				contentType: "application/json",
	    				data: JSON.stringify(empty),
	    				cache:false,
	    				async:false,
	    			    error:function (xhr, textStatus, errorThrown){
	    			        //alert("error");
	    			    },
	    			    success:function(response){
	      			    	console.dir(response);
	      			    	uri = response.uri;
	       			    	tempquote = response.motorCareDetails;
	      			    	//if(getUrlParameter("edit")!="yes")
	      			    	   	//$('#saveModal').modal("show");
	    			    }
	    			});
	    		}
	    	}
	    }
	});
	
  	$(".startAgain").on("click",function(){
  		$('#saveModal').modal("hide");
  	});
  	  
    $(".continue").on("click",function(){
    		resume = true;
    		quote = tempquote;
    		console.dir(quote);
    		if(getUrlParameter("edit") == "yes")
    		{
    			$('#saveModal').modal("hide");
	    		$(".q2,.q3,.q4,.q5").removeClass("hidden");
	    		
	    		$('input[name=cc]').val(quote.carDetail.engineCapacity)
	    		$('input[name=carYearOfManufacture]').val(quote.carDetail.yearOfManufacture)
	    		$('input[name=carEstimatedValue]').val(quote.carDetail.estimatedValue)
	    		
	    		$('input[name=validAgeGroup]').attr("checked",true);	
	    		$('input[name=driveMoreThanTwo]').attr("checked",true);	
	    		$carMake[0].selectize.setValue(quote.carDetail.makeCode);
	    		$occupation[0].selectize.setValue(quote.driver[0].occupation);
	    		$car_details[0].selectize.setValue(quote.carDetail.model);	
	    		  var $q3 = $('.get-quote-field').find('.q3');
	    		 		$q3.find('select').change(function(){
	    		    	var sel = quote.driver[0].ncd,
	    		    	selValue = sel.options[sel.selectedIndex].value;
	    		  });
    		}else if(uri != "get-quote"){
	    		var $form = $("<form id='quote-form' />");
	          	$form.attr("action", uri+"?edit=yes");
	            $form.attr("method", "post");
	            var $quote = $("<input type='hidden' name='data' />");
	            $quote.attr("value", JSON.stringify(quote));
	            $form.append($quote);
	            $("body").append($form);
	            $('#quote-form').submit();   
    		}
	});
	  
});
</script>
