<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<!--   Main Content-->
<section id="contact-page">
	<div class="container mob-pad" id="joinus_form">
		<div class="row">
			<ol class="breadcrumb pad-none">
				<li><fmt:message key="header.menu.home" bundle="${msg}" /><i
					class="fa fa-caret-right"></i></li>
				<li><fmt:message key="home.breadcrumb1.type3" bundle="${msg}" /></li>
				<li class="active"><i class="fa fa-caret-right"></i> <fmt:message
						key="partner.partners.offers" bundle="${msg}" /></li>
			</ol>

			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading_title">
				<fmt:message key="partner.partners.offers" bundle="${msg}" />
			</div>
			<div
				class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_heading">
				<div class="h4-5">
					<fmt:message key="partner.heading" bundle="${msg}" />
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_container">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_theclub.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.the.club.title" bundle="${msg}" /></div>
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                           <p class="h4-5"><fmt:message key="partner.the.club.desc1" bundle="${msg}" /></p>
                                        </li>
                                        <li style="list-style: none;">
                                            <ul>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point1" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point2" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point3" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point4" bundle="${msg}" /></p></li>
                                                <li><p class="h4-5"><fmt:message key="partner.the.club.desc1.point5" bundle="${msg}" /></p></li>
                                            </ul>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice1" bundle="${msg}" /></p>
                                            <p class="h4-5" style="font-size: 14px; margin-left: 21px; margin-top: 12px;"><fmt:message key="partner.the.club.desc1.notice2" bundle="${msg}" /></p>
                                        </li>
                                    </ul>
                                </div>
                            <div class="partner_tnc">
                                <div class="partner_tnc_list">
                                    <ul class="bullets">
                                        <li>
                                           <p class="h4-5"><fmt:message key="the.club.copy8.1" bundle="${msg}" /> <a href="<fmt:message key="theclub.clubpoint.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.the.club.tnc1.part2" bundle="${msg}" /></a> <fmt:message key="partner.the.club.tnc1.part3" bundle="${msg}" /></p>
                                         </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="partner_link">
                               <a href="<fmt:message key="theclub.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.visit.website" bundle="${msg}" /></u></a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>	
                    <hr class="partner_hr"/>                                    
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-none partner_content">
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 pad-none partner_image_container">
                            <img class="partner_image" src="<%=request.getContextPath()%>/resources/images/partner_agoda.png"/>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 pad-none">
                            <div class="partner_title"><fmt:message key="partner.agoda.title" bundle="${msg}" /></div>
                            <!-- <div class="partner_description h4-5"><fmt:message key="partner.agoda.desc1" bundle="${msg}" /></div> -->
                            <div class="partner_desc_list">
                                    <ul class="bullets">
                                        <li>
                                            <p class="h4-5">
                                                <fmt:message key="partner.agoda.desc1.part1" bundle="${msg}" />
                                                <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part2" bundle="${msg}" /></a>
                                                <fmt:message key="partner.agoda.desc1.part3" bundle="${msg}" />
                                                <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.desc1.part4" bundle="${msg}" /></a>
                                                <fmt:message key="partner.agoda.desc1.part5" bundle="${msg}" />
                                            </p>
                                        </li>
                                    </ul>
                                </div>
	                            <div class="partner_tnc">
	                                <div class="partner_tnc_list">
	                                    <ul class="bullets">
	                                        <li>
	                                            <p class="h4-5">
	                                                <fmt:message key="partner.agoda.tnc1.part1" bundle="${msg}" />
	                                                <a href="<%=request.getContextPath()%>/<fmt:message key="agoda.tnc.link" bundle="${msg}" />" target="_blank"><fmt:message key="partner.agoda.tnc1.part2" bundle="${msg}" /></a>
	                                                <fmt:message key="partner.agoda.tnc1.part3" bundle="${msg}" />
	                                            </p>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="partner_link">
	                                <a href="<fmt:message key="agoda.promo2.link" bundle="${msg}" />" target="_blank"><u><fmt:message key="partner.agoda.tnc1.part4" bundle="${msg}" /></u></a>
	                            </div>
                    		</div>                              
	                	<div class="clearfix"></div>
                	</div>
				</div>
			</div>
		</div>
	</div>
	<!--/.container-->
<%-- 	<!--  Become partner form start -->
	<div class="partnership container">
		<div class="partner-headline-wrapper">
			<h4 class="headline-title"><fmt:message key="partner.title" bundle="${msg}" /></h4>
			<div class="h4-5"><fmt:message key="partner.headline.description" bundle="${msg}" /></div>
			<h4 class="form-title">A<fmt:message key="partner.form.title" bundle="${msg}" /></h4>		
		</div>
		<form id="becomePartnerForm" class="form-horizontal form-uppercase">
			<div class="col-sm-12 col-md-6 left">
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input" id="contactName" name="contactName" type="text" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" for="contactName"><fmt:message key="placeholder.contact.person.name" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="contactNameErMsg"></span>
		        </div>
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input" id="contactEmail" data-bv-emailaddress="false" name="contactEmail" type="email" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" for="contactEmail"><fmt:message key="placeholder.contact.person.email" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="contactEmailErMsg"></span>
		        </div>
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input" id="industryName" name="industryName" type="text" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" for="industryName"><fmt:message key="placeholder.industry" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="industryNameErMsg"></span>
		        </div>
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input" id="companyLocation" name="companyLocation" type="text" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" for="companyLocation"><fmt:message key="placeholder.company.location" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="companyLocationErMsg"></span>
		        </div>			        				        				        			        			        
	        </div>		        
			<div class="col-sm-12 col-md-6 left">
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input" id="contactNum" name="contactNum" type="tel" maxlength="8" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" id="personal-info-label" for="contactNum"><fmt:message key="placeholder.contact.no" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="contactNumErMsg"></span>
		        </div>
		        <div class="clearfix form-group has-error">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="form-control gray-textbox mdl-textfield__input chinese-input" id="companyName" name="companyName" type="text" autocomplete="off" autocomplete="off" />
						<label class="mdl-textfield__label" for="companyName"><fmt:message key="placeholder.company.name" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="companyNameErMsg"></span>
		        </div>
		        <div class="clearfix form-group">
					<div class="left-desktop text-box mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<textarea class="form-control gray-textbox mdl-textfield__input" id="descriptionMsg" name="descriptionMsg" type="text" row="3" maxlength="255" autocomplete="off"/></textarea>
						<label class="mdl-textfield__label" for="descriptionMsg"><fmt:message key="placeholder.message" bundle="${msg}" /></label>
					</div>
					<span class="error-msg" id="descriptionMsgErMsg"></span>
		        </div>			        				        			        			        
	        </div>
	        <div class="clearfix"></div>	        		        
            <div class="next-btn">
                <button id="applyPartner" type="submit" class="text-bold btn apply-btn"><fmt:message key="partner.sendBtn" bundle="${msg}" /></button>
            </div>	        
        </form>                        		
	</div>
	<!-- Become partner form end -->	 --%>
</section>

<%-- <script>
function resetForm(fvForm){
    fvForm.data('formValidation').resetForm();
}
$(document).ready(function() {
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
				          regexp: /^[-'a-z\u4e00-\u9eff]+$/i ,
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
			               regexp: /^[-'a-z\u4e00-\u9eff]+$/i ,
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
			               regexp: /^[-'a-z,-\s\u4e00-\u9eff]+$/i ,
			               message:getBundle(getBundleLanguage, "error.company.location.invalid")
			            }
			     }
			},
			contactNum: {
			     container: '#contactNumErMsg',
			     validators: {
                        stringLength: {
                            min: 8,
                            max: 8,
                            message: "Please enter an 8-digit Tel No."
                        },			    	 
			            notEmpty: {
			                message: getBundle(getBundleLanguage, "error.contact.person.no.empty")
			            },
			            regexp: {
			               regexp: /^1[0-9]{10}$|^[235689][0-9]{7}$/ ,
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
			               regexp: /^[-'a-z\u4e00-\u9eff]+$/i ,
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
                       stringLength: {
                           max: 255,
                           message: "Please enter no more than 255 word."
                       },			           
			           regexp: {
			              regexp: /^[-'a-z\u4e00-\u9eff]+$/i ,
			              message:getBundle(getBundleLanguage, "error.message.invalid")
			           }
			    }
			}        	
        }        
    })
    .on('success.form.fv', function(e) {
        // Prevent form submission
        e.preventDefault();
        resetForm($('#becomePartnerForm'));
        //function to submit form here
    });    
});
</script> --%>