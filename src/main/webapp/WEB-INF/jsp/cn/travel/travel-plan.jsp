<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.ifwd.fwdhk.model.QuoteDetails"%>
<%@page import="com.ifwd.fwdhk.model.TravelQuoteBean"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var promoData = '';
	function getuserDetails() {

		//alert($('#frmTravelPlan input').serialize());
		/*     document.frmTravelPlan.action = "getYourDetails"; */
	}
	function chkPromoCode() {
		var flag = false;
		var promoCode = document.getElementById("promoCode").value;

		if (promoCode.trim() == "") {
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notNull.message"));
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function chkDueAmount() {
		var flag = false;
		var amount = document.getElementById("amountdue").innerHTML;

		if (amount == "0") {
			document.getElementById("errDue").innerHTML = "請至少選擇一個計劃";
			flag = false;
		} else
			flag = true;

		return flag;
	}
	function applyPromoCode() {
		
		$("#errPromoCode").html("");
		
		if(chkPromoCode())
		$.ajax({
			type : 'POST',
			url : 'applyPromoCode',
			data : $('#frmTravelPlan input').serialize(),
			success : function(data) {
				
				var json = JSON.parse(data);
				promoData = json;
				setValue(json);
			}

		});
	}

	function setValue(result) {

		var selValue = document.getElementById("inputseletedplanname").value;
		if(result['errMsgs'] !== null){
			$("#errPromoCode").html(getBundle(getBundleLanguage, "system.promotion.error.notVaild.message"));
		}else{
			$("#errPromoCode").html("");
			
			if (selValue == "Plan A") {
				//var totalDue = parseInt(result["priceInfoA"].totalDue);
				
				$("#subtotal").html(parseFloat(result["priceInfoA"].grossPremium).toFixed(2));
				$("#discountAmt").html(parseFloat(result["priceInfoA"].discountAmount).toFixed(2));
				$("#amountdue").html(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				$('#selectedAmountDue').val(parseFloat(result["priceInfoA"].totalDue).toFixed(2));
				
			} else {
				//var totalDue = parseFloat(result["priceInfoB"].totalDue).toFixed(2);
				$("#subtotal").html(parseFloat(result["priceInfoB"].grossPremium).toFixed(2));
				$("#discountAmt").html(parseFloat(result["priceInfoB"].discountAmount).toFixed(2));
				$("#amountdue").html(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				$('#selectedAmountDue').val(parseFloat(result["priceInfoB"].totalDue).toFixed(2));
				
			}
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
	<div id="cn" class="container">
		<div class="row">
			<form:form name="frmTravelPlan" id="frmTravelPlan"
				action="getYourDetails" method="post" modelAttribute="travelQuote"
				onsubmit="return chkDueAmount();">
				<ol class="breadcrumb pad-none">
					<li><a href="#">主頁</a> <i class="fa fa-caret-right"></i></li>
					<li><a href="#">旅遊保險 </a></li>
					<li class="active "><i class="fa fa-caret-right"></i> 您的選擇</li>
				</ol>
				<div class="container ">
					<div class="col-lg-12 col-md-12 shop-tracking-status">
						<div class="center wow fadeInDown animated"
							style="visibility: visible;">
							<h2>您的選擇</h2>
						</div>
						<br> <br>
						<div class="col-lg-12 col-md-12">
							<div id="tr-wizard" class="shop-tracking-status">
								<div class="order-status">
									<div class="order-status-timeline-new">
								<!--
										There can be n '.order-status-timeline-completion'
										dots-inactive and dots-active color the dots -->
										<div class="order-status-timeline-completion dots-inactive"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
										<div class="order-status-timeline-completion dots-inactive"></div>
									</div>
									<div
										class="image-order-status image-order-status-new active img-circle act">
										<span class="status">您的選擇</span>
										<div class="icon">1</div>
									</div>
									<div
										class="image-order-status image-order-status-intransit  img-circle disabled">
										<span class="status">個人資料</span>
										<div class="icon">2</div>
									</div>
									<div
										class="image-order-status image-order-status-delivered  img-circle disabled">
										<span class="status">總結及付款</span>
										<div class="icon">3</div>
									</div>
									<div
										class="image-order-status image-order-status-completed  img-circle disabled">
										<span class="status lst-status">確認保單</span>
										<div class="icon">4</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container pad-none bdr ur-opt-content">
					<div class="col-lg-7 col-xs-12 col-sm-12 col-md-7">
						<h2 class="h2-3-choose hidden-sm hidden-xs">您的選擇</h2>
						<%
							QuoteDetails travelQuote = (QuoteDetails) request
										.getAttribute("quoteDetails");
								if (travelQuote.getPlanName().length > 0) {
									for (int i = 0; i < travelQuote.getPlanName().length; i++) {
						%>
						<div class="col-lg-12 col-md-12 plan-box3 travelproductbox"
							id="box<%=i%>"
							onclick="changeColorAndPrice('box<%=i%>','<%=travelQuote.getPlanName()[i]%>','<%=travelQuote.getDiscountAmount()[i]%>','<%=travelQuote.getToalDue()[i]%>')">
							<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 pad-none">
								<%-- <h2><%=travelQuote.getPlanName()[i]%><br> 優越保障<br>
									HK$1,000,000 醫療保障
								</h2> --%>
								
								<h2>
									<%=travelQuote.getPlanName()[i]%>
									<%-- <input type="text" name="txtPlanName<%=i %>" values="<%=travelQuote.getPlanName()[i] %>"> --%>
									<br> <%if (travelQuote.getPlanName()[i].equals("Plan A"))
									{%>  優越保障<br> HK$ 1,000,000 Medical
								<%}	else{ %>
								经济封面<br> HK$	500,000 Medical
									<%} %>
									
								</h2>	
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
								<br>
								<h3>港幣</h3>
								<h6>
									<span id="grossPremium"><%=travelQuote.getGrossPremium()[i]%></span>
								</h6>
							</div>
							<div class="clearfix"></div>
							<!-- Plan benefits -->
							<div class="fwdpanel">
								<div class="fwdpanel-heading">
									<h4 class="uline benefits">
										<span><a href="#"
											class="fwdpanel-minimize uline text-black"><i
												class="fa fa-plus"></i>承保範圍</a> </span>
									</h4>
								</div>
								<!-- <div class="fwdpanel-body" style="display: none;">
									<p class="color-wht">
										<i class="fa fa-plus"></i> 住院或檢疫現金津貼 $10,000<br> <i
											class="fa fa-plus"></i> 全球緊急支援服務 <br> <i
											class="fa fa-plus"></i> 租車自負額 $5,000 <br> <i
											class="fa fa-plus"></i> 高爾夫球“一桿入洞” $3,000 <br>
									</p>
								</div> -->
								
								<div class="fwdpanel-body" style="display: none;">
									<!-- <p class="color-wht"> -->
										<table class="col-xs-12">
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
													<i class="fa fa-plus"></i> 住院或檢疫現金津貼 </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$10,000</td>
										</tr>
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> 全球緊急支援服務
											</td><td class="col-lg-4 col-md-4 col-sm-6 col-xs-6"> </td>
										</tr> 
										
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> 租車自負額 </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$5,000 </td>
										</tr>
										<tr>
											<td class="col-lg-8 col-md-8 col-sm-6 col-xs-6 pad-none">
											<i class="fa fa-plus"></i> 高爾夫球“一桿入洞” </td>
											<td class="col-lg-4 col-md-4 col-sm-6 col-xs-6">$3,000 </td>
											</tr>
										</table>
										<!--<i class="fa fa-plus"></i> See more benefits<br>-->
									<!-- </p> -->
								</div>
								
								
								
								<div class="clearfix"></div>
							</div>
							<!-- / Plan benefits -->
						</div>

						<input type="hidden" name="txtTotalDue"
							value="<%=travelQuote.getToalDue()[i]%>"> <input
							type="hidden" name="txtGrossPremium"
							value="<%=travelQuote.getGrossPremium()[i]%>"> <input
							type="hidden" name="txtDiscountAmount" id="txtDiscountAmount[i]"
							value="<%=travelQuote.getDiscountAmount()[i]%>"> <input
							type="hidden" name="referralCode"
							value="<%=travelQuote.getReferralCode()%>"> <input
							type="hidden" name="referralName"
							value="<%=travelQuote.getReferralName()%>">
						<%
							}
						%>
						<%
							}
						%>

						<!--Full Coverage-->
						<div class="fwdpanel">
							<div class="fwdpanel-heading">
								<h4 class="fwdpanel-title h4-4-full">
									<span><a href="#" class="fwdpanel-minimize"><i
											class="fa fa-plus"></i> 更多保障詳情 </a> </span>
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
															class="fa fa-plus"></i> 產品特點 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>TravelCare專為旅遊或外出公幹人仕而設，提供全面旅遊保障，讓您無論身處何地，亦可享有醫療、全球緊急支援服務，住院現金津貼，人身意外，嚴重燒傷，個人錢財，行李，個人責任，旅程延誤，取消及縮短行程等保障。有關保障詳情，請參閱以下的“保障範圍”。</p>
												<br>
												<p>
													-每項保障均無自負金額 <br> -全球24小時免費緊急支援服務 <br>
													-保障休閒和業餘體育運動，包括冬季運動、蹦極、登山、攀岩、騎馬、潛水等水上運動 <br>
													-保障因恐怖主義活動而引起的個人意外及醫療相關的索償 <br>
													-保費按日計算，切合實際旅程需要，毋須多付保費 <br> -個人及子女或家庭計劃內受保的子女數目不限 <br>
													-若因不能避免的原因需要延續旅程，可自動享有為期高達-10天的免費額外保障
												</p>

											</div>
										</div>
										<!-- /  Product Highlights -->
										<!--  Summary of Coverage  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 保障範圍 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<table id="summary" class="table table-bordred">
													<tbody>
														<tr>
															<td rowspan="2">保障項目</td>
															<td rowspan="2">承保範圍</td>
															<td colspan="2">最高保障金額(港幣)</td>
														</tr>
														<tr>
															<td>A計劃</td>
															<td>B計劃</td>
														</tr>
														<tr>
															<td>1. 醫療費用</td>
															<td>a) 醫療費用 -因生病或身體受傷所需的醫療費用包括門診, 住院或其他醫療服務。<br>
																<br> b) 覆診費用 - 如曾於外地就醫,
																返回香港後九十日內之必須醫療費用。最高可達港幣100,000
																(包括跌打每日每次上限為港幣200，最高賠償額為港幣3,000) 。
															</td>
															<td>$1,000,000</td>
															<td>$500,000</td>
														</tr>
														<tr>
															<td rowspan="2">2. 住院或隔離現金津貼</td>
															<td>a) 海外住院 –受保人在住院期間, 每日可獲得現金 港幣500 的附加津貼, 以應付額外開支。</td>
															<td>$10,000</td>
															<td>$5,000</td>
														</tr>
														<tr>
															<td>b) 強制隔離
																–於受保旅程中被隔離，或於受保旅程完結後返回香港七日內被強制隔離，受保人可獲得每完整一天港幣500的現金津貼。</td>
															<td>$10,000</td>
															<td>$5,000</td>
														</tr>
														<tr>
															<td rowspan="9">3. 全球緊急支援服務</td>
															<td>a) 緊急醫療撤離及遣返 - 將受保人緊急運送至就近有足夠醫療設備的醫療中心及在必須情況下,
																將受保人送返香港治療。</td>
															<td>全部開支</td>
															<td>全部開支</td>
														</tr>
														<tr>
															<td>b) 入院按金保證 - 辦理緊急入院按金保證。</td>
															<td>$40,000</td>
															<td>$40,000</td>
														</tr>
														<tr>
															<td>c) 額外住宿費用 - 如受保人遭遇嚴重醫療問題,
																使其同行的一名受保人之家人或同行朋友支付額外的住宿費用。</td>
															<td>$40,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>d) 親友探望 - 受保人遭嚴重疾病或意外導致死亡或需停留外地治療超過3天,
																兩名直系親屬前往該地照料而引致的交通費。</td>
															<td>$40,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>e) 安排未成年子女送返香港 - 安排受保人的十八歲以下同行及受保子女送返香港之費用。</td>
															<td>$40,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>f) 運送遺體 / 骨灰送返香港 - 若受保人不幸身故, 其遺體或骨灰運返香港之費用。</td>
															<td>$40,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>g) 安排返回香港以便辦理至親人後事 - 因直系親屬去世而需臨時折返香港 (包括經濟客位機票)
																。</td>
															<td>$40,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>h) 其他援助 - 提供電話醫療諮詢服務, 緊急旅遊支援服務或法律團體轉介等等。</td>
															<td>已包括</td>
															<td>已包括</td>
														</tr>
														<tr>
															<td>全球緊急支援服務由國際(SOS)救援中心提供</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td rowspan="3">4. 人身意外</td>
															<td>人身意外 意外死亡/ 永久完全殘廢/ 一目或雙目視力全失/
																一肢或四肢不全或永久喪失功效。(死亡賠償適用於18歲以下兒童及70歲以上人士最高賠償為港幣300,000)</td>
															<td>$1,200,000</td>
															<td>$600,000</td>
														</tr>
														<tr>
															<td>嚴重燒傷<br>
																受保人於旅程期間因意外遭受三級程度燒傷且燒傷部分達其頭部表面面積的5%或以上或其身體 總表面面積的10%或以上。
															</td>
															<td>$200,000</td>
															<td>$100,000</td>
														</tr>
														<tr>
															<td>信用卡保障<br> 受保人在旅途中因意外死亡，意外發生當日其信用卡之結欠將得到賠償。
															</td>
															<td>$30,000</td>
															<td>$15,000</td>
														</tr>
														<tr>
															<td>5. 行李</td>
															<td>在旅途中因盜竊、搶劫、意外遺失或損毀而導致受保人的財物損失, 但每件/對/套最高賠償限額為
																港幣3,000。</td>
															<td>$20,000</td>
															<td>$3000</td>
														</tr>
														<tr>
															<td>6. 行李延誤</td>
															<td>受保人在抵達目的地6小時後, 寄運之行李因誤送或延遲仍未送達,
																可就購買必需品或須付來回機場以取回行李之額外交通費而提出索償。(如受保人已返家或抵達最後目的地,
																則本部份不再適用。)</td>
															<td>$1,500</td>
															<td>$500</td>
														</tr>
														<tr>
															<td>7. 個人錢財</td>
															<td>受保人被偷竊、爆竊、搶劫而導致的金錢損失。（包括：現金、旅行支票）</td>
															<td>$3,000</td>
															<td>$2,000</td>
														</tr>
														<tr>
															<td>8. 旅遊證件遺失</td>
															<td>因遺失護照、機票及其他旅遊證件所支付的補領費用，額外交通及住宿費用等。（額外交通及住宿費用最高賠償為每天港幣2,000（A計劃）或每天港幣1,000（B計劃）。）
															</td>
															<td>$20,000</td>
															<td>$5,000</td>
														</tr>
														<tr>
															<td rowspan="3">9. 旅程延誤</td>
															<td>a) 額外交通費
																飛機或其他公共交通工具如受惡劣天氣、工業行動、騎劫、機件故障取消或延誤，而必須改動行程而導致之額外交通費。</td>
															<td>$10,000</td>
															<td>$2,500</td>
														</tr>
														<tr>
															<td>b) 現金津貼 如旅程延誤超過6小時而又無須支付額外交通費，每超過6小時可獲港幣300現金津貼。
															</td>
															<td>$2,500</td>
															<td>$600</td>
														</tr>
														<tr>
															<td>(只可選擇A項或B項作為賠償）</td>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
														</tr>
														<tr>
															<td>10. 旅程取消</td>
															<td>若受保人因須出庭作證、出任陪審團、被強迫性隔離、或受保人其直系家人、同行伙伴
																或生意伙伴遭遇身故、嚴重疾病或嚴重身體受傷或於出發前10天因住宅受到水災或火災嚴重損毀而不能成行或出發前7天目的地發出黑色外遊警示受保人可就不能取回之訂金、旅費及機票費用提出索償。</td>
															<td>$30,000</td>
															<td>$5,000</td>
														</tr>
														<tr>
															<td>11. 縮短旅程</td>
															<td>受保人及其直系家人或同行伙伴或生意伙伴遭遇身故、嚴重疾病或嚴重身體受傷，或所乘搭的交通工具被騎劫、惡劣天氣、自然災害或突然爆發廣泛性傳染病、工業行動、暴動或內亂或旅遊目的地發出黑色外遊警示而必須縮短旅程，其不獲退回之未用旅費及返回香港之額外旅費均可獲得賠償。</td>
															<td>$30,000</td>
															<td>$5,000</td>
														</tr>
														<tr>
															<td>12. 家居爆竊</td>
															<td>受保人之主要往所於外遊期間空置，
																並遭人使用暴力進出及入屋爆竊引致住所內家居物品或個人財物之失竊或破損。</td>
															<td>$30,000</td>
															<td>$10,000</td>
														</tr>
														<tr>
															<td>13. 人身責任</td>
															<td>因意外導致他人身體受傷或他人財物損失而負上法律責任。
																（駕駛或租用汽車引起的責任不在受保範圍之列）</td>
															<td>3,000,000</td>
															<td>1,500,000</td>
														</tr>
														<tr>
															<td>14. 租車自負額</td>
															<td>受保人在旅行期間所租用的車輛發生汽車意外，或車輛損壞或被盜，受保人可就該租用車輛之汽車保險保單所支付的自負額獲得賠償。</td>
															<td>$5,000</td>
															<td>$3,000</td>
														</tr>
														<tr>
															<td>15. 高爾夫球 &quot;“一桿入 洞”&quot;</td>
															<td>受保人於任何認可的高爾夫球場成功打出了“一桿入洞” 。</td>
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
															class="fa fa-plus"></i> 主要不受保項目 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<ol class="text-justify">
													<li>戰爭（不論已宣戰與否）、內戰、外敵行動、叛亂、軍事或篡奪行動。</li>


													<li>核風險。</li>

													<li>恐怖主義（此保障計劃所承保的人身意外、醫療費用、全球緊急支援服務、
														旅程延誤、旅程取消、縮短旅程項目除外）。</li>

													<li>投保前已存在之傷疾、先天及遺傳性疾病。</li>

													<li>自殺、蓄意自我傷害、神經錯亂、墮胎、流產、懷孕及其併發症、分娩、性病、
														服用酒精或非由註冊醫生處方的藥物、牙齒護理（因意外而損壞健全的牙齒除外)。</li>

													<li>任何種類的競賽（徒步進行的比賽除外）或任何職業性質的運動或受保人可能 或可以賺取收入或報酬的運動。</li>

													<li>任何空中活動，除非受保人（i）以付費乘客身份在認可及持牌航空公司的航機上，
														或（ii）所參與之活動是由另一位持牌人士帶領下負責操縱及航行，而該活動的舉 辦者亦獲當地有關當局授權。</li>

													<li>任何損失未能於24小時內向有關機構報告(例如：航空公司、警署)及取回書面證明。</li>

													<li>傳呼機、手提電話、手提便攜式通訊器材、電腦器材(手提電腦除外)。</li>

													<li>由於使用汽車、飛機或船隻或因故意、蓄意或非法活動所引起的責任。</li>
												</ol>
											</div>
										</div>
										<!-- /  Major Exclusions -->
										<!--   Age limit  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 年齡限制 </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body" style="display: none;">
												<p>
													受保人必須為6星期至85歲之人仕 (全年保障計劃為70歲)，18歲以下兒童須最少由一名成人陪同投保。<br>
													(此乃保障計劃摘要，有關保障條款及規定，以保單內容為準。)
												</p>
											</div>
										</div>
										<!-- / Age limit -->
										<!--   Premium table (港幣)  -->
										<div class="fwdpanel fwdpanel-primary">
											<div class="fwdpanel-heading">
												<h4 class="fwdpanel-title h4-4-travel margin-left">
													<span><a href="#" class="fwdpanel-minimize"><i
															class="fa fa-plus"></i> 保費表（港幣） </a> </span>
												</h4>
											</div>
											<div class="fwdpanel-body">
												<h4 class="h4-2">
													<strong>單次旅程保險價目表 (港幣)</strong>
												</h4>
												<table id="Premium" class="table table-bordred">
													<tbody>
														<tr>
															<td rowspan="2"><strong>日數</strong></td>
															<td colspan="2"><strong>個人</strong></td>
															<td colspan="2"><strong>個人及子女</strong></td>
															<td colspan="2"><strong>家庭</strong></td>
														</tr>
														<tr>
															<td width="101"><strong>A 計劃</strong></td>
															<td width="86"><strong>B 計劃</strong></td>
															<td width="84"><strong>A 計劃</strong></td>
															<td width="81"><strong>B 計劃</strong></td>
															<td width="93"><strong>A 計劃</strong></td>
															<td width="88"><strong>B 計劃</strong></td>
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
															<td>8</td>
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
													<strong>全年保障保費價目表 (港幣)</strong>
												</h4>
												<table id="annual" class="table table-bordred">
													<tbody>
														<tr>
															<td width="208" rowspan="4"><strong>全年保障每次不逾90日</strong></td>
															<td colspan="2" rowspan="2">個人</td>
															<td width="108">A 計劃</td>
															<td width="36">1,800</td>
														</tr>
														<tr>
															<td>B 計劃</td>
															<td>1,300</td>
														</tr>
														<tr>
															<td colspan="2" rowspan="2">個人及子女/家庭 /家庭</td>
															<td>A 計劃</td>
															<td>3,600</td>
														</tr>
														<tr>
															<td>B 計劃</td>
															<td>2,600</td>
														</tr>
													</tbody>
												</table>
												<br>
												<h4 class="h4-2">
													<strong>附註:</strong>
												</h4>
												<p>
													個人 - 投保人年齡介乎18歲至85歲 (全年保障計劃為70歲) <br> 子女 -
													指年齡在6星期至17歲而於整段旅程期間均與投保人同行的未婚子女 <br> 個人及子女 -
													即投保人及上述所指的17歲或以下之子女，並不限制子女數目 <br> 家庭 -
													即投保人、其配偶及上述所指的17歲或以下之子女，並不限制子女數目 <br>
												</p>
											</div>
										</div>
										<!-- / Premium table (港幣) -->
									</div>
									<!-- / col-md-12 -->
								</div>
								<!-- /row -->
							</div>
							<h4 class="h4-4">
								<a
									href="http://www.fwd.com.hk/upload/en-US/travel_care_insurance.pdf"
									target="_blank"><i class="fa fa-download"></i> 下載小冊子</a>
							</h4>
						</div>
					</div>

					<div
						class="col-lg-5 col-md-5 col-sm-12 col-xs-12 gray-bg pad-none">
						<div class="col-xs-12 hidden-sm hidden-xs">
							<div class="wd2">
								<div class="pull-left">
									<h2 class="h2-3-choose">旅遊保險</h2>
									<h4 id="seletedplanname"></h4>
									<input type="hidden" name="planName" id="inputseletedplanname"
										value="">
									
										
								</div>
								<div class="pull-right">
									<div class="text-left pad-right1 h2-2 h2">
										<div class="hk">
											港幣
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
								<h3>出發日期</h3>
								<div class="form-group">
									<div class="input-group wd2">
										<input name="trLeavingDate" type="text"
											class="datepicker form-control"
											value="${travelQuoteBean.getTrLeavingDate() }" readonly>
									</div>
								</div>
								<h3>回程日期</h3>
	
								<div class="form-group">
									<div class="input-group wd2">
										<input name="trBackDate" type="text"
											class="datepicker form-control"
											value="${travelQuoteBean.getTrBackDate() }" readonly>
									</div>
								</div>
								<h3>同行人數</h3>
								<div class="form-group likeDatePicker bcg-trans">
	              					<div class="input-group wd2 datepicker form-control" > 
									<%	if (travelQuote.getPlanSelected() != null && travelQuote.getPlanSelected().equals("personal"))
										{ 
									%>
											<c:if test="${travelQuoteBean.getTotalPersonalTraveller()!=0}">   ${travelQuoteBean.getTotalPersonalTraveller()} 旅客   </c:if>
									<% } 
									   else 
									   {
									%>
											<c:if test="${travelQuoteBean.getTotalAdultTraveller()!=0}">    ${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()} 父母 <br></c:if>
											<c:if test="${travelQuoteBean.getTotalChildTraveller()!=0}">    ${travelQuoteBean.getTotalChildTraveller()} 孩子 <br></c:if>
											<c:if test="${travelQuoteBean.getTotalOtherTraveller()!=0}">    ${travelQuoteBean.getTotalOtherTraveller()} 其他 <br></c:if>
									<% }
									%>
									</div>
								</div>
								<input type="hidden" name="totalAdultTraveller"
									id="totalAdultTraveller"
									value="${travelQuoteBean.getTotalAdultTraveller()+travelQuoteBean.getTotalPersonalTraveller()}">
								<input type="hidden" name="totalChildTraveller"
									id="totalChildTraveller"
									value="${travelQuoteBean.getTotalChildTraveller()}"> <input
									type="hidden" name="totalOtherTraveller"
									id="totalOtherTraveller"
									value="${travelQuoteBean.getTotalOtherTraveller()}">
								<%-- <input type="hidden" name="totalOtherTraveller" id="totalOtherTraveller" value="${travelQuoteBean.getTotalPersonalTraveller()}"> --%>
								<h3>
									合共 <span> ${travelQuoteBean.getTotalTravellingDays()} <input
										type="hidden" name="totalTravellingDays"
										id="totalTravellingDays"
										value="${travelQuoteBean.getTotalTravellingDays()}"> 天
									</span>
								</h3>
							</div>
						</div>
						<div class="col-xs-12">
							<h3>推廣編號</h3>
						
							<span class="text-red" id="errPromoCode"></span>
							<div class="form-group">
								<div class="input-group">
									<input type="text" id="promoCode" name="promoCode"
										class="form-control" placeholder="eg.FWD789"> <span
										class="input-group-addon in black-bold pointer"
										onclick="applyPromoCode()"><span>APPLY</span></span>
								</div>
							</div>
							<div class="travel-italic">
								<a href="" class="sub-link" data-toggle="modal"
										data-target=".bs-promo-modal-lg"><i>如何取得推廣編號?</i></a>
							</div>
						
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">小計</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="subtotal"></h3>
						<input type="hidden" name="subTotal" id="subTotal" value="540">
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">折扣優惠</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="discountAmt">-</h3>
						<input type="hidden" name="selectedDiscountAmt"
							id="selectedDiscountAmt" value="">
						<div class="clearfix"></div>
						<div class="orange-bdr"></div>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6">所需保費</h3>
						<h3 class="h4-1-orange-b col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right"
							id="amountdue">0</h3>
						<input type="hidden" name="selectedAmountDue"
							id="selectedAmountDue" value="">
							</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-left">
							<a href="#" onclick="BackMe();"
								class="bdr-curve btn btn-primary bck-btn">上一頁 </a>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 pull-right">
							<button type="submit" class="bdr-curve btn btn-primary btn-next">
								下一頁 </a>
						</div>
						<div class="clearfix"></div>
						<br> <span class="text-red" id="errDue"></span> <br>
					</div>
					<div class="clearfix"></div>
				</div>
		</div>
		<input type="hidden" name="planSelected" id="planSeelcted"
			value="<%=travelQuote.getPlanSelected()%>">
		<p class="padding1 hidden-sm hidden-xs">
			以上資料只作參考用途。詳情請查看<a class="sub-link"
				href="resources/policy-provisions-pdf/TravelCare_Provisions_Mar_2015.pdf"
				target="_blank">保單條款</a>。有關條款細則的詳細資料,請聯絡您的理財顧問或致電我們的24小時熱線3123
			3123與客戶服務主任聯絡。
		</p>

		</form:form>
	</div>
	<!--/.row-->
	</div>
	<!--/.container-->
</section>

<!--Get promotion code popup-->
<div class="modal fade bs-promo-modal-lg " tabindex="-1" role="dialog"  aria-hidden="true" style="display: none;" >
  <div class="modal-dialog modal-lg">
			<div class="modal-content plan-modal">
				<div class="login-form" id="sendmailofpromocode">
					<form>
					<div class="form-container">
						<h2>不要有一个促销代码？输入您的电子邮件地址，我们会送你一个</h2>
						<h4>电子邮件 </h4>
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
								<p>我同意提交我的電子郵件地址作為接收富衛的推廣編號之用，並在未來接收其他優惠資訊。</p>
							</div>
						</div>
					</div>
				</form>
				</div>
				
				
			</div>
		</div>
</div>
<!--/ Get promotion code popup--> 

<!--/end Main Content-->
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
		selected_price = parseInt(selected_price).toFixed(2);
		
		$('#amountdue').html(parseInt(totalDue).toFixed(2));
		
		
		/*   $('#selectedAmountDue').value=selected_price; */
		$('#subtotal').html(selected_price);
		$('#plansummary').html(selected_price);
		$('#seletedplanname').html(planName);
		$('#inputseletedplanname').val(planName);

		$('#' + id).addClass("plan-box4");

		$('#discountAmt').html(parseInt(discountAmt).toFixed(2));
		
		document.getElementById("selectedAmountDue").value = totalDue.trim();
		
		document.getElementById("selectedDiscountAmt").value = discountAmt
				.trim();
		document.getElementById("txtgrossPremiumAmt").value = selected_price
				.trim();
		
		if(promoData !== '')
			setValue(promoData);
		
	}

	function sendEmail() {
		if (get_promo_val()) {
			$.ajax({
				type : "POST",
				url : "sendEmail",
				data : $("#sendmailofpromocode form").serialize(),
				async : false,
				success : function(data) {
					alert(data);
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

	function BackMe() {
		window.history.back();
	}
</script>