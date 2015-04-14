<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%@page import="com.ifwd.fwdhk.model.PurchaseHistory"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Account</title>
</head>

<!--Tooltip-->
<script src="js/jquery.min.js"></script>
<script>
	$(function() {
		$("[data-toggle='tooltip']").tooltip();
	});
</script>
<!--END-tooltip-->

<!-- Google
Tag Manager -->
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
</script>

<!--END -Google Code for SEO-->


<script>
	function updateUserAccount() {
		$.ajax({
			type : 'POST',
			url : 'updateUserAccount',
			data : $('#userAcccountForm input').serialize(),
			success : function(data) {
				/* success-message */
				if (data == 'success') {
					$('#success-message').show();
					$('#success-message').html(
							"User details succesfully updated");
				}
			},
			error : function(xhr, status, error) {
			}
		});
	}
</script>

<body>
<!--Main Content-->
<section>
  <div id="cn" class="container mob-pad">
    <div class="row">
      <form>
        <ol class="breadcrumb pad-none">
          <li><a href="#">主頁</a> </li>
          <li class="active"><i class="fa fa-caret-right"></i> 富衛會員帳戶 </li>
        </ol>
        <h2 class="page-title">富衛會員帳戶</h2>
        <br>
        <div class="wd2 bdr">
          <div class="col-lg-4 pad-none gry-bg"> 
            <!--mobile-->
            <div id="acc_drop" class="btn-group pad-left-none btn-account hidden-lg hidden-md"> <a aria-expanded="false" role="button" data-toggle="dropdown" class="btn dropdown-toggle btn-account " href="#"> <span class="pull-left account-drop" id="search_concept">Update user details</span><span class="btn-account-caret pull-right"></span> </a>
              <ul role="menu" class="dropdown-menu btn-account marg-t1 border-radius none-bd">
                <li><a href="#tab1" data-toggle="tab">會員資料</a></li>
                <li class=""><a href="#tab2" data-toggle="tab">購買紀錄</a></li>
                <li class=""><a href="#tab3" data-toggle="tab">推廣編號</a></li>
              </ul>
            </div>
            <!--Desktop-->
            <nav class="nav-sidebar hidden-sm hidden-xs">
              <ul class="nav tabs">
                <li class="active"><a href="#tab1" data-toggle="tab">會員資料
</a></li>
                <li class=""><a href="#tab2" data-toggle="tab">購買紀錄
</a></li>
                <li class=""><a href="#tab3" data-toggle="tab">推廣編號
</a></li>
              </ul>
            </nav>
          </div>
          <!-- tab content -->
          <div class="tab-content col-lg-8 pad-none">
            <div class="tab-pane text-style active padding3" id="tab1">
              <form:form modelAttribute="userDetails" name="userAcccountForm"
						id="userAcccountForm">
              <table class="table acc-form">
                <tbody>
                  <tr>
                    <td colspan="2" class="pad-none"><h2 class="black-bold pad-none">會員資料
</h2></td>
                  </tr>
                  <tr>
                    <td  class="col-sm-4 col-md-4 col-xs-4 col-lg-4 pad-none "><label class="control-label h4-4-b">個人全名
</label></td>
                    <td class="pad-none"><input type="text" class="form-control btm-pad-10" value="${userDetails.getFullName() }" id="fullname" placeholder="個人全名
" readonly></td>
                  </tr>
                  <tr>
                    <td  class="pad-none"><label class="control-label h4-4-b">手機號碼
</label></td>
                    <td class="pad-none"><input type="text" class="form-control btm-pad-10" value="${userDetails.getMobileNo() }" id="mobile-n" placeholder="手機號碼
"  readonly=""></td>
                  </tr>
                  <tr>
                    <td  class="pad-none"><label class="control-label h4-4-b">電郵地址
</label></td>
                    <td class="pad-none"><input  type="email" value="${userDetails.getEmailAddress() }" class="form-control btm-pad-10" 	value="${userDetails.getEmailAddress() }" id="email" placeholder="電郵地址
"  readonly=""></td>
                  </tr>
                  <tr>
                    <td  class="pad-none"><label class="control-label h4-4-b">用戶名稱
</label>
            


                      </td>
                    <td class="pad-none">
                    <input type="text" class="form-control btm-pad-10" value="${userDetails.getUserName() }" id="username" placeholder="用戶名稱"  readonly="">
                    </td>
                  </tr>
                  <!-- <tr>
                    <td  class="pad-none"><label class="control-label h4-4-b">密碼
</label>
                      <a href="#" class="pull-right tool-tip hidden-lg hidden-md" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="../images/ic.png" alt=""> </a></td>
                    <td class="pad-none"><input type="password" class="form-control" id="password" placeholder="密碼
">
                      <a href="#" class="pull-right tool-tip hidden-sm hidden-xs" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom Aaliquid explicari his id, cu mea dolorem epicurei tractatos. Tooltip on bottom Aaliquid explicari his id "> <img src="../images/ic.png" alt=""> </a></td>
                  </tr>
                  <tr>
                    <td  class="pad-none"><label class="control-label h4-4-b">確認密碼
</label></td>
                    <td class="pad-none"><input type="password" class="form-control" id="confirm-password" placeholder="確認密碼
"></td>
                  </tr> -->
                </tbody>
              </table>
            <!--   <h4 class="h4-2 padding5">個人聲明</h4>
              <br>
              <div class="declaration-content1">
                <div class="checkbox">
                  <input id="checkbox2" type="checkbox">
                  <label for="checkbox2" class="h4-3"> I have read and understood the above <a href="#" class="sub-link">Terms and Conditions</a> and "Personal Information Collection Statement" and agree to be bound by the same. </label>
                </div>
                <div class="checkbox">
                  <input id="checkbox1" type="checkbox">
                  <label for="checkbox1" class="h4-3"> If you do NOT wish FWD Life Insurance Company (Bermuda) Limited to use Your Personal Data in direct marketing or provide Your Personal Data to other persons or companies for their use in direct marketing. Please tick the appropriate box(es) below to excercise your opt-out right.
                    Please do not send direct marketing information to me. </label>
                </div>
              </div>
              <a href="account-cn.html" class="bdr-curve btn btn-primary btn-lg act-btn" onclick="return validateJoinUsForm()"> 更新及儲存
</a>  -->

<br>
              <br>
              </form:form>
            </div>
            <div class="tab-pane text-style pad-none" id="tab2">
            <%
							ArrayList al = (ArrayList) request.getAttribute("al");
							Iterator itr = al.iterator();
							while (itr.hasNext()) {
								PurchaseHistory purchaseHistory = (PurchaseHistory) itr.next();
						%>
              <table class="table purchase-history marg-left">
                <tbody>
                  <tr>
                    <td class="pad-none" ><h2 class="black-bold ">購買紀錄
</h2></td>
                  </tr>
                  <tr>
                    <td class="pad-none"><span class="h2-claim">旅遊保險</span></td>
                    <!--<td class="pad-none sub-link"><a href="#">View Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5">參考號碼 :<%
										out.print(purchaseHistory.getPolicyNumber());
									%> </td>
                   <!-- <td class="pad-none sub-link"><a href="#"> Download Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5"> 購買日期 :<%
										out.print(purchaseHistory.getSubmissionDate());
									%> <br></td>
                   <!-- <td class="pad-none sub-link"><a href="#"> Claim Procedure</a></td>-->
                  </tr>
                </tbody>
              </table>
              <%}%>
              
              <div class="bot-bdr-o"></div>
              <table class="table purchase-history marg-left">
                <tbody>
                  <tr>
                    <td class="pad-none h2-claim">家居保險 </td>
                    <!--<td class="pad-none sub-link"><a href="#">View Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5">參考號碼 :${userDetails.getReferralCode()}</td>
                    <!--<td class="pad-none sub-link"><a href="#"> Download Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5"> 購買日期 : <br></td>
                    <!--<td class="pad-none sub-link"><a href="#"> Claim Procedure</a></td>-->
                  </tr>
                </tbody>
              </table>
              <div class="bot-bdr-o"></div>
              <table class="table purchase-history marg-left">
                <tbody class="">
                  <tr>
                    <td class="pad-none h2-claim">旅遊保險
 </td>
                    <!--<td class="pad-none sub-link"><a href="#">View Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5">參考號碼 : 74AA98526 </td>
                   <!-- <td class="pad-none sub-link"><a href="#"> Download Policy</a></td>-->
                  </tr>
                  <tr>
                    <td class="pad-none h4-5"> 購買日期: <br></td>
                   <!-- <td class="pad-none sub-link"><a href="#"> Claim Procedure</a></td>-->
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="tab-pane padding3" id="tab3" >
              <table class="table purchase-history col-lg-12 col-md-12 col-xs-12 col-sm-12">
                <tbody>
                  <tr>
                    <td class="pad-none" ><h2 class="black-bold">分享</h2></td>
                  </tr>
                  <tr>
                    <td class="pad-none">
                    <p>您的專屬推廣編號:<span class="h2-1"><%=session.getAttribute("myReferralCode")%></span><br>
                       與朋友分享，一同取得更多富衛合作夥伴之優惠!<span class="orange-star">*</span> 
                    </p>
                         <div class="clearfix"></div>
                         <p  class="text-center"> <img src="resources/images/agoda.png" alt=""/> </p>
                     
                      </td>
                  </tr>
                  <tr>
                    <td class="pad-none"><h3 class="h4-3-b">立即分享您的專屬推廣編號，尊享額外優惠!</h3></td>
                  </tr>
                 <!-- <tr>
                    <td class=" gry-bg1 text-center"><a class="padding6 h4-5-b " href="">http://uat-ecom.i.fwd.com.hk/travel?promo=<%=session.getAttribute("myReferralCode")%></a></td>
                  </tr>-->
                  <tr>
                    <td class="pad-none">

                    <!--<a href="#">
                      <div class="copy-link pull-left">複製</div>
                      </a>-->
                       <a href="#">
                      <div class="fb1 pull-left"><i class="fa fa-facebook fa-2x"></i></div>
                      </a> <a href="#">
                      <div class="twi1 pull-left"><i class="fa fa-twitter fa-2x"></i> </div>
                      </a> <a href="#">
                      <div class="gplus1 pull-left"><i class="fa fa-google-plus fa-2x"></i> </div>
                      </a>
                      <!--<div class="col-lg-6 col-md-6 col-xs-6 col-sm-6 text-center line-hei ">
                        <h4> <span class="sub-link"> Other sharing options </span></h4>
                      </div>-->
                      </td>
                  </tr>
                </tbody>
              </table>
              <br>
              
              <div class="clearfix"></div>
              <div class="declaration-content1"> <b><span class="orange-star">*</span>
             推薦計劃</b>
              <br>
              <p>
                推薦人獎賞：
              </p>
              - Agoda 額外95折優惠訂購酒店<br>
              - 7折購買富衛旅遊保險<br><br>
              <p>
                受薦人獎賞：<br>
              - 75折購買富衛旅遊保險<br>

              </p>

               <p>
             
請参閱推薦計劃之 <a href="../policy-provisions-pdf/iFWD_HK_Referral_Campaign_T_Cs.pdf" class="sub-link" target="_blank">條款及細則</a>。

              </p>

              </div>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
        
        <!--/.row-->
      </form>
    </div>
  </div>
  <!--/.container--> 
</section>
<script type="text/javascript">
	function copy(){
		
		//create client
		var clip = new ZeroClipboard.Client();
		//event
		clip.addEventListener('mousedown', function() {
			clip.setText(document.getElementById('box-content').value);
		});
		clip.addEventListener('complete', function(client, text) {
			//alert('copied: ' + text);
		});
		//glue it to the button
		clip.glue('copy');
	}
		
	</script>
</body>