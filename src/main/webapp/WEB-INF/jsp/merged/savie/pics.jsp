<!DOCTYPE html>
<html lang="en">
<head>
 
  <%@include file="includes/head.jsp" %>
  
</head>
<body>
<div class="fwd-savie-wrapper">
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-fatca-declaration">Large modal</button>

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
 </div>
 
	
	<%@include file="includes/js-include.jsp" %>
</body>
</html>