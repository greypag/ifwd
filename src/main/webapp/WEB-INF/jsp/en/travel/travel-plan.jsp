<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function getuserDetails() {

		//alert($('#frmTravelPlan input').serialize());
		/*     document.frmTravelPlan.action = "getYourDetails"; */
	}
	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("referralCode").innerHTML;

		if (promoCode == "") {
			document.getElementById("errPromoCode").innerHTML = "Please Enter Promocode";
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function chkDueAmount() {
		var flag = false;
		var amount = document.getElementById("amountdue").innerHTML;

		if (amount == "0") {
			document.getElementById("errDue").innerHTML = "Please select atleast one plan";
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function applyPromoCode() {
		$.ajax({
			type : 'POST',
			url : 'applyPromoCode',
			data : $('#frmTravelPlan input').serialize(),
			success : function(data) {
				
				var json = JSON.parse(data);
				setValue(json);
			}

		});
	}

	function setValue(result) {

		var selValue = document.getElementById("inputseletedplanname").value;

		if (selValue == "priceInfoA") {
			var totalDue = parseInt(result["priceInfoA"].totalDue);
			$("#subtotal").html(result["priceInfoA"].grossPremium);
			$("#discountAmt").html(result["priceInfoA"].discountAmount);
			$("#amountdue").html(result["priceInfoA"].totalDue);
			
		} else {
			var totalDue = parseInt(result["priceInfoB"].totalDue);
			$("#subtotal").html(result["priceInfoB"].grossPremium);
			$("#discountAmt").html(result["priceInfoB"].discountAmount);
			$("#amountdue").html(result["priceInfoB"].totalDue);
			
		}
	}
</script>

<style>
.travelproductbox:hover {
	background-color: #616163;
	-webkit-transition: background-color 500ms linear;
	-moz-transition: background-color 500ms linear;
	-o-transition: background-color 500ms linear;
	-ms-transition: background-color 500ms linear;
	transition: background-color 500ms linear;
}
</style>

<!--/#main-Content-->
<section>
	<div class="container">
		<div class="row">
			<form:form name="frmTravelPlan" id="frmTravelPlan"
				action="getYourDetails" method="post" modelAttribute="travelQuote"
				onsubmit="return chkDueAmount();">
				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Travel </a></li>
					<li class="active"><i class="fa fa-caret-right"></i> Your
						options</li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>Your options</h2>
						</div>
						<br> <br>
						<div class="col-lg-12 col-md-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline">
										<!-- class names: c0 c1 c2 c3 and c4 -->
										<div
											class="order-status-timeline-completion order-status-timeline-completion c1"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle act">
										<span class="status">Your Options</span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle disabled">
										<span class="status">Your Details</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled">
										<span class="status">Summary & Payment</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">Confirmation</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">Choose a plan</h2>
						<%
							QuoteDetails travelQuote = (QuoteDetails) request
										.getAttribute("quoteDetails");
								if (travelQuote.getPlanName().length > 0) {
									for (int i = 0; i < travelQuote.getPlanName().length; i++) {
						%>

						<!--plan a Start-->
						<div class="col-lg-12 col-md-12 plan-box3 travelproductbox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getDiscountAmount()[i]%>','<%=travelQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
								<h2>
									<%=travelQuote.getPlanName()[i]%>
									<%-- <input type="text" name="txtPlanName<%=i %>" values="<%=travelQuote.getPlanName()[i] %>"> --%>
									<br>
									<%
										if (travelQuote.getPlanName()[i].equals("Plan A")) {
									%>
									Premium Cover<br> HK$ 1,000,000 Medical
									<%
										} else {
									%>
									Economy Cover<br> HK$ 500,000 Medical
									<%
										}
									%>

								</h2>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
								<br>
								<h3>HK$</h3>
								<h6>
									<span id="grossPremium"<%=i%> ><%=travelQuote.getGrossPremium()[i]%></span>
								</h6>
							</div>
							<div class="clearfix"></div>
							<!-- Plan benefits -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class="benefits">
										<span><i class="fa fa-plus"></i> <a href="#"
											class="fwdpanel-minimize uline text-black"> Plan benefits
										</a> </span>
									</h4>
								</div>
								<div class="fwdpanel-body" style="display: none;">
									<p class="color-wht">
										<i class="fa fa-plus"></i> Hospital or quarantine cash $10,000<br>
										<i class="fa fa-plus"></i> Worldwide emergency assistance
										Fully Covered <br> <i class="fa fa-plus"></i> Rental
										vehicle excess $5,000 <br> <i class="fa fa-plus"></i>
										Golfer Hole in one $3,000 <br>
										<!--<i class="fa fa-plus"></i> See more benefits<br>-->
									</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<!-- / Plan benefits -->
						</div>
						<!--plan a end-->


						<div class="clearfix"></div>
						<input type="hidden" name="txtTotalDue"
							value="<%=travelQuote.getToalDue()[i]%>"> <input
							type="hidden" name="txtGrossPremium"
							value="<%=travelQuote.getGrossPremium()[i]%>"> <input
							type="hidden" name="txtDiscountAmount" id="txtDiscountAmount[i]"
							value="<%=travelQuote.getDiscountAmount()[i]%>"> 
						<%
							}
								}
						%>



						<div class="hidden-sm hidden-xs">
							<!--Full coverage -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class="fwdpanel-title h4-4-full">
										<span><a class="fwdpanel-minimize"><i
												class="fa fa-plus"></i> Full coverage details </a> </span>
									</h4>
								</div>
								<div class="fwdpanel-body" style="display: none;">
									<div class="row">
										<div class="col-md-12">
											<!--  Product Highlights  -->
											<div class="fwdpanel fwdpanel-primary">
												<div class="fwdpanel-heading">
													<h4 class="fwdpanel-title h4-4-travel margin-left">
														<span><a href="#" class="fwdpanel-minimize"><i
																class="fa fa-plus"></i> Product Highlights </a> </span>
													</h4>
												</div>
												<div class="fwdpanel-body" style="display: none;">
													<p>TravelCare provides you with comprehensive travel
														protection for leisure and business trips. Medical
														Expenses, Worldwide Emergency Services, Hospital Cash
														Allowance, Personal Accident, Major Burns, Personal Money,
														Baggage, Personal Liability, Travel Delay, Cancellation
														and Curtailment of Trip are all included. For details,
														please refer to the section of “Coverage” below.</p>
													<br>
													<p>-No excess for all benefits</p>
													<br>
													<p>-24-hour Worldwide Emergency Assistance Services</p>
													<br>
													<p>-Cover for leisure and amateur sports activities
														including winter sports, bungee jumping, hiking, rock
														climbing, -horse riding, scuba diving and other water
														sports etc</p>
													<br>
													<p>-Cover for personal accident and medical related
														claims caused by act of terrorism</p>
													<br>
													<p>-Premium is calculated on daily basis according to
														the exact length of your trip</p>
													<br>
													<p>-Unlimited number of children for Individual &
														Children or Family Plan</p>
													<br>
													<p>-Free automatic extension up to 10 days in case of
														unavoidable delay of the stipulated itinerary</p>
												</div>
											</div>
											<!-- /  Product Highlights -->
											<!--  Summary of Coverage  -->
											<div class="fwdpanel fwdpanel-primary">
												<div class="fwdpanel-heading">
													<h4 class="fwdpanel-title h4-4-travel margin-left">
														<span><a href="#" class="fwdpanel-minimize"><i
																class="fa fa-plus"></i> Summary of Coverage </a> </span>
													</h4>
												</div>
												<div class="fwdpanel-body" style="display: none;">
													<table id="summary" class="table table-bordred">
														<tbody>
															<tr>
																<td width="108" rowspan="2">Cover</td>
																<td width="460" rowspan="2">Benefits</td>
																<td colspan="2">Maximum Limit (HK$)</td>
															</tr>
															<tr>
																<td width="244">Plan A</td>
																<td width="159">Plan B</td>
															</tr>
															<tr>
																<td>1. Medical Expenses</td>
																<td>a) Medical Expenses - the cost of qualified
																	medical treatment, surgery and hospitalisation arising
																	from sickness or accidental injury.<br> <br>
																	b) Follow-up Expenses - medical, hospital and treatment
																	expenses reasonably incurred within 90 days of the
																	Insured Person’s return to the place of origin from
																	overseas up to HK$100,000 (Including Chinese
																	Bonesetting in Hong Kong up to HK$3,000 with maximum
																	daily limit per visit HK$200 ).
																</td>
																<td>$1,000,000</td>
																<td>$500,000</td>
															</tr>
															<tr>
																<td rowspan="2">2. Hospital or Quarantine Cash
																	Allowance</td>
																<td>a) Overseas Hospital - HK$500 for each complete
																	day in hospital to meet Insured Person’s extra
																	expenses.</td>
																<td>$10,000</td>
																<td>$5,000</td>
															</tr>
															<tr>
																<td>b) Compulsory Quarantine – HK$500 for each
																	complete day during the journey or 7 days upon return
																	to Hong Kong.</td>
																<td>$10,000</td>
																<td>$5,000</td>
															</tr>
															<tr>
																<td rowspan="9">3. Worldwide Emergency Assistance
																	Services</td>
																<td>a) Emergency Medical Evacuation and
																	Repatriation – to the nearest facility capable of
																	providing adequate medical care and to repatriate back
																	to Hong Kong if the physician determines that it is
																	necessary.</td>
																<td>Fully Covered</td>
																<td>Fully Covered</td>
															</tr>
															<tr>
																<td>b) Guarantee of Hospital Admission Deposits –
																	for hospital admittance fees on behalf of the Insured
																	Person.</td>
																<td>$40,000</td>
																<td>$40,000</td>
															</tr>
															<tr>
																<td>c) Additional Costs of Accommodation – for an
																	Insured Person’s family member or traveling companion
																	when such costs arise from hospitalization or delay due
																	to a serious medical condition of the Insured Person.</td>
																<td>$40,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>d) Compassionate Visit and Hotel Accommodation
																	– up to 2 immediate family members, includes traveling
																	cost to join the Insured Person who is confined in
																	hospital for more than 3 days or is dead abroad.</td>
																<td>$40,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>e) Return of Minor Children – reasonable
																	additional accommodation and traveling expenses for the
																	return of unattended Insured Person’s children (aged
																	below 18) to Hong Kong.</td>
																<td>$40,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>f) Repatriation of Mortal Remains –
																	transportation charges for repatriation of the mortal
																	remains to Hong Kong.</td>
																<td>$40,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>g) Unexpected Return in the Event of the Death
																	of a Close Relative – return economy class airfare for
																	unexpected return to Hong Kong following the death of a
																	close relative.</td>
																<td>$40,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>h) Other Assistance – including telephone
																	medical advice, emergency travel service assistance or
																	legal referral etc.</td>
																<td>included</td>
																<td>included</td>
															</tr>
															<tr>
																<td>Worldwide Emergency Assistance Services is
																	arranged by International SOS (HK) Limited.</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
															<tr>
																<td rowspan="3">4. Personal Accident</td>
																<td>Accidental death/permanent total
																	disablement/total and permanent loss of sight in one or
																	both eyes/loss by severance or permanent and total loss
																	of use of one or more limbs. (Death benefit for
																	children under 18 years old and for person over 70
																	years old shall not exceed HK$300,000.)</td>
																<td>$1,200,000</td>
																<td>$600,000</td>
															</tr>
															<tr>
																<td>Major Burns<br> Suffering of Third Degree
																	Burns with burnt areas equal to or greater than 5% of
																	head or 10% of total body surface area.
																</td>
																<td>$200,000</td>
																<td>$100,000</td>
															</tr>
															<tr>
																<td>Credit Card Protection<br> In the event of
																	accidental death of the Insured Person during the
																	journey, the outstanding balance of the Insured
																	Person’s credit card as at the date of accident will be
																	covered.
																</td>
																<td>$30,000</td>
																<td>$15,000</td>
															</tr>
															<tr>
																<td>5. Baggage</td>
																<td>Loss, physical breakage of damage directly
																	resulting from accident, theft, burglary, or
																	mishandling by carriers to the Insured Person’s baggage
																	or personal property carry-on. The limit for each item,
																	pair or set shall be HK$3,000.</td>
																<td>$20,000</td>
																<td>$3,000</td>
															</tr>
															<tr>
																<td>6. Baggage Delay</td>
																<td>Emergency purchases of essential items of
																	toiletries and clothing and the additional travelling
																	cost to get back the baggage consequent upon temporary
																	deprivation of baggage for at least 6 hours from the
																	time of arrival at destination abroad due to delay or
																	misdirection in delivery."This part is not applicable
																	when the Insured Person already reach home or the final
																	destination."</td>
																<td>$1,500</td>
																<td>$500</td>
															</tr>
															<tr>
																<td>7. Personal Money</td>
																<td>Loss of cash, banknotes and travellers cheque
																	arising from theft, burglary or robbery.</td>
																<td>$3,000</td>
																<td>$2,000</td>
															</tr>
															<tr>
																<td>8. Loss of Travel Document</td>
																<td>Cost of obtaining replacement air tickets,
																	travel expenses and accommodation incurred to obtain
																	such replacement arising from theft, burglary, robbery
																	and accidental loss (Reimbursement is limited to
																	HK$2,000 per day for Plan A or HK$1,000 per day for
																	Plan B).</td>
																<td>$20,000</td>
																<td>$5,000</td>
															</tr>
															<tr>
																<td rowspan="3">9. Travel Delay</td>
																<td>a) Additional Travel Cost - Public
																	transportation expenses necessarily incurred as a
																	direct consequence of airline or other public
																	transportation is delayed due to serious weather
																	condition, industrial action, hijack, mechanical
																	derangement, but only if the Insured Person has to
																	re-route the trip as the result of cancellation of the
																	transportation previously confirmed.</td>
																<td>$10,000</td>
																<td>$2,500</td>
															</tr>
															<tr>
																<td>b) Cash Allowance - If the Insured Person need
																	not to pay additional travelling cost in the event of
																	travel delay, the Insured Person will be indemnified at
																	HK$300 for each full 6-hour period delay.</td>
																<td>$2,500</td>
																<td>$600</td>
															</tr>
															<tr>
																<td>(Select either a or b for compensation only.)</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															</tr>
															<tr>
																<td>10. Cancellation Charge</td>
																<td>Reimbursement of irrecoverable prepaid tour
																	costs and airfares in the event of death, serious
																	sickness or injury of the Insured Person, immediate
																	family members, travel companion or close business
																	partner of the Insured Person, witness summons, jury
																	service, compulsory quarantine of the Insured Person,
																	natural disaster or unanticipated outbreak of epidemic
																	diseases/industrial action, riot/civil commotion at the
																	destination within 7 days before departure date,
																	serious damage to the Insured Person’s principal home
																	in Hong Kong arising from fire or flooding within 10
																	days from the departure date or Black Outbound Travel
																	Alert for the destination is in effect 7 days before
																	the departure date.</td>
																<td>$30,000</td>
																<td>$5,000</td>
															</tr>
															<tr>
																<td>11. Curtailment of Trip</td>
																<td>Irrecoverable unused portion of prepaid
																	transport or accommodation charges and additional
																	public transportation expenses incurred to return to
																	Hong Kong as a direct result of death, serious
																	injury/sickness of the Insured Person, immediate family
																	member or a travel companion who is insured under this
																	insurance, or of the hi-jack, adverse weather
																	conditions, natural disaster, or unanticipated outbreak
																	of epidemic diseases/industrial action, riot/civil
																	commotion at the destination that prevents the Insured
																	Person from continuing the journey or Black Outbound
																	Alert for the destination is in effect during the
																	journey.</td>
																<td>$30,000</td>
																<td>$5,000</td>
															</tr>
															<tr>
																<td>12. Loss of Home Contents</td>
																<td>The loss of or damage to the contents or
																	personal effects of the Insured Person’s principal home
																	as a result of burglary accompanied by forcible and
																	violent entry to or exit from the premise whilst the
																	home is unoccupied during the period of travel.</td>
																<td>$30,000</td>
																<td>$10,000</td>
															</tr>
															<tr>
																<td>13. Personal Liability</td>
																<td>Indemnity against third party legal liability
																	arising as a result of accidental injury. Loss or
																	damage to third party’s property during the Period of
																	Insurance. (This benefit does not apply to liability
																	arises from the use or hire of motor vehicle.)</td>
																<td>$3,000,000</td>
																<td>$1,500,000</td>
															</tr>
															<tr>
																<td>14. Rental Vehicle Excess</td>
																<td>If the Insured Person hires a rental vehicle
																	during the journey and involves in a car accident, or
																	the vehicle is damaged or stolen, the excess of the
																	claims in the motor insurance policy purchased by the
																	Insured Person will be reimbursed.</td>
																<td>$5,000</td>
																<td>$3,000</td>
															</tr>
															<tr>
																<td>15. Golfer &quot;Hole-in-One&quot;</td>
																<td>If the Insured Person achieve a
																	&quot;hole-in-one&quot; at any recognized golf course.</td>
																<td>$3,000</td>
																<td>$1,000</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<!-- / Summary of Coverage -->
											<!--   Major Exclusions  -->
											<div class="fwdpanel fwdpanel-primary">
												<div class="fwdpanel-heading">
													<h4 class="fwdpanel-title h4-4-travel margin-left">
														<span><a href="#" class="fwdpanel-minimize"><i
																class="fa fa-plus"></i> Major Exclusions </a> </span>
													</h4>
												</div>
												<div class="fwdpanel-body" style="display: none;">
													<ol class="text-justify">
														<li>War (whether declared or not), civil war, act of
															foreign enemies, rebellion, military or usurped power.</li>
														<br>
														<li>Nuclear hazards.</li>
														<br>
														<li>Acts of Terrorism (except the Personal Accident,
															Medical Cover, Worldwide Emergency Services, Travel
															Delay, Cancellation Charges and Trip Curtailment covered
															by TravelCare).</li>
														<br>
														<li>Pre-existing condition, congenial and hereditary
															condition.</li>
														<br>
														<li>Suicide, attempted suicide or intentional
															self-inflicted bodily injuries, insanity, abortion,
															miscarriage, assigned complications, pregnancy,
															child-birth, venereal diseases, the use of alcohol or
															drugs other than those prescribed by a qualified
															registered physician, dental treatment (unless resulting
															from accidental bodily injury to sound and natural
															teeth).</li>
														<br>
														<li>Racing (other than on foot) or any sports or
															games in a professional capacity or where the Insured
															Person would or could earn income or remuneration from
															engaging in such sport.</li>
														<br>
														<li>Any activities in the air unless an insured
															person is (i) travelling as a fare paying passenger in a
															licensed aircraft operated by a recognised airline, or
															(ii) participating in such activity where the maneuver or
															navigation of such activity is managed and controlled by
															another licensed person and the provider of such activity
															must be authorised by the relevant local authority.</li>
														<br>
														<li>Losses not reported within 24 hours to the
															authorities (such as airlines, police) and failure to
															provide the report certified by the relevant authorities.</li>
														<br>
														<li>Pager, Mobile Phone, handheld portable
															telecommunication equipment, computer equipment (except
															Lap Top Computer).</li>
														<br>
														<li>Personal liabilities arising from use or
															operation of vehicles, aircraft, watercraft, willful,
															malicious or unlawful acts.</li>
													</ol>
												</div>
											</div>
											<!-- /  Major Exclusions -->
											<!--   Age limit  -->
											<div class="fwdpanel fwdpanel-primary">
												<div class="fwdpanel-heading">
													<h4 class="fwdpanel-title h4-4-travel margin-left">
														<span><a href="#" class="fwdpanel-minimize"><i
																class="fa fa-plus"></i> Age limit </a> </span>
													</h4>
												</div>
												<div class="fwdpanel-body" style="display: none;">
													<p>
														A minimum age of 6 weeks to a maximum of 85 years (70
														years for Annual Cover). Children under 18 years of age
														must be accompanied by at least one adult who is also
														insured under the same policy.<br> (This summary
														gives only an outline of the insurance cover. Please refer
														to the Insurance Policy for the precise terms and
														conditions.)
													</p>
												</div>
											</div>
											<!-- / Age limit -->
											<!--   Premium table (HK$)  -->
											<div class="fwdpanel fwdpanel-primary">
												<div class="fwdpanel-heading">
													<h4 class="fwdpanel-title h4-4-travel margin-left">
														<span><a href="#" class="fwdpanel-minimize"><i
																class="fa fa-plus"></i> Premium table (HK$) </a> </span>
													</h4>
												</div>
												<div class="fwdpanel-body" style="display: none;">
													<h4 class="h4-2">
														<strong>Single Trip Premium Table (HK$)</strong>
													</h4>
													<table id="Premium" class="table table-bordred">
														<tbody>
															<tr>
																<td rowspan="2"><strong>No. of Day(s)</strong></td>
																<td colspan="2"><strong>Individual</strong></td>
																<td colspan="2"><strong>Individual &amp;
																		Children</strong></td>
																<td colspan="2"><strong>Family</strong></td>
															</tr>
															<tr>
																<td width="101"><strong>Plan A</strong></td>
																<td width="86"><strong>Plan B</strong></td>
																<td width="84"><strong>Plan A</strong></td>
																<td width="81"><strong>Plan B</strong></td>
																<td width="93"><strong>Plan A</strong></td>
																<td width="88"><strong>Plan B</strong></td>
															</tr>
															<tr>
																<td>1</td>
																<td>120</td>
																<td>95</td>
																<td>210</td>
																<td>166</td>
																<td>300</td>
																<td>238</td>
															</tr>
															<tr>
																<td>2</td>
																<td>130</td>
																<td>105</td>
																<td>228</td>
																<td>184</td>
																<td>325</td>
																<td>263</td>
															</tr>
															<tr>
																<td>3</td>
																<td>145</td>
																<td>115</td>
																<td>254</td>
																<td>201</td>
																<td>363</td>
																<td>288</td>
															</tr>
															<tr>
																<td>4</td>
																<td>180</td>
																<td>135</td>
																<td>315</td>
																<td>236</td>
																<td>450</td>
																<td>338</td>
															</tr>
															<tr>
																<td>5</td>
																<td>215</td>
																<td>155</td>
																<td>376</td>
																<td>271</td>
																<td>538</td>
																<td>388</td>
															</tr>
															<tr>
																<td>6</td>
																<td>250</td>
																<td>175</td>
																<td>438</td>
																<td>306</td>
																<td>625</td>
																<td>438</td>
															</tr>
															<tr>
																<td>7</td>
																<td>270</td>
																<td>188</td>
																<td>473</td>
																<td>329</td>
																<td>675</td>
																<td>470</td>
															</tr>
															<tr>
																<7td>8</td>
																<td>290</td>
																<td>200</td>
																<td>508</td>
																<td>350</td>
																<td>725</td>
																<td>500</td>
															</tr>
															<tr>
																<td>9</td>
																<td>305</td>
																<td>212</td>
																<td>534</td>
																<td>371</td>
																<td>763</td>
																<td>530</td>
															</tr>
															<tr>
																<td>10</td>
																<td>320</td>
																<td>225</td>
																<td>560</td>
																<td>394</td>
																<td>800</td>
																<td>563</td>
															</tr>
															<tr>
																<td>11</td>
																<td>345</td>
																<td>237</td>
																<td>604</td>
																<td>415</td>
																<td>863</td>
																<td>593</td>
															</tr>
															<tr>
																<td>12</td>
																<td>370</td>
																<td>249</td>
																<td>648</td>
																<td>436</td>
																<td>925</td>
																<td>623</td>
															</tr>
															<tr>
																<td>13</td>
																<td>390</td>
																<td>261</td>
																<td>683</td>
																<td>457</td>
																<td>975</td>
																<td>653</td>
															</tr>
															<tr>
																<td>14</td>
																<td>410</td>
																<td>273</td>
																<td>718</td>
																<td>478</td>
																<td>1025</td>
																<td>683</td>
															</tr>
															<tr>
																<td>15</td>
																<td>435</td>
																<td>285</td>
																<td>761</td>
																<td>499</td>
																<td>1088</td>
																<td>713</td>
															</tr>
															<tr>
																<td>16</td>
																<td>470</td>
																<td>297</td>
																<td>823</td>
																<td>520</td>
																<td>1175</td>
																<td>743</td>
															</tr>
															<tr>
																<td>17</td>
																<td>495</td>
																<td>309</td>
																<td>866</td>
																<td>541</td>
																<td>1238</td>
																<td>773</td>
															</tr>
															<tr>
																<td>18</td>
																<td>515</td>
																<td>321</td>
																<td>901</td>
																<td>562</td>
																<td>1288</td>
																<td>803</td>
															</tr>
															<tr>
																<td>19</td>
																<td>535</td>
																<td>333</td>
																<td>936</td>
																<td>583</td>
																<td>1338</td>
																<td>833</td>
															</tr>
															<tr>
																<td>20</td>
																<td>555</td>
																<td>345</td>
																<td>971</td>
																<td>604</td>
																<td>1388</td>
																<td>863</td>
															</tr>
															<tr>
																<td>21</td>
																<td>575</td>
																<td>357</td>
																<td>1006</td>
																<td>625</td>
																<td>1438</td>
																<td>893</td>
															</tr>
															<tr>
																<td>22</td>
																<td>595</td>
																<td>369</td>
																<td>1041</td>
																<td>646</td>
																<td>1488</td>
																<td>923</td>
															</tr>
															<tr>
																<td>23</td>
																<td>615</td>
																<td>381</td>
																<td>1076</td>
																<td>667</td>
																<td>1538</td>
																<td>953</td>
															</tr>
															<tr>
																<td>24</td>
																<td>635</td>
																<td>393</td>
																<td>1111</td>
																<td>688</td>
																<td>1588</td>
																<td>983</td>
															</tr>
															<tr>
																<td>25</td>
																<td>655</td>
																<td>405</td>
																<td>1146</td>
																<td>709</td>
																<td>1638</td>
																<td>1013</td>
															</tr>
															<tr>
																<td>26</td>
																<td>675</td>
																<td>417</td>
																<td>1181</td>
																<td>730</td>
																<td>1688</td>
																<td>1043</td>
															</tr>
															<tr>
																<td>27</td>
																<td>695</td>
																<td>429</td>
																<td>1216</td>
																<td>751</td>
																<td>1738</td>
																<td>1073</td>
															</tr>
															<tr>
																<td>28</td>
																<td>715</td>
																<td>441</td>
																<td>1251</td>
																<td>772</td>
																<td>1788</td>
																<td>1103</td>
															</tr>
															<tr>
																<td>29</td>
																<td>735</td>
																<td>453</td>
																<td>1286</td>
																<td>793</td>
																<td>1838</td>
																<td>1133</td>
															</tr>
															<tr>
																<td>30</td>
																<td>755</td>
																<td>465</td>
																<td>1321</td>
																<td>814</td>
																<td>1888</td>
																<td>1163</td>
															</tr>
															<tr>
																<td>31</td>
																<td>775</td>
																<td>477</td>
																<td>1356</td>
																<td>835</td>
																<td>1938</td>
																<td>1193</td>
															</tr>
															<tr>
																<td>Each additional day<br> up to 180 days
																</td>
																<td>20</td>
																<td>12</td>
																<td>35</td>
																<td>21</td>
																<td>50</td>
																<td>30</td>
															</tr>
														</tbody>
													</table>
													<h4 class="h4-2">
														<strong>Annual Cover Premium Table (HK$)</strong>
													</h4>
													<table id="annual" class="table table-bordred">
														<tbody>
															<tr>
																<td width="208" rowspan="4"><strong>Annual
																		Cover not<br> exceeding 90 days each trip
																</strong></td>
																<td colspan="2" rowspan="2">Individual</td>
																<td width="108">Plan A</td>
																<td width="36">1,800</td>
															</tr>
															<tr>
																<td>Plan B</td>
																<td>1,300</td>
															</tr>
															<tr>
																<td colspan="2" rowspan="2">Individual &amp; <br>Children/Family
																</td>
																<td>Plan A</td>
																<td>3,600</td>
															</tr>
															<tr>
																<td>Plan B</td>
																<td>2,600</td>
															</tr>
														</tbody>
													</table>
													<br>
													<h4 class="h4-2">
														<strong>Notes:</strong>
													</h4>
													<p>
														Individual - refers to the Insured Person aged between 18
														and 85 (70 for Annual Cover) <br> Children - refers
														to dependent & unmarried children who is/are 6 weeks to 17
														years of age travelling with the Insured Person during the
														entire journey <br> Individual & Children - refers to
														Insured Person and his/her children defined above with no
														limit on number of children <br> Family - refers to
														the Insured Person and his/her spouse and children as
														defined above with no limit on number of children <br>
													</p>
												</div>
											</div>
											<!-- / Premium table (HK$) -->
										</div>
										<!-- / col-md-12 -->
									</div>
									<!-- /row -->
								</div>
								<h4 class="h4-4">
									<a
										href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf"
										target="_blank"><i class="fa fa-download"></i> Download
										Brochure</a>
								</h4>
							</div>
							<!--Full coverage end -->
						</div>
					</div>
					<div class="col-lg-5 col-md-5 gray-bg pad-none hidden-sm hidden-xs">
						<div class="wd2">
							<div class="pull-left">
								<h2 class="h2-3-choose">TravelCare</h2>
								<h4 id="seletedplanname"></h4>
								<input type="hidden" name="planName" id="inputseletedplanname"
									value="">

							</div>
							<div class="pull-right">
								<div class="text-left pad-right1 h2-2 h2">
									<div class="hk">
										HK$
										<div class="flightcare-hk" id="plansummary">0</div>
										<input type="hidden" name="txtgrossPremiumAmt"
											id="txtgrossPremiumAmt" value="">
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="orange-bdr"></div>
						<div class="form-container">
							<h3>Departure date</h3>
							<div class="form-group">

								<div class="input-group wd2">
									<input name="trLeavingDate" type="text"
										class="datepicker form-control"
										value="${travelQuoteBean.getTrLeavingDate() }" readonly>
								</div>
							</div>
							<h3>Return date</h3>
							<div class="form-group">

								<div class="input-group wd2">
									<input name="trBackDate" type="text"
										class="datepicker form-control"
										value="${travelQuoteBean.getTrBackDate() }" readonly>
								</div>
							</div>
							<h3>Travellers</h3>

							<div class="form-group">
								<div class="input-group wd2">
									<input type="text" class="datepicker form-control"
										value="<c:if
									test="${not empty travelQuoteBean.getTotalAdultTraveller()}">${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()} Adults, </c:if><c:if
									test="${not empty travelQuoteBean.getTotalChildTraveller()}">${travelQuoteBean.getTotalChildTraveller()} Children, </c:if><c:if
									test="${not empty travelQuoteBean.getTotalOtherTraveller()}">${travelQuoteBean.getTotalOtherTraveller()} Others</c:if>"
										readonly> <input type="hidden"
										name="totalAdultTraveller" id="totalAdultTraveller"
										value="${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()}">
									<input type="hidden" name="totalChildTraveller"
										id="totalChildTraveller"
										value="${travelQuoteBean.getTotalChildTraveller()}"> <input
										type="hidden" name="totalOtherTraveller"
										id="totalOtherTraveller"
										value="${travelQuoteBean.getTotalOtherTraveller()}">
								</div>
							</div>
							<h3>
								No of days :<span>${travelQuoteBean.getTotalTravellingDays()}
									<input type="hidden" name="totalTravellingDays"
									id="totalTravellingDays"
									value="${travelQuoteBean.getTotalTravellingDays()}">

								</span>
							</h3>

							<h3>Promotion Code</h3>

							<div class="form-group">
								<div class="input-group">
									<span class="text-red" id="errPromoCode"></span> <input
										type="text" class="form-control" name="referralCode"
										id="referralCode" placeholder="eg.FWD789"> <span
										class="input-group-addon in black-bold pointer"
										onclick="applyPromoCode()"><span>APPLY</span></span>
								</div>
							</div>

							<div class="travel-italic">
								<a href="#" class="sub-link" data-toggle="modal"
									data-target=".bs-promo-modal-lg"><i>How do I get a
										promotion code?</i></a>
							</div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Subtotal</h3>

							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"
								id="subtotal"></h3>
							<input type="hidden" name="subTotal" id="subTotal" value="540">
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Discount</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"
								id="discountAmt">-</h3>
							<input type="hidden" name="selectedDiscountAmt"
								id="selectedDiscountAmt" value="">

							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due</h3>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6 text-right"
								id="amountdue">0</h3>
							<input type="hidden" name="selectedAmountDue"
								ID="selectedAmountDue" value="">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
								<span class="text-red" id="errDue"></span>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="travel" class="bdr-curve btn btn-primary bck-btn">Back
								</a>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<button type="submit" class="bdr-curve btn btn-primary nxt-btn">Next</button>


								<div class="clearfix"></div>
								<br> <br>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<input type="hidden" name="planSelected"
					value="<%=travelQuote.getPlanSelected()%>">
				<p class="padding1 hidden-sm hidden-xs">
					The features above are indicative only. Please refer to the <a
						class="sub-link"
						href="policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf"
						target="_blank">Policy Provisions</a> for details.<br> for
					details. For a complete explanation of the terms and conditions,
					feel free to contact an adviser or our 24-hour hotline at 3123 3123
					for more details.
				</p>
			</form:form>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/end Main Content-->



<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"
	aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content plan-modal">
			<div class="login-form" id="sendmailofpromocode">
				<form>
					<div class="form-container">
						<h2>Don't have a promotion code? Enter your email address and
							we'll send you one.</h2>
						<h4>Email</h4>
						<div class="form-group">
							<input type="text" class="form-control" placeholder=""
								name="emailToSendPromoCode" id="emailToSendPromoCode">
						</div>
						<span id="errPromoEmail" class="text-red"></span> <br>
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<a class="bdr-curve btn btn-primary btn-lg wd5" href="#"
									onclick="return sendEmail()">Submit</a>
							</div>
							<div class="col-md-2">
								<br>
							</div>
							<div class="col-lg-4 col-md-4">
								<!-- <a class="bdr-curve btn btn-primary btn-lg promo-pop-close wd5" href="#" data-dismiss="modal">Close </a>  -->
							</div>
							<br> <br>
							<div class="col-lg-12 col-md-12">
								<p>By submitting my email address I agree to receive FWD's
									promotion code and other offers in the future.</p>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--/ Get promotion code popup-->




<script>
	$(document).ready(function() {

		$('#amountdue').html('0');
		$('#subtotal').html('0');
		$('#plansummary').html('0');
		$('#discountAmt').html('0');

		$(".travelproductbox").animate({
			"background-color" : "#000"
		}, 3000);

	});

	function changeColorAndPrice(id, planName, discountAmt, totalDue) {
		var selected_div;
		var idArray = [];

		$('.travelproductbox').each(function() {
			idArray.push(this.id);
		});

		var index = idArray.indexOf(id);
		if (index > -1) {
			idArray.splice(index, 1);
			for (var i = 0; i < idArray.length; i++) {
				$('#' + idArray).removeClass("plan-box4");
				$('#' + idArray).addClass("plan-box3");
			}
		}

		var selected_price = $('#' + id).find('h6').text();
		$('#amountdue').html(totalDue);
		/*   $('#selectedAmountDue').value=selected_price; */
		$('#subtotal').html(selected_price);
		$('#plansummary').html(selected_price);
		$('#seletedplanname').html(planName);
		$('#inputseletedplanname').val(planName);

		$('#' + id).addClass("plan-box4");

		$('#discountAmt').html(discountAmt);
		document.getElementById("selectedAmountDue").value = totalDue.trim();
		document.getElementById("selectedDiscountAmt").value = discountAmt
				.trim();
		document.getElementById("txtgrossPremiumAmt").value = selected_price
				.trim();
	}

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					
					if (data == 'success') {
					} else {

					}

				},
				error : function() {
				}
			});
		}
		return false;
	}
</script>