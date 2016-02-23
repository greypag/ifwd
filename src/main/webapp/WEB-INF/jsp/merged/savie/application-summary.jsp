<%@page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@include file="includes/head.jsp" %>
      
		<meta name="apple-mobile-web-app-capable" content="yes" />
	</head>
	<body>
		<%!
			boolean isSaleActiveClass = false;
			boolean isEservicesActiveClass = false;
		%>
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="application-summary-page">			
			<%@include file="includes/header-block.jsp" %>

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
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Application &amp; payment</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">3</span>Summary &amp; declaration</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">4</span>Signature</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
                        <li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">5</span>Document upload</button></li>
                        <li class="arrow-next-step"> <img src="assets/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
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
               <h5>Your selected plan <a href="#">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Plan name</h6>
                     <span class="info">SAVIE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Saving amount</h6>
                     <span class="info">HK$ 100,000</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Premium mode</h6>
                     <span class="info">ONE TIME OFF</span>
                  </div>
               </div>
            </div>

            <div class="summary-section below clearfix">
               <h5>Personal info <a href="#">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Last name (same as HKID)</h6>
                     <span class="info">CHAN</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">First name (same as HKID)</h6>
                     <span class="info">TAI MAN</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Name in Chinese (same as HKID)</h6>
                     <span class="info ch">陳大文</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Gender</h6>
                     <span class="info">MALE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">HKID</h6>
                     <span class="info">A0123456</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Place of birth</h6>
                     <span class="info">HONG KONG</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Nationality</h6>
                     <span class="info">HONG KONG</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Date of birth</h6>
                     <span class="info">01-10-1981</span>
                  </div>
               </div>
               <div class="desktop-right">
				  <div class="gray-holder">
                     <h6 class="info-label">Residential telephone no.</h6>
                     <span class="info">+85 9876 5432</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Telephone no.</h6>
                     <span class="info">+85 9876 5432</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Marital status</h6>
                     <span class="info">MARRIED</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Email address</h6>
                     <span class="info">CHANTAIMAN@GMAIL.COM</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label permanent-top">Permanent address (No P.O box address allowed)</h6>
					 <h6 class="info-label">Permanent address line 1</h6>
                     <span class="info">ROOM 601</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Permanent address line 2</h6>
                     <span class="info">TUNG HIP BUILDING</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Permanent address line 3</h6>
                     <span class="info">248 DES VOEUX ROAD, SHEUNG WAN.</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">US</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 1</h6>
                     <span class="info">ROOM 601</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 2</h6>
                     <span class="info">TUNG HIP BUILDING</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Residential address line 3</h6>
                     <span class="info">248 DES VOEUX ROAD, SHEUNG WAN.</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">US</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 1</h6>
                     <span class="info">ROOM 601</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 2</h6>
                     <span class="info">TUNG HIP BUILDING</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Correspondence address line 3</h6>
                     <span class="info">248 DES VOEUX ROAD, SHEUNG WAN.</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">District</h6>
                     <span class="info">US</span>
                  </div>
               </div>
            </div>
            <div class="summary-section below-employment clearfix">
               <h5>Employment info <a href="#">Edit</a></h5>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Employment status</h6>
                     <span class="info">EMPLOYED</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Nature of business</h6>
                     <span class="info">OTHERS</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Occupation</h6>
                     <span class="info">OTHERS</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Please specify</h6>
                     <span class="info">ARTIST</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Current employer's name</h6>
                     <span class="info">FWD</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Monthly personal income (HK$)</h6>
                     <span class="info">100,000,000</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Education level</h6>
                     <span class="info">POST-SECONDARY / UNIVERSITY OR ABOVE</span>
                  </div>
               </div>
            </div>
            <div class="summary-section below-beneficiary clearfix">
               <h5>Beneficiary info <a href="#">Edit</a></h5>
               <span class="person-count first-person">Person 1</span>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Last name (same as HKID)</h6>
                     <span class="info">CHAN</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">First name (same as HKID)</h6>
                     <span class="info">MARY</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Name in Chinese (optional)</h6>
                     <span class="info chinese-temp"></span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">HKID</h6>
                     <span class="info">A234567</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Relationship</h6>
                     <span class="info">SPOUSE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Gender</h6>
                     <span class="info">FEMALE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Entitlement (%)</h6>
                     <span class="info">Person 1: 100%</span>
                  </div>
               </div>
			</div>
			<div class="summary-section inner-beneficiary clearfix">
			   <span class="person-count">Person 2</span>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Last name (same as HKID)</h6>
                     <span class="info">CHAN</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">First name (same as HKID)</h6>
                     <span class="info">AH KAO</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Name in Chinese (optional)</h6>
                     <span class="info chinese-temp"></span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">HKID</h6>
                     <span class="info">A234567</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Relationship</h6>
                     <span class="info">SON</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Gender</h6>
                     <span class="info">MALE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Entitlement (%)</h6>
                     <span class="info">Person 1: 100%</span>
                  </div>
               </div>
			</div>
			<div class="summary-section inner-beneficiary clearfix">
			   <span class="person-count">Person 3</span>
               <div class="desktop-left">
                  <div class="gray-holder">
                     <h6 class="info-label">Last name (same as HKID)</h6>
                     <span class="info">CHAN</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">First name (same as HKID)</h6>
                     <span class="info">AH KAM</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Name in Chinese (optional)</h6>
                     <span class="info chinese-temp"></span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">HKID</h6>
                     <span class="info">A234567</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Relationship</h6>
                     <span class="info">DAUGHTER</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Gender</h6>
                     <span class="info">FEMALE</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Entitlement (%)</h6>
                     <span class="info">Person 1: 100%</span>
                  </div>
               </div>
            </div>
            <div class="summary-section below-payment clearfix">
               <h5>Payment info <a href="#">Edit</a></h5>
               <div class="desktop-left">
				  <div class="gray-holder">
                     <h6 class="info-label">Amount</h6>
                     <span class="info">HK$ 100,000</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Payment method</h6>
                     <span class="info">DIRECT DEBIT</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Bank account holder name</h6>
                     <span class="info">CHAN TAI MAN</span>
                  </div>
               </div>
               <div class="desktop-right">
                  <div class="gray-holder">
                     <h6 class="info-label">Bank name (code)</h6>
                     <span class="info">CHINA CITIBANK (002)</span>
                  </div>
				  <div class="gray-holder">
                     <h6 class="info-label">Account no.</h6>
                     <span class="info">467823423</span>
                  </div>
                  <div class="gray-holder">
                     <h6 class="info-label">Branch name</h6>
                     <span class="info">SHEUNG WAN</span>
                  </div>
               </div>
            </div>

            <div class="text-center clearfix">
               <button class="btn savie-common-btn" type="button">Next</button>
            </div>
         </div>
			<!-- FOOTER -->
			<%@include file="includes/footer-block.jsp" %>
		</div>
		
		<!-- JS INCLUDES -->
		<%@include file="includes/js-include.jsp" %>
		<script type="text/javascript">
			var language = "en";
		</script>
		
		
	</body>
</html>