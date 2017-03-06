<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!--[if IE]>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/es5-shim.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/classList.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/vendor/selectivizr-min.1.0.2.js"></script>
<![endif]-->
    <!--/.container-->
    <!--  Become partner form start -->
    <div class="partnership ifwd-container">

        <div class="partner-headline-wrapper">
            <h4 class="headline-title"><fmt:message key="partner.title" bundle="${msg}" /></h4>
            <div class="h4-5"><fmt:message key="partner.headline.description" bundle="${msg}" /></div>
            <%-- <h4 class="form-title"><fmt:message key="partner.form.title" bundle="${msg}" /></h4>  --%>
        </div>
        <form id="becomePartnerForm" class="form-horizontal form-uppercase becomePartnerForm mdlForm" onsubmit="return false;">
        	<div id="success-msg" class="h4-5 success-msg"><fmt:message key="partner.form.success" bundle="${msg}" /></div>
            <div class="col-sm-12 col-md-6 left">
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input chinese-input" id="contactName" name="contactName" type="text" maxlength="255" autocomplete="off" />
                        <label class="mdl-textfield__label" for="contactName"><fmt:message key="placeholder.contact.person.name" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="contactNameErMsg"></span>
                </div>
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input" id="contactEmail" data-bv-emailaddress="false" name="contactEmail" type="email"  maxlength="255" autocomplete="off" />
                        <label class="mdl-textfield__label" for="contactEmail"><fmt:message key="placeholder.contact.person.email" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="contactEmailErMsg"></span>
                </div>
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input chinese-input" id="industryName" name="industryName" type="text" maxlength="255" autocomplete="off" />
                        <label class="mdl-textfield__label" for="industryName"><fmt:message key="placeholder.industry" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="industryNameErMsg"></span>
                </div>
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input chinese-input" id="companyLocation" name="companyLocation" type="text" maxlength="255" autocomplete="off" />
                        <label class="mdl-textfield__label" for="companyLocation"><fmt:message key="placeholder.company.location" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="companyLocationErMsg"></span>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 left">
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input" id="contactNum" name="contactNum" type="tel" maxlength="13" autocomplete="off" />
                        <label class="mdl-textfield__label" id="personal-info-label" for="contactNum"><fmt:message key="placeholder.contact.no" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="contactNumErMsg"></span>
                </div>
                <div class="clearfix form-group has-error">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="form-control gray-textbox mdl-textfield__input chinese-input" id="companyName" name="companyName" type="text" maxlength="255" autocomplete="off" />
                        <label class="mdl-textfield__label" for="companyName"><fmt:message key="placeholder.company.name" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="companyNameErMsg"></span>
                </div>
                <div class="clearfix form-group">
                    <div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <textarea class="form-control gray-textbox mdl-textfield__input chinese-input" id="descriptionMsg" name="descriptionMsg" type="text" row="3" maxlength="2048" autocomplete="off"/></textarea>
                        <label class="mdl-textfield__label" for="descriptionMsg"><fmt:message key="placeholder.message" bundle="${msg}" /></label>
                    </div>
                    <span class="error-msg" id="descriptionMsgErMsg"></span>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="next-btn">
                <button id="applyPartner" type="submit" class="text-bold btn apply-btn"><fmt:message key="partner.sendBtn" bundle="${msg}" /></button>
                <!--<button id="applyPartner" type="submit" class="text-bold btn apply-btn"><fmt:message key="partner.sendBtn" bundle="${msg}" /></button>-->
            </div>
            <div id="failure-msg" class="error-msg has-error"><small class="help-block"><fmt:message key="partner.form.systemError" bundle="${msg}" /></small></div>
        </form>
    </div>
    <!-- Become partner form end -->
<script>
function resetForm(fvForm){
    $(fvForm).bootstrapValidator('resetForm', true);
}
$(document).ready(function() {
	$('#failure-msg').hide();
	$('#success-msg').hide();
    $('#becomePartnerForm').bootstrapValidator({
        row: {
            valid: 'has-success',
            invalid: 'has-error'
        },
        fields:{
            contactName: {
                container: '#contactNameErMsg',
                validators: {
                       notEmpty: {
                           message: getBundle(getBundleLanguage, "error.contact.person.name.empty")
                       },
                       regexp: {
                          regexp: /^[a-z\s\u4e00-\u9fa5]+$/i ,
                          message:getBundle(getBundleLanguage, "error.contact.person.name.invalid")
                       }
                }
            },
            contactEmail: {
                container: '#contactEmailErMsg',
                validators: {
                       notEmpty: {
                           message: getBundle(getBundleLanguage, "error.contact.person.email.empty")
                       },
                       regexp: {
                          regexp: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/ ,
                          message:getBundle(getBundleLanguage, "error.contact.email.invalid.empty")
                       }
                }
            },
            industryName: {
                 container: '#industryNameErMsg',
                 validators: {
                        notEmpty: {
                            message: getBundle(getBundleLanguage, "error.company.industry.empty")
                        },
                        regexp: {
                           regexp: /^[a-z\s\u4e00-\u9fa5]+$/i ,
                           message:getBundle(getBundleLanguage, "error.company.industry.invalid")
                        }
                 }
            },
            companyLocation: {
                 container: '#companyLocationErMsg',
                 validators: {
                        notEmpty: {
                            message: getBundle(getBundleLanguage, "error.company.location.empty")
                        },
                        regexp: {
                           regexp: /^[a-z,-\s\u4e00-\u9fa5]+$/i ,
                           message:getBundle(getBundleLanguage, "error.company.location.invalid")
                        }
                 }
            },
            contactNum: {
                 container: '#contactNumErMsg',
                 validators: {
                        notEmpty: {
                            message: getBundle(getBundleLanguage, "error.contact.person.no.empty")
                        },
                        regexp: {
                           regexp: /^[235689][0-9]{7}$|[0-9]{11,13}$/ ,
                           message:getBundle(getBundleLanguage, "error.contact.person.no.invalid")
                        }
                 }
            },
            companyName: {
                 container: '#companyNameErMsg',
                 validators: {
                        notEmpty: {
                            message: getBundle(getBundleLanguage, "error.company.name.empty")
                        },
                        regexp: {
                           regexp: /^[a-z()\s\u4e00-\u9fa5]+$/i ,
                           message:getBundle(getBundleLanguage, "error.company.name.invalid")
                        }
                 }
            },
            descriptionMsg: {
                container: '#descriptionMsgErMsg',
                validators: {
                       notEmpty: {
                           message: getBundle(getBundleLanguage, "error.message.empty")
                       },
                       regexp: {
                          regexp: /^[a-zA-Z0-9~!@#$%^&*()_+={}|:;"'<>-?,.\-\\\/\s\u4e00-\u9fa5]+$/i ,
                          message:getBundle(getBundleLanguage, "error.message.invalid")
                       }
                }
            }
        }
    })
    .on('success.form.bv', function(e) {
/*     	$( "#applyPartner" ).on( "click", function() {
	        e.preventDefault();
	        console.log("reset");
	        resetForm('#becomePartnerForm');
    	});  */
        //Prevent form submission
        //console.log("hehe");
        e.preventDefault();
        //resetForm($('#becomePartnerForm'));
        //function to submit form here
   		//console.log('test');
   		  $.ajax({
   			  type : 'POST',
   			  url : '<%=request.getContextPath()%>/ajax/leads/partnership/register',
   			  data : {
   				  	  contactName : $('input[name="contactName"]').val(),
   				      contactEmail : $('#contactEmail').val(),
   				      industryName : $('#industryName').val(),
   				      companyLocation : $('#companyLocation').val(),
   				      companyName : $('#companyName').val(),
   				      contactNum : $('#contactNum').val(),
   				      descriptionMsg : $('#descriptionMsg').val()
   			  },
   			  success : function(data) {
  				$('#failure-msg').hide();
  				$('#success-msg').show();
  				resetForm('#becomePartnerForm');
   			  },
   			  error: function(){
   		      	$('#failure-msg').show();
   			  }
   	     });
    });
});
</script>
