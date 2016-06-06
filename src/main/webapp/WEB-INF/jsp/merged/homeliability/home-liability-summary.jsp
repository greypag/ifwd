<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeCareDetailsBean"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />
<script type="text/javascript">
var context = "<%=request.getContextPath()%>";
</script>

<div class="fwd-savie-wrapper">
    <div class="fwd-container container-fluid breadcrumbs">
        <div class="breadcrumb-container">
           <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Home</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Save</a></li>
               <li class="divider"><i class="fa fa-play"></i></li>
               <li><a href="https://uat-ecom.i.fwd.com.hk/fna/tc/savings-insurance/signature#">Life Insureance Plan</a></li>
               <li class="divider last"><i class="fa fa-play"></i></li>
               <li class="active-bc" id="et-active-bc-menu">Application</li>
           </ol>
        </div>
     </div>
     <div class="savie-online-container app-pg-ctnr" id="ehome-app-summary">
     <div class="container-fluid fwd-full-container browse-holder">
        <div class="application-page-header et-header-browse">
           <div class="browse-container">
              <div class="row reset-margin hidden-xs hidden-sm">
                 <ul class="common-steps-list six-steps nav nav-pills">
                    <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select Plan</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number" id="last-steps"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; Payment</button></li>
                    <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/easy-home/header-browse-arrow.png" class="browse-arrow"></li>
                    <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Confirmation</button></li>
                 </ul>
             </div>
           </div>  
        </div>
     </div>
    <div class="container-fluid summary-bar">
        <div class="row">
            <div class="summary-bar-container">
                
                <ul class="summary-group clearfix">
                    <!--  -->
                    <li class="back">
                        <a href="javascript:void(0);" class="btn-summary-back"><i class="icon icon-arrow-left2"></i></a>
                    </li>
                    <li class="first">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">${homeQuoteDetails.planCode }</p>
                            <p class="fld-val"><!-- Standard cover, Annual --></p>
                            </div>
                        </div>                        
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Promote Code</p>
                            <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">The Club Member</p>
                            <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Original price</p>
                            <p class="fld-val">HK$${homeQuoteDetails.grossPremium }</p>
                            </div>
                        </div>
                    </li>
                    <li class="hidden-xs">
                        <div class="form-group">
                            <div class="fld-wrapper">
                            <p class="fld-label">Discount</p>
                            <p class="fld-val">HK$${homeQuoteDetails.discountAmount }</p>
                            </div>
                        </div>
                    </li>
                    <li class="last hidden-xs">
                        <p><span class="txt-hkd-prefix">HK$</span><span class="txt-price">${homeQuoteDetails.totalDue }</span><span class="txt-hkd-suffix"></span></p>
                    </li>
                    <li class="visible-xs dropdown-more">
                         <a href="javascript:void(0);" class="btn-summary-back" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-chevron-down"></i></a>

                         <ul class="col-sm-12 dropdown-menu dropdown-menu-more">
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Promote Code</p>
                                        <p class="fld-val"><span class="txt-promote-code">${homeQuoteDetails.referralCode == "" ? '-' : homeQuoteDetails.referralCode}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">The Club Member</p>
                                        <p class="fld-val"><span class="txt-theclub-member">${theClubMembershipNo == "" ? '-' : theClubMembershipNo}</span></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Original price</p>
                                        <p class="fld-val">HK$${homeQuoteDetails.grossPremium }</p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Discount</p>
                                        <p class="fld-val">HK$${homeQuoteDetails.discountAmount }</p>
                                    </div>
                                </div>
                            </li>
                             <li>
                                <div class="form-group">
                                    <div class="fld-wrapper">
                                        <p class="fld-label">Amount due</p>
                                        <p class="fld-val"><span class="txt-hkd-prefix">HK$</span><span class="txt-price">${homeQuoteDetails.totalDue }</span></p>
                                    </div>
                                </div>
                            </li>
                         </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
     <div class="app-pg-cont">
        <form id="ef-form-summary" name="paymentForm" method="post">
        <div class="container-fluid">

            <div class="row form-block">
                <div class="col-xs-12">
                    <h3 class="heading-title">Applicant Summary <a href="javascript:void(0);" class="btn-edit">Edit</a></h3>
                </div>
                    
                <div class="col-xs-12 col-md-12 tbl-summary">
                    <div class="row">
                        
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Full name (same as ID document)</p>
                                    <p class="fld-val">${userDetails.fullName}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Date of birth</p>
                                    <p class="fld-val">${userDetails.dob}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">HKID/Passport number</p>
                                    <p class="fld-val">${userDetails.hkid != "" ? userDetails.hkid : userDetails.passport}</p>
                                </div>
                            </div>                            
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Mobile no.</p>
                                    <p class="fld-val">${userDetails.mobileNo }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Email address</p>
                                    <p class="fld-val">${userDetails.emailAddress }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <h5>Correspondence Address</h5>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Room</p>
                                    <p class="fld-val">${homeCareDetails.applicantRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Floor</p>
                                    <p class="fld-val">${homeCareDetails.applicantFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Block</p>
                                    <p class="fld-val">${homeCareDetails.applicantBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Building</p>
                                    <p class="fld-val">${homeCareDetails.applicantBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Estate</p>
                                    <p class="fld-val">${homeCareDetails.applicantEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street No.</p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street Name</p>
                                    <p class="fld-val">${homeCareDetails.applicantStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                     <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">District</p>
                                    <p class="fld-val">${homeCareDetails.applicantDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Area</p>
                                    <p class="fld-val">${homeCareDetails.applicantAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                </div>
            </div>

             <div class="row form-block">
                    
                <div class="col-xs-12 tbl-summary">

                    <div class="row">
                        <div class="col-xs-12">
                            <h5>Insured Address</h5>
                        </div>
                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Room</p>
                                    <p class="fld-val">${homeCareDetails.aRoom }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Floor</p>
                                    <p class="fld-val">${homeCareDetails.aFloor }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-4">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Block</p>
                                    <p class="fld-val">${homeCareDetails.aBlock }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Building</p>
                                    <p class="fld-val">${homeCareDetails.aBuilding }</p>
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Estate</p>
                                    <p class="fld-val">${homeCareDetails.aEstate }</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street No.</p>
                                    <p class="fld-val">${homeCareDetails.aStreetNo } </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Street Name</p>
                                    <p class="fld-val">${homeCareDetails.aStreetName }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">District</p>
                                    <p class="fld-val">${homeCareDetails.aDistrictDesc }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Area</p>
                                    <p class="fld-val">${homeCareDetails.aAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <br>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <h3 class="heading-title">Plan Summary</h3>
                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-md-6">

                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Period of insurance</p>
                                    <p class="fld-val">Yearly</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Net floor Area (square feet)</p>
                                    <p class="fld-val">${homeCareDetails.netFloorAreaDesc }</p>
                                </div>
                            </div>
                        </div>
                       

                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Effective date of coverage</p>
                                    <p class="fld-val">${homeCareDetails.effectiveDate }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        
                        
                         <div class="col-xs-12 col-md-6">
                             <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Original Amount</p>
                                    <p class="fld-val">HK$ ${homeQuoteDetails.grossPremium }</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-6">
                             <div class="form-group">
                                <div class="fld-wrapper">
                                    <p class="fld-label">Discount</p>
                                    <p class="fld-val">HK$ ${homeQuoteDetails.discountAmount }</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                   
            </div>
            <div class="row amount-due">
                
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                            <div class="lbl-wrapper">
                                <span class="lbl">Amount due</span>
                            </div>
                        </div>

                        <div class="col-xs-12 col-md-10">
                            <span class="val xl">HK$ ${homeQuoteDetails.totalDue }</span>
                        </div>
                    </div>
                </div>
                
            </div>

			<fmt:formatNumber var="quoteTotal" value="${homeQuoteDetails.totalDue}" pattern="#"/>
			<c:choose>
				<c:when test="${quoteTotal<=0}">
		        	<div class="row form-block payment-wrapper">
			            <div class="btn-row text-center">
			                <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
			                <a href="<%=request.getContextPath()%>/${language}/home-liability-insurance/confirmation-ga" class="btn-app">Next</a>
			            </div>
		        	</div>
				</c:when>
				<c:otherwise>
		            <div class="row form-block payment-wrapper">
		                <div class="col-xs-12">
		                    <h3 class="heading-title">Payment Details</h3>
		                </div>
		                    
		                <div class="col-xs-12">
		                    <div class="row">
		
		                        <div class="col-xs-12 col-md-6">
		                            
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <p class="fld-label">Card type</p>
		                                    <p class="fld-val cardtype"><span class="visa">Visa</span>&nbsp;/&nbsp;<span class="mastercard">Master</span></p>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                        <input class="mdl-textfield__input" type="tel" id="ccNumber" name="cardNo" data-keyblock-num="true" maxlength="19">
		                                        <label class="mdl-textfield__label" for="ccNumber">Credit card number</label>
		                                    </div>
		                                    
		                                </div>
		                                <span class="error-msg" id="ccNumberErrMsg"></span>
		                            </div>
		                            <div class="form-group">
		                                <div class="fld-wrapper">
		                                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                        <input class="mdl-textfield__input" type="text" id="ccName" name="cardHolder">
		                                        <label class="mdl-textfield__label" for="ccName">Cardholder’s Name</label>
		                                    </div>
		                                </div>
		                                <span class="error-msg" id="ccNameErrMsg"></span>
		                            </div>
		                        </div>
		
		                        <div class="col-xs-12 col-md-6">
		                            
		                            <div class="row">
		                                <div class="col-xs-6">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-select">
		                                                <select id="expMonth" name="epMonth">
		                                                    <option value="" disabled selected></option>
		                                                    <c:forEach begin="0" end="10" varStatus="loop">
						                                        <c:set var="currentYear" value="${year + loop.index}" />
						                                        <option value="${currentYear}">${currentYear}</option>
						                                    </c:forEach>
		                                                </select>
		                                                <label class="mdl-textfield__label" for="ccName">Expiry Month</label>
		                                            </div>
		                                            
		                                        </div>
		                                        <span class="error-msg" id="expMonthErrMsg"></span>
		                                    </div>
		                                </div>
		                                <div class="col-xs-6">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-select">
		                                                <select id="expYear" name="epYear">
		                                                    <option value="" disabled selected></option>
		                                                    <option value="2016">2016</option>
		                                                    <option value="2017">2017</option>
		                                                    <option value="2018">2018</option>
		                                                    <option value="2019">2019</option>
		                                                    <option value="2020">2020</option>
		                                                    <option value="2021">2021</option>
		                                                    <option value="2022">2022</option>
		                                                    <option value="2023">2023</option>
		                                                    <option value="2024">2024</option>
		                                                    <option value="2025">2025</option>
		                                                </select>
		                                                <label class="mdl-textfield__label" for="ccName">Expiry Year</label>
		
		                                            </div>
		                                        </div>
		                                        <span class="error-msg" id="expYearErrMsg"></span>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col-xs-9 col-md-9">
		                                    <div class="form-group">
		                                        <div class="fld-wrapper">
		                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
		                                                <input class="mdl-textfield__input" type="tel" id="cvvNumber" name="securityCode" data-keyblock-num="true" maxlength="3">
		                                                <label class="mdl-textfield__label" for="cvvNumber">Security Code</label>
		                                            </div>
		                                        </div>
		                                        <span class="error-msg" id="cvvNumberErrMsg"></span>
		                                    </div>
		                                </div>
		                                <div class="col-xs-3 col-md-3">
		                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/cvv-logo.png" alt="" class="img-responsive">
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="row">
		                        <div class="col-xs-12">
			                        <div class="form-group no-border">
				                        <div class="checkbox">
				                            <input type="checkbox" name="cbTNC" id="cbTNC" value=""><label for="cbTNC">I confirm that I am the policy owner and holder of the above credit card. I hereby authorize FWD Life Insurance Company (Bermuda) Limited ("FWD") to debit my Credit Card Account for the premium of this insurance. I further acknowledge and agree that this insurance policy will be automatically renewed and any subsequent renewal premium will be debited from my Credit Card Account specified above until my prior written instruction for cancellation.</label>
				                            <span class="error-msg" id="cbTNCErrMsg"></span>
				                        </div>
			
			                            
			                        </div>
		                    	</div>
		
		                	</div>
		                
		            	</div>
			            <div class="btn-row text-center">
			                <a href="javascript:void(0);" class="btn-app eh-btn-back grey-out">Back</a>
			                <%
			                    HomeCareDetailsBean homeCareDetails = (HomeCareDetailsBean) request.getAttribute("homeCareDetails");
			                %>
			                <c:choose>
								<c:when test="${language=='en'}">
					                <a href="javascript:void(0);" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 EN','USD');" class="btn-app eh-btn-next">Next</a>
								</c:when>
						        <c:otherwise>
						            <a href="javascript:void(0);" onclick="perventRedirect=false; javascript:kenshoo_conv('Registration_Step3','<%=String.format("%.2f",Double.parseDouble(homeCareDetails.getTotalDue()))%>','','Regis_Home_Step3 EN','USD');" class="btn-app eh-btn-next">Next</a>
								</c:otherwise>
							</c:choose>
			            </div>	
		        	</div>
                </c:otherwise>
			</c:choose>
        <input type="hidden" id="pMethod" name="pMethod" value="">
        <input type="hidden" id="emailAddress" name="emailAddress" value="${userDetails.emailAddress}">
        <input type="hidden" name="referenceNo" value="${createdPolicy.referenceNo}">
        <input type="hidden" name="merchantId" value="${createdPolicy.merchantId}">
        <input type="hidden" name="currCode" value="${createdPolicy.currCode}">
        <input type="hidden" name="payType" value="${createdPolicy.paymentType}">
        <input type="hidden" id="gateway" name="gateway" value="${createdPolicy.paymentGateway}">
        <input type="hidden" name="orderRef" value="${confirm.transactionNo}">
        <input type="hidden" name="secureHash" value="${confirm.secureHash}">
        <input type="hidden" name="amount" value="${totalDue.trim()}">
        <input type="hidden" name="remark" value="${referralCode.trim()}">
        <input type="hidden" name="successUrl" value="${path}">
        <input type="hidden" name="failUrl" value="${failurePath}">
        <input type="hidden" name="errorUrl" value="${failurePath}">
        <input type="hidden" name="lang" value="C">
        <input type="hidden" id="transactionDate" name="transactionDate" value="${effectiveDate}">
        
        </form>
    </div>
    <!--<div class="container-fluid summary-bottom-bar">
        <div class="summary-bottom-bar-container">
            <ul class="summary-group clearfix">
                <li>
                    <div class="form-group">
                        <div class="fld-wrapper">
                        <p class="fld-label">Plan</p>
                        <p class="fld-val">Easy HomeCare</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <div class="fld-wrapper">
                        <p class="fld-label">Plan type</p>
                        <p class="fld-val">Year</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <div class="fld-wrapper">
                        <p class="fld-label">Promote Code / The Club Member</p>
                        <p class="fld-val">-</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <div class="fld-wrapper">
                        <p class="fld-label">Original price</p>
                        <p class="fld-val">HK$420.00</p>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form-group">
                        <div class="fld-wrapper">
                        <p class="fld-label">Discount</p>
                        <p class="fld-val">HK$0.00</p>
                        </div>
                    </div>
                </li>
                <li>
                    HK $420.00
                </li>
            </ul>
            
            
        </div>
    </div>-->
    <!-- Main Content End-->

		<!-- <div class="fwd-container-limit clearfix">	
				<div class="row">
					<h3 class="heading-title">Your Selected Plan<span>
					<a href="/en/savings-insurance/plan-details-sp?type=2">Edit</a>
					</span></h3>
					
					<div class="col-xs-12 col-md-6 left-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Plan name</label>
							<p class="data-info">Savie</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Saving amount</label>
							<p class="data-info">HK$ 100,000</p>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 right-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Premium mode</label>
							<p class="data-info">
							   Single premium
							</p>
						</div>
					</div>
				</div>
				<div class="row" id="sales-input">
					<h3 class="heading-title">Input for sales illustration</h3>
					<p id="info-note"><span class="asterisk">*</span>The following information will become your policy information</p>
					<div class="col-xs-12 col-md-6 left-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Last name(same as HKID)</label>
							<p class="data-info">Fok</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Given name (same as HKID)</label>
							<p class="data-info">Ting Kin </p>
						</div>
						<div class="gray-bg-data-info hidden">
							<label class="data-label">label.chinese.name</label>
							<p class="data-info">陳大文</p>
							<p class="data-info"> </p>
						</div>
					</div>
					<div class="col-xs-12 col-md-6 right-side-form">
						<div class="gray-bg-data-info">
							<label class="data-label">Date of birth</label>
							<p class="data-info">29-12-1958</p>
						</div>
						<div class="gray-bg-data-info">
							<label class="data-label">Gender</label>
							<p class="data-info">Male</p>
						</div>
					</div>       	
				 </div>
		    <div class="row" id="pdf-illustration-holder">
		    	<p id="review-note">Review and accept your sales illustration in order to proceed, you may refer to the <a href="#" data-toggle="modal" data-target="#sales-illustration-modal">sales illustration sample</a> for easy reference.</p>
		    </div>
			<div class="modal fade common-welcome-modal" id="sales-illustration-modal" tabindex="-1" role="dialog">
			  <div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					<div id="pdf-image" class="pdf-image-container">
						<div class="pdf-image-zoom zoom-in"><span class="glyphicon glyphicon-plus"></span></div>
						<div class="pdf-image-zoom zoom-out"><span class="glyphicon glyphicon-minus"></span></div>
						<div class="pdf-image-scroll">
							<img class="pdf-image" data-width="75" src="/resources/pdf/template/SavieProposalTemplate_en.jpg" style="width: 75%;">
						</div>
					</div>
					<div class="text-center">
						<button class="text-bold btn savie-common-btn" data-dismiss="modal" id="close-btn">Close</button>
					</div>	
				</div>
			  </div>
			</div>					
		</div> -->
    </div>

</div>
