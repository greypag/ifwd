<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<title>Home Insurance Quote | FWD Hong Kong</title>
<meta name="description"
	content="Get affordable home insurance with protection for emergencies and accidents ✓24/7 support ✓ 'A' rated secure & stable financial strength ✓ Rewards & benefits" />

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

<!--<script src="js/jquery.min.js"></script>
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
   
   
</script>-->

<!--Google Code for SEO-->

<noscript>
	<iframe src="//www.googletagmanager.com/ns.html?id=GTMK7TX8B"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTMK7TX8B');

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

<!--END -Google Code for SEO-->

<!--VWO-->
<!-- Start Visual Website Optimizer Asynchronous Code -->
<script type='text/javascript'>
	var _vwo_code = (function() {
		var account_id = 95373, settings_tolerance = 2000, library_tolerance = 2500, use_existing_jquery = false,
		// DO NOT EDIT BELOW THIS LINE
		f = false, d = document;
		return {
			use_existing_jquery : function() {
				return use_existing_jquery;
			},
			library_tolerance : function() {
				return library_tolerance;
			},
			finish : function() {
				if (!f) {
					f = true;
					var a = d.getElementById('_vis_opt_path_hides');
					if (a)
						a.parentNode.removeChild(a);
				}
			},
			finished : function() {
				return f;
			},
			load : function(a) {
				var b = d.createElement('script');
				b.src = a;
				b.type = 'text/javascript';
				b.innerText;
				b.onerror = function() {
					_vwo_code.finish();
				};
				d.getElementsByTagName('head')[0].appendChild(b);
			},
			init : function() {
				settings_timer = setTimeout('_vwo_code.finish()',
						settings_tolerance);
				this.load('//dev.visualwebsiteoptimizer.com/j.php?a='
						+ account_id + '&u=' + encodeURIComponent(d.URL)
						+ '&r=' + Math.random());
				var a = d.createElement('style'), b = 'body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}', h = d
						.getElementsByTagName('head')[0];
				a.setAttribute('id', '_vis_opt_path_hides');
				a.setAttribute('type', 'text/css');
				if (a.styleSheet)
					a.styleSheet.cssText = b;
				else
					a.appendChild(d.createTextNode(b));
				h.appendChild(a);
				return settings_timer;
			}
		};
	}());
	_vwo_settings_timer = _vwo_code.init();
</script>
<!-- End Visual Website Optimizer Asynchronous Code -->
<!--End VWO-->
<script>
	function applyPromoCode() {
		$.ajax({
			type : 'POST',
			url : 'applyHomePromoCode',
			data : $('#frmHomeCarePlan input').serialize(),
			success : function(data) {

				var json = JSON.parse(data);

				console.log("json " + json);
				setValue(json);
			}

		});
	}

	function setValue(result) {

		var totalDue = parseInt(result["priceInfo"].totalDue);
		$("#subtotal").html(result["priceInfo"].grossPremium);
		$("#discountAmt").html(result["priceInfo"].discountAmount);
		$("#amountdue").html(result["priceInfo"].totalDue);

	}
</script>
</head>
<body>
	<!-- Google Tag Manager -->
	<noscript>
		<iframe src="//www.googletagmanager.com/ns.html?id=GTM-MWPF25"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<script>
		(function(w, d, s, l, i) {
			w[l] = w[l] || [];
			w[l].push({
				'gtm.start' : new Date().getTime(),
				event : 'gtm.js'
			});
			var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
					+ l
					: '';
			j.async = true;
			j.src = '//www.googletagmanager.com/gtm.js?id=' + i + dl;
			f.parentNode.insertBefore(j, f);
		})(window, document, 'script', 'dataLayer', 'GTM-MWPF25');
	</script>
	<!-- End Google Tag Manager-->
	<!--Desktop-header-->


	<!--/#main-Content-->
	<section>
		<div class="container">
			<div class="row">

				<ol class="breadcrumb pad-none">
					<li><a href="#">Home</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">Easy HomeCare </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> Your
						options</li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center" style="visibility: visible;">
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
				<br> <br> <br>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">
							<!-- Choose a plan -->
						</h2>


						<div class="plan-box">
							<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
								<h2>${planQuote.getPlanCode() }
									<br> Insurance
								</h2>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<br>
								<div class="h4">
									HK$ <br>
									<div class="flightcare-hk">
										${planQuote.getGrossPremium()}</div>
								</div>
							</div>
							<div class="clearfix"></div>

							<!-- Plan benefits -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class="benefits">
										<span><i class="fa fa-plus"></i> <a href="#"
											class="fwdpanel-minimize uline color-wht">Plan benefits </a>
										</span>
									</h4>
								</div>

								<div class="fwdpanel-body" style="display: none;">
									<p class="color-wht">
										<i class="fa fa-plus"></i> Window, Door Lock & Key Replacement
										$3,000 per year<br> <i class="fa fa-plus"></i> Temporary
										Removal $50,000 per year <br> <i class="fa fa-plus"></i>
										Home Removal $50,000 per year<br> <i class="fa fa-plus"></i>
										Personal Accident $50,000 per person <br>
									</p>
								</div>

								<div class="clearfix"></div>

							</div>
							<!-- / Plan benefits -->


							<!-- <div><h4 class="uline">+ Plan benefits</h4></div>-->
						</div>

						<!-- Plan benefits -->
						<!--<div class="fwdpanel">
                      <div class="fwdpanel-heading">
                        <h4 class="uline benefits">
                          <span><a href="#" class="fwdpanel-minimize uline"><i class="fa fa-plus"></i> Plan benefits </a> </span>
                        </h4> 
                      </div>
                      <div class="fwdpanel-body" style="display: none;">
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
                      </div>
                    </div>-->
						<!-- / Plan benefits -->


						<!--Full coverage -->
						<div class="fwdpanel hidden-sm hidden-xs">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> Full Coverage Details </a> </span>
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
												<p>Household Contents cover up to a limit as high as
													HK$500,000</p>
												<p>Personal Liability Insurance covers up to
													HK$5,000,000 as owner and/or occupier of your home or as a
													private individual anywhere in the world</p>
												<p>Protects household contents inside the home, such as
													furniture, electrical appliances etc., against loss or
													damage arising from fire, flood, bursting pipes, typhoon,
													theft and other accidents</p>
												<br>
												<p>Applicable to Home for Net Floor Area up to 1,000
													square feet</p>
											</div>
										</div>
										<!-- /  Product Highlights -->

										<!--  Summary of Coverage  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i>Summary of Coverage </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<h4 class="h4-2">
													<strong> Section 1. Household Contents</strong>
												</h4>
												<p>Your household contents at home are insured for 'All
													Risks' cover. This 'All Risks' cover protects your contents
													against accidental loss or damage arising from, including
													but not limited to, fire, flood, typhoon, explosion or
													theft, up to a maximum of HK$500,000 per year. Maximum
													limit of the coverage for any one item of your household
													contents is HK$100,000. Valuables, such as jewellery, gold,
													silver, watches, photographic equipment, furs, musical
													instruments (except pianos), are covered up to HK$10,000
													per item and with an aggregate maximum of HK$100,000 per
													year.</p>
												<br>
												<p>Except the above mentioned coverage, this insurance
													also provides the following extra benefits:</p>
												<br>
												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td><strong>Item</strong></td>
															<td><strong>Benefit</strong></td>
															<td><strong>Maximum Limits<br>(HK$)
															</strong></td>
														</tr>
														<tr>
															<td>1</td>
															<td><strong>Window, Door Lock &amp; Key
																	Replacement<br /> Replacement of external door locks
																	and keys or broken windows due to theft or attempted
																	theft
															</strong></td>
															<td>3,000 per year</td>
														</tr>
														<tr>
															<td>2</td>
															<td><strong>Temporary Removal<br />
																	Accidental loss of or damage to household contents
																	whilst being temporarily removed from home for
																	renovation, cleaning or repair
															</strong></td>
															<td>50,000 per year</td>
														</tr>
														<tr>
															<td>3</td>
															<td><strong>Home Removal<br /> Accidental
																	loss of or damage to household contents:<br /> (a)
																	whilst in transit between current home and new home by
																	professional removers within Hong Kong; or<br /> (b)
																	whilst in temporary storage, for up to 7 days in a
																	furniture depository; or<br /> (c) whilst at the new
																	home but before occupied as permanent residence up to 2
																	months<br /> (you have to notify us before your move)
															</strong></td>
															<td>50,000 per year</td>
														</tr>
														<tr>
															<td>4</td>
															<td><strong>Frozen Food<br /> Cost of
																	replacing spoilt frozen food due to accidental power
																	failure or breakdown of refrigerator
															</strong></td>
															<td>5,000 per year</td>
														</tr>
														<tr>
															<td>5</td>
															<td><strong>Removal of Debris<br /> Cost
																	of removal of debris when household contents are
																	accidentally damaged
															</strong></td>
															<td>10,000 per year</td>
														</tr>
														<tr>
															<td>6</td>
															<td><strong>Personal Money<br />
																	Accidental loss or theft of money at home
															</strong></td>
															<td>2,500 per year</td>
														</tr>
														<tr>
															<td rowspan="2">7</td>
															<td><strong>Domestic Helper's Property</strong></td>
															<td>1,000 per item</td>
														</tr>
														<tr>
															<td><strong>Accidental loss of or damage to
																	domestic helper's property at home</strong></td>
															<td>5,000 per year</td>
														</tr>
														<tr>
															<td>8</td>
															<td><strong>Tenants Improvement<br />
																	Accidental loss of or damage to tenant's improvements
																	at home
															</strong></td>
															<td>100,000 per item</td>
														</tr>
														<tr>
															<td>9</td>
															<td><strong>Interior Renovation<br />
																	Accidental loss of or damage to household contents
																	during interior renovation by contractors (provided
																	that the period of renovation is within 2 months)
															</strong></td>
															<td>100,000 per year</td>
														</tr>
														<tr>
															<td rowspan="2">10</td>
															<td rowspan="2"><strong>Alternative
																	Accommodation<br /> Cost of alternative accommodation
																	when the home becomes uninhabitable as a result of
																	accidental loss or damage
															</strong></td>
															<td>1,000 per day</td>
														</tr>
														<tr>
															<td>50,000 per year</td>
														</tr>
														<tr>
															<td rowspan="2">11</td>
															<td rowspan="2"><strong>Personal Accident<br />
																	Accidental death of Insured or Insured's family members
																	as a result of fire or theft at home
															</strong></td>
															<td>50,000 per person</td>
														</tr>
														<tr>
															<td>200,000 per year</td>
														</tr>
													</tbody>
												</table>
												<h4 class="h4-2">
													<strong> Section 1. Household Contents</strong>
												</h4>
												<p>Easy HomeCare provides worldwide cover of your legal
													liability up to HK$5,000,000 against any claim for bodily
													injury or property damage resulting from the negligence of
													you or your family members normally living with you.
													Provided that the legal proceedings is submitted to the
													Hong Kong court.</p>
												<p>a) as occupier of the home</p>
												<p>b) as owner of the home (including common areas of
													the building)</p>
												<p>c) as a private individual (anywhere in the world)</p>

												<p>Cover your legal liability being a Tenant of the home
													against the damage caused to the structure of the home and
													landlord's fixtures and fittings.</p>




											</div>
										</div>
										<!-- / Summary of Coverage -->


										<!--   Major Exclusions  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> Premium Table (HK$)</a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td>Section</td>
															<td>Coverage</td>
															<td>Limit of Liability (HK$)</td>
															<td>Annual Premium (HK$)</td>
														</tr>
														<tr>
															<td>Section 1</td>
															<td>Household Contents</td>
															<td>500,000</td>
															<td>360</td>
														</tr>
														<tr>
															<td>Section 2</td>
															<td>Personal Liability</td>
															<td>5,000,000</td>
															<td>Free with Section 1</td>
														</tr>
													</tbody>
												</table>


											</div>
										</div>
										<!-- /  Major Exclusions -->

										<!--   Age limit  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> Major Exclusions </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>
													The following is only a summary of the major exclusions.
													Please refer to the Policy for details.<br>
												<ul>
													<li>Loss or damage arising from uninsurable risks such
														as scratching, wear and tear, mechanical or electrical
														fault or breakdown, misuse or domestic animals</li>
													<li>Loss of or damage to mobile phones, household
														contents contained in open areas or on roofs, spectacles,
														contact lenses, sporting equipment whilst in use, computer
														system records, aerial devices or satellite dish</li>
													<li>Loss or damage if the home is unoccupied for more
														than 60 consecutive days</li>
													<li>Personal Liability for travelling out of Hong Kong
														exceeding 90 consecutive days</li>
													<li>Loss or damage due to war risks, radioactive
														risks, sonic bangs or any act of terrorism</li>

												</ul>


												</p>
											</div>
										</div>
										<!-- / Age limit -->
										<!--   Premium table (HK$)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> Excess </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">

												<h4 class="h4-2">
													<strong>Single Trip Premium Table (HK$)</strong>
												</h4>

												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td colspan="1" rowspan="2"><strong></strong>Section
																1 - Household Contents</td>
															<td colspan="2" rowspan="1">the first HK$1,000 of
																each claim caused by water</td>
														</tr>
														<tr>
															<td colspan="2" rowspan="1">the first HK$500 of each
																claim resulting from any other cause</td>
														</tr>
														<tr>
															<td><strong> Section 2 - Personal Liability
															</strong></td>
															<td colspan="2" rowspan="1">the first HK$500 of each
																claim for third party property damage</td>
														</tr>
													</tbody>
												</table>



											</div>
										</div>
										<!-- / Premium table (HK$) -->


									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>

							<h4 class="h4-4">
								<i class="fa fa-download"></i> <a href="">Download Brochure</a>
							</h4>
						</div>
						<!--Full coverage end -->




					</div>
					<div
						class="col-lg-5 col-md-5 col-sm-5 col-xs-5 gray-bg pad-none hidden-sm hidden-xs">
						<form:form name="frmHomeCarePlan" id="frmHomeCarePlan"
							action="getYourHomeCareDetails" method="post"
							modelAttribute="planQuoteDetails">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">${planQuote.getPlanCode() }
										Insurance</h2>
									<h4>Plan Summary</h4>
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk1">HK$</div>
										<div class="hk1 top-mrg-10">
											<div class="flightcare-hk">
												${planQuote.getGrossPremium()}</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="orange-bdr"></div>
							<div class="form-container">
								<h3>Plan Type</h3>
								<div class="form-group">
									<p class="h4-5 pad-none">Standard Cover, Annual</p>
								</div>

								<h3>Promotion code</h3>

								<!-- <div class="form-group">
									<div class="input-group">
										<input name="" type="text" class="form-control placeholder-fl"
											placeholder="eg.FWD789"> <span
											class="input-group-addon in"><span class="apply">APPLY</span></span>
									</div>
								</div> -->
								<span class="text-red" id="errPromoCode"></span>
								<div class="form-group">
									<div class="input-group">
										<input type="text" id="referralCode" name="referralCode"
											class="form-control" placeholder="eg.FWD789"> <span
											class="input-group-addon in black-bold"> <span
											class="apply pointer" onclick="applyPromoCode()">APPLY</span>
											<!-- <input type="button" name="Apply" value="APPLY" onclick="applyPromoCode()"> -->
										</span>
									</div>
								</div>
								<div class="travel-italic">
									<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i>How do I get a
											promotion code?</i></a>
								</div>
							</div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Subtotal</h3>
							<h3 id="subtotal"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right">
								${planQuote.getTotalDue()}</h3>

							<h3 class="h4-1-orange-b col-lg-6 col-md-6 marg-t">Discount
							</h3>
							<h3 id="discountAmt"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right marg-t">-${planQuote.getDiscountAmount()}
							</h3>
							<div class="clearfix"></div>
							<div class="orange-bdr"></div>
							<h3 class="h4-1-orange-b col-lg-6 col-md-6">Amount due</h3>
							<h3 id="amountdue"
								class="h4-1-orange-b col-lg-6 col-md-6 text-right">${planQuote.getTotalDue()}</h3>

							<input type="hidden" name="planCode" id="planCode"
								value="${planQuote.getPlanCode() }">
							<input type="hidden" name="grossPremium" id="grossPremium"
								value="${planQuote.getGrossPremium()}">
							<input type="hidden" name="discountAmount" id="discountAmount"
								value="${planQuote.getDiscountAmount()}">
							<input type="hidden" name="totalDue" id="totalDue"
								value="${planQuote.getTotalDue()}">

							<input type="hidden" name="referralCode" id="referralCode"
								value="${planQuote.getReferralCode()}">
							<input type="hidden" name="referralName" id="referralName"
								value="${planQuote.getReferralName()}">

							<input type="hidden" name="answer1" value="${answer1}">
							<input type="hidden" name="answer2" value="${answer2}">

							<!-- <h3 class="back-to-travel col-lg-6 col-md-6 text-right"><a href="homecare.html">Back to home</a> </h3>
            <div class="col-lg-6 col-md-6 text-right"> <a href="homecare-plan-details.html" class="bdr-curve btn btn-primary nxt-btn ">Next</a> </div>-->

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
								<a href="homecare.html"
									class="bdr-curve btn btn-primary bck-btn">Back </a>
							</div>
							<!-- <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right"> <a href="homecare-plan-details.html" class="bdr-curve btn btn-primary nxt-btn " onclick="return pageValidate();"> Next</a> </div> -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
								<button type="submit" class="bdr-curve btn btn-primary nxt-btn">Next</button>
							</div>

							<div class="clearfix"></div>
							<br>
							<br>
						</form:form>
					</div>
					<div class="clearfix"></div>
				</div>
				<p class="padding1 hidden-sm hidden-xs">
					The features above are indicative only. Please refer to the <a
						class="sub-link"
						href="policy-provisions-pdf/Easy_HomeCare_Provisions_Mar_2015.pdf"
						target="_blank">Policy Provisions</a> for details.<br> For a
					complete explanation of the terms and conditions, feel free to
					contact an adviser or our 24-hour hotline at 3123 3123 for more
					details.
				</p>

			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--Apply-->

	<form:form name="frmHomeCarePlan" id="frmHomeCarePlan"
		action="getYourDetails" method="post"
		modelAttribute="planQuoteDetails">
		<div class="row hidden-lg hidden-md text-center">
			<br>
			<div class="col-sm-12 col-xs-12 gray-bg">
				<h3 class="col-sm-6 col-xs-6">Promotion Code</h3>
				<h5 class="col-sm-6 col-xs-6 padding7">
					<a href="" class="sub-link" data-toggle="modal"
						data-target=".bs-promo-modal-lg"><i>How do I get a
							pramotion code?</i></a>
				</h5>
				<div class="clearfix"></div>

				<div class="form-group col-sm-12 col-xs-12">
					<div class="input-group">
						<span class="text-red" id="errPromoCode"></span> <input
							id="referralCode" name="referralCode" type="text"
							class="form-control placeholder-fl" placeholder="eg.FWD789">
						<span class="input-group-addon in"><span class="apply"><input
								type="button" name="Apply" value="APPLY"
								onclick="applyPromoCode()"></span></span>
					</div>
				</div>
			</div>

		</div>

		<div class="row-fluid hidden-lg hidden-md text-center">
			<div class="">
				<button type="submit"
					class="btn-box bdr-curve btn btn-primary nxt-btn">
					<h3 class="text-center marg-t">Next</h3>
				</button>
			</div>
				<!-- 
				<p class="text-center mob-bottom">&copy; 2015 FWD Hong Kong. All
					rights reserved.</p>
				-->
		</div>
		<!--/mob-#bottom-->
	</form:form>

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

</body>
</html>

<script>
	
</script>