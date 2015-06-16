<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.ifwd.fwdhk.util.Constants"%>

<fmt:setLocale value="<%=session.getAttribute(\"uiLocale\")%>" />
<fmt:setBundle basename="messages" var="msg" />

<%
  /* Show Different Referral Benefits for Visitor & Member */
  String currUser = session.getAttribute("username").toString().trim();
  Boolean isMember = !(currUser == null || currUser.equals(Constants.DEFAULT_USERNAME));
  String userType = (isMember)?"member":"visitor";

  String key_promocodeLabel = "travel.confirmation." + userType + ".promocodeLabel";
  String key_referralCodeDesc = "travel.confirmation." + userType + ".referralCodeDesc";

  String key_header1 = "travel.referral.benefits." + userType + ".table.header1";
  String key_header2 = "travel.referral.benefits." + userType + ".table.header2";
  String key_header3 = "travel.referral.benefits." + userType + ".table.header3";
  String key_header4 = "travel.referral.benefits." + userType + ".table.header4";

  String key_row1col1 = "travel.referral.benefits." + userType + ".table.row1.col1";
  String key_row1col2 = "travel.referral.benefits." + userType + ".table.row1.col2";
  String key_row1col3 = "travel.referral.benefits." + userType + ".table.row1.col3";
  String key_row1col4 = "travel.referral.benefits." + userType + ".table.row1.col4";

  String key_row2col1 = "travel.referral.benefits." + userType + ".table.row2.col1";
  String key_row2col2 = "travel.referral.benefits." + userType + ".table.row2.col2";
  String key_row2col3 = "travel.referral.benefits." + userType + ".table.row2.col3";
  String key_row2col4 = "travel.referral.benefits." + userType + ".table.row2.col4";

  String key_row3col1 = "travel.referral.benefits." + userType + ".table.row3.col1";
  String key_row3col2 = "travel.referral.benefits." + userType + ".table.row3.col2";
  String key_row3col3 = "travel.referral.benefits." + userType + ".table.row3.col3";
  String key_row3col4 = "travel.referral.benefits." + userType + ".table.row3.col4";

  String key_row4col1 = "travel.referral.benefits." + userType + ".table.row4.col1";
  String key_row4col2 = "travel.referral.benefits." + userType + ".table.row4.col2";
  String key_row4col3 = "travel.referral.benefits." + userType + ".table.row4.col3";
  String key_row4col4 = "travel.referral.benefits." + userType + ".table.row4.col4";

  String key_disclaimer1 = "travel.referral.benefits." + userType + ".disclaimer1";
  String key_disclaimer2Part1 = "travel.referral.benefits." + userType + ".disclaimer2.part1";
  String key_disclaimer2Part2 = "travel.referral.benefits." + userType + ".disclaimer2.part2";
  String key_disclaimer2Part3 = "travel.referral.benefits." + userType + ".disclaimer2.part3";
%>

<script>
perventRedirect=true;

function getPromoCode(){
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/getPromoCode',
		async : false,
		success : function(data) {
			$("#promoCode").val(data);
		}
	});
}

</script>
<!--/#main-Content-->
<section>
   <div id="cn" class="container">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item1" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item2" bundle="${msg}" /> </a > <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item3" bundle="${msg}" /></a> <i class="fa fa-caret-right"></i></li>
          <li><a href="#"><fmt:message key="travel.breadcrumb1.item4" bundle="${msg}" /> </a> <i class="fa fa-caret-right"></i></li>
           <li><a href="#"><fmt:message key="travel.breadcrumb1.item5" bundle="${msg}" /> </a> </li>
          <li class="active "><i class="fa fa-caret-right"></i><fmt:message key="travel.breadcrumb1.item6" bundle="${msg}" /></li>
        </ol>
        <div class="container ">
          <div class="col-md-12 shop-tracking-status">
            <div class="center wow fadeInDown animated" style="visibility: visible;">
              <h2><fmt:message key="travel.confirmation.jumbo" bundle="${msg}" /></h2>
            </div>
            <br>
            <div id="tr-wizard" class="shop-tracking-status">
        <div class="order-status has-four">
              <div class="order-status-timeline-new">
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
            <div class="order-status-timeline-completion dots-active"></div>
          </div>
        <div class="image-order-status image-order-status-new active img-circle first"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item1" bundle="${msg}" /></span>
          <div class="icon">1</div>
        </div>
        
        <div class="image-order-status image-order-status-intransit  img-circle second"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item2" bundle="${msg}" /></span>
          <div class="icon">2</div>
        </div>
        <div class="image-order-status image-order-status-delivered  img-circle third"> <span class="status color3"><fmt:message key="travel.breadcrumb2.item3" bundle="${msg}" /></span>
          <div class="icon">3</div>
        </div>
        <div class="image-order-status image-order-status-completed  img-circle act fourth"> <span class="status color3 lst-status"><fmt:message key="travel.breadcrumb2.item4" bundle="${msg}" /></span>
          <div class="icon">4</div>
        </div>
      </div>
</div>
          </div>
        </div>

        
      <c:if test="${not empty errormsg}"><br><div id="confirm-error-msg" class="alert alert-danger hide"
                        role="alert">${errormsg}</div><br></c:if>
        
        <div class="container pad-none bdr" style="margin-top:0px;">
          <div class="col-sm-12 pad-none" >
            <div style="width:80%;margin-left:10%">
	            <h3 class="bmg-confirmation-h3">
	              <fmt:message key="travel.confirmation.msg.part1" bundle="${msg}" />
	              <fmt:message key="travel.confirmation.msg.part2" bundle="${msg}" />
	              <fmt:message key="travel.confirmation.msg.part3" bundle="${msg}" />
	              <fmt:message key="travel.confirmation.msg.part4" bundle="${msg}" />
	              <fmt:message key="travel.confirmation.msg.part5" bundle="${msg}" />
	              <strong>${emailAddress}</strong>
	              <fmt:message key="travel.confirmation.msg.part6" bundle="${msg}" />
	            </h3>
	            
	            <h4 class="bmg-confirmation-h4"><strong><fmt:message key="travel.confirmation.policyNo" bundle="${msg}" /></strong><span> ${policyNo}</span></h4>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none margin-bottom-40">
                <div style="width:80%;margin-left:10%">
              <h5 class="bmg-confirmation-h5">
                  <strong><fmt:message key="<%=key_promocodeLabel%>" bundle="${msg}" /></strong><span><%=session.getAttribute("myTravelReferralCode")%></span>
              </h5>
				
				<% 
					String username = (String) session.getAttribute("username");
					if (username != null && !(username.equals("*DIRECTGI"))) {
				%>
					<div class="h4-3-b margin-bottom-10" style="color: #f6871e;">
						<input type="text" id="promoCode" value="" style="width: ">
                		<input type="button" value="promoCode" onclick="getPromoCode()">
              		</div>
				<% } %>
				
              <div class="h4-3-b margin-bottom-10" style="color: #f6871e;">
                <fmt:message key="<%=key_referralCodeDesc%>" bundle="${msg}" />
                <!-- <span class="orange-star">*</span> -->
              </div>

              <!--Referral Code Table -->
                  <% if (isMember) { %>
                      <div class="hidden-xs hidden-sm">
                          <table class="table table-bordred table-type-1 margin-bottom-10" style="width:100% !important;">
                              <tbody>
                                  <tr>
                                      <td><strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong></td>
                                  </tr>
                                  <tr>
                                      <td rowspan="2">
                                        <strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong>
                                      </td>
                                      <td><strong><fmt:message key="<%=key_row1col2%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row1col3%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row1col4%>" bundle="${msg}" /></strong></td>
                                  </tr>
                                  <tr>
                                      <td><strong><fmt:message key="<%=key_row2col2%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row2col3%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row2col4%>" bundle="${msg}" /></strong></td>
                                  </tr>
                                  <tr>
                                      <td rowspan="2">
                                        <strong><fmt:message key="<%=key_row3col1%>" bundle="${msg}" /></strong>
                                      </td>
                                      <td><strong><fmt:message key="<%=key_row3col2%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row3col3%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row3col4%>" bundle="${msg}" /></strong></td>
                                  </tr>
                                  <tr>
                                      <td><strong style="color: #f6871e;"><fmt:message key="<%=key_row4col2%>" bundle="${msg}" /></strong><a href="javascript:;" onclick="" class="btn-box-2 color4 login-btn" style="padding:6px;font-size:14px;margin-left:10px;"><fmt:message key="home.confirmation.agoda.get" bundle="${msg}" /></a></td>
                                      <td><strong style="color: #f6871e;"><fmt:message key="<%=key_row4col3%>" bundle="${msg}" /></strong></td>
                                      <td><strong><fmt:message key="<%=key_row4col4%>" bundle="${msg}" /></strong></td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                      
                      <div class="hidden-md hidden-lg margin-bottom-10">
                         <div style="margin-top:15px;margin-bottom:15px;">
                              <h4 style="color: #f68a1d"><strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong></h4>
                              <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row1col2%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row1col3%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row1col4%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row2col2%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row2col3%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row2col4%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                          </div>
                          
                          <div style="margin-top:15px;margin-bottom:15px;">
                              <h4 style="color: #f68a1d"><strong><fmt:message key="<%=key_row3col1%>" bundle="${msg}" /></strong></h4>
                              <div style="border: 1px solid #f5f5f5;width: 100%;"></div>
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row3col2%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row3col3%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row3col4%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div style="border: 1px solid #f5f5f5;width: 100%;"></div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12" style="color: #f6871e;">
                                      <fmt:message key="<%=key_row4col2%>" bundle="${msg}" /><a href="javascript:;" onclick="" class="btn-box-2 color4 login-btn" style="padding:6px;font-size:14px;margin-left:10px;"><fmt:message key="home.confirmation.agoda.get" bundle="${msg}" /></a>
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12" style="color: #f6871e;">
                                      <fmt:message key="<%=key_row4col3%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              
                              <div class="confirmation-table-margin">
                                  <div class="col-sm-12 col-xs-12">
                                      <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                                  </div>
                                  <div class="col-sm-12 col-xs-12">
                                      <fmt:message key="<%=key_row4col4%>" bundle="${msg}" />
                                  </div>
                                  <div class="clearfix"></div>
                              </div>
                              <div style="border: 1px solid #f5f5f5;width: 100%;"></div>
                          </div>
                      </div>
                      <div class="disclaimer">
                        <p><fmt:message key="<%=key_disclaimer1%>" bundle="${msg}" /></p>
                        <p><fmt:message key="<%=key_disclaimer2Part1%>" bundle="${msg}" /><a href="<%=request.getContextPath()%>/<fmt:message key="referral.tnc.link" bundle="${msg}" />" class="sub-link"><fmt:message key="<%=key_disclaimer2Part2%>" bundle="${msg}" /></a><fmt:message key="<%=key_disclaimer2Part3%>" bundle="${msg}" /></p>
                      </div>
                <% } else { %>
                    <div class="hidden-xs hidden-sm">
                        <table class="table table-bordred table-type-1 margin-bottom-10" style="width:100% !important;">
                            <tbody>
                                <tr>
                                    <td><strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong></td>
                                </tr>
                                <tr>
                                    <td><strong><fmt:message key="<%=key_row1col1%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_row1col2%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_row1col3%>" bundle="${msg}" /></strong></td>
                                    <td><strong><fmt:message key="<%=key_row1col4%>" bundle="${msg}" /></strong></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="hidden-md hidden-lg margin-bottom-10">
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong><fmt:message key="<%=key_header1%>" bundle="${msg}" /></strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fmt:message key="<%=key_row1col1%>" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong><fmt:message key="<%=key_header2%>" bundle="${msg}" /></strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fmt:message key="<%=key_row1col2%>" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong><fmt:message key="<%=key_header3%>" bundle="${msg}" /></strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fmt:message key="<%=key_row1col3%>" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                        
                        <div class="confirmation-table-margin">
                            <div class="col-sm-12 col-xs-12">
                                <strong><fmt:message key="<%=key_header4%>" bundle="${msg}" /></strong>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fmt:message key="<%=key_row1col4%>" bundle="${msg}" />
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div style="border: 1px solid #f68a1d;width: 100%;"></div>
                    </div>
                <% } %>         
              <!-- END Referral Code Table -->
                </div>
              </div>
            
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pad-none gray-bg1" style="padding-bottom:10px;">
                <div style="width:80%;margin-left:10%; margin-top:20px; margin-bottom:20px;">
                <div><fmt:message key="travel.confirmation.partnerDesc" bundle="${msg}" /></div>
                <div class="hidden-xs hidden-sm">
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3a.png" alt="" class=" ">
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3b.png" alt="" class=" ">
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3c.png" alt="" class=" ">
                </div>
                <div class="hidden-lg hidden-md" style="text-align:center;">
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3a.png" alt="" class=" "><br/>
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3b.png" alt="" class=" "><br/>
                    <img src="<%=request.getContextPath()%>/resources/images/fwd_partner_3c.png" alt="" class=" ">
                </div>
                <div class="clearfix"></div>
                <div class="h4-2"><fmt:message key="travel.confirmation.sharenow" bundle="${msg}" /></div>
                <div class="col-md-7 col-sm-12 col-xs-12 pad-none">
                    <div class=" wht-bg1 text-center" id="toBeCopied" contenteditable="true"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance?promo=<%=session.getAttribute("myTravelReferralCode")%></div>
                    <div id="copyTipBox" class="boxMain boxSub" style="display: none;"> <span class="boxMessage">Press CTRL-C to copy</span> <span class="boxDownArrow"></span> </div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12 pad-none"> 
                    <!-- <div class="copy-link pull-left" id="d_clip_button" title="" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">
                        <fmt:message key="travel.referral.copy" bundle="${msg}" />
                    </div> -->
                    
                    <div class="copy-link pull-left" onclick="autoSelect('toBeCopied');">
                        <fmt:message key="travel.referral.copy" bundle="${msg}" />
                    </div>

                    <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance/sharing/?promo=<%=session.getAttribute("myTravelReferralCode")%>" data-title="iFWD"></div>
                </div>
                <div class="clearfix"></div>
                </div>
              </div>
              
              
              
              
              <!-- 
              
              
              <div class="clearfix"></div><br>

              <div class="h4-2"><fmt:message key="travel.confirmation.sharenow" bundle="${msg}" /></div>
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-7 col-sm-12 col-xs-12 pad-none">
                    <div class=" wht-bg1 text-center" id="toBeCopied"><%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance?promo=<%=session.getAttribute("myTravelReferralCode")%>
                    </div>
                </div>
                <div class="col-md-5 col-sm-12 col-xs-12 pad-none"> 
                    <div class="copy-link pull-left" id="d_clip_button" title="" data-clipboard-target="toBeCopied" data-clipboard-text="Default clipboard text from attribute">
                        <fmt:message key="travel.referral.copy" bundle="${msg}" />
                    </div>

                    <div class="addthis_sharing_toolbox" data-url="<%=request.getScheme() + "://" + request.getServerName() +  request.getContextPath()%>/${language}/travel-insurance/sharing/?promo=<%=session.getAttribute("myTravelReferralCode")%>" data-title="iFWD"></div>
                </div>
              </div> 
              
              <div class="clearfix"></div>
              <br>
              <div class="col-lg-12 col-md-12 travel-b">
                <!--
                <div class="declaration-content1"> <b><fmt:message key="travel.referral.disclaimer" bundle="${msg}" /></b>
                  <p>
                      <fmt:message key="travel.referral.disclaimer.section1.header" bundle="${msg}" /><br/>
                      <fmt:message key="travel.referral.disclaimer.section1.desc1" bundle="${msg}" /><br>
                      <fmt:message key="travel.referral.disclaimer.section1.desc2" bundle="${msg}" /><br>
                      <fmt:message key="travel.referral.disclaimer.section2.header" bundle="${msg}" /><br>
                      <fmt:message key="travel.referral.disclaimer.section2.desc1" bundle="${msg}" /><br>

            			<fmt:message key="travel.referral.disclaimer.section3.desc.part1" bundle="${msg}" />
            			<a href="<%=request.getContextPath()%>/<fmt:message key="referral.tnc.link" bundle="${msg}" />" class="sub-link">
            				<fmt:message key="travel.referral.disclaimer.section3.desc.part2" bundle="${msg}" />
            			</a>
            			<fmt:message key="travel.referral.disclaimer.section3.desc.part3" bundle="${msg}" />
                  </p></div>
                -/->
              </div>
              
               -->
              <div class="clearfix"></div>
            </div>
          </div>
          
          <div class="container pad-none hidden-xs hidden-sm travel-homecare" style="margin-top:30px;">
            <div class="row-fluid">
              <div class="center " style="visibility: visible;">
                <div class="col-md-3 col-lg-3 text-left pad-none">
                  <img src="<%=request.getContextPath()%>/resources/images/home7.png" alt=""> </div>
                <div class="col-md-8 col-lg-8 text-left col-xs-offset-travel">
                  <div>
                    <h4 class="center-h2"><fmt:message key="travel.confirmation.heading" bundle="${msg}" /></h4>                  
                    <div class="h2-32" style="margin-top:30px;">
                      <strong><fmt:message key="travel.confirmation.subheading" bundle="${msg}" /></strong>
                    </div>
                    <br>
                    <p class="h4-5"><fmt:message key="travel.confirmation.subheading.desc" bundle="${msg}" /></p><br>
                    <a href="<%=request.getContextPath()%>/${language}/home-insurance" class="border-radius btn btn-primary  get-btn" >
                    <fmt:message key="travel.confirmation.getQuote" bundle="${msg}" /></a>
                  </div>
                </div>
              </div>  
            </div>
          </div>

        </div>
      </form>
    </div>
    <!--/.row--> 
  </div>
  <!--/.container-->
</section>

<!--/end- Main Content-->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5506a5af18925186" async="async"></script>

<script type=text/javascript>
   var hostProtocol = (("https:" == document.location.protocol) ? "https" : "http");
   document.write('<scr'+'ipt src="', hostProtocol+
   '://5198.xg4ken.com/media/getpx.php?cid=67bda50a-b010-4425-9f2b-165bf9a1d04a','" type="text/JavaScript"><\/scr'+'ipt>');
</script>
<script type=text/javascript>
   var params = new Array();
   params[0]='id=67bda50a-b010-4425-9f2b-165bf9a1d04a';
   params[1]='type=Registration';
   params[2]='val=0.0';
   params[3]='orderId=';
   params[4]='promoCode=';
   params[5]='valueCurrency=HKD';
   params[6]='GCID='; //For Live Tracking only
   params[7]='kw='; //For Live Tracking only
   params[8]='product='; //For Live Tracking only
   k_trackevent(params,'5198');
</script>

<noscript>
   <img src="https://5198.xg4ken.com/media/redir.php?track=1&token=67bda50a-b010-4425-9f2b-165bf9a1d04a&type=Registration&val=0.0&orderId=<%=request.getSession().getAttribute("policyNo")%>&promoCode=&valueCurrency=HKD&GCID=&kw=&product=" width="1" height="1">
</noscript>
<script>
$(document).ready(function() {
  ga('create', 'UA-60032236-1', 'auto');
  ga('require', 'ecommerce');
  ga('ecommerce:addTransaction', {
    'id': '${transNo}', // Transaction ID. Required.
    'revenue': '${dueAmount}', // Grand Total.
    'affiliation': 'Travel', // Insurance type, e.g. Life
     'currency': 'HKD'
    });

  ga('ecommerce:send');
});
</script>