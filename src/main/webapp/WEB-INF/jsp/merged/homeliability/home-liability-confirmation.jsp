<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

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
     <div class="savie-online-container app-pg-ctnr" id="ehome-app-confirmation">
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
    <!--<div class="container-fluid summary-bar">
        <div class="summary-bar-container">
            <ul class="summary-group clearfix">
                <li><a href="javascript:void(0);" class="btn-back"><i class="glyphicon glyphicon-arrow-left"></i></a></li>
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
     <div class="app-pg-cont">
        <div class="container-fluid">
             <div class="row cont-block">
                <div class="col-xs-12 col-md-12">

                    <div class="thanks-panel">
                        <h4>Thank you!</h4>
                        <p>You have successfully completed your purchase of Easy HomeCare insurance with FWD. An email will be sent to <strong class="toemail">${emailID}</strong> with the details of your policy.</p>
                        <div class="text-center">
                            <p class="span">Policy Number</p>
                            <p class="policy-num">${policyNo}</p>
                        </div>
                    </div>
                </div>                    
            </div>

            <div class="row cont-block">
                <div class="col-xs-12 col-md-12">
                    <h4>Share your promotion code now to earn discounts and rewards!</h4>
                    <div class="text-center share-panel">
                        
                        <div class="text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/home-insurance?promo=<%=session.getAttribute("myHomeReferralCode")%></div>
                        <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage hidden-sm hidden-xs">Press "Ctrl+c" to copy</span><span class="boxMessage hidden-md hidden-lg">Long press to copy</span> <span class="boxDownArrow"></span> </div>
                        <a href="javascript:void(0);" class="btn-app btn-copy" onclick="autoSelect('toBeCopied');">Copy Link</a>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <div class="addthis_sharing_toolbox" data-url="https://uat-ecom.i.fwd.com.hk/en/home-insurance?promo=ECHOME" data-title="iFWD"></div>
                    </div>
                </div>

            </div>

            <div class="row cont-block">
                <div class="col-xs-12">
                    <h4>You maybe also like</h4>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like01.jpg" alt="" class="img-responsive">
                        <h5>TracelCare(Annual Cover)</h5>
                        <p>Embark on an adventure abroad with a comprehensive travel protection companion.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>

                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like02.jpg" alt="" class="img-responsive">
                        <h5>Easy HomeCare</h5>
                        <p>Protect your home for around HK$1 a day,against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="also-like-grid">
                        <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-also-like03.jpg" alt="" class="img-responsive">
                        <h5>Easy HomeCare</h5>
                        <p>Protect your home for around HK$1 a day,against loss or damage from fire, flood, bursting pipes, typhoon, theft, and accidents.</p>
                        <a href="javascript:void(0);" class="btn-app">Get Quote</a>
                    </div>
                </div>
            </div>

            <div class="row cont-block">
                <div class="col-xs-12">
                    <h4>Partner</h4>
                </div>
                <div class="col-xs-12 col-md-10 col-md-offset-1">
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-agoda.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>Enjoy 8% <a href="javascript:void(0);">Agoda</a> discount on all travel products upon successful registration of FWD online membership.</p>
                                </div>
                            </div>
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-y5.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>15% off pocket wifi rental with <a href="javascript:void(0);">Y5buddy</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-boconcept.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>Enjoy 5% discount from <a href="javascript:void(0);">BoConcept</a> when yo purchase an FWD Easy HomeCare insurance Plan.</p>
                                </div>
                            </div>
                            <div class="partner-grid clearfix">
                                <div class="img-wrapper">
                                    <img src="<%=request.getContextPath()%>/resources/images/easy-home/img-partner-pricerite.jpg" alt="">
                                </div>
                                <div class="cont-wrapper">
                                    <p>HK$ 50 e-coupon from <a href="javascript:void(0);">Pricerite</a> for every successful referral.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="text-center">
                        <a href="javascript:void(0);" class="btn-app">Find out more</a>
                    </div>
                </div>

            </div>



        </div>
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
							<p class="data-info">ꐴ���</p>
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
					<button type="button" class="close visible-xs visible-sm" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
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
