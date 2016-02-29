<%@page pageEncoding="UTF-8" %>
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
		<div class="fwd-savie-wrapper savie-online-container with-breadcrumbs-steps" id="fatca-page">
			<!--BREADCRUMBS-->
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
				<div class="application-page-header et-header-browse">
				   <div class="browse-container">
					  <div class="row reset-margin hidden-xs hidden-sm">
						 <ul class="common-steps-list six-steps nav nav-pills">
							<li class="step-number" id="first-step"><button type="button" class="et-header-info-btn completed-step"><i class="fa fa-check"></i>Select plan</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn active"><span class="status">2</span>Application &amp; payment</button></li>
							<li class="arrow-next-step"> <img src="<%=request.getContextPath()%>/resources/images/savie-2016/header-browse-arrow.png" class="browse-arrow" /></li>
							<li class="step-number"><button type="button" class="et-header-info-btn incomplete-step"><span class="status">3</span>Summary &amp; declaration</button></li>
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
						 <div class="et-back-arrow">
							<a href="#" class="back-arrow-link">
							   <span class="icon-arrow-left2 arrow-left"></span>
							</a>
						 </div>
						 <div class="et-header-tex">
							<h3 id="">Application &amp; payment</h3>
						 </div>
						 <p id="step-of">2 of 6</p>
					  </div>
				   </div>
				</div>
			</div>
	        <div class="container-fluid fwd-full-container mobile-step-indicator visible-xs visible-sm">
	        	<div class="step-indicator-container clearfix">
	               	<ul class="common-step-indicator six-steps nav nav-pills">
                     	<li id="first-step"><a href="#" class="completed"><i class="fa fa-check"></i></a></li>
                     	<li><a href="#" class="active"><span class="step-no">2</span></a></li>
                     	<li><a href="#"><span class="step-no">3</span></a></li>
                     	<li><a href="#"><span class="step-no">4</span></a></li>
                     	<li><a href="#"><span class="step-no">5</span></a></li>
                     	<li id="last-step"><a href="#"><span class="step-no">6</span></a></li>
                    </ul>
                    <div class="step-line"></div>
	            </div>
	        </div>
	        <div class="container-fluid fwd-full-container headerStick" id="fatca-page-body">
	        	<div class="fwd-container-limit clearfix sidebar">
	  				<div id="fatca-content" class="text-center">
	  					<h3>This product is for HKID cardholders only</h3>
	  					<p id="agreement">I have read the definition of a United States person in <br class="visible-md visible-lg" /> <a href="#" data-toggle="modal" data-target=".modal-fatca-declaration">Declaration relating to Foreign Account Tax Compliance Act</a> and confirm that i am not a <a href="#" data-toggle="modal" data-target=".modal-us-person">United States person</a>. </p>
	  					<div id="buttons-holder" class="text-center clearfix">
	  						<button type="button" class="btn savie-common-btn" id="yes-btn">Yes</button>
	  						<button type="button" class="btn savie-common-btn" id="no-btn">No</button>
	  					</div>
	  					<div id="condition-holder" class="clearfix pull-right">
	  						<p>If no, please call customer service hotline <span class="bold">3123-3123</span></p>
	  					</div>
	  				</div>		        	
		        </div>	
	        </div>
	        <div class="modal fade modal-fatca-declaration" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-fatca-declaration">
				<div class="modal-content common-welcome-modal" id="modal-content-fatca">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-fatca" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<p>Foreign Account Tax Compliance Act </p>
					 </div>
					 <div class="modal-body" id="modal-body-fatca">
						<ol>
							  <li>FWD Life Insurance Company (Bermuda) Limited ("FWD") and/or its affiliates are obliged 
							  to comply with all laws, regulations, orders, guidelines and codes, including the applicable 
							  requirements under the Foreign Account Tax Compliance Act or agreements with any public, judicial,
							  taxation, governmental and/or other regulatory authorities, including the Internal Revenue Service of 
							  the United States of America (the "Authorities" and each an "Authority" ) in various jurisdictions as
							  promulgated and amended from time to time (the "Applicable Requirements").</li>
							  <li>I am not and not acting for and on behalf of, a United States person, being a U.S. citizen, U.S. 
							  resident for U.S. federal income tax purposes or U.S. Resident Alien (i.e. a so-called U.S. green card holder) 
							  and I will notify FWD in writing within 30 days if there is any change of details provided to FWD in this 
							  application, in particular, my nationality, tax status or tax residency changes and will provide any further 
							  information or document requested by FWD.</li>
							  <li>FWD may disclose my particulars or any information to any Authority (within or outside Hong Kong) 
							  in connection or adherence with the Applicable Requirements. I also agree to provide FWD with assistance as 
							  may be necessary to enable FWD to comply with its obligations under all Applicable Requirements.</li>
							  <li id="fourth-li">FWD may withhold payment of any amount due to myself under my policy(ies) if I have failed to provide 
							  any up-to-date or complete information or documents to FWD in compliance with the Applicable Requirements and/or pay 
							  the same to any relevant Authority on my behalf as the relevant Authority may require. I also agree that the 
							  Company reserves the right and shall be entitled to terminate my policy(ies) and return to me the cash value 
							  (if any) calculated pursuant to the provisions of such policy(ies). </li>
							</ol>
					 </div>
				 </div>
			  </div>
			</div>
			<div class="modal fade modal-us-person" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			  <div class="modal-dialog" id="dialog-us-person">
				<div class="modal-content common-welcome-modal" id="modal-content-usperson">	
					 <div class="modal-header">
					 <button type="button" class="close" id="close-usopen" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
					 </div>
					 <div class="modal-body" id="modal-body-usperson">
						<p> A United States person, being a U.S. citizen, U.S. resident for U.S. 
						federal income tax purposes or U.S. Resident Alien 
						</p>
						<span>(i.e. a so-called U.S. green card holder).</span>
					 </div>
				 </div>
			  </div>
			</div>
			<!-- FOOTER -->
		</div>
		<!-- JS INCLUDES -->
		<script type="text/javascript">
			$("#yes-btn").click(function(){
					window.location = '<%=request.getContextPath()%>/${language}/savings-insurance/${nextPageFlow}';
			});
		</script>
	</body>
</html>	
