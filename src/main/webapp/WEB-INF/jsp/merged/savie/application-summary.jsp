<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ifwd.fwdhk.model.HomeQuoteBean"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="application-summary-page">			

         <div class="fwd-container container-fluid breadcrumbs">
            <div class="breadcrumb-container">
               <ol class="breadcrumb breadcrumbs-product-details et-breadcrumbs">
					<li><a href="#">Home</a></li>
					<li class="divider"><i class="fa fa-play"></i></li>
					<li><a href="#">Save </a></li>
					<li class="divider"><i class="fa fa-play"></i></li>
					<li><a href="#">Savie </a></li>
					<li class="divider last"><i class="fa fa-play"></i></i></li>
					<li class="active-bc" id="et-active-bc-menu">Application</li>
               </ol>
            </div>
         </div>
         <!-- STEPS -->
         <div class="container-fluid fwd-full-container browse-holder">
            <div class="application-page-header et-header-browse sticky-mobile-header">
               <div class="browse-container">
                  <div class="row reset-margin hidden-xs hidden-sm">
                     <ul class="common-steps-list nav nav-pills six-steps">
                        <li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; payment</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; declaration</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
                        <li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">6</span>Confirmation</button></li>
                     </ul>
                 </div>
               </div>  
               <div class="et-mobile-header-info hidden-md hidden-lg">
                  <div class="clearfix">
                     <div class="pull-left">
                        <div class="et-back-arrow">
                           <a href="#" class="back-arrow-link">
                              <span class="icon-arrow-left2 arrow-left"></span>
                           </a>
                        </div>
                        <div class="et-header-tex">
                           <h3 id="">Summary &amp; declaration</h3>
                        </div>
                     </div>
                     <span id="step-of">3 out of 6</span>
                  </div>
               </div>
            </div>
         </div>
			<div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
         <div class="step-indicator-container clearfix">
                  <ul class="common-step-indicator six-steps nav nav-pills">
                     <li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     <li><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     <li><a href="#" class="active"><span class="step-no">3</span></a></li>
                     <li><a href="#"><span class="step-no">4</span></a></li>
                     <li><a href="#"><span class="step-no">5</span></a></li>
                     <li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                 </ul>
                 <div class="step-line"></div>
            </div>
        </div>
         <div class="container-fluid fwd-container savie-application-summary headerStick">
            <h5 class="title">Application summary</h5>

            <div class="summary-section clearfix">
               <h5>Your selected plan <a href="<%=request.getContextPath()%>/${language}/savings-insurance/plan-details?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Plan name</h6>
                     <span class="info">SAVIE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Saving amount</h6>
                     <span class="info">HK$ ${saviePlanDetails.insuredAmount1 }</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Premium mode</h6>
                     <span class="info">${saviePlanDetails.paymentType }</span>
                  </div>
               </div>
            </div>

            <div class="summary-section below clearfix">
               <h5>Personal info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/personal-details?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Last name (same as HKID)</h6>
                     <span class="info">${lifePersonalDetails.lastname }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">First name (same as HKID)</h6>
                     <span class="info">${lifePersonalDetails.firstname }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Name in Chinese (same as HKID)</h6>
                     <span class="info ch">${lifePersonalDetails.chineseName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Gender</h6>
                     <span class="info">${lifePersonalDetails.gender }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">HKID</h6>
                     <span class="info">${lifePersonalDetails.hkid }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Place of birth</h6>
                     <span class="info">${lifePersonalDetails.placeOfBirthName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Nationality</h6>
                     <span class="info">${lifePersonalDetails.nationaltyName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Date of birth</h6>
                     <span class="info">${lifePersonalDetails.dob }</span>
                  </div>
               </div>
               <div class="desktop-right">
				  <div class="gray-holder">
                     <h6 class="info-label">Residential telephone no.</h6>
                     <span class="info">${lifePersonalDetails.residentialTelNo }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Telephone no.</h6>
                     <span class="info">${lifePersonalDetails.mobileNumber }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Marital status</h6>
                     <span class="info">${lifePersonalDetails.martialStatusName }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Email address</h6>
                     <span class="info">${lifePersonalDetails.emailAddress }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label permanent-top">Permanent address (No P.O box address allowed)</h6>
					 <h6 class="info-label">Permanent address line 1</h6>
                     <span class="info">${lifePersonalDetails.permanetAddress1 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Permanent address line 2</h6>
                     <span class="info">${lifePersonalDetails.permanetAddress2 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Permanent address line 3</h6>
                     <span class="info">${lifePersonalDetails.permanetAddress3 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">${lifePersonalDetails.permanetAddressDistrictName }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 1</h6>
                     <span class="info">${lifePersonalDetails.residentialAddress1 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 2</h6>
                     <span class="info">${lifePersonalDetails.residentialAddress2 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 3</h6>
                     <span class="info">${lifePersonalDetails.residentialAddress3 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">${lifePersonalDetails.residentialAddressDistrictName }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 1</h6>
                     <span class="info">${lifePersonalDetails.correspondenceAddress1 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 2</h6>
                     <span class="info">${lifePersonalDetails.correspondenceAddress2 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 3</h6>
                     <span class="info">${lifePersonalDetails.correspondenceAddress3 }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">${lifePersonalDetails.correspondenceAddressDistrictName }</span>
                  </div>
               </div>
            </div>
            <div class="summary-section below-employment clearfix">
               <h5>Employment info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/employment-info?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Employment status</h6>
                     <span class="info">${lifeEmploymentInfo.employmentStatusName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Nature of business</h6>
                     <span class="info">${lifeEmploymentInfo.natureOfBusinessName }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Occupation</h6>
                     <span class="info">${lifeEmploymentInfo.occupationName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Please specify</h6>
                     <span class="info">${lifeEmploymentInfo.amountOfOtherSourceOfIncomeName }${lifeEmploymentInfo.amountOfLiquidAssetsName }</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Current employer's name</h6>
                     <span class="info">${lifeEmploymentInfo.employerName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Monthly personal income (HK$)</h6>
                     <span class="info">${lifeEmploymentInfo.monthlyPersonalIncomeName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Education level</h6>
                     <span class="info">${lifeEmploymentInfo.educationName }</span>
                  </div>
               </div>
            </div>
            <div class="summary-section below-beneficiary clearfix">
               <h5>Beneficiary info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/beneficiary-info?backSummary=Y">Edit</a></h5>
            </div>
            <c:choose>
			       <c:when test="${lifeBeneficaryInfo.isOwnEstate == 'true' }">
			          <div class="summary-section below-beneficiary clearfix">
			             <h5>Own estate</h5>
			          </div>
			       </c:when>
			       <c:otherwise>
			          <c:if test="${lifeBeneficaryInfo.beneficaryFirstName1 != '' }">
				          <div class="summary-section inner-beneficiary clearfix">   
				               <span class="person-count first-person">Person 1</span>
				               <div class="desktop-left">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Last name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryLastName1 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">First name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryFirstName1 }</span>
				                  </div>
								  <div class="gray-holder">
				                     <h6 class="info-label">Name in Chinese (optional)</h6>
				                     <span class="info chinese-temp">${lifeBeneficaryInfo.beneficaryChineseName1 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">${lifeBeneficaryInfo.beneficiaryHkidPassport1 == "passport" ? "Passport":"HKID" }</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficiaryHkidPassport1 == "passport" ? lifeBeneficaryInfo.beneficiaryPassport1:lifeBeneficaryInfo.beneficaryID1 }</span>
				                  </div>
				               </div>
				               <div class="desktop-right">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Relationship</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryRelationName1 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Gender</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryGender1 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Entitlement (%)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryWeight1 }</span>
				                  </div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName2 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count">Person 2</span>
				               <div class="desktop-left">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Last name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryLastName2 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">First name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryFirstName2 }</span>
				                  </div>
								  <div class="gray-holder">
				                     <h6 class="info-label">Name in Chinese (optional)</h6>
				                     <span class="info chinese-temp">${lifeBeneficaryInfo.beneficaryChineseName2 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">${lifeBeneficaryInfo.beneficiaryHkidPassport2 == "passport" ? "Passport":"HKID" }</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficiaryHkidPassport2 == "passport" ? lifeBeneficaryInfo.beneficiaryPassport2:lifeBeneficaryInfo.beneficaryID2 }</span>
				                  </div>
				               </div>
				               <div class="desktop-right">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Relationship</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryRelationName2 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Gender</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryGender2 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Entitlement (%)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryWeight2 }</span>
				                  </div>
				               </div>
							</div>
						</c:if>
						<c:if test="${lifeBeneficaryInfo.beneficaryFirstName3 != '' }">
							<div class="summary-section inner-beneficiary clearfix">
							   <span class="person-count">Person 3</span>
				               <div class="desktop-left">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Last name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryLastName3 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">First name (same as HKID)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryFirstName3 }</span>
				                  </div>
								  <div class="gray-holder">
				                     <h6 class="info-label">Name in Chinese (optional)</h6>
				                     <span class="info chinese-temp">${lifeBeneficaryInfo.beneficaryChineseName3 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">${lifeBeneficaryInfo.beneficiaryHkidPassport3 == "passport" ? "Passport":"HKID" }</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficiaryHkidPassport3 == "passport" ? lifeBeneficaryInfo.beneficiaryPassport3:lifeBeneficaryInfo.beneficaryID3 }</span>
				                  </div>
				               </div>
				               <div class="desktop-right">
				                  <div class="gray-holder">
				                     <h6 class="info-label">Relationship</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryRelationName3 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Gender</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryGender3 }</span>
				                  </div>
				                  <div class="gray-holder">
				                     <h6 class="info-label">Entitlement (%)</h6>
				                     <span class="info">${lifeBeneficaryInfo.beneficaryWeight3 }</span>
				                  </div>
				               </div>
				            </div>
			            </c:if>
			       </c:otherwise>
			</c:choose>
            <div class="summary-section below-payment clearfix">
               <h5>Payment info <a href="<%=request.getContextPath()%>/${language}/savings-insurance/payment?backSummary=Y">Edit</a></h5>
               <div class="desktop-left">
				  <div class="gray-holder">
                     <h6 class="info-label">Amount</h6>
                     <span class="info">HK$ ${lifePayment.paymentAmount }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Payment method</h6>
                     <span class="info">${lifePayment.paymentMethod }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Bank account holder name</h6>
                     <span class="info">${lifePayment.accountHolderName }</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Bank name (code)</h6>
                     <span class="info">${lifePayment.bankName }</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Account no.</h6>
                     <span class="info">${lifePayment.accountNumber }</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Branch name</h6>
                     <span class="info">${lifePayment.branchName }</span>
                  </div>
               </div>
            </div>

            <div class="text-center clearfix">
               <button class="btn savie-common-btn" type="button" onclick="goNext()">Next</button>
                <a href="#" id="as-save-and-con" class="as-save-con" data-toggle="modal" data-target="#save-and-continue-batch5-modal">
               <span>Save and continue later</span>
            </div>
         </div>
			<!-- FOOTER -->
		</div>
		<div class="modal fade common-welcome-modal" id="save-and-continue-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
         <div class="modal-content save-con-modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
            <h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
            <p class="text-center description-msg">You may save your application progress up to (previous page). You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
            <div class="save-con-btns clearfix">
               <button class="btn savie-common-btn save-exit-btn1 col-sm-6 col-xs-6 col-lg-6 col-md-6">Keep going</button>
               <button class="btn savie-common-btn save-exit-btn2 col-sm-6 col-xs-6 col-lg-6 col-md-6">Save and exit</button>
            </div>
         </div>
        </div>
      </div>
      <!-- Save and continue batch 5 modal -->
      <div class="modal fade common-welcome-modal save-con-modal-b5" id="save-and-continue-batch5-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
         <div class="modal-content save-con-modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
            <h4 class="text-center welcome-msg">Would you like to save your application and continue later?</h4>
            <p class="text-center description-msg">You will receive an email with a link of your saved application progress, you may continue the application within 30 days.</p>
            <div class="save-con-btns clearfix">
               <center><button class="btn savie-common-btn" id="keep-going-btn">Keep going</button><button class="btn savie-common-btn disabled-gray-btn" id="save-exit-btn">Save and exit</button></center>
            </div>
         </div>
        </div>
      </div>
      <!-- Application saved modal -->
      <div class="modal fade common-welcome-modal modal-app-save" id="application-saved-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog" id="modal-save-app">
         <div class="modal-content modal-content-appsave common-welcome-modal">  
             <div class="modal-header" id="modal-header-appsave">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <p class="text-center">Your application has been saved. </p>
             </div>
             <div class="modal-body" id="moda-body-appsave">
               <p class="text-center">A saved application email has been sent to you, you may continue the application through 
               the application link embedded in the email or you may retrieve your progress from your eService 
               purchase history. </p>
               <div class="btn-appsave">
                  <button href="#" class="center-block btn savie-common-btn" id="btn-app-save">Back to home</button>
               </div>
             </div>
          </div>
        </div>
      </div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			var language = "en";
			
			function goNext(){
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			}
         $('.save-exit-btn2, #save-exit-btn').click(function() {
            $(this).closest('.modal').modal('hide');
            $('#application-saved-modal').modal('show');
         });
		</script>
		
		
	</body>
</html>