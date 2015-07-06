<%@page import="com.ifwd.fwdhk.model.DistrictBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
</head>
<body>
<div align="center">
<form id="detailInfo" method="post" action="${pageContext.request.contextPath}/${language}/savie-order-summary">
	    <h2>Personal info</h2>
		<div style="margin:20px 0;"></div>
		<div>
			<div style="padding:10px 60px 20px 60px">
		    	<table>
		    		<tr>
		    			<td>Name in English:</td>
		    			<td><input type="text" name="savieApplicantBean.firstName" id="firstName"></input></td>
		    			<td>Email address:</td>
		    			<td><input type="text" name="savieApplicantBean.emailAddress" id="emailAddress"></input></td>
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
		    			<td><input type="radio" name="savieApplicantBean.gender" id="gender1" value="M"></input>Male
		    			    <input type="radio" name="savieApplicantBean.gender" id="gender2" value="F"></input>Female
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="savieApplicantBean.residentialAdress2" id="residentialAdress2"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Marital status:</td>
		    			<td>
		    			    <select name="savieApplicantBean.maritalStatus" id="maritalStatus">
		    			        <option value="">-Please select-</option>
		    			        <option value="Married">Married</option>
		    			        <option value="Unmarried">Unmarried</option>
		    			    </select>
		    			</td>
		    			<td></td>
		    			<td><input type="text" name="savieApplicantBean.residentialAdress3" id="residentialAdress3"></input></td>
		    		</tr>
		    		<tr>
		    			<td>Date of birth:</td>
		    			<td>
		    			    <div class="input-group date" id="birthdayDiv">
								<span class="input-group-addon in border-radius"><span><img src="<%=request.getContextPath()%>/resources/images/calendar.png" alt=""></span></span>
								<input name="birthday" type="text" class="datepicker form-control border-radius" id="birthday" readonly>
							</div>
							<span id="birthdayMsg" class="text-red"></span>
		    			</td>
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
		    			<td><input type="checkbox" name="" id="addressIsSame" value="Y"/>My conrrespondance address is same as my residential address</td>
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
				     <td>
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
				    			<td>Gender:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="radio" name="savieBeneficiaryBeans[0].gender" id="gender1" value="M" />Male<input type="radio" name="savieBeneficiaryBeans[0].gender" id="gender2" value="F"/>Female</td>
				    		</tr>
				    		<tr>
				    			<td>Entitlement(%):</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[0].entitlement" id="entitlement"></input></td>
				    		</tr>
				    	</table>
				     </td>
				     <td>
					     <table>
				    		<tr>
				    			<td><input type="radio" name="savieBeneficiaryBeans[1].ownEstate" value="true" id="ownEstate1"/>Own estate<input type="radio" name="savieBeneficiaryBeans[1].ownEstate" value="false" id="ownEstate2"/>Name others</td>
				    		</tr>
				    		<tr>
				    			<td>Name in English</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[1].firstName" id="firstName"></input></td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[1].lastName" id="lastName"></input></td>
				    		</tr>
				    		<tr>
				    			<td>Name in Chinese:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[1].chineseName" id="chineseName"></input></td>
				    		</tr>
				    		<tr>
				    			<td>HKID/Passport No:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[1].hkId" id="hkId"></input></td>
				    		</tr>
				    		<tr>
				    			<td>Gender:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="radio" name="savieBeneficiaryBeans[1].gender" id="gender1" value="M" />Male<input type="radio" name="savieBeneficiaryBeans[1].gender" id="gender2" value="F"/>Female</td>
				    		</tr>
				    		<tr>
				    			<td>Entitlement(%):</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[1].entitlement" id="entitlement"></input></td>
				    		</tr>
				    	</table>
				     </td>
				     <td>
					     <table>
				    		<tr>
				    			<td><input type="radio" name="savieBeneficiaryBeans[2].ownEstate" value="true" id="ownEstate1"/>Own estate<input type="radio" name="savieBeneficiaryBeans[2].ownEstate" value="false" id="ownEstate2"/>Name others</td>
				    		</tr>
				    		<tr>
				    			<td>Name in English</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[2].firstName" id="firstName"></input></td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[2].lastName" id="lastName"></input></td>
				    		</tr>
				    		<tr>
				    			<td>Name in Chinese:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[2].chineseName" id="chineseName"></input></td>
				    		</tr>
				    		<tr>
				    			<td>HKID/Passport No:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[2].hkId" id="hkId"></input></td>
				    		</tr>
				    		<tr>
				    			<td>Gender:</td>
				    		</tr>
				    		<tr>
				    			<td><input type="radio" name="savieBeneficiaryBeans[2].gender" id="gender1" value="M" />Male<input type="radio" name="savieBeneficiaryBeans[2].gender" id="gender2" value="F"/>Female</td>
				    		</tr>
				    		<tr>
				    			<td>Entitlement(%):</td>
				    		</tr>
				    		<tr>
				    			<td><input type="text" name="savieBeneficiaryBeans[2].entitlement" id="entitlement"></input></td>
				    		</tr>
				    	</table>
				     </td>
			     </tr>
			     <tr align="center">
	    			<td colspan="4">
	    			   <input type="submit" value="NEXT"/>
	    			</td>
	    		</tr>
			</table>
		    </div>
		</div>
</form>
</div>
<script src="<%=request.getContextPath()%>/resources/js/savie/savie.js"></script>
</body>
</html>