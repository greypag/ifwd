<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
</head>
<script type="text/javascript">
	function applicationSubmit() {
		var paymentType= $('input:radio[name="saviePaymentBean.paymentType"]:checked').val();
		var url = '${pageContext.request.contextPath}'+'/'+'${language}'+'/'+'saving-insurance/';
		if(paymentType == 'true'){
			url += '${nextPageFlow}';
		}
		else{
			url += '${nextPageFlow2}';
		}
		$("#detailInfo").attr("action", url);
		$('#detailInfo').submit();
	}
</script>
<body>
<div align="center">
     <form id="detailInfo" method="post" action="">
	    <h2>Personal info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Name in English:</td>
		    			<td><input type="text" name="savieApplicantBean.firstName" id="firstName"></input></td>
		    			<td>Email address:</td>
		    			<td><input type="text" name="savieApplicantBean.email" id="email"></input></td>
		    		</tr>
		    		<tr>
		    			<td></td>
		    			<td><input type="text" name="savieApplicantBean.lastName" id="lastName"></input></td>
		    			<td>Residential tel no:</td>
		    			<td><input type="text" name="savieApplicantBean.residentialTelNo" id="residentialTelNo"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    			<td><input type="text" name="savieApplicantBean.chineseName" id="chineseName"></input></td>
		    			<td>Mobile no:</td>
		    			<td><input type="text" name="savieApplicantBean.mobileNo" id="mobileNo"></input></td>
		    		</tr>
		    		<tr>
		    			<td>HKID:</td>
		    			<td><input type="text" name="savieApplicantBean.hkId" id="hkId"></input></td>
		    			<td>Residential address:</td>
		    			<td><input type="text" name="savieApplicantBean.residentialAdress1" id="residentialAdress1"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td>
		    			<td><input type="radio" name="appGender" id="gender1" checked="checked" value="M"></input>Male
		    			    <input type="radio" name="appGender" id="gender2" value="F"></input>Female
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="savieApplicantBean.residentialAdress2" id="residentialAdress2"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Marital status:</td>
		    			<td>
		    			    <select name="maritalStatus" id="maritalStatus">
		    			        <option value="M">Married</option>
		    			        <option value="S">Unmarried</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="savieApplicantBean.residentialAdress3" id="residentialAdress3"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Date of birth:</td>
		    			<td><input type="text" name="birthday" id="birthday"></input></td>
		    			<td></td>
		    			<td>
		    			    <select name="savieApplicantBean.residentialDistrict" id="residentialDistrict">
		    			        <option value="">district</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Place of birth:</td>
		    			<td>
		    			    <select name="savieApplicantBean.placeOfBirth" id="placeOfBirth">
		    			        <option value="">-Please select-</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td>*No P.O Box address allowed</td>
		    		</tr>
		    		<tr>
		    			<td>Nationality:</td>
		    			<td>
		    			    <select name="savieApplicantBean.nationality" id="nationality">
		    			        <option value="">-Please select-</option>
		    			        <option value="hk">hk</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td><input type="checkbox" name="savieApplicantBean.addressIsSame" id="addressIsSame" value="Y"/>My conrrespondance address is same as my residential address</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT"/>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
	    <h2>Employment info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Employment status:</td>
		    			<td>
		    			    <select name="savieEmploymentBean.employmentStatus" id="employmentStatus">
		    			        <option value="">-Please select-</option>
		    			        <option value="Employed">Employed</option>
		    			        <option value="Unemployed">Unemployed</option>
		    			    </select>
		    			</td>
		    			<td>Nature of business:</td>
		    			<td>
		    			    <select name="savieEmploymentBean.natureOfBusiness" id="natureOfBusiness">
		    			        <option value="">-Please select-</option>
		    			        <option value="Entertainment">Entertainment</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>Occupation:</td>
		    			<td>
		    			    <select name="savieEmploymentBean.occupation" id="occupation">
		    			        <option value="">-Please select-</option>
		    			        <option value="Artist">Artist</option>
		    			    </select>
		    			</td>
		    			<td>Monthly personal income(HKD):</td>
		    			<td>
		    			    <select name="savieEmploymentBean.monthlyPersonalIncome" id="monthlyPersonalIncome">
		    			        <option value="">-Please select-</option>
		    			        <option value="55001">HK$55001 and above</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT"/>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
	    <h2>Beneficiary info</h2>
	    <p>You may add up to three(3) persons</p>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td><input type="radio" name="savieBeneficiaryBeans[0].ownEstate" value="true" id="ownEstate1"/>Own estate<input type="radio" name="savieBeneficiaryBeans[0].ownEstate" value="false" id="ownEstate2"/>Name others</td>
		    		</tr>
		    		<tr>
		    			<td>Name in English</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="savieBeneficiaryBeans[0].firstName" id="firstName"></input></td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="savieBeneficiaryBeans[0].lastName" id="lastName"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Name in Chinese:</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="savieBeneficiaryBeans[0].chineseName" id="chineseName"></input></td>
		    		</tr>
		    		<tr>
		    			<td>HKID/Passport No:</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="savieBeneficiaryBeans[0].hkId" id="hkId"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Gender:</td><!-- savieBeneficiaryBeans[0].gender -->
		    		</tr>
		    		<tr>
		    			<td><input type="radio" name="" id="gender1" value="M" />Male<input type="radio" name="savieBeneficiaryBeans[0].gender" id="gender2" value="F"/>Female</td>
		    		</tr>
		    		<tr>
		    			<td>Entitlement(%):</td>
		    		</tr>
		    		<tr>
		    			<td><input type="text" name="savieBeneficiaryBeans[0].entitlement" id="entitlement"></input></td>
		    		</tr>
		    	</table>
		    </div>
		</div>
		<h2>Payment</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td colspan="4"><input type="radio" name="saviePaymentBean.paymentType" value="true" checked="checked" id="paymentType1"/>Pay online(Direct debit authorisation)<input type="radio" name="saviePaymentBean.paymentType" value="false" id="paymentType2"/>Pay later(Pay at the storefront)</td>
		    		</tr>
		    		<tr>
		    			<td>Amount</td>
		    			<td>HK$ 100,000<input type="hidden" name="saviePaymentBean.amount" id="amount" value="100000"/></td>
		    			<td>Account no</td>
		    			<td><input type="text" name="saviePaymentBean.accountNo" id="accountNo"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Payment method</td>
		    			<td>Direct debit<input type="hidden" name="saviePaymentBean.paymentMethod" id="paymentMethod" value="Direct debit"/></td>
		    			<td>Bank account holder name</td>
		    			<td><input type="text" name="saviePaymentBean.bankAccountHolderName" id="bankAccountHolderName"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Bank name(Code)</td>
		    			<td><select name="saviePaymentBean.bankName" id="bankName">
		    			        <option value="">-Please select-</option>
		    			        <option value="1">1</option>
		    			        <option value="2">2</option>
		    			    </select>
		    			</td>
		    			<td>Branch name</td>
		    			<td><select name="saviePaymentBean.branchName" id="branchName">
		    			        <option value="">-Please select-</option>
		    			        <option value="1">1</option>
		    			        <option value="2">2</option>
		    			    </select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td  colspan="4"><input type="checkbox" name="saviePaymentBean.paymentConfirmAuthorize" id="paymentConfirmAuthorize" value="true"/>I,as Policy owner,confirm that ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.</td>
		    		</tr>
		    		<tr align="center">
		    			<td colspan="4">
		    			   <input type="button" value="NEXT" onclick="applicationSubmit();"/>
		    			</td>
		    		</tr>
		    	</table>
		    </div>
		</div>
	</form>
</div>
</body>
</html>